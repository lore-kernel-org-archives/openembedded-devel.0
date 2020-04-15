Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.55])
 by mx.groups.io with SMTP id smtpd.web12.5230.1586909385274284875
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 17:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MPt3mjy2;
 spf=pass (domain: windriver.com, ip: 40.107.244.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDQx9CjHZcxXkXlksVFiP6rs9V1ySbk6DGUiIVoHewE7yuf/F8Iq8nMrCzuYhBOmKryrdui/tYSY6qaJyUOsk2CDVfMFlE/1fpLA+K2Su/F0CmTNsr1PFKFipejfVgeva6WhzsOi31Uc0Ae/JJGXNGEb/eSuBx0BfhtllQn8cZ6GvaFvrkArndkQ78neZjKli9aRfOBSg+504Bck+Foy3Xj9X7BpeGI8abpDzA29ewe9/knL209nk32eh1PImX2o7mOWIVh4FqJfha4PsvSSeqopL46w4Fx1IFCR+V6JeErpWX7yZfUr44ANYpdLYSthIDz5x1BZu8JHdokR3vgqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cfb/ZLf2glduO9B4zbdhxvbE11yX9aBgH/v4MFoUBrQ=;
 b=dYQlU+o2INMwzoEE8arGlql6fxWKMHT52QovjjSRIkV11jr4EZGG0xqItylCsxF0ZyP7dU8zladEudNKD7kctiMAbG4rwiH11cne83WjtODUfMJsLdw/vQ3Hv5pNOH6Bvbs53BMJ1NOzKb2O/0byk7txzpSY72gddWbHNaZjjUzFzkn7m8PvD98oLj7FM7lv8Wt7FduIrA8AItv/bQMNc/8lQq1EsNLuUDTemzExMBgPmx/1DNakvWKHJdZPEHbmiQhCzbSRJYScNp95E+8RMNT/mNMBfF+Dxy9s7t6H7LRMlh8OEVLQjMy7+mh0lzgUjBMlp5r2Qcv8KZ5MqvRpRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cfb/ZLf2glduO9B4zbdhxvbE11yX9aBgH/v4MFoUBrQ=;
 b=MPt3mjy2HBtJXGC3K/K0xepRyuAiF/TQ3J9ofruGBTMjcAPhnJw5g04UczD9SbMq6exg9h6hpQvDmmNkd6KWf52cBu/6jl4p+fLuzMKCk40zs3dQ0reTzegQ8x+xRtqJBWBL6t2bESDYqkhe0RSqt3eUcfvlQuDnZQyd7a1wZjw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trevor.Gamblin@windriver.com; 
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4147.namprd11.prod.outlook.com (2603:10b6:405:80::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Wed, 15 Apr
 2020 00:09:42 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd%7]) with mapi id 15.20.2878.027; Wed, 15 Apr 2020
 00:09:42 +0000
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -> 2.4.43
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200414194933.31798-1-trevor.gamblin@windriver.com>
 <CAMKF1sps=ihwMcTFkSBTSdtZDbGEfotpjbje9hhdaAkv=g4X9w@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <695157d6-c8d1-dca0-df48-cd5d233da330@windriver.com>
