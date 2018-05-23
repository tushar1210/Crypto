//
//  ViewController.swift
//  Crypto
//
//  Created by Tushar Singh on 22/05/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {

   /////////////////////////outlets///////////////////////////
    
    @IBOutlet weak var value: UILabel!
    let url : String = "https://api.cryptonator.com/api/ticker/"
    
  
    @IBAction func coinButton(_ sender: AnyObject) {
        let check:Int = sender.tag
                print(url+typeArray[check-1])
        
                getValue(finalUrl:url+typeArray[check-1])
    }
    
//    @IBAction func coinButton(_ sender: AnyObject) {
//        let check:Int = sender.tag
//        print(url+typeArray[check-1])
//
//        getValue(finalUrl:url+typeArray[check-1])
//    }
    
  
    
    
    
    let typeArray = ["btc-usd","ltc-usd","etc-usd","xrp-usd"]
////////////////////////////////////////////?????///////////////////////////////
    func getValue(finalUrl:String){
        
        Alamofire.request(finalUrl, method: .get).responseJSON{
                response in
                if response.result.isSuccess{
                    print("Crypto Data Retrieved")
                    let json : JSON = JSON(response.result.value!)
                    self.JSONParsing(json:json)
                }
                else{
                    print("Error : \(String(describing: response.result.error))")
                    self.value.text = "Connection Issues"
                }
            }
        
        
    }
    
    func JSONParsing(json:JSON){
        let results = json["ticker"]["price"].floatValue
                    print(results)
                    print("Success")
                        value.text = "$  "+String(results)
        
//                else{
//
//                        value.text="Data Unavailable"
//                }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        value.text = "Choose Coin"
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
