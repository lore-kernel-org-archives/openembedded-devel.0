Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B307C433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 01:32:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2346.1642210351567161920
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dP2DOpXL;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80145bf932=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20F1KlJu003692
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:32:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=kzaobXdagarRtskPVmfN6XI0Y4QpbD7BsOn0HBsMeWA=;
 b=dP2DOpXLsdk/kNE6qU4+C2v/7RrUJM3eF8GmGIJgR5Zb/qJnirkayfNjKWcSZDgI/Nko
 fABygm7FEgtV6EGFJ4z8ZTmDtMKPldlQEC6oMVgr1i85CF7gc3iIB8GRVHAGotK1YI1W
 QwPfSwAn2YNko6ngnbTgIbTVm7bUsGYuI/JxBmve/FV7ZReF+HvZiRz954lCFriqFUtt
 xoqj0dXyMdnU1uufuuOwDylZe6Qii0+nGRpnAWOWhaIr99T+uP/ADVshTZ7KioA49yj4
 PYVz+2ywkjOam9fxzplyP5/7HKXjp4qbOziL2/876k1gBIG60SuqsVseoZwsQKfLkV61 Lw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkb2srddp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:32:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDxHfZh8fjPSz7eF4aghLcnScd8D5KfgPpI/bf4Q/b6K+plmBoGRZtrygTGVa1eJZS4/eR7eTJhJvYvz83pfrZeBB31+xM2yOXKPM0d/hfiR4MzxUmcTLaIng/MTXueLXbP7DfV+wq708OGJ0IEmm3WnMDn+mX+f5/ZXg40+hoQ3gl2wpJF/g1nz0+r2IHQx072+Sv//OSFEmdObYjZASKCEUORJ2xwsc4tEaMr5kGYyx1jEF4Us3vsaBlnrRCqYYMtMf1+bBR4+d7kQ49bDkoDxhIoL9mWzJXK0G3VipLS6CXRhX6B2x2U9c6Vzwrbc84SX+pA+JRZGlJVNINXdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzaobXdagarRtskPVmfN6XI0Y4QpbD7BsOn0HBsMeWA=;
 b=kDWmEz30ZkieTcu+/KqxmJazKAfFydoD7n0AOrXLfsxkq63qFnX+NJ6r6QyscRPZ5xJtpjes0GWUL2pDltsRYXDQTa7u8Zkrz9AenRFggf3VgiusJeL+xwFNE7HBxsKqDOSjkJEgV6lMvUwyeQQlYFEP3GysFHaQny/1dMQZbulZlbeHV4Kh8TuI5Pp7kXAez+fde5LlEyR73B1VbXbloCemOtIUVlqAM56yIq+m+FeN0gbw1egqCy/UdpYHzPIp5ZEaO3DbpPjNobJrBtKIi8yrDJZ7Ak0PNZL1AbmYPCwKH0FQefMM18kHEJKf0z4iBFWZ8PDj7VGjCAtjkjZCNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB5077.namprd11.prod.outlook.com (2603:10b6:510:3b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sat, 15 Jan
 2022 01:32:26 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706%5]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 01:32:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH] dracut: upgrade 051 -> 055
