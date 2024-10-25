Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F147BD116E6
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 03:33:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4172.1729827216841491441
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 20:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0028c78f07=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P0sMpo023119
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 03:33:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42f2g42a5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 03:33:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjSuBqBsQHvoGf75+ltIly0D/baRaC70n7zTdMfo6CZl8TZpxvBxcG03JwR8x56lQxZX1Yeu5aMEl6UbwwxOiDEcAuf0frtpNP2RIjx23kFn1zAQYrWsBeGwaSw/WR2nbdSs5qJJu/1CnJUgd7Fs1nS3V5EvbcVjCOnALCHgbC7bqJ4/yWxSrul/g6wtxbuws+Z+TIZKe7nIn7JQyN0XEUHWf0kUUE692C5y8TBxrr2secIOK1v49HXcVNwf0FD45ESVylccChTFBcFvYUuz2nYKEKL3kVUluiniGii1R2j9QkqNvRPH6azU44+4HRuU3nWDACCdOqzYYF3MZJiuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8/qMd7ilrxZLZEJz/ZnoZvWuhSFcossaI4b1Rdz14s=;
 b=DA8S98C4a8qBcUn/8AgHyhWFXVRFKtG7LZruCvk3kSBhiqHvOG8+FKLMwGAUICMWfsK6l2S3294aS0JizmkJmcNGfjn5uUGPgKz2kzRnEAhwGD/qMG1QJFBmRHSYjRbgZWcDXR472/E8jrLTeXkUmh08qB3yE7DiJfoUuRd9upiokLiEixD6C79pfsO+LbiM6G7IPfbj/60L3NoST+vOU5ykp1Um/deMppP9hpKHRTgtu71/3AmibDd5XE51S6ySEIcCO33fUzqBj99zOQNb+eLmPDn5vjIRrt1HDEvKChZZX3wby7q/ojHtfyN7nsOO9KsTOrWLZt0tBinyAMH4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 03:33:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 03:33:33 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] graphviz: remove obsolete and problematic patch
