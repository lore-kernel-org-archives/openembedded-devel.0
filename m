Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CCECCF9F0
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:18:23 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.35])
 by mx.groups.io with SMTP id smtpd.web11.732.1761362300055470589
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=dq49yExj;
 spf=pass (domain: axis.com, ip: 52.101.83.35, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0Q2oWNpp2CNbSRNcfbeikUHeMkO2w+H6l6CzIEWNBIvEsHTaNIE4zZJqljlfC6OSPD+ffUAUmVr1GWDeA+GgzwwnQl04f/x08Wyr9280F7teOzHjSLSc/NH5TpZ4ZRIlb/ySc6hCrRuWz9KA2Jq3eeoUNeuGBNF2C8N5m9omQFRwSfqqEnajsBH4QHSxWYjFMtnO6KadPZKx6MqdaE2E5D35b9t0gK+JZLkkYaH6ouL6fDC/l9lNmRngO+WFTs7iqYTSZZcXTJOivbVaTCdhMegUNKMn924RvQ/QOkUNgXDLTx9JyXXNseZHcIl7O5Rb3y3Qkspvh9+gw7nS1D4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt8lJLrRfl34U2/tKh6odG6sv0Dnp/QAo7hed23in7k=;
 b=J+Y8FWMQI2KMD7MepsWRRjmtyOJXP15Qd0Ws5NgBkukNYrbBDcVCOr+GtwidPtPIuY3UKNkW3Mel8NkKraaHv/U9OxvDVy+jgbtbuUngRCdwY2ApWHd51PlGw+V2dRN4jyW4M95ChitTBSQGF3IxEBkhAZKVp9dPhpAGP3LwhjbUBo2T0+lfvMgr7SdV0p1L88pKvtI0bU5qZOGPz7pLYhbqUBjxReB0gWxqy2p3t9QkL+cxYz7JDHPAuFUAWZhCxq62EIZSK8s+Vmn4da2qtGJoJHpQ3wYiqQenaIUB0j0YzzfDq4L/CRumRbvRVTVxsQPSKkZHkWaViILnUsdpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt8lJLrRfl34U2/tKh6odG6sv0Dnp/QAo7hed23in7k=;
 b=dq49yExjmheunh5JuZlUhcaTFKxAcyojIGdcecJNQzK5TpRw7R/x6z7YjomjkgQpi4GktUmfrMKsc9xom9zwIBkXVNz9XQgMBzORn51JHjyTHDn65+bBRxpu3NRyXMAncMSeRG2YcdAGkz54dCyFnrCHGW6jv7qJEpgFGPcRzAI=
Received: from DUZPR01CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::15) by DBBPR02MB10750.eurprd02.prod.outlook.com
 (2603:10a6:10:532::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 03:18:15 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::45) by DUZPR01CA0077.outlook.office365.com
 (2603:10a6:10:46a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Sat,
 25 Oct 2025 03:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9253.7 via Frontend Transport; Sat, 25 Oct 2025 03:18:15 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Sat, 25 Oct 2025 05:18:13 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 34D8F2E6D
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:18:13 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id EBFB21200DD; Sat, 25 Oct 2025 05:18:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 6/9] lvgl-demo-fb: Use Kconfig to configure
Date: Sat, 25 Oct 2025 05:17:45 +0200
Message-ID: <20251025031748.2728416-6-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025031748.2728416-1-pkj@axis.com>
References: <20251025031748.2728416-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|DBBPR02MB10750:EE_
X-MS-Office365-Filtering-Correlation-Id: b46969d0-0f6a-4e2c-2932-08de13752323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qnys08Sz6KlahrQ/dYdJKg3JtZFtX2r2Eo96FpHtITGYR+7KwtlFnH/8RxwN?=
 =?us-ascii?Q?cTAdmZg9YlWr3zfdiJbhTgNjcH+0B+DuJ83n05RHCP12MyFqjaBBphvhb1DZ?=
 =?us-ascii?Q?xy0r/5dVaw1dKo03Pj0CXHj6wTc+0th724IZLN55gV+ZvlcH5+4qfM+6dRJR?=
 =?us-ascii?Q?0RT+0LSjT6Qr/o1uExuUXndFVn9CEwkFvUpyjBA5foBV4fndPryGuNwuNgSD?=
 =?us-ascii?Q?t3tbMbanJ34stmLPTmNLCdARtFvUYqNpZ64EHLbEqSDTLuwTrPIJbvMsBmdf?=
 =?us-ascii?Q?8O6yntfxdWIMs21J5ZnuJquRHlHldWe1xrVv8jpKzyeZVFLuFyZwYCFnmO7l?=
 =?us-ascii?Q?z6Nn/MMjUgQAamGa+aQGW7PO2Qx4V/cE1LC3acARwoOsazjhtS8VC+0B8g3i?=
 =?us-ascii?Q?/NNVyqwIqDwRTTBo9Pvebr/k2infYf5W4T94BwxkDmJ9szEnWahdLDul2CMf?=
 =?us-ascii?Q?HQgZhh12/1JGbFe2DTWP1viqt4ZhZyh9jSh8vJt6o1C32/8DpvkD3OMj9Pmg?=
 =?us-ascii?Q?dNV4UdMNUfJpbt1GGiOJOncFIknQ9iz8WXNwefx1aYjm+/2VSSFeZOvx1fTf?=
 =?us-ascii?Q?tJJnRaTYqUx0d9HhVRIQfUEoq4VB9zCuhrhWg3/4tl+j1LhDozYPjJaVx63M?=
 =?us-ascii?Q?nuJPhhUjTAF8iMAZKK/kL+oLcjoQiF+U0htSpbLeF/91hyEA3r0fQQa70ANP?=
 =?us-ascii?Q?fvyNLOME4kWCJ7x9Bj35bReHZIi1P7Zch2/E7WpM4oWNa97kgoNzI1A/He/W?=
 =?us-ascii?Q?F1bZKlSEkXcw6A1A1PZ0sOLaMuGXCYPNEZmLJ3yqja5icb9DGV7rdpLN8N55?=
 =?us-ascii?Q?8dxZjp2PGNwrw4n1OokLmTX1rxsgCaxFSJsuj1h72OBwgkxAxAPNz2fDXfT2?=
 =?us-ascii?Q?P9jIoB0zFhhdRjnaZqxh904lAtfeNcqbBbOBrWTNxYY4ZGT32ouZCRe9c+WZ?=
 =?us-ascii?Q?/6AXP6EqaNRtCEAzA7l3pKa7nmDu4+omDu9qIQhiM3Uj/wGnS7JQteEJ9k0e?=
 =?us-ascii?Q?1GQ53s1TKvp0zf4RhQiYeiXfA2GndXawmBjyI/LVwgtdszmOSQDcTHtjvtAS?=
 =?us-ascii?Q?0Z3XiWPDxAXHwe5IH9kpkjNm5DL/GCpQLS5JM6L0x4zLnqTxcYgkKFbZYTYt?=
 =?us-ascii?Q?u7p85ckK890GO3RsOuufFal1TpW+HNIjfq9B1PItDOM223LdxdhyQonBytdg?=
 =?us-ascii?Q?rBvPQpyku2arVuu3x5qC+ErA2ggxI4gRXUu/B07kvjTrIsPm6yKdH/aWN5+j?=
 =?us-ascii?Q?6kQNSrH5OUkNueecVpQ03NCNHj68tUpQfjPGjY8C0WPXBJaswACZsHMqFjbR?=
 =?us-ascii?Q?zPAUPjaARD0yf4YmoaElM6jNPfA8GmaOU2khJDZipizXL+kUnhv83LZXn2kg?=
 =?us-ascii?Q?+DLhosbZ9NxeoyyPF0S4RnlVk7rG/M5CdF3mguUn6NFhOViCuUkv4iLpH1JT?=
 =?us-ascii?Q?n+V+TmgVhxa/GpodZ03tqZT4jucaALtYq8z1wSJk/x2Pp6tXP0MfNM/GC1xL?=
 =?us-ascii?Q?/8tCbmdFtzWXwwSB6XXrkC+DUARe92k486wmvBniF5MnjFYLSnmX44XThrwj?=
 =?us-ascii?Q?jhMLwGsw+VEVReL2Rz8=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:18:15.4249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46969d0-0f6a-4e2c-2932-08de13752323
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10750
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120978

