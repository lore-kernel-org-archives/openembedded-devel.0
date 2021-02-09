Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.88])
 by mx.groups.io with SMTP id smtpd.web09.7060.1612853224865171977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 22:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RvAEeuGW;
 spf=pass (domain: windriver.com, ip: 40.107.237.88, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hN0EBgLkBqsGIehg6ORa99TlMTrVwfmEqab7aiRpccluqjVYw4J/h7Wwgy0639nXQ7r/UoDUNhdx80+nEcnfNNkWmpZLD+KnEwYc0bJEWVbREgUYkU7VX0aAGdSvKt3QMlKCUlUXXrmyPR4/TQ3jQj4UfLUoI+Q0CS1l7lUnP6LvjwbCVWJUQbpRec7VOJqO4ZoG5Jlnb4pdqVyVmhTBjm0Ls4oqsLDrR2IWavHj4l2q4g/gqqNfq93gL7Z4QlG4ho1/9BdkETov6JlYZ5w534mMRMMjsMkq8YlC3nKkRLgkaLj67itlbtHj5tpeSCttL3stE98BtLvUlbUKjJIwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzy0M0nf4mX39CH7rgFKe0qNoGZ8CHf9Z8UgztdaNX4=;
 b=U690eSIYnn18opfKyjIjcxgI7Z6TyaoswwuMKo46tdBsQqdlb3AFMWL9QJ4eRpTWklBr/Vd9ZRtsdzr0yEW1JaW0I2rgKZG0pKZ17mjrEaI0jONYkm4tuCL2pxXTBLQcwEHbsdi+3ObbTDVq53PDvnzR2uoGmBBH5lP+b4c26ATrmLd2GLgdoLqDWqWbOkJhaG6a3LOfuwBap3yas8MxkgdiaIwcVqG0BQFyl2hZjxGV61EgvPLpft6cFdQOPcLfNNqJ27ieI4nFz5lRUyjLFQvwl0GLM1C7I+8ZdbKJDSUluTG0C+0rIyzwSthDpRPxZCxmhLNMteJgzA2hru4Pog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzy0M0nf4mX39CH7rgFKe0qNoGZ8CHf9Z8UgztdaNX4=;
 b=RvAEeuGWeywhD8JsHK0mI5qlzh1RDyRoQSfxorkxaz/LPRfdNmDNxu7XknWPwYR3gAtjDrfKMLEW3fiJqxUrPJcsq6v7UhQaY/0tJ4tGOSqKBwLzemls7ZUsSUr57jdlls2liZLQ9TCglUjKwYaoU+m0r/5PJXyTg3BWjIY/POI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR1101MB2236.namprd11.prod.outlook.com (2603:10b6:4:58::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.27; Tue, 9 Feb
 2021 06:47:01 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13%4]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 06:47:01 +0000
Subject: Re: [meta-networking][PATCH] ndpi: fix autoconf-2.71 compatibility
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210209060717.69440-1-hongxu.jia@windriver.com>
 <CAMKF1soca2eHtfmMNkQ2LXBjaEVoN67zMXv=pn7WoXZ4jfsfzA@mail.gmail.com>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <202493eb-7651-89b1-c4f1-de7dee28c4a6@windriver.com>
Date: Tue, 9 Feb 2021 14:46:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1soca2eHtfmMNkQ2LXBjaEVoN67zMXv=pn7WoXZ4jfsfzA@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:203:b0::24) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.131] (60.247.85.82) by HK0PR03CA0108.apcprd03.prod.outlook.com (2603:1096:203:b0::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Tue, 9 Feb 2021 06:47:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26de2dfd-bf67-4d57-af87-08d8ccc68138
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2236:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2236BB2E10B00354A3B6E45E948E9@DM5PR1101MB2236.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	78XelGsQ44BDQhckBt/ksbYKC4UCW6lUNS33k+0O5eSJhd96u+7kHmrNON50bXvW5iMAHm/NThBGK0Qk+xlx6MrTviNRL7gJHE1Jn5QgJ6qHKvazFpcXJWPfaI0DD5Kt5HLh3W0FSKe50FyRvsxqt+4KwhjkNXhrjpeYuh+s96WU4tf1sc2N4jcBtESGIqMra2wrA4Qy2XUqK41ko5ThHKZfS30N4qvet8IUmiKjixC1VYTAFaeSe5CcXG6zAWKXJK4lZHdT9haBbE4aCMxwPgWkuRxtVq4Md4Whp+g7GbjLeRdVBDc9lu32xepX5xTuOJPHdl3wAB2Mo7HjaluZFgp6+qydgTSGraqGcdoK09mtMJea0WfFsZvTMWzZp64bZzbGv6W9YLjtOgKXGMO1ked+47iGDh2g5qlqfqxx4SxhQOMVRZWdt5+hoapEQKSSArCgkqlyL2qBEWWsUw93tXaZQ6SJxA9YWkvyZVPtyG4+PR/Hwts432J5tPBE9JUoQrLpmoXreex6Iam2l7ROqrT+nI7FjazJD159voecyRXoj4PgYL6q/ZJOzF/k6O03ih4HN6fxenCR/xx93lDBwANUIEOL8XaEfe8rMUrR6un9g4vdYcyHKKd9gLScjq4k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(39850400004)(136003)(6666004)(6486002)(16576012)(83380400001)(316002)(66946007)(6916009)(6706004)(53546011)(31696002)(26005)(8676002)(16526019)(186003)(52116002)(66476007)(86362001)(66556008)(478600001)(5660300002)(4326008)(31686004)(956004)(2906002)(36756003)(2616005)(8936002)(44832011)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YUdmN1VPWTB6VldnU28vRFlmNTc3alNQZmpnZXVGcDNEdnQ5dlhJY0k4K1Zn?=
 =?utf-8?B?eXQreXBja3BNVlZPdWhyczhuN2h5VVVtR3BtUU1UakhDc2IrbkxqOXErSXZH?=
 =?utf-8?B?cFNhV0YxVjdXa3U3Yk9kcGJ5b2lIOGQ3cVE2Uzh4c0pMTWtGbytQaXBhVEhD?=
 =?utf-8?B?eStQQmJzNWp6U3NtQTJHTGJDUWw2Tm9OenVsSkJ3NzZVd29WM1c4WXVTS3l2?=
 =?utf-8?B?ZXRhWUtPb0FUVzU1K0c1TmF1NmNwc3E4WGJFTWliOTFjeml2ek9mWmRCanRu?=
 =?utf-8?B?bXM2Um5RbzNLVGoxZmd3cGFrMDNFYmZXcTBrT2hmc3hsQWp0cVk3WXZLeTcz?=
 =?utf-8?B?RUNVOHl3Yk96VzJETFB6cWNZTTdIaG8xQmdSSTNmaUVkN2Nod2I3M2xRT1hJ?=
 =?utf-8?B?NHlBbEN5TnMyR0ZrTUZGZWtCQlBQSlNVOHU1eWxzeUJlZEdvR2NDY3RFb2ln?=
 =?utf-8?B?eGZ5b2M2dVZpK2lHbGcvV3g5TXhNSFBBZzE3NTBlUDJxMzJzaTBvNmx6MGZZ?=
 =?utf-8?B?QzNZUTRidndHcFptOXp5U0dpWEtsajNkMkxZaWJ3UnM4NkV4NFZ1ejFSMUsw?=
 =?utf-8?B?MU1CWkR0QkM5dWJaZG9YRHFzaGk3bFZmWThBVVZTV1BkSnlxUEQvV0NPVElv?=
 =?utf-8?B?S1ZYdGYyTU5XR3ZHWTN0dCtGcVBXNUFFZGFIdXJqR3hoRExPcmRuak1hR3c3?=
 =?utf-8?B?VjdHc1Nkb25SZit5UVFMZk9LamU1OVBKQ0tPSjJtekFyMks2SU1JaFR2UVFF?=
 =?utf-8?B?UXFNQjdBeUNXZ0xnSzkwekZWZkRydVZGZ09sOU41QXJJU2hram9UZ0lUWVhu?=
 =?utf-8?B?K21aVnFGek5aenJxN0NDREIrM2lhZ21FQzUwNHZBNWlndWJEMXV2Y1hnVjNP?=
 =?utf-8?B?MzZUME8xT3RYbmRHTlBuRkZzTTAxRHJVUUtwNlNFcFJISThVMXByS09sWnU3?=
 =?utf-8?B?cGpUSDlEb2VFcGJ2UjExWW5FS2RxRUtOZWRlWHViaTZuNzZvMnpKK1NCUEFp?=
 =?utf-8?B?V1NDaGxMbHBEMlcyYUtvRXZnUk5QblFQMmFQeVpUY2NLb2o3bVJGQVJpWFRz?=
 =?utf-8?B?WWEyZUhXREdVQWt3T2xRZmJFSTF3NUtQYlZlTnkwYTZWTnBWb2ZoR0xtWW1W?=
 =?utf-8?B?WjVRbU95QlFlQmVFbzhJSGpleE0yYW0xL1pHRDg2Qzh3Q3NHQVZRTHFaaStQ?=
 =?utf-8?B?QTFqdkxCVHRTMStYOUExV2tyUk9QcG1hQzlJSzRacG9QWS9mVjNrZTRaNnZH?=
 =?utf-8?B?RStaSkVId2txNkhIRWQ0STZjZkFHTEFldTM0cU1vK3ZRT1VPZTRpeWpyQzU1?=
 =?utf-8?B?U3QwMEgwRGF4QmIwWWFNSzRIVGlwOFRacWZyUWxvY0hjWDdSM1gxRVJTSEpq?=
 =?utf-8?B?R3lVa3djNXRJM2JNWVpPTThkZHhTRWZJQXNESUxoNnYxdTZrck53b1gwNVh5?=
 =?utf-8?B?UWltNGhjeloyT3BIMGpDVFhFSmRVVEIrbjVXSVhzemwzdmZBSi90ZXlGK3R4?=
 =?utf-8?B?UnJ3L05HRmMwVjR6d1pjQTZvNE9TVkRvaU5IZG9yZEtoVFZLTmRtMVZVbmcz?=
 =?utf-8?B?ZjdRbzgrUHEvUEUrdDJqNERTU01GUTk0eFZaV2FGeGxMc2ROZERsZDNGc2J4?=
 =?utf-8?B?VS9BenpnVk0xejhMUDgybWtHNHYvWWxtMXdsN2dSbmYrZEtpMjdhWmkyR2VT?=
 =?utf-8?B?VUtNMTUrNGt6MzBYV21pZStoN2IzSHVKZXNQbDh3M0lLSDRPZE1MOVZ2dW9C?=
 =?utf-8?Q?ZsjMjdIADEmC9qZY/VNfklk2mMBsByCz6eMNaSQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26de2dfd-bf67-4d57-af87-08d8ccc68138
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 06:47:01.7571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8R4ECriWwkJvC6aoH5P+72kK0UbW9QkWXomCBLKqSliPCLAQ/gIKwFdqV1b8YzCQiohPLItwr5PQYPRy+K1bVcTzwLG3gn8AHJPTX3In28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2236
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2/9/21 2:45 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> D_FORTIFY_SOURCE=2 can not be used with out a -O<level> so right fix
> is to pass some opt level to compiler.

Copy that

//Hongxu

>
> On Mon, Feb 8, 2021 at 10:07 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> While compiling with gcc option -D_FORTIFY_SOURCE=2 (by setting
>> DEBUG_BUILD = '1' in local.conf), the do_configure failed:
>> ...
>> |configure: error: C preprocessor "i686-wrs-linux-gcc -E --sysroot=tmp-glibc/
>> work/core2-32-wrs-linux/ndpi/3.4-r0/recipe-sysroot  -m32 -march=core2
>> -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2
>> -Wformat -Wformat-security -Werror=format-security" fails sanity check
>> ...
>>
>> Drop AC_LANG_WERROR to workaround the failure
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../0001-configure-drop-AC_LANG_WERROR.patch  | 29 +++++++++++++++++++
>>   .../recipes-support/ntopng/ndpi_3.4.bb        |  1 +
>>   2 files changed, 30 insertions(+)
>>   create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch
>>
>> diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch b/meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch
>> new file mode 100644
>> index 000000000..b2a337ae6
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch
>> @@ -0,0 +1,29 @@
>> +From f3061fbc10aab9d0edec6964449af97658a993fc Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Mon, 8 Feb 2021 19:25:52 -0800
>> +Subject: [PATCH] configure: drop AC_LANG_WERROR
>> +
>> +To workaround configure failure with gcc option `-D_FORTIFY_SOURCE=2'
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + configure.seed | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/configure.seed b/configure.seed
>> +index 9d1185f1..f87889ed 100644
>> +--- a/configure.seed
>> ++++ b/configure.seed
>> +@@ -34,7 +34,6 @@ dnl>  AC_PROG_CC
>> +   AC_PROG_CXX
>> +   AC_PROG_CC_STDC
>> + fi
>> +-AC_LANG_WERROR
>> + AX_PTHREAD
>> +
>> + NDPI_VERSION_SHORT="@NDPI_VERSION_SHORT@"
>> +--
>> +2.29.2
>> +
>> diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
>> index 1e4153779..256e2ca54 100644
>> --- a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
>> +++ b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
>> @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
>>   SRCREV = "64929a75e0a7a60d864bd25a9fd97fdf9ac892a2"
>>   SRC_URI = "git://github.com/ntop/nDPI.git;branch=3.4-stable \
>>              file://0001-autogen.sh-not-generate-configure.patch \
>> +           file://0001-configure-drop-AC_LANG_WERROR.patch \
>>   "
>>
>>   S = "${WORKDIR}/git"
>> --
>> 2.29.2
>>

