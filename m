Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.62])
 by mx.groups.io with SMTP id smtpd.web08.1900.1612555002498437963
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 11:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TasHnhHX;
 spf=pass (domain: windriver.com, ip: 40.107.93.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlkWAUwSb3pgfWb+2/bnVxvN//8NvWfVyBjvheIwYBn0B5DZCeAmyVojrMh/8elKdmeuFW2akmuG9Ctb01QhRsSC9Bb+9F3xy3uCzEt7NBsm8HDMx2vyQds07fVkID568905pUPauPnUUNVFXCy4vQBL+jUIOBuzj/y1u5pycrO7hStcZkIssYshDfKrJGIGS8NIvG92cZZFisAZ+yzL0afCvf+ShcZhSLzE46PHqCeieDlcPD526FMOImeU5MWdb4+kf/tetnemwQ5dI/4EAREO9SgrkEPi5YvOL+8dT0DeexX9riXTZtPyn7+VaP4iPlV4unUKqip9d2cjk9DgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXjV/PIEQRBtiJjjWwHNscdhhFNm5YjG9CWnzlqifRs=;
 b=aTwGYJ5xlSrhSHpGBNQD8SFQMOgAlTUGiITnPFB+qalLu7KnQanokpSk1AJXjfERGhgTb/9kByVVo+027bZgptQba73EhP8V0nrpN/wlTYMK9fBqK8MXevisGCFP75q1V23Zjy4NoAL0yVB3h6ppgk692tuROyH2t/4qbuaO/jlxxnpq+f586TJ0bputdB70Mi+2ppUzwAED0iLtPJZskxQkSlS+jD1TidiszW1ohZOjHezpoyZIgvsj5s0sXGY+uE84lM7xiT4Bj5JbXb6ANn9k7UiTRHQPwHD/dEqJzQLeSbAQZ821qa4ihAc2a8eM08jNAMTKdALB+hv7sFahkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXjV/PIEQRBtiJjjWwHNscdhhFNm5YjG9CWnzlqifRs=;
 b=TasHnhHXNxvD3wfHquUcvOoWQvDt23x4QeQYEavv6di0LGi1vaE+60mr8a1PUkdCRm6RkUr8nRX7H7peHgCn5lpcXnigCjqenZhTcGFw1K2pAN/ZKhOLgZVHliyiKH5C7N8EhTamQbgk1kLRkhw68EaS5QUj2Ff30XLEp3rE/NQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 19:56:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 19:56:40 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-h5py: Upgrade 2.10.0 -> 3.1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
 <20210203153822.25077-5-leon.anavi@konsulko.com>
 <705cccd4-b386-75b7-374d-5f89484df713@windriver.com>
 <CAMKF1soqp025hB2_m9eGiJ0832VPokhPxHb-iCV8vX_HVaKSdw@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c2d93155-0eb1-063c-80a5-d51d03bb1c03@windriver.com>
Date: Fri, 5 Feb 2021 14:56:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <CAMKF1soqp025hB2_m9eGiJ0832VPokhPxHb-iCV8vX_HVaKSdw@mail.gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0270.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0270.namprd13.prod.outlook.com (2603:10b6:208:2ba::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 19:56:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f1ea552-7fb9-4fa5-01de-08d8ca102724
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4814:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48148634FD0974D4B66A49029FB29@SJ0PR11MB4814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KuLR41BLwbiQkHljqLaxfAiN3tGVWGPcqDisshiXbf3xlBN3OvXOo7K0Apt1KVDMcwCqBLrBuE/FHZmq6/nFPtMzKZrlkb9Q2A5QA40zpxDZutnTe+QDA0JrVDAUbm7V4QajnWTXO92wSc1xFJyQvG6ZWCeBSPyAOSTatNlcsX7+WWAkTU8obcX6u4SUc0KQpiO3rujrqlpLPuVAtyNlRp7uNowwDL29VqZc76RPWwsDamf/9rfhJtY6a8QDJAHYyQjPv/P1+SpAi6J0txQoRNBxiV18gEevbHSVi/vUx0kebU/mBOQtV96rTRg9FrBEoYZ0WhREUUJvFMHSBBQnv+Crl+YAxiZrmLfPZ6BNH2jRh5/tT6yipFEHHRFwB/dJGYX0TlrX9q5whkIadpvQ8752g/tddTre/NUzOjoD2oGyORjv+UKzA4opPNoPgYMlAnhIbrHwd+/gfqJ1jJ+WzxI/CnzHiBeXcKn5pFAbOhOg+bEQ5Jpv7p+10oQ+4khl0ruzOp61npVCu/+XN4vuRRx+Cqa7uwLxifMkGkB4KCk7RAoZr+hRnhUqBYLpsWkObf09gXngnCa+vn/i+Vz74oyxOv53+pJhdgOZjBOKjH5uuTSEUG8/ojbM9oFTtwNcugINdt1I9Czq2Y1QWJcAoCqBwX9sEFPFB8YZH3Mzc3RkViWJhGn6CxcwqNxxS2jz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(136003)(376002)(396003)(5660300002)(6916009)(86362001)(83380400001)(30864003)(52116002)(166002)(8936002)(4326008)(66946007)(33964004)(8676002)(36756003)(31696002)(31686004)(316002)(186003)(16576012)(16526019)(6486002)(956004)(2616005)(54906003)(2906002)(966005)(26005)(66556008)(478600001)(53546011)(66476007)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cW5NREpoL1Y3V3J3azcrN3lvYW10YTYzMWkvZTdVQ0lBZE9iSHIwUzAyWERK?=
 =?utf-8?B?SDI5R2pWQmFOM2VyVE40L1VSdlZsUnBVTkVXVDZ2REJSYTJhT2c2QUhJL3A3?=
 =?utf-8?B?MENzTDcwREgvclo5K09OWEVSamlGZVY3NEt1MGNTS0pRVHkvZWVEeUNtMjFw?=
 =?utf-8?B?SnVDVzhsdmNqM3NZbW1sK00xMndZYjlDTEZsOFpUcDZ1b3pzTGpYWlNnVmMy?=
 =?utf-8?B?ekhpNDBJVGRpNHNhTXdMdUNLT1pqb0kwRjNoMC82M1pBcTVYTmpiWXg1QVpR?=
 =?utf-8?B?algzL0JwazdabEF4NEtjV05hL3h3cGtYZ2JERUs5TCtMQ1NQcGlEYkhkdXpt?=
 =?utf-8?B?NjV0NW1uUExMdmFPMVI4cWlKMkFtbVQ5ZWpIVmIwdS9MRDZoQTdOcXBkaENq?=
 =?utf-8?B?eU1KMkNaTTZKN3YvbnZDMGdET0VnNytTaDMrMkY4TVBoZVJiVDk2cm5wbHFk?=
 =?utf-8?B?VVUvMFBzODUxRm1sYkQ3eEluaytMYVF2V0lpSFVIckJsQkZPeGgxNGRmVHp4?=
 =?utf-8?B?Tlo4V2E4MHZuTGYvcmFacmlwREE3MEdIdGVQQTVxbjArVi9ESDdBQ1UzNG1F?=
 =?utf-8?B?aHdsRnNWL0F4bHRnNlFHM1MyZVJVRk8yQWN3U3lIbmtBRlZCVldKOEJvUmVP?=
 =?utf-8?B?RjgyU1dHVjJpLzg2Y0xQeElZTkVWK00zaVB1MWt5QlY0Q1ozSGZlS25SZHNx?=
 =?utf-8?B?cDVmNFBvK2dZd3FVbitiekFaVEhLNHgrVkxIWCtBK0R6NmtiS01kbTRtY2M3?=
 =?utf-8?B?cThIdnBSQUpqRDZiUmlEMy9IcHlqK1NrZnZhT01mcUdoMktDLzhxT014K0Ez?=
 =?utf-8?B?SE9NdGVCK0RUUWNxaGYxbmVqa05PNTFuMyt0cjRtL2piVUhlSG5Tc2kxQmFm?=
 =?utf-8?B?UU9lbzA0SW5FdXMrSkpmTmJNcmd4RHBVbGd4cGpOL2tNS3RXZVdkQ2VjUHJU?=
 =?utf-8?B?cHozVWpGRWFFamM1VUh4WlFlQWdwc09BRDRjUkVVOUtiNk1Qd1BHakZWR1BD?=
 =?utf-8?B?NHhTSFpGY29TcEQ3VVhYWFVkM3EzOWZPQ0ViVWpoWDRuQ1cwZGpmdFNhU1Yv?=
 =?utf-8?B?ODRCQVlia1E2RkM4WkRSQmFsVUNlZXdhNGxTSDhXSTIydUkra2dRNzhiMEdJ?=
 =?utf-8?B?QW1aNHpBZmNJSGJaU203MDV6QVdBaXN1ZUQzWVRtY3k2YS9QeTM5eDQxTmt5?=
 =?utf-8?B?MGo4R3R1cjdGZGtjT1VOZWNyak9ldndRb2FQWFA0aHhkcXNGZzd4cHFsdzFN?=
 =?utf-8?B?a2QvU1JwSVNoeGNtYWtWajZDL1JnbDFxN2V5dHBjMXdqUjBBRERsbndXS0gv?=
 =?utf-8?B?NVlIZ1MvWXVPaytYVVlZZE5RMW9pc2hHQmUrVm9TUFB5Rmx2a3ZudUJvTnpm?=
 =?utf-8?B?Z2JRcHJrL3d5Qk4rZ1U2Z2NFcmh1and1bTZvbzlzNjlnYk92QkxBd2YwTVho?=
 =?utf-8?B?Rk9qSFhiWkoySkYxc0wyanI1VWxiRzRJR1pqUUI5SmxCYlhZTWhnU3JuU0Fs?=
 =?utf-8?B?K2dUTnV6cGN2cVl5Y2FEU0h2SDJNZ3pkNFNoK2loSnhlVmxmUjRaTUZWQjJT?=
 =?utf-8?B?MVVKdXZubXlaMWNnQjNoL3YxVkVrU0IyQWVpQ1hZME1vdDBjSGprbG1URlR3?=
 =?utf-8?B?WlFPYjMxRTd0YmVESHlwWE1zeldLaFhWNHEvVHdHUGNUSVc0eS95UW9aZjNW?=
 =?utf-8?B?TUtTRVhDSUFVZlVCQWZDV21Hb0VPY0VEQURLSHpMOU1qNVRZNERVUVpJRVdK?=
 =?utf-8?B?TTRvamMzbStOL0pTMmdwZDBqZ2RnUkZNY2RkcUhJL3hsaC9JRVh5L1NvdEow?=
 =?utf-8?B?WHJSRWlsRUx5SlRsOVQwQT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1ea552-7fb9-4fa5-01de-08d8ca102724
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 19:56:40.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HDY5+SaYQsJT2tq1un8cYnDcaZYoP+7LzY6+25JOXv2tnixoGU8sk29Tr7R396wrNlkF5DBb672mnT/4GJcyTOdrkIGI5duttKCK8eULxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
Content-Type: multipart/alternative;
 boundary="------------9780B07380F1A69816144737"
Content-Language: en-US

--------------9780B07380F1A69816144737
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-05 1:22 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Fri, Feb 5, 2021 at 6:03 AM Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
>>
>> On 2021-02-03 10:38 a.m., Leon Anavi wrote:
>>
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> Upgrade to release 3.1.0:
>>
>> - Fix using bytes as names for :meth:`~Group.create_dataset` and
>> ￼  :meth:`~Group.create_virtual_dataset`.
>> - Fix writing data as a list to a dataset with a sub-array data
>>    type.
>> - Preserve endianess in Cython dataset Reader
>> - If pytest is missing pytest-mpi then it will now fail
>>    immediately with a clear warning message
>> - Fix a test which was failing on big-endian systems
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>
>> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
> hey Trevor can you see the musl failure I am seeing ?
> we should hold it until thats fixed.
Alright, let's hold off then. Need to add musl builds to my pipeline...
>
>> ---
>>   .../0001-cross-compiling-support.patch        | 47 -------------------
>>   .../0001-setup.py-Fix-numpy-version.patch     | 30 ++++++++++++
>>   ...1-setup_build.py-avoid-absolute-path.patch | 13 ++---
>>   ...3-h5py_2.10.0.bb => python3-h5py_3.1.0.bb} |  5 +-
>>   4 files changed, 39 insertions(+), 56 deletions(-)
>>   delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
>>   create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
>>   rename meta-python/recipes-devtools/python/{python3-h5py_2.10.0.bb => python3-h5py_3.1.0.bb} (78%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
>> deleted file mode 100644
>> index 8c0b91432..000000000
>> --- a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
>> +++ /dev/null
>> @@ -1,47 +0,0 @@
>> -From 364fd0906efa349ea44a761820408dcf6b2b8726 Mon Sep 17 00:00:00 2001
>> -From: Hongxu Jia <hongxu.jia@windriver.com>
>> -Date: Tue, 29 Jan 2019 17:08:32 +0800
>> -Subject: [PATCH] cross compiling support
>> -
>> -Remove useless dirs
>> -
>> -Upstream-Status: Inappropriate [oe specific]
>> -
>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> -Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ----
>> - setup_build.py     | 4 ----
>> - setup_configure.py | 2 +-
>> - 2 files changed, 1 insertion(+), 5 deletions(-)
>> -
>> -diff --git a/setup_build.py b/setup_build.py
>> -index c0e9a28c..ffd3bef7 100644
>> ---- a/setup_build.py
>> -+++ b/setup_build.py
>> -@@ -55,10 +55,6 @@ if sys.platform.startswith('win'):
>> -         ('_HDF5USEDLL_', None),
>> -         ('H5_BUILT_AS_DYNAMIC_LIB', None)
>> -     ])
>> --else:
>> --    FALLBACK_PATHS['include_dirs'].extend(['/opt/local/include', '/usr/local/include'])
>> --    FALLBACK_PATHS['library_dirs'].extend(['/opt/local/lib', '/usr/local/lib'])
>> --
>> -
>> - class h5py_build_ext(build_ext):
>> -
>> -diff --git a/setup_configure.py b/setup_configure.py
>> -index 5576775e..75f4141e 100644
>> ---- a/setup_configure.py
>> -+++ b/setup_configure.py
>> -@@ -206,7 +206,7 @@ def autodetect_version(hdf5_dir=None):
>> -         default_path = 'libhdf5.so'
>> -         regexp = re.compile(r'^libhdf5.so')
>> -
>> --    libdirs = ['/usr/local/lib', '/opt/local/lib']
>> -+    libdirs = []
>> -     try:
>> -         if pkgconfig.exists("hdf5"):
>> -             libdirs.extend(pkgconfig.parse("hdf5")['library_dirs'])
>> ---
>> -2.17.1
>> -
>> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
>> new file mode 100644
>> index 000000000..57037a91a
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
>> @@ -0,0 +1,30 @@
>> +From 7c88e3762c2381a507dc86b90152216abe79a804 Mon Sep 17 00:00:00 2001
>> +From: Leon Anavi <leon.anavi@konsulko.com>
>> +Date: Wed, 3 Feb 2021 17:23:29 +0200
>> +Subject: [PATCH] setup.py: Fix numpy version
>> +
>> +Fix numpy version to ensure bitbake will find the pip package.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> +---
>> + setup.py | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/setup.py b/setup.py
>> +index 7dbe5835..8fc15bc8 100755
>> +--- a/setup.py
>> ++++ b/setup.py
>> +@@ -30,7 +30,7 @@ NUMPY_MIN_VERSIONS = [
>> +     ('1.12',   "=='3.6'"),
>> +     ('1.14.5', "=='3.7'"),
>> +     ('1.17.5', "=='3.8'"),
>> +-    ('1.19.3', ">='3.9'"),
>> ++    ('1.19.5', ">='3.9'"),
>> + ]
>> +
>> + # these are required to use h5py
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
>> index da95ee7af..05c126e54 100644
>> --- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
>> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
>> @@ -1,6 +1,6 @@
>> -From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
>> +From 86a2c95941a3854fda763037a16b5b22ec6f15e9 Mon Sep 17 00:00:00 2001
>>   From: Mingli Yu <mingli.yu@windriver.com>
>> -Date: Fri, 29 Jan 2021 02:33:06 +0000
>> +Date: Thu, 28 Jan 2021 18:44:10 -0800
>>   Subject: [PATCH] setup_build.py: avoid absolute path
>>
>>   Prevent absolute path from ending up in the egg-info SOURCES.txt.
>> @@ -8,15 +8,16 @@ Prevent absolute path from ending up in the egg-info SOURCES.txt.
>>   Upstream-Status: Submitted [https://github.com/h5py/h5py/pull/1803]
>>
>>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>   ---
>>    setup_build.py | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>   diff --git a/setup_build.py b/setup_build.py
>> -index ffd3bef..fb196c0 100644
>> +index 3c7c7adb..d824bdda 100644
>>   --- a/setup_build.py
>>   +++ b/setup_build.py
>> -@@ -20,7 +20,7 @@ import api_gen
>> +@@ -21,7 +21,7 @@ from setup_configure import BuildConfig
>>
>>
>>    def localpath(*args):
>> @@ -24,7 +25,7 @@ index ffd3bef..fb196c0 100644
>>   +    return op.join(*args)
>>
>>
>> - MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
>> + MODULES = ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
>>   --
>> -2.29.2
>> +2.17.1
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
>> similarity index 78%
>> rename from meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
>> rename to meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
>> index b812b323f..03ae4c9db 100644
>> --- a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
>> @@ -4,12 +4,11 @@ SECTION = "devel/python"
>>   LICENSE = "BSD-3-Clause"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
>>
>> -SRC_URI[md5sum] = "504b595237409ab766fbbe568e60a080"
>> -SRC_URI[sha256sum] = "84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6bf512d"
>> +SRC_URI[sha256sum] = "1e2516f190652beedcb8c7acfa1c6fa92d99b42331cbef5e5c7ec2d65b0fc3c2"
>>
>>   SRC_URI_append = " \
>> -           file://0001-cross-compiling-support.patch \
>>              file://0001-setup_build.py-avoid-absolute-path.patch \
>> +           file://0001-setup.py-Fix-numpy-version.patch \
>>             "
>>
>>   inherit pypi setuptools3
>> --
>> 2.17.1
>>
>>
>>
>>
>>
>>
>>
>>
>> 
>>

--------------9780B07380F1A69816144737
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-05 1:22 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMKF1soqp025hB2_m9eGiJ0832VPokhPxHb-iCV8vX_HVaKSdw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

On Fri, Feb 5, 2021 at 6:03 AM Trevor Gamblin
<a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 2021-02-03 10:38 a.m., Leon Anavi wrote:

[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.1.0:

- Fix using bytes as names for :meth:`~Group.create_dataset` and
￼  :meth:`~Group.create_virtual_dataset`.
- Fix writing data as a list to a dataset with a sub-array data
  type.
- Preserve endianess in Cython dataset Reader
- If pytest is missing pytest-mpi then it will now fail
  immediately with a clear warning message
- Fix a test which was failing on big-endian systems

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>

Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
hey Trevor can you see the musl failure I am seeing ?
we should hold it until thats fixed.</pre>
    </blockquote>
    Alright, let's hold off then. Need to add musl builds to my
    pipeline...<br>
    <blockquote type="cite" cite="mid:CAMKF1soqp025hB2_m9eGiJ0832VPokhPxHb-iCV8vX_HVaKSdw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 .../0001-cross-compiling-support.patch        | 47 -------------------
 .../0001-setup.py-Fix-numpy-version.patch     | 30 ++++++++++++
 ...1-setup_build.py-avoid-absolute-path.patch | 13 ++---
 ...3-h5py_2.10.0.bb =&gt; python3-h5py_3.1.0.bb} |  5 +-
 4 files changed, 39 insertions(+), 56 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
 rename meta-python/recipes-devtools/python/{python3-h5py_2.10.0.bb =&gt; python3-h5py_3.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
deleted file mode 100644
index 8c0b91432..000000000
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 364fd0906efa349ea44a761820408dcf6b2b8726 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
-Date: Tue, 29 Jan 2019 17:08:32 +0800
-Subject: [PATCH] cross compiling support
-
-Remove useless dirs
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
-Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
----
- setup_build.py     | 4 ----
- setup_configure.py | 2 +-
- 2 files changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/setup_build.py b/setup_build.py
-index c0e9a28c..ffd3bef7 100644
---- a/setup_build.py
-+++ b/setup_build.py
-@@ -55,10 +55,6 @@ if sys.platform.startswith('win'):
-         ('_HDF5USEDLL_', None),
-         ('H5_BUILT_AS_DYNAMIC_LIB', None)
-     ])
--else:
--    FALLBACK_PATHS['include_dirs'].extend(['/opt/local/include', '/usr/local/include'])
--    FALLBACK_PATHS['library_dirs'].extend(['/opt/local/lib', '/usr/local/lib'])
--
-
- class h5py_build_ext(build_ext):
-
-diff --git a/setup_configure.py b/setup_configure.py
-index 5576775e..75f4141e 100644
---- a/setup_configure.py
-+++ b/setup_configure.py
-@@ -206,7 +206,7 @@ def autodetect_version(hdf5_dir=None):
-         default_path = 'libhdf5.so'
-         regexp = re.compile(r'^libhdf5.so')
-
--    libdirs = ['/usr/local/lib', '/opt/local/lib']
-+    libdirs = []
-     try:
-         if pkgconfig.exists(&quot;hdf5&quot;):
-             libdirs.extend(pkgconfig.parse(&quot;hdf5&quot;)['library_dirs'])
---
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
new file mode 100644
index 000000000..57037a91a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
@@ -0,0 +1,30 @@
+From 7c88e3762c2381a507dc86b90152216abe79a804 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+Date: Wed, 3 Feb 2021 17:23:29 +0200
+Subject: [PATCH] setup.py: Fix numpy version
+
+Fix numpy version to ensure bitbake will find the pip package.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7dbe5835..8fc15bc8 100755
+--- a/setup.py
++++ b/setup.py
+@@ -30,7 +30,7 @@ NUMPY_MIN_VERSIONS = [
+     ('1.12',   &quot;=='3.6'&quot;),
+     ('1.14.5', &quot;=='3.7'&quot;),
+     ('1.17.5', &quot;=='3.8'&quot;),
+-    ('1.19.3', &quot;&gt;='3.9'&quot;),
++    ('1.19.5', &quot;&gt;='3.9'&quot;),
+ ]
+
+ # these are required to use h5py
+--
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
index da95ee7af..05c126e54 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -1,6 +1,6 @@
-From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
+From 86a2c95941a3854fda763037a16b5b22ec6f15e9 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
-Date: Fri, 29 Jan 2021 02:33:06 +0000
+Date: Thu, 28 Jan 2021 18:44:10 -0800
 Subject: [PATCH] setup_build.py: avoid absolute path

 Prevent absolute path from ending up in the egg-info SOURCES.txt.