This switches the recipe from manipulating the lv_conf.h file directly,
to instead using Kconfig to configure lvgl-demo-fb.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb/defconfig | 6 ++++++
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb  | 7 ++-----
 2 files changed, 8 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb/defconfig

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb/defconfig b/meta-oe=
/recipes-graphics/lvgl/lvgl-demo-fb/defconfig
new file mode 100644
index 0000000000..9d4ffa9b40
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb/defconfig
@@ -0,0 +1,6 @@
+CONFIG_LV_COLOR_DEPTH_32=3Dy
+CONFIG_LV_MEM_SIZE_KILOBYTES=3D256
+CONFIG_LV_USE_LOG=3Dy
+CONFIG_LV_LOG_PRINTF=3Dy
+CONFIG_LV_USE_FONT_COMPRESSED=3Dy
+CONFIG_LV_USE_DEMO_WIDGETS=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb b/meta-oe/=
recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb
index 3185d37c5c..660031b68f 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb
@@ -20,13 +20,10 @@ SRCREV_FORMAT =3D "demo_lvgl"
=20
 inherit cmake pkgconfig
=20
-LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
-LVGL_CONFIG_LV_USE_LOG    =3D "1"
-LVGL_CONFIG_LV_LOG_PRINTF =3D "1"
-LVGL_CONFIG_LV_MEM_SIZE =3D "(256 * 1024U)"
-LVGL_CONFIG_LV_USE_FONT_COMPRESSED =3D "1"
 require lv-conf.inc
=20
+KCONFIG_CONFIG_ROOTDIR =3D "${S}/lvgl"
+
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${B}/bin/lvglsim ${D}${bindir}

