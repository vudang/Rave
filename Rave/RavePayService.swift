//
//  RavePayService.swift
//  RaveMobile
//
//  Created by Olusegun Solaja on 19/07/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

import UIKit
import Alamofire

class RavePayService: NSObject {
    
    
    class func queryTransaction(_ bodyParam:Dictionary<String,String>,resultCallback:@escaping (_ result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        manager.request(URLHelper.getURL("QUERY_TRANSACTION"),method: .post, parameters: bodyParam).responseJSON {
            (res) -> Void in
            
            switch res.result {
            case .success(let data):
                let result = data as? Dictionary<String,AnyObject>
                resultCallback(result)
            case .failure(let e):
                errorCallback(e.localizedDescription)
            }
            
//            if(res.result){
//                let result = res.result as? Dictionary<String,AnyObject>
//                resultCallback(result)
//            }else{
//                errorCallback(res.error!.localizedDescription)
//            }
        }
        
        
    }
    class func queryMpesaTransaction(_ bodyParam:Dictionary<String,String>,resultCallback:@escaping (_ result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        manager.request(URLHelper.getURL("QUERY_TRANSACTION_V2"),method: .post, parameters: bodyParam).responseJSON {
            (res) -> Void in
            
            switch res.result {
            case .success(let data):
                let result = data as? Dictionary<String,AnyObject>
                resultCallback(result)
            case .failure(let e):
                errorCallback(e.localizedDescription)
            }
            
//            if(res.result.isSuccess){
//                let result = res.result.value as? Dictionary<String,AnyObject>
//
//                resultCallback(result)
//
//
//            }else{
//                errorCallback( res.result.error!.localizedDescription)
//            }
        }
        
        
    }
    class func getFee(_ bodyParam:Dictionary<String,String>,resultCallback:@escaping (_ result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        manager.request(URLHelper.getURL("FEE"),method: .post, parameters: bodyParam).responseJSON {
            (res) -> Void in
            
            switch res.result {
            case .success(let data):
                let result = data as? Dictionary<String,AnyObject>
                resultCallback(result)
            case .failure(let e):
                errorCallback(e.localizedDescription)
            }
            
//            if(res.result.isSuccess){
//                let result = res.result.value as? Dictionary<String,AnyObject>
//
//                resultCallback(result)
//
//
//            }else{
//                errorCallback( res.result.error!.localizedDescription)
//            }
        }
        
        
    }
    class func getBanks(resultCallback:@escaping (_ result:[Bank]?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        manager.request(URLHelper.getURL("BANK_LIST"),method: .get, parameters: nil).responseJSON {
            (res) -> Void in
            
            switch res.result {
            case .success(let data):
                let result = data as? [Dictionary<String,AnyObject>]
                let banks = result?.map({ (item) -> Bank in
                    BankConverter.convert(item)
                })
                resultCallback(banks)
            case .failure(let e):
                errorCallback(e.localizedDescription)
            }
            
//            if(res.result.isSuccess){
//                let result = res.result.value as! [Dictionary<String,AnyObject>]
//                //print(result)
//                let banks = result.map({ (item) -> Bank in
//                    BankConverter.convert(item)
//                })
//                resultCallback(banks)
//
//
//            }else{
//                errorCallback( res.result.error!.localizedDescription)
//            }
        }
        
        
    }
    class func charge(_ bodyParam:Dictionary<String,Any>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        manager.request(URLHelper.getURL("CHARGE_CARD"),method: .post, parameters: bodyParam).responseJSON {
            (res) -> Void in
            
            switch res.result {
            case .success(let data):
                let result = data as? Dictionary<String,AnyObject>
                resultCallback(result)
            case .failure(let e):
                errorCallback(e.localizedDescription)
            }
            
//            if(res.result.isSuccess){
//                let result = res.result.value as! Dictionary<String,AnyObject>
//                 print(result)
//                resultCallback(result)
//
//
//            }else{
//                errorCallback( res.result.error!.localizedDescription)
//            }
        }
        
        
    }
    class func chargeWithToken(_ bodyParam:Dictionary<String,Any>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        manager.request(URLHelper.getURL("CHARGE_WITH_TOKEN"),method: .post, parameters: bodyParam).responseJSON {
            (res) -> Void in
            
            switch res.result {
            case .success(let data):
                let result = data as? Dictionary<String,AnyObject>
                resultCallback(result)
            case .failure(let e):
                errorCallback(e.localizedDescription)
            }
            
//            if(res.result.isSuccess){
//                let result = res.result.value as! Dictionary<String,AnyObject>
//                //print(result)
//
//                resultCallback(result)
//
//
//            }else{
//                errorCallback( res.result.error!.localizedDescription)
//            }
        }
        
        
    }
    
    class func validateCardOTP(_ bodyParam:Dictionary<String,String>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        manager.request(URLHelper.getURL("VALIDATE_CARD_OTP"),method: .post, parameters: bodyParam).responseJSON {
            (res) -> Void in
            
            switch res.result {
            case .success(let data):
                let result = data as? Dictionary<String,AnyObject>
                resultCallback(result)
            case .failure(let e):
                errorCallback(e.localizedDescription)
            }
            
//            if(res.result.isSuccess){
//                let result = res.result.value as! Dictionary<String,AnyObject>
//                print(result)
//                resultCallback(result)
//
//
//            }else{
//                errorCallback( res.result.error!.localizedDescription)
//            }
        }
        
    }
    class func validateAccountOTP(_ bodyParam:Dictionary<String,String>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        manager.request(URLHelper.getURL("VALIDATE_ACCOUNT_OTP"),method: .post, parameters: bodyParam).responseJSON {
            (res) -> Void in
            
            switch res.result {
            case .success(let data):
                let result = data as? Dictionary<String,AnyObject>
                resultCallback(result)
            case .failure(let e):
                errorCallback(e.localizedDescription)
            }
            
//            if(res.result.isSuccess){
//                let result = res.result.value as! Dictionary<String,AnyObject>
//                resultCallback(result)
//
//
//            }else{
//                errorCallback( res.result.error!.localizedDescription)
//            }
        }
        
        
    }
}
