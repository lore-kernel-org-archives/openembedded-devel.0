Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12EDCF649D
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 12:15:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31248.1727612145264595680
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 05:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0002136fa6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48TC022Q007377
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 12:15:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x710h9da-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 12:15:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgzCXLxwnHU53d9W2n+SoRJ2XFDmwCgkRHIuSrzMq2gdmTIV5f90lqLI4KHE1kpxGIMeF5Yfc/OdMk+TStPWrzbstMoUKIAKLwgYL8m4zIpi5ZjOux/OMdGS5McalHZtLxxkPn+7JllEGkKL8FgUCUaoGWnJnZHKM1dzzCT5raVkP19GwHf7cKew47jbtAsX1+Z8y4ZhBGQuqUdcSkL4tjffdUbjkITUXWc6E91hv3/fEmw4x5tCAm5HwihPEjj+SXY+V2NFJ/DlMZaDg4U/eyiSGLUOU6lxILRQzMeg2YfZ8ywe8imu7rUBBvUrjk9DJHnHaN22idzCZQQ/7FeZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn38Ckc4e3o85djFa3JgkAHmSGcgRluXqE4hqkbxGUQ=;
 b=otgrPLpaQmGSsYeFvbiY41+O0Iuj4G6c8/lQVs+i0clnvhodhgQBhVZdsjTmfo8pmJMF6I+4wrS5okAcVsPR3VSZCE+WSqwv9aZeO6jtwwdZ7jouBF+mZI+pL+LYj9ifls6tf1fwmrYpHI3BFm0zT2hz/Ahd8buXUfEiZF6Da25Xp+pxmRTveO134QSuWosZtj1btNYByeXxYpFXX6cjP/ifHPhUbwZDvrQXOJm3WEVkImNArtJpj16GIA9dG3tqgiMUEdzOpii0NAWwA9hoN8vm47ezAUgYf8mNoX6ni8aBo3oDfa0xHZ6AIQ9ZRXee8HsbguUB/FMvgMFCqbsLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.24; Sun, 29 Sep 2024 12:15:42 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 12:15:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libidn: upgrade 1.41 -> 1.42
