Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3923CCF9EB
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:18:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.30])
 by mx.groups.io with SMTP id smtpd.web10.693.1761362302956867611
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UO2DYHiy;
 spf=pass (domain: axis.com, ip: 52.101.65.30, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpuvXFrp/qh/sffwmy0AFWii0DLMJCT4pmYL41MM906ca/fbktrsCxg+1pCYdjTuZ1SPZ4qBt0sUpfqiCTIZWaRhd45TYOYukdMjWlRpnnbnDIZBObuP7x8ehjBZUEfDwXzJO1SoD+JPQGrQllW14VLTvnMq+hCt0uOoYDXFTB/oQeZ/BONKtBGdtj3tPZR1P79TE4oypcOCZX5mVK1xS7NGEOSm8WDQimrDhN1UzlISJFnjKmhBatwdxnQ/ELemTv/3nSi1MdOu/KXr7usqtfrcyyTrMAlSYG8Pxy6j0VubE9oNjZnqdymr2ZNO4LELl5WfbVE8wGEn+tklmb5AqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIvrqfBAy3sb4mwGKqMm7ZG2MO0aWp2Kw9jxAkL50xE=;
 b=AJ9QZLpgHRHjIfwCqbc1waO0LImym/ngosTH3WjirxxgINwtw32TK+f4cA7sRLfoddcTquswaRfF35NI7Aaq4qAVLEVj0GO80RofmNylEaQwzKJJsifl6b4ZU2Hvm+ru67q9BV0v02w2pS7lEmu6x9wl2VxDiJc4w7QHQ76v70Dj4o3+BsdsQKdwMbAaOrpe/ymGyFRLBdKkrio4n1soLqiqvmcFoiMjsTIQUdGAQ7XZjicoDrVVVhSRw9J1cHsrN+2YeNnRldOtfOv6BLxEKCk9Pz9vcQ7YT3w22gfJYuHl+3L0OkgBDbzPb07752v1DvJgfyiR2OxYX2twikNyIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIvrqfBAy3sb4mwGKqMm7ZG2MO0aWp2Kw9jxAkL50xE=;
 b=UO2DYHiy9gkN4NfGjmcAIQc+clp2kJkN3QV8hRGAqgoI7fcHYdr7W0kv7i9UKssI2CyrU4+jpTwKm0cETzZDbyOPJiIrljhMrhEKCJVCMwTjLH/w/Twc0wR8aVYii4eV+WZtRZXFz4+nd9wOgIeSQWNo4mLU3YaDJJJ2l8wdBb0=
Received: from DU7P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::18)
 by DB9PR02MB11157.eurprd02.prod.outlook.com (2603:10a6:10:5c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 03:18:16 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::c0) by DU7P251CA0012.outlook.office365.com
 (2603:10a6:10:551::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Sat,
 25 Oct 2025 03:18:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9253.7 via Frontend Transport; Sat, 25 Oct 2025 03:18:16 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Sat, 25 Oct 2025 05:18:13 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 41B832E8B
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:18:13 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 05931122055; Sat, 25 Oct 2025 05:18:12 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 9/9] lvgl: Disable building demos and examples
Date: Sat, 25 Oct 2025 05:17:48 +0200
Message-ID: <20251025031748.2728416-9-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025031748.2728416-1-pkj@axis.com>
References: <20251025031748.2728416-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|DB9PR02MB11157:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b9b7fa-c090-4d8d-44ed-08de137523cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2oSSGIl5UqQiPSUF5g3QRCesCQRQtaKMul0MFTkZmKykDL6+YoPquEsQiHGO?=
 =?us-ascii?Q?9X+6gL4FwIBhjNzBps9K4LHrO3WhyaHCErG6EWdyTL9X80EKxPMajRdzRHlE?=
 =?us-ascii?Q?iDe3b7vx4rsQ4vuI6/cgjEG7X9sTYr6JEfG9z0IhTRDWKv8FIt+eeYovK5sz?=
 =?us-ascii?Q?0yWNyxMxqK/pQ8M3vZ2nz3ntgqk1VukvsWXxSwZ/wD41nglbIAyQhsDQkCdw?=
 =?us-ascii?Q?Au8lGaBAD7sAYj90Ozv1vs7Yjxl4ssl2jP5L6sqp/9ISGuY7yW21MjDoyS3z?=
 =?us-ascii?Q?Nt5WLRHFMDSebzGej3poSV4EVLS0w+40OA67V3Jprd0j7KwJGgbPNKUKyUiA?=
 =?us-ascii?Q?+G527xT8wYe4glJRqT6NPgoDMgQdV5QGuNwUaiMILWLd+qYuXcLfrpl0fFWf?=
 =?us-ascii?Q?4LQt6jkKZLzkwMOI7Zn80mMEWTKLJrTqtf1wbrANjHCnvTqGK7NUOruRnO3J?=
 =?us-ascii?Q?LIcULcR5uJkAz+HUFZ45e88QpUf4LgY77GfVWfYi1yUqzOkrNLIecdkMk9Sv?=
 =?us-ascii?Q?x7phHGIIQXLr2n9rwf69GDLpmy/Iu+e97k7SDl8V7MV+uFfM3CyeSpES+QdC?=
 =?us-ascii?Q?6z8K+faMeB22LZyOvLTbdUuD+3K3q7QwnOdG586yLZotouNxVMH7yMhrFrnm?=
 =?us-ascii?Q?lrkVi1pLsToM85wvAi2cIyM4WSZHz9Q7m1MtL6nKTkK8NnzUiMpmi3xZiYuD?=
 =?us-ascii?Q?IbT0g5bYo2PgjS3/wb2cv8yznsz0pGuW8uGy4Q/VAjgnaLBnNOt9iagg8pjL?=
 =?us-ascii?Q?BcEX39iynqWOddI87dhvj8cH6MLr2PuIgRh0ho3uHOItk4R2YM2xhqIuCRfq?=
 =?us-ascii?Q?WzoVtf8tTWsGRsavLwr370wBXroA9pyy/53hrh0eqs/rrtPaEIHoP4o/xaY/?=
 =?us-ascii?Q?gJB8O6JvdAqWiwmitKVYTGO3NyCH3Uvhig/los3yrIaA30HR1Hmsn+ZWTxn9?=
 =?us-ascii?Q?Vb80fLcaaWnVvYfm+RWFe8QLHRqf3tXNVmK3bIEQBilgjoCA1tnxXmzYWC5y?=
 =?us-ascii?Q?GRAPCsPF+n6jeIXwXVLrQKxxZ0baapUCVESuS/SizP8bx7jeNMBA5WJtz3WN?=
 =?us-ascii?Q?s+4TXYLd9hxJX70/hhRUaOf4B6ujiD3uuPMRrKAsyPlKAPbUrrGsBjPXtEtX?=
 =?us-ascii?Q?9cNfWLxivcaOCqFSmZw19scg6bo6J2dU3u14kyO+xd+aAwKhFBsO4BMdx963?=
 =?us-ascii?Q?v5tdPCrdlXRiyq5c9BpZhz5QzksCkgA0WHWOmx4pS22OtXfpMJSIPYMCeYed?=
 =?us-ascii?Q?xa4+BMZOtuBJvH7PbG17Mr7qHo0lxAFlL46LpUMueCTTGEXjl7eOA9Fni+aO?=
 =?us-ascii?Q?7e1b6OtZjRYC3y6LFRq9E7s85seV7ceyDmvAp8HhEPgcpZs2/WxBuh2NoK8W?=
 =?us-ascii?Q?mNAk22JZDpGfZ9T63kiIedqCHcvov42p0X641jJaYCP3pqwxASAMft+urYUg?=
 =?us-ascii?Q?Smp9N09Ky65WO0yBY+8nz+d4YEDJKgCvxhj3YgMF0KAYMX6V0honowLmzyDs?=
 =?us-ascii?Q?8pwZhQLSuJ0E4v2lN5URfXNXvxEWl1FbOMnLy55TJIOJuEQcGa6XUne2lIVl?=
 =?us-ascii?Q?cj2h6GG3Iyhac0WgtoA=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:18:16.5557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b9b7fa-c090-4d8d-44ed-08de137523cf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB11157
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120984

There are no reasons to build the demos and examples for the dynamic
lvgl library.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-graphics/lvgl/files/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/files/defconfig b/meta-oe/recipe=
s-graphics/lvgl/files/defconfig
index 1f42f11f7a..088b2369e9 100644
--- a/meta-oe/recipes-graphics/lvgl/files/defconfig
+++ b/meta-oe/recipes-graphics/lvgl/files/defconfig
@@ -1 +1,3 @@
 CONFIG_LV_COLOR_DEPTH_32=3Dy
+# CONFIG_LV_BUILD_EXAMPLES is not set
+# CONFIG_LV_BUILD_DEMOS is not set

