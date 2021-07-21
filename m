Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1018.1626910917795809959
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 16:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gLO4NWG2;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28368f3232=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16LNQcMZ007713
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 23:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=YY9EZPGDq32B0LNYDv4R099yXv9hoPLqDCloCIGfG+E=;
 b=gLO4NWG2z6YNGRPCp3yYO2NntjqU1uinXapIUhe6MwU4vOYeSqL8EDw5ZzqnLt2jvMyH
 xh38/W1vurgU7kUZ5dYFbY4cE+63UCJXpUiRzzVFlVDfSyl+I8mKBXa+zq8WO3/2rANt
 LA/oGaxRFtpWPkNPDAUJRmfSHkcLWXhTw4V61Z0oc6gAXfTQultsO7U4+ccUkhR+vUAf
 7xOdam59DWrMCMga15Fz+SQvR9Ltq/MNRpcNqUiaIjRAdkzhztRdxLMQW6F26Kxnu63t
 Hi+R28Rda7/rrOfsa1fDiqCsaD+CM0S/PjfU9tjMs/NljHOniDxg+NnjKAveMdc2yPBD PA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com with ESMTP id 39xck0rqh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 23:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5CuRzvl/iEN7wqpkoV6fXRTqR50UkBIl44lj4nTWBiRKWby5c++UZmHjZ3E4DYfGMSU2+euTaRCX1mcBIZCOkGqFAG3rYnJQ/1G8zU7Y5k7XfbFfI0qJkL9mUY476bSDoEoH//lusoTxAHH1J3XbpOgheUdAqoyCZKMFQqoTVD5MvkuasB5Bp3Nhs6glKo9i2H7t2JYVw30apoQEAJ3+3hASN3z272oe+tIw+A5O+u1dnFpjbY9mVvT4qPqhnRY+m8VEZaj2qvtliZWqDYnkRbr2OTKozQ0FK7GPSx67to3nu7yvTTLFJz3RABNW1JQuL7iCUG9yWMC+R8Z39ck7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YY9EZPGDq32B0LNYDv4R099yXv9hoPLqDCloCIGfG+E=;
 b=V6PS9OE9UGuco9C+JzNru9sIY6n5418cvFjY/pt2VfKFSAQA4QyMTZ8nBolFey9ioc0uOcwOCmNsAWsPvzXGgvMpy2aG9QNZx/gZX2qS26cWENkSV0PqJNaqXZBx3Qy5BVlOylbwFl9oXS+Zc8QhUKWvmZs3+1voKPgcABLj7Iz2ZfVnugFVP2DzjQPHP/FtabGsjTlxUyNtEYg53vxlDRNPjOmj44oShMOVSO63dFdo4AkTdk5fj7HiyAbCYa6Efvq+zaysIDJ3AWG1NP6BYgNRGx5jXeD0qdEje9A5JVTQZaM0zTWI6uUKdX04J0RuBbv5tZHKrG1hWI+jH5hZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR1101MB2267.namprd11.prod.outlook.com (2603:10b6:4:52::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 21 Jul
 2021 23:41:53 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 23:41:53 +0000
Subject: Re: [hardknott][meta-python][PATCH 1/1] python3-pillow: Upgrade 8.2.0 -> 8.3.1
To: "Slater, Joseph" <joe.slater@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210721202801.27916-1-joe.slater@windriver.com>
 <107cd529-e534-03fd-0e72-298327cf972b@windriver.com>
 <BY5PR11MB399278F377E2055FB90422FD88E39@BY5PR11MB3992.namprd11.prod.outlook.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <2238e5e5-8007-b3aa-0b88-bfee30ccf39c@windriver.com>
Date: Wed, 21 Jul 2021 19:41:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BY5PR11MB399278F377E2055FB90422FD88E39@BY5PR11MB3992.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR11CA0076.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR11CA0076.namprd11.prod.outlook.com (2603:10b6:a03:f4::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Wed, 21 Jul 2021 23:41:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27ff7aaa-e72a-4446-14bb-08d94ca11ea9
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2267:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB226755845A05ABF1643791B9F8E39@DM5PR1101MB2267.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+teNKeZCb+1QrqwDUkzwdsXNkKrCEPIhW/CQacIuISMgRpDRAJKjt4PlunWbwqEwgcCSJpxJlJnUiKR4bUjuer1jn2QXD66gEDhA2y1n1ILVlzVAwynQWxrZW1VR3+Bs1mtoSWB8QVTzbtf/ART69LIm4IHUI2ifevr+P98096zsqcluv74wF8OR+8NQuIWi+cwubVt0BGwLVIFFv3QWwXZctkKrffd+hj2KRRZTdbrEqym7ImhyQMiadNNwvVag/G4jAyk/qF6lxKQBzIa7tz3vmIwtW5yB0KVnjhoBb5gTOIbAGwLeMMqz/o0FaxI70mYejRselrKB+/axZaZGZ7ZiNDl+zwPu/7YATe3dHDGmB1b/UWBoHqYwFLtYGTQzn1Mt8AC75Zh8qoBAUXJdubiNaMbX46fzn/UcD/g9Wn4bo1LCEIANJa+3I6Fisbp8Apx6YB8Jf8jPRK9yfJH6wqXaqBrT0ZNobqY83egcEPaqtU2X8Y07CoT/RPAUBwpiyVRIAhYfKzDbn/YHLcM+LK6QR64LCoZzeag/s1X6CSITzGvrknweem6kmz/a8Phn65HQqgoCZcdoTIT7O6Xbe14UnCYpX7gX4oma/2TS2ZbkhfZRyTIiKmFetTj/9httAo66VXAGhm95SgW3wUSALCKGnxMSI2/iBXGjI9mEqSzfOace9yvhEqHIohURopRfB8DtyYT241IJIQXllRA0IMa2Jw2XYUO4vC4i+2YK/xreve10tqXgFLI/F05nQysnJwRg26t22rx/dS/Som6qIQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(8936002)(8676002)(6486002)(66476007)(53546011)(966005)(16576012)(316002)(86362001)(2906002)(38100700002)(110136005)(38350700002)(31686004)(5660300002)(36756003)(31696002)(26005)(186003)(52116002)(956004)(2616005)(83380400001)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGt5Umw0NFhyVUZmbWtvYzNCd3V5VEpKanJCcFhOZ3hpVHNLWlRuN3V1Mncv?=
 =?utf-8?B?THBYWHlhYmczNFQyNWQ1M1BVMjVFYmJlaXF0aUVjK1Btalo4LzhNRDMxVmpE?=
 =?utf-8?B?WGdJemwxdXd3UUFjcVlRN05NVzY4YjBtS1VBMmtTOHZSU3p1ejRiQms2RGtk?=
 =?utf-8?B?S1U0NzZ2OUdZUGM3NnBvbDNzdVo3YmZUTkkwSTBRblVuS3Iycy9IVk1mRzRJ?=
 =?utf-8?B?SWZQOHRvNXZjb2RPQ1dZNlJlY1UwZWhoUDk4TVhtaGxxWStBOS9LUGVtVVQ1?=
 =?utf-8?B?QXpyc0NPYnpOdzBnbUdwOGkyaGdJNHZRQnBVb25TWXdQVi9WKzd5MGJVOFU4?=
 =?utf-8?B?bEJNY28rNEsySDBtZDByU05sTHRUeXBUYTBVTHpwU2poSkZuT0RQVG9kUVpV?=
 =?utf-8?B?Tkx4QXhQKzgxVHlTTzhobmozYkE3cGIwVDNIS2kwUWxEUkFGdWI2MGp4WGhv?=
 =?utf-8?B?NjA3VHFQSElLRnVjZDE5Z2FDWXBaem1yL1psSWYzeE9HZUlzeThCbnkya1Rk?=
 =?utf-8?B?cUVXQ0xiZmN3OU1nTjlJblo5MDJ4WlJvVHhnVkNnbGRpTXB1NTV4cWZkWks0?=
 =?utf-8?B?Ujd6RkFVUnZpb3JaVjkxK1Z4TkRsamJtZElzd2E5WEV4cFdHTmxDUzh0Z2NM?=
 =?utf-8?B?bisxd0hYWW9sSENQUUdXZGlldXRiWm5ZLzJKTWxMUlhNSUExSmh5QUVCWk5a?=
 =?utf-8?B?U0docEdiYldVUDFiUElSek41TS9CZTI1S0FOalVCSTNvYjZvUkZFZTd5NEdW?=
 =?utf-8?B?YjY1N0pLT3hmQkVVaW5LYm1nUWZ0OVBTamtIZHVQVVdFcFk2cHRMNVJnT29y?=
 =?utf-8?B?ZW1pN25uQ1I3bzNsVEp5ZHZDYUpwNWM4MUllR2ZCVWRVcWZFMU9XS2lwTFFF?=
 =?utf-8?B?cFppWkN6cHE0dW5uWVBBMGlqQmFmbXhPR0xBZ3gxdVA0QTF1YXRtaVV0MDRS?=
 =?utf-8?B?NVAzZ0lQaklxeHh2bXBZN211b0szaWw1MzhRQ2NwTmQ5WVhHUGVud0hwQ2hn?=
 =?utf-8?B?d2hCL0ROZnpVekFOUkpCOUkzdWNRS0hRMU9ibXRRdTJ3YlRCR3U4bWxHR3ZL?=
 =?utf-8?B?OFRoK1liUVhsK08wUjNMOWd3aTM4Vkx1MSthaDlzYTJ3a3dNaWNUWkJ2bUVI?=
 =?utf-8?B?WWdzZnd0bkgrYW5uY2hYNXcvaGkzTGpLRi9sVVpmR3h1cHVwWi9pSU5kRmJ3?=
 =?utf-8?B?YTRkNjI2RWpvTkh6Q1llYWVKVDVoNFMzcDA2a1YwUm12Vm1wUUhpL3ozY013?=
 =?utf-8?B?Si9YWkwraEdpc21ZNUhSRytSR1R0Z2djb0dJMEcvVHZHbnpxSTZDTlpCUDRG?=
 =?utf-8?B?MVRkL29tWHFBcHl5RHVCL3k5RUx5VmRYMmNMeFZZUHlQdzJTWllDUzc4Q1JW?=
 =?utf-8?B?Z3VhVlJWRVppa3A0WG51OU5MeVdSaWtyemhWUEtNcWF3SEE4bWxBVzR1WjlD?=
 =?utf-8?B?WENiVktEUlF3dmZOS3Y2U2pzU0NhMnlkakppaUNuYXhTK3ZoTXJPMGV0Q0Rs?=
 =?utf-8?B?RU82WUEvUThzTlNWQjFTRnV2YzEyU2VPelZWMmR4Y1dXckFES3dLUHVTMjJW?=
 =?utf-8?B?UVdFVTZvcFgyeWszK0FCM2t6VkVTVTZsTHdUcUJLZ21jSUUyQyt5NTN6SFZu?=
 =?utf-8?B?cnFsNDNnMGdlTWVjWWJ2ZDBGR0RFakdORUhPbmlVTzhrSWR1YnRYNm9ud0x5?=
 =?utf-8?B?b1Fac1YyRXY4amtkN3lybGRpNVRhRmpqWGFGdEZpMG1PNjlwdDVseDlESHZy?=
 =?utf-8?Q?zGOPCNOXIAaQBcb4WFg+NKTDKwvfK64fjYJIEvJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ff7aaa-e72a-4446-14bb-08d94ca11ea9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 23:41:53.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/PEg1aTHvkZL7Bgocu39SiceCeBoZ+PszkM/lcgqBq1vTyKYCW3f+OgdZFzQsUOJYetpxxbeBqRVquiIvCeHeDsJW3fDzQ0RyaWgvvlvb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2267
X-Proofpoint-GUID: MaleLzheDE8q2gW1VNmwTk7o87sPUex6
X-Proofpoint-ORIG-GUID: MaleLzheDE8q2gW1VNmwTk7o87sPUex6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-21_11,2021-07-21_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210141
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-07-21 7:14 p.m., Slater, Joseph wrote:
> CVE fix.

The please cherry-pick the fix back to 8.2.0 for hardknott.

../Randy

> 
>> -----Original Message-----
>> From: MacLeod, Randy <Randy.MacLeod@windriver.com>
>> Sent: Wednesday, July 21, 2021 4:12 PM
>> To: Slater, Joseph <joe.slater@windriver.com>; openembedded-
>> devel@lists.openembedded.org
>> Subject: Re: [hardknott][meta-python][PATCH 1/1] python3-pillow: Upgrade
>> 8.2.0 -> 8.3.1
>>
>> On 2021-07-21 4:28 p.m., Joe Slater wrote:
>>> From: Leon Anavi <leon.anavi@konsulko.com>
>>>
>>> Upgrade to release 8.3.1:
>>
>> It looks like 8.3 has some API Changes:
>>
>> https://pillow.readthedocs.io/en/stable/releasenotes/8.3.0.html
>>
>> so it's likely not a go for hardknott but I didn't clone and examine the src repo.
>>
>>
>> Was you goal to fix a CVE Joe or something else?
>>
>> ../Randy
>>
>>
>>>
>>> - Catch OSError when checking if fp is sys.stdout
>>> - Handle removing orientation from alternate types of EXIF data
>>> - Make Image.__array__ take optional dtype argument
>>>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>
>>> Fixes CVE-2021-34552.
>>> (cherry picked from commit a5fc60071f0a0a16096792c4e1970d31f5964539)
>>>
>>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>>> ---
>>>    .../{python3-pillow_8.2.0.bb => python3-pillow_8.3.1.bb}      | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>    rename meta-python/recipes-devtools/python/{python3-pillow_8.2.0.bb
>>> => python3-pillow_8.3.1.bb} (86%)
>>>
>>> diff --git
>>> a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
>>> b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
>>> similarity index 86%
>>> rename from
>>> meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
>>> rename to meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
>>> index 3241230d1..045357a6a 100644
>>> --- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
>>> +++ b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
>>> @@ -5,11 +5,11 @@ HOMEPAGE = "https://pillow.readthedocs.io"
>>>    LICENSE = "MIT"
>>>    LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
>>>
>>> -SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x \
>>> +SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.3.x \
>>>               file://0001-support-cross-compiling.patch \
>>>               file://0001-explicitly-set-compile-options.patch \
>>>    "
>>> -SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
>>> +SRCREV ?= "92933b86574b9c80764bf52c357ed29e1ef53382"
>>>
>>>    inherit setuptools3
>>>
>>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux


-- 
# Randy MacLeod
# Wind River Linux