Date: Sun, 29 Sep 2024 20:15:24 +0800
Message-Id: <20240929121524.3196792-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240929121524.3196792-1-yi.zhao@windriver.com>
References: <20240929121524.3196792-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0024.jpnprd01.prod.outlook.com (2603:1096:404::36)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de4547e-a624-4768-9208-08dce080700e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?f/e6PlKujpaYs7jnphzSkRCo68oIWfxJSFLJmW8H4imZNlUVl9vtj+eJuOcZ?=
 =?us-ascii?Q?zaj4xnEi/6DDQJIJNupukNp+pVKQGYahV3/wZtNk8po8YiSY/pdPgqQs6wis?=
 =?us-ascii?Q?SyeH958H5prlqlntQxlmpwS+lN7Ab5HAhSZPcrDZilfxT0TVe9iqRBUwYUSs?=
 =?us-ascii?Q?yqw4QEAM1fvX1bTr3q0s4ka+uuLBYBvEI2BQwvTrCDcDOr3/0sIpYnBsgIqY?=
 =?us-ascii?Q?jL8vgFKxkMTzQ/vDK3Gj4+SZrReeN9/e+0jjJZTIGi8oPD4cMDeY6KbcAek3?=
 =?us-ascii?Q?Yfa2uSHfBMiivYUN2WnESFhOSVtxKO8LP5xlwzrCXikwg5F5drX/HF5apgZa?=
 =?us-ascii?Q?YQ1KrGLNKahOYwm/6onTpS+PBYqHUloxvYeR18aLlPnwBgicMiL0ELdBTkIZ?=
 =?us-ascii?Q?NUjm3yUUCrJuheN4joBLBPwz5QScspvlQt/SsSceh8kAlbXDYtXzkujqcwcL?=
 =?us-ascii?Q?ef6QkRF5vbzJ2hD/NrVJJ2rv1zpoqJfJhIJT8LS8n5MSzRXvwM98aYPxWWog?=
 =?us-ascii?Q?Un5+wUKME0qSPJqFHxw5yoYvTMjUEtbQX0pbZ8eP9uOtfkmJ8zxfWPTHfMDS?=
 =?us-ascii?Q?L/98V679KqmXGaGsmWNd9WgRlO9faw7K6rEIxZB8afoWPDxsNffFlR+BoQEc?=
 =?us-ascii?Q?w7tczj5Wk3cVInj5269K9US9Ps9QR7QLGt9a7tTQOb74EZsaFDFTxEobNw/6?=
 =?us-ascii?Q?WRRxnukOSeOsxrqvZg072tIyxNJSR4HnMyo9gRKrR5JNPu9fJ8scp3EpESMr?=
 =?us-ascii?Q?e7KHqrg/hVP9uCx6WyDEP7qVomRmmJ9/BbbmMRuBNhNzdkrkUfSsUeZzdQOd?=
 =?us-ascii?Q?MxI2HKGlXfbLKf94P00YYotcNtsg06wyHrRUdbbia12HAi2jLHs60luMYF4z?=
 =?us-ascii?Q?nwhLsOt9rlfoSm2nH7P5dtdrgA/DzeZ/SHnCjYAnULiP14vDDd9GkZNFgQFB?=
 =?us-ascii?Q?Q8UPOjvI6i/BrmBAPhVYXxeml+D731016xhV8QqxAhrpACgd7+BVbltIu5eh?=
 =?us-ascii?Q?C84axfvgc7ooIuKnIO8w8ai+B9kb2kOidwnDEsFsviKHSz6iVnrEW4IHjVqp?=
 =?us-ascii?Q?54BaTcBnKrbRgiheBkIAmNAWM5y3KG+GJe/zHfxQtVLLteGXnf2WiHNUS4yS?=
 =?us-ascii?Q?4yNOhLqv1TVbs67cis5ONtwnDkJ47gxr2kOVArPUxhhj8NbVv5mOGYD94c0V?=
 =?us-ascii?Q?HAThgcckZ2qD5LJJ6e4FhY1FM//akXkYvKPotyMBVwDEJcUjq7zoxPg2R7Su?=
 =?us-ascii?Q?QI3eGpydG0XhyhKG6OOE5kfvOhvG/644DHtHo9ica6p0zicmUuW760Z/rU3I?=
 =?us-ascii?Q?MYs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G4AVmU7mXaqYocAPyQ+Wz7+gxrskiz4MfpKZemPvpWHIPRT6tDkU4VSTgyiM?=
 =?us-ascii?Q?7cwndPAUMYGgiafTnzbG7fQD8Z0VTpVYbBOhNeCqmgo6maIYGQzgLLmgk2tU?=
 =?us-ascii?Q?48htUUh+0go5Duom1QNsth+K3eRYr8TMiXP6YmHKAZXpp0iqBCh8Ngk3KUfH?=
 =?us-ascii?Q?qJCzhxtihgnN+wEko9UMnnAm5w0b6hnBm6FjAJjm/RRIuK6notFRYTOc2Mh2?=
 =?us-ascii?Q?7ucHYMS3mi5CFItkpDaRlr2UbWRZuRFyk/XBvACFyxtihDSTj1E047FECJnj?=
 =?us-ascii?Q?XqqwtqWDo0iZJylb6dLyANlYUVlwrvsyaunj8YCHQgAZ4dfdSdIV1IOHQVWe?=
 =?us-ascii?Q?NXX9bEyvdI47oiLwwr5FQM3EOHuUiWhSJxKB1EXplCl7NO4BgPMHPeja2nZx?=
 =?us-ascii?Q?FHsVc/R7N02uZmWcVenBRJtRAKzNYF+1RXY5Rzzr5VP5wDQevOtRr73fIhZJ?=
 =?us-ascii?Q?L1/FgMXRIhHPT7tUu6B0VRvvOOYEIMdNWJ7degGlv18tnlQQaDhmXYfb7Yf8?=
 =?us-ascii?Q?r0y46IzcRT89TllGNDGcJa7Yjk2KZyL5KIyr325duKHz06cHlfCcX4Tbg9LV?=
 =?us-ascii?Q?ZAv2EPku1fXD0e23Jx0cLvTGIv/4VPck0aw1pxu1L9m0y3nfmf9t7VchL7Zi?=
 =?us-ascii?Q?mVxO2b/fYmluLmEH/NYB7zMP68cOjoiwHlKxbJu2r7oja97UeSPV/+V5hcAt?=
 =?us-ascii?Q?Tbwxz3qtGkS7lsnKqYhp56XtdSZn+k+gnpuJnNE9xk0uFd5Hmpl988ydxjJW?=
 =?us-ascii?Q?Fz2XgkYukEOO2cra8s4OIxrQBEiB/rkoYGMSMdZrl/HQhJiJCKurtMQwS0mS?=
 =?us-ascii?Q?WYffnQwrcxvRnMGkie+hpR1GKhK5BcGQMG98dHLNGCsd2MHErbDqAnGVcvQ8?=
 =?us-ascii?Q?+xNRJICK8OCzXzJeN/gjx5KQsxzPWEDlW8Yrl1wrZwUKS2DOBc5umGTZIA6e?=
 =?us-ascii?Q?ullYXlA5S6yvMgp1Rwi7Rcp60EATHJou5ZpgxlIV3KMCB88BN91rhfqAQ453?=
 =?us-ascii?Q?ewNV+lsC5iGRHhrc+oCT1Qt271jjeZrnn7jvE8Ndqfpix7RQrBShNqQt1os3?=
 =?us-ascii?Q?FvmxxFchrHgGw87rm1rUswQqnlzN6aEEQGB/K1/eRSkPVNLE/cR4D3ksKMCr?=
 =?us-ascii?Q?TY4stqyBn+TgQzvcVRjcXbuVvJDHRX6gIDo9VwFJwYaIgrwwBPCwXEZM98JE?=
 =?us-ascii?Q?e4PH3GsPinDGKbEw5ZLZMFVhchwNfiRqpZcKMMTwgOuYUUoZ78LB4Taqsp5+?=
 =?us-ascii?Q?Uo4ZGKdlnyweIK3rjUL0fsv79w7AFL4JsExbdvLJhQPK92FSewkMFInVUM7X?=
 =?us-ascii?Q?wZsFY0bWtcexrVAdS6LSfwVnLSSVHC9ODA5c/EIq3sryROKp/JWWZAiXaxbZ?=
 =?us-ascii?Q?68H5muIRm40+LI2GMSWbqttWCYUCXgrzZ5O4fWx3+x52GwHEULvanvSXzSZZ?=
 =?us-ascii?Q?srCJw8ZpUp72Uiz222G6lnXLgtlvjFZwCp2SoM27MW1fQ7tzPIfmKwHjicup?=
 =?us-ascii?Q?cMJ8Jj6oMj3qOzi4MtF891iQ9s6dl2TUnHNeKlrry1UeaRY93iNC3eZEtn0W?=
 =?us-ascii?Q?uA4jdifaxj2qI3gu5XqXTMG4sDVupp6y1KR+0EGj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de4547e-a624-4768-9208-08dce080700e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:15:42.2678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dTGk5Mi3WJzCdOmevmm+Y0IPS1MXwU4A7PTftQhS6gWNvhb+4vOlalveYw6AaKFP3tnRp8LAD+LNJwJ2vKZYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-Proofpoint-GUID: Yf0wbJxowYgURpMxdmGchSajMBHNXvc2
