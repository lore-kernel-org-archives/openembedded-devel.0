Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0DDC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:10:47 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.48])
 by mx.groups.io with SMTP id smtpd.web11.58360.1723119042260531035
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=m/PkxIuW;
 spf=pass (domain: axis.com, ip: 52.101.67.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk/Twny9+E7wd1zz17fHdDlH41DAQO/efpsnw+9LYs4wnxJ6bBBpB2//KzTyCtAEvokHa9khpaXeaXar1nlzNoQ34noo9Dl7iH9PWJMZasLOgKps0ltuUcsk2EU5krZN6MVS4SLm4v7A8awo4JUoYGhC2JTb92fZ0vun0mqJ84AUZENsPl7tZA5eX7RA+z1lD2yvxCfHPnojBrqb4Ky8L86KG5L/b1B5xYckqgLw9mnqf8hn8Wzloct9RjdoSO6w5kuOU71ohlnOwX8MYxPBEUyTpA0+1EdvE1BEd7TPRWvlkm+yi1a5G62sYPn3HVtrsIN4U4cIEhO/exalNDkBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOqjWHGEE50Rpo82vNsoTVD2nXsvcUHho6KzrDx7LvQ=;
 b=FlyukSfci2KXn94kKEMmOZgfPLNTEW1NsDLTXjjNViBSXZ7M9fyv2aMZs+hYMVBt/L+1NO0hUBx7Wxrl8nOrz9TCE5GDhtsllL/cGVvULyzyv0/hUnlxZW6gJywTJHFNE4Lwg/CYpo9JOeVOiRNjcKsFD5VgHJdhDDuLRPj0cn11SmAro/XIOilXtMzPIyiQ/xrkx0oV8BbXbmDN0Kg7ippn0XkjKLAAvLofJYWV3XrFavJbHaUMRRYhSB9rL0Yq92Gr826qgyGHg3vRZL38/cqPMz8soW7GjVldxQwmprACNZhd2i2jdKxncXppSdyzMd6x6+2YnyotFXPx92MKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOqjWHGEE50Rpo82vNsoTVD2nXsvcUHho6KzrDx7LvQ=;
 b=m/PkxIuWIQhIXFueeHsPgQp2SWxSV5r86tnvZwAk/h9r5SivWNXaevKmg7rz6QGimg283M/zuxmOkt+AYxbupnCOarlGKnuCMvRq1hdD9hf9RvgvnVaIrz0R+Wel9iE5JocxxvjcqsY/J/82+QxY4ykG9RqMl0HloKRW+1XhTn0=
Received: from DU6P191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::29)
 by PAVPR02MB9064.eurprd02.prod.outlook.com (2603:10a6:102:321::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 12:10:34 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::77) by DU6P191CA0058.outlook.office365.com
 (2603:10a6:10:53e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14 via Frontend
 Transport; Thu, 8 Aug 2024 12:10:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 12:10:32 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 14:10:31 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 Aug 2024 14:10:31 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6E7CD280
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Aug 2024 14:10:31 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 478CAVp03763901
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Aug 2024 14:10:31 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 478CAUEL3763898
	for openembedded-devel@lists.openembedded.org; Thu, 8 Aug 2024 14:10:30 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libdevmapper: Inherit nopackages
Date: Thu, 8 Aug 2024 14:10:28 +0200
Message-ID: <20240808121028.3763882-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|PAVPR02MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe2b3a2-809d-4964-9149-08dcb7a319da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ErGZOle46zJFz3R2aE9feE39nkJGX9kLmJqZSnR2eJTybwgi+y63iSsizgqH?=
 =?us-ascii?Q?X7RNEePD9DhCIFhdiCmj9H3TBqVZFSfz3WeFH/Wu0GrLgJfx114jytv7VgHu?=
 =?us-ascii?Q?2A5u4nZZd8y4JNgHrIKWZFYrnzLsgD4SzO25mPnYj1DNPX6qBOnVCZmvhZyB?=
 =?us-ascii?Q?5mz1nZFIQ+NohfJJ1QrWxvN6NGSf653oBY55sbwzopSzVCdtJzkxUhaWTVzi?=
 =?us-ascii?Q?AUc4/Dxqg7s2AEdkTML6s8OIG8YXJFrrllOT2BcyVK/BY5Ry+2L7KTJ6Udgc?=
 =?us-ascii?Q?Uv4QSjXHSDY4mARc124lXgEax5fpqdS9uFj1XEC5ykB3HY/5QfOPSDuGD29m?=
 =?us-ascii?Q?irismSBRwZUikYSJn/bJan8/ilqZbtJ9N+IKW/psWSUnc1TGZ8VRoWb2JFP+?=
 =?us-ascii?Q?eh58mz1K4sQOuYWJPoJT+hCGAAp6q8xf0J2No0m3Fh8fSgnTuR1LS7jcMuTp?=
 =?us-ascii?Q?B28s8FnwkSWKXrMKajFAjGB8lmX0FnlFXx6XlYH+0xLM1DomEGDzjY9qrgzs?=
 =?us-ascii?Q?1QFe1kV3GAT/ZkJkCsrQsus2a/KBzcdvnoc7+gR43coB3UaDWU1OlROQcmr2?=
 =?us-ascii?Q?UtH9q/5CMHG4RJ+9oNBjYKwcLfIn/dNrsbmM2gjwkF6aq9SU2dPAz9mef9jh?=
 =?us-ascii?Q?m/r1idp8XpZE/4SWvj9WpCbIZ/rukJ9ybj/3GK9fOw4PAMz1o1HfEuwoQ2Rw?=
 =?us-ascii?Q?zPO4OXiUkwvVK1Ioia2ROsO8hVfLRKKXqAIOUTyDZFgC3XwP5SG8KxeVHb/o?=
 =?us-ascii?Q?IgL7BYpJuIAi9ASrpKtW+lgpFMKJkj+cgeioBrI6jZEr7Uxxxr62GfNOfIG1?=
 =?us-ascii?Q?WYtFegv5vS/QPb5BAhgllpQ/krrgiBTw2whhoP2q45WQZSF8kBWQim/K8uP/?=
 =?us-ascii?Q?9FDOQhtakX24X7IoS/nXX6foHyLQzttwdwLXE6YBKc+HvIrAlyHrnALll7Bs?=
 =?us-ascii?Q?3JRUaIyjxa3unN2bouwRWxJgcfOZe2mcMiJIATbOqwJG0ItTkBqwgkVjlnMQ?=
 =?us-ascii?Q?DpZyroOfCmv65CsdNYbKm1a3MvVjmbhWDax1v9A9JOEWDFeycA2PcF4cY5hT?=
 =?us-ascii?Q?WgI+BDa5f71UHGqSQoP/CFe+YprI/EurNba02vD704GI3NufEZ7NG+d6ZE4B?=
 =?us-ascii?Q?ZeERW+x0ydw5/GSSl1+SdCuUKWhp765kOdG4TZDHB3GCWoO2s30HWybTowVx?=
 =?us-ascii?Q?rgYjC1J/KnHKHdeuLKrVRwpOb1fPjqeV2BEt0Pb16N6ZutcB5HrUdz9iltzV?=
 =?us-ascii?Q?/V25UGZEuPPG0JUMy4IbstUpGsXryDPEcmadp7Es8TueDquNutGLjBE2orL2?=
 =?us-ascii?Q?XiC73uhPhdEW9Ksf3Y3fqZdcCnzl0ZqqXWpIorZ5Fo0IVxseDCPHjIZxS1ex?=
 =?us-ascii?Q?757nYaqVtbDeJl+9d1xS0iZyC8RNeBFfJ0LIml8MedVIE1R3TZy8dHQqz5YX?=
 =?us-ascii?Q?euEG3Oh5surwj9pk6gKBxsgG6V1Pr+6q?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 12:10:32.0293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe2b3a2-809d-4964-9149-08dcb7a319da
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 12:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111653

This fixes errors from buildhistory changes where packages-split would
be empty.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/libdevmapper.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper.bb b/meta-oe/recipes=
-support/lvm2/libdevmapper.bb
index be558ce1d..3b4439c3a 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper.bb
@@ -5,6 +5,8 @@ require lvm2.inc
=20
 DEPENDS +=3D "autoconf-archive-native"
=20
+inherit nopackages
+
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
 do_install() {

