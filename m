Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFF3CF6493
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 09:34:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10482.1727516054581243174
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 02:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=900161c346=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S9YBxO002547
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x8s889j8-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pi6EOH/7sRXfnBW9kDAMTKcY9TN1dPAGphAtuKGvNCVinMn0xraThSU2uf+gwmFUBSe7lwbb5eM0lps/pRz1vc33CX5dZdOJ21l5ul3jKnOWFLARw8teONvQMcNOk/jje2cffCqcNOqqniGkAKHpt0xov/YJpkbvSP9diLw9NjEKKvaAgdDUCGBkaesMhuXjIfafG/L89/HSERT1yj10LKntwCQHNaQ9k/RTzG1vKcZB4k5lnbxpKqY55+pIKrbuNTj/v1rt40VsqpKERFH24HGcmW9YhEpRL+lCTmrNl91UuxxiIp9KPpIOHSCxo4KQz2G4NtLzlSJcQfC7vP9Gsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiaeGKJ8BAIs/bqXDrF6mGXvqxMh9AL+RicbcxS7Cgg=;
 b=BEke+jxJbbt+OqhlJKoYlF96IOnURimCXg0XxS0+HHgzYX1detyT2GIdwYL6oqYk6G4+YtZ6EreeaAj+ZeYN7ekdtKunhsE5GRbuvM5Y6/y4FCZC3gCdEzUxRoDER3MwS090lHwB44hTPWBR63VL5kPL090Zm9Kvmo7Ii4J+UBGs/9Lp09sr7gEIchV1AcG5H43/2OpnH+PYdxAD6at92E36/MzsSycsr+AV/1C/7QP5wFE9UsEPHmOFLyatKZO39Z4wtfoc6imc77U0umdY9r/qPgw5P8fuSps14VtiNQwjVLqIz5eiLlo/mvsv4NDVzi8+RcW4HzFVLn5zDlz4vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.31; Sat, 28 Sep
 2024 09:34:11 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.022; Sat, 28 Sep 2024
 09:34:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/6] linuxptp: upgrade 4.1 -> 4.4