X-Proofpoint-ORIG-GUID: Yf0wbJxowYgURpMxdmGchSajMBHNXvc2
X-Authority-Analysis: v=2.4 cv=efNvfKEH c=1 sm=1 tr=0 ts=66f944f0 cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=v7VCptLDqsVDa552sC0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-29_09,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409290094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 12:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112552

ChangeLog:
https://git.savannah.gnu.org/cgit/libidn.git/tree/NEWS?h=v1.42

License-Update:
  Copyright years updated to 2024 for idna.h and idn.c
  Correct ending line number for license text in idna.h and idn.c[1][2]

* Drop backport patch
* Refresh patch

[1] https://git.savannah.gnu.org/cgit/libidn.git/tree/lib/idna.h?h=v1.42
[2] https://git.savannah.gnu.org/cgit/libidn.git/tree/src/idn.c?h=v1.42

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...largefile.m4-Sync-with-latest-gnulib.patch | 390 ------------------
 .../libidn/dont-depend-on-help2man.patch      |  17 +-
 .../libidn/{libidn_1.41.bb => libidn_1.42.bb} |  12 +-
 3 files changed, 18 insertions(+), 401 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libidn/libidn/0001-largefile.m4-Sync-with-latest-gnulib.patch
 rename meta-oe/recipes-extended/libidn/{libidn_1.41.bb => libidn_1.42.bb} (73%)