@@ -8,15 +8,16 @@ Prevent absolute path from ending up in the egg-info SOURCES.txt.
 Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/h5py/h5py/pull/1803">https://github.com/h5py/h5py/pull/1803</a>]

 Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
  setup_build.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/setup_build.py b/setup_build.py
-index ffd3bef..fb196c0 100644
+index 3c7c7adb..d824bdda 100644
 --- a/setup_build.py
 +++ b/setup_build.py
-@@ -20,7 +20,7 @@ import api_gen
+@@ -21,7 +21,7 @@ from setup_configure import BuildConfig


  def localpath(*args):
@@ -24,7 +25,7 @@ index ffd3bef..fb196c0 100644
 +    return op.join(*args)


- MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
+ MODULES = ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
 --
-2.29.2
+2.17.1

diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
index b812b323f..03ae4c9db 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
@@ -4,12 +4,11 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=113251d71fb0384712c719b567261c5c">&quot;file://LICENSE;md5=113251d71fb0384712c719b567261c5c&quot;</a>

-SRC_URI[md5sum] = &quot;504b595237409ab766fbbe568e60a080&quot;
-SRC_URI[sha256sum] = &quot;84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6bf512d&quot;
+SRC_URI[sha256sum] = &quot;1e2516f190652beedcb8c7acfa1c6fa92d99b42331cbef5e5c7ec2d65b0fc3c2&quot;

 SRC_URI_append = &quot; \
-           <a class="moz-txt-link-freetext" href="file://0001-cross-compiling-support.patch">file://0001-cross-compiling-support.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-setup_build.py-avoid-absolute-path.patch">file://0001-setup_build.py-avoid-absolute-path.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-setup.py-Fix-numpy-version.patch">file://0001-setup.py-Fix-numpy-version.patch</a> \
           &quot;

 inherit pypi setuptools3
--
2.17.1







</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------9780B07380F1A69816144737--
