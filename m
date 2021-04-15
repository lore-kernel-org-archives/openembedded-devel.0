Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.52])
 by mx.groups.io with SMTP id smtpd.web11.6545.1618491800045258402
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 06:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fiJTNI8I;
 spf=pass (domain: windriver.com, ip: 40.107.237.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5vuDlxy0nCdcpdeFkDZz0rdzL7TJIXFZVDvPlPTGYNWOPgQZDlfE6gWW1EPFmnjhfOK8HJYauhAAf02h0H/t/Ffk4/9ByJoJZBpjUW/m8HOH2vVqiCxMTs0g1bUbI6zSRIxKOtnLSajSXDVkNI5xq1WfiYdBbglo2ijG4NPz+s+G71qVuVD3srwM7FiKcbveDgpmB1AJ9izlAdJNO9SgfHLxWXGa4wgNQNlpZyoIP7MP4+sUt4QWtktRENFm9CBaC/zgfhA9SqQHSXo47zECG6qR20RseSwWvAntIJXdehZsZEb1CGjryezB15R/7DZUkWLWstosbtaoHmdGPBM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th8KZjmSgxOCA6dL7fVNtCqk1OlzycvJdq6AmbbTEkg=;
 b=ROdNBYNwKEGanhFQcr1H9EsACVjRGRFzefIUNtNaqBVVOdVRjGG2yYS3dF0zEHShb7h5HKXakk9+5+/GifftmZExITGs0MURXq9KeKddZlvWG2/Sd+jLAoJs51q9Lp+aedif/MxKZbFntwy7T4fDcNlSSOkWuTCC9291C3zzN2u0N3AXz+PusPyWYgitXaHYmhafR4pX9npNC8bqemytPj6fLIs5hT5WNJaj0IkYacsrzdHk+wQc+yMlccgdJe9YMKCq9I5D+o2MKFw0FufaoFpZxMgxfUifaJjm0JblURnLY2UP30lN7puhximYbgwgNy7zjySLmnAxcqLhb+oE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th8KZjmSgxOCA6dL7fVNtCqk1OlzycvJdq6AmbbTEkg=;
 b=fiJTNI8IaviOedcC1QvrCis9oyB/TYg0//RYqOq/swL/p9kv1Qp9m8kivfiu7Ct5FpjZcbzMnXGocCkjCLkS7ej76TVhnra01KnnLKQkXWInAuyyBMtTtlGKbr+mYjGLV6/FhZ1BgHtMrupTzDd3YR11s1rXORmeiRSWYZEmWWY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2630.namprd11.prod.outlook.com (2603:10b6:a02:c2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 13:03:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 13:03:16 +0000
Subject: Re: [meta-networking][PATCH] open-vm-tools: upgrade 11.0.1 -> 11.2.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210414175000.2167404-1-trevor.gamblin@windriver.com>
 <CAMKF1sq2WbbJHgfyY6iGLFcHeVwnd9tALcnFKM3sNDCgmpuBjA@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <270b6de3-b050-398b-f4c6-58cac3e79972@windriver.com>
Date: Thu, 15 Apr 2021 09:03:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <CAMKF1sq2WbbJHgfyY6iGLFcHeVwnd9tALcnFKM3sNDCgmpuBjA@mail.gmail.com>
X-Originating-IP: [2607:fea8:c29d:d7c0::12bc]
X-ClientProxiedBy: BL1PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::12bc] (2607:fea8:c29d:d7c0::12bc) by BL1PR13CA0221.namprd13.prod.outlook.com (2603:10b6:208:2bf::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.8 via Frontend Transport; Thu, 15 Apr 2021 13:03:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41d029f6-4b32-4bbf-799b-08d9000ed4ec
X-MS-TrafficTypeDiagnostic: BYAPR11MB2630:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2630104C9A319B7E10F1D9999F4D9@BYAPR11MB2630.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pkm9O3wk5qENx7rxniog3sLVjfsNBRPNSpXbdoeH1NX+WEcQRTiRUObe/sSZlfrjrHxXQAZUqL1CJEQRn6icPxErX231FOZxbg1IzomYGjs6j/M1+K4W4rZdqzd/wOD1qb916Oqax/CIzbRLk8nitCwcsAeJ76Sd5DBODhtIqQFX1y03TD4F1tCAWUqyBUnRS9WGOcecTbUhRjdmlOKkQdcxquZpNbntn7dMGI/5cxhX77Rzr3AgrUh7EbHWftXdoBnnKxvmfz4DGB5J/BAhW10MmjT+6V/ot4vApufrSGDnwxOVQO9ijV6ktnPaAiZ5MS/6HtaxA9DHtNdBsnMevTjk8H5241TJ11d3+e+wuT8bBBJ4DkB6fSpjPvDUVJ03tfZpgAnbpsuruyKocSYRTC11Zr4Yb2q24NToTBJQUiK6zh+4QfAfYqYWYMbLVC/SdHvxyrySRYX4PyT5iL7KBCDOK+wlTXZV2hSsYJI9xe1yITl/B7ODl10elAzpfdvD/nx4lNLJriYf9sSGcqwTFO8v6mlerjAsf9SUb55hXMf6Dth5qIZM4mywu7N7mQplDQJN4PYBqjhNx0sAM4K+qrlABpe4ihqbwyOyszt9nvO0LkEPdowRf2733Vs/E8EF0Psg9LcHW1kU9Wn+qAqKulRuq6BA/VVjlHklHMv6L33SlUvRENKnH/FX+5UKSeqbcAQa86FWevpduUQxTZOD0hrT8cSSJIafc2ECaSW+Ss8Qdl3FUujW5xesnt9EvrN2t4EHPni4ZFIlB/u8oQ713Is3rPtHaDsWA5aAcCglCTdLHl3PZpPDTYQkCTS9HGYaCjlX2iFW0sN9RMD+nqTw8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(39850400004)(376002)(4326008)(66556008)(186003)(66476007)(478600001)(6916009)(2906002)(19627235002)(16526019)(8936002)(86362001)(31686004)(966005)(36756003)(5660300002)(66946007)(53546011)(6486002)(30864003)(31696002)(83380400001)(2616005)(316002)(16799955002)(38100700002)(15188155005)(8676002)(44832011)(46800400005)(2004002)(43740500002)(45980500001)(562404015)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QjBPRThwUmZKaElUV1J6NFllVVZtMy85UjhUOFJhRmRxUjE5WlFkZXFWSTB0?=
 =?utf-8?B?RjVwbEJZVm5rVXdMOXRXVkx2SE0wQXNrdDh4V3BCTjdVNXc0Tmd3Qmp2TUJQ?=
 =?utf-8?B?dktvUHpPQlhWcHJHVDJVc0xnUGlEUHhnS1d2UGNrY2orbEZ5a2MvcnBaQjBm?=
 =?utf-8?B?d2lydFlLVGZLYnlGQTQ2M2JGUHgzYU1lZ0R3NlJRMjk3V1ZNS3JwOXZBZ0w4?=
 =?utf-8?B?cjFGTFk2OHJkRnY5MkU4blVFWUlmSy9JdGFaaHZ3S1NSYkduU0pOMGhzNGJU?=
 =?utf-8?B?VCtDWTFkUlRudzREbG9USmV6NkZ2Zm9kMDlZZzh6K2ZHSzd4c1FKR1hkMWU2?=
 =?utf-8?B?RnhKbHQvY01Hd1RaYVdHbjJBNDMyMnN1c2wwVHI2UmRBVzMwQ0NsSk1OeWFW?=
 =?utf-8?B?a253WWYxQXZEZzJBdzdmdWQ2aEhZT2J3L2xJMW14MWRBZFVISWtJek9ON2lv?=
 =?utf-8?B?UGI1QW5HRmVOVjU2TUN4dUpUWkxSSEM4dlF1NTJNSG9GMVgvQ0VXdmZmU1VR?=
 =?utf-8?B?MkU3RHhVYnhSOG9EUVlWb2VFYk5ROUZsdVJ3SUJEL0V4cWpCN2xSRHZHamw3?=
 =?utf-8?B?T3BGSEM1alA5MjNKRmNJMkpLR1VsY1pGVnZORFNXWE1Cc0JmZWgveXY5bGpr?=
 =?utf-8?B?dldST3QrcFB5RWo2RHNoU0xsK1JCQlk1L3A2Q2FxTmJmcTVpUmJYVFpqb3Fk?=
 =?utf-8?B?L2NHeGJMWnhKZ29sODBGcy95ak9CclJyc3ZSdm1QS2NXOGlpNml6RUMvWFRK?=
 =?utf-8?B?Y0lHUjJvNkN3ZldZbW1QcDJZRUxhd25uM3Y3cE56SEhxTHowNm82enRtbUw3?=
 =?utf-8?B?eTVlZ0lYaThxY2FjMHRlMkpDOVFXRVYvcHdrN2VMUktybW9ZMXpqSEk4TGVi?=
 =?utf-8?B?M1RtMmozT21ibHh0UjRDKzhVYW9iazh3UzRTcTBnckM3ejU1VjRUWHRmd1h5?=
 =?utf-8?B?d2FwQ0Z2bGlXazd1alpNUnRzK3BSMWpaQ2JLcmlGc0FoTXRqSG1TcFlYLzlH?=
 =?utf-8?B?U29STXhYL0NSYkhVd1NoUW4wUFZ4QmJGYnp2eWdTbXNqcXBRK2FNZFMrTnVs?=
 =?utf-8?B?TEl3VEcwWTR4MFR1NlJjVUxUci9lSnMzRDhIejhkelR1ZzFHdDdWVStUaHdo?=
 =?utf-8?B?b28yUStjemtQRzVyRC9oOU1UblkyNjRHbWx1NWZLaUZRSTNhcmozZHJUc0J0?=
 =?utf-8?B?YzhhVVYxaWhYeFpubUdhZll0UlBOZW02Um44dC9LblJhWGNGaW9PVWVtVjJY?=
 =?utf-8?B?SWNjK2QrVzlUWW05bSsvZ1NrYVorNndOMUszTCtmSTBDWHFaOUNVTUxHcTR0?=
 =?utf-8?B?dmQ4eDUyTjhLSlV5czdJeG12Q3Fwd2ZrZEEyemVqN2VNbFkza29jTkZJc3h2?=
 =?utf-8?B?T3RId2oweUM0T25QR2ZlWlVTR3p1NXpQdmVlY1I5YVJiRkhXVUF3T2tyeHQ2?=
 =?utf-8?B?U1BkK1JWMXFHdVZoWjJnaUh4cDFlcW9nOHZ1Wm1uNDNHRzk3UlZVQmxGZlBL?=
 =?utf-8?B?alh3aEUrNWZrN0UzcUlFWElTK3Y5Mk5mODdvaWpZbTZCUHJVRnZGSWdzWmRp?=
 =?utf-8?B?YnVNMnZ6d1BuUm1UaUpLczVwZ2NNM0s2WnBYNW9oaEoydzNyNU9OK2luM1Yw?=
 =?utf-8?B?bnJlRlpkb2U0bUNEaFlvL0Q0eWFNRmJNOFF2bUtFZ0ZaSkZJdG9PQXJJeXdI?=
 =?utf-8?B?ZmxyMkZuOGN5SSs5ZHZFWk8rWWg1cnA0ckk5Y2NNa1dCVis1TjBzcGlrQ255?=
 =?utf-8?B?dE0weVdHVU5LdVBSNGZRaG16L2FKV1N5eXFTd01DSEpOZWkvRlplN25NdDJx?=
 =?utf-8?B?ZytFdWNlTGkzRFZ5Yk8wUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d029f6-4b32-4bbf-799b-08d9000ed4ec
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:03:15.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vP9DuNcPQiHTcT0/JjfJ3ea/pHU2VYNADZfEHM7fTSWrYN0THQAuhlszbufIiVOidFLlz6GGvlw8ZOAfZzpcae+Fo7y2lqa3TBw0QBiQ33M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2630
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2021-04-14 9:38 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> I am seeing this failure
>
> https://errors.yoctoproject.org/Errors/Details/576554/
>
> this is musl/gcc11/qemux86

I've been trying to recreate it, but it's compiling successfully each 
time. I'm building musl qemux86 with gcc 10.2.1 on the host (F33).

Anything else that might be in the config?

>
> On Wed, Apr 14, 2021 at 10:50 AM Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
>> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>>
>> Drop 0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
>> since it was a backport.
>>
>> Drop 0001-pollGtk-Drop-volatile-qualifier.patch
>> since it's covered by:
>>     f48efc8e Make pollGtk resetable.
>>
>> Drop 0001-utilBacktrace-Ignore-Warray-bounds.patch
>> since it's covered by:
>>     0cfda58a Make peeking back into the stack work for back traces
>>
>> Drop 0002-add-include-sys-sysmacros.h.patch
>> since it's covered by:
>>     69b7e1f9 Include sysmacros.h directly as mandated by glibc-2.25.
>>
>> Refit:
>>    0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
>>    0009-Rename-poll.h-to-vm_poll.h.patch
>>    0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
>>    0011-Use-uintmax_t-for-handling-rlim_t.patch
>>
>> Add:
>>    0001-Add-resolv_compat.h-for-musl-builds.patch
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> Signed-off-by: Trevor Gamblin <Trevor.Gamblin@windriver.com>
>> ---
>>   ...-Add-resolv_compat.h-for-musl-builds.patch |  72 ++
>>   ....-Remove-references-to-deprecated-G_.patch |  94 ---
>>   ...0001-pollGtk-Drop-volatile-qualifier.patch |  32 -
>>   ...1-utilBacktrace-Ignore-Warray-bounds.patch |  33 -
>>   .../0002-add-include-sys-sysmacros.h.patch    |  30 -
>>   ...ux-Consider-64bit-time_t-possibility.patch |  42 +-
>>   ...-test-for-feature-instead-of-platfor.patch |  24 +-
>>   .../0009-Rename-poll.h-to-vm_poll.h.patch     | 726 ++----------------
>>   ...11-Use-uintmax_t-for-handling-rlim_t.patch |  25 +-
>>   ...ools_11.0.1.bb => open-vm-tools_11.2.5.bb} |  13 +-
>>   10 files changed, 184 insertions(+), 907 deletions(-)
>>   create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
>>   delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
>>   delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch
>>   delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
>>   delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
>>   rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_11.0.1.bb => open-vm-tools_11.2.5.bb} (93%)
>>
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
>> new file mode 100644
>> index 000000000..aa7a5607c
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
>> @@ -0,0 +1,72 @@
>> +From c0c36ba5dd7047710e4c3135f147ce4119021200 Mon Sep 17 00:00:00 2001
>> +From: Trevor Gamblin <trevor.gamblin@windriver.com>
>> +Date: Wed, 14 Apr 2021 10:24:52 -0400
>> +Subject: [PATCH] Add resolv_compat.h for musl builds
>> +
>> +musl doesn't implement res_ninit, so it needs to be defined
>> +independently for musl builds. This patch is based on the one at
>> +https://gitweb.gentoo.org/proj/musl.git/tree/dev-qt/qtwebengine/files/qtwebengine-5.7.0-musl-resolver.patch?id=7f4100326793d55d45d0f5bb6178827ce6173513
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> +---
>> + open-vm-tools/lib/nicInfo/nicInfoPosix.c  |  4 +++
>> + open-vm-tools/lib/nicInfo/resolv_compat.h | 30 +++++++++++++++++++++++
>> + 2 files changed, 34 insertions(+)
>> + create mode 100644 open-vm-tools/lib/nicInfo/resolv_compat.h
>> +
>> +diff --git a/open-vm-tools/lib/nicInfo/nicInfoPosix.c b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
>> +index 8710c542..25f3146e 100644
>> +--- a/open-vm-tools/lib/nicInfo/nicInfoPosix.c
>> ++++ b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
>> +@@ -70,6 +70,10 @@
>> + #   include <net/if.h>
>> + #endif
>> +
>> ++#if !defined(__GLIBC__)
>> ++#include "resolv_compat.h"
>> ++#endif
>> ++
>> + /*
>> +  * resolver(3) and IPv6:
>> +  *
>> +diff --git a/open-vm-tools/lib/nicInfo/resolv_compat.h b/open-vm-tools/lib/nicInfo/resolv_compat.h
>> +new file mode 100644
>> +index 00000000..d768464b
>> +--- /dev/null
>> ++++ b/open-vm-tools/lib/nicInfo/resolv_compat.h
>> +@@ -0,0 +1,30 @@
>> ++#if !defined(__GLIBC__)
>> ++/***************************************************************************
>> ++ * resolv_compat.h
>> ++ *
>> ++ * Mimick GLIBC's res_ninit() and res_nclose() for musl libc
>> ++ * Note: res_init() is actually deprecated according to
>> ++ * http://docs.oracle.com/cd/E36784_01/html/E36875/res-nclose-3resolv.html
>> ++ **************************************************************************/
>> ++#include <string.h>
>> ++
>> ++static inline int res_ninit(res_state statp)
>> ++{
>> ++      int rc = res_init();
>> ++      if (statp != &_res) {
>> ++              memcpy(statp, &_res, sizeof(*statp));
>> ++      }
>> ++      return rc;
>> ++}
>> ++
>> ++static inline int res_nclose(res_state statp)
>> ++{
>> ++      if (!statp)
>> ++              return -1;
>> ++      if (statp != &_res) {
>> ++              memset(statp, 0, sizeof(*statp));
>> ++      }
>> ++      return 0;
>> ++}
>> ++#endif
>> ++
>> +--
>> +2.30.2
>> +
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
>> deleted file mode 100644
>> index 6cb5dfccc..000000000
>> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
>> +++ /dev/null
>> @@ -1,94 +0,0 @@
>> -From 6fb28085e867d7c3ef46577d9ff193a185693bcb Mon Sep 17 00:00:00 2001
>> -From: Oliver Kurth <okurth@vmware.com>
>> -Date: Mon, 30 Sep 2019 16:24:27 -0700
>> -Subject: [PATCH] GitHub Issue #367. Remove references to deprecated G_INLINE_FUNC.
>> -
>> -G_INLINE_FUNC was a work-around for compilers that didn't support
>> -static inline.  Change uses of it to static inline.
>> -
>> -Upstream-Status: Backport
>> -[https://github.com/vmware/open-vm-tools/commit/89c0d444567eb525e8d083fb564c46d68e96660c]
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - open-vm-tools/lib/include/vmware/tools/plugin.h     | 2 +-
>> - open-vm-tools/lib/include/vmware/tools/threadPool.h | 8 ++++----
>> - open-vm-tools/lib/include/vmware/tools/utils.h      | 9 ---------
>> - 3 files changed, 5 insertions(+), 14 deletions(-)
>> -
>> -diff --git a/open-vm-tools/lib/include/vmware/tools/plugin.h b/open-vm-tools/lib/include/vmware/tools/plugin.h
>> -index f9acc6a2..deefd1f3 100644
>> ---- a/open-vm-tools/lib/include/vmware/tools/plugin.h
>> -+++ b/open-vm-tools/lib/include/vmware/tools/plugin.h
>> -@@ -290,7 +290,7 @@ typedef struct ToolsAppCtx {
>> -  *
>> -  * @return TRUE if COM is initialized when the function returns.
>> -  */
>> --G_INLINE_FUNC gboolean
>> -+static inline gboolean
>> - ToolsCore_InitializeCOM(ToolsAppCtx *ctx)
>> - {
>> -    if (!ctx->comInitialized) {
>> -diff --git a/open-vm-tools/lib/include/vmware/tools/threadPool.h b/open-vm-tools/lib/include/vmware/tools/threadPool.h
>> -index 3f2082b3..5880fbcf 100644
>> ---- a/open-vm-tools/lib/include/vmware/tools/threadPool.h
>> -+++ b/open-vm-tools/lib/include/vmware/tools/threadPool.h
>> -@@ -91,7 +91,7 @@ typedef struct ToolsCorePool {
>> -  *******************************************************************************
>> -  */
>> -
>> --G_INLINE_FUNC ToolsCorePool *
>> -+static inline ToolsCorePool *
>> - ToolsCorePool_GetPool(ToolsAppCtx *ctx)
>> - {
>> -    ToolsCorePool *pool = NULL;
>> -@@ -123,7 +123,7 @@ ToolsCorePool_GetPool(ToolsAppCtx *ctx)
>> -  *******************************************************************************
>> -  */
>> -
>> --G_INLINE_FUNC guint
>> -+static inline guint
>> - ToolsCorePool_SubmitTask(ToolsAppCtx *ctx,
>> -                          ToolsCorePoolCb cb,
>> -                          gpointer data,
>> -@@ -153,7 +153,7 @@ ToolsCorePool_SubmitTask(ToolsAppCtx *ctx,
>> -  *******************************************************************************
>> -  */
>> -
>> --G_INLINE_FUNC void
>> -+static inline void
>> - ToolsCorePool_CancelTask(ToolsAppCtx *ctx,
>> -                          guint taskId)
>> - {
>> -@@ -197,7 +197,7 @@ ToolsCorePool_CancelTask(ToolsAppCtx *ctx,
>> -  *******************************************************************************
>> -  */
>> -
>> --G_INLINE_FUNC gboolean
>> -+static inline gboolean
>> - ToolsCorePool_StartThread(ToolsAppCtx *ctx,
>> -                           const gchar *threadName,
>> -                           ToolsCorePoolCb cb,
>> -diff --git a/open-vm-tools/lib/include/vmware/tools/utils.h b/open-vm-tools/lib/include/vmware/tools/utils.h
>> -index f6574590..a3292d5c 100644
>> ---- a/open-vm-tools/lib/include/vmware/tools/utils.h
>> -+++ b/open-vm-tools/lib/include/vmware/tools/utils.h
>> -@@ -51,15 +51,6 @@
>> - #  include <sys/time.h>
>> - #endif
>> -
>> --
>> --/* Work around a glib limitation: it doesn't set G_INLINE_FUNC on Win32. */
>> --#if defined(G_PLATFORM_WIN32)
>> --#  if defined(G_INLINE_FUNC)
>> --#     undef G_INLINE_FUNC
>> --#  endif
>> --#  define G_INLINE_FUNC static __inline
>> --#endif
>> --
>> - #ifndef ABS
>> - #  define ABS(x) (((x) >= 0) ? (x) : -(x))
>> - #endif
>> ---
>> -2.23.0
>> -
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch
>> deleted file mode 100644
>> index adc6571f7..000000000
>> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From 7bd280f3cc07208760759c98bbfbac3f9d28f77c Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Fri, 5 Mar 2021 08:58:29 -0800
>> -Subject: [PATCH] pollGtk: Drop volatile qualifier
>> -
>> -glib-2.0 has changed the function interfaces as well and do not expect
>> -it to be volatile. GCC 11 complains about it
>> -
>> -glib/gatomic.h:112:5: error: argument 2 of '__atomic_load' discards 'volatile' qualifier [-Werror=incompatible-pointer-types]
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - open-vm-tools/lib/pollGtk/pollGtk.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/open-vm-tools/lib/pollGtk/pollGtk.c b/open-vm-tools/lib/pollGtk/pollGtk.c
>> -index 6d95bf01..a941e7a7 100644
>> ---- a/open-vm-tools/lib/pollGtk/pollGtk.c
>> -+++ b/open-vm-tools/lib/pollGtk/pollGtk.c
>> -@@ -1473,7 +1473,7 @@ PollGtkBasicCallback(gpointer data) // IN: The eventEntry
>> - void
>> - Poll_InitGtk(void)
>> - {
>> --   static volatile gsize inited = 0;
>> -+   static gsize inited = 0;
>> -
>> -    static const PollImpl gtkImpl =
>> -    {
>> ---
>> -2.30.1
>> -
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
>> deleted file mode 100644
>> index 95664e855..000000000
>> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -From ac3f93ea087d3a5461fe57fe021d0fe9a959e13c Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 25 Dec 2019 15:25:02 -0800
>> -Subject: [PATCH] utilBacktrace: Ignore -Warray-bounds
>> -
>> -This is new warning with gcc10, until its fixed ignore it like gcc<10
>> -did
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - open-vm-tools/lib/user/utilBacktrace.c | 5 +++++
>> - 1 file changed, 5 insertions(+)
>> -
>> -diff --git a/open-vm-tools/lib/user/utilBacktrace.c b/open-vm-tools/lib/user/utilBacktrace.c
>> -index b72340ad..97ca53f2 100644
>> ---- a/open-vm-tools/lib/user/utilBacktrace.c
>> -+++ b/open-vm-tools/lib/user/utilBacktrace.c
>> -@@ -517,6 +517,11 @@ Util_BacktraceWithFunc(int bugNr,                // IN:
>> -    } else {
>> -       outFunc(outFuncData, "Backtrace for bugNr=%d\n",bugNr);
>> -    }
>> -+#pragma GCC diagnostic push
>> -+#pragma GCC diagnostic ignored "-Warray-bounds"
>> -+
>> -    Util_BacktraceFromPointerWithFunc(&x[-2], outFunc, outFuncData);
>> -+#pragma GCC diagnostic pop
>> - #endif
>> - }
>> -+
>> ---
>> -2.24.1
>> -
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
>> deleted file mode 100644
>> index 34628ffbe..000000000
>> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -From 3fa237b3afabc293e563292b8d89265a871626ad Mon Sep 17 00:00:00 2001
>> -From: Martin Kelly <mkelly@xevo.com>
>> -Date: Mon, 22 May 2017 17:00:05 -0700
>> -Subject: [PATCH] add #include <sys/sysmacros.h>
>> -
>> -In newer glibc versions, the definition for major() has been moved to
>> -sys/sysmacros.h, and using the older version in <sys/types.h> has been
>> -deprecated. So, add an include for <sys/sysmacros.h>.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ----
>> - open-vm-tools/lib/wiper/wiperPosix.c | 3 +++
>> - 1 file changed, 3 insertions(+)
>> -
>> -diff --git a/open-vm-tools/lib/wiper/wiperPosix.c b/open-vm-tools/lib/wiper/wiperPosix.c
>> -index bd542410..ccf06293 100644
>> ---- a/open-vm-tools/lib/wiper/wiperPosix.c
>> -+++ b/open-vm-tools/lib/wiper/wiperPosix.c
>> -@@ -43,6 +43,9 @@
>> - #  include <libgen.h>
>> - # endif /* __FreeBSD_version >= 500000 */
>> - #endif
>> -+#if defined(__linux__)
>> -+#include <sys/sysmacros.h>
>> -+#endif
>> - #include <unistd.h>
>> -
>> - #include "vmware.h"
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
>> index 0f64eabc9..efada7aaf 100644
>> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
>> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
>> @@ -1,22 +1,27 @@
>> -From fe56b67a2915a8632ea30604c14241f335dd3c15 Mon Sep 17 00:00:00 2001
>> +From deba3b87a9bfad007f94b840c9ccd6f1c78c2e98 Mon Sep 17 00:00:00 2001
>>   From: Khem Raj <raj.khem@gmail.com>
>> -Date: Tue, 12 Nov 2019 10:49:46 -0800
>> -Subject: [PATCH] hgfsServerLinux: Consider 64bit time_t possibility
>> +Date: Wed, 24 Mar 2021 17:36:26 -0400
>> +Subject: [PATCH 1/2] hgfsServerLinux: Consider 64bit time_t possibility
>>
>>   Upstream-Status: Pending
>> +
>> +Refit for open-vm-tools-11.2.5.
>> +
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>   ---
>>    .../lib/hgfsServer/hgfsServerLinux.c          | 19 +++++--------------
>>    1 file changed, 5 insertions(+), 14 deletions(-)
>>
>>   diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
>> -index 03175623..554da67f 100644
>> +index 62aeee6d..ba2e5624 100644
>>   --- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
>>   +++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
>> -@@ -2561,20 +2561,11 @@ HgfsStatToFileAttr(struct stat *stats,       // IN: stat information
>> -    LOG(4, ("%s: done, permissions %o%o%o%o, size %"FMT64"u\n", __FUNCTION__,
>> -            attr->specialPerms, attr->ownerPerms, attr->groupPerms,
>> -            attr->otherPerms, attr->size));
>> +@@ -2566,20 +2566,11 @@ HgfsStatToFileAttr(struct stat *stats,       // IN: stat information
>> +    LOG(4, "%s: done, permissions %o%o%o%o, size %"FMT64"u\n", __FUNCTION__,
>> +        attr->specialPerms, attr->ownerPerms, attr->groupPerms,
>> +        attr->otherPerms, attr->size);
>>   -#ifdef __FreeBSD__
>>   -#   if !defined(VM_X86_64) && __FreeBSD_version >= 500043
>>   -#      define FMTTIMET ""
>> @@ -26,16 +31,19 @@ index 03175623..554da67f 100644
>>   -#else
>>   -#   define FMTTIMET "l"
>>   -#endif
>> --   LOG(4, ("access: %"FMTTIMET"d/%"FMT64"u \nwrite: %"FMTTIMET"d/%"FMT64"u \n"
>> --           "attr: %"FMTTIMET"d/%"FMT64"u\n",
>> --           stats->st_atime, attr->accessTime, stats->st_mtime, attr->writeTime,
>> --           stats->st_ctime, attr->attrChangeTime));
>> +-   LOG(4, "access: %"FMTTIMET"d/%"FMT64"u \nwrite: %"FMTTIMET"d/%"FMT64"u \n"
>> +-       "attr: %"FMTTIMET"d/%"FMT64"u\n",
>> +-       stats->st_atime, attr->accessTime, stats->st_mtime, attr->writeTime,
>> +-       stats->st_ctime, attr->attrChangeTime);
>>   -#undef FMTTIMET
>> -+   LOG(4, ("access: %jd/%"FMT64"u \nwrite: %jd/%"FMT64"u \n"
>> -+           "attr: %jd/%"FMT64"u\n",
>> -+           (intmax_t)stats->st_atime, attr->accessTime,
>> -+         (intmax_t)stats->st_mtime, attr->writeTime,
>> -+           (intmax_t)stats->st_ctime, attr->attrChangeTime));
>> ++   //LOG(4, ("access: %jd/%"FMT64"u \nwrite: %jd/%"FMT64"u \n"
>> ++   //        "attr: %jd/%"FMT64"u\n",
>> ++   //        (intmax_t)stats->st_atime, attr->accessTime,
>> ++   //        (intmax_t)stats->st_mtime, attr->writeTime,
>> ++   //        (intmax_t)stats->st_ctime, attr->attrChangeTime));
>>
>>       attr->userId = stats->st_uid;
>>       attr->groupId = stats->st_gid;
>> +--
>> +2.30.2
>> +
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
>> index c6378b808..34d4ce4a9 100644
>> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
>> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
>> @@ -1,4 +1,4 @@
>> -From 719d60978f979cf2e03771a9b8a62e36c92639f9 Mon Sep 17 00:00:00 2001
>> +From b653a81da70c44af002dcbc7489ad9f4588ed11d Mon Sep 17 00:00:00 2001
>>   From: Natanael Copa <ncopa@alpinelinux.org>
>>   Date: Wed, 18 Nov 2015 10:05:07 +0000
>>   Subject: [PATCH] Use configure to test for feature instead of platform
>> @@ -18,7 +18,10 @@ The features we test for are:
>>
>>   This is needed for musl libc.
>>
>> +Refit patch of open-vm-tools/lib/nicInfo/nicInfoPosix.c
>> +
>>   Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
>> +Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
>>   ---
>>    open-vm-tools/configure.ac               |  4 ++++
>>    open-vm-tools/lib/misc/idLinux.c         | 30 +++++++++++-------------
>> @@ -26,10 +29,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
>>    3 files changed, 23 insertions(+), 17 deletions(-)
>>
>>   diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
>> -index 48ff1ef3..71e684bb 100644
>> +index 27f3717f..6baab9e3 100644
>>   --- a/open-vm-tools/configure.ac
>>   +++ b/open-vm-tools/configure.ac
>> -@@ -897,6 +897,7 @@ AC_CHECK_FUNCS(
>> +@@ -923,6 +923,7 @@ AC_CHECK_FUNCS(
>>
>>    AC_CHECK_FUNCS([ecvt])
>>    AC_CHECK_FUNCS([fcvt])
>> @@ -37,7 +40,7 @@ index 48ff1ef3..71e684bb 100644
>>
>>    AC_CHECK_FUNC([mkdtemp], [have_mkdtemp=yes])
>>
>> -@@ -1145,10 +1146,13 @@ fi
>> +@@ -1132,10 +1133,13 @@ fi
>>    ###
>>
>>    AC_CHECK_HEADERS([crypt.h])
>> @@ -52,7 +55,7 @@ index 48ff1ef3..71e684bb 100644
>>    AC_CHECK_HEADERS([sys/io.h])
>>    AC_CHECK_HEADERS([sys/param.h]) # Required to make the sys/user.h check work correctly on FreeBSD
>>   diff --git a/open-vm-tools/lib/misc/idLinux.c b/open-vm-tools/lib/misc/idLinux.c
>> -index b950cf84..1dcfb508 100644
>> +index 1bb86f48..41c670cf 100644
>>   --- a/open-vm-tools/lib/misc/idLinux.c
>>   +++ b/open-vm-tools/lib/misc/idLinux.c
>>   @@ -27,12 +27,9 @@
>> @@ -69,7 +72,7 @@ index b950cf84..1dcfb508 100644
>>    #ifdef __APPLE__
>>    #include <sys/socket.h>
>>    #include <TargetConditionals.h>
>> -@@ -997,31 +994,32 @@ Id_EndSuperUser(uid_t uid)  // IN:
>> +@@ -1025,31 +1022,32 @@ Id_EndSuperUser(uid_t uid)  // IN:
>>    static Bool
>>    IdIsSetUGid(void)
>>    {
>> @@ -115,13 +118,13 @@ index b950cf84..1dcfb508 100644
>>    }
>>    #endif
>>   diff --git a/open-vm-tools/lib/nicInfo/nicInfoPosix.c b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
>> -index a22981d5..b4e08681 100644
>> +index cc5fa281..8710c542 100644
>>   --- a/open-vm-tools/lib/nicInfo/nicInfoPosix.c
>>   +++ b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
>> -@@ -34,9 +34,13 @@
>> - #include <sys/socket.h>
>> +@@ -35,9 +35,13 @@
>>    #include <sys/stat.h>
>>    #include <errno.h>
>> + #include <limits.h>
>>   -#if defined(__FreeBSD__) || defined(__APPLE__)
>>   +#if HAVE_SYS_SYSCTL_H
>>    # include <sys/sysctl.h>
>> @@ -133,3 +136,6 @@ index a22981d5..b4e08681 100644
>>    # include <net/if.h>
>>    #endif
>>    #ifndef NO_DNET
>> +--
>> +2.27.0
>> +
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
>> index 9cf54f6f4..214dac471 100644
>> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
>> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
>> @@ -1,27 +1,36 @@
>> -From 8793466326dd10b0d2dbb83c64beff5cc8c0fc7d Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 13 Jun 2018 23:11:58 -0700
>> +From 7a5db1cf47e70e72d78a42468912c276e57f865e Mon Sep 17 00:00:00 2001
>> +From: Randy MacLeod <Randy.MacLeod@windriver.com>
>> +Date: Wed, 24 Mar 2021 16:21:35 -0400
>>   Subject: [PATCH] Rename poll.h to vm_poll.h
>>
>> +Rename poll.h to vm_poll.h and switch from:
>> +   #include <sys/poll.h>
>> +to
>> +   #include <poll.h>
>> +
>>   musl libc's system headers pulls in open-vm-tools' poll.h. To avoid this
>>   we rename poll.h to vm_poll.h.
>>
>> +Update for open-vm-tools-11.2.5.
>> +
>>   Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>>   ---
>> - open-vm-tools/lib/asyncsocket/asyncsocket.c                     | 2 +-
>> - open-vm-tools/lib/hgfsServer/hgfsServer.c                       | 2 +-
>> - open-vm-tools/lib/include/asyncsocket.h                         | 2 +-
>> - open-vm-tools/lib/include/pollImpl.h                            | 2 +-
>> - open-vm-tools/lib/include/{poll.h => vm_poll.h}                 | 2 +-
>> - open-vm-tools/lib/rpcIn/rpcin.c                                 | 2 +-
>> - .../services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c      | 2 +-
>> - 7 files changed, 7 insertions(+), 7 deletions(-)
>> + open-vm-tools/lib/asyncsocket/asyncsocket.c     | 2 +-
>> + open-vm-tools/lib/hgfsServer/hgfsServer.c       | 2 +-
>> + open-vm-tools/lib/include/asyncsocket.h         | 2 +-
>> + open-vm-tools/lib/include/pollImpl.h            | 2 +-
>> + open-vm-tools/lib/include/{poll.h => vm_poll.h} | 2 +-
>> + open-vm-tools/lib/rpcIn/rpcin.c                 | 2 +-
>> + 6 files changed, 6 insertions(+), 6 deletions(-)
>>    rename open-vm-tools/lib/include/{poll.h => vm_poll.h} (99%)
>>
>> +diff --git a/open-vm-tools/lib/asyncsocket/asyncsocket.c b/open-vm-tools/lib/asyncsocket/asyncsocket.c
>> +index 9914ffc5..89679f7a 100644
>>   --- a/open-vm-tools/lib/asyncsocket/asyncsocket.c
>>   +++ b/open-vm-tools/lib/asyncsocket/asyncsocket.c
>> -@@ -86,7 +86,7 @@
>> +@@ -87,7 +87,7 @@
>>    #include "random.h"
>>    #include "asyncsocket.h"
>>    #include "asyncSocketBase.h"
>> @@ -30,20 +39,24 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    #include "log.h"
>>    #include "err.h"
>>    #include "hostinfo.h"
>> +diff --git a/open-vm-tools/lib/hgfsServer/hgfsServer.c b/open-vm-tools/lib/hgfsServer/hgfsServer.c
>> +index 3a18a7e1..acdda54d 100644
>>   --- a/open-vm-tools/lib/hgfsServer/hgfsServer.c
>>   +++ b/open-vm-tools/lib/hgfsServer/hgfsServer.c
>> -@@ -48,7 +48,7 @@
>> - #include "hgfsServerOplock.h"
>> +@@ -51,7 +51,7 @@
>>    #include "hgfsDirNotify.h"
>> + #include "hgfsThreadpool.h"
>>    #include "userlock.h"
>>   -#include "poll.h"
>>   +#include "vm_poll.h"
>>    #include "mutexRankLib.h"
>>    #include "vm_basic_asm.h"
>>    #include "unicodeOperations.h"
>> +diff --git a/open-vm-tools/lib/include/asyncsocket.h b/open-vm-tools/lib/include/asyncsocket.h
>> +index 746dd78b..82c22f46 100644
>>   --- a/open-vm-tools/lib/include/asyncsocket.h
>>   +++ b/open-vm-tools/lib/include/asyncsocket.h
>> -@@ -164,7 +164,7 @@ typedef struct AsyncSocket AsyncSocket;
>> +@@ -171,7 +171,7 @@ typedef struct AsyncSocket AsyncSocket;
>>     * Or the client can specify its favorite poll class and locking behavior.
>>     * Use of IVmdbPoll is only supported for regular sockets and for Attach.
>>     */
>> @@ -52,6 +65,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    struct IVmdbPoll;
>>    typedef struct AsyncSocketPollParams {
>>       int flags;               /* Default 0, only POLL_FLAG_NO_BULL is valid */
>> +diff --git a/open-vm-tools/lib/include/pollImpl.h b/open-vm-tools/lib/include/pollImpl.h
>> +index 46442e55..8bc66997 100644
>>   --- a/open-vm-tools/lib/include/pollImpl.h
>>   +++ b/open-vm-tools/lib/include/pollImpl.h
>>   @@ -44,7 +44,7 @@
>> @@ -63,672 +78,24 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    #include "vm_basic_asm.h"
>>
>>    #if defined(__cplusplus)
>> +diff --git a/open-vm-tools/lib/include/poll.h b/open-vm-tools/lib/include/vm_poll.h
>> +similarity index 99%
>> +rename from open-vm-tools/lib/include/poll.h
>> +rename to open-vm-tools/lib/include/vm_poll.h
>> +index c90f5dcd..73a56204 100644
>>   --- a/open-vm-tools/lib/include/poll.h
>> -+++ /dev/null
>> -@@ -1,330 +0,0 @@
>> --/*********************************************************
>> -- * Copyright (C) 1998-2018 VMware, Inc. All rights reserved.
>> -- *
>> -- * This program is free software; you can redistribute it and/or modify it
>> -- * under the terms of the GNU Lesser General Public License as published
>> -- * by the Free Software Foundation version 2.1 and no later version.
>> -- *
>> -- * This program is distributed in the hope that it will be useful, but
>> -- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
>> -- * or FITNESS FOR A PARTICULAR PURPOSE.  See the Lesser GNU General Public
>> -- * License for more details.
>> -- *
>> -- * You should have received a copy of the GNU Lesser General Public License
>> -- * along with this program; if not, write to the Free Software Foundation, Inc.,
>> -- * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA.
>> -- *
>> -- *********************************************************/
>> --
>> --/*********************************************************
>> -- * The contents of this file are subject to the terms of the Common
>> -- * Development and Distribution License (the "License") version 1.0
>> -- * and no later version.  You may not use this file except in
>> -- * compliance with the License.
>> -- *
>> -- * You can obtain a copy of the License at
>> -- *         http://www.opensource.org/licenses/cddl1.php
>> -- *
>> -- * See the License for the specific language governing permissions
>> -- * and limitations under the License.
>> -- *
>> -- *********************************************************/
>> --
>> --
>> --#ifndef _POLL_H_
>> --#define _POLL_H_
>> --
>> --#define INCLUDE_ALLOW_USERLEVEL
>> --#define INCLUDE_ALLOW_VMCORE
>> --#include "includeCheck.h"
>> --
>> --#include "vm_basic_types.h"
>> --#include "vm_basic_defs.h"
>> --#include "vmware.h"
>> --#include "userlock.h"
>> --
>> --#if defined(__cplusplus)
>> --extern "C" {
>> --#endif
>> --
>> --#ifdef _WIN32
>> --#define HZ 100
>> --#elif defined linux
>> --#include <asm/param.h>
>> --#elif __APPLE__
>> --#include <TargetConditionals.h>
>> --/*
>> -- * Old SDKs don't define TARGET_OS_IPHONE at all.
>> -- * New ones define it to 0 on Mac OS X, 1 on iOS.
>> -- */
>> --#if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
>> --#include <sys/kernel.h>
>> --#endif
>> --#include <sys/poll.h>
>> --#define HZ 100
>> --#endif
>> --#ifdef __ANDROID__
>> --/*
>> -- * <poll.h> of android should be included, but its name is same
>> -- * with this file. So its content is put here to avoid conflict.
>> -- */
>> --#include <asm/poll.h>
>> --#define HZ 100
>> --typedef unsigned int  nfds_t;
>> --int poll(struct pollfd *, nfds_t, long);
>> --#endif
>> --
>> --
>> --/*
>> -- * Poll event types: each type has a different reason for firing,
>> -- * or condition that must be met before firing.
>> -- */
>> --
>> --typedef enum {
>> --   /*
>> --    * Actual Poll queue types against which you can register callbacks.
>> --    */
>> --   POLL_VIRTUALREALTIME = -1, /* Negative because it doesn't have its own Q */
>> --   POLL_VTIME = 0,
>> --   POLL_REALTIME,
>> --   POLL_DEVICE,
>> --   POLL_MAIN_LOOP,
>> --   POLL_NUM_QUEUES
>> --} PollEventType;
>> --
>> --
>> --/*
>> -- * Classes of events
>> -- *
>> -- * These are the predefined classes.  More can be declared
>> -- * with Poll_AllocClass().
>> -- */
>> --
>> --typedef enum PollClass {
>> --   POLL_CLASS_MAIN,
>> --   POLL_CLASS_PAUSE,
>> --   POLL_CLASS_IPC,
>> --   POLL_CLASS_CPT,
>> --   POLL_CLASS_MKS,
>> --   POLL_FIXED_CLASSES,
>> --   POLL_DEFAULT_FIXED_CLASSES,
>> --   /* Size enum to maximum */
>> --   POLL_MAX_CLASSES = 31,
>> --} PollClass;
>> --
>> --/*
>> -- * Do not use; Special pseudo private poll class supported by
>> -- * PollDefault only
>> -- */
>> --#define POLL_DEFAULT_CLASS_NET POLL_FIXED_CLASSES
>> --#define POLL_DEFAULT_CS_NET    PollClassSet_Singleton(POLL_DEFAULT_CLASS_NET)
>> --
>> --/*
>> -- * Each callback is registered in a set of classes
>> -- */
>> --
>> --typedef struct PollClassSet {
>> --   uintptr_t bits;
>> --} PollClassSet;
>> --
>> --/* An empty PollClassSet. */
>> --static INLINE PollClassSet
>> --PollClassSet_Empty(void)
>> --{
>> --   PollClassSet set = { 0 };
>> --   return set;
>> --}
>> --
>> --/* A PollClassSet with the single member. */
>> --static INLINE PollClassSet
>> --PollClassSet_Singleton(PollClass c)
>> --{
>> --   PollClassSet s = PollClassSet_Empty();
>> --
>> --   ASSERT_ON_COMPILE(POLL_MAX_CLASSES < sizeof s.bits * 8);
>> --   ASSERT(c < POLL_MAX_CLASSES);
>> --
>> --   s.bits = CONST3264U(1) << c;
>> --   return s;
>> --}
>> --
>> --/* Combine two PollClassSets. */
>> --static INLINE PollClassSet
>> --PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
>> --{
>> --   PollClassSet set;
>> --   set.bits = lhs.bits | rhs.bits;
>> --   return set;
>> --}
>> --
>> --/* Add single class to PollClassSet. */
>> --static INLINE PollClassSet
>> --PollClassSet_Include(PollClassSet set, PollClass c)
>> --{
>> --   return PollClassSet_Union(set, PollClassSet_Singleton(c));
>> --}
>> --
>> --
>> --#define POLL_CS_MAIN    PollClassSet_Singleton(POLL_CLASS_MAIN)
>> --#define POLL_CS_PAUSE   PollClassSet_Union(POLL_CS_MAIN,            \
>> --                           PollClassSet_Singleton(POLL_CLASS_PAUSE))
>> --#define POLL_CS_CPT     PollClassSet_Union(POLL_CS_PAUSE,           \
>> --                           PollClassSet_Singleton(POLL_CLASS_CPT))
>> --#define POLL_CS_IPC     PollClassSet_Union(POLL_CS_CPT,             \
>> --                           PollClassSet_Singleton(POLL_CLASS_IPC))
>> --#define POLL_CS_VMDB    POLL_CS_PAUSE /* POLL_CLASS_VMDB is retired */
>> --#define POLL_CS_MKS   PollClassSet_Singleton(POLL_CLASS_MKS)
>> --/*
>> -- * DANGER.  You don't need POLL_CS_ALWAYS.  Really.  So don't use it.
>> -- */
>> --#define POLL_CS_ALWAYS  PollClassSet_Union(POLL_CS_CPT, POLL_CS_IPC)
>> --
>> --/*
>> -- * Poll class-set taxonomy:
>> -- * POLL_CS_MAIN
>> -- *    - Unless you NEED another class, use POLL_CS_MAIN.
>> -- * POLL_CS_PAUSE
>> -- *    - For callbacks that must occur even if the guest is paused.
>> -- *      Most VMDB or Foundry commands are in this category.
>> -- * POLL_CS_CPT
>> -- *    - Only for callbacks which can trigger intermediate Checkpoint
>> -- *      transitions.
>> -- *      The ONLY such callback is Migrate.
>> -- * POLL_CS_IPC
>> -- *    - Only for callbacks which can contain Msg_(Post|Hint|Question)
>> -- *      responses, and for signal handlers (why)?
>> -- *      Vigor, VMDB, and Foundry can contain Msg_* responses.
>> -- * POLL_CS_MKS
>> -- *    - Callback runs in MKS thread.
>> -- * POLL_CS_ALWAYS
>> -- *    - Only for events that must be processed immediately.
>> -- *      The ONLY such callback is OvhdMemVmxSizeCheck.
>> -- */
>> --
>> --
>> --/*
>> -- * Poll_Callback flags
>> -- */
>> --
>> --#define POLL_FLAG_PERIODIC            0x01    // keep after firing
>> --#define POLL_FLAG_REMOVE_AT_POWEROFF  0x02    // self-explanatory
>> --#define POLL_FLAG_READ                        0x04    // device is ready for reading
>> --#define POLL_FLAG_WRITE                       0x08    // device is ready for writing
>> --#define POLL_FLAG_SOCKET                0x10    // device is a Windows socket
>> --#define POLL_FLAG_NO_BULL               0x20    // callback does its own locking
>> --#define POLL_FLAG_WINSOCK               0x40    // Winsock style write events
>> --#define POLL_FLAG_FD                    0x80    // device is a Windows file descriptor.
>> --#define POLL_FLAG_ACCEPT_INVALID_FDS    0x100   // For broken 3rd party libs, e.g. curl
>> --#define POLL_FLAG_THUNK_TO_WND          0x200   // thunk callback to window message loop
>> --
>> --
>> --typedef void (*PollerFunction)(void *clientData);
>> --typedef void (*PollerFireWrapper)(PollerFunction func,
>> --                                  void *funcData,
>> --                                  void *wrapperData);
>> --typedef Bool (*PollerErrorFn)(const char *errorStr);
>> --
>> --/*
>> -- * Initialisers:
>> -- *
>> -- *      For the sake of convenience, we declare the initialisers
>> -- *      for custom implmentations here, even though the actual
>> -- *      implementations are distinct from the core poll code.
>> -- */
>> --
>> --typedef struct PollOptions {
>> --   Bool locked;           // Use internal MXUser for locking
>> --   Bool allowFullQueue;   // Don't assert when device event queue is full.
>> --   VThreadID windowsMsgThread;       // thread that processes Windows messages
>> --   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
>> --   void *fireWrapperData; // optional
>> --   PollerErrorFn errorFn; // optional; called upon unrecoverable error
>> --} PollOptions;
>> --
>> --
>> --void Poll_InitDefault(void);
>> --void Poll_InitDefaultEx(const PollOptions *opts);
>> --void Poll_InitGtk(void); // On top of glib for Linux
>> --void Poll_InitCF(void);  // On top of CoreFoundation for OSX
>> --
>> --
>> --/*
>> -- * Functions
>> -- */
>> --int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
>> --void Poll_Loop(Bool loop, Bool *exit, PollClass c);
>> --void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
>> --Bool Poll_LockingEnabled(void);
>> --void Poll_Exit(void);
>> --
>> --
>> --/*
>> -- * Poll_Callback adds a callback regardless of whether an identical one exists.
>> -- * The exception to this rule is POLL_DEVICE callbacks: there is a maximum of
>> -- * one read and one write callback per fd.
>> -- *
>> -- * Poll_CallbackRemove removes one callback. If there are multiple identical
>> -- * callbacks, which one is removed is an implementation detail. Note that in
>> -- * the case of POLL_DEVICE and POLL_REALTIME callbacks, the fd/delay used to
>> -- * create the callback is not specified when removing, so all callbacks
>> -- * of those types with the same flags, function, and clientData are considered
>> -- * "identical" even if their fd/delay differed.
>> -- */
>> --
>> --VMwareStatus Poll_Callback(PollClassSet classSet,
>> --                           int flags,
>> --                           PollerFunction f,
>> --                           void *clientData,
>> --                           PollEventType type,
>> --                           PollDevHandle info, // fd/microsec delay
>> --                           MXUserRecLock *lck);
>> --Bool Poll_CallbackRemove(PollClassSet classSet,
>> --                         int flags,
>> --                         PollerFunction f,
>> --                         void *clientData,
>> --                         PollEventType type);
>> --Bool Poll_CallbackRemoveOneByCB(PollClassSet classSet,
>> --                                int flags,
>> --                                PollerFunction f,
>> --                                PollEventType type,
>> --                                void **clientData);
>> --
>> --void Poll_NotifyChange(PollClassSet classSet);
>> --
>> --/*
>> -- * Wrappers for Poll_Callback and Poll_CallbackRemove that present
>> -- * simpler subsets of those interfaces.
>> -- */
>> --
>> --VMwareStatus Poll_CB_Device(PollerFunction f,
>> --                            void *clientData,
>> --                            PollDevHandle device,
>> --                            Bool periodic);
>> --
>> --Bool Poll_CB_DeviceRemove(PollerFunction f,
>> --                          void *clientData,
>> --                          Bool periodic);
>> --
>> --
>> --VMwareStatus Poll_CB_RTime(PollerFunction f,
>> --                           void *clientData,
>> --                           int64 delay,   // microseconds
>> --                           Bool periodic,
>> --                           MXUserRecLock *lock);
>> --
>> --Bool Poll_CB_RTimeRemove(PollerFunction f,
>> --                         void *clientData,
>> --                         Bool periodic);
>> --
>> --
>> --#ifdef _WIN32
>> --void Poll_SetPumpsWindowsMessages(Bool pumps);
>> --void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
>> --Bool Poll_FireWndCallback(void *lparam);
>> --#endif
>> --
>> --#if defined(__cplusplus)
>> --}  // extern "C"
>> --#endif
>> --
>> --#endif // _POLL_H_
>> ---- /dev/null
>>   +++ b/open-vm-tools/lib/include/vm_poll.h
>> -@@ -0,0 +1,330 @@
>> -+/*********************************************************
>> -+ * Copyright (C) 1998-2018 VMware, Inc. All rights reserved.
>> -+ *
>> -+ * This program is free software; you can redistribute it and/or modify it
>> -+ * under the terms of the GNU Lesser General Public License as published
>> -+ * by the Free Software Foundation version 2.1 and no later version.
>> -+ *
>> -+ * This program is distributed in the hope that it will be useful, but
>> -+ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
>> -+ * or FITNESS FOR A PARTICULAR PURPOSE.  See the Lesser GNU General Public
>> -+ * License for more details.
>> -+ *
>> -+ * You should have received a copy of the GNU Lesser General Public License
>> -+ * along with this program; if not, write to the Free Software Foundation, Inc.,
>> -+ * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA.
>> -+ *
>> -+ *********************************************************/
>> -+
>> -+/*********************************************************
>> -+ * The contents of this file are subject to the terms of the Common
>> -+ * Development and Distribution License (the "License") version 1.0
>> -+ * and no later version.  You may not use this file except in
>> -+ * compliance with the License.
>> -+ *
>> -+ * You can obtain a copy of the License at
>> -+ *         http://www.opensource.org/licenses/cddl1.php
>> -+ *
>> -+ * See the License for the specific language governing permissions
>> -+ * and limitations under the License.
>> -+ *
>> -+ *********************************************************/
>> -+
>> -+
>> -+#ifndef _POLL_H_
>> -+#define _POLL_H_
>> -+
>> -+#define INCLUDE_ALLOW_USERLEVEL
>> -+#define INCLUDE_ALLOW_VMCORE
>> -+#include "includeCheck.h"
>> -+
>> -+#include "vm_basic_types.h"
>> -+#include "vm_basic_defs.h"
>> -+#include "vmware.h"
>> -+#include "userlock.h"
>> -+
>> -+#if defined(__cplusplus)
>> -+extern "C" {
>> -+#endif
>> -+
>> -+#ifdef _WIN32
>> -+#define HZ 100
>> -+#elif defined linux
>> -+#include <asm/param.h>
>> -+#elif __APPLE__
>> -+#include <TargetConditionals.h>
>> -+/*
>> -+ * Old SDKs don't define TARGET_OS_IPHONE at all.
>> -+ * New ones define it to 0 on Mac OS X, 1 on iOS.
>> -+ */
>> -+#if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
>> -+#include <sys/kernel.h>
>> -+#endif
>> +@@ -60,7 +60,7 @@ extern "C" {
>> + #if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
>> + #include <sys/kernel.h>
>> + #endif
>> +-#include <sys/poll.h>
>>   +#include <poll.h>
>> -+#define HZ 100
>> -+#endif
>> -+#ifdef __ANDROID__
>> -+/*
>> -+ * <poll.h> of android should be included, but its name is same
>> -+ * with this file. So its content is put here to avoid conflict.
>> -+ */
>> -+#include <asm/poll.h>
>> -+#define HZ 100
>> -+typedef unsigned int  nfds_t;
>> -+int poll(struct pollfd *, nfds_t, long);
>> -+#endif
>> -+
>> -+
>> -+/*
>> -+ * Poll event types: each type has a different reason for firing,
>> -+ * or condition that must be met before firing.
>> -+ */
>> -+
>> -+typedef enum {
>> -+   /*
>> -+    * Actual Poll queue types against which you can register callbacks.
>> -+    */
>> -+   POLL_VIRTUALREALTIME = -1, /* Negative because it doesn't have its own Q */
>> -+   POLL_VTIME = 0,
>> -+   POLL_REALTIME,
>> -+   POLL_DEVICE,
>> -+   POLL_MAIN_LOOP,
>> -+   POLL_NUM_QUEUES
>> -+} PollEventType;
>> -+
>> -+
>> -+/*
>> -+ * Classes of events
>> -+ *
>> -+ * These are the predefined classes.  More can be declared
>> -+ * with Poll_AllocClass().
>> -+ */
>> -+
>> -+typedef enum PollClass {
>> -+   POLL_CLASS_MAIN,
>> -+   POLL_CLASS_PAUSE,
>> -+   POLL_CLASS_IPC,
>> -+   POLL_CLASS_CPT,
>> -+   POLL_CLASS_MKS,
>> -+   POLL_FIXED_CLASSES,
>> -+   POLL_DEFAULT_FIXED_CLASSES,
>> -+   /* Size enum to maximum */
>> -+   POLL_MAX_CLASSES = 31,
>> -+} PollClass;
>> -+
>> -+/*
>> -+ * Do not use; Special pseudo private poll class supported by
>> -+ * PollDefault only
>> -+ */
>> -+#define POLL_DEFAULT_CLASS_NET POLL_FIXED_CLASSES
>> -+#define POLL_DEFAULT_CS_NET    PollClassSet_Singleton(POLL_DEFAULT_CLASS_NET)
>> -+
>> -+/*
>> -+ * Each callback is registered in a set of classes
>> -+ */
>> -+
>> -+typedef struct PollClassSet {
>> -+   uintptr_t bits;
>> -+} PollClassSet;
>> -+
>> -+/* An empty PollClassSet. */
>> -+static INLINE PollClassSet
>> -+PollClassSet_Empty(void)
>> -+{
>> -+   PollClassSet set = { 0 };
>> -+   return set;
>> -+}
>> -+
>> -+/* A PollClassSet with the single member. */
>> -+static INLINE PollClassSet
>> -+PollClassSet_Singleton(PollClass c)
>> -+{
>> -+   PollClassSet s = PollClassSet_Empty();
>> -+
>> -+   ASSERT_ON_COMPILE(POLL_MAX_CLASSES < sizeof s.bits * 8);
>> -+   ASSERT(c < POLL_MAX_CLASSES);
>> -+
>> -+   s.bits = CONST3264U(1) << c;
>> -+   return s;
>> -+}
>> -+
>> -+/* Combine two PollClassSets. */
>> -+static INLINE PollClassSet
>> -+PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
>> -+{
>> -+   PollClassSet set;
>> -+   set.bits = lhs.bits | rhs.bits;
>> -+   return set;
>> -+}
>> -+
>> -+/* Add single class to PollClassSet. */
>> -+static INLINE PollClassSet
>> -+PollClassSet_Include(PollClassSet set, PollClass c)
>> -+{
>> -+   return PollClassSet_Union(set, PollClassSet_Singleton(c));
>> -+}
>> -+
>> -+
>> -+#define POLL_CS_MAIN    PollClassSet_Singleton(POLL_CLASS_MAIN)
>> -+#define POLL_CS_PAUSE   PollClassSet_Union(POLL_CS_MAIN,            \
>> -+                           PollClassSet_Singleton(POLL_CLASS_PAUSE))
>> -+#define POLL_CS_CPT     PollClassSet_Union(POLL_CS_PAUSE,           \
>> -+                           PollClassSet_Singleton(POLL_CLASS_CPT))
>> -+#define POLL_CS_IPC     PollClassSet_Union(POLL_CS_CPT,             \
>> -+                           PollClassSet_Singleton(POLL_CLASS_IPC))
>> -+#define POLL_CS_VMDB    POLL_CS_PAUSE /* POLL_CLASS_VMDB is retired */
>> -+#define POLL_CS_MKS   PollClassSet_Singleton(POLL_CLASS_MKS)
>> -+/*
>> -+ * DANGER.  You don't need POLL_CS_ALWAYS.  Really.  So don't use it.
>> -+ */
>> -+#define POLL_CS_ALWAYS  PollClassSet_Union(POLL_CS_CPT, POLL_CS_IPC)
>> -+
>> -+/*
>> -+ * Poll class-set taxonomy:
>> -+ * POLL_CS_MAIN
>> -+ *    - Unless you NEED another class, use POLL_CS_MAIN.
>> -+ * POLL_CS_PAUSE
>> -+ *    - For callbacks that must occur even if the guest is paused.
>> -+ *      Most VMDB or Foundry commands are in this category.
>> -+ * POLL_CS_CPT
>> -+ *    - Only for callbacks which can trigger intermediate Checkpoint
>> -+ *      transitions.
>> -+ *      The ONLY such callback is Migrate.
>> -+ * POLL_CS_IPC
>> -+ *    - Only for callbacks which can contain Msg_(Post|Hint|Question)
>> -+ *      responses, and for signal handlers (why)?
>> -+ *      Vigor, VMDB, and Foundry can contain Msg_* responses.
>> -+ * POLL_CS_MKS
>> -+ *    - Callback runs in MKS thread.
>> -+ * POLL_CS_ALWAYS
>> -+ *    - Only for events that must be processed immediately.
>> -+ *      The ONLY such callback is OvhdMemVmxSizeCheck.
>> -+ */
>> -+
>> -+
>> -+/*
>> -+ * Poll_Callback flags
>> -+ */
>> -+
>> -+#define POLL_FLAG_PERIODIC            0x01    // keep after firing
>> -+#define POLL_FLAG_REMOVE_AT_POWEROFF  0x02    // self-explanatory
>> -+#define POLL_FLAG_READ                        0x04    // device is ready for reading
>> -+#define POLL_FLAG_WRITE                       0x08    // device is ready for writing
>> -+#define POLL_FLAG_SOCKET                0x10    // device is a Windows socket
>> -+#define POLL_FLAG_NO_BULL               0x20    // callback does its own locking
>> -+#define POLL_FLAG_WINSOCK               0x40    // Winsock style write events
>> -+#define POLL_FLAG_FD                    0x80    // device is a Windows file descriptor.
>> -+#define POLL_FLAG_ACCEPT_INVALID_FDS    0x100   // For broken 3rd party libs, e.g. curl
>> -+#define POLL_FLAG_THUNK_TO_WND          0x200   // thunk callback to window message loop
>> -+
>> -+
>> -+typedef void (*PollerFunction)(void *clientData);
>> -+typedef void (*PollerFireWrapper)(PollerFunction func,
>> -+                                  void *funcData,
>> -+                                  void *wrapperData);
>> -+typedef Bool (*PollerErrorFn)(const char *errorStr);
>> -+
>> -+/*
>> -+ * Initialisers:
>> -+ *
>> -+ *      For the sake of convenience, we declare the initialisers
>> -+ *      for custom implmentations here, even though the actual
>> -+ *      implementations are distinct from the core poll code.
>> -+ */
>> -+
>> -+typedef struct PollOptions {
>> -+   Bool locked;           // Use internal MXUser for locking
>> -+   Bool allowFullQueue;   // Don't assert when device event queue is full.
>> -+   VThreadID windowsMsgThread;       // thread that processes Windows messages
>> -+   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
>> -+   void *fireWrapperData; // optional
>> -+   PollerErrorFn errorFn; // optional; called upon unrecoverable error
>> -+} PollOptions;
>> -+
>> -+
>> -+void Poll_InitDefault(void);
>> -+void Poll_InitDefaultEx(const PollOptions *opts);
>> -+void Poll_InitGtk(void); // On top of glib for Linux
>> -+void Poll_InitCF(void);  // On top of CoreFoundation for OSX
>> -+
>> -+
>> -+/*
>> -+ * Functions
>> -+ */
>> -+int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
>> -+void Poll_Loop(Bool loop, Bool *exit, PollClass c);
>> -+void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
>> -+Bool Poll_LockingEnabled(void);
>> -+void Poll_Exit(void);
>> -+
>> -+
>> -+/*
>> -+ * Poll_Callback adds a callback regardless of whether an identical one exists.
>> -+ * The exception to this rule is POLL_DEVICE callbacks: there is a maximum of
>> -+ * one read and one write callback per fd.
>> -+ *
>> -+ * Poll_CallbackRemove removes one callback. If there are multiple identical
>> -+ * callbacks, which one is removed is an implementation detail. Note that in
>> -+ * the case of POLL_DEVICE and POLL_REALTIME callbacks, the fd/delay used to
>> -+ * create the callback is not specified when removing, so all callbacks
>> -+ * of those types with the same flags, function, and clientData are considered
>> -+ * "identical" even if their fd/delay differed.
>> -+ */
>> -+
>> -+VMwareStatus Poll_Callback(PollClassSet classSet,
>> -+                           int flags,
>> -+                           PollerFunction f,
>> -+                           void *clientData,
>> -+                           PollEventType type,
>> -+                           PollDevHandle info, // fd/microsec delay
>> -+                           MXUserRecLock *lck);
>> -+Bool Poll_CallbackRemove(PollClassSet classSet,
>> -+                         int flags,
>> -+                         PollerFunction f,
>> -+                         void *clientData,
>> -+                         PollEventType type);
>> -+Bool Poll_CallbackRemoveOneByCB(PollClassSet classSet,
>> -+                                int flags,
>> -+                                PollerFunction f,
>> -+                                PollEventType type,
>> -+                                void **clientData);
>> -+
>> -+void Poll_NotifyChange(PollClassSet classSet);
>> -+
>> -+/*
>> -+ * Wrappers for Poll_Callback and Poll_CallbackRemove that present
>> -+ * simpler subsets of those interfaces.
>> -+ */
>> -+
>> -+VMwareStatus Poll_CB_Device(PollerFunction f,
>> -+                            void *clientData,
>> -+                            PollDevHandle device,
>> -+                            Bool periodic);
>> -+
>> -+Bool Poll_CB_DeviceRemove(PollerFunction f,
>> -+                          void *clientData,
>> -+                          Bool periodic);
>> -+
>> -+
>> -+VMwareStatus Poll_CB_RTime(PollerFunction f,
>> -+                           void *clientData,
>> -+                           int64 delay,   // microseconds
>> -+                           Bool periodic,
>> -+                           MXUserRecLock *lock);
>> -+
>> -+Bool Poll_CB_RTimeRemove(PollerFunction f,
>> -+                         void *clientData,
>> -+                         Bool periodic);
>> -+
>> -+
>> -+#ifdef _WIN32
>> -+void Poll_SetPumpsWindowsMessages(Bool pumps);
>> -+void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
>> -+Bool Poll_FireWndCallback(void *lparam);
>> -+#endif
>> -+
>> -+#if defined(__cplusplus)
>> -+}  // extern "C"
>> -+#endif
>> -+
>> -+#endif // _POLL_H_
>> + #define HZ 100
>> + #endif
>> + #ifdef __ANDROID__
>> +diff --git a/open-vm-tools/lib/rpcIn/rpcin.c b/open-vm-tools/lib/rpcIn/rpcin.c
>> +index 8b1fe759..f22fcd40 100644
>>   --- a/open-vm-tools/lib/rpcIn/rpcin.c
>>   +++ b/open-vm-tools/lib/rpcIn/rpcin.c
>>   @@ -57,7 +57,7 @@
>> @@ -740,3 +107,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    #  include "asyncsocket.h"
>>    #  include "vmci_defs.h"
>>    #include "dataMap.h"
>> +--
>> +2.27.0
>> +
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
>> index 0a1d00873..144b5837c 100644
>> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
>> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
>> @@ -1,29 +1,36 @@
>> -From 18eea61a7a768c6c3b57c6683c7bef7049f0f6ab Mon Sep 17 00:00:00 2001
>> +From 4b69d8fd78bf6edbc8b4ace58e621d46071fd8dc Mon Sep 17 00:00:00 2001
>>   From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 13 Jun 2018 23:37:09 -0700
>> -Subject: [PATCH] Use uintmax_t for handling rlim_t
>> +Date: Wed, 24 Mar 2021 17:26:53 -0400
>> +Subject: [PATCH 2/2] Use uintmax_t for handling rlim_t
>>
>>   rlimit types are not representable with long or long long
>>   formats, therefore use uintmax_t to typecast rlim_t types
>>   and use %j to print it
>>
>> +Refit patch for open-vm-tools-11.2.5.
>> +
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>   ---
>>    open-vm-tools/lib/hgfsServer/hgfsServerLinux.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>   diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
>> -index 0e6351a9..a2ee1740 100644
>> +index ba2e5624..889f730a 100644
>>   --- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
>>   +++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
>> -@@ -5294,8 +5294,8 @@ HgfsWriteCheckIORange(off_t offset,         // IN:
>> +@@ -5292,8 +5292,8 @@ HgfsWriteCheckIORange(off_t offset,         // IN:
>>          goto exit;
>>       }
>>
>> --   LOG(6, ("%s: File Size limits: 0x%"FMT64"x 0x%"FMT64"x\n",
>> --           __FUNCTION__, fileSize.rlim_cur, fileSize.rlim_max));
>> -+   LOG(6, ("%s: File Size limits: 0x%jx 0x%jx\n",
>> -+           __FUNCTION__, (uintmax_t)fileSize.rlim_cur, (uintmax_t)fileSize.rlim_max));
>> +-   LOG(6, "%s: File Size limits: 0x%"FMT64"x 0x%"FMT64"x\n",
>> +-       __FUNCTION__, fileSize.rlim_cur, fileSize.rlim_max);
>> ++   //LOG(6, ("%s: File Size limits: 0x%jx 0x%jx\n",
>> ++   //    __FUNCTION__, (uintmax_t)fileSize.rlim_cur, (uintmax_t)fileSize.rlim_max));
>>
>>       /*
>>        * Check the offset is within the file size range.
>> +--
>> +2.30.2
>> +
>> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
>> similarity index 93%
>> rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
>> rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
>> index 832fab1ea..256949a03 100644
>> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
>> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
>> @@ -11,6 +11,10 @@
>>
>>   SUMMARY = "Tools to enhance VMWare guest integration and performance"
>>   HOMEPAGE = "https://github.com/vmware/open-vm-tools"
>> +DESCRIPTION = "\
>> +open-vm-tools is a set of services and modules that enable several features in VMware products \
>> +for better management of and seamless user interactions with guests.\
>> +"
>>   SECTION = "vmware-tools"
>>
>>   LICENSE = "LGPL-2.0 & GPL-2.0 & BSD & CDDL-1.0"
>> @@ -26,7 +30,6 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
>>       file://vmtoolsd.service \
>>       file://vmtoolsd.init \
>>       file://0001-configure.ac-don-t-use-dnet-config.patch;patchdir=.. \
>> -    file://0002-add-include-sys-sysmacros.h.patch;patchdir=.. \
>>       file://0003-Use-configure-test-for-struct-timespec.patch;patchdir=.. \
>>       file://0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch;patchdir=.. \
>>       file://0005-Use-configure-to-test-for-feature-instead-of-platfor.patch;patchdir=.. \
>> @@ -38,15 +41,15 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
>>       file://0011-Use-uintmax_t-for-handling-rlim_t.patch;patchdir=.. \
>>       file://0012-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
>>       file://0013-misc-Do-not-print-NULL-string-into-logs.patch;patchdir=.. \
>> -    file://0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch;patchdir=.. \
>>       file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
>>       file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
>> -    file://0001-utilBacktrace-Ignore-Warray-bounds.patch;patchdir=.. \
>>       file://0001-hgfsmounter-Makefile.am-support-usrmerge.patch;patchdir=.. \
>> -    file://0001-pollGtk-Drop-volatile-qualifier.patch;patchdir=.. \
>>   "
>>
>> -SRCREV = "d3edfd142a81096f9f58aff17d84219b457f4987"
>> +SRC_URI_append_libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
>> +"
>> +
>> +SRCREV = "7ae57c3c7c1f68c74637ad009673dae94ee52570"
>>
>>   S = "${WORKDIR}/git/open-vm-tools"
>>
>> --
>> 2.30.2
>>