diff --git a/meta-oe/recipes-extended/libidn/libidn/0001-largefile.m4-Sync-with-latest-gnulib.patch b/meta-oe/recipes-extended/libidn/libidn/0001-largefile.m4-Sync-with-latest-gnulib.patch
deleted file mode 100644
index 1dbf2955c..000000000
--- a/meta-oe/recipes-extended/libidn/libidn/0001-largefile.m4-Sync-with-latest-gnulib.patch
+++ /dev/null
@@ -1,390 +0,0 @@
-From 66c1646a3f12836846a054ebd2c427e30c93d3a5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 2 Apr 2023 10:37:15 -0700
-Subject: [PATCH] largefile.m4: Sync with latest gnulib
-
-This ensures it can work with latest autoconf 2.72 release ( upcoming )
-
-Upstream-Status: Backport [it will be not needed with 1.42 release]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gl/m4/largefile.m4 | 330 ++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 263 insertions(+), 67 deletions(-)
-
-diff --git a/gl/m4/largefile.m4 b/gl/m4/largefile.m4
-index 3e8b5e3..7fb81b8 100644
---- a/gl/m4/largefile.m4
-+++ b/gl/m4/largefile.m4
-@@ -1,7 +1,7 @@
- # Enable large files on systems where this is not the default.
- # Enable support for files on Linux file systems with 64-bit inode numbers.
- 
--# Copyright 1992-1996, 1998-2022 Free Software Foundation, Inc.
-+# Copyright 1992-1996, 1998-2023 Free Software Foundation, Inc.
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
- # with or without modifications, as long as this notice is preserved.
-@@ -10,8 +10,9 @@
- # It does not set _LARGEFILE_SOURCE=1 on HP-UX/ia64 32-bit, although this
- # setting of _LARGEFILE_SOURCE is needed so that <stdio.h> declares fseeko
- # and ftello in C++ mode as well.
-+# Fixed in Autoconf 2.72, which has AC_SYS_YEAR2038.
- AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
--[
-+ m4_ifndef([AC_SYS_YEAR2038], [[
-   AC_REQUIRE([AC_CANONICAL_HOST])
-   AC_FUNC_FSEEKO
-   case "$host_os" in
-@@ -20,10 +21,10 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
-         [Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2).])
-       ;;
-   esac
--])
-+ ]])
-+)
- 
--# Work around a problem in Autoconf through at least 2.71 on glibc 2.34+
--# with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
-+# Work around a problem in autoconf <= 2.69:
- # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
- # or configures them incorrectly in some cases.
- m4_version_prereq([2.70], [], [
-@@ -43,33 +44,258 @@ m4_define([_AC_SYS_LARGEFILE_TEST_INCLUDES],
- ])
- ])# m4_version_prereq 2.70
- 
-+# Support AC_SYS_YEAR2038, even if Autoconf 2.71 or earlier.
-+# This code is taken from Autoconf master.
-+m4_ifndef([AC_SYS_YEAR2038], [
-+
-+# _AC_SYS_YEAR2038_TEST_CODE
-+# --------------------------
-+# C code used to probe for time_t that can represent time points more
-+# than 2**31 - 1 seconds after the epoch.  With the usual Unix epoch,
-+# these correspond to dates after 2038-01-18 22:14:07 +0000 (Gregorian),
-+# hence the name.
-+AC_DEFUN([_AC_SYS_YEAR2038_TEST_CODE],
-+[[
-+  #include <time.h>
-+  /* Check that time_t can represent 2**32 - 1 correctly.  */
-+  #define LARGE_TIME_T \\
-+    ((time_t) (((time_t) 1 << 30) - 1 + 3 * ((time_t) 1 << 30)))
-+  int verify_time_t_range[(LARGE_TIME_T / 65537 == 65535
-+                           && LARGE_TIME_T % 65537 == 0)
-+                          ? 1 : -1];
-+]])
-+
-+# _AC_SYS_YEAR2038_OPTIONS
-+# ------------------------
-+# List of known ways to enable support for large time_t.  If you change
-+# this list you probably also need to change the AS_CASE at the end of
-+# _AC_SYS_YEAR2038_PROBE.
-+m4_define([_AC_SYS_YEAR2038_OPTIONS], m4_normalize(
-+    ["none needed"]                   dnl 64-bit and newer 32-bit Unix
-+    ["-D_TIME_BITS=64"]               dnl glibc 2.34 with some 32-bit ABIs
-+    ["-D__MINGW_USE_VC2005_COMPAT"]   dnl 32-bit MinGW
-+    ["-U_USE_32_BIT_TIME_T -D__MINGW_USE_VC2005_COMPAT"]
-+                                      dnl 32-bit MinGW (misconfiguration)
-+))
-+
-+# _AC_SYS_YEAR2038_PROBE([IF-NOT-DETECTED])
-+# -----------------------------------------
-+# Subroutine of AC_SYS_YEAR2038.  Probe for time_t that can represent
-+# time points more than 2**31 - 1 seconds after the epoch (dates after
-+# 2038-01-18, see above) and set the cache variable ac_cv_sys_year2038_opts
-+# to one of the values in the _AC_SYS_YEAR2038_OPTIONS list, or to
-+# "support not detected" if none of them worked.  Then, set compilation
-+# options and #defines as necessary to enable large time_t support.
-+#
-+# Note that we do not test whether mktime, localtime, etc. handle
-+# large values of time_t correctly, as that would require use of
-+# AC_TRY_RUN.  Note also that some systems only support large time_t
-+# together with large off_t.
-+#
-+# If support is not detected, the behavior depends on which of the
-+# top-level AC_SYS_YEAR2038 macros was used (see below).
-+#
-+# If you change this macro you may also need to change
-+# _AC_SYS_YEAR2038_OPTIONS.
-+AC_DEFUN([_AC_SYS_YEAR2038_PROBE],
-+[AC_CACHE_CHECK([for $CC option to enable timestamps after Jan 2038],
-+  [ac_cv_sys_year2038_opts],
-+  [ac_save_CPPFLAGS="$CPPFLAGS"
-+  ac_opt_found=no
-+  for ac_opt in _AC_SYS_YEAR2038_OPTIONS; do
-+    AS_IF([test x"$ac_opt" != x"none needed"],
-+      [CPPFLAGS="$ac_save_CPPFLAGS $ac_opt"])
-+    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([_AC_SYS_YEAR2038_TEST_CODE])],
-+      [ac_cv_sys_year2038_opts="$ac_opt"
-+      ac_opt_found=yes])
-+    test $ac_opt_found = no || break
-+  done
-+  CPPFLAGS="$ac_save_CPPFLAGS"
-+  test $ac_opt_found = yes || ac_cv_sys_year2038_opts="support not detected"])
-+
-+ac_have_year2038=yes
-+AS_CASE([$ac_cv_sys_year2038_opts],
-+  ["none needed"], [],
-+  ["support not detected"],
-+    [ac_have_year2038=no
-+     AS_CASE([$enable_year2038],
-+      [yes],
-+        [# If we're not cross compiling and 'touch' works with a large
-+        # timestamp, then we can presume the system supports wider time_t
-+        # *somehow* and we just weren't able to detect it.  One common
-+        # case that we deliberately *don't* probe for is a system that
-+        # supports both 32- and 64-bit ABIs but only the 64-bit ABI offers
-+        # wide time_t.  (It would be inappropriate for us to override an
-+        # intentional use of -m32.)  Error out, demanding use of
-+        # --disable-year2038 if this is intentional.
-+        AS_IF([test $cross_compiling = no],
-+          [AS_IF([TZ=UTC0 touch -t 210602070628.15 conftest.time 2>/dev/null],
-+            [AS_CASE([`TZ=UTC0 LC_ALL=C ls -l conftest.time 2>/dev/null`],
-+              [*'Feb  7  2106'* | *'Feb  7 17:10'*],
-+              [AC_MSG_FAILURE(m4_text_wrap(
-+      [this system appears to support timestamps after January 2038,
-+       but no mechanism for enabling wide 'time_t' was detected.
-+       Did you mean to build a 64-bit binary? (e.g. 'CC="${CC} -m64"'.)
-+       To proceed with 32-bit time_t, configure with '--disable-year2038'.],
-+      [], [], [55]))])])])])],
-+
-+  ["-D_TIME_BITS=64"],
-+    [AC_DEFINE([_TIME_BITS], [64],
-+      [Number of bits in time_t, on hosts where this is settable.])],
-+
-+  ["-D__MINGW_USE_VC2005_COMPAT=1"],
-+    [AC_DEFINE([__MINGW_USE_VC2005_COMPAT], [1],
-+      [Define to 1 on platforms where this makes time_t a 64-bit type.])],
- 
--# _AC_SYS_LARGEFILE_MACRO_VALUE(C-MACRO, VALUE,
--#                               CACHE-VAR,
--#                               DESCRIPTION,
--#                               PROLOGUE, [FUNCTION-BODY])
--# --------------------------------------------------------
--m4_define([_AC_SYS_LARGEFILE_MACRO_VALUE],
--[AC_CACHE_CHECK([for $1 value needed for large files], [$3],
--[while :; do
--  m4_ifval([$6], [AC_LINK_IFELSE], [AC_COMPILE_IFELSE])(
--    [AC_LANG_PROGRAM([$5], [$6])],
--    [$3=no; break])
--  m4_ifval([$6], [AC_LINK_IFELSE], [AC_COMPILE_IFELSE])(
--    [AC_LANG_PROGRAM([#undef $1
--#define $1 $2
--$5], [$6])],
--    [$3=$2; break])
--  $3=unknown
--  break
--done])
--case $$3 in #(
--  no | unknown) ;;
--  *) AC_DEFINE_UNQUOTED([$1], [$$3], [$4]);;
--esac
--rm -rf conftest*[]dnl
--])# _AC_SYS_LARGEFILE_MACRO_VALUE
-+  ["-U_USE_32_BIT_TIME_T"*],
-+    [AC_MSG_FAILURE(m4_text_wrap(
-+      [the 'time_t' type is currently forced to be 32-bit.
-+       It will stop working after January 2038.
-+       Remove _USE_32BIT_TIME_T from the compiler flags.],
-+      [], [], [55]))],
-+
-+  [AC_MSG_ERROR(
-+    [internal error: bad value for \$ac_cv_sys_year2038_opts])])
-+])
-+
-+# _AC_SYS_YEAR2038_ENABLE
-+# -----------------------
-+# Subroutine of AC_SYS_YEAR2038 and _AC_SYS_YEAR2038_OPT_IN.
-+# Depending on which of the YEAR2038 macros was used, add either an
-+# --enable-year2038, or a --disable-year2038, or no option at all to
-+# the configure script.  Note that this is expanded very late and
-+# therefore there cannot be any code in the AC_ARG_ENABLE.  The
-+# default value for enable_year2038 is emitted unconditionally
-+# because the generated code always looks at this variable.
-+m4_define([_AC_SYS_YEAR2038_ENABLE],
-+[m4_divert_text([DEFAULTS],
-+  m4_provide_if([AC_SYS_YEAR2038],
-+    [enable_year2038=yes],
-+    [enable_year2038=no]))]dnl
-+[AC_ARG_ENABLE([year2038],
-+  m4_provide_if([AC_SYS_YEAR2038],
-+    [AS_HELP_STRING([--disable-year2038],
-+      [do not support timestamps after 2038])],
-+    [AS_HELP_STRING([--enable-year2038],
-+      [support timestamps after 2038])]))])
-+
-+# _AC_SYS_YEAR2038_OPT_IN
-+# -----------------------
-+# If the --enable-year2038 option is given to configure, attempt to
-+# detect and activate support for large time_t on 32-bit systems.
-+# This macro is automatically invoked by AC_SYS_LARGEFILE when large
-+# *file* support is detected.  It does not AC_REQUIRE AC_SYS_LARGEFILE
-+# to avoid a dependency loop, and is therefore unsafe to expose as a
-+# documented macro.
-+AC_DEFUN([_AC_SYS_YEAR2038_OPT_IN],
-+[m4_provide_if([_AC_SYS_YEAR2038_PROBE], [], [dnl
-+  AS_IF([test "$enable_year2038" != no], [_AC_SYS_YEAR2038_PROBE])
-+  AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])
-+])])
-+
-+# AC_SYS_YEAR2038
-+# ---------------
-+# Attempt to detect and activate support for large time_t.
-+# On systems where time_t is not always 64 bits, this probe can be
-+# skipped by passing the --disable-year2038 option to configure.
-+AC_DEFUN([AC_SYS_YEAR2038],
-+[AC_REQUIRE([AC_SYS_LARGEFILE])]dnl
-+[m4_provide_if([_AC_SYS_YEAR2038_PROBE], [], [dnl
-+  AS_IF([test "$enable_year2038" != no], [_AC_SYS_YEAR2038_PROBE])
-+  AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])
-+])])
-+
-+# _AC_SYS_LARGEFILE_TEST_CODE
-+# ---------------------------
-+# C code used to probe for large file support.
-+m4_define([_AC_SYS_LARGEFILE_TEST_CODE],
-+[@%:@include <sys/types.h>
-+ /* Check that off_t can represent 2**63 - 1 correctly.
-+    We can't simply define LARGE_OFF_T to be 9223372036854775807,
-+    since some C++ compilers masquerading as C compilers
-+    incorrectly reject 9223372036854775807.  */
-+@%:@define LARGE_OFF_T (((off_t) 1 << 31 << 31) - 1 + ((off_t) 1 << 31 << 31))
-+  int off_t_is_large[[(LARGE_OFF_T % 2147483629 == 721
-+		       && LARGE_OFF_T % 2147483647 == 1)
-+		      ? 1 : -1]];[]dnl
-+])
-+
-+# _AC_SYS_LARGEFILE_OPTIONS
-+# -------------------------
-+# List of known ways to enable support for large files.  If you change
-+# this list you probably also need to change the AS_CASE at the end of
-+# _AC_SYS_LARGEFILE_PROBE.
-+m4_define([_AC_SYS_LARGEFILE_OPTIONS], m4_normalize(
-+    ["none needed"]                   dnl Most current systems
-+    ["-D_FILE_OFFSET_BITS=64"]        dnl X/Open LFS spec
-+    ["-D_LARGE_FILES=1"]              dnl AIX (which versions?)
-+    ["-n32"]                          dnl Irix 6.2 w/ SGI compiler
-+))
-+
-+# _AC_SYS_LARGEFILE_PROBE
-+# -----------------------
-+# Subroutine of AC_SYS_LARGEFILE. Probe for large file support and set
-+# the cache variable ac_cv_sys_largefile_opts to one of the values in
-+# the _AC_SYS_LARGEFILE_OPTIONS list, or to "support not detected" if
-+# none of the options in that list worked.  Then, set compilation
-+# options and #defines as necessary to enable large file support.
-+#
-+# If large file support is not detected, the behavior depends on which of
-+# the top-level AC_SYS_LARGEFILE macros was used (see below).
-+#
-+# If you change this macro you may also need to change
-+# _AC_SYS_LARGEFILE_OPTIONS.
-+AC_DEFUN([_AC_SYS_LARGEFILE_PROBE],
-+[AC_CACHE_CHECK([for $CC option to enable large file support],
-+  [ac_cv_sys_largefile_opts],
-+  [ac_save_CC="$CC"
-+  ac_opt_found=no
-+  for ac_opt in _AC_SYS_LARGEFILE_OPTIONS; do
-+    AS_IF([test x"$ac_opt" != x"none needed"],
-+      [CC="$ac_save_CC $ac_opt"])
-+    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([_AC_SYS_LARGEFILE_TEST_CODE])],
-+      [ac_cv_sys_largefile_opts="$ac_opt"
-+      ac_opt_found=yes])
-+    test $ac_opt_found = no || break
-+  done
-+  CC="$ac_save_CC"
-+  test $ac_opt_found = yes || ac_cv_sys_largefile_opts="support not detected"])
-+
-+ac_have_largefile=yes
-+AS_CASE([$ac_cv_sys_largefile_opts],
-+  ["none needed"], [],
-+  ["support not detected"],
-+    [ac_have_largefile=no],
-+
-+  ["-D_FILE_OFFSET_BITS=64"],
-+    [AC_DEFINE([_FILE_OFFSET_BITS], [64],
-+      [Number of bits in a file offset, on hosts where this is settable.])],
-+
-+  ["-D_LARGE_FILES=1"],
-+    [AC_DEFINE([_LARGE_FILES], [1],
-+      [Define to 1 on platforms where this makes off_t a 64-bit type.])],
-+
-+  ["-n32"],
-+    [CC="$CC -n32"],
-+
-+  [AC_MSG_ERROR(
-+    [internal error: bad value for \$ac_cv_sys_largefile_opts])])
-+
-+_AC_SYS_YEAR2038_OPT_IN
-+])
- 
-+# _AC_SYS_LARGEFILE_ENABLE
-+# ------------------------
-+# Subroutine of AC_SYS_LARGEFILE.  Note that this
-+# is expanded very late and therefore there cannot be any code in the
-+# AC_ARG_ENABLE.  The default value for enable_largefile is emitted
-+# unconditionally because the generated shell code always looks at
-+# this variable.
-+m4_define([_AC_SYS_LARGEFILE_ENABLE],
-+[m4_divert_text([DEFAULTS],
-+  enable_largefile=yes)]dnl
-+[AC_ARG_ENABLE([largefile],
-+  [AS_HELP_STRING([--disable-largefile], [omit support for large files])])])
- 
- # AC_SYS_LARGEFILE
- # ----------------
-@@ -80,44 +306,14 @@ rm -rf conftest*[]dnl
- # Additionally, on Linux file systems with 64-bit inodes a file that happens
- # to have a 64-bit inode number cannot be accessed by 32-bit applications on
- # Linux x86/x86_64.  This can occur with file systems such as XFS and NFS.
-+# This macro allows configuration to continue if the system doesn't support
-+# large files.
- AC_DEFUN([AC_SYS_LARGEFILE],
--[AC_ARG_ENABLE(largefile,
--               [  --disable-largefile     omit support for large files])
--AS_IF([test "$enable_largefile" != no],
-- [AC_CACHE_CHECK([for special C compiler options needed for large files],
--    ac_cv_sys_largefile_CC,
--    [ac_cv_sys_largefile_CC=no
--     if test "$GCC" != yes; then
--       ac_save_CC=$CC
--       while :; do
--         # IRIX 6.2 and later do not support large files by default,
--         # so use the C compiler's -n32 option if that helps.
--         AC_LANG_CONFTEST([AC_LANG_PROGRAM([_AC_SYS_LARGEFILE_TEST_INCLUDES])])
--         AC_COMPILE_IFELSE([], [break])
--         CC="$CC -n32"
--         AC_COMPILE_IFELSE([], [ac_cv_sys_largefile_CC=' -n32'; break])
--         break
--       done
--       CC=$ac_save_CC
--       rm -f conftest.$ac_ext
--    fi])
--  if test "$ac_cv_sys_largefile_CC" != no; then
--    CC=$CC$ac_cv_sys_largefile_CC
--  fi
--
--  _AC_SYS_LARGEFILE_MACRO_VALUE(_FILE_OFFSET_BITS, 64,
--    ac_cv_sys_file_offset_bits,
--    [Number of bits in a file offset, on hosts where this is settable.],
--    [_AC_SYS_LARGEFILE_TEST_INCLUDES])
--  AS_CASE([$ac_cv_sys_file_offset_bits],
--    [unknown],
--      [_AC_SYS_LARGEFILE_MACRO_VALUE([_LARGE_FILES], [1],
--         [ac_cv_sys_large_files],
--         [Define for large files, on AIX-style hosts.],
--         [_AC_SYS_LARGEFILE_TEST_INCLUDES])],
--    [64],
--      [gl_YEAR2038_BODY([])])])
--])# AC_SYS_LARGEFILE
-+[m4_provide_if([_AC_SYS_LARGEFILE_PROBE], [], [dnl
-+  AS_IF([test "$enable_largefile" != no], [_AC_SYS_LARGEFILE_PROBE])
-+  AC_CONFIG_COMMANDS_PRE([_AC_SYS_LARGEFILE_ENABLE])
-+])])
-+])# m4_ifndef AC_SYS_YEAR2038
- 
- # Enable large files on systems where this is implemented by Gnulib, not by the
- # system headers.
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
index 46938bccf..bb45c8724 100644
--- a/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
+++ b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
@@ -1,9 +1,20 @@
+From e75f27cb1d70052fe2bb6cae5846b68f8ea7fa65 Mon Sep 17 00:00:00 2001
+From: Marko Lindqvist <cazfi74@gmail.com>
+Date: Sun, 29 Sep 2024 18:38:05 +0800
+Subject: [PATCH] dont depend on help2man
+
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---- libidn-1.41.orig/doc/Makefile.am
-+++ libidn-1.41/doc/Makefile.am
-@@ -73,16 +73,9 @@ BUILT_SOURCES = example.txt example2.txt
+---
+ doc/Makefile.am | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index d63cafa..ba9aab4 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -70,16 +70,9 @@ BUILT_SOURCES = example.txt example2.txt example3.txt example4.txt example5.txt
  
  # Man pages.
  
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.41.bb b/meta-oe/recipes-extended/libidn/libidn_1.42.bb
similarity index 73%
rename from meta-oe/recipes-extended/libidn/libidn_1.41.bb
rename to meta-oe/recipes-extended/libidn/libidn_1.42.bb
index 17ffc6cdc..453a21f57 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.41.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.42.bb
@@ -8,22 +8,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f95a3dc99fecfa9a0c4e726d4b5d822f \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYINGv3;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
-                    file://lib/idna.h;endline=21;md5=176de4fe1d98e59d743d3b12a850e4cb \
-                    file://src/idn.c;endline=20;md5=dd17b9093355bf669e2ea108d2defbd0 \
+                    file://lib/idna.h;endline=28;md5=bff92cd5c90908728225a065d6908289 \
+                    file://src/idn.c;endline=19;md5=dc51ec9ffae14c4f96fb7db4a3d96b2d \
                    "
-                   
+
 DEPENDS = "virtual/libiconv autoconf-archive"
 
 inherit pkgconfig autotools gettext texinfo gtk-doc
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
-           file://0001-largefile.m4-Sync-with-latest-gnulib.patch \
            "
 
-#SRC_URI[md5sum] = "813c7b268d1051ca02c3610986126f38"
-#SRC_URI[sha256sum] = "14b67108344d81ba844631640df77c9071d9fb0659b080326ff5424e86b14038"
-SRC_URI[sha256sum] = "884d706364b81abdd17bee9686d8ff2ae7431c5a14651047c68adf8b31fd8945"
+SRC_URI[sha256sum] = "d6c199dcd806e4fe279360cb4b08349a0d39560ed548ffd1ccadda8cdecb4723"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
@@ -40,4 +37,3 @@ do_install:append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.25.1


