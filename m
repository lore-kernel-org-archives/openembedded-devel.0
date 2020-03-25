Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.84])
 by mx.groups.io with SMTP id smtpd.web11.16497.1585155064006710197
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 09:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=PPARpphJ;
 spf=pass (domain: xevo.com, ip: 40.107.77.84, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHIOVygbnMMZw4cozfUopnJLpI6/VM+lZgJSms2XLcjd1aTx6NyZLCe4RJ2H21KuRh0jVbKoDHSEdCzZ+6Mn2RhNfba+jXeGwaJD29pVjI4gepRDeI54NnCxBmtH7pQaj8+7/YpqlEvZX8ha2hbk39dsEYFU1nqpnrGGZFXD6T17N+CxM/ueoxH3Dboo0Y5XBtLmWHbk/y1d23gNV6wAjQaGOLwzTTFAvsfBP3JOX149FbUDifqfXgANojPFixN5HzbClnUFbXXvgxPudYs7Ku9EZPwiiZybxdnvNcE1p4m5O6lRWwRxy4tP5oK1UYHiymLqwuNV78ajeZdH13ReyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3ZdX9ItyPbhGeugBn88Qdeh44b+qvG9MvaOVG+swlI=;
 b=m/XD3BWFs8XdgiIj/3Z6d9ubNuLr9gEot+wue5zfmZ697Prl/ZeCFBaf2j0lIjFuJK98kkSpXh2+lRs3nAgaoc6ttgYHZz7A2WiQqCLvMbnXZ2qJ7en3jUGNvrgGTRBYvictt6tKXAyqywgT1tL4/GDNPBOT3kYTpUuXA1cYCkHykmmGMsnwFaJgZIaGwQSEVceF/hfnlJ5Uekiigz+i/YMKOgQBUZ7IF/Mex7L009WD3tgZ2xep534pIBwsnd4nBOqaX4dgEgnRNsEtFgs8ur49DIqyd+E9X7UM5spj/GHf0Le4/DzMRM/9tuwL64MaMHCf/gOejF1tAI1P331y8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3ZdX9ItyPbhGeugBn88Qdeh44b+qvG9MvaOVG+swlI=;
 b=PPARpphJFxG6s5oQvhiZyHeaGC2Wk75ZnF2FK+iDbfegXKza5ShiQAnuur3qQq46GbRmQLSM8IztIL/YwJoxaWDolXBtJNe3qh1DGkh6A5yqMGIkmKSeQjZOwJ95D6nPkEQlGlRFjsBrJxzMnB87A9qTwr9Q4QsLzlHSpDu1Iyw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2297.namprd18.prod.outlook.com (2603:10b6:907:3::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Wed, 25 Mar
 2020 16:51:01 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 16:51:01 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pint: upgrade 0.9 -> 0.11
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200324234539.956527-1-mkelly@xevo.com>
 <CAMKF1sr+POBH5FSxmqiLPzTsc6viUT9Wk4pXtur-oxCG7+9sgA@mail.gmail.com>
From: "Martin Kelly" <mkelly@xevo.com>
Message-ID: <763f0ae2-63bc-15e0-1ebe-001d4b9435c9@xevo.com>
Date: Wed, 25 Mar 2020 09:50:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <CAMKF1sr+POBH5FSxmqiLPzTsc6viUT9Wk4pXtur-oxCG7+9sgA@mail.gmail.com>
X-ClientProxiedBy: CO2PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:104:4::18) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.252.28] (4.14.243.50) by CO2PR04CA0164.namprd04.prod.outlook.com (2603:10b6:104:4::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18 via Frontend Transport; Wed, 25 Mar 2020 16:51:00 +0000
X-Originating-IP: [4.14.243.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d755a9b-ad5e-4fda-9328-08d7d0dcb2fe
X-MS-TrafficTypeDiagnostic: MW2PR18MB2297:
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB229721E71F6379963ECD78AAABCE0@MW2PR18MB2297.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(376002)(346002)(366004)(136003)(39840400004)(396003)(26005)(52116002)(8676002)(66946007)(31696002)(6916009)(53546011)(81156014)(81166006)(6666004)(31686004)(66556008)(8936002)(36756003)(66476007)(956004)(2906002)(2616005)(966005)(478600001)(86362001)(5660300002)(16526019)(316002)(16576012)(6486002)(186003)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2297;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UL4VBCfg8NZkVf+dRKprBJDXhT6CTTbJo8PuxRySOFipgmHNjX5RMeENdTtHlJMtSR7SvE/MwWQ+dEllK77eSkIfSC1GOsdOhXKIki3XPs05PF3XbeAeyn8sEl0bD7tGssEsbICssF0X1QrvVJEZDDfiKeMp7fJ2TWW/XjwpmRphtFkXW8R1gm68eb2C91Lf5vUxtvJlU7Y3ig1KGQtsTIh8VjrJfB7fPp8mjTeKSXO3zpcnwejvpzVTT+IL97FUclmKMRyeLm8sCWQpeggnaqxREAqNQm0kQ+RnW89RZumLkIHPBsga7OVJT/31Jc1mnXpJG8lomfHyI8C9bAGg66IFDTyuRPK/4a9I9v0MVjh9TQq33BwxCyaHwm/F0RQhV4Mu4xgqzLhOG2Hz57ZUiMjq/OmGirS4i1uqPbW5rPqPDZl8q26E61lexWpaltFUJfS37UvA7e9rGPC4YK2iKSIZOWBjQQmlaC56fxuMy0jQS05kwOVqdlbrmynP53bhWinH1Juf2qIQsyRucD+AzQ==
X-MS-Exchange-AntiSpam-MessageData: 
	pKWGU50lLgIryt6CDs/nZApKyr2mU2GldIcuROG+Qwdle9yCkQ2IMygW4tc2J/OnjMzQDPuur6VnLsuJ1wIpPk0IQOSVOsU6/PgsXe5CkXBTiRgZjA8MB8Sdtfxsmtj9r+7gm22DOK+J0UPzWhYVLA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d755a9b-ad5e-4fda-9328-08d7d0dcb2fe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 16:51:01.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piFJ6fuUFkJsx/5LP3kVYptTRez73eqIGDolko49XB/RSAwUHApw/zeN1QWR9uNg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2297
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/24/20 11:41 PM, Khem Raj wrote:
> I seeing this
> 
> https://errors.yoctoproject.org/Errors/Details/398554/
> https://errors.yoctoproject.org/Errors/Details/398552/
> 

Sorry I missed this in the flurry of patches I sent out. It's fixed in v2.

> On Tue, Mar 24, 2020 at 4:46 PM Martin Kelly <mkelly@xevo.com> wrote:
>>
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>>   meta-python/recipes-devtools/python/python-pint.inc           | 4 ++--
>>   .../python/{python3-pint_0.9.bb => python3-pint_0.11.bb}      | 0
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-python/recipes-devtools/python/{python3-pint_0.9.bb => python3-pint_0.11.bb} (100%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
>> index 0900d91d7..41b3e2262 100644
>> --- a/meta-python/recipes-devtools/python/python-pint.inc
>> +++ b/meta-python/recipes-devtools/python/python-pint.inc
>> @@ -9,7 +9,7 @@ PYPI_PACKAGE := "Pint"
>>
>>   inherit pypi
>>
>> -SRC_URI[md5sum] = "d0681cb7cfaca9fc68ce7edab0d08d88"
>> -SRC_URI[sha256sum] = "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d9810a68a561fe4e2"
>> +SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
>> +SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
>>
>>   BBCLASSEXTEND = "native"
>> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.9.bb b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python3-pint_0.9.bb
>> rename to meta-python/recipes-devtools/python/python3-pint_0.11.bb
>> --
>> 2.25.1
>>
>> 
