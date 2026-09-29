Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC3ACA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:14:57 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7553.1790687687218674611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=gXYK9xZ4;
 spf=pass (domain: de.bosch.com, ip: 52.101.84.67, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8IACFG69VxP9fg3JNt5OtAj6sx9UOZl8r9sd5SsmBTWnrZx7rRUYURuQTvkSjTzwYzFRGiZXukmbAX1HZrecRdA0C1lV4yuOzBeNXEJIVDyFgr7ujAkGsTluLSDwVhdLXQyJpIEn594TwaoF1SNN7YbWPlNyE3EtcngRAMBq/Fsmhb4e3DYB4GdtIGO25gOMaOhhBSEbo4oZUVef2J2xQQ5M1S9MYnyXvQX0PtBP6B4cxaMSF4I/uUK4tAY5S1lNNIQ3K8TSj0rWfG5Z6Wtx35zBqSvKV8SsY+LnkjoJVypc/2iBpTRSOoDs3QfL8ipWiv1QjUIsbYILKxDTdue9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejyxr48DKCyddtLFYa7w9SDEhTg8HtFj+OYNyCGSPuQ=;
 b=QWSmjvvf8jWRO8sIJTvTSkRfmq0ucKRHjnnInwwNWbXZh8ErejIX3W6j1zzZa0zb4uRiHCNKzQf2Laae+f/KCe8x08h/nqCtC9GBh4s7LUUmYmmzGy48K3Ox1YWtN1O3Bf83kMIdC9rOdkDY8F8U6YFfWEvs9leYUdLcOZqaJYtBo/WSvYwL1nIQARz+rBRgDAQelxFwsWmBPucFENW5z/Mno9AcxtWnQuXxHCGREsakRjC8n5DdqlZuxW/a1fc9+LXbP/vTYDfqNmvydVeRcmPaPpxycA/6UJsxO5RZ8z26bQlYryMwUSytZPBEXfxCDn2clbhWiQk5IgoZDZMiyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejyxr48DKCyddtLFYa7w9SDEhTg8HtFj+OYNyCGSPuQ=;
 b=gXYK9xZ4qdA13xI1c2tIjKPYPCzWYMYv82mqqTN2HYnamxfyFdAxOahzJSizo+11BvmTr9Usvtzex9qKJLIopV07OlDfEvDiLA95G4Xl6Eb53VtMA5Isw36MrXjb5luj5Lret2W7KMQDJvwFaVVDYlUGiQr8DUsqE4fzBesSkGXs+jBFO+Y+kf/VWR9MpS7FpSkZz0bFEGUoyUokd0k2jsNXAJ/KKewj1YIKCeRSarPSYNvXHGwpL9FmvRjmV3YBFRXgNJVueI2THxK3tuTyTFgMvOE2L9z5ktQonjcV76VMHV+UCGvqs8mPivz1fXLXGSvpUlZ5iIY0gDSdQyY+Lg==
Received: from AS4P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::13)
 by VI0PR10MB9578.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:14:42 +0000
Received: from CPH1EPF00000519.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::30) by AS4P192CA0028.outlook.office365.com
 (2603:10a6:20b:5e1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 13:14:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 CPH1EPF00000519.mail.protection.outlook.com (10.167.241.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 13:14:42 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 15:14:38 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.141.135.27) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 15:14:37 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>, "Khem
 Raj" <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, "Ricardo
 Simoes" <ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH v4 1/2] libgpiod: update libgpiodbus license
Date: Tue, 29 Sep 2026 15:13:45 +0200
Message-ID: <20260929131346.1894-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929131346.1894-1-mark.jonas@de.bosch.com>
References: <20260929131346.1894-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.141.135.27]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000519:EE_|VI0PR10MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: db88b5b7-e2a7-4afe-ed75-08df1e2b9fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|13003099007|18002099003|22082099003|10067099003|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	znKlyY8Ep8BnodN4jl9qgH/5u7apHs9+oYMijQSSjCqaFWhO6fabhUXgVVyI9b5rWku8HBrVMSJZpF9oIfVZn6bt5KJAcGXD7YQ/7eaR238uaY23zMwUtAnWB6z9KqBqhLUcp72HSq0Qc4J435qThd6fSedUXYfgoTNxH6DvyuU/ttaUYB4RjLv8su6zes38v7MYtWkYruQVHekY+KoFvkNRQgQcohpnylErnqk3tyXbYZ5cX4/gPvobEi+HMSyESYu+7KjlzKYk36IPOq/wuk8LrTDOX5cftKz53bhkpv4iYO6mt+om1dV4ocfxCqhchnyTBb8tKavZYoz9XPF7Qruw7ls8DQ4O024+fchWBCtKDeRkAQxiKl2EimkzYMVl18EmsaCszS0bssWm3rU+On8EPfzRUqC5FkBKRSZWRoqtpOJceGdGkwIa1/2WKkmoIQVQEyRhQmxyFpZ7sJeGq35cDu8I76ildklJoPPj7p0Y02FF9g1TlOkgLktNSCY+qHphgRU6GGTVojIuiyH23Wns5L6Q+pDTFQXRFiiIiZqbyY5Zvst33aWh9VDZq4t906CIOUoUlsh6ZAgCk5ORGSzPSJxGKhSK7CRjy5zR0iUWSKU9kJyjtAPkMmDcGP3qZdv3bKdZ7PyqV+VtlUIlFjxMYLGUNp5QDWZ1acJf0ms=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(13003099007)(18002099003)(22082099003)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	awuEI78W14aNB6v1O2sP8cjH5dcsAQxAzPGLpHjfBBzMB+l9zSFjWlD/O2QMCaPbWw6gc6bFSWMLkWmRCO935rboaradiFkjCRWScKuYfxLiGsO/skQqGpYtYCiik+EeVsr4790PvaQCh3kWK+bxwKWrF2Mc1Z0BtLEEQPgnXUpSrxdagqsvq+tI/fZhfX4y5fVbAU6gKHUp9sUvn6qTi0fPCf4eb0rRmXmvTt33GUP1ADPUeJ+98UJ5ePwLsN2yfizQtmnrZp5WBKlRoXILTB1txv5VjqvoaAOLmuJVpJyO1g1Wtpsz2MoHxnBlLedREoLmSggk6xXvlCNYg6tkoF+298KQl+PMpUA5gXVY2mgsgfRsnOhsSXEJe7ezC2CfVrUc7WgUbLbNaC+t5G3phaxVy2qYmOjmx9Hq9heZAdLaX0+IoFipaRjO8kznnltk
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 13:14:42.2713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db88b5b7-e2a7-4afe-ed75-08df1e2b9fce
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF00000519.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9578
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 13:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130479

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

The license for libgpiodbus in upstream has been updated to
LGPL-2.1-or-later.

Backport the patch from upstream so that libgpiodbus can use the
LGPL-2.1-or-later license.

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

 SRC_URI +=3D " \
     file://gpio-manager.init \
+    file://fix_gpiodbus_license.patch \
 "

 SRC_URI[sha256sum] =3D "e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54=
b3566484650a30"
--
2.43.0


