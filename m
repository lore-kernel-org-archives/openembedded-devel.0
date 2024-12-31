Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C11BE77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 04:23:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.77524.1735619014474446546
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Dec 2024 20:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3095ea9653=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV4E2uB009948
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 20:23:34 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq1yy7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 20:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPFUUs3ff3Ng2UaudpWh18IvCA6w7+22JktEhzxNrEJy6KMq2XhI5q+yKRJojK8YB/+hmBOPH9sZqabsHUZbAJwCI33gcTdwTy8UmjWjBE7A/3Y1RmScIC4H9QuteBpAMT34yTuJE5S6nHVYmcssHC/Edvr8DIFfe4YHuxC7Nk9Voxycyub895OLGVDaxKPve8hxNyNW6EDecVLWdnFQNJlltdiyM0p7t4MkTJMCXnKbK4P9oX6TeXodI13U8mUdoGufGNLzV5NZWflW1l2a3ckVNEtQTnvnuZ3cPm0TvgAUr2Cl0clSRvf8ke5gS9aNUMdbjjfNtFMTaF18HOW3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmaZ+hdU0hY2kRiHv2VMbUzW459W9RPihG+Pp9GkbnE=;
 b=YUNPw/illTUPLSFFN5wm6FXhw0/PDevveCas1z9uGZPCvhpPpWbM1mPQbWlWs9hayuSiyeT9vMp1mqd1mpkxJqOBkBxpQpIDuekawCh6tu8vI0QaLfrNksNtbYNCzm4d7721aczWoTtiNqpzW9D2HVmxsNUthxuiGIRvG/iyZYURFYe+IEo9gfk+q3jkLWfVWZbo8uz87HC+C8N9E0iyIJf4L60utAOz8ZWdn7l590nMB2FyUdZ/BGde8a5DkvzWQV0SYzNuNaUp5BEjf83fzrWr2QB6VINAR8jjga/gKHRXoJKfvnds5+l7OGRrC4Sc+rQ4PLsp62BHW7zd/6j0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8293.19; Tue, 31 Dec 2024 04:23:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 04:23:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] nss: upgrade 3.103 -> 3.107