Date: Sat, 15 Jan 2022 09:32:14 +0800
Message-Id: <20220115013215.332593-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f0e4f33-67d6-4344-1636-08d9d7c6e2e9
X-MS-TrafficTypeDiagnostic: PH0PR11MB5077:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB507763D501C62AE222FD9050F9559@PH0PR11MB5077.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A3QdywwdpN0O9guGAbln2AzmeRalIeoB1GMiMjuwSrYNEcC14fibK2RVOJnGCtjxjYIJQmepTE35JG6h+gJFjmk3mRitcJCruJjeE8TqPYRwUIKBzWRsPnRlrhxNxSUKxrMnpLZwxm9ZDXus7cPAaEWwIVbYLr3KX7Bf/Nt4ErbJWmaWvKvtZg7sVevJsZSCcb5WOXkdyvsaTSd2WGBJHUfLBm1XtzpZ4lbaQ85X8WfgaalFPCuOdJUW9Wuar0YgtvScPzcmNd+x5FcxbcJ5qhT/WQGSrp36ko9wwzLdnmFmpIXVPy10b2wes079aYITCiw9PoKiZ8XcW+7q/gyYa6++oZbWtvyKvU9dFJ+sp91QMTojjDzOrJ+ZS48BDz7lziPTxidAZa2OFO/YeZ2atGA2WvFn1gBqfjdYa6r/mnesztFBSNKPI77nGaAjbVu42Qm232AebKLDjP8lArfEK67f6F+Craktku43x7JBbsw71uo+A6DXwK6oWUhxUVyTcIzox7G3H6PlifStJcXtySrHuFDMcxoUoW70RhkJTIP1cG+tuy4iVo45TSH2cpq6ShGwiNliWyF+5YhPsi7nJqrR3M4S1fyQ9Jj0tD694KXG43bKzUv8mKituIVYJeuLcXy9x/RDTvf04f1qFjJipxpBFFaQbv1diXugYFgW5kOa6vEtVMvtN4iNih7Q/15gJ6sHfcJW8YSh3ntf9GRjaAXTXfTBg63G4alsBU6xqn2mv6yGCNdpYUcXsTzBGqQPh9q1AckbHRMO5mD7xitpBFAZKg+n/nG+wFOFdSUKRrg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6512007)(52116002)(8936002)(1076003)(8676002)(86362001)(6506007)(53546011)(36756003)(38350700002)(38100700002)(508600001)(2616005)(316002)(966005)(66476007)(66946007)(6666004)(186003)(26005)(83380400001)(6916009)(66556008)(44832011)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2zqpVzgwWCWTUPsTlC9A39oq8VRiIed09sbruk0KCUf3ESVJnWOOJMtq9kFx?=
 =?us-ascii?Q?CcoYr9tBBNiXRzlOndxjwOIL1osNPvPZGGInBqosBt71rZUScjeo/vvN8fjH?=
 =?us-ascii?Q?z+E3YmDf7jkWtX9Nk2HKYVnhv3jaP6/edxOi3QI7AOr1m5HwgvSMrqOMg5Du?=
 =?us-ascii?Q?xrCMnH6XmOqkeZseBLu5IHDHWrTjwUjEmofE9qEndvzmTiGIz/L5MPcMqpJx?=
 =?us-ascii?Q?QGrhuPpn1KY9fA3BwHY/9qWBlBWUD3YpHJ+Krocc073DIOlvwnvytZn1vgtI?=
 =?us-ascii?Q?j4zJzQdIq6Ta9xYNy5rfCiQIpLgh8oTWmDBzaLrLrOw4Uryhw7Qwh3aVJOZ6?=
 =?us-ascii?Q?q3Mn/CFbRqo1tHUqnEEsi62fPLvnPdGB/vdZFXDxvXQhqwgZ5IowTBPWjD1w?=
 =?us-ascii?Q?Bph751fs/M0SATzWRbnUIJ0ax7vtdoRjAy4m9qV+msUjILcAbcNB8x0hpd2w?=
 =?us-ascii?Q?eUU3rT1BB/X7wLNAYG2prPGycUnfcmbUDeKzmP+cTO93PNocikTCfWcAa8mJ?=
 =?us-ascii?Q?23DiBSgzzaUXb7WahAAg+Ar/HutQaqH4lEnJSGSSQqPx+9kTGPXoMzt62UmR?=
 =?us-ascii?Q?xTwHs3tbxhcYl0y4t/On2aPWM9ansJWkf3bYFPIX61jfFbrfs/FnBejgnDpV?=
 =?us-ascii?Q?SJBQhHZv3PDTYSbeVi2XSpi6Q1l/uKAsd4AyWnvl+tRhvYvNWQeSGWU4/C5q?=
 =?us-ascii?Q?xxiv2KaS4gPlBHKunfxykbMCqZnPDAr4KMd07ARfl/EcuTMYBzzCPmTbXsqm?=
 =?us-ascii?Q?1zDyHBL9s92rBsUCv9P0SdeDPnG8AMtcecQ9uO94n0YdTmNVTdCWAFhUjGv5?=
 =?us-ascii?Q?vTyyS5nhrEmQJg+2BXGCWd/nzjWCtyff5SvUjvBNeBc/cMaA8V/N67qlRz2d?=
 =?us-ascii?Q?g6baJHOTnt6HeFSu0gHQlVqAqWdCVDVzG3KZnBy+IJW7TeUVTItqCtDtYCxL?=
 =?us-ascii?Q?DypjFdSke+06HMt2z/IOOIpiHN36h9M/2gfwk7DqbOc61VgFdnzIqMzXR/Mb?=
 =?us-ascii?Q?uNtYcdLWdMdi8LRGK12VFhfgRE60qf38a7EGG9NjPN4U0H2RhKGDjYW7XoI6?=
 =?us-ascii?Q?chUeTfm5/HuNUTMKqYmZlfLr8T5lpw0nuBQA1OvHLgq2L4SHEH7VTS4hLWSg?=
 =?us-ascii?Q?tpQd62ze0iWar1mYnD57n+EWjTcvEAzDur1tO4Uw3icOFK0XljlbxtewrOsI?=
 =?us-ascii?Q?pkDdN3BH5wDW4WFNMBlKi6u6tagc53xrPTct5Yxu/oFukkvzQmUqzO41acq6?=
 =?us-ascii?Q?rSuVTacAOHFyFbqqeiVZ8BEaGrqww+oZxdeASliJ5RN8yh8vWONNp5Oa20oT?=
 =?us-ascii?Q?3hPNb6o1h4CRLuRFwzbSGbHEdtqIm7TXiiKm2HxUFwSo365hkfbdyM7T4ZYO?=
 =?us-ascii?Q?trwLn3lirZHMx591fpGhJW6lse58AmoG/ef0erdcdvnPrGuXCV1mhjfYXLs0?=
 =?us-ascii?Q?6J1YS5hbjEt2cQOWhYR1g2hvXvo40jGRpwoIK5RI4LhrqYT1a4+OLD5f7o5n?=
 =?us-ascii?Q?dN0L/eG8+AhZUZE/+sG4kSMRHB5svR9ZrPVdEKUOsCNX2AisV1oLSN9V1Vj0?=
 =?us-ascii?Q?S1JLbWceVPdxEFcBNOaLnObQn60xWdRAtLYJlsprVfryu2/xRjUTP9LYmoEI?=
 =?us-ascii?Q?VoUgF7tVsp0HRem0WWQ1JL8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f0e4f33-67d6-4344-1636-08d9d7c6e2e9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 01:32:26.1152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 E2Ay//jlF/AvOPG0xbFUJq73nwErMZ3ONilVmWWy072oPE4bLWWL8HQnKOtE2qMJ199xpIi578qZvrZ0Dnhh0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5077
