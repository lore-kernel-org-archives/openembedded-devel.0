Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8D1CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:48:30 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55474.1790596102669305951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=RyRLoxYw;
 spf=pass (domain: de.bosch.com, ip: 52.101.66.26, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dT7NeDqUlROmZNxkmt3MczUALaUnD2Y23EFug/QUR27YrMcENWqD8z+V10iE1mTpLBTdzTTTXoBx+a7YF5e//Zvn7MmcwVzGcdlnAykhCxhIK3C3Xp8ZBAItkQbgMwHcNC7eO4X0sk48qDmRakyHK4s/8KQbZcttN0ppOlJ6ECnTWdPOsiaF+vr9o8MMQZIWOrrJ8ByFF3gymRPXDPR5gAaaFvHYkmCtF+tbvAQL7P8RX9MmcqPIW5RP0fZ4OUqaQSX1SB2hZoakYzSD4vGaJ2Idy5UFlLxteSjpnTJfjzojmqOVYmugplKjFkiWh6gOU4gpDDjK21vsY/Ed+fleAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VUby6XSSvyPB5VzZXQNYB9phiF9hZD51sa8huy6Qwo=;
 b=OzFifYOQot4Jj+GjLMXJoIdDaRbnqxDCJQpE4bCtaiz/XgE95ZMtNanHpjGwdhYsODSit9PHgPsxIhRpwGD/BAskSArGSyGCF3XTYr61N/t9mxnVzj3Sg+lMccFwfw3W3GNcjWtMcCNLBDK6Jux6VHucbY+yF4xYKsfSNJoNYni2dY/OGw5z28yyGdHOuEia2GGwmqTFL9BsH9OshJj7H/mPGt6GpVqz8yyjTOayRtbdKdFiywwCtElW6j7GVHnY6d+TVw0nKrU5CBou7K6gRkXrWnPy/R9pt1BDZFj9lLqGMzIbudBeEse66idlP5ottrxxP1vYO4a0ZWakd1L+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VUby6XSSvyPB5VzZXQNYB9phiF9hZD51sa8huy6Qwo=;
 b=RyRLoxYwcwZmL2xlmtjyaBL+u2P5pAIjxLdbwrU0MVfJLJVeWqc0NijZDK51GyBo4Ovbk1x8HmegOkPWpBDdwLsjz1mtXU4CKrLm7dkXmRplPGzsmwgrolnEGLzGpATouU2Sj6eFKgwVeMs8rbFdIMVjxlLjc36m0z3cua7MBAzcG5kb67Sy48Ue/bwZaEkVoKZea+nNDEDWcEHHZ1bHrVslOgGB2feAT0qtQBh5FZ3NMNLZRPzShfD9SDcXtcfjwtZIeQUYp+cAvyF613KqXK96HOqSAPGcT2MVhMVvdw0P/ZSXCFR0oGov8O9mEJGTX2SbmtylYYNpxUF5Uhy3Jg==
Received: from AS4P189CA0051.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::16)
 by PA1PR10MB9150.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:443::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 11:48:17 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:20b:659:cafe::35) by AS4P189CA0051.outlook.office365.com
 (2603:10a6:20b:659::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 11:48:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 11:48:16 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 13:47:51 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 28 Sep 2026 13:47:50 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH v2 2/2] libgpiod: update libgpiodbus license