Date: Sat, 28 Sep 2024 17:33:55 +0800
Message-Id: <20240928093356.3992191-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240928093356.3992191-1-yi.zhao@windriver.com>
References: <20240928093356.3992191-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 05059c43-7827-4cad-f00c-08dcdfa0b566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IORSF8QpyKHYWZajcs0MD+sUE6oTAMrNRS/Xx2XD0FC7NOzxPjneGgjU7Xvk?=
 =?us-ascii?Q?wmWiOW/UmVOhnWWcV1+OsblpqJPddIJ+DyH9w3xorrKOwi7pxG8QP1cWvV6T?=
 =?us-ascii?Q?FQ80MiZy5Ji5ay+19euSlJZAgUhM8Y/LJEpxpJ8noUh/L2v2aO3d+xgmnxyR?=
 =?us-ascii?Q?+AYRml4wkSzyQDiqYRX+k+jIXvlHumBkZ+ntlL9jGWHTsDXwAPO7fUanpu9A?=
 =?us-ascii?Q?Xe7C5WX59oyTLKgMhEmnyFRMDrVLeCRIZuMixQeWM1YDqvD/1ZbY+VKmHKG1?=
 =?us-ascii?Q?oL+NJXLam2M7oD+g3aMw+RMYuc24AJ/ysEIhvp8XHh8r94/eMdeYNbJ5VCvo?=
 =?us-ascii?Q?rTI0hbwKUVBPwi8+m5WxWDJMkZ0is8JwXVcRrOR8tprFIGy4xb9AhzgV0IOp?=
 =?us-ascii?Q?CByweQbIwJcGah6ebVUVvQYTcgj3jqrpwrGYHoe2KV/IaL2+88+jDyCPV8hi?=
 =?us-ascii?Q?0Ze4Nf9nwecRVKRGAohSFpOFqUSLZK0wI+KGllrWzherblSczenVsC5oNfBQ?=
 =?us-ascii?Q?+OtRDk7gsEpRU0GLd5skjatOCU9n9xvQhHZhghqRYnnZaItakGWlN0tdWOtN?=
 =?us-ascii?Q?sUzAV89NGmWg25uzQ4hCmaE7JSJujcIjNKzCz1xHaS7z1sSkZprbVsl+yC3t?=
 =?us-ascii?Q?ZzckSYLFs//mjv7yYfDgwZLVKECUzxlfDKRJzyAI6P1xQV4eyZVdRMHNRhOh?=
 =?us-ascii?Q?m0JNNNxCAXNkBA9wqZovtmtdAT/LuWvlbdAgHKHyL69upRTK5o7PqQyZ2U1R?=
 =?us-ascii?Q?pFCUgaaM4c/V66z7kEvgDtsZOBiCj7GRplD3mXFgd3sa8HY/vQW4/HrVW91X?=
 =?us-ascii?Q?5iU7amyU5x9ZTxr5fdY6G4ud15Va0ELyXhPGxrDgnRTpXZdDRlAxHEkFJ81j?=
 =?us-ascii?Q?0XQZUMpxDhBQ3Q05k2wsY9nb0gHmUffa0itkUykLoH0+WPOHwtEo9vr9ID8t?=
 =?us-ascii?Q?XX5c5qJ9rQGCQBEKljKHToczKVN+6xo0pkEjUo2kPJZ9mUm66qARWjhjg/+j?=
 =?us-ascii?Q?Olf4Bfi1sYAgcveXe1kgngLfEA/KAhILtZrziSJsq4Z99k1Cxpukum/vS5b5?=
 =?us-ascii?Q?uG/D0lh05SJP9TTOkh41z3ic4BVRmFEKCfRS1E7MLA/jBUXPgvWcxrBSevD1?=
 =?us-ascii?Q?5B+baL9p0HdgDLUENZ+rxfrxcG1PDv8r9l8U+FUcDZQwAAJ+i6ieZ/+P4dVJ?=
 =?us-ascii?Q?dWNUKnnab3r0JirIg5SeqGXtNJzc6+aFSml4+XIofrfG7A3bWD3rEQxLcoBZ?=
 =?us-ascii?Q?Pvirx10iZLFdRs1s9QW1ioCb86yTh5TRd6cZENNvFg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fkBkzpJsOQdOuEwS7cjdLgGbyc9lKxVtUzEgpnrK5TkYPsxoW2pBVSnq5UvD?=
 =?us-ascii?Q?EK373tSGsb/Z0QX5SuthTPLEB0yYDd09jUt3eScnJ+3OVZfcw87mQFyJAvIm?=
 =?us-ascii?Q?9PZfZGIWl1mvIZNCwSNim7QsnjULW4YBRPUMPZGl09fDl4hNmFoCCBPoqQ2+?=
 =?us-ascii?Q?tNLZYnThgQGr2uR0utC8VPjIvO0JlkabcN2WdxANkv4WcDU+QpqUIlksiM2X?=
 =?us-ascii?Q?HXlTIFMCFE0o8bAGYh5y+3stbR2ExyFFoL0d73Ip7oww2w1ipfUSYhQ3qcY5?=
 =?us-ascii?Q?dfq3cAzgPUVibNK+CQfvY5fjguLkDnNsVzE2yGRWZNi54WSndaPmNw4j17mX?=
 =?us-ascii?Q?X4rEPNwlK6s0mIiAxkcLEplxk1wmhsGlEvd+KKGnsAccDCqhfTssFqo6e/Z0?=
 =?us-ascii?Q?JuzASaUxdv1ijIdHEmNzBsKOWpxKSILMCHzWERrkSsglB1D8SW2FYIfEHGyH?=
 =?us-ascii?Q?ZSeyVMvrRd+3J4KHrh3LdQ0/O1+ytbP9O76Tzc6+qcy55XvBnbIFbsmKcXl7?=
 =?us-ascii?Q?Xtc0WCCrJuVGeNeTLNAWHtvd50sUl+n4KhlgMr9Qc4v2XtB7m4v1QNiEo6o2?=
 =?us-ascii?Q?zYrH9Vu+6qf5atq/yYpjbk4dlBmlfxXc2A+eNHmIzHvOkJ8wjugJQede+btZ?=
 =?us-ascii?Q?7pKZLRZ8mdsdG4r+nHuR1EWKyQo6YpgOs5lb+48RFN5DYn0yJGTT6f+KIoYw?=
 =?us-ascii?Q?qE75uL0hTXqr0ci7iTIK8gW/L6lQsjSUCe0IbNqMJFfxELwdEgB+jYlkFEUq?=
 =?us-ascii?Q?AFTAnFSw/vsMP2+erKWYGCt88HFq8LsIHH4+Gp/j3Nnot2ycvkiFmPqPDuIu?=
 =?us-ascii?Q?P51gyFBxZcSR94E/ARGSASuyOCGFM+XssY+Kz0uE09t/Ct2kkav1byD2Bxvn?=
 =?us-ascii?Q?mUv+u672F5k2sViBR1KsBvLBhzujiZY02kWw4EcJyR2iDv7n1odRyBmKNgDp?=
 =?us-ascii?Q?K1N6OBzNqmmV2DOqs0BOIXx5Vm91LswtjAkhl7AF2HtnW85GNNHPvvLidt7G?=
 =?us-ascii?Q?7ACusoOnDyctdAn9B3GfRloJkZ/05slsNyfCpKfFM6cEvGjNAZQ7n40cw48o?=
 =?us-ascii?Q?JwZk1SNwFbUG1mnX9MzIc/FcN270POQULDNCzCV+sl7xXrlo8lrKZNRqEziX?=
 =?us-ascii?Q?7sxHbMUE5ekSMyEkEy0AYJ9nOIQCBF94IJK6GFCZcdDV1bY/G2Wyh4ks/L2X?=
 =?us-ascii?Q?9xvv0w3gRf8rLsulOdjkCaZQN3IbTnKUInsDwdR8h8zxX1/cOAFqzz7fTNAQ?=
 =?us-ascii?Q?Lw8V+mVkS5oZOah+WgFDfuNtYuOPPljYsAaLw1k0mIiJDnYUpy0qyOVZ/E4r?=
 =?us-ascii?Q?So2w1AYFkgiLV0o2gtpSQmt5CYP3feELUSU08Eej2A2g4qqoPMZYYwDDuy1t?=
 =?us-ascii?Q?KMyfbWcgsScU4Z8+nJlAdqGikA5IlNzRlO7CUu/Q9rn7O1kiyvHpc3BhwkU+?=
 =?us-ascii?Q?hrTgwiWONQgr5GqhfvkEMozpRdqSROM6I8tfFx85cpIazXl62gThlBb4UJ5j?=
 =?us-ascii?Q?NFVUsLEii/wmDYWMtmWuN9a2bYJHEysimb6t3Df9z1oeM/dyvM1DODqxPGK1?=
 =?us-ascii?Q?OkwaEsiB6rdse74CCDAdA4xy9jBWEKyn0UIBWgH4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05059c43-7827-4cad-f00c-08dcdfa0b566
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 09:34:11.2552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SH4u9SseEyDu6vdq7lu4IAHmB7xkuiKs1Xvcmsi7GzIYGr/kVKe3RzxEUcAiFrTl9dvkmGiuO4X0NXWyvXAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-Authority-Analysis: v=2.4 cv=VaulP0p9 c=1 sm=1 tr=0 ts=66f7cd95 cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8
 a=FP58Ms26AAAA:8 a=EkcXrb_YAAAA:8 a=ZMDeApS1tmXowhduPloA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=LK5xJRSDVpKd5WXXoEvA:22