Date: Tue, 31 Dec 2024 12:23:10 +0800
Message-Id: <20241231042310.3947402-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231042310.3947402-1-yi.zhao@windriver.com>
References: <20241231042310.3947402-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: d2926429-b870-41a9-ffc5-08dd2952dfe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Dmn1AJgZ4zuhZQ1Ffg5pUiGhK8dm8faGTWc3g5q89I96MfptH+ZhwNoGibnC?=
 =?us-ascii?Q?h/vbn8920MkQK7rgRs9rox1W7RL5d3VZ4zs7+KaHPj7pINcDf55pJ3+S+7Od?=
 =?us-ascii?Q?TTKxPxyeokMPTgOkAWh06oSOsAW4Hi3SVlImPsJuKMb76WWs7oJ/8QIj9jon?=
 =?us-ascii?Q?kFx7E/drqAmKcVeO8OvqrezNNEP7Qq/SYVQ4F6xWO7PbrqCEz6CBW3/qnCel?=
 =?us-ascii?Q?Im5NlsRUajbk7U9Rieuk/o1kALkGkw/Uw3YDDnvzDEVj5SiUheWmOJ8uh1UU?=
 =?us-ascii?Q?eSwRNxGR8R2Scj49QkRWUMdbMk66oS8Z6Idh/XxgQQ/ZSw8xkbwMawKdsAAF?=
 =?us-ascii?Q?iGUfbuSc00T2hjr10Yi0k/dlqecGMuh15Ga8eqQkM/djjKtmvAJUIN0VtIb4?=
 =?us-ascii?Q?ir6V/F5ifp3c9zZLH/hqmPvHV3zypiYV59APFejxLUO7f7C+EFHgRKH/KiB7?=
 =?us-ascii?Q?aPUTHHk3Zf+W4Qu0hElf8DDZYI4J0mtkQRtmINI09drrPp6sUDt3S66XnLR/?=
 =?us-ascii?Q?z4twJ1qGCmu0fiIDo0rzwwZ+ab+luTzZRj2wB9Tgcmwtp5EGrm2jH6tWcrGU?=
 =?us-ascii?Q?9omJoQtr4CansjR5KCRNQjKplYtarX7+0qRVr/q9m99qNQDadnohJPNTDinT?=
 =?us-ascii?Q?hKtyNtXPt9sWjF0n4jQTuq5ZYB01BlROWujXEkol5IQraT/Vx23uiLQUPtLA?=
 =?us-ascii?Q?rMd5mE1WrTrT2LWaBdMHg2/7Q6SI0L0GVDi6FZATJnNrqjLYOhQsX+Dxt6kQ?=
 =?us-ascii?Q?7ZxTbAUvujI/81rY1q33RWcjQYqvHKmlExqBDZ09b2Nmr/Fr/gK+oAQ7fPMo?=
 =?us-ascii?Q?08JlJqL2CsmsSpvFkOwbSbj7QmaWVoQ4DziLt7o6NYgx6O/medtjJgEUeOf/?=
 =?us-ascii?Q?+8xn/Sim0T6EUsSCvsKqMl6ULKcKTKaHPfOf15EwYYqRNleZNRhF33x9ss9V?=
 =?us-ascii?Q?J+owddm27hh4UujawMczcpVBWL+7eKeXJMsbVtFGlKPK5U+Q7KzVg0mfHMGE?=
 =?us-ascii?Q?8C15CEuv7b6jzIWXmVsV9hlSAe0csQc7ZV/lHLAkgeDKhxs+FQLd0+meoUPK?=
 =?us-ascii?Q?ojcgPiD/yGVOJoByf2PaOpc74Qx5Xh3HH8v5aFj7ebC6fRGGpyFkYclkcGQ6?=
 =?us-ascii?Q?CpFmGkEmWv+luHRghenmtWU4bFrJf+QtZnsP6PKQ0stBmsX3k49UFeHqjeTK?=
 =?us-ascii?Q?IEfIb80H89LBmvF2nQVZpl+rBPiyFOfpq7+u9r7rKzIdqlyguZC/agxthLb9?=
 =?us-ascii?Q?lOqfiOz5jW4xcOoPgIyN7DmQaYOtrEj4lajC9/IzJmEIF/29wjl1YUr+vue+?=
 =?us-ascii?Q?+OMsxpqUewiXOr6tTTJXTelatYvGOZ0tJ7d6c9xnB0sRG1L+PBdtVzt2BBeo?=
 =?us-ascii?Q?o7z59Ab9rrYgNaNzrUd6JvGmvczu4+C1nfx7Pp8EUSAg3LMJ4A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q+ux20kXwm/RKsygYTnmX61V75i0k/dmtxEfgooY+DfR5TKIz2TQFHrLy2FY?=
 =?us-ascii?Q?AwyGMuf4SQh00AZwmUy8YlCzgFqi6P9835SPYfibGs3mi1k/j3Wn9K+y+S/c?=
 =?us-ascii?Q?Oii6/DLvqnB8oYAZEfvxHMMfAhziiBZG5wSr7TYa/37Hu6J6+DC9yNx6FAO2?=
 =?us-ascii?Q?nOoQaRI291VBymLjRMXck90eX7znwzAa1Bytk80N4J4GFMW+OOOTgDedtCpj?=
 =?us-ascii?Q?1Tu6fk6qfGHglKi7OIbbapqEid7KzyOhAaedsDNJBtbeIwuOss/+25CDABtU?=
 =?us-ascii?Q?cMfDCfMb6c3l8A384VHqF1S0TzZYqR9dfjCXeY4i4syC1m9A3SMQ9VFs86Tm?=
 =?us-ascii?Q?abZQvTeOFelO3DRKcgnVExLTZMB42QBlp8N8GdoU8oyCNnT/uDwsWOSh85oY?=
 =?us-ascii?Q?4TFX39BTsq90fbXgcImGsTYUT4+oe95CYcxr7ayTKUN4LOjYj8ABIsa05TC6?=
 =?us-ascii?Q?hWQNcqACbWnDf7l9LxR347u1BAzaNc9Q6DkIooM2HWHRffjnT7LBgpGDZXx0?=
 =?us-ascii?Q?9hx/WJ0vSdHs9wYDc0Y6FI4WH1NNs59M5i0ybr6jY8OUJc3kmvryeR490kcH?=
 =?us-ascii?Q?Erj1v17y838kSXiXUwK9Rud7hLbxbrxgqXjYLyPGUqhPUkg31wfgahuyNYKx?=
 =?us-ascii?Q?2fmXYPtP6/j6VU5X7lW8m/FgfQz7EmJwuZIedwLdn76+KmAXQT1QZKymqdOX?=
 =?us-ascii?Q?lwo+RkB94xEDc0QzdKqS1i3xWdN2zWU6f9lAXO4bhZlrvvj/24/6VhubTHzI?=
 =?us-ascii?Q?KI0vabRp0hvTjzKfpowkqyjtposBF0UMPOm+9sn5ROVgyw0lsRXdT5G0kX81?=
 =?us-ascii?Q?cyzVTlVxIMGDSqYBxvJoX7IdmOvoHPGdcLV4Hg5ISybGIZ9Uv+1LGZQajd8w?=
 =?us-ascii?Q?9O6T2avFcwSV7E5BJv+JJIjN1TEpoENAcPidvy04pfLCHJyxrmGuNEEZMg1n?=
 =?us-ascii?Q?IYoL91zNBHSNMmQReZA5yAMgDUEF5jf9dM9bGmVLtFSvqmP4/x6jcxmfY2WA?=
 =?us-ascii?Q?2cLrYtp69a6htcaywwzDpvyv7OgXqBkOorRgY7C24aWJfK8LabnNaoSyU59c?=
 =?us-ascii?Q?70Q5g4VzXKX6mej3tDMEnI+UUDHCOLfxf5Ao6+vRSCODz3/ITv5EgfCAHndA?=
 =?us-ascii?Q?JOU+/XpOKoZ2YHzXVFm+J5t6UToAaIPVd49qUARihGqEGVvG3JyNS0AiGN+O?=
 =?us-ascii?Q?Jnw8ZCEnXWuP64LQwN3tgLd/NcIHhvpLvaR6TpsHJK8MbMMppx50WZJ5kqkb?=
 =?us-ascii?Q?/5RNOcG/Yir6b+HW23Aozr1elr1yyHIevjPiikrzN+pvrk/h7QjpJYe5pp01?=
 =?us-ascii?Q?jKodcID31+pJAODBXEi4kdB3ro9XmmIvsgOURjgW7lJylfAj/Q6u23gwmvIi?=
 =?us-ascii?Q?5jo66kl+d5oPPQHEKjAt3Z/WG/jDHboUqOK81YQ09e8qqmV2ePDfRwVrLP4K?=
 =?us-ascii?Q?NcS7R9nXL2nrRqHBiRY5qfF3w85vCothwf+vSK+y1AD3iJfKbfZ5vBCdejIM?=
 =?us-ascii?Q?f782sAkWOR40stfKVl3ahkKsKSFYXLKrlMVvkJXyHf7y+T/7lpueV9660YR5?=
 =?us-ascii?Q?poEU8VDYS08HUCjlGP2vR8D42rlvGM/5THAymo4o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2926429-b870-41a9-ffc5-08dd2952dfe2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 04:23:27.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWN9aazyJaDeGzICj+n7ZdL049piHAn470xthvKPjvo9PWi4LgM1HgioBPaMQkF3GIJI1o6u5ejr9f1xHstXMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=677371c6 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=TWq6ZYQzAAAA:8
 a=pQs5aej7AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=zjVYCA9Fq4_GLTuXGxEA:9 a=ELI009spOhp4_qEUuRHw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pm50XE-ebYsj0O27ELyUazX57cQXhgoY
