Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C000CCA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 13:07:42 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57028.1790600853500900975
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 06:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=EArZWdGw;
 spf=pass (domain: de.bosch.com, ip: 52.101.84.11, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGmFk1XAz/t2f41ikdQFJlb1opOseZUaxMc4lzZ5hrTFN/MrTwPvRP7F0gl13+Arwglav8tjYYv4jzw8y+rMkvnwFd3a6KdAflTNXvcwNEIv8KHYSJTRzmXNhoAEpfowJrS4w7/t+XMZyJGe3IbHYc5eDNKEdXAuN1YAUx8H8Ii4HUgoYa13CXZy2Hm2jCDD3tTrBO7fSdd5psXgBgfLk/sSO1YWZO0b/o5FKtZQBRhLwibCCeq9HLb0YfFyzusBfAlc0shkbid0DCA27n7J57AWHzpaVVZT/xsvRaY5jKBweAK3f8HfWEtywHSxKXL3v4O55GYnkHWby8Ki3N/2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/y/vCWgltNyilQi6h0gQb4fvh+aetayE9BtwyGs56U=;
 b=SzYAU4yh8BCSceZ+ojJ/gXrnGI4mdiqw0+IV1MbSKgsQGAoRXo+wU43ObxNJ/1sACmJojd30Tpez1We7WY97Z7L3/hBCRcjn9sKfoRN06ob5bCYRumQr0wIkGWNAeYUwYxm2mNkzh0k8ulrw43dwtWRJpvhx4z79ZiW3bdoWfhCDLdv5NVDQk58zkv2KlHyNkCys5nH6MHFH8f4AhZAIWA4Ex7nPTDk27uCRTLEWP15ZRJxUhQs65djkdq8RTAh/aNO3qZnwBsBTPmYounU/J1ZnfbGElrd1HIAVGq745g85pK95t0Dev3Z5oG0YAYp38obIV0GyNQ5UNZ4cfZmI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/y/vCWgltNyilQi6h0gQb4fvh+aetayE9BtwyGs56U=;
 b=EArZWdGwTXR9GRZgoS9HZqq1GEiSI6vYUQICBMDjMzyezNRHh1r5G0M1uA2IvheiHijJGpLsVI8VReeHkYAi0AltTV0oS35uUo8maAoVXgrQN9ZAOpaobC+/3eXll+qWlFW6i4EcT5CytBdBwHBa4CV8ZAFHTZtBI9YJ/4u8f+P5oxi/tRe5PnUyCaQDnWScd7gLbmQmU666eJy4AjofhKO3uHpmlkwOmbXsxLZZlN7ZOTq7v3HAc0CC7Uo7RPu4pyGdhDMMsHD/5GX3VyQhuOwJxfcwzyMAEDo4PHQhbf8+ZcIeN5VVEjmFxvGFyTrDx+i14WDha1nzx8a/qBGiHQ==
Received: from VI1PR07CA0290.eurprd07.prod.outlook.com (2603:10a6:800:130::18)
 by DB8PR10MB3690.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:07:29 +0000
Received: from ZR1PEPF0000E45D.eurprd04.prod.outlook.com
 (2603:10a6:800:130:cafe::f) by VI1PR07CA0290.outlook.office365.com
 (2603:10a6:800:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Mon,
 28 Sep 2026 13:07:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 ZR1PEPF0000E45D.mail.protection.outlook.com (10.167.241.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 13:07:28 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 15:07:09 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 28 Sep 2026 15:07:08 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH v3 1/2] libgpiod: update libgpiodbus license
Date: Mon, 28 Sep 2026 15:06:30 +0200
Message-ID: <20260928130631.4254-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928130631.4254-1-mark.jonas@de.bosch.com>
References: <20260928130631.4254-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E45D:EE_|DB8PR10MB3690:EE_
X-MS-Office365-Filtering-Correlation-Id: ff61bb77-6569-4b89-ca3d-08df1d617321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|13003099007|260925021311599003|10067099003|260925022911599003|260925021911599003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Y+ueihDwSgjAlpw+67/Njf8tZnrcgtE4Pxn/6CgLhOrJ0UDle50yJBXoozl6JrXXok6jSJ9lTKjv/xXJi4gnh3Ijz5VledBMqpna5853b6VRKlDqo6PenEaCMHoq+KX0RcEB7gAYNtrgNG6TUm9fjqc1uuvhLsd/soQL7fMIOmYU5w0L9Z7GhKFpo6sOfzuqPvnH63KFFbrw+tpFZ8xD3khPoGZfUpRQ0WJkrothPL3sP9N9XAFufYcrbDRMiLgcJXr8RdLVDvLfYLFKXsjJmbX8jnGn6GpcY8uJiAUH9riblYx4+HbE5LJuwEB6ZQQEGq0Tfl6+s3TUgCEy8ewEPK1hKN/OLnAsswdVD23HEqNoiUPcwppBzwldSHq5MRcepl+Q9+6Qst7znZzqCIVvVFD62XHoW/QlbdVZqmRHWBpy9PtcsSOKJWsbylyBZJxd5EdFaGANnszu8FK0QZOwOoiW0MYLVQZjmpKrXn2iuNyCSBVMyoSeacmilrQxbalWyHsM+lFD3uWLumIKPPqU5y5j/zXhEfCp+Ik9bU95oFiQ8LD5F9ZRdaOr3Qa31uIJj2GRH4mUGFkJTOoLDX7YUcNcHAdgeEjwHRKBxr5o86uSL3l8pqhK1Wf7OUOOWMT1Gj6tX/2GOzRTddwKDPkWv9P701iVMGPTaji5sakOUYI=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(13003099007)(260925021311599003)(10067099003)(260925022911599003)(260925021911599003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zy2+Ddr+w5BWAYaqzBiyn1I7zmTzL+n4dIy8gsdG5Xlw1Mmc+B3ONfQLWWofSKhbgtNryz/ZGCKPIxapSCM8ovkZKF1jHQkLqdobysx9zIOWNZIlsFxZ3snCXVT0Dn/oL6qGwPkfGvj/UFFbe5mUpTdoKDtxdyDdCWl/OfeTaAEzp2P3WL62CQM71rUoRaK3g/sTAbjxMZuFNImDuNO3YpSB6adBkeNKqrVrxi12cZ0yj1Kjcfs/nUyxh+lTTV6vYtfGVCigub4Yfbhc27awOFnUrOGPIfKsrMoia3j0bLZgCpRyABqKfYEXBq3uOSG7a7111688duVPD8pSx2TSl0dmMDh55D9S22/jji978TIefsvkijv/4jqNmtCXIeAd++Hy4B6+m3d6AUcziWDRPX/LDrvA0vUE4rOX1kbwzHSI660DMcW3B2FoMsqKaHWU
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:07:28.9879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff61bb77-6569-4b89-ca3d-08df1d617321
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	ZR1PEPF0000E45D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3690
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 13:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130438

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

The license for libgpiodbus in upstream has been updated to
LGPL-2.1-or-later.

Thus, update the package license and backport the upstream change
until it lands in a release.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 .../libgpiod-2.x/fix_gpiodbus_license.patch   | 26 +++++++++++++++++++
 .../libgpiod/libgpiod_2.3.1.bb                |  1 +
 2 files changed, 27 insertions(+)
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
index b3cb33ac89..fc8431c99c 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
@@ -13,6 +13,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-2.x:"
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