Date: Fri, 25 Oct 2024 11:33:20 +0800
Message-Id: <20241025033320.1479988-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:404:14::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f47641-511b-4b46-4779-08dcf4a5cda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?20JHr8/s7re7WxW8jUuBYWibLA2O+yBmyRt6GrYHA9Ggzol6hpDaXHcip2I3?=
 =?us-ascii?Q?DkHZjLDNN+hPHSc9fciokeKwdFKzmZOoBKqpxl8uXtpzPiFgIjiBF5eSpdkq?=
 =?us-ascii?Q?9jTzvaaw1ZwrGEHw74kxnqqKAs6/ypHLoQac6MxxpM6dp41TItxiRv3sW8pH?=
 =?us-ascii?Q?QsgrPfD8qnAwQ4B035KtNKz3VfP21btkHNet8xDsQi9g8GfeuYkvJzGvDHA8?=
 =?us-ascii?Q?RtaZWKa1S6sphpPtrauKXEH3b+d4zucc0RgzpMLL413MLowqUVCfvjDZmj+I?=
 =?us-ascii?Q?t4hTG+ZgnPuyJ/+SrLHSA4KSwpIxVSo91B4knEUPi7yTl8F6js3CQiam4wT5?=
 =?us-ascii?Q?l+X7q9oauWWNWKozgiCE4m1eLCyFIF0cklT4/sNL1aFJUQcrxrjxrDJWKzya?=
 =?us-ascii?Q?7FuaGdtfcOWSIPEXEi6tdlcEwytQxHkFgUi+/o7Culrc1NtbRNhinfzyn0N3?=
 =?us-ascii?Q?1g5gVBpoudckLJvhIT2BY83eBmlBqbPNlt9za+oAqhnFYq7vExxmzhka6vIs?=
 =?us-ascii?Q?h4nL33irnjU2Z0l6jeb2d7N73umTZOtMkTRH+ZDCPdV2qS2UTGh1SPZPHkJS?=
 =?us-ascii?Q?ou5YyviJWb0e9uFmVVm62rViGJJp1goAxnb9r2DS2kTxzys3LAHUk8NJvyD0?=
 =?us-ascii?Q?5GSqD+4TN90cM70mRg0Oc26I+JltO1kBDLFRAcETvyvjvv3ceWQk2VMAyPju?=
 =?us-ascii?Q?dQCg/Uam50zy4UzEvDMxzqnyY3s/kAHu7wAKgkcNLnSR9gwWJqEvsxu0cinl?=
 =?us-ascii?Q?4g1PtDJgcI0HQYU6HCU+zbHFgjBQZAofqsLDpVENc0PujScMU7gznGIndEzO?=
 =?us-ascii?Q?sGZt7O46DP5fSSxZDOEFWPfvWx5AijZJGG0DfgURusBeIH2kxSx1BZR+rRZx?=
 =?us-ascii?Q?XCMPskAo6bws/kdnU/s9cs3e4Kx1yr/0JPNvzsgUxvtx232CfJp/BRFzg32x?=
 =?us-ascii?Q?NMhDpgD08pC87wkEaBxp6ZFw/RcFT3CNDB8el9ZpR6yCrWBSXwqbOT+4zEUw?=
 =?us-ascii?Q?mT0CDap50fVfsNXbBIfh9QHRI9HGqhPwkU19NAIxZfIsBaTABbBMT0N7pSp6?=
 =?us-ascii?Q?SRFvWuEmCoJWsBFTrJXbeyqFMsapwE2RIS7/SOVy6i8+8CfEWkR+v9s7V747?=
 =?us-ascii?Q?i3tvziOt2FJperVSpAia/8Z1UPGDTQN4Ue+Ynyja9TdKcDu5TmMUPcyDbKmF?=
 =?us-ascii?Q?VP+Y97jN1MZp39vFBUMGMpz8jchrCXbQN4sLsqQSx9TyDPWPagwBnhuIRpPP?=
 =?us-ascii?Q?ECmzvFPh4SDo5qKLTIqvzmqomiC9TfEHaIheRzijI+G0P8IBTunMKtvmVjzV?=
 =?us-ascii?Q?TjTZrIXNVycBnnZOKKIwGjMT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lp4yUhVndoj/l+Br3YvMqrXMbRYS0c4O0wN0iLLGbRuUq1CPL4AZKPX1zmSR?=
 =?us-ascii?Q?0FqX62s/+wJAIcbczmAOI2/IsadB2h7PmCAuMlIXhMX9XFkfgC1k60b3ZTOR?=
 =?us-ascii?Q?zxurjmzg8bbyVm0lFr04sSeCkKEB8hpl1IhLdBGcW6l0LR8GAG0hLqdtAx/+?=
 =?us-ascii?Q?cSe9U6Ci9/mIdIooWXaIKXAS2cO6EAWoIv886GiL9Ibl4iakTXRTon9nihbv?=
 =?us-ascii?Q?JZ4ay9zMDZfEjTXUP7+pNL1JQKEcnZUEA+V39RBREFLZ0wAydnUihsGYvjkQ?=
 =?us-ascii?Q?7JtYJdFUqjT27uUI9gdqE4+VIQyLblANR9zfZmRmSlU4bnOd+JMCHOKkhJIE?=
 =?us-ascii?Q?n1yTwHNTvhzxrHq9iFBZo4ZFrAzGE4kz5jHyBarhKX36HEwfrBDai3nAj3r0?=
 =?us-ascii?Q?drWHi92uSTAKhS6X99LfNwzL1Lue/XeyIZMGbD4BqoB7AUDz/PDVrhDjo9Sn?=
 =?us-ascii?Q?kwEIh5NGXgUSbTv+ZavYlNfciGORZIsu71nDpR8gEr1WtJ48s+tAsE/2cE3d?=
 =?us-ascii?Q?tFChHOTKrbc9OOxH45v7MC3/WPC2Arf538wvwgXRBSDci8Ki5/dgoZi9YGve?=
 =?us-ascii?Q?arhCZc9MUJ1dMXPJ5DSAxHOPYlwNbBzDHOZCvQiUoBSIi3iNJ977n27BRQAs?=
 =?us-ascii?Q?IN91vCANthfnAxyiwgj7gGslM2Dvf/92YI6xmzMHFy4J/IZadk2IE5MLgrT3?=
 =?us-ascii?Q?EiA9O4Yt/BTvNDKrvNAjuocf6bDTVvIsgjD1Ko/pcw3vnh850VdpFFwNfwUD?=
 =?us-ascii?Q?U8OST7lcrjbdwwxFLSz970+wEWtJN+tBxFKrxzduu5oruYANK4TQvx/bXb59?=
 =?us-ascii?Q?UwJV3o50FNx0Sixd6uJfsob978RDhGJoxIEayPcKnzJUkwCtsM+mpi+PqqiG?=
 =?us-ascii?Q?Hg8Hf/DmoGPMfYluBtrfCv6hXG9ZT8McK/dvDo2REO956rKRBU+vBjtqm05Q?=
 =?us-ascii?Q?ZZaiTcVZCzT4YTDZYdMsaMWvHXcjW3btvZYxjFkIGs5bJqBeAgxgytbk0+cF?=
 =?us-ascii?Q?ZW31WXDow2D4IJ9RWcdbivZfFc5AUa4fwPF+zzErWcvceLOdLtHFZHuFa+Mm?=
 =?us-ascii?Q?o9262MECisHJC5syRcdoPKqz3LQVBVi28lvosVHGBxB+wMs/4N0/C/4qtgAC?=
 =?us-ascii?Q?5gGyLFahuctuxLqdTboD6vsj8+gBaMJnEsKk/MUHxrMfBhBY5CQpEbYgJo/e?=
 =?us-ascii?Q?BsPqtdSywfkE+4y/R7OnyRD8a0ik+aL1UL/deBqTxLfC2nRSApQoMwy80fid?=
 =?us-ascii?Q?U4wZl8OB/bwytlYW9NCwkF8womozfiMHRzaBNO3UiO0eO+mZbkELb87QQNu5?=
 =?us-ascii?Q?AZfabAJvwOAUu8GT+IvBigZP02HsYtomZFbXXmOhHelcgFfDwnAOmRsyYgNG?=
 =?us-ascii?Q?GiBnywjKeV4W7UYZA4XtxFPtvnU2y6UW1JjArQl3+GjKHUlvCQLS7AQvuozw?=
 =?us-ascii?Q?GVJ3DXBtA8d7d0trCKfb0ac1L7+MhxLoJ6XB99jaRLU29A+RhGbPZ1stz+Ve?=
 =?us-ascii?Q?u+xvlVLfUvztxCutMJd0+RpEOqqvxcbc+0SKnBaJ89TiIlu4x2KryWudiPuL?=
 =?us-ascii?Q?TbEp/RPN/QQHr4O7eKapcx3ZVnJiEnfY3nEzUWNh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f47641-511b-4b46-4779-08dcf4a5cda3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 03:33:33.8325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOJiX8b6rKO7s+z5R7KHcCadiYNJzltGFsxu2KpDuvG8gEocN0AWqMFR/w5VoLPL1kkDIkn2RZU5NfjGzU9yWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
