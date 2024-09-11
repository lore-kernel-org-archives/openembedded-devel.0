Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FFCEE4992
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 11:15:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19251.1726053302421162601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 04:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99845107e5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B5sYbs030286
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 11:15:01 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gdt8md6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 11:15:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJpPR/wOIMvfiIrPqSTIiPCrN6fn4BkAPtoMqalgCHlBirwQH0QhJAz086SWsd3PGK3VRokwS3Vq++qJsoPyqa+iPcxBItvFQYLLLfEqRpvb7nnHMg9CmQkCn2sqmzkMQLohu3WmWS3ye+ixI7SGHT8UaO+on3xT+Le+nJOA4UJL6lIJAExhrWRz/N+jOgxkkjoNqvxUvIw8trsb8EyEyxs8lsiSANVyOq1UuMd91aVmnLvb3qh3Ms27IGlP3nwy2NUXZVRg/cqbRH/AnJPWaEIju2dQQPZRia9iBy//hRWeJQmpyM4CGh8/35ujYoN/se1ih/XndqGnpoWB87ubcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pET/yTfdhNFEMrpC+IvE3SFO5ZtK984rbxbNGzXqhLI=;
 b=bmUXVQPTpuGIFWSMHbTA2XpPXP9GfQw2gyfsxqIjs0mpHdOrO4SPJs3oV4nNSYNYcxYkXcudTj1Wgqm355MD2Sv4hVUEGPfBpsgse7g3XaBKA+uG9//uGF2DusbL9eVAE3RfW2xXIqGG5s+QhmYluTjflrRTTLdSW7dpmO+0PyA/kp5oyAHLzDFTCU5AJwnAicj0wQTk8m8wmrHLHgkIGpAKqW4+wK+rAkg6BVGtuXSyFmtGu5D/GGSbWf4C3ZFGjTL74qlwVBHbYVupLveRiLbscfTA3BQrsxMMOcaRVfzBGgryoZn3vMaLzAJBPAOy5xIvDpVsF2C8zqa5swYBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 11:14:59 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 11:14:58 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] drbd-utils: upgrade 9.27.0 -> 9.28.0
