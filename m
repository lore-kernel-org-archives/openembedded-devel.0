Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E41EE7718B
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 04:23:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.77523.1735619013867418586
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Dec 2024 20:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3095ea9653=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV4E2uA009948
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 20:23:33 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq1yy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 20:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCrm8ZfMqnuYSJHECRkvsddf7BDXjCYe5eoTYcSBYCi2yz4PCDEgQXbBwcm3TMVqgEcWyTw3EGh/jusJhq8DNf95sv1jPJkWxv+mCnwIeXxOq7f1COSMmcQ279q85buxy1++O9QtKeAnMJIo65wrSFdTsW0kQpEqeeT0l6m0/OLSLwFfY7Em3LrY/5bD0maQSQNCmQhaVryrFMkKTjsxsY61yAFV6WBpxL6bUl5Q4unj69gyG6DRwgJDySlU3t08DMXUTnii32DMAytQEpecd4LMOeCSeSkLoLJTFegB58l2INQ/CHeshjxA92E2C14QPOraIMXXrcVxnOLZCzjLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfSFQzffeA8ysQRIPoZH5U8ocS2C5mEWgcZaaK8fSRY=;
 b=ajK/ZI1UniHNwOoqs2a/pGlh5FAsTjSn/tNazTamcl7N7AY8Vn/MxDRNLDHyON+Wa3kKHHHqV/7DNg+y5lFW77R4NcCJdzFVeyjQCS9bwvuDhwrWxRx0ctlgH7bNhPoDNcVLyggnygdQwltaDvyiy4F9wwmdLo/Cdc/m5HUvVmKzXrwlVnNQYKw3K3EvGK74A/bQS2j3OlFc8dhz2nUPj5BcRb4djUNPG5NhnPd3ze6mklrGvyXl+4nbpqZjiY0uOIaNLcfV7YFbR5Xv/1PXtMHVQY/iotJHzSJAGbo884T28jXAmn62pLC8BYp/nftHokWSTvNUUD/BIUdbspaW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8293.19; Tue, 31 Dec 2024 04:23:26 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 04:23:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] nspr: upgrade 4.35 -> 4.36