X-Proofpoint-GUID: bHSY7-UozZ9uBNbgYtog0DK72uJl0uR-
X-Proofpoint-ORIG-GUID: bHSY7-UozZ9uBNbgYtog0DK72uJl0uR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1011 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409280070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112538

* Update SRC_URI
* Drop backport patches
* Drop redundant UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-include-string.h-for-strncpy.patch   | 26 ----------
 .../0002-linuxptp-Use-CC-in-incdefs.sh.patch  | 48 -------------------
 .../{linuxptp_4.1.bb => linuxptp_4.4.bb}      | 12 +----
 3 files changed, 2 insertions(+), 84 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.h-for-strncpy.patch
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0002-linuxptp-Use-CC-in-incdefs.sh.patch
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_4.1.bb => linuxptp_4.4.bb} (76%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.h-for-strncpy.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.h-for-strncpy.patch
deleted file mode 100644
index b117dcf67..000000000
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.h-for-strncpy.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 6120cee594c543d17ae015bc601012debcf57177 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Oct 2023 10:43:42 +0100
-Subject: [PATCH] include string.h for strncpy()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [master: 6120cee594c543d17ae015bc601012debcf57177]
----
- interface.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/interface.c b/interface.c
-index 29229ad6f53d..9a83c36933e7 100644
---- a/interface.c
-+++ b/interface.c
-@@ -5,6 +5,7 @@
-  * @note SPDX-License-Identifier: GPL-2.0+
-  */
- #include <stdlib.h>
-+#include <string.h>
- #include "interface.h"
- 
- struct interface {
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0002-linuxptp-Use-CC-in-incdefs.sh.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0002-linuxptp-Use-CC-in-incdefs.sh.patch
deleted file mode 100644
index 3cf3a63b9..000000000
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0002-linuxptp-Use-CC-in-incdefs.sh.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From cffb4807ac0b9ff7aea2aa4f3842985b5363d184 Mon Sep 17 00:00:00 2001
-From: Luca Fancellu <luca.fancellu@arm.com>
-Date: Mon, 23 Oct 2023 10:43:43 +0100
-Subject: [PATCH] linuxptp: Use ${CC} in incdefs.sh
-
-The Makefile is defining CC and incdefs.sh is using
-${CROSS_COMPILE}cpp inside it, allowing both to use different
-compilers depending on what the user pass during make invocation
-as CC.
-
-Align them using ${CC} also inside incdefs.sh.
-
-Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
-Upstream-Status: Backport [master: cffb4807ac0b9ff7aea2aa4f3842985b5363d184]
----
- incdefs.sh | 2 +-
- makefile   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/incdefs.sh b/incdefs.sh
-index a9e94f777f6b..391e63c7fac6 100755
---- a/incdefs.sh
-+++ b/incdefs.sh
-@@ -27,7 +27,7 @@ user_flags()
- 	printf " -D_GNU_SOURCE"
- 
- 	# Get list of directories searched for header files.
--	dirs=$(echo "" | ${CROSS_COMPILE}cpp -Wp,-v 2>&1 >/dev/null | grep ^" /")
-+	dirs=$(${CC} -E -Wp,-v -xc /dev/null 2>&1 >/dev/null | grep ^" /")
- 
- 	# Look for clock_adjtime().
- 	for d in $dirs; do
-diff --git a/makefile b/makefile
-index 3e3b8b35fc96..7fc5f6fb8fa8 100644
---- a/makefile
-+++ b/makefile
-@@ -39,7 +39,7 @@ OBJECTS	= $(OBJ) hwstamp_ctl.o nsm.o phc2sys.o phc_ctl.o pmc.o pmc_agent.o \
- SRC	= $(OBJECTS:.o=.c)
- DEPEND	= $(OBJECTS:.o=.d)
- srcdir	:= $(dir $(lastword $(MAKEFILE_LIST)))
--incdefs := $(shell $(srcdir)/incdefs.sh)
-+incdefs := $(shell CC="$(CC)" $(srcdir)/incdefs.sh)
- version := $(shell $(srcdir)/version.sh $(srcdir))
- VPATH	= $(srcdir)
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.4.bb
similarity index 76%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp_4.4.bb
index d1a73841a..84b3af8c5 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.4.bb
@@ -5,23 +5,15 @@ HOMEPAGE = "http://linuxptp.sourceforge.net/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-LINUXPTP_SRC_URI = "http://sourceforge.net/projects/linuxptp"
-
-SRC_URI = "${LINUXPTP_SRC_URI}/files/v4.1/linuxptp-${PV}.tgz \
-           file://0001-include-string.h-for-strncpy.patch \
-           file://0002-linuxptp-Use-CC-in-incdefs.sh.patch \
+SRC_URI = "https://downloads.nwtime.org/linuxptp/linuxptp-${PV}.tgz \
            file://systemd/phc2sys@.service.in \
            file://systemd/ptp4l@.service.in \
            "
 
-SRC_URI[md5sum] = "1db8699fc155965341759be5e5aad938"
-SRC_URI[sha256sum] = "e1743d44f8208897e30895da3579e670ff919b914feb4b5a949f3e421ddde535"
+SRC_URI[sha256sum] = "61757bc0a58d789b8fcbdddf56c88a0230597184a70dcb2ac05b4c6b619f7d5c"
 
 inherit systemd
 
-UPSTREAM_CHECK_URI = "${LINUXPTP_SRC_URI}/files/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-
 EXTRA_OEMAKE = "CC='${CC}' EXTRA_CFLAGS='${CFLAGS}' mandir='${mandir}' \
     sbindir='${sbindir}'"
 
-- 
2.25.1


