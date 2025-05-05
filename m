Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3EDC3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:46:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.138])
 by mx.groups.io with SMTP id smtpd.web11.46690.1746438401802826592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 02:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=tv2G2cZF;
 spf=pass (domain: phytec.de, ip: 40.107.21.138, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKbgkSmyXSF3suX4idPlnSpMruRvb7toq5jIBWzAjiqRIIg/q7BP2UncsOGWOEaZxRvyGgbC0Oc1Suf95lHh955PiKW/mGDGxqAK0S4xfZjX7kiMjREceL5JKNHrzxswwlIey5oE6BTa/cjaw2mdELibADLxu93CRmynDFNq56816mBWtY45JMdyA+Jk6tDpuNFfulBW4Ym/4d/9muiIdvgeaY/IsGjBBEqMms7VtrAy44mFJ6Gc1ql5on4ohfQRtI99TqhG9q2/vTAfyzp0aHEbtY3bxmyZ45VTyViVC+PmQKxVdLkUeKc6bPLRofhPDkkLGnE56hilYuDvamY38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rskz87/8YGIO1ijwHWYB7hO1JcCrLxG6jRyRc07hq4o=;
 b=pKoQZAL9j7+fKgb2r0dm2NnJ/zEynktLPpXy9wu9UP7HuUOw1YMM7kgE7UfeDgwTCELNTQ+0Yhwa0nKqjPBzy8QXiQAKL+gIL253p/wZRiHKLf+V/cfW/FhZP4CKWQltFAFMiOmbbLoSNMEiGOMDizmRaTeveDlLrTbYisjNX1WcASW0RlluNCOZJ7+7JNrc2SnL8xtu4g5VYXvnIvG4jQdvdVFtiP++XYlBwJY4m2c+Z1XQWZzlzNQgy9vn2jv/RCS/lZk0CyiOuFgfhyau7g2FPeu7ujDO1Sw6DohRr0+OO2qo/omjxfKC277Vi7ht6d0aHWpyer0BthBOgLV+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rskz87/8YGIO1ijwHWYB7hO1JcCrLxG6jRyRc07hq4o=;
 b=tv2G2cZFBmLb23owDc2OHI2YNce9Kkg4zbHbC9tkYNAVmKMFw6kIQYhdk+mhAylS+YOAuoFLh5lZ7/VV8L0WGQ+yJ159UACwk12JmLTo0VnxGujfTKvLCX18fPCVZ4Zq1Jdwnufyi/bvSug+11bh+PhKXf6fdW0jCMH6APTMvQgGMvjlM+LQvdjfgqeE3wTJZKPIM7gMMMpMix7MafcKsdybiw/WQtDaFOaya7ddiKwcDtKK95M5hwOlxkm0acTMR9WFqhBuicbGzGVpJFPPvS4tjZewQYnQhcC2cheSGz1U01GR7ND6QFx3+b7//8mN3SkK77tfA1g6FQIma7lUsg==
Received: from DUZPR01CA0260.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::8) by DB4P195MB1946.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:38d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 09:46:34 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::2b) by DUZPR01CA0260.outlook.office365.com
 (2603:10a6:10:4b9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Mon,
 5 May 2025 09:46:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 09:46:33 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 5 May
 2025 11:46:32 +0200
Received: from llp-anderweit.fritz.box (172.25.39.133) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 5 May
 2025 11:46:32 +0200
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <Haixiao.Yan.CN@windriver.com>, <upstream@lists.phytec.de>
Subject: [meta-oe][PATCH] lmsensors: Remove unnecessary sed
Date: Mon, 5 May 2025 11:46:22 +0200
Message-ID: <20250505094622.14008-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.39.133]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0F:EE_|DB4P195MB1946:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e4dc7c-58ed-499c-154b-08dd8bb9b869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LvhQ0BblI2naubpWGYDVQGjIX6hlZGo1rr4qgcGxDfknHdjhJRJGYTmtf6Ek?=
 =?us-ascii?Q?QGKwsUI2T7qqaOk3ySI4lRdrQe6mESqTWKsY8ffBLUJtfHaIhObaB8Y8ED5Q?=
 =?us-ascii?Q?XyrdYcer1ghsKCnLXseAwzK9WvuQ4ALs/+Vv6wKaqw8IHZvKnOszkBGSnlJl?=
 =?us-ascii?Q?6OOhNSUpbLkBnqMVXi5FVK64wFt2Pr83h+sjVRRYaY7aseH2RBGnk+cbYhRf?=
 =?us-ascii?Q?iXEiSiQ+ibg6K4l16YBH6GEUonJXK/qk1yfpAGNgDcecoj7QfFiVi57hMTZC?=
 =?us-ascii?Q?X5ygsNi3iS5ISsrnW2Zq0Y30mo0l5m3RGVnraseSd+Bxs9uXmNFgyuiMJwmb?=
 =?us-ascii?Q?pe6zjkR4yZAMmYLZepi/He1nJkEEBz8glJO8mn5jtS6FLqVXFQ2oOcnVHYu5?=
 =?us-ascii?Q?M8NTd8GA+YkSlxp7KFBPr9dCG41cYlnJX3fqo2f0v5VNOgr/MqmSEsGdds4N?=
 =?us-ascii?Q?8KbjU6aKbQYUMZwvzxdvggpvk9IfxJXt3zQfld2uh90l2Vx5bgnnMxsTnLZZ?=
 =?us-ascii?Q?DspHIJHPD6N155LsjEcGnhXtcTy2GJdHuRUXqi6+1+1wSxA2a+AJyU5n1RP5?=
 =?us-ascii?Q?o4bLseXQwk8AgQTOI8FTy6HwW6i1jlBJMR9WBV5f1zciNRhrB2Z/0z1Pme8g?=
 =?us-ascii?Q?owR2IwcEUdAdF3KRv5xgAkPV2pgJcesnXCX3mME2QqqUGFahZav2/j9rROrC?=
 =?us-ascii?Q?q2k+Pwf6wrfMBrJGL1yr1l9b6ykciPGRVI+isdo2TnWAoAYfcwRV9T0vJcJ+?=
 =?us-ascii?Q?IuO5oLuN2qbzlxDTX6sTWE2MToWBtG2CgRiRhdlCK9kcBAJdmG92Kp14Xmr1?=
 =?us-ascii?Q?dbKcHi4JRYAPRRfz9b000dxLT6ZOe4KtcW5EcOnNfNOoxLkdKLTyfQIMHd0Q?=
 =?us-ascii?Q?k59kcPCgVtJctv5mXvYx80zomW4rllGzGYuHRjfg1ELFoPpJl4ejWrXcpfa6?=
 =?us-ascii?Q?NhJwpVaNGCcplmFpEUkmq/1qwWLLrxBVl32V7pYdoNQXTdH4LP0SqUq4/xia?=
 =?us-ascii?Q?61UYZfARNOTPg5JBX/HnlO2HMV5Db5coY6SfB3uDnODFu74GCCjYw0Ni56R4?=
 =?us-ascii?Q?HifyhaiAcq1C06iQNb1p2jT7ti0Hw9PcniUaiPt0ySaLpKNdjA06pjA93r8c?=
 =?us-ascii?Q?CwnadB3h3yNTTej0sUqDSYaq7ejoeDJ5VI5lE0Z//LaznrzrSVZM4qiS9sXe?=
 =?us-ascii?Q?VUk1c2+VBox/TqFGIgT9mpwy1UakzeirvBW1jpqR7woPIyfF4T8OAqHSXQQD?=
 =?us-ascii?Q?Btmyy7eLaAtjM9E6vYsYFax+rYTlf3iqn+YNr+NKOmjJNjcypKHTgqY+mqb8?=
 =?us-ascii?Q?DBPN1OQM0tc8Kj9p4s7VlxtjoE8tca/Ps+uJQtXNRDu1zMX58pEhuO7stbNI?=
 =?us-ascii?Q?tsDlYXGaX6wjoa9mqTlYpOPYGC0BYp05TSLTXtVJ5yndgoQsE6XU3J/jHxpr?=
 =?us-ascii?Q?aqnMAH17qWglE5fWwoAoNkGsrBy9XgpYF9eCSAH4ENOfUulfsGVZQ09Ue2Xo?=
 =?us-ascii?Q?lHQ2k5F3ezJQv5cjDIwS/Y8MKp7spQoICcfr?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:46:33.4889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e4dc7c-58ed-499c-154b-08dd8bb9b869
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB1946
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 09:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117300

The sed in in do_configure not necessary anymore with commit
fc88c96c4e40 (lmsensors: Fix build without sensord). Remove it to
simplify the recipe.

Suggested-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/re=
cipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index 4df03420ae8f..74a9b839c9fe 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -52,10 +52,6 @@ EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
         CC=3D"${CC}" AR=3D"${AR}" \
         PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"'
=20
-do_configure:prepend() {
-    sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
-}
-
 do_compile() {
     # Respect LDFLAGS
     sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
--=20
2.43.0


