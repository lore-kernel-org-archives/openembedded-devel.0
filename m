Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.50])
 by mx.groups.io with SMTP id smtpd.web08.141.1612568576125012667
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 15:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bFxWdbgx;
 spf=pass (domain: windriver.com, ip: 40.107.223.50, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBlUIQFk/wMufs3D1ezwogetBfKrke/ibGmrPpLUxUTzA/ek75wDqAPDI02UmV+/YlX4bEZecfoczxDqe5wO7jjamYZhOZuAbgJqMrGgqBIeMC84uBTC9XG2059a7cd5ixHikAGlNw4nU5DQgDo1k4HOfms6Nfhqg8O0Tt29d61OIxiiy/TzTpPIVJ15yRS/M0+8umzu1d8ieclhsqf9rpIdYHLHbZ7GX8q+l+3a+S//qO+lCCOh27sWxjzE16JQ8pgYTc3fPVea2fI3VSjKEoYO1YJNSi/J4iHcIMoQx4xT7gH1AKnWK3KOSNdFjxQavY86X6VjyQ2l1H9UFVVhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsbJZmu/XDb0o2DydbdXxbp8AXeMbwHjdvsV2NkXJFU=;
 b=CZoktSYEpIN/Cb1eM8+77MIGdQgHzASd6wmQgV90CZvPbSp9cZ7zRfuxh1g97NcgMb1Mb+MLZ5Pm+t1nft5eCRMKT+Cjq5UKmaMH13UEPAYErzWd7ADWsptCrsADssphXmTIneiT80h0+T6z+j0DyNWQMq35iNWbqHNAyuD4JiRT1r8IeuuK7YvyyNTKNFrUdxuohF5HM9n+AW9OASD44Vr8IYcAXwpuDL/DC5tBwgAkgtFBx/YwkCsogygfxeCws9eVTwnXUFHutzEpoJl/n7GN7WGCs0OfahxPbv7swdyf5YyCGxp4WLzIV1wqeMVynzTarzRQpxT/r9b71XL4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsbJZmu/XDb0o2DydbdXxbp8AXeMbwHjdvsV2NkXJFU=;
 b=bFxWdbgxS7lh92JP4lsSrJhsT6RSaSwivpJTcwSxxk6I5P/p/p1cjxnqGOcGNuiQ39EyJG4k6r/2Bg5M5IEYq0e/E3PJKyqW3Wlf1s/ZNkImqKbV54wsjH0QDteki/YH2sGQViI+h/LUEUidL+Fxh6bpuxTNALc1ZKQnQ2KWRMw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3067.namprd11.prod.outlook.com (2603:10b6:5:6a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 23:42:55 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 23:42:54 +0000
Subject: Re: [oe] Help with dealing with autoconf uprev affected packages?
To: Yi Fan Yu <yifan.yu@windriver.com>, Khem Raj <raj.khem@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, hongxu <hongxu.jia@windriver.com>,
 "Chen, Qi" <qi.chen@windriver.com>, Ross Burton <ross@burtonini.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
 <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com>
 <5a73bb02-18ae-a7ea-c55b-d650db4d97a1@windriver.com>
 <CAHtQpK7P8JbrKCS-xMmgUu-rEUW1wbgJau+_93O9eP_+wgM_LQ@mail.gmail.com>
 <c6849b7a-5dc0-ced2-b6d0-a0e6f9ec72f6@windriver.com>
 <CAMKF1soXQNO8Jx_iHN+3rGam6qNJ1SsUyPXZgHv=F7NyGgwpOQ@mail.gmail.com>
 <CAMKF1sr-fsVGdCegDri4Vy7cJK8AZ18M6X8E76XThfi7C34KLQ@mail.gmail.com>
 <86f09202-225b-ceee-ebfd-1f4ad3be20c1@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <c925fe41-3563-e817-b525-011c82111b58@windriver.com>
Date: Fri, 5 Feb 2021 18:42:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <86f09202-225b-ceee-ebfd-1f4ad3be20c1@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BY3PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:217::22) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BY3PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:217::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Fri, 5 Feb 2021 23:42:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f97d35f-3410-46b9-846e-08d8ca2fc25b
X-MS-TrafficTypeDiagnostic: DM6PR11MB3067:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3067CEEAA05C7E8BB287BCB7F8B29@DM6PR11MB3067.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4QSvtaSeFvrGEZsrhIkr7iHDpAGMJi8Xq2v1t4xtmn9u4bMQaUJcEl1ZTHSliHHaf/o6AjVj6OmiTxA6TjPqjLKHXoN9Z36/yWBx4TA/0/KbES6NRqpW2ptvmIyxb1GaszYtTzJjIWwtWWq7k14tam+mlHq6p50jAG+GZbgzcWmN+S5T0zkFdQKRjautqAx6/wc0VQD83cd/cjNp+pZXZmXy51O3gaZ8F+GcZFtfDW0wXC0w3Ht5wP4QGWr7NnYMYhuIsRMKa2bPYuX+Gr4gkqwD90kk0g9O/r4OwgsX+slhR3vtzSnF9XgMrfpzL9RHpk02jcb1WmJDg4dQPixv27ZWuJ3N/oQxtocK2EsF2veA8k9EpZbDW5+m+P77fLZjo3VwOcjTFyCBdFiCqFT5KbzCJYpfbbmJyGVLyBXxqT5I+GuRT4/t7rbmKNNHNdUaHxXwItH9wIOMiKelYlIA/PBQjzEpMEfGDd+0i39ePcwQgxTB0BsEGJa15TOQPsb30pcwEXw/oSl2ZBouCm2kSu079JRlXMYlSycZ/FzTHNGrbGEEoNASuhnrmpfqMJQIrO4zv2VgBP3+dWNe4ltH0LXMmQc2mVadp2/SAlnWKhQAuCaRR3HrqvI3eldTLuEXrCD8eHHCGyu/ALzJOvtRI8x9qVaO56qogDxCkYvoVBoQzUhfH8CU30PDxvO2Mu3s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39850400004)(136003)(376002)(6486002)(2906002)(31686004)(4326008)(478600001)(2616005)(956004)(8936002)(86362001)(31696002)(66946007)(5660300002)(52116002)(966005)(36756003)(83380400001)(54906003)(26005)(8676002)(53546011)(66556008)(66476007)(110136005)(316002)(186003)(16526019)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	P07PV2woHO90yZgNpXjEydgW3gYTFjHQKOnrkrGUwt4GJL/wm8sYQ7vB/3pM+/+aIj8X2uI8kT5T2+HM/sUBStaUJKujpAws+jUL3fSntmnIoOTedLxZi+mVVIN9UyGEnVjaLae8SPk3glGO4mtBuHnc7sbNYhvJWY8gdz4z7vlBYs67IW+XeL9S2lrZwsqUBKJG/ob4mYE6vKTTB7AfGNkLboIJwHdaBqPioxmAcYXi9fCQ6ZnmwM0u/6NmPLv2TSf0UeCXrtc0OkvtK4m6cxzHHBPQ8ds+OoZ++3twLMk3T39XCx2V7e+djfGK7hAPwp0vNOLHCTzsIGrLs1VCt94GcjjASUQZv+0hRK1cl5HE/ZIBUCbLEOmi5Sf7EUYPIukzbzPnvi0fbbdRxq6dp6nZ5PWPu+MvBTYSNN4CyDfpH87HQf9mU7RGLCoZA1KXhj6cw1VDoUN5s3jUf2vqjohSUAS9apzFCWkyzgsOdThi7lMAFTAFLNlyCpMWzy95pNDLPO3Z7tf/ieLrc/E/rUa4pF7hZ/DbT3K9YmANqsaJKQwC0UTf6vvSoQT1NLjWG3RtJ/2EMMitKkCOvAfWVGGiBoh748v9fD0rf3Qhe/RmbsrLAOcCuz1hsxoyrYRLMzX1rkbktxj6ZPluua+Dm8aHl4MMnL97J9nrPC626B+ZpuCsaaweZvcBAjtABmGDij1/7VSQsXoFNKdJxRoI+t5q/ivDfFddGLRdx38njurLElUqBHnodQDfsJ+C9/n5
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f97d35f-3410-46b9-846e-08d8ca2fc25b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 23:42:54.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i64kCgjGHe/o9kf4hXcmTTJPyrbrj9QzyneOdjdPomYQd8GpPVl2w484+LaMwLVFnip9vh63jtuZ1HLBE1chsRvw2lntvreTeafCqwgjgeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3067
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-02-05 9:46 a.m., Yi Fan Yu wrote:
> libmcrypt still uses autoconf 2.59. last release seems to date from 2007
> 
> https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/
> 
> its not going to be a piece of cake...