Date: Tue, 31 Dec 2024 12:23:09 +0800
Message-Id: <20241231042310.3947402-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b5f050-4902-4a13-24a3-08dd2952df04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dzzJaWt96rg71fJ277Hh4EXR2AttYzO77zDcAWHFhxYHu2g/G+enXdn87Bq3?=
 =?us-ascii?Q?NVgwz7tKBYgBsYDf3XgWe3AhqVZJwsrfOIF5UKytJi+qMlKA0Yzw0OuouTRl?=
 =?us-ascii?Q?EazqyJ5fJyhydXDjzMZD0W+uHPeukVrKeT2ARfcwHuAfd4ZMTGgCkpNXTy2u?=
 =?us-ascii?Q?HXQADiQ02rdEX/VPzd++Y2Kap4KWE/o7oU8I0JX7FWoTPbQGlRXaPtxtaE9/?=
 =?us-ascii?Q?1sMwBrKIu6gaGGB1OwL7bKRrQz0kQMp1yWnZ1au+K4xlRff3t8dSkooDomBs?=
 =?us-ascii?Q?7xil17P3La++8eAtgTj6NkE05D3k17KPm2Ot+UQufIcyA9hHfkE8RXMEym32?=
 =?us-ascii?Q?3DoCEh6jAdjlefSv5GXXx6yyF+yT7CoPs/9NdI2SV5xs5f8XiIzh3xVffeAE?=
 =?us-ascii?Q?43ZbNykWgQiftdQpaZxRrAmwzVF7y/6gLiDjEWTcxinhUxFRWfD4k1L4lxV/?=
 =?us-ascii?Q?nz22eZhGKpl7rPYUopNbASxQdlUoDJ/NVcKPi3V5weH1Oupvi+ww8wFqXns8?=
 =?us-ascii?Q?dvqm44UE+yaFXU8Hpvhsd1oKikgSb8Iektd4EbRFpaC6VBQfa48NvgkUjisV?=
 =?us-ascii?Q?NwA8DohHn9Rc8apASzP0qGEYEpxTGMI8svUYUVwbQcqYggwjcXWzyPfhwXxy?=
 =?us-ascii?Q?Qr9+H766aiW8/ZgvYVIa5V1ry1StQhjRbLOmq48DccJQHK3GeQhCV/fwMkaN?=
 =?us-ascii?Q?BztHOHmxAwlsos32nLpNZYP9Wz89N6SYlgKQ4XVBmiXGC0rvBPO471X5EUwY?=
 =?us-ascii?Q?Fs8Pz4+UbsoDpqrFz/KgXeVXJiYgJ8SuyWDaG39U2NqnY8t0LGXPlL717uve?=
 =?us-ascii?Q?VOb0T5s6eJaVKxoZjFndUcw6H9Ov4yYvOk9kfeSpnuPQbGq4S4GNiCoIOggS?=
 =?us-ascii?Q?K4GO30OL6VwQWH+tOjg2UWKTN0gis+sCfHt55AdMTsfEZBhEPt5VDM18zqEm?=
 =?us-ascii?Q?83+J8x44SM/kNuAmnrMXqDNlrWC+XJsrVDmqyVrol+imu6mxyEQzp6QZv0zx?=
 =?us-ascii?Q?AMSj9nw0H9a6PV2VVdq+7AeNhj+BHJLxqKvB63/8ZSF7LznP1zCe3hU6A9o6?=
 =?us-ascii?Q?pmzmxN3oFiIIIQvTBm3w5rl/8yLF7Di+zkUHPyP6yQvfv8mA3mLe1zsdGYFb?=
 =?us-ascii?Q?GdDKc2AJbzfsagp4EqYRpbGBDn2GXF9f3mkCFaO2+CxUdh8qXXyMS9qwMCTU?=
 =?us-ascii?Q?GFl3Loe7BIlpR4DnNKdgujR9oQBLfg1+IvNmhtIble3fQ6f+IdwTgFa+QUuW?=
 =?us-ascii?Q?x+gn6I5YfUhz/cLdYQz8aynhGs1iZZj1aszd/gZQkhFLlvnim2hsyACH1fpb?=
 =?us-ascii?Q?wwzYjhzGkkRKOW4euQwFn8C6rBKYuD5BwGLXzY4BPsmQLEuvBmg7ZR/V0+c8?=
 =?us-ascii?Q?+ZlDLBSbZ+PPjKNvveCUu0F0ruP6AfhPT/jGqsZOUF8bmVw+nA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GrI1pIkobBq90aJMHicLyrK4zQsQnlldNueG2BWBQqGOpJqjenDK8JBeCIid?=
 =?us-ascii?Q?geQR/tsQPBm1THJIOubdlYtQA451qDzQl3KDKPDHs6wcsOg6eTDuoE9vJvEL?=
 =?us-ascii?Q?Qif0v8dt/7Ukn0Ag3Yjpr80TBMu/BN7ZVj7eG//7XiYlcz+ibTbeQ79jh/yV?=
 =?us-ascii?Q?CHsrfHxsFfmjvNALB+o6CLPU7fcwvcP7nNDXheTgPXqFmMQTr4ZU0OLYV17r?=
 =?us-ascii?Q?tbLkeYdExf2MdDUARQ+MfGBsaOIAHExLkI1ONjtHPQo0Tb7CPAu0OmQBudMc?=
 =?us-ascii?Q?xZOTr0wXBlVJfMp72L3ZZcKIxk9I3xBVl2xVq0ScVo7kpGeQ1t+qHIcSlLZ3?=
 =?us-ascii?Q?IXzJJDT/ISqb7JseUdrMVH9JqQHNOKzbrvQYGeVMYVRLdxePpgqOQUKy80hj?=
 =?us-ascii?Q?WBvJlqHBlLfHiuINVy2HUj8o/FU0ZXI2z4OaeHCVVB+8ABCFLYfchaAsny9r?=
 =?us-ascii?Q?5QtqA5VpBbBJ99NowrgRgFAWfvVB2Do9P6adgQja7MYCorGNsDxQWsaU3UUp?=
 =?us-ascii?Q?BjOJmOOh1Sgy+yMToxFfN7QPTQZSdotr2BkKJc8gSAOzauK9Jb2yqOpoXehe?=
 =?us-ascii?Q?ATNv/utIf5ZL4fMEsR8sgnj/BC5OHSQCBK8sk49xCBQp+HA4YFePDfLjvFxc?=
 =?us-ascii?Q?mOKKeiRuqaWF+d/GCpyni4eo3F5WqRHb/EuVGTzBWJUyHFq9yVJ025UVKDpb?=
 =?us-ascii?Q?ve6j7KTPb/JhzrCY5Ns/JnU0YwsFujavp50iY/G9WiQ5LZkuAAF+1QlVgdgy?=
 =?us-ascii?Q?jhH4i11ez2GnX84eSWcnzYMwDF6yJUk+C3oBIIie7YYUMcCx3BxDaZJ1oD80?=
 =?us-ascii?Q?l112G2yJ5gV/gqT2zppfEfviesgmkWT01uPid4CP0RQFjbSrEUBEz3OapGJw?=
 =?us-ascii?Q?TZIGHdQB9v7spgvxKJ9iy152mjateAvxnQH9WJWxFKVXbmpoqSAJU9JMer1+?=
 =?us-ascii?Q?SgL5R9/7sW1RKyLRCmejUDVlqqIyuCTJPF9x6kWMbcLdZaj4HqCCE/EO6031?=
 =?us-ascii?Q?iNofDuIcLn8y5JkpT/yAMYT+4EYUPvKK/Zr+4V0nb9s4glz5fDzG20ZP1l53?=
 =?us-ascii?Q?bo7Kqmw03V8whK/RbUXf4iRC7hhHwWkQ0x/RC0euM8GAWugkHkQyKR/K5S7P?=
 =?us-ascii?Q?3+RcvKjebUxLcCRZEAOSLHw6N4hqjLF3z6cWGSXFAivP8lY6Lm6Sh9IG/0b6?=
 =?us-ascii?Q?S1C29lATLzFYebnib+1tAqti8E5qbTPte1Qpxeu1dyCf8rKBWa8s4xunVkyT?=
 =?us-ascii?Q?NSPrSi71FXu4zDirmdGOPTMRzcnXsPLDhPnKcRscs3OZQlUfEx3oX6/bzllI?=
 =?us-ascii?Q?IJb8YmTuhAq3CkqVBlLp/nrBLWNphbOBa8m/j+ghSt+p5wyeAc2LAxvhZSIs?=
 =?us-ascii?Q?AJ94XPyod4lkClGVuktlWeLKBqtjURnE8an591N+mzy4chGpBjU8RDMvUBNC?=
 =?us-ascii?Q?VcPPJYCZYBFFVLkmr1cir8CF5e05yU2GhykpJEPkVwqQYv0dhzXIlOSx0HEq?=
 =?us-ascii?Q?DvlGUQSwvkwY1iCCb1eA6xR8IpUVPJQlb/F6CIXLIj2/QuF9P0x9+hi35fJM?=
 =?us-ascii?Q?/iC5NslbzUhD7IZsu/hOC9LdZEB59A1XLUCc1iHE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b5f050-4902-4a13-24a3-08dd2952df04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 04:23:26.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHnBj5W7bPswgq8/UPounqUR/TJnYR5wLaglNT78vRCBhFDPWwrqmy8zWXb95PPDyhx22lKf2BIulwPih54+oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=677371c5 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=pQs5aej7AAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=CoI80WVU7f_9A_GzkNkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: x6wDMnR1UHnLxjSHYZ6uXnBhLZNSbGM4