Date: Wed, 11 Sep 2024 19:14:49 +0800
Message-Id: <20240911111449.3135429-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: d18e3131-51c8-4ebe-afea-08dcd252f8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hLcAfbKfmp4ijyMlgkF8dduw+yNxPZVZVTdtzPK7Vo4HJwVvhc9vnejTTJHS?=
 =?us-ascii?Q?nOru9eq1N6Kl8ICyhtjx4Y0+qy3PhVN4dUCDDs2jDi1gTRT8q+3aE4Hhv5Pk?=
 =?us-ascii?Q?DanbxBFR6DhReS4YYhKmyT20lh+/SVvyU6aT01BYyz5/XmStKCyJS6rj74NW?=
 =?us-ascii?Q?6PpDWx5xFN4NB1Hj1+tpnTvhOq/3RCbGLhlIbHgd+Xda9UZSjvG3PDdWXmS9?=
 =?us-ascii?Q?N0yXc2y8+EwwhEuV0+CdifxrYfMTqoEaqtobDlCexAhFypgoEHygSNaVvoas?=
 =?us-ascii?Q?RsuZNFz+l0Ztmhs6zwHfA+xUCxxwJDhaINh75dY4wISVrWh2C2j+vHSVKTGq?=
 =?us-ascii?Q?ejbE5rC6S59V4moe4UDK2gbFzDQwffmMqRrWs8nhznc8qt3zfFWAhhsYgapn?=
 =?us-ascii?Q?iNAlmTldkWaiipHzpXnHiviIJigWrbdmUlcvCdSHdFT3jshxDG/4N7baebpu?=
 =?us-ascii?Q?xBWcYwtSg7MUEaKUw3A2vbVlNWjWKolnCV4MEoxqE2MdYksrmYGlnnlpoDfk?=
 =?us-ascii?Q?FR3gksNzJWAe4pDiQliINyN/JWDR3WOdj168FPDcg1xkYGB+lk+laC+P4UDg?=
 =?us-ascii?Q?d8OFMxWM82IbRkQewWRimtbSweGXPT1b1n/DjQCnO/OwIPq7SrPQ5XPPBfV/?=
 =?us-ascii?Q?/ujBbjVqj5qEKjH3bXDn2Do8cAbAt9JnzZ6yH05MUAuJP4PMkNnbFQ38+Ngh?=
 =?us-ascii?Q?pewOBrG7/IHl5+Eihwq9/1xDv842QznbsAyUk3DdBDFgOQ1n+MbMNSAQd5qd?=
 =?us-ascii?Q?AUG+8kQ2swQl/1tXf6/XIWM7ksJ2oi+QolIyTW8mBuN0ZWXtIJZbPFfiPSM6?=
 =?us-ascii?Q?781ftP0i9ir2qaYPgiWpVCf3fhrkbWzfYb5iv4C6Otvh1eDHV9Yv81K1SbqP?=
 =?us-ascii?Q?yMSHTBEAZ2vr5/6nlrK7VvH5r0zqTiWXiIQ5BoegO/RzCvEbKMJm2kt6DJ0w?=
 =?us-ascii?Q?LmroIpOaw4X6tQULnxOLQQVvJarUW7xRVwJJUnJEaz77br8ainhcD9qaduPM?=
 =?us-ascii?Q?w+KzainiqOmxiqTehqKghTQuuP3se4G7uZ5f1D/3y+U6UfXOlLcCWUQsdVYA?=
 =?us-ascii?Q?wLCo9+qN7c9THI3YMS712oFbRj4ZoPbh2nceZY6FJ0fzyMiUbdNFa0C7To7N?=
 =?us-ascii?Q?5cRQDhgg+tMoLqZnFR/o7B/66MnWNotYKAAPM4H/++1fEcfAHX4Zeh9U52dc?=
 =?us-ascii?Q?x1i8tr6Am9AFaP2uQL9QJxDmHTArmhHENn3L9NxjhMdvnj9HGsL6KFNXmmiP?=
 =?us-ascii?Q?winU7hJ9gk+/uLDpABEuxtm9AbTie4jPfvcSeps+xLLFx4vqZDZvXnv5WPOs?=
 =?us-ascii?Q?ncpeF8qQGhlbpmEzkdaVrRUOzCwBlDMW32SOyyFes7BqHeJThsbM6Evq9aa1?=
 =?us-ascii?Q?rtyWhv/SYfxmCB5MASglzea2Io0bQ05UYhxXrLA09ZIgjYbCgkzre16kEFiK?=
 =?us-ascii?Q?bGII6DrHcGo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ISvgHfKF6mqOoB2fv4eh2WN3XNMy6KyhFdvWP3VJrCReV3XrrpKOEuD2yWKh?=
 =?us-ascii?Q?f0a/ryLLXjE9v2R6pPsPbntDC4UaUrhDijUgGF5GqamCJYmMu87468WyhZwF?=
 =?us-ascii?Q?6MmjmX5rIs2Uyvps62pAJ6PJIlAGXVKlle1C36GLpcROw9qQ4K5Jid8uylDQ?=
 =?us-ascii?Q?HRahVsw/q0UlA5VjAM93WuV++tmVQL22IlslQlZSzWhoqpPhPBJLxvdNuLmZ?=
 =?us-ascii?Q?PmE+IP/BGeuCOP5kLyvf3ShZkhIkA8QHzs/LduflAXVYrBNJ+dr1bFnUt3nf?=
 =?us-ascii?Q?QeKsheThNjhe39mgUY5nYdKLkR6PPz3+aQsJ3VwIZBU30k69wbxiXe0asUQ/?=
 =?us-ascii?Q?Q3s+AvjhZP20CjGmFrM/iVvGGUBLdrrTgP9EQO9p49wadMGfv88DRJ9dHfyz?=
 =?us-ascii?Q?+P/qcRziyZFWBNPXgfHbqznidB2m718XFZSRf9/X/Qyw5+ecdQIh0SXtAA/R?=
 =?us-ascii?Q?qdatlcfJos6xQU3IIDsYz6LUQxzkfM12rSvDxLRRfJ64SfVij/4z6BVfyQYN?=
 =?us-ascii?Q?AwelXwChyrALuB0xgyrZTwfvbdTf/VmwPfxCn5ep3bLEINnbjPqaNdVDD1b+?=
 =?us-ascii?Q?P2B9qwa+l76XoO2RIYknxTSYyjIpNkHdvyv+isCaVpFBqpAB07tYIAKafJG5?=
 =?us-ascii?Q?VP39YEp1UaVm6hPXdkenn8qyTZO0/JaYoFhJxGNq3qRjgMP+47aU6rpGnxxI?=
 =?us-ascii?Q?uy7jq/vxAAxYpFuon3qNLgA31k5j3S1lNzcT6GDNdLFnk91NPwaUEokh2v18?=
 =?us-ascii?Q?Bkhvf0oslNYUylHgiE8J253x8iNpuxnljmGn0+dvvTXIzILcDYSoiFd/TQSu?=
 =?us-ascii?Q?LxlA7inx7DZZi3ZzPrlZOYjPfqZr8Wx8tonbcjE9Dl7pR491mfMNwJDhYXlK?=
 =?us-ascii?Q?qFn1H8UxHyz0FE7mbTbiSKJL1Wv3quig2U2DVqGxauVjIEzI3KFlhxc9tIBP?=
 =?us-ascii?Q?CI7Cdmzwxrz1kZQp9/1z8Ksn7LZhMdxVChRhkLoJ1SuuKUoBXI0Hk0zgPuZX?=
 =?us-ascii?Q?EeOOWLcynH27AMqpVk1hXTp7iracuWdPHLpk/YQz8gMdxPoUjvO/dz/fFkz9?=
 =?us-ascii?Q?4eLDen8eB4v186CT24woUQW3JRWT5nelMp3wL3gDi12gauz33HIXg+YfNsTb?=
 =?us-ascii?Q?QJ8WVpfll1nG/Odb/rJ02GWIrMy1AbsT/yToSPPD6segJK/6m3QtFYSM00zO?=
 =?us-ascii?Q?K8jEt9qv0XmtAIKVk9oMQZm6MmPKS3zPjEkxjkPOaAFxdh89mtzV6EDjDQ0e?=
 =?us-ascii?Q?hkGq9+GMXAYrnULRZfwv4eOHQ/8r9UXpyQy99kjmGInU/t82K/ihvTGu7wjT?=
 =?us-ascii?Q?Q2G8rOwki2ajnA2AlQ7oogE5Z2MvhUVKRghIV85F4hGg17NkwDfWe5U4Cugf?=
 =?us-ascii?Q?iJrfp83jfk7RwsO8k+jCxZtP6fOOlnl5ZCzd3gUF0eoqdXHc87B+uOKoeIcw?=
 =?us-ascii?Q?dolZz9loUZLFGv4uIwPQ4BB9hxmk0NNMNEFmAuOXUf0GADtgvTYpRd+8C1cZ?=
 =?us-ascii?Q?z0fpTw2zZDrT20zy7ps8nR2uXcaAIv9CCva3QI/0qn3zEnYE5K/SEbHAPtF9?=
 =?us-ascii?Q?BO6XxA/HCEDxmu8UN8F2QQwrMdc9CFbrdLbbG9GC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18e3131-51c8-4ebe-afea-08dcd252f8d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:14:58.6277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e74Z7GhASZidouuq11mkko0ht8ATw+z9Np5zfUIrAC8S3Q/GAfyVW6QNlLhKyof8hLz2CLym0kHqLpw0+ROEvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