X-Proofpoint-ORIG-GUID: pm50XE-ebYsj0O27ELyUazX57cQXhgoY
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114599

* Refresh patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-nss-fix-support-cross-compiling.patch   | 13 ++++++++-----
 ... 0002-nss-no-rpath-for-cross-compiling.patch} |  9 ++++++---
 ...0003-nss-fix-incorrect-shebang-of-perl.patch} |  9 ++++++---
 ...> 0004-nss-disable-Wvarargs-with-clang.patch} |  9 ++++++---
 ...uild-on-mips-with-clang-because-wrong-.patch} | 13 ++++++++-----
 ...-multilib-build-on-openSUSE-11.x-32bit.patch} | 13 +++++++------
 ...onfigure-option-to-disable-ARM-HW-cryp.patch} | 15 +++++++++------
 .../nss/{nss_3.103.bb => nss_3.107.bb}           | 16 ++++++++--------
 8 files changed, 58 insertions(+), 39 deletions(-)
 rename meta-oe/recipes-support/nss/nss/{nss-no-rpath-for-cross-compiling.patch => 0002-nss-no-rpath-for-cross-compiling.patch} (87%)
 rename meta-oe/recipes-support/nss/nss/{nss-fix-incorrect-shebang-of-perl.patch => 0003-nss-fix-incorrect-shebang-of-perl.patch} (97%)
 rename meta-oe/recipes-support/nss/nss/{disable-Wvarargs-with-clang.patch => 0004-nss-disable-Wvarargs-with-clang.patch} (92%)
 rename meta-oe/recipes-support/nss/nss/{pqg.c-ULL_addend.patch => 0005-nss-does-not-build-on-mips-with-clang-because-wrong-.patch} (83%)
 rename meta-oe/recipes-support/nss/nss/{nss-fix-nsinstall-build.patch => 0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch} (83%)
 rename meta-oe/recipes-support/nss/nss/{0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch => 0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch} (88%)
 rename meta-oe/recipes-support/nss/{nss_3.103.bb => nss_3.107.bb} (94%)

