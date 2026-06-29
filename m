Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1727DC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 17:08:06 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37550.1782739782107094572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=DRndfqw1;
 spf=pass (domain: axis.com, ip: 40.107.130.64, mailfrom: adam.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkgsQ2/ny3jy3VNjEkc/zdysfZAAo83WJYeBMUfnaJ/Q7wjFfyMMBSAJ3hYzQCxZfDGD4zfGFafkPZxoYsb1NQw0y2p2w9k8vv9E8y4bR4LdlTeylH0qzSr6TgnETUph7sVt1/LPk+Uz+z8z8pnRsLBYVl916dq+aG7pIeLajdjfGnkfWKiBGx2tLVJzTNit+q3fc9Xij7bLn/aaPVsnmoSyT8UQfqTMX8HW9ywGUr/QBmWzmJI87TJ2ANBFeJxW2O9yBR6L9BonIDNEpEiPor2Q+tlAxSPetWiF8IqovR60XYBD0Di09R/gijWkTX8dhypLYI6f39gnf9sW90MSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1KYLuz6rsHjFPM4V0yFIQv86fT48WBTkxeqTKIUjTI=;
 b=lhFAMa6f96VHiKwK5mBBNRbgr3jUtuJIdyL9jMaB9lcEESj08U4OaVj7Rd6YumbdXaOBZ4AFCvfo8uZAHvm2LG1IgxOniAt810d/HDFK5dcuBIisZA4n90Zxq4aFbMd5OeDdfzqLKPTlocdx00RjRB1CC6wLv+8uGsmqptRRJSRb2jZNlRlL76dkSNHiFB0uldlNO3TmcjHX6aK3RQtlLmzL5LJC0hcq/LiS8NVlt/EkxETajr84seZ+WACPXnVaBF7dDE2v/ADHj/HZ7kGg+z9AjSrt7lUVgE0B/e6Z7R12Y1GasR9ZpjF3h7Uj2X1RUm422kmjDLMygZN1ZJHVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1KYLuz6rsHjFPM4V0yFIQv86fT48WBTkxeqTKIUjTI=;
 b=DRndfqw1Wp1H5uguiI+UdvbTMCczx9L2pPD9BZJkFcWlEZqVhAEU//WnyWmo4Ckmm9CgrlFyEXULd6RA/ahqlvm1jTGYmrUbSCsDiWeVU6seNRvMK6tK+v6UCFaShpTdwzt1uCi+EewzuQDrPGY15p4q8ZG9EDDJwUsD2rpoO2M=
Received: from DU2PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:10:3b::15)
 by DU2PR02MB10111.eurprd02.prod.outlook.com (2603:10a6:10:493::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 13:29:36 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::3) by DU2PR04CA0010.outlook.office365.com
 (2603:10a6:10:3b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 13:29:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 13:29:36 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Mon, 29 Jun
 2026 15:29:36 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 29 Jun
 2026 15:29:36 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 29 Jun 2026 15:29:36 +0200
Received: from pc51388-2240.se.axis.com (pc51388-2240.se.axis.com [10.86.130.217])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id EFB27B0B;
	Mon, 29 Jun 2026 15:29:35 +0200 (CEST)
Received: by pc51388-2240.se.axis.com (Postfix, from userid 11596)
	id EC4A0608544F; Mon, 29 Jun 2026 15:29:35 +0200 (CEST)
From: "Adam Nilsson" <Adam.X.Nilsson@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Adam x Nilsson <Adam.X.Nilsson@axis.com>
Subject: [meta-oe][PATCH 1/2] lvgl: Update to 9.5.0
Date: Mon, 29 Jun 2026 15:28:44 +0200
Message-ID: <20260629132844.2894190-3-Adam.X.Nilsson@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B91:EE_|DU2PR02MB10111:EE_
X-MS-Office365-Filtering-Correlation-Id: 73223593-1fea-4a0b-193c-08ded5e276c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|18002099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	iE2ZcqbZxlbm18wnlzZ7jljhCIKveqDr8WLxzx3BXGnzdChAVj5l13cH0lA0WkrwZiHMPkuImaTMbwGGNtYLPAVzI22KwrpWiqWVEMlIpwN5GKCSysLLvodK57GNl7nx+GGfK6lIS4RpiQhsoJirgJLuXOG0CHf0FwKE98mUbVu7Io6tUQVtp0X0tgGCHVKF0hj6OL/mTeFC2Azxqp6IP/B+HPL2Qb7Dq+SBhS3tAzLpRuUfyTjh0mOJJe3o7E7/+5UR9ror5wFVcnRFfcymBPhXT/YTAHWu4Akmft90Re3SD65xgemTxLbYKqUnA9h/DzcV3Vb0Lc98AoIHGYHuBQKek9b3RgRfXiFfdz7LfkV3wXddl3XTxCIjvInlr66mCsxNmQUb8hA2FtsnBv78GSPOeGMAS+7ZnDY4x/HxGHoxl/5sWWb50neak0pc6Pky8OiD4BaaFkiR3gtjxZUDhntAWwZ7iBcJMMJUQVvxL0EmX/CgunxhgYs0xcxOJV4D8O/0Y4HC8o4CWMOxW8KwJnRs5Sqls9LlYJLtbdQh+If6lHlVx7UKPod9tbHaEJn3igrg2PdxTQ7VgpuG7/0W9dYA7xDndD+j1Eb98VOSmKa7OL5ELP5bGi2hdEVJNlsq2RBxhX+wTvwX1v//jyuziw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(18002099003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1REMhukolpp5L6Qgxl4yBSaTuXr2rU1X8SapIM76kb5H6SA/bU2c5/6gh59OGL7178YZium6buce/1eA+wwpPjyho0m4MORVt3emH6tTVlXjRom3O6cYjrUUfj0mamEyx7wE5z0UTJCAiAxe90TQRoxM7rMfcFKDw7ouEgC+d0SdTE36OQDHIRJZENYr2BGUsUiGI890QKGknWRPXMgFRbWWtQt1Qwr1Q068xJEgtz6d6Ol8sy9P+Jxsat5CxkdIsgjDdWNncW+pnv0OGTcBE6UG6U32B0yow5ln4wfOnDtIsIwAjNguFuXfSVXUXVo6RIlpGWwfREcpEZi1fAhfpfU/0dszQkHWvYqiIeE/0QsBnCgr9ZP7wlwDdWyLYvTczav08Vnk4LeoCoLg9i10VDwVn+5/gMqkfyGzIqLWF9LluE+KkftX/YFLHCmfWjCC
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:29:36.4919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73223593-1fea-4a0b-193c-08ded5e276c9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10111
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jun 2026 17:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127940

From: Adam x Nilsson <Adam.X.Nilsson@axis.com>

Signed-off-by: Adam Nilsson <Adam.X.Nilsson@axis.com>
---
 .../recipes-graphics/lvgl/{lvgl_9.4.0.bb =3D> lvgl_9.5.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/lvgl/{lvgl_9.4.0.bb =3D> lvgl_9.5.0.bb} (8=
7%)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.4.0.bb b/meta-oe/recipes-=
graphics/lvgl/lvgl_9.5.0.bb
similarity index 87%
rename from meta-oe/recipes-graphics/lvgl/lvgl_9.4.0.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl_9.5.0.bb
index 04ee34a61f..18a5b5de51 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.4.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.5.0.bb
@@ -9,9 +9,9 @@ HOMEPAGE =3D "https://lvgl.io/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3D4570b6241b4fced1d1d18eb691a=
0e083"

-SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/=
v9.4;tag=3Dv9.4.0"
+SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/=
v9.5;tag=3Dv9.5.0"

-SRCREV =3D "c016f72d4c125098287be5e83c0f1abed4706ee5"
+SRCREV =3D "85aa60d18b3d5e5588d7b247abf90198f07c8a63"

 inherit cmake