X-Proofpoint-ORIG-GUID: eleqXmNbLEsMFdQG5QFXwUNiKCxsczgZ
X-Proofpoint-GUID: eleqXmNbLEsMFdQG5QFXwUNiKCxsczgZ
X-Authority-Analysis: v=2.4 cv=eoKNzZpX c=1 sm=1 tr=0 ts=671b118f cx=c_pps a=v3ez6FdVe4RSF1xj2bRqRw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=p0WdMEafAAAA:8
 a=8E_Ba9SqqqBquYfbRtMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410250024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 03:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113223

From: Chen Qi <Qi.Chen@windriver.com>

Remove 0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch.

This patch is obsolete and not needed because the current graphviz
configure.ac has correct logic of checking use_tcl. This use_tcl
variable needs to be set when '--disable-tcl' is set, otherwise,
things will behave as if no option is supplied and the configure
process will check tcl automatically.

This patch is problematic because its logic against the current version
is wrong. The recipe has already explicitly set '--disable-tcl', so
the configure process should not do automatic checking for tcl at do_configure.

This patch fixes do_configure error when host has tcl8.6-dev installed. The
error is like below:

  QA Issue: This autoconf log indicates errors, it looked at host include and/or
  library paths while determining system capabilities.
  Rerun configure task after fixing this. [configure-unsafe]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...o-be-empty-string-if-tcl-is-disabled.patch | 33 -------------------
 .../graphviz/graphviz_8.1.0.bb                |  4 ---
 2 files changed, 37 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
deleted file mode 100644
index 99b53e2e12..0000000000
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 564901ab78da2b2b1bed92351dc3c102dc0a8154 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Aug 2019 17:51:39 -0700
-Subject: [PATCH] Set use_tcl to be empty string if tcl is disabled
-
-Upstream-Status: Inappropriate [Cross-compile specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -1225,7 +1225,7 @@ AC_ARG_ENABLE(tcl,
-   [], [enable_tcl=yes])
- 
- if test "x$enable_tcl" != "xyes"; then
--  use_tcl="No (disabled)"
-+  use_tcl=""
- fi
- 
- if test "x$use_tcl" = "x"; then
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -11,7 +11,7 @@ pkginclude_HEADERS = $(top_builddir)/gra
- dist_man_MANS = graphviz.7
- 
- # $(subdirs) contains the list from: AC_CONFIG_SUBDIRS
--SUBDIRS = $(subdirs) lib plugin cmd tclpkg doc contrib share graphs tests
-+SUBDIRS = $(subdirs) lib plugin cmd doc contrib share graphs tests
- 
- .PHONY: doxygen
- doxygen:
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
index b3f02148be..5108f03233 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
@@ -24,10 +24,6 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
            file://CVE-2023-46045-0002.patch \
            file://CVE-2023-46045-0003.patch \
            "
-# Use native mkdefs
-SRC_URI:append:class-target = "\
-           file://0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch \
-"
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-- 
2.34.1