Date: Mon, 28 Sep 2026 13:47:04 +0200
Message-ID: <20260928114704.2719-3-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928114704.2719-1-mark.jonas@de.bosch.com>
References: <20260928114704.2719-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|PA1PR10MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b0f066-8a8b-4138-31fc-08df1d56628d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|13003099007|6133799003|10067099003|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	N4Mp7ullLqquQc49hz6PpZgMr7IhrOzplCG8ak9tMjdxMHT1SbWoTB74KfJXXqt2KUXBtR922v7yTXC5m88hyQQtz/GKdYkmTzv0pT138f22pyB+BaaSkkYNEwRCULHTUS+ktnr5UNmofx5LUmOSqsLWjXIP+1V30pKIzgBHniwrmNhQ6EyFA2eEsJFqg2gaqY6OUyKDniLK5It4cj59Db0tyIoSCKCzE91jqC6cmoMoqNEGqhtc1TDitRdw+JzJgC6MrnHG3768JEnzCrevB938PNotKK5HyOYb3JSi5HNNbz0Ce8qvYEh9n/OoSgD4o2Nz/d65vycqXpNFEjcu5fjG8/CWTYWyJSLIt5thNrZkAcGNz4OaZbUvdDXcDyLWu9dvGT43j/Q3bgJXuc7TuG1c0963T0H3dkmEv5w5YF9gQHhK0r0TJOI01VwUrtcf0R3ZSJd49wkLxIcuEUeJBK4Upw3SHGylmEQyn9m+kNUt5bkprHp/ceOXnh53voOn86S8Ujx+M8qqtD5gdl5P2A8i8Q65TfT88LHDSOo9kUQQPIB1qyK39aVI1kDB3s8Tx/0P6OHXavJTaIc9Q/QqKA6PHDfYRHBYIp76D6HXGVa99kpagANYlOzVMJbjW4AU1HzMqpW5/JgE4ALDAvRMchN0zQGWWVyEtAA2FauA6Bg=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(13003099007)(6133799003)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2Qs/ZSQExISaqfP3mbWzv7d7jn4EVQpPgwEFfhy7+CtSaP9HPzkGvwSxVpaD9GYlIefnZCkjw5oM6hFk2uAFd6Fb3GPi20Oeq5NDCMQdOisblEqO47SgdWQ4jUaU1z29ZFTV69DaGsprIuFhBD1pYkKR7WKChYceJpjEh+x54oN38vjHEtYh27u7LmWCsCbJRkLCOI+Dz+7dQr18C9Zv+4VMF2aOxjTcSz+9mDLvwS1XOV15yVaue+lBNRwKw0On7zJlmf0B/+zWFUZQuRGUb7GS5cgRJcuuDmuZx8x/mYWUQ0na7710woUJMcXEyd5xYizCmTdwrdQj9R+vNtpsMC4ImylekmrqjDpMzI3OI03Y2JarZkgJANqs3eElyIvX6AcspHDHfXY4YtA8X3W01RxBVWJkv/nJRF3h6zQwyw2WA23BWN+gyWdFMGbaT4mU
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:48:16.6632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b0f066-8a8b-4138-31fc-08df1d56628d
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9150
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 11:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130432

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

The license for libgpiodbus in upstream has been updated to
LGPL-2.1-or-later.

Thus, update the package license and backport the upstream change
until it lands in a release.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 .../libgpiod-2.x/fix_gpiodbus_license.patch   | 26 +++++++++++++++++++
 .../libgpiod/libgpiod_2.3.1.bb                |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiod=
bus_license.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiodbus_lic=
ense.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiodbus_lic=
ense.patch
new file mode 100644
index 0000000000..aa1eb0d8ab
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiodbus_license.pa=
tch
@@ -0,0 +1,26 @@
+dbus: fix the license of gpiodbus.h
+
+The libgpiodbus library - which is entirely automatically generated with
+gdbus-codegen - was meant to be available under LGPLv2.1 like all the
+other shared libraries in this project. Change the SPDX tag in that
+file to LGPL-2.1-or-later.
+
+Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and =
tests")
+Link: https://patch.msgid.link/20260925-libgpiodbus-license-v1-1-d7ddafca8=
872@oss.qualcomm.com
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libgpiod/li=
bgpiod.git/commit/?id=3D668a0efe918f9a763406239615175f759a6835f9]
+---
+ dbus/lib/gpiodbus.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dbus/lib/gpiodbus.h b/dbus/lib/gpiodbus.h
+index 025c9c8586818051719078ba9d240f6d8b39e016..7557a576a5e9c6703ef78054dd=
c62a8b270de422 100644
+--- a/dbus/lib/gpiodbus.h
++++ b/dbus/lib/gpiodbus.h
+@@ -1,4 +1,4 @@
+-/* SPDX-License-Identifier: GPL-2.0-or-later */
++/* SPDX-License-Identifier: LGPL-2.1-or-later */
+ /* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@=
linaro.org> */
+
+ #ifndef __GPIODBUS_H__
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.3.1.bb
index f804934682..c9cf4c1e1a 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
@@ -10,7 +10,7 @@ LICENSE:${PN}-glib =3D "LGPL-2.1-or-later"
 LICENSE:${PN}-manager =3D "GPL-2.0-or-later"
 LICENSE:${PN}-manager-cfg =3D "CC-BY-SA-4.0 AND CC0-1.0"
 LICENSE:${PN}-tools =3D "GPL-2.0-or-later"
-LICENSE:libgpiodbus =3D "GPL-2.0-or-later"
+LICENSE:libgpiodbus =3D "LGPL-2.1-or-later"
 LICENSE:libgpiodcxx =3D "LGPL-2.1-or-later"
 LICENSE:libgpiotools =3D "LGPL-2.1-or-later"
=20
@@ -25,6 +25,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-2.x:"
=20
 SRC_URI +=3D " \
     file://gpio-manager.init \
+    file://fix_gpiodbus_license.patch \
 "
=20
 SRC_URI[sha256sum] =3D "e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54=
b3566484650a30"
--=20
2.34.1