X-Proofpoint-GUID: YiP7esKUiMxcuZSHzUu7xWk0cT6TLFPm
X-Proofpoint-ORIG-GUID: YiP7esKUiMxcuZSHzUu7xWk0cT6TLFPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201150004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 01:32:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94849

* Rename recipe name from dracut_git to dracut_055
* Refresh 0001-util.h-include-sys-reg.h-when-libc-glibc.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-util.h-include-sys-reg.h-when-libc-glibc.patch | 14 +++++++-------
 .../dracut/{dracut_git.bb => dracut_055.bb}        |  3 +--
 2 files changed, 8 insertions(+), 9 deletions(-)
 rename meta-initramfs/recipes-devtools/dracut/{dracut_git.bb => dracut_055.bb} (97%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
index 32714038b..aa2ea723b 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
@@ -1,4 +1,4 @@
-From 06011ce55b1e892e863568a73d64eebc6389544f Mon Sep 17 00:00:00 2001
+From 9f7740c4c2fda64029c23674e9858ce8bd4367df Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jul 2017 17:14:05 -0700
 Subject: [PATCH] util.h: include <sys/reg.h> when libc != glibc
@@ -11,13 +11,13 @@ https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dracut/patches/mu
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- install/util.h | 3 +++
+ src/install/util.h | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/install/util.h b/install/util.h
-index 2ad3254d..062626ec 100644
---- a/install/util.h
-+++ b/install/util.h
+diff --git a/src/install/util.h b/src/install/util.h
+index a6f9a184..82732913 100644
+--- a/src/install/util.h
++++ b/src/install/util.h
 @@ -36,6 +36,9 @@
  #include <sys/stat.h>
  #include <dirent.h>
@@ -29,5 +29,5 @@ index 2ad3254d..062626ec 100644
  #include "macro.h"
  
 -- 
-2.13.2
+2.17.1
 
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
similarity index 97%
rename from meta-initramfs/recipes-devtools/dracut/dracut_git.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_055.bb
index 6f39f2375..91514b840 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
@@ -6,9 +6,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
-PV = "051"
 
-SRCREV = "e473057ae1de303340dec297c786c4a701cc61bd"
+SRCREV = "86bf2533d77762e823ad7a3e06a574522c1a90e3"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http;branch=master \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
            "
-- 
2.25.1


