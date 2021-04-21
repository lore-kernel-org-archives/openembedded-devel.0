Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.49])
 by mx.groups.io with SMTP id smtpd.web11.7275.1618975616639808614
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 20:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VTWrbFD0;
 spf=pass (domain: windriver.com, ip: 40.107.243.49, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZTntAutHPXSIoMUrlkGJNR06DM2OgQsKuJx4oSEjUqgj9U9tQpOSkhfA2McDMenId2nnG63cgYc0nzWVol8rsgxgQaOXAhEy5VueQc6rlak9iaz0fBBvV1fpuiR2D/JIU9o3zRItxh8+LzqylkjP7oKVfLUhC/UuTI8Qdfxn3qUM20AH5C8HoXlA38eMzJKP+ogRg7TzkQ9Xn1zYEwjUUci9x3m50PSqxKkBIZyblEFvwlye5V+dNZYuuTHWPGCXrbtH+0C807YDshpfuS1Q0Pvs4Agy/gCt4qUnBk1YL/MM+RLC9tNIbEB64QiLBhqm76qW+0ZQAVrLRLmeMSUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp79FjG+eyVZrlYJFB1fQZmIp11ji+nOb53Pt9p1IjI=;
 b=cBmNutDJnQPUf9UH7KHpDCYt1z0vmXL1sjvgo5Sj9ABU2bYXG9rFFe5J8bv6TKm1/CUyRdIE20DXwgc6T5U3Z+Z4/ZXeVACavzIjzNktFk7z8H/idf2QbbmTOeeUNXE0TQWAlC4o3Z0hAoiAUl4ipoENmNIRK5TmfI3LxbPNU2KwDLqh1KBYjXTvhiwzVtWJf2YpIzZUF+0BzHFEsTXZGr7wsKUF6PoEYtgfMDbixoh662AC7t1BH1UJsx6ROi+j5VNvWaXTxOMxj+YUgr4AL6tijIttdg8cb5PfZjT+1WKGi8WBUT6aAPXuJXt6AxdGG70aOk8xK/ASGSwkMJxwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp79FjG+eyVZrlYJFB1fQZmIp11ji+nOb53Pt9p1IjI=;
 b=VTWrbFD0AlWDlP7s+gD0N79oo/4rrMAc+VmTPMiFT5jHxXY5A4opZIHywLeDZ9FPni//NnQPdqZ28CNBRCw+iIldeETsrQ0yykyw34riVm8FZ5McA/aZDBRAPg3hfVJape6XJdBE2PYVhIrgmj83xvZWdHHh1MnaG9vsayL0yWM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3557.namprd11.prod.outlook.com (2603:10b6:a03:b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Wed, 21 Apr
 2021 03:26:54 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 03:26:54 +0000
Subject: Re: [oe][meta-oe][PATCH] tigervnc: upgrade to 1.11.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210420065508.16247-1-Qi.Chen@windriver.com>
 <fbdaa43b-b1e4-cffa-0a97-1da77679fc06@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <d1ae4467-6051-28ee-1ae7-688a3db87092@windriver.com>
Date: Wed, 21 Apr 2021 11:35:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <fbdaa43b-b1e4-cffa-0a97-1da77679fc06@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0056.apcprd04.prod.outlook.com
 (2603:1096:202:14::24) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR04CA0056.apcprd04.prod.outlook.com (2603:1096:202:14::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 03:26:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5337ff5-1260-4aeb-2e01-08d904754f39
X-MS-TrafficTypeDiagnostic: BYAPR11MB3557:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3557D01AA15D8C04225BBFB7ED479@BYAPR11MB3557.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O/vZhtyXlYv6AlkAltJmaIgYAHhkUqz2y5uEgUF03cLwpQmwFA2/cqw+B2ygCv5Hnwm6R6RpcNUg57MR1FR3j9qVVSO9BGF+V292Hx+lKa+RIoxsxGHcwaqFqEG8dOVmZYAC4/tRRHo5fupdgVdaImA7T8xEKMetBt47sklgF0aHXlTdKKdtzkN/ZovrWk4GYgEkDBi/LPaN7WyfWzD0lUHHkP52pipr0o+CkEiSDnlZjtI+5bNmZmPBn002a+Bg4bIDWfAdojdEidv2uUvdFGJqjuPon14UdPETB94cIU6YMqaXYJXtYSiiMgcWhyH6eXWAtsBfseYM4in6hFfSfoYGRJb5TLakuJnh5GWA/+RPVyCJhly3JPX/Je9hShsDsSL1lWQqicZIZ4hWQlusKiorYe3DwzvdDdSth0PO8qYVHlk+NDEBGiNmQLvKs3/Ni+uzrVSjDTsxJKEEelC3/04W8swZuMx4fBrBLtqfIztkn87PaM+rsJBD0yJjAgIBpXqWHfyO6pQlcWgA1ARM7FNodCqqf1tT/x1IjqGdcc4yytF5ujBBdrJwDP1ZCSVleuchCEYmvWmySn8NbQYp8/LblHstt/wsXcw37cVD/FYJITh+1arza49CZNWHQbftUXLFvixHrHjomgPiYmwVCNOnthZJWiE134cehSvkZATaZCl9CE300Ru7V9hhnZc/rsAKBOQ46cgdO2/GhhiYSzKb4hgD/AmpeAD+lk+DZ+/Bhz/dzNH0DKz1bPtWSWJQwqjDxbOHwxt6wF4OM9gAU9H3RMxZHKW+GppqjGx4YRpNP6b7KaOoquM1Ao/GsVgz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(396003)(376002)(346002)(6486002)(86362001)(38100700002)(31696002)(6706004)(38350700002)(8676002)(2906002)(31686004)(966005)(478600001)(6666004)(83380400001)(66946007)(66476007)(52116002)(53546011)(5660300002)(186003)(8936002)(16526019)(956004)(26005)(2616005)(36756003)(16576012)(66556008)(316002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VnZJdUVQNXVTZHRqMnoyaGs2T0gwVDJhN04zcGd3MmQwSEpzVWZsYnRoenNN?=
 =?utf-8?B?RU9qcWV1VVdCMm5uMFFsdmpXYjBvYUtVNlRubkFheUhDdzdYL2xuZE96OHZy?=
 =?utf-8?B?bjZmeFQzSXlDZ2pDT0Fvbzd0WERNMHVXNUxkQ01USHRMTzBuOC8yVzZXNEpO?=
 =?utf-8?B?bDUwWkJaTmg1UHQ4WDJqcUNYRXBnajAxVHo3eFRUclFDWVJlWmpFR1lVbG5Q?=
 =?utf-8?B?MEhuR3cyNXR6d1hGZzNCdHUxYkRYR2RKVmlScmlQakpEOFZjZHZzR0dybEtT?=
 =?utf-8?B?T25ibGxiT0dqWUErQm1JMmtqSUNoWTREOFA0MHh3bnM3OTgyQkZQWVBLTmNy?=
 =?utf-8?B?NFhqYjBuaHdncVRaSkJTSTVZVlExV1MzOGpVc2RBWU9iUEJtelpDSFdPdnFw?=
 =?utf-8?B?dDRhNnBxM1BWZFVEVGdqOE8xOTVrM29JT0NsOEUrSUV6NEVJZklubEE2VllV?=
 =?utf-8?B?OGNEOG54SkJJdWVVSU5zQ2cvZDBWeFFjZUVucjRtT3hndFpqWjdTZmZLL3pw?=
 =?utf-8?B?b0srcXVpQnZzT05RUXI0ZXZCcDYyNUlyRkZFRk16MC9la3RPOXU0RVRlM0Ev?=
 =?utf-8?B?WUtuTC9GWlFQeWZGRHdvMC85ZG5mNGo3TWtwVDBDVkpJZWVtSWF0WEpYTnFW?=
 =?utf-8?B?T0VNbVdabXVueG9MVTEyRHVkQ3VWWjFSUDZDQ2NGMHlWZTkrdDNkUWw4ZUVM?=
 =?utf-8?B?U2lURHNRaHBLdWN5TDFZWFRyK0dGcWZCaVk4bWR5VUo0REdaUU8zN2NQN3k0?=
 =?utf-8?B?UHhGMHN4N3pSUy9uYUw2ZmwrdEFSQ0lBMS9Yc1pTcnNqRFhSY053RXJhQTJa?=
 =?utf-8?B?WkRQaVJ6TC9tWllUaWdrZ2lBbDNRampIeDgwQy8vVXdSdFl4T25OdEVTaGJn?=
 =?utf-8?B?enh5QzJKZWtkNlgzM1hJdTd5ZVpCK2NIWUtJR1BkU3ozSXBPTjFkV3hIcUUx?=
 =?utf-8?B?NFhqTDh5K3FkV01MRWNJZUI0NGFvZk1LK3N3cWxzNmN1NWRWa1lVSHBuLzZK?=
 =?utf-8?B?Z2lqRXZJc0thUU5scERTbmlsbWE5Y0gwNE1VeTExL2YzeFNMRTdPVVhyd3BS?=
 =?utf-8?B?NW1BNjYxeFcrbExaeHdsOFBSYWE3OUJOVlFaM3dIa2pQVkF1VXNoaWdxK0NV?=
 =?utf-8?B?ZndLNHFqZ3ZjeFhvVGlXSnJtRDl1dUJXZnVLTFVXVERYWE5pS0hDNWFDOWY4?=
 =?utf-8?B?UkxGVGJsSDhjUmxSQ25FWDIxWWlodHNFVnlsQjByOEFPdGgwR2ZkTFlTTHFP?=
 =?utf-8?B?WUFpeFllNWNrMEJqQ3g2aFExYjhtc0x3bDMza3dqakxKVG9LbW9UZ3ZWaDBz?=
 =?utf-8?B?cGNTdUdSYWN2enZsemZLODZlbXlsS1QzYUNPKzNOK25MQ3lIenlTdEhlRHBy?=
 =?utf-8?B?dXY0RytyWnVKd2dFcXd4QVhTZVBiNmlFRDN2d1JmbTFPcFRYeFlYU1g3ZGsx?=
 =?utf-8?B?NW1paDBsSklpdk00QWQ3V3NlMmFPMERGSEtUR2gvaVJYWThBS0pMRG1nSHox?=
 =?utf-8?B?UWpmaEk5TGIwVWRCYmV0dXRJWi9FUFd5NHhjeVlrMXNaZU9rSzQ3dTVxT282?=
 =?utf-8?B?bm96Y3UxV2J2UG1Oc3dDWFdqRFJ5N0ljdTNVRFB0eWFXazhLYkIreGNNaGYw?=
 =?utf-8?B?Z3Q3VUFBRjVkSGxoNS9SYitKcVYxRzJweS9FRHR0ckVVMXhIRkp6YnFhNGlE?=
 =?utf-8?B?T1lpRVFMWEZMQjE5eVViakhJYXNqWmlLekduUXZ1Nmh6bmN5TTQzNEZaYWZz?=
 =?utf-8?Q?kENIVC+mlg5F0NU9oaqzlaS1qjdYitMjIW3e6X1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5337ff5-1260-4aeb-2e01-08d904754f39
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 03:26:54.1994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7Wdls+xR7akZALayn54qVpTUWSZ4LOsPRBPO1r74YaBbnVdy15/+6HDzvayX/D2re0HHSqybJ+UUBlqWAbr3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3557
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/20/2021 10:43 PM, Khem Raj wrote:
>
>
> On 4/19/21 11:55 PM, Chen Qi wrote:
>> Upgrade to latest stable version.
>>
>> The 1.10 branch is not maitained any more, it stops update in 2019.
>> The 1.11 branch has fix for CVE-2020-26117, which is a high risk CVE.
>> https://nvd.nist.gov/vuln/detail/CVE-2020-26117
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   ...002-do-not-build-tests-sub-directory.patch | 21 +++++------
>>   ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch | 36 +++++++------------
>>   ...{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} |  6 ++--
>>   3 files changed, 28 insertions(+), 35 deletions(-)
>>   rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb => 
>> tigervnc_1.11.0.bb} (96%)
>>
>> diff --git 
>> a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch 
>> b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch 
>>
>> index 4e875ba82..5a42e67d0 100644
>> --- 
>> a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
>> +++ 
>> b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
>> @@ -1,29 +1,30 @@
>> -From c3460d63f0b6cd50b9a64265f420f0439e12a1d5 Mon Sep 17 00:00:00 2001
>> -From: Hongxu Jia <hongxu.jia@windriver.com>
>> -Date: Tue, 25 Apr 2017 01:36:44 -0400
>> -Subject: [PATCH 2/4] do not build tests sub directory
>> +From 076d0e12a7be6cd2108e4ca0dcde1cb658918fa5 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Mon, 19 Apr 2021 23:02:45 -0700
>> +Subject: [PATCH] do not build tests sub directory
>>   -Upstream-Status: Inappropriate [oe specific]
>> +Upstream-Status: Inappropriate [OE Specific]
>>   -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +Signed-off-by: Hongxu Jia <Hongxu.Jia@windriver.com>
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>>    CMakeLists.txt | 3 ---
>>    1 file changed, 3 deletions(-)
>>     diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index 94ec2ef..fb72a00 100644
>> +index 7bf99441..bda80598 100644
>>   --- a/CMakeLists.txt
>>   +++ b/CMakeLists.txt
>> -@@ -300,9 +300,6 @@ if(BUILD_VIEWER)
>> +@@ -304,9 +304,6 @@ if(BUILD_VIEWER)
>>      add_subdirectory(media)
>>    endif()
>>      -add_subdirectory(tests)
>>   -
>>   -
>> - include(cmake/BuildPackages.cmake)
>> + add_subdirectory(release)
>>       # uninstall
>>   --
>> -2.7.4
>> +2.30.2
>>   diff --git 
>> a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch 
>> b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch 
>>
>> index 97b0a388a..5f14665b8 100644
>> --- 
>> a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
>> +++ 
>> b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
>> @@ -1,44 +1,34 @@
>> -From 9563b69640227da2220ee0c39077afb736cc96d1 Mon Sep 17 00:00:00 2001
>> -From: Hongxu Jia <hongxu.jia@windriver.com>
>> -Date: Thu, 20 Jul 2017 17:12:17 +0800
>> -Subject: [PATCH 4/4] tigervnc: add fPIC option to COMPILE_FLAGS
>> +From 7f8acd59bb2e54f9be25a98dd71534700a9e355a Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Mon, 19 Apr 2021 23:14:28 -0700
>> +Subject: [PATCH] tigervnc: add fPIC option to COMPILE_FLAGS
>>   -The static libraries in Xregion/network/rdr/rfb were linked by shared
>> +The static libraries in network/rdr/rfb were linked by shared
>>   library libvnc.so, so we should add fPIC option to COMPILE_FLAGS to 
>> fix
>>   relocation issue.
>>     Upstream-Status: Pending
>>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>> - common/Xregion/CMakeLists.txt | 1 +
>>    common/network/CMakeLists.txt | 1 +
>>    common/rdr/CMakeLists.txt     | 1 +
>>    common/rfb/CMakeLists.txt     | 1 +
>> - 4 files changed, 4 insertions(+)
>> + 3 files changed, 3 insertions(+)
>>   -diff --git a/common/Xregion/CMakeLists.txt 
>> b/common/Xregion/CMakeLists.txt
>> -index 40ca97e..9411328 100644
>> ---- a/common/Xregion/CMakeLists.txt
>> -+++ b/common/Xregion/CMakeLists.txt
>> -@@ -3,4 +3,5 @@ add_library(Xregion STATIC
>> -
>> - if(UNIX)
>> -   libtool_create_control_file(Xregion)
>> -+  set_target_properties(Xregion PROPERTIES COMPILE_FLAGS -fPIC)
>> - endif()
>>   diff --git a/common/network/CMakeLists.txt 
>> b/common/network/CMakeLists.txt
>> -index b624c8e..6c06ec9 100644
>> +index d00ca452..e84e0290 100644
>>   --- a/common/network/CMakeLists.txt
>>   +++ b/common/network/CMakeLists.txt
>> -@@ -9,4 +9,5 @@ endif()
>> +@@ -16,4 +16,5 @@ endif()
>>       if(UNIX)
>>      libtool_create_control_file(network)
>>   +  set_target_properties(network PROPERTIES COMPILE_FLAGS -fPIC)
>>    endif()
>>   diff --git a/common/rdr/CMakeLists.txt b/common/rdr/CMakeLists.txt
>> -index 989ba2f..20f6489 100644
>> +index 989ba2f4..20f6489d 100644
>>   --- a/common/rdr/CMakeLists.txt
>>   +++ b/common/rdr/CMakeLists.txt
>>   @@ -27,4 +27,5 @@ target_link_libraries(rdr ${RDR_LIBRARIES})
>> @@ -48,15 +38,15 @@ index 989ba2f..20f6489 100644
>>   +  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
>>    endif()
>>   diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
>> -index 5047e5e..88838ab 100644
>> +index fc5a37bf..7f5ce131 100644
>>   --- a/common/rfb/CMakeLists.txt
>>   +++ b/common/rfb/CMakeLists.txt
>> -@@ -98,4 +98,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
>> +@@ -99,4 +99,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
>>       if(UNIX)
>>      libtool_create_control_file(rfb)
>>   +  set_target_properties(rfb PROPERTIES COMPILE_FLAGS -fPIC)
>>    endif()
>>   --
>> -2.7.4
>> +2.30.2
>>   diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb 
>> b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
>> similarity index 96%
>> rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
>> rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
>> index f97c2b2d6..1e7160aea 100644
>> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
>> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
>> @@ -15,9 +15,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
>>   inherit autotools cmake
>>   B = "${S}"
>>   -SRCREV = "4739493b635372bd40a34640a719f79fa90e4dba"
>> +SRCREV = "540bfc3278e396321124d4b18a798ac2bc18b6ca"
>>   -SRC_URI = 
>> "git://github.com/TigerVNC/tigervnc.git;branch=1.10-branch \
>> +SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch \
>>              file://0002-do-not-build-tests-sub-directory.patch \
>> file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
>> file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
>> @@ -83,6 +83,8 @@ EXTRA_OECONF = "--disable-xorg --disable-xnest 
>> --disable-xvfb --disable-dmx \
>>           --disable-xwayland \
>>   "
>>   +EXTRA_OECMAKE += "-DINSTALL_SYSTEMD_UNITS=OFF"
>> +
>
> I wonder if this should be made conditional on systemd in 
> DISTRO_FEATURES ?
>
>

Got it. I'll send out V2.

Best Regards,
Chen Qi

>>   do_configure_append () {
>>       olddir=`pwd`
>>       cd ${XSERVER_SOURCE_DIR}
>>
>>
>>
>> 
>>
>

