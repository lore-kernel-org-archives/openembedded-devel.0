Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E378ACCF9ED
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:18:23 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.40])
 by mx.groups.io with SMTP id smtpd.web11.733.1761362300500380923
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Wodybj4w;
 spf=pass (domain: axis.com, ip: 52.101.83.40, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkHassw9aaUt9Iy0UmoLJlE5w1VbkBQPVnADQKtawZzt8yqklaNi9JWgQy8RUXiGHjNnBhdxac6vSJarX5xocFbE8us7NZbVIsugb+ZjXxMyJeGFJG7J0mssu69GaRjDTa2dhn+aIAbKgQ9EiAmEh52mYxm65rPKCFJJWMbMiYV6vAsY0s7yOv1CgkWpKFXcX7Jm+12eNPrwIkRA/WJo3FVpE5CFJhBct5R61HzpoLEAltkN+Wtgz0n/6odGdd+W6BqgNOOMtzmfZAPi0cYpMz/l39CQuXlyOLCLgJxdEsh+SQYgq/xXEgX/y0LaYgd8XUTZRYQzlAkfYeKVY3XgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5ph9r86zA47u05y1Unj7HpaZZXnJMIZXclbUD1/rjg=;
 b=rd0La2IDnEuRDBWXrVIW7ogKGNLHAXVFHGW5oI2esgIh9SItPnxt8osK1doVxWfkbYhLzXZF/ztWzwgkrz+No8ecY0/J0rgT/vzWahkVMLDKpRQdI2KHejxB6DhZ3V8BFQywSGlHczm/zLa2XvsMJWzO1iVoq7uJqBl92MEqwuz7lRupKTMpqSVzILtZdHvd3irTYVEDYtXG9WupIlQkM+dFSp7gLMViwHKOXBnfXz+49851Se9kRd8Co6Knu9wLNhH1IwyW6rkZ8DawVpW9rUshbbKCbZe03OBC+fPwR6YSalEggTR59fkRFEP272sbOokyfqMOcV8rccrzMC1eLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5ph9r86zA47u05y1Unj7HpaZZXnJMIZXclbUD1/rjg=;
 b=Wodybj4wfEJbosCPyPl1S9NQ4Z0nLPJIeRvlWxlLXTSWJVO7A0BR3aZxlLx9I/TiIhpo5UgIbSp8MBQ/8VAmNemfCke5GRqnlpYiH4QW2KfsAVv0Ovpw1NNSoaikbvM5dp6SnuWJ1SnRWQr014FPJvmNJuhuZNV/Pq+rpSpcd6I=
Received: from DUZPR01CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::10) by DB9PR02MB6731.eurprd02.prod.outlook.com
 (2603:10a6:10:215::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 03:18:15 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::a5) by DUZPR01CA0082.outlook.office365.com
 (2603:10a6:10:46a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Sat,
 25 Oct 2025 03:19:05 +0000
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
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Sat, 25 Oct 2025 05:18:13 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3E0923BA1
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:18:13 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id F3BC51207A3; Sat, 25 Oct 2025 05:18:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 8/9] lvgl: Add freetype support
Date: Sat, 25 Oct 2025 05:17:47 +0200
Message-ID: <20251025031748.2728416-8-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025031748.2728416-1-pkj@axis.com>
References: <20251025031748.2728416-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|DB9PR02MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: c20fe85d-2348-41f2-39c9-08de137522ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BP827IA6USjbv0tlnjKHL0hq5ikDSxBWPURVRHI8YvCw+bnjvhvZx26MyBe6?=
 =?us-ascii?Q?H0s6+6SNmjSrzPXzqhHpr/ixSlN64/QsACmpV8iEj6mO3BSim54elCwKoUxO?=
 =?us-ascii?Q?MSOKLdMSEc0fK8Nx8QlrME4vxDDO5a+GNIgOc261jQ3lllwDO4lsGubIKk3i?=
 =?us-ascii?Q?t0x/eGO6ljDC22CqH9ufEQttCgII0xr/FmMB70er5nMdZoKEh9O1Ft+fAVyH?=
 =?us-ascii?Q?nEVdnSaEvts9WFqkxfSiEPnbqSnu01QA47Ym+mOjJrAB6G/DwEjC1jiO0l8z?=
 =?us-ascii?Q?CdVx0QPQQGctu93xcrz0On8IpMXtP4BgMZJ7BNI7xs8NHtGW/SaT868fEJn9?=
 =?us-ascii?Q?JB6EM059cLKSc1a4VufUbFlmUsJjXegeF/KE/y4M96DJHWnmm6x1Z2nxWtZT?=
 =?us-ascii?Q?A2DeYPU5SfKcnCWPQBLqZwVUSUuXBucYiMiA8Wu5R1ZMplpH4u56umo5IUQx?=
 =?us-ascii?Q?zluNFmUAtko7mwaagyCvUHdcD3TzDpGj5zv1whcEjwZo1etxzK1FnsJy5wxp?=
 =?us-ascii?Q?NBFfPjGUsEDOEirAafJiyiS8dTGL3VC1NpPuaZXqLveLwAVEqY+NqfwiECKr?=
 =?us-ascii?Q?TLgeWjqekpZKHv9Xx4PE/3mUeDyh7LouDGA1aTAw+taGR7zGTPXO5h5xvMZG?=
 =?us-ascii?Q?6MSpKFfb1K/n+Q1iNq1FKKxWKrNB7uxMFN8cyCIa3JalaTbjwS/7rsg11MCH?=
 =?us-ascii?Q?JXxe30KBE/7N5YScNz6cGsUanYoX7pZqwBCnEojCHM7jDtKfIjk/z2r/lqGu?=
 =?us-ascii?Q?1SaB8zd3hY7JblBySXmkugYha7ubx+BD4JDqf8rFyiv8HkQNhl2NU7/vwoMp?=
 =?us-ascii?Q?YIlFLoojgBftzSjdGTCNmvlVAHkNcF3SCqVEei+FAW6bGVIQ0eIZ+gMwLY4N?=
 =?us-ascii?Q?1sMY0+Xo5urzSJU175G7Bx1XF1kNW4QfIO8M/w2JxeZhO4vhKeJdW9iCbHht?=
 =?us-ascii?Q?KUrjkftB7+MwA+Xsy5C6m7Y3OBxoIUmOHfnov9uWeGaXBVAqL0jyav2pRGvV?=
 =?us-ascii?Q?BzDHa2/YS175aAwhoQ7jfgrwQP3VOXisyEbdbgQbys+fLtdlHY9DMHyl89A+?=
 =?us-ascii?Q?JiE7zgWNXP4sn+w9bIr1fzmfQZLI/i846yGiA/4ChZk23iu6V5POcInsOUYI?=
 =?us-ascii?Q?GqQrcN8hc24T+NBjJ3oTYxeH/m5JNSDTyRtUlinRELbyUBplIcLiJYfZSBov?=
 =?us-ascii?Q?5G7biqOzCL8GOBMdu4gLpkrWEcsOUUZjVyUvp7nuow4PD95Q2OQmZHVUo8CC?=
 =?us-ascii?Q?VUYd8UDmsW2ljX2Ol7BCJcaDIc8fLFXth1zomgsCm/MRNPVb5UdLAynhPsdw?=
 =?us-ascii?Q?+IAwXpEnc+GY6sbMRR0cR4uM7P/wn4QcKmES56hmaEg/hlx7zmMcv9tLweVQ?=
 =?us-ascii?Q?xr4cTA0pRMqY5XK18BWT1OH2sqmpVkhXNuy/xyv6fphmjKX+b5n1V90kBBtG?=
 =?us-ascii?Q?m8vCEwpp6v1F4PovFIiykSNGWX2q9nAOd2i7pz4AhTwC1i5+ePOdDAKvMxi+?=
 =?us-ascii?Q?tB48IN08kK0nfDUJcC2/4Vyl6Z2leOmlizHUueaugjPQxOM9g8rpQ2oT7lRo?=
 =?us-ascii?Q?AwaLZas+sV0Vjcuay2A=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:18:15.1879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c20fe85d-2348-41f2-39c9-08de137522ff
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6731
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120980

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-graphics/lvgl/files/freetype.cfg | 1 +
 meta-oe/recipes-graphics/lvgl/lv-conf.inc        | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/freetype.cfg

