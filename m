Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1172.1627966924860705295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 22:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HYCA4xC5;
 spf=permerror, err=parse error for token &{10 18 testsso.windriver.com}: permanent DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38491ef679=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1734c0ct023714
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 22:02:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=SLNp9thklz97davguPRkUojX48d413Cx/s3maqCXatI=;
 b=HYCA4xC5KTL1ms/9ic22vyLnefdYuf4hCawZF1oVDunxKh0g9t3uLRdNIkrItWyDGNWm
 sIv9niXBaYBA6PZR0yEa8CeCOTFt6my4FFD1cogUwB1NfzW5WR5+kqiD/6l9yuGgN9w0
 xtTLBc5N/CwtyuzyLNLvudTHKYAzWnywAHP/c3PLrdqPxa8HqYtjZC36dD+n2U+8vPeh
 hYtwMOScLMRFZLVgVmXzB2vn9ms+aGIVA3PvKPDhBZ/cM0yk7paLxaK/hII36GGYNxbw
 tcjfxbIKYyX7SiHAEintVHktIE0TACdFO2jFFaVmyc4lXBlmc+WqY75gznopOmBcpofz zQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a68kjrt2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Aug 2021 22:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdNELa0eoHq9nQ4IkrxZUbzyPVWIkcsIaU6AcaouVhpCUoMdGbQRuS+DlhN5RNr2zaYzUjC+eaSAsi4xWw9YQSMgxMbtvC/QHkUwDN9fuebXS9b781HCfhEexTsS4dHIB46LhBhK7biQ+upRKSu646kksS39PLPnBRCoY8O0i40iYriIAQTw7/LzxvkdJHmNwJ3KkrLl85g+B5r/FbPc1opdtNknRwg8yg5UmzMtE8NqRS44w3eYei+lVdA8tfIK6i02bA6Sx7fQ80BEfW5uOTxxWeiQdmVeCVqYtzpgTNLB+us7AIsbpEEiBVPfSfnLg8VH7ZZCRrYdBPcM5B+nsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLNp9thklz97davguPRkUojX48d413Cx/s3maqCXatI=;
 b=dOuQQtHxgEfmtmI2zT5owZC/kF+FJEzZXwssXlPm0vkFqmY6nHtlkLYdXh3QEmfAg+YNlzrwc/U5aXGF6dMV3prNPEBLYNsFHVMIkhRrj4+Pkwe7FZyY6CGUdUSiGNyA9cVhXIEcaHdS1IotFG7UTK6o+3lNtLmIZxPnzG/tzDVO5fjfYfFapmLYA+vaNGfPkSSF7aTB/6RHfWHDZFipKKYOBVdM28Ep05ch+5Ct7UPr5oK/IYF9bZ+3UIj8bPGkzn0vNjl3xDb2XqaZhsDR706SoIhfaAnkrqrEpxt6ud+VQGs4JW1V6MSOihjxuAU8LnW3Eq/+cEcod3i5Hfs3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2320.namprd11.prod.outlook.com (2603:10b6:301:53::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Tue, 3 Aug
 2021 05:02:00 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%6]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 05:02:00 +0000
Subject: Re: [oe] [meta-oe][PATCH 2/2] audit: fix compile error for 2.8.5
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <20210803045739.276613-1-yi.zhao@windriver.com>
 <1697B31076AB0A02.26051@lists.openembedded.org>