X-Proofpoint-ORIG-GUID: x6wDMnR1UHnLxjSHYZ6uXnBhLZNSbGM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-31_01,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412310034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 04:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114598

* Refresh patches.
* Drop 0001-Fix-Wincompatible-function-pointer-types.patch as the issue
  has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...Wincompatible-function-pointer-types.patch | 39 -------------------
 ...tch => 0001-remove-rpath-from-tests.patch} | 25 ++++++++----
 ...=> 0002-Fix-build-failure-on-x86_64.patch} | 28 +++++++------
 ...ort.patch => 0003-Add-nios2-support.patch} | 17 +++++---
 ...atch => 0004-md-Fix-build-with-musl.patch} | 11 ++++--
 ...emove-_BUILD_STRING-and-_BUILD_TIME.patch} | 20 +++++-----
 ...g-nspr-config.in-don-t-pass-LDFLAGS.patch} |  2 +-
 .../nspr/{nspr_4.35.bb => nspr_4.36.bb}       | 15 ++++---
 8 files changed, 71 insertions(+), 86 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer-types.patch
 rename meta-oe/recipes-support/nspr/nspr/{remove-rpath-from-tests.patch => 0001-remove-rpath-from-tests.patch} (58%)
 rename meta-oe/recipes-support/nspr/nspr/{fix-build-on-x86_64.patch => 0002-Fix-build-failure-on-x86_64.patch} (69%)
 rename meta-oe/recipes-support/nspr/nspr/{0002-Add-nios2-support.patch => 0003-Add-nios2-support.patch} (86%)
 rename meta-oe/recipes-support/nspr/nspr/{0001-md-Fix-build-with-musl.patch => 0004-md-Fix-build-with-musl.patch} (84%)
 rename meta-oe/recipes-support/nspr/nspr/{Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch => 0005-Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch} (89%)
 rename meta-oe/recipes-support/nspr/nspr/{0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch => 0006-config-nspr-config.in-don-t-pass-LDFLAGS.patch} (92%)
 rename meta-oe/recipes-support/nspr/{nspr_4.35.bb => nspr_4.36.bb} (89%)