diff --git a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
index 2385fd3b9d..5733bb068f 100644
--- a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
@@ -1,21 +1,21 @@
-From 46ab1ca6e6fb8e1196e0665a54506dff370f8f2a Mon Sep 17 00:00:00 2001
+From c15470d6b52986a8e41f9be4579c88ed80413b44 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 22 Feb 2017 11:36:11 +0200
 Subject: [PATCH] nss: fix support cross compiling
 
 Let some make variables be assigned from outside makefile.
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  nss/coreconf/arch.mk    | 4 ++--
  nss/lib/freebl/Makefile | 6 ++++++
  2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
-index 17e9fae..bc4180a 100644
+index 711d19d..a163d24 100644
 --- a/nss/coreconf/arch.mk
 +++ b/nss/coreconf/arch.mk
 @@ -26,11 +26,11 @@ OS_ARCH := $(subst /,_,$(shell uname -s))
@@ -33,7 +33,7 @@ index 17e9fae..bc4180a 100644
  
  
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index eeee90a..7ee8736 100644
+index e744314..0ebfc92 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -36,6 +36,12 @@ ifdef USE_64
@@ -49,3 +49,6 @@ index eeee90a..7ee8736 100644
  ifdef USE_ABI32_FPU
  	DEFINES += -DNSS_USE_ABI32_FPU
  endif
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0002-nss-no-rpath-for-cross-compiling.patch
similarity index 87%
rename from meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
rename to meta-oe/recipes-support/nss/nss/0002-nss-no-rpath-for-cross-compiling.patch
index 8c715cc447..19fa5a7261 100644
--- a/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/0002-nss-no-rpath-for-cross-compiling.patch
@@ -1,11 +1,11 @@
-From 73edfbdf33fe4e41724e7e947033d8caeec8f3d0 Mon Sep 17 00:00:00 2001
+From 621023bc696d3d26a4179dbbafb42d79bef1faf9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] nss:no rpath for cross compiling
 
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [oe specific]
 
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  nss/cmd/platlibs.mk | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -26,3 +26,6 @@ index 6401778..e5c4e16 100644
  endif
  endif
  
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch b/meta-oe/recipes-support/nss/nss/0003-nss-fix-incorrect-shebang-of-perl.patch
similarity index 97%
rename from meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
rename to meta-oe/recipes-support/nss/nss/0003-nss-fix-incorrect-shebang-of-perl.patch
index 735b06b5ca..61b7565739 100644
--- a/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
+++ b/meta-oe/recipes-support/nss/nss/0003-nss-fix-incorrect-shebang-of-perl.patch
@@ -1,14 +1,14 @@
-From 2ce67b1f4b1f582d556ae058da10698bbaa0edc1 Mon Sep 17 00:00:00 2001
+From 6aec640342088498cb1b0a2e395eb3da297a48b4 Mon Sep 17 00:00:00 2001
 From: Ovidiu Panait <ovidiu.panait@windriver.com>
 Date: Mon, 13 Jul 2020 12:12:31 +0300
 Subject: [PATCH] nss: fix incorrect shebang of perl
 
 Replace incorrect shebang of perl with `#!/usr/bin/env perl'.
 
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Upstream-Status: Pending
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
  nss/cmd/signver/examples/1/form.pl       | 2 +-
  nss/cmd/signver/examples/1/signedForm.pl | 2 +-
@@ -89,3 +89,6 @@ index f29f60a..850332a 100755
  
  ########################################################################
  #
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch b/meta-oe/recipes-support/nss/nss/0004-nss-disable-Wvarargs-with-clang.patch
similarity index 92%
rename from meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
rename to meta-oe/recipes-support/nss/nss/0004-nss-disable-Wvarargs-with-clang.patch
index 4c9bea30c0..fa4c5bacbf 100644
--- a/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
+++ b/meta-oe/recipes-support/nss/nss/0004-nss-disable-Wvarargs-with-clang.patch
@@ -1,7 +1,7 @@
-From f613c9a9107435a40d91329f33f12cfb16927f07 Mon Sep 17 00:00:00 2001
+From 72c3150300975524bb0001b5a731f077852c95ab Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
-Subject: [PATCH] nss,nspr: Add recipes
+Subject: [PATCH] nss: disable Wvarargs with clang
 
 clang 3.9 add this warning to rightly flag undefined
 behavior, we relegate this to be just a warning instead
@@ -20,9 +20,9 @@ see
 https://www.securecoding.cert.org/confluence/display/cplusplus/EXP58-CPP.+Pass+an+object+of+the+correct+type+to+va_start
 for more details
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  nss/coreconf/Werror.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -40,3 +40,6 @@ index a569a49..687fe58 100644
        # -Wno-parentheses-equality : because clang warns about macro expansions
        WARNING_CFLAGS += $(call disable_warning,parentheses-equality)
        ifdef BUILD_OPT
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta-oe/recipes-support/nss/nss/0005-nss-does-not-build-on-mips-with-clang-because-wrong-.patch
similarity index 83%
rename from meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
rename to meta-oe/recipes-support/nss/nss/0005-nss-does-not-build-on-mips-with-clang-because-wrong-.patch
index 589b4d5e7f..f12a278ef2 100644
--- a/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
+++ b/meta-oe/recipes-support/nss/nss/0005-nss-does-not-build-on-mips-with-clang-because-wrong-.patch
@@ -1,22 +1,22 @@
-From cbd367160338847b28fc801a12c74f1c8b5b03ee Mon Sep 17 00:00:00 2001
+From 5935755eef43ac7cb8f4567e7bed5892180f954c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
-Subject: [PATCH] nss does not build on mips with clang because wrong types are
- used?
+Subject: [PATCH] nss: does not build on mips with clang because wrong types
+ are used
 
 pqg.c:339:16: error: comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      if (addend < MP_DIGIT_MAX) {
        ~~~~~~ ^ ~~~~~~~~~~~~
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  nss/lib/freebl/pqg.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/nss/lib/freebl/pqg.c b/nss/lib/freebl/pqg.c
-index 1b03278..ad895b7 100644
+index 62d46b5..8c8665d 100644
 --- a/nss/lib/freebl/pqg.c
 +++ b/nss/lib/freebl/pqg.c
 @@ -326,8 +326,8 @@ generate_h_candidate(SECItem *hit, mp_int *H)
@@ -30,3 +30,6 @@ index 1b03278..ad895b7 100644
            SECItem *seedout)
  {
      mp_int s, sum, modulus, tmp;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta-oe/recipes-support/nss/nss/0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch
similarity index 83%
rename from meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
rename to meta-oe/recipes-support/nss/nss/0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch
index a1897f88d8..afe11821af 100644
--- a/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
+++ b/meta-oe/recipes-support/nss/nss/0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch
@@ -1,4 +1,4 @@
-From f9b2b1c738576a17460aebd005f511f427aa1974 Mon Sep 17 00:00:00 2001
+From 895e76e75dbb993a8f445072c190a9db4ee50d15 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] Fix nss multilib build on openSUSE 11.x 32bit
@@ -15,17 +15,15 @@ on host to install built files, it doesn't need any cross-compling or
 multilib build options. Just clean the ARCHFLAG and LDFLAGS to fix this
 error.
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-===================================================
-
 ---
  nss/coreconf/nsinstall/Makefile | 7 +++++++
  1 file changed, 7 insertions(+)
 
 diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
-index 08dfbc2..e97fb5f 100644
+index 337cbeb..dd77fbe 100644
 --- a/nss/coreconf/nsinstall/Makefile
 +++ b/nss/coreconf/nsinstall/Makefile
 @@ -18,6 +18,13 @@ INTERNAL_TOOLS  = 1
@@ -39,6 +37,9 @@ index 08dfbc2..e97fb5f 100644
 +LDFLAGS =
 +# CFLAGS =
 +
- ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
+ ifeq (,$(filter-out WIN%,$(OS_TARGET)))
  PROGRAM		=
  TARGETS		=
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
similarity index 88%
rename from meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
rename to meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index b7f1b01a14..5debd13488 100644
--- a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -1,4 +1,4 @@
-From 7c8f367faf8848a43a414079189e10270d6c0fcc Mon Sep 17 00:00:00 2001
+From 781a21fa9b0d8d8d6df0de45e3c9dc3f3e74be8f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 18 Dec 2019 12:29:50 +0100
 Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
@@ -7,15 +7,15 @@ Not all current hardware supports it, particularly anything
 prior to armv8 does not.
 
 Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  nss/lib/freebl/Makefile | 3 +++
  nss/lib/freebl/gcm.c    | 2 ++
  2 files changed, 5 insertions(+)
 
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 7ee8736..f9b4925 100644
+index 0ebfc92..3ee7623 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -142,6 +142,8 @@ endif
@@ -33,10 +33,10 @@ index 7ee8736..f9b4925 100644
  endif
 +endif
  
- ifeq (OS2,$(OS_TARGET))
-     ASFILES  = mpi_x86_os2.s
+ ifeq (,$(filter-out WINNT,$(OS_TARGET)))
+ ifndef USE_64
 diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index 2dae724..9ee7fc8 100644
+index d728867..8b4de1d 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
 @@ -18,6 +18,7 @@
@@ -55,3 +55,6 @@ index 2dae724..9ee7fc8 100644
  
  /* Forward declarations */
  SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss_3.103.bb b/meta-oe/recipes-support/nss/nss_3.107.bb
similarity index 94%
rename from meta-oe/recipes-support/nss/nss_3.103.bb
rename to meta-oe/recipes-support/nss/nss_3.107.bb
index 64141e9383..23e046b0a9 100644
--- a/meta-oe/recipes-support/nss/nss_3.103.bb
+++ b/meta-oe/recipes-support/nss/nss_3.107.bb
@@ -22,18 +22,18 @@ VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '
 
 SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
            file://nss.pc.in \
-           file://0001-nss-fix-support-cross-compiling.patch \
-           file://nss-no-rpath-for-cross-compiling.patch \
-           file://nss-fix-incorrect-shebang-of-perl.patch \
-           file://disable-Wvarargs-with-clang.patch \
-           file://pqg.c-ULL_addend.patch \
            file://blank-cert9.db \
            file://blank-key4.db \
            file://system-pkcs11.txt \
-           file://nss-fix-nsinstall-build.patch \
-           file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           file://0001-nss-fix-support-cross-compiling.patch \
+           file://0002-nss-no-rpath-for-cross-compiling.patch \
+           file://0003-nss-fix-incorrect-shebang-of-perl.patch \
+           file://0004-nss-disable-Wvarargs-with-clang.patch \
+           file://0005-nss-does-not-build-on-mips-with-clang-because-wrong-.patch  \
+           file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
+           file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "7b4ab657f772dc7520c46e8d481940b292dcfc6a4c90150a7c26672384cee962"
+SRC_URI[sha256sum] = "7f7e96473e38150771a615f5d40e8c41ba3a19385301ae0c525091f2fc9d6729"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.25.1