Message-ID: <c6cb93e9-e668-3f0c-c020-e0b467c799b1@windriver.com>
Date: Tue, 3 Aug 2021 13:01:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1697B31076AB0A02.26051@lists.openembedded.org>
X-ClientProxiedBy: HK2PR02CA0187.apcprd02.prod.outlook.com
 (2603:1096:201:21::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR02CA0187.apcprd02.prod.outlook.com (2603:1096:201:21::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 05:01:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de24c104-542a-484f-099d-08d9563bd39d
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2320:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB232026F0BC678118245242ECF9F09@MWHPR1101MB2320.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G9+pyD0beRCWlyQK8pAckjkKnKPRx3tRM1NUX7u6I4o66q6C9OhK8nBWNKYArK6qSoG6ZiPAZ+dfsamPsmgNQLS9B9Lm8eIlEsbitcjMxYCE1GDVf2dbOJc4xRdqP9oTw8pDGv/+JxtLcLyFyEgy6JY44itsXnjVT7OLX/w5dQaDD8cacAvdIDEqYiwy3ULlYDOJ9P9LrzaXShrPHcCbrVk1MdsdZZp5uYHh7qmH/OVWD3e0vAl3DKhNUig8wKTLyXzfsjTXCGogxS+2H7q6qRwJvqsLTlIHVqtvKSG7+ngFqo1bxQfMQ6CBiPvE+QytzqhRdS4oT98igXTb3x1AMHabQ1U42JBD5q/dM1m7FaQ8i4R+0MQevI3OIOGctQQekxpbHOwTt+t8JWMufF8vRIRd6d647dtPsASDsiRZS415x4rqTC626T1Np4eD4EIYrzQK6h+38ueqjHJQcI1tLsjGN+DRSKPx1L8W+3bB7bTZ/1Yu386IF7t/9P+7/hmf/ATGmnB+S0ELfeJjVfjsI29OUcdzXN+YBXz8EMHAMPc8oJLt9/4BkBr08WLo9+b0eMdWCVk5pTz1uiC6Y9TGBqtIxyeqOi7ooN6qitSn3GVMyt+t06RO734QgSkwTTSOKE98sLZ7wOY8fuExIYLbchvrgdmvRKNlZI2r+lfSkvjIvTul2c8IdN0PECHJdfxqrNYWYwvgSHRzpsmd2U6WlHohKQrIwjHwccqcYPmUNCp+zpfG1cOvnFKmYnSO8030K4Sj/EJswb12aRgzk4qSB/hvlN3m0XfT+Wjjyd1JW4tPdUVxQ74wkBQ5Hi3RfzjTBvp2CIjOyvLWxCaRv5BaShTBLNquygF8aW/pTTwib1oys/I6NbifAh3OuLsrUICQdnjHlGEKBZpopvPsc7yapg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(83380400001)(8676002)(2906002)(38350700002)(166002)(6486002)(38100700002)(8936002)(36756003)(6666004)(26005)(186003)(33964004)(86362001)(52116002)(53546011)(31686004)(2616005)(956004)(44832011)(478600001)(316002)(30864003)(66476007)(66556008)(16576012)(966005)(66946007)(31696002)(5660300002)(6916009)(6706004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0VUQ0RVTzZLeEJvbGRnd2ZmS0t3a0FJU3pDTTBRV0pDNVNhdERNL29JR1Ft?=
 =?utf-8?B?UW4xUlFmYzdNbjJCRXRQanRNQ0FiV3RMdEV5ODM5R1h6a01xRWZrZmlVTzdU?=
 =?utf-8?B?WDkzZUNWZFJqOWQ4REFSYjhVZHhVR3pRYXI3WG1YMHBwSDd3aWFmdjZzRUlH?=
 =?utf-8?B?eFpQdjJlSWJTM0JHUlpJSTNMdEUvUldvNnF1UE1YRnVNZTREc0ZNVkxyL2dh?=
 =?utf-8?B?bE9jSllhN251eElVdTlXMno0NmN5am5obVBLanR5N0lpTWlGU2srVmpEWUR6?=
 =?utf-8?B?SkFDSlF2b1IrTVhnVTBxVXpqZk1Sbnd5SGx1RnBXUkZMVTFzc1I2ZVlVRURi?=
 =?utf-8?B?bVFHM0cwa0JQZ05OWng3YW1KYlRhVndSYmVDb1E5bUlGYkxESS8xOGJ1eVpJ?=
 =?utf-8?B?WmE4NlppdGlxT3JTdWh5YVoxc2o0RFFQemhCOWZsZHoxYWVxb0M3cDVFVVEz?=
 =?utf-8?B?L2c0TDZ3Y3VxNy9hdHpGMU53dUZXbUxOSTZTZEhHOGxlamhBZEpqN2xDRVdh?=
 =?utf-8?B?UXRzY25CMUxVQ2FuWDh4bnhEVVI0TkMxVm1EQ3U2U0IyOW9VZjh4cE81Rlp6?=
 =?utf-8?B?TTkrM3ZCYlQwZkVhWWI3a3JRRFZFd0hwL3UvcDJXSWVQRGNhL3RPdW9vWXBQ?=
 =?utf-8?B?cUU0M1Q1K3pMOHJqOXdqcG9YbHJlcnBrY1hKMGxqbUtISThPQUdxd1JWRUZ6?=
 =?utf-8?B?T3lZckhZcTFNc1cwUEpUZ2ZyanpBZ2JJNm5vMzFlTU9qcWp0UENiaDBZRlRP?=
 =?utf-8?B?UzJLSVFJNk8zQnJYOFBLbG5sQ2RVQkErZk8xb2czTjJMVUVCZ2hOS0s3cGpG?=
 =?utf-8?B?RzF1ZmFERFRpZDBpbFhzZytDWnQ3c1dnTjVxQ3pIK0pUTkJyY3dGaE9HV1hQ?=
 =?utf-8?B?VFY1dElyT1NZaUZ1NktRaHorTFVmTlAzVCtzbS9ESzJTZDVnZU1uQjhxZlg3?=
 =?utf-8?B?Nmx5TnA5S0JaNG5tdHFITEhJYXBFYkpkaWE0R3hJT0hDOWZDaU1JWk1WQ0pw?=
 =?utf-8?B?THVvMG84c1VTK3d0d25FckViaHlpR1pyclViaEFSQTNvZHdMZEdvM3hhLzVh?=
 =?utf-8?B?ZzZ4V1lzc0NXNHNQa0NyMzdHakk5ckdQQThnQWRucTVrZmJ1eHFHcnA3bk9E?=
 =?utf-8?B?NzFEdVdqYmg5dE1nWUM3cnYvMSthZWx0b3Y3Y2RTa0NQSER5TXhkY2QyRHBn?=
 =?utf-8?B?Zm1obktKY0pKMnVJRFpWM3ZMemcydEprbGVVSm9vS2lucmZnNUwrM09pVUdh?=
 =?utf-8?B?V0gwekhsYkRZNXpxYVlKNXVEc0FBMWJPS24rcGowUEpTLzJnSlR2SlIya2FH?=
 =?utf-8?B?SEdtS29mQ3d4aHVmcUo0bFBSTmZmUGJjUnU2eTg5WTR3MHliU3h0S2szNHAv?=
 =?utf-8?B?ZCtSNDE5MDdOT2pTdUpLcnlCbEQ5bzQ5S0psSkRkQ0phb2VHblFaQUtrcnZR?=
 =?utf-8?B?VnBrdDNSOEt1bmlTQzZJRDEwYVhzZ2EyZlpPa0NtblI5VzFBcDBnZi9QQjFF?=
 =?utf-8?B?dkt1cEQ2RmNjelQ4eUF4ODd6bVovVGZXZzZoYnJaS0lnK3gxWnoyYUN2RmN1?=
 =?utf-8?B?ZDYyYk5qcDNHSHRTcEtySjYvNkJIQWVBRmRCVDJPOWdVcnl1KytGMHJjMmww?=
 =?utf-8?B?WmhBcnlrNTByb2hMRHU3eGQ0MDVWVXJHWUJqV29kNnlraVIwbGtxcVZ6ckkw?=
 =?utf-8?B?bm9XRk0xTU5RY0U1S0pnajVUS2lmQnprVmtkb29hT0FZd1ZJMEZ4bnZFejRl?=
 =?utf-8?Q?YoANd3iv5v+Cux7uzbsZhq3sNvbb7TMGf5tyyrM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de24c104-542a-484f-099d-08d9563bd39d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 05:02:00.5946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NQbYoV+TgNU7tYrixUho6uu0KovNzi42BdRZCraahT7R55sAL4G9eqlEtqf0lt1PW2rYTF2rrnRiSbiBkjxsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2320
X-Proofpoint-ORIG-GUID: 2blyPgd1xzGU5JUDhgxigjDGykL73VIS
X-Proofpoint-GUID: 2blyPgd1xzGU5JUDhgxigjDGykL73VIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-02_10,2021-08-02_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030031
Content-Type: multipart/alternative;
 boundary="------------1E7EC3802571854D3CF48016"
Content-Language: en-US

--------------1E7EC3802571854D3CF48016
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry. Please ignore this patch. I will send V2.


//Yi


On 8/3/21 12:57 PM, Yi Zhao wrote:
> Backport a patch to fix the compile error and refresh the patches to fix
> the patch-fuzz warning.
>
> Fixes:
> tmp/work/core2-64-poky-linux/audit/2.8.5-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/11.1.1/ld:
> ausearch-checkpt.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: multiple definition of `event_node_list';
> ausearch.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: first defined here
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   ...ue-functions-for-strndupa-rawmemchr.patch} |  6 +-
>   ...-Fixed-swig-host-contamination-issue.patch | 57 +++++++++++++++++++
>   ...ns-need-to-be-external-when-building.patch | 30 ++++++++++
>   meta-oe/recipes-security/audit/audit_2.8.5.bb |  9 +--
>   4 files changed, 95 insertions(+), 7 deletions(-)
>   rename meta-oe/recipes-security/audit/audit/{Add-substitue-functions-for-strndupa-rawmemchr.patch => 0001-Add-substitue-functions-for-strndupa-rawmemchr.patch} (97%)
>   create mode 100644 meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
>   create mode 100644 meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
>
> diff --git a/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch b/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
> similarity index 97%
> rename from meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
> rename to meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
> index bb6c61e80..ed1c0e2b5 100644
> --- a/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
> +++ b/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
> @@ -1,4 +1,4 @@
> -From bdcdc3dff4469aac88e718bd15958d5ed4b9392a Mon Sep 17 00:00:00 2001
> +From d5a4b800a696b8b8d2c0f0bad098b1a8ff94333f Mon Sep 17 00:00:00 2001
>   From: Steve Grubb <sgrubb@redhat.com>
>   Date: Tue, 26 Feb 2019 18:33:33 -0500
>   Subject: [PATCH] Add substitue functions for strndupa & rawmemchr
> @@ -68,7 +68,7 @@ index 51c4a5e..67b7b77 100644
>    				break;
>    			*ptr = ' ';
>   diff --git a/configure.ac b/configure.ac
> -index 54bdbf1..aef07fb 100644
> +index 6e345f1..6f3007e 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -1,7 +1,7 @@
> @@ -129,5 +129,5 @@ index 5d17a72..758c33e 100644
>     * This function will look at the line and pick out pieces of it.
>     */
>   --
> -2.7.4
> +2.17.1
>   
> diff --git a/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
> new file mode 100644
> index 000000000..4a1b97997
> --- /dev/null
> +++ b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
> @@ -0,0 +1,57 @@
> +From 3467abce1f3cfc96f9bdace7c09d95218cbcaeb1 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Sun, 19 Jul 2015 02:42:58 +0900
> +Subject: [PATCH] audit: Fixed swig host contamination issue
> +
> +The audit build uses swig to generate a python wrapper.
> +Unfortunately, the swig info file references host include
> +directories.  Some of these were previously noticed and
> +eliminated, but the one fixed here was not.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
> +Signed-off-by: Joe Slater <jslater@windriver.com>
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + bindings/swig/python3/Makefile.am | 3 ++-
> + bindings/swig/src/auditswig.i     | 2 +-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
> +index 9938418..fa46aac 100644
> +--- a/bindings/swig/python3/Makefile.am
> ++++ b/bindings/swig/python3/Makefile.am
> +@@ -22,6 +22,7 @@
> + CONFIG_CLEAN_FILES = *.loT *.rej *.orig
> + AM_CFLAGS = -fPIC -DPIC -fno-strict-aliasing $(PYTHON3_CFLAGS)
> + AM_CPPFLAGS = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
> ++STDINC ?= /usr/include
> + LIBS = $(top_builddir)/lib/libaudit.la
> + SWIG_FLAGS = -python -py3 -modern
> + SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
> +@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudi
> + _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
> + nodist__audit_la_SOURCES  = audit_wrap.c
> + audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i
> +-	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/auditswig.i
> ++	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} -I$(STDINC) ${srcdir}/../src/auditswig.i
> +
> + CLEANFILES = audit.py* audit_wrap.c *~
> +
> +diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
> +index 7ebb373..424fb68 100644
> +--- a/bindings/swig/src/auditswig.i
> ++++ b/bindings/swig/src/auditswig.i
> +@@ -39,7 +39,7 @@ signed
> + #define __attribute(X) /*nothing*/
> + typedef unsigned __u32;
> + typedef unsigned uid_t;
> +-%include "/usr/include/linux/audit.h"
> ++%include "linux/audit.h"
> + #define __extension__ /*nothing*/
> + #include <stdint.h>
> + %include "../lib/libaudit.h"
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch b/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
> new file mode 100644
> index 000000000..f209e560b
> --- /dev/null
> +++ b/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
> @@ -0,0 +1,30 @@
> +From 2938f46d318df4a09565db837b60bafd0300f858 Mon Sep 17 00:00:00 2001
> +From: Steve Grubb <sgrubb@redhat.com>
> +Date: Fri, 10 Jan 2020 21:13:50 -0500
> +Subject: [PATCH] Header definitions need to be external when building with
> + -fno-common (which is default in GCC 10) - Tony Jones
> +
> +Upstream-Status: Backport
> +[https://github.com/linux-audit/audit-userspace/commit/017e6c6ab95df55f34e339d2139def83e5dada1f]
> +
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + src/ausearch-common.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/ausearch-common.h b/src/ausearch-common.h
> +index 6669203..3040547 100644
> +--- a/src/ausearch-common.h
> ++++ b/src/ausearch-common.h
> +@@ -50,7 +50,7 @@ extern pid_t event_pid;
> + extern int event_exact_match;
> + extern uid_t event_uid, event_euid, event_loginuid;
> + extern const char *event_tuid, *event_teuid, *event_tauid;
> +-slist *event_node_list;
> ++extern slist *event_node_list;
> + extern const char *event_comm;
> + extern const char *event_filename;
> + extern const char *event_hostname;
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-security/audit/audit_2.8.5.bb b/meta-oe/recipes-security/audit/audit_2.8.5.bb
> index ee3b3b5e0..ec04a0444 100644
> --- a/meta-oe/recipes-security/audit/audit_2.8.5.bb
> +++ b/meta-oe/recipes-security/audit/audit_2.8.5.bb
> @@ -8,8 +8,9 @@ LICENSE = "GPLv2+ & LGPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>   
>   SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=2.8_maintenance \
> -           file://Add-substitue-functions-for-strndupa-rawmemchr.patch \
> -           file://Fixed-swig-host-contamination-issue.patch \
> +           file://0001-Add-substitue-functions-for-strndupa-rawmemchr.patch \
> +           file://0002-Fixed-swig-host-contamination-issue.patch \
> +           file://0003-Header-definitions-need-to-be-external-when-building.patch \
>              file://auditd \
>              file://auditd.service \
>              file://audit-volatile.conf \
> @@ -39,9 +40,9 @@ EXTRA_OECONF += "--without-prelude \
>           --without-python \
>           --without-golang \
>           --disable-zos-remote \
> +        --with-arm=yes \
> +        --with-aarch64=yes \
>           "
> -EXTRA_OECONF_append_arm = " --with-arm=yes"
> -EXTRA_OECONF_append_aarch64 = " --with-aarch64=yes"
>   
>   EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' \
>   	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
>
> 
>

--------------1E7EC3802571854D3CF48016
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Sorry. Please ignore this patch. I will send V2.</p>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/21 12:57 PM, Yi Zhao wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1697B31076AB0A02.26051@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Backport a patch to fix the compile error and refresh the patches to fix
the patch-fuzz warning.

Fixes:
tmp/work/core2-64-poky-linux/audit/2.8.5-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/11.1.1/ld:
ausearch-checkpt.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: multiple definition of `event_node_list';
ausearch.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: first defined here

Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
---
 ...ue-functions-for-strndupa-rawmemchr.patch} |  6 +-
 ...-Fixed-swig-host-contamination-issue.patch | 57 +++++++++++++++++++
 ...ns-need-to-be-external-when-building.patch | 30 ++++++++++
 meta-oe/recipes-security/audit/audit_2.8.5.bb |  9 +--
 4 files changed, 95 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-security/audit/audit/{Add-substitue-functions-for-strndupa-rawmemchr.patch =&gt; 0001-Add-substitue-functions-for-strndupa-rawmemchr.patch} (97%)
 create mode 100644 meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
 create mode 100644 meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch

diff --git a/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch b/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
similarity index 97%
rename from meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
rename to meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
index bb6c61e80..ed1c0e2b5 100644
--- a/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
+++ b/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
@@ -1,4 +1,4 @@
-From bdcdc3dff4469aac88e718bd15958d5ed4b9392a Mon Sep 17 00:00:00 2001
+From d5a4b800a696b8b8d2c0f0bad098b1a8ff94333f Mon Sep 17 00:00:00 2001
 From: Steve Grubb <a class="moz-txt-link-rfc2396E" href="mailto:sgrubb@redhat.com">&lt;sgrubb@redhat.com&gt;</a>
 Date: Tue, 26 Feb 2019 18:33:33 -0500
 Subject: [PATCH] Add substitue functions for strndupa &amp; rawmemchr
@@ -68,7 +68,7 @@ index 51c4a5e..67b7b77 100644
  				break;
  			*ptr = ' ';
 diff --git a/configure.ac b/configure.ac
-index 54bdbf1..aef07fb 100644
+index 6e345f1..6f3007e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1,7 +1,7 @@
@@ -129,5 +129,5 @@ index 5d17a72..758c33e 100644
   * This function will look at the line and pick out pieces of it.
   */
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
new file mode 100644
index 000000000..4a1b97997
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
@@ -0,0 +1,57 @@
+From 3467abce1f3cfc96f9bdace7c09d95218cbcaeb1 Mon Sep 17 00:00:00 2001
+From: Li xin <a class="moz-txt-link-rfc2396E" href="mailto:lixin.fnst@cn.fujitsu.com">&lt;lixin.fnst@cn.fujitsu.com&gt;</a>
+Date: Sun, 19 Jul 2015 02:42:58 +0900
+Subject: [PATCH] audit: Fixed swig host contamination issue
+
+The audit build uses swig to generate a python wrapper.
+Unfortunately, the swig info file references host include
+directories.  Some of these were previously noticed and
+eliminated, but the one fixed here was not.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Anders Hedlund <a class="moz-txt-link-rfc2396E" href="mailto:anders.hedlund@windriver.com">&lt;anders.hedlund@windriver.com&gt;</a>
+Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:jslater@windriver.com">&lt;jslater@windriver.com&gt;</a>
+Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
+---
+ bindings/swig/python3/Makefile.am | 3 ++-
+ bindings/swig/src/auditswig.i     | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
+index 9938418..fa46aac 100644
+--- a/bindings/swig/python3/Makefile.am
++++ b/bindings/swig/python3/Makefile.am
+@@ -22,6 +22,7 @@
+ CONFIG_CLEAN_FILES = *.loT *.rej *.orig
+ AM_CFLAGS = -fPIC -DPIC -fno-strict-aliasing $(PYTHON3_CFLAGS)
+ AM_CPPFLAGS = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
++STDINC ?= /usr/include
+ LIBS = $(top_builddir)/lib/libaudit.la
+ SWIG_FLAGS = -python -py3 -modern
+ SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
+@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudi
+ _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
+ nodist__audit_la_SOURCES  = audit_wrap.c
+ audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i 
+-	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/auditswig.i 
++	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} -I$(STDINC) ${srcdir}/../src/auditswig.i
+ 
+ CLEANFILES = audit.py* audit_wrap.c *~
+ 
+diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
+index 7ebb373..424fb68 100644
+--- a/bindings/swig/src/auditswig.i
++++ b/bindings/swig/src/auditswig.i
+@@ -39,7 +39,7 @@ signed
+ #define __attribute(X) /*nothing*/
+ typedef unsigned __u32;
+ typedef unsigned uid_t;
+-%include &quot;/usr/include/linux/audit.h&quot;
++%include &quot;linux/audit.h&quot;
+ #define __extension__ /*nothing*/
+ #include &lt;stdint.h&gt;
+ %include &quot;../lib/libaudit.h&quot;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch b/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
new file mode 100644
index 000000000..f209e560b
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
@@ -0,0 +1,30 @@
+From 2938f46d318df4a09565db837b60bafd0300f858 Mon Sep 17 00:00:00 2001
+From: Steve Grubb <a class="moz-txt-link-rfc2396E" href="mailto:sgrubb@redhat.com">&lt;sgrubb@redhat.com&gt;</a>
+Date: Fri, 10 Jan 2020 21:13:50 -0500
+Subject: [PATCH] Header definitions need to be external when building with
+ -fno-common (which is default in GCC 10) - Tony Jones
+
+Upstream-Status: Backport
+[<a class="moz-txt-link-freetext" href="https://github.com/linux-audit/audit-userspace/commit/017e6c6ab95df55f34e339d2139def83e5dada1f">https://github.com/linux-audit/audit-userspace/commit/017e6c6ab95df55f34e339d2139def83e5dada1f</a>]
+
+Signed-off-by: Alex Kiernan <a class="moz-txt-link-rfc2396E" href="mailto:alex.kiernan@gmail.com">&lt;alex.kiernan@gmail.com&gt;</a>
+---
+ src/ausearch-common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ausearch-common.h b/src/ausearch-common.h
+index 6669203..3040547 100644
+--- a/src/ausearch-common.h
++++ b/src/ausearch-common.h
+@@ -50,7 +50,7 @@ extern pid_t event_pid;
+ extern int event_exact_match;
+ extern uid_t event_uid, event_euid, event_loginuid;
+ extern const char *event_tuid, *event_teuid, *event_tauid;
+-slist *event_node_list;
++extern slist *event_node_list;
+ extern const char *event_comm;
+ extern const char *event_filename;
+ extern const char *event_hostname;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-security/audit/audit_2.8.5.bb b/meta-oe/recipes-security/audit/audit_2.8.5.bb
index ee3b3b5e0..ec04a0444 100644
--- a/meta-oe/recipes-security/audit/audit_2.8.5.bb
+++ b/meta-oe/recipes-security/audit/audit_2.8.5.bb
@@ -8,8 +8,9 @@ LICENSE = &quot;GPLv2+ &amp; LGPLv2+&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f">&quot;file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f&quot;</a>
 
 SRC_URI = &quot;git://github.com/linux-audit/${BPN}-userspace.git;branch=2.8_maintenance \
-           <a class="moz-txt-link-freetext" href="file://Add-substitue-functions-for-strndupa-rawmemchr.patch">file://Add-substitue-functions-for-strndupa-rawmemchr.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://Fixed-swig-host-contamination-issue.patch">file://Fixed-swig-host-contamination-issue.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-Add-substitue-functions-for-strndupa-rawmemchr.patch">file://0001-Add-substitue-functions-for-strndupa-rawmemchr.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0002-Fixed-swig-host-contamination-issue.patch">file://0002-Fixed-swig-host-contamination-issue.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0003-Header-definitions-need-to-be-external-when-building.patch">file://0003-Header-definitions-need-to-be-external-when-building.patch</a> \
            <a class="moz-txt-link-freetext" href="file://auditd">file://auditd</a> \
            <a class="moz-txt-link-freetext" href="file://auditd.service">file://auditd.service</a> \
            <a class="moz-txt-link-freetext" href="file://audit-volatile.conf">file://audit-volatile.conf</a> \
@@ -39,9 +40,9 @@ EXTRA_OECONF += &quot;--without-prelude \
         --without-python \
         --without-golang \
         --disable-zos-remote \
+        --with-arm=yes \
+        --with-aarch64=yes \
         &quot;
-EXTRA_OECONF_append_arm = &quot; --with-arm=yes&quot;
-EXTRA_OECONF_append_aarch64 = &quot; --with-aarch64=yes&quot;
 
 EXTRA_OEMAKE += &quot;PYLIBVER='python${PYTHON_BASEVERSION}' \
 	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1E7EC3802571854D3CF48016--