diff --git a/meta-oe/recipes-graphics/lvgl/files/freetype.cfg b/meta-oe/rec=
ipes-graphics/lvgl/files/freetype.cfg
new file mode 100644
index 0000000000..acc8ef0e7a
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/freetype.cfg
@@ -0,0 +1 @@
+CONFIG_LV_USE_FREETYPE=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-gr=
aphics/lvgl/lv-conf.inc
index cc8a2a16d9..4264f20895 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -8,6 +8,7 @@ SRC_URI +=3D " \
     ${@oe.utils.vartrue('DEBUG_BUILD', 'file://debug.cfg', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'drm', 'file://drm.cfg', '', d)}=
 \
     ${@bb.utils.contains('PACKAGECONFIG', 'fbdev', 'file://fbdev.cfg', '',=
 d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'freetype', 'file://freetype.cfg=
', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gridnav', 'file://gridnav.cfg',=
 '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'sdl', 'file://sdl.cfg', '', d)}=
 \
     ${@bb.utils.contains('PACKAGECONFIG', 'thorvg', 'file://thorvg.cfg', '=
', d)} \
@@ -17,6 +18,7 @@ PACKAGECONFIG ??=3D "drm"
=20
 PACKAGECONFIG[drm] =3D ",,libdrm libevdev"
 PACKAGECONFIG[fbdev] =3D ",,libevdev"
+PACKAGECONFIG[freetype] =3D ",,freetype"
 PACKAGECONFIG[gridnav] =3D ",,"
 PACKAGECONFIG[thorvg] =3D ",,"
 PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
@@ -25,9 +27,9 @@ inherit cml1 python3native
=20
 EXTRA_OECMAKE +=3D "-DLV_BUILD_USE_KCONFIG=3DON"
=20
-# Add libdrm include if drm is selected in PACKAGECONFIG
 LVGL_FLAGS +=3D " \
     ${@bb.utils.contains('PACKAGECONFIG', 'drm', '-I${STAGING_INCDIR}/libd=
rm', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'freetype', '-I${STAGING_INCDIR}=
/freetype2', '', d)} \
 "
 CFLAGS +=3D "${LVGL_FLAGS}"
 CXXFLAGS +=3D "${LVGL_FLAGS}"