diff --git a/meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer-types.patch b/meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer-types.patch
deleted file mode 100644
index 8515075fe0..0000000000
--- a/meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer-types.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d24dc9bebaefbd8abf32707bad5efc0c811c0cd4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Jan 2023 13:04:56 -0800
-Subject: [PATCH] Fix -Wincompatible-function-pointer-types
-
-Fixes warnings with clang16
-testfile.c:576:31: error: incompatible function pointer types passing 'PRInt32 (void *)' (aka 'int (void *)') to parameter of type 'void (*)(void *)' [-Wincompatible-function-pointe r-types]
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pr/tests/testfile.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pr/tests/testfile.c b/pr/tests/testfile.c
-index 79d8a05..42aa6a7 100644
---- a/pr/tests/testfile.c
-+++ b/pr/tests/testfile.c
-@@ -123,7 +123,7 @@ PRThread* create_new_thread(PRThreadType type,
-     if (native_thread) {
- #if defined(_PR_PTHREADS)
-         pthread_t tid;
--        if (!pthread_create(&tid, NULL, start, arg)) {
-+        if (!pthread_create(&tid, NULL, (void*(*)(void*))start, arg)) {
-             return((PRThread *) tid);
-         }
-         else {
-@@ -573,7 +573,7 @@ static PRInt32 RunDirTest(void)
- 
-         thrarg.done= 0;
-         t = create_new_thread(PR_USER_THREAD,
--                              DirTest, &thrarg,
-+                              (void (*)(void *))DirTest, &thrarg,
-                               PR_PRIORITY_NORMAL,
-                               PR_LOCAL_THREAD,
-                               PR_UNJOINABLE_THREAD,
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-support/nspr/nspr/remove-rpath-from-tests.patch b/meta-oe/recipes-support/nspr/nspr/0001-remove-rpath-from-tests.patch
similarity index 58%
rename from meta-oe/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
rename to meta-oe/recipes-support/nspr/nspr/0001-remove-rpath-from-tests.patch
index 7ba59ed644..5cb14b5781 100644
--- a/meta-oe/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0001-remove-rpath-from-tests.patch
@@ -1,5 +1,7 @@
-Author: Andrei Gherzan <andrei@gherzan.ro>
-Date:   Thu Feb 9 00:03:38 2012 +0200
+From 63eb483f7feb05917402731d8f21b396630ef202 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Thu, 9 Feb 2012 00:03:38 +0200
+Subject: [PATCH] remove rpath from tests
 
 Avoid QA warnings by removing hardcoded rpath from binaries.
 
@@ -8,14 +10,18 @@ WARNING: QA Issue: package nspr contains bad RPATH {builddir}/tmp/work/armv5te-p
 in file {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/packages-split/nspr/usr/lib/nspr/tests/multiwait
 [...]
 
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 Upstream-Status: Pending
 
-Index: nspr/pr/tests/Makefile.in
-===================================================================
---- nspr.orig/pr/tests/Makefile.in
-+++ nspr/pr/tests/Makefile.in
-@@ -316,7 +316,7 @@ ifeq ($(OS_ARCH), SunOS)
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+---
+ pr/tests/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pr/tests/Makefile.in b/pr/tests/Makefile.in
+index 20e2f99..56c73e1 100644
+--- a/pr/tests/Makefile.in
++++ b/pr/tests/Makefile.in
+@@ -260,7 +260,7 @@ ifeq ($(OS_ARCH), SunOS)
  endif # SunOS
  
  ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
@@ -24,3 +30,6 @@ Index: nspr/pr/tests/Makefile.in
      ifeq ($(USE_PTHREADS),1)
          EXTRA_LIBS = -lpthread
      endif
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nspr/nspr/fix-build-on-x86_64.patch b/meta-oe/recipes-support/nspr/nspr/0002-Fix-build-failure-on-x86_64.patch
similarity index 69%
rename from meta-oe/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
rename to meta-oe/recipes-support/nspr/nspr/0002-Fix-build-failure-on-x86_64.patch
index f12acc8548..9e1928e376 100644
--- a/meta-oe/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0002-Fix-build-failure-on-x86_64.patch
@@ -1,21 +1,24 @@
-Fix build failure on x86_64
+From f68f2535e98231ab362b6bbbe7cc4718b2c72aa9 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 31 Dec 2024 10:25:15 +0800
+Subject: [PATCH] Fix build failure on x86_64
 
 When the target_cpu is x86_64, we should assume that the pkg uses 64bit,
 only if USE_N32 is set, we can assume that the pkg uses 32bit. It used a
 opposite logic before.
 
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
 Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- configure.in |   12 ++++++------
- 1 files changed, 6 insertions(+), 6 deletions(-)
+ configure.in | 16 ++++++----------
+ 1 file changed, 6 insertions(+), 10 deletions(-)
 
-Index: nspr/configure.in
-===================================================================
---- nspr.orig/configure.in
-+++ nspr/configure.in
-@@ -1875,28 +1875,24 @@ tools are selected during the Xcode/Deve
+diff --git a/configure.in b/configure.in
+index 1a3e489..04419d9 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1590,28 +1590,24 @@ tools are selected during the Xcode/Developer Tools installation.])
          PR_MD_ASFILES=os_Linux_ia64.s
          ;;
      x86_64)
@@ -49,4 +52,7 @@ Index: nspr/configure.in
 -            PR_MD_ASFILES=os_Linux_ppc.s
          fi
          ;;
-     esac    
+     esac
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch b/meta-oe/recipes-support/nspr/nspr/0003-Add-nios2-support.patch
similarity index 86%
rename from meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
rename to meta-oe/recipes-support/nspr/nspr/0003-Add-nios2-support.patch
index dab2a4e291..3d1bbd31a7 100644
--- a/meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0003-Add-nios2-support.patch
@@ -1,21 +1,23 @@
-From 4760065a58153e4dae24e4e437a5136592c624bc Mon Sep 17 00:00:00 2001
+From 09a67d3945f1fde8372532ef2e19af20db2112cd Mon Sep 17 00:00:00 2001
 From: Marek Vasut <marex@denx.de>
 Date: Sat, 30 Jan 2016 07:18:02 +0100
 Subject: [PATCH] Add nios2 support
 
 Add support for the nios2 CPU.
 
-Signed-off-by: Marek Vasut <marex@denx.de>
 Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=1244421 ]
 
+Signed-off-by: Marek Vasut <marex@denx.de>
 ---
- pr/include/md/_linux.cfg | 45 +++++++++++++++++++++++++++++++++++
+ pr/include/md/_linux.cfg | 45 ++++++++++++++++++++++++++++++++++++++++
  pr/include/md/_linux.h   |  4 +++-
  2 files changed, 48 insertions(+), 1 deletion(-)
 
+diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+index 009d5e5..77c13df 100644
 --- a/pr/include/md/_linux.cfg
 +++ b/pr/include/md/_linux.cfg
-@@ -975,6 +975,51 @@
+@@ -979,6 +979,51 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
  
@@ -67,6 +69,8 @@ Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=124442
  #elif defined(__or1k__)
  
  #undef  IS_LITTLE_ENDIAN
+diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
+index ad57d08..45a2231 100644
 --- a/pr/include/md/_linux.h
 +++ b/pr/include/md/_linux.h
 @@ -55,6 +55,8 @@
@@ -78,7 +82,7 @@ Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=124442
  #elif defined(__or1k__)
  #define _PR_SI_ARCHITECTURE "or1k"
  #elif defined(__riscv) && (__riscv_xlen == 32)
-@@ -143,7 +145,7 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRIn
+@@ -143,7 +145,7 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRInt32 *val, PRInt32 newval);
  #define _MD_ATOMIC_SET                _PR_x86_64_AtomicSet
  #endif
  
@@ -87,3 +91,6 @@ Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=124442
  #if defined(__GNUC__)
  /* Use GCC built-in functions */
  #define _PR_HAVE_ATOMIC_OPS
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch b/meta-oe/recipes-support/nspr/nspr/0004-md-Fix-build-with-musl.patch
similarity index 84%
rename from meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
rename to meta-oe/recipes-support/nspr/nspr/0004-md-Fix-build-with-musl.patch
index 09855a03dc..75d184bb3b 100644
--- a/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0004-md-Fix-build-with-musl.patch
@@ -1,4 +1,4 @@
-From 5f6fcaeb0b7a319c8afd32ddb48b3515b63a6c0c Mon Sep 17 00:00:00 2001
+From e8cab35851949cd4b7498d56978c5e7907841f32 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Sep 2017 17:22:43 -0700
 Subject: [PATCH] md: Fix build with musl
@@ -7,17 +7,17 @@ The MIPS specific header <sgidefs.h> is not provided by musl
 linux kernel headers provide <asm/sgidefs.h> which has same definitions
 
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  pr/include/md/_linux.cfg | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
-index aa3af78..899826f 100644
+index 77c13df..3eb2faf 100644
 --- a/pr/include/md/_linux.cfg
 +++ b/pr/include/md/_linux.cfg
-@@ -511,7 +511,7 @@
+@@ -515,7 +515,7 @@
  #error "Unknown MIPS endianness."
  #endif
  
@@ -26,3 +26,6 @@ index aa3af78..899826f 100644
  
  #define IS_64
  
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch b/meta-oe/recipes-support/nspr/nspr/0005-Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
similarity index 89%
rename from meta-oe/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
rename to meta-oe/recipes-support/nspr/nspr/0005-Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
index 90fe45f34d..470ada591a 100644
--- a/meta-oe/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0005-Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
@@ -1,4 +1,4 @@
-From 8a592e4ead4ed6befe6044da3dd2dc7523c33905 Mon Sep 17 00:00:00 2001
+From 161c955f32dd350413de076b7cad588fa4bdc4de Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 16 Nov 2018 13:52:49 +0800
 Subject: [PATCH] Makefile.in: remove _BUILD_STRING and _BUILD_TIME
@@ -23,10 +23,10 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  4 files changed, 4 insertions(+), 28 deletions(-)
 
 diff --git a/lib/ds/Makefile.in b/lib/ds/Makefile.in
-index e737791..b578476 100644
+index fa8c783..74b4bdd 100644
 --- a/lib/ds/Makefile.in
 +++ b/lib/ds/Makefile.in
-@@ -114,13 +114,7 @@ GARBAGE += $(TINC)
+@@ -104,13 +104,7 @@ GARBAGE += $(TINC)
  
  $(TINC):
  	@$(MAKE_OBJDIR)
@@ -42,10 +42,10 @@ index e737791..b578476 100644
  
  $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
 diff --git a/lib/libc/src/Makefile.in b/lib/libc/src/Makefile.in
-index e8a6d9f..978ed28 100644
+index 9ef2007..21abd6f 100644
 --- a/lib/libc/src/Makefile.in
 +++ b/lib/libc/src/Makefile.in
-@@ -116,13 +116,7 @@ GARBAGE += $(TINC)
+@@ -106,13 +106,7 @@ GARBAGE += $(TINC)
  
  $(TINC):
  	@$(MAKE_OBJDIR)
@@ -61,10 +61,10 @@ index e8a6d9f..978ed28 100644
  
  $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
 diff --git a/lib/prstreams/Makefile.in b/lib/prstreams/Makefile.in
-index aeb2944..f318097 100644
+index 5865ab8..a00d20c 100644
 --- a/lib/prstreams/Makefile.in
 +++ b/lib/prstreams/Makefile.in
-@@ -116,13 +116,7 @@ endif
+@@ -102,13 +102,7 @@ endif
  
  $(TINC):
  	@$(MAKE_OBJDIR)
@@ -80,10 +80,10 @@ index aeb2944..f318097 100644
  
  $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
 diff --git a/pr/src/Makefile.in b/pr/src/Makefile.in
-index 19c5a69..b4ac31c 100644
+index a9e86f5..bbcbb67 100644
 --- a/pr/src/Makefile.in
 +++ b/pr/src/Makefile.in
-@@ -326,13 +326,7 @@ GARBAGE += $(TINC)
+@@ -291,13 +291,7 @@ GARBAGE += $(TINC)
  
  $(TINC):
  	@$(MAKE_OBJDIR)
@@ -99,5 +99,5 @@ index 19c5a69..b4ac31c 100644
  
  $(OBJDIR)/prvrsion.$(OBJ_SUFFIX): prvrsion.c $(TINC)
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch b/meta-oe/recipes-support/nspr/nspr/0006-config-nspr-config.in-don-t-pass-LDFLAGS.patch
similarity index 92%
rename from meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch
rename to meta-oe/recipes-support/nspr/nspr/0006-config-nspr-config.in-don-t-pass-LDFLAGS.patch
index 6ebc9c4ae6..fa7dbcc474 100644
--- a/meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0006-config-nspr-config.in-don-t-pass-LDFLAGS.patch
@@ -1,4 +1,4 @@
-From 13e9d66c24d1dce5179805ae5e1bf940409b4914 Mon Sep 17 00:00:00 2001
+From 88bf2abc07ae56ed1bcc9e915add0b3d9ed66c7b Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 10 Aug 2022 15:21:07 +0800
 Subject: [PATCH] config/nspr-config.in: don't pass LDFLAGS
diff --git a/meta-oe/recipes-support/nspr/nspr_4.35.bb b/meta-oe/recipes-support/nspr/nspr_4.36.bb
similarity index 89%
rename from meta-oe/recipes-support/nspr/nspr_4.35.bb
rename to meta-oe/recipes-support/nspr/nspr_4.36.bb
index abd750b138..a717520666 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.35.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.36.bb
@@ -6,13 +6,12 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=6;md5=90c2fdee38e45d
 SECTION = "libs/network"
 
 SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
-           file://remove-rpath-from-tests.patch \
-           file://fix-build-on-x86_64.patch \
-           file://0002-Add-nios2-support.patch \
-           file://0001-md-Fix-build-with-musl.patch \
-           file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
-           file://0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch \
-           file://0001-Fix-Wincompatible-function-pointer-types.patch \
+           file://0001-remove-rpath-from-tests.patch \
+           file://0002-Fix-build-failure-on-x86_64.patch \
+           file://0003-Add-nios2-support.patch \
+           file://0004-md-Fix-build-with-musl.patch  \
+           file://0005-Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
+           file://0006-config-nspr-config.in-don-t-pass-LDFLAGS.patch \
            file://nspr.pc.in \
            "
 
@@ -24,7 +23,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[sha256sum] = "7ea3297ea5969b5d25a5dd8d47f2443cda88e9ee746301f6e1e1426f8a6abc8f"
+SRC_URI[sha256sum] = "55dec317f1401cd2e5dba844d340b930ab7547f818179a4002bce62e6f1c6895"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.25.1