X-Proofpoint-ORIG-GUID: zzSST__t6KwjrkZ22e6Ps7U1jxlJU7sJ
X-Proofpoint-GUID: zzSST__t6KwjrkZ22e6Ps7U1jxlJU7sJ
X-Authority-Analysis: v=2.4 cv=a+hi9lSF c=1 sm=1 tr=0 ts=66e17bb5 cx=c_pps a=0XndbtkAAnsFgPxdSZG6GA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=SeRniQIVIXN6zVv3oAEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 11:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112242

ChangeLog:
https://github.com/LINBIT/drbd-utils/blob/v9.28.0/ChangeLog

* Drop backport patch:
  0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch

* Refresh patch:
  0001-drbd-utils-support-usrmerge.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-an-option-to-disable-host-udev-vers.patch | 55 -------------------
 .../0001-drbd-utils-support-usrmerge.patch    | 47 +++-------------
 ...d-utils_9.27.0.bb => drbd-utils_9.28.0.bb} |  3 +-
 3 files changed, 10 insertions(+), 95 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.27.0.bb => drbd-utils_9.28.0.bb} (95%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch
deleted file mode 100644
index b98e1e70c..000000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 61991db099f66348dddbc3408e7ee8c05bda85cb Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Sat, 2 Mar 2024 16:23:07 +0100
-Subject: [PATCH] configure.ac: Add an option to disable host udev version
- checks
-
-In cross-compilation environment, the build host might have an outdated
-udev or no udev at all. But the user may still want to build with the
-enabled udev rule (for its udev-enabled target).
-
-This patch adds a "--disable-udevchecks" option the disable build host
-udev version check at configure-time and unconditionally install the
-enabled udev rule. Without this new option, the behavior stays the same
-(checks enabled).
-
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Backport [https://github.com/LINBIT/drbd-utils/commit/f2b5a7335ae52109dfb95a9d99ae20519c43d59a]
----
- configure.ac | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f1d69ea3..4c56d33b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,6 +71,11 @@ AC_ARG_WITH([udev],
- 	[AS_HELP_STRING([--with-udev],
- 			[Enable udev integration])],
- 	[WITH_UDEV=$withval])
-+AC_ARG_ENABLE([udevchecks],
-+	[AS_HELP_STRING([--disable-udevchecks],
-+			[Disable host udev version checks])],
-+	[],
-+	[enable_udevchecks=yes])
- AC_ARG_WITH([xen],
- 	[AS_HELP_STRING([--with-xen],
- 			[Enable Xen integration])],
-@@ -315,7 +320,7 @@ if test -z $GIT; then
-    AC_MSG_WARN(Cannot update buildtag without git. You may safely ignore this warning when building from a tarball.)
- fi
- 
--if test $UDEVADM = false && test $UDEVINFO = false; then
-+if test "x$enable_udevchecks" != "xno" && test $UDEVADM = false && test $UDEVINFO = false; then
-    if test "$WITH_UDEV" = "yes"; then
-      AC_MSG_WARN([udev support enabled, but neither udevadm nor udevinfo found on this system.])
-    fi
-@@ -423,7 +428,7 @@ else
-     test -z $INITDIR && INITDIR="$sysconfdir/init.d"
- 
-     dnl Our udev rules file is known to work only with udev >= 85
--    if test "$WITH_UDEV" = "yes"; then
-+    if test "x$enable_udevchecks" != "xno" && test "$WITH_UDEV" = "yes"; then
-        udev_version=$( set -- $($UDEVADM version); echo $1 )
-        if test -z "$udev_version"; then
- 	    udev_version=$( set -- $($UDEVINFO -V); echo $3 )
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
index 27f0a9b54..ef0229d5b 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
@@ -1,4 +1,4 @@
-From 264ae7b062ac52a5545a8a562b51001f7ce7369d Mon Sep 17 00:00:00 2001
+From 9109f15f5b8ae142823194b9ef50c392615fe38d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 21 Apr 2022 17:22:35 +0800
 Subject: [PATCH] drbd-utils: support usermerge
@@ -16,15 +16,14 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  scripts/drbd.service                     |  6 +++---
  scripts/drbd@.service                    |  6 +++---
  scripts/ocf.ra@.service                  |  4 ++--
- user/v83/Makefile.in                     | 14 +++++++-------
  user/v84/Makefile.in                     | 14 +++++++-------
- 10 files changed, 32 insertions(+), 32 deletions(-)
+ 9 files changed, 25 insertions(+), 25 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f1d69ea3..3289ac7d 100644
+index d3ec5ff1..910232b1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -183,7 +183,7 @@ AC_ARG_WITH(tmpfilesdir,
+@@ -178,7 +178,7 @@ AC_ARG_WITH(tmpfilesdir,
  AC_SUBST(tmpfilesdir)
  
  # set default early
@@ -34,10 +33,10 @@ index f1d69ea3..3289ac7d 100644
     test x"$with_udev" = xyes ; then
  	if test x"$PKG_CONFIG" != x; then
 diff --git a/scripts/Makefile.in b/scripts/Makefile.in
-index aca15a22..a1cd2ffe 100644
+index 15a26f37..ff028310 100644
 --- a/scripts/Makefile.in
 +++ b/scripts/Makefile.in
-@@ -91,11 +91,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),systemd)
+@@ -90,11 +90,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),systemd)
  	install -d $(DESTDIR)$(systemdunitdir)
  	install -m 644 $(SYSTEMD_UNITS) $(DESTDIR)$(systemdunitdir)/
  	install -m 644 $(SYSTEMD_TEMPLATES) $(DESTDIR)$(systemdunitdir)/
@@ -137,37 +136,6 @@ index 9c2268a6..1666c482 100644
 -ExecStopPost=/lib/drbd/scripts/ocf.ra.wrapper.sh stop %n
 +ExecStart=@nonarch_libdir@/drbd/scripts/ocf.ra.wrapper.sh start-and-monitor %n
 +ExecStopPost=@nonarch_libdir@/drbd/scripts/ocf.ra.wrapper.sh stop %n
-diff --git a/user/v83/Makefile.in b/user/v83/Makefile.in
-index 08cfe574..4c4971b6 100644
---- a/user/v83/Makefile.in
-+++ b/user/v83/Makefile.in
-@@ -96,19 +96,19 @@ install:
- ifeq ($(WITH_83_SUPPORT),yes)
- 	install -d $(DESTDIR)$(localstatedir)/lib/drbd
- 	install -d $(DESTDIR)$(localstatedir)/lock
--	install -d $(DESTDIR)/lib/drbd/
-+	install -d $(DESTDIR)/${nonarch_libdir}/drbd/
- 	if getent group haclient > /dev/null 2> /dev/null ; then		\
--		install -g haclient -m 4750 drbdsetup-83 $(DESTDIR)/lib/drbd/ ;	\
--		install -m 755 drbdadm-83 $(DESTDIR)/lib/drbd/ ;		\
-+		install -g haclient -m 4750 drbdsetup-83 $(DESTDIR)/${nonarch_libdir}/drbd/ ;	\
-+		install -m 755 drbdadm-83 $(DESTDIR)/${nonarch_libdir}/drbd/ ;		\
- 	else									\
--		install -m 755 drbdsetup-83 $(DESTDIR)/lib/drbd/ ;		\
--		install -m 755 drbdadm-83 $(DESTDIR)/lib/drbd/ ; 		\
-+		install -m 755 drbdsetup-83 $(DESTDIR)/${nonarch_libdir}/drbd/ ;		\
-+		install -m 755 drbdadm-83 $(DESTDIR)/${nonarch_libdir}/drbd/ ; 		\
- 	fi
- endif
- 
- uninstall:
--	rm -f $(DESTDIR)/lib/drbd/drbdsetup-83
--	rm -f $(DESTDIR)/lib/drbd/drbdadm-83
-+	rm -f $(DESTDIR)/${nonarch_libdir}/drbd/drbdsetup-83
-+	rm -f $(DESTDIR)/${nonarch_libdir}/drbd/drbdadm-83
- 
- .PHONY: install uninstall clean distclean
- ../../configure:
 diff --git a/user/v84/Makefile.in b/user/v84/Makefile.in
 index 0fcefc5f..81f7d5ec 100644
 --- a/user/v84/Makefile.in
@@ -199,3 +167,6 @@ index 0fcefc5f..81f7d5ec 100644
  
  spell:
  	for f in drbdadm_adjust.c drbdadm_main.c drbdadm_parser.c drbdadm_usage_cnt.c drbdsetup.c drbdtool_common.c; do \
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.28.0.bb
similarity index 95%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.28.0.bb
index 63f0fd18c..af0afc2a9 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.28.0.bb
@@ -11,9 +11,8 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;prot
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers;branch=master;protocol=https \
            file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
-           file://0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch \
            "
-SRCREV_drbd-utils = "fdd9a4d603a9dc99d110d8bd0e288d7c0b6f586e"
+SRCREV_drbd-utils = "ba2ce9037989b6141222c7901d1219cf852949f1"
 SRCREV_drbd-headers = "0349f00825b4198d4ec3248f43884114a187676a"
 
 SRCREV_FORMAT = "drbd-utils_drbd-headers"
-- 
2.25.1