Yi Fan will be sending patches to meta-oe and meta-virt
to blacklist libmcrypt, nagios-nsca, maybe hiptopvm
and change the configuration for php:
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Alibmcrypt

He has also sent a postgresql patch and might wrestle with
freeradius unless someone gets there first...

Hongxu, aren't you working this weekend due to the
upcoming Chinese New Year holiday? If you want to do
freeradius, just go ahead and send a patch.

../Randy

> 
> On 2/4/21 10:26 PM, Khem Raj wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> We are now left with 15 odd packages
>>
>> https://errors.yoctoproject.org/Errors/Build/116395/
>>
>> On Thu, Feb 4, 2021 at 1:47 PM Khem Raj<raj.khem@gmail.com>  wrote:
>>> here is latest list
>>>
>>> https://errors.yoctoproject.org/Errors/Build/116365/
>>>
>>> Just look at the do_configure failures for filtering to autotools issues only.
>>>
>>> On Thu, Feb 4, 2021 at 1:09 PM Yi Fan Yu<yifan.yu@windriver.com>  wrote:
>>>> Andrey,
>>>>
>>>> i am working on this now.
>>>>
>>>> since you already submitted iperf3, i'll focus on
>>>>
>>>> libmcrypt.
>>>>
>>>> i'll test and build both of them once i figure out libmcrypt.
>>>>
>>>>
>>>> On 2/4/21 5:45 AM, Andrey Zhizhikin wrote:
>>>>>>> - iperf3 - YiFan
>>>>> I just sent a patch for this one:
>>>>> https://lists.openembedded.org/g/openembedded-devel/message/89274
>>>>>
>>>>> YiFan, can you please have a look at it to see if it fits?
>>>>>
>>>>>
>>>>> 
>>>>>


-- 
# Randy MacLeod
# Wind River Linux