Date: Tue, 14 Apr 2020 20:09:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <CAMKF1sps=ihwMcTFkSBTSdtZDbGEfotpjbje9hhdaAkv=g4X9w@mail.gmail.com>
X-ClientProxiedBy: YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::34) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Wed, 15 Apr 2020 00:09:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d353c2c-c114-447d-8d20-08d7e0d14be0
X-MS-TrafficTypeDiagnostic: BN6PR11MB4147:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB41475B9A52CDFB84C96C0B449FDB0@BN6PR11MB4147.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 0374433C81
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(136003)(396003)(376002)(366004)(39840400004)(346002)(81156014)(966005)(2906002)(6486002)(53546011)(31686004)(316002)(5660300002)(8936002)(86362001)(6916009)(8676002)(186003)(4326008)(16526019)(956004)(52116002)(36756003)(478600001)(66946007)(66476007)(44832011)(31696002)(83080400001)(66556008)(2616005)(26005)(16576012);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XNjxqcb/X5pXnLO9b3xIavL1n5Kx5ljhFDdXdygrGunDYo3eNjCWA/dC0hsuoUbcsK7e+7oepOlG4r8Yf4mCRrZDiHpMyavonhn28mlcAgaBqn57gcs2KVSvhJzcdF1PhUO+A+XjRqmnO3iu7ZxwI5GuQ8aSngQdZz7I4vaF+Cr3br6FCj7uC0IChipTanglmjxI9zztqo4e8JsXfulg6NLY7ho7EE7X+iNXDf/os/VSqIe85CZO6D+covZooi2jJUyZJdPdxy8OjcC6ObeZ1/uIEPTM+erpMtQpoNT8+UizeNnsskFFNKBrZltagRBugB6SiQdGL8VNpGYH5p1eoZunQDOqsR8IRC82/t9h8VbJTZcO7HUutYpxDrUvQU7RohHe+ZIg/8um0sjMUXNPNWG6IDpTw91Iqes/kUFOnw1qMz9fSGBWhc0wI2bdGsSbq27AAVpR+Ud7y9F+r/P+NSRWq4xNHPlM900JVLfXxzO0S+6hoX1zkIfsD6xf+jvlNdB3jXUhlzVmr5CpkQJ4LQ==
X-MS-Exchange-AntiSpam-MessageData: 
	U1WeMBGggnWbAuwhVf0iu8dy8kXJeaRdwIxvuSPoDa93XDGObMP2ctZign/t0hLhDqwljXLy1phgXLsLAmZHZrZpStBxO3/mAirJzE9f1AB2jLEqkF1r+Oe1sEcfvSb3so4yPe/NNoC5/n5zRpK8tA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d353c2c-c114-447d-8d20-08d7e0d14be0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2020 00:09:42.4007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ns991si68jrU9HIRn1+8LHGiA69czsyaT60iSmm8XrECQdA1GGOb50GRUceptSH4Qaw/aAtj6AU7xQchBKpqrQLXITBBjdkwi2c8fQkx/RY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4147
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/14/20 6:38 PM, Khem Raj wrote:
> apache-websockets does not like it
Thanks, will take a look at it and re-send.
>
> https://errors.yoctoproject.org/Errors/Details/403771/
>
> On Tue, Apr 14, 2020 at 12:49 PM Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
>> LICENSE file was updated due to a typo fix.
>>
>> Note that this upgrade fixes two CVES affecting versions
>> 2.4.41 and earlier:
>>
>> CVE: CVE-2020-1927
>> CVE: CVE-2020-1934
>>
>> See:
>> https://nvd.nist.gov/vuln/detail/CVE-2020-1927
>> https://nvd.nist.gov/vuln/detail/CVE-2020-1934
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   .../apache2/{apache2_2.4.41.bb => apache2_2.4.43.bb}        | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.41.bb => apache2_2.4.43.bb} (97%)
>>
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
>> similarity index 97%
>> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
>> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
>> index a34734c20..2fff153fc 100644
>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
>> @@ -24,9 +24,9 @@ SRC_URI_append_class-target = " \
>>              file://volatiles.04_apache2 \
>>              "
>>
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
>> -SRC_URI[md5sum] = "dfc674f8f454e3bc2d4ccd73ad3b5f1e"
>> -SRC_URI[sha256sum] = "133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
>> +SRC_URI[md5sum] = "791c986b1e70fe61eb44060aacc89a64"
>> +SRC_URI[sha256sum] = "a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43"
>>
>>   S = "${WORKDIR}/httpd-${PV}"
>>
>> --
>> 2.17.1
>>
>> 
