Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web08.11218.1623771686154074792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 08:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@de.bosch.com header.s=selector1 header.b=TEk4DNWW;
 spf=pass (domain: de.bosch.com, ip: 40.107.21.51, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAGTeaXdp57Qca2gMxaO1dxcsktSrOiqTD+HZS5Ad+1bp7nLagvzT9t5Ry6l6yZqWQ5FTy7UGWvyAIQGs25o54vD/doDkKwAnG++0uqt6Z4v6PV9oG0aLCVhAUdR6U1ca9rirfVsK1SIargQtnDw20YKxy+eJK8OvuMHHktEjxGTSMtYyHLbA/83cp725DXZlkoLOdHmtKrHaruPfKXokkI64gklXJbdJFpY1ZpDf4XNkd/wMvY1WTmWw9iAx5XQIcEZKjW+gBFNKbyTd4fQhrwbhcFDjrfleKTIwrKDPqeyXfCFi5oIhI7C0QusBXH+wCcUn6YNhyVMUe0jo598Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75PEELWlNXJwSeJXIOEosXg0VWRITXIbPIGO/19Zqs8=;
 b=oOOnYufPylyqpeDD+C2e/OFGs7oKuDgt0hy4VODj+SmQV0oUSjB2tteLm/gvE9saI6EnDd2IEKe19OjN0RaDiJAh4e835pe4oowb56R4NpRP1UZET1Os7g7gZ7Cw1N7eXSHuPc0QTs5+4ZuTsWcP6R/iO5inOqE9E3tUfcC1jiPFCq3+knYmcl2IQV6kVo5wl3qAzi9RTjgmaBfa89oKZil2JAUDtGFFbiqH8HB0ViCcRgI5ppe1vhBAJvCjdkxrahpoQIUnA28j1YvL2coY5JdUKlNtfSDZX0h1yfi8zCOly8fW7oFsDmri1Gslxe9hO/Wx9iawzKaKPiCtxZVwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.199) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75PEELWlNXJwSeJXIOEosXg0VWRITXIbPIGO/19Zqs8=;
 b=TEk4DNWWf2oVJPDEBfycA4UN5sHAmMlEuNFBZcH3IcyEWblLxFoE8x6YRk+Lad8eNfeKAKEWOW3rlcJolCHDy5tGlp4loLhARw8cy9uKV9LwqGqz39VbYfiTzqA8tg/qQS8o8UzcdljmX6yoEP3/tn64H0WsOCYXymTzPDRufyI=
Received: from AM6PR10CA0057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::34)
 by VI1PR10MB1869.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:38::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 15:41:22 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::9e) by AM6PR10CA0057.outlook.office365.com
 (2603:10a6:209:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 15 Jun 2021 15:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.199)
 smtp.mailfrom=de.bosch.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.199 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.199; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.199) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:41:22 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.14; Tue, 15 Jun
 2021 17:41:09 +0200
Received: from SI-HUB2000.de.bosch.com (10.4.103.108) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:09 +0200
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:08 +0200
From: "Mark Jonas" <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <kevin.zhang3@cn.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-openwrt][PATCH 5/7] busybox: Supply patches for different versions
Date: Tue, 15 Jun 2021 17:40:47 +0200
Message-ID: <20210615154049.173769-6-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615154049.173769-1-mark.jonas@de.bosch.com>
References: <20210615154049.173769-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63deb74f-65cd-4d55-64a6-08d9301406ea
X-MS-TrafficTypeDiagnostic: VI1PR10MB1869:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB186919C447FE19E97D57C73BAD309@VI1PR10MB1869.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l16pau07hwQsZEMqKxiil4PvzA94LRnIp1kPDDCoIdzNhZnGsS/oPrSYnQDEpt9GA/G8mUT7Mb6t5JYoDPh0RJebJ5wjETrr7/v7g5Ij3Q1y6vgNmSFwVDb7n9TG2Tdo0QzqN0HaJg3WA2grO29IwrakDvXs9L3IpfEr1pRR+VQTf5Rshi0CPDdxm+lTJzc20eHBPQ8i5q8Rvjy0WIOYuYfKlQTu7BYE9OdeEeu0TGHh7Dg1bASUS4M/foQIEhG0o4aV3/71vrV/jVGGKWKWWszOUKq/Gmcn7XntCON3MHIhdJZOZSRaEt0cYltJsdZpHusxtgrlglCcurEiIbE5B6V4DV3Uquzz0zpmbdNao701tyP8+U/PGLH1DAfCHlLR900WfEudwEiFRRuHKerpfeElKMEfEFTZ1O+ef5wZz9dfX7o3gWtlHPRB3Zavv+3Taw2agyK/+akO4GbI+qM533kwUangBjq6mCGIopbK6cqZRMefeAtTwykHYOPqONalxmr84Kl5o6l8KpkTb+MxhGwlvHdAwK0Jm06IpC4T8PdQSkbCR0ThVOfzQeQ2ov4APAHir47IlNeWOVtmUOg2LoHTxtCp93F5Tt3EJtzAmnXFoM5LgnDUkmwUzpXr8zOtjcFOqAaSjkqFJqKTqi1Q7jfWWudEM8fPWppW8TG+MJcA1jpV3aAuHu8JnDiyzXKk
X-Forefront-Antispam-Report: 
	CIP:139.15.153.199;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(2616005)(36860700001)(356005)(81166007)(44832011)(4326008)(26005)(86362001)(498600001)(82310400003)(107886003)(47076005)(5660300002)(8676002)(186003)(70206006)(426003)(110136005)(70586007)(1076003)(7696005)(54906003)(83380400001)(336012)(8936002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:41:22.2030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63deb74f-65cd-4d55-64a6-08d9301406ea
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.199];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1869
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Kevin Zhang <kevin.zhang3@cn.bosch.com>

Dunfell uses busybox 1.31, gatesgarth uses 1.32, and hardknott uses
1.33.

Add this line in 'local.conf' or 'layer.conf' to avoid build error:
BB_DANGLINGAPPENDS_WARNONLY =3D "1"

Signed-off-by: Kevin Zhang <kevin.zhang3@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 ...t_misdetection_triggered_without_LFS.patch | 47 +++++++++++++++++++
 ...t_misdetection_triggered_without_LFS.patch |  0
 ...t_misdetection_triggered_without_LFS.patch | 46 ++++++++++++++++++
 recipes-tweaks/busybox/busybox_%.bbappend     |  1 -
 .../busybox/busybox_1.31.%.bbappend           |  7 +++
 .../busybox/busybox_1.32.%.bbappend           |  7 +++
 .../busybox/busybox_1.33.%.bbappend           |  7 +++
 7 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 recipes-tweaks/busybox/busybox-1.31.%/z300-fix_off_t_mi=
sdetection_triggered_without_LFS.patch
 rename recipes-tweaks/busybox/{busybox =3D> busybox-1.32.%}/z300-fix_off_t=
_misdetection_triggered_without_LFS.patch (100%)
 create mode 100644 recipes-tweaks/busybox/busybox-1.33.%/z300-fix_off_t_mi=
sdetection_triggered_without_LFS.patch
 create mode 100644 recipes-tweaks/busybox/busybox_1.31.%.bbappend
 create mode 100644 recipes-tweaks/busybox/busybox_1.32.%.bbappend
 create mode 100644 recipes-tweaks/busybox/busybox_1.33.%.bbappend

diff --git a/recipes-tweaks/busybox/busybox-1.31.%/z300-fix_off_t_misdetect=
ion_triggered_without_LFS.patch b/recipes-tweaks/busybox/busybox-1.31.%/z30=
0-fix_off_t_misdetection_triggered_without_LFS.patch
new file mode 100644
index 0000000..8716d1a
--- /dev/null
+++ b/recipes-tweaks/busybox/busybox-1.31.%/z300-fix_off_t_misdetection_tri=
ggered_without_LFS.patch
@@ -0,0 +1,47 @@
+Author: Daniel F. Dickinson <cshored@thecshore.com>
+Date:   Tue Jan 16 03:06:33 2018 -0500
+
+    busybox: Fix compilation for musl on 32-bit archs
+
+    At least with core-image-minimal busybox triggers the recently
+    added off_t misdetection alert even when LFS is not enabled;
+    this is due to a bug in busybox handling of the case...this
+    patch should get upstremed.
+
+    Signed-off-by: Daniel F. Dickinson <cshored@thecshore.com>
+Index: busybox-1.24.1/include/libbb.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- busybox-1.24.1.orig/include/libbb.h
++++ busybox-1.24.1/include/libbb.h
+@@ -252,6 +252,14 @@ typedef unsigned long long uoff_t;
+ #  define STRTOOFF strtoull
+ #  define OFF_FMT "ll"
+ # endif
++/* scary. better ideas? (but do *test* them first!) */
++#define OFF_T_MAX  ((off_t)~((off_t)1 << (sizeof(off_t)*8-1)))
++/* Users report bionic to use 32-bit off_t even if LARGEFILE support is r=
equested.
++ * We misdetected that. Don't let it build:
++ */
++struct BUG_off_t_size_is_misdetected {
++	char BUG_off_t_size_is_misdetected[sizeof(off_t) =3D=3D sizeof(uoff_t) ?=
 1 : -1];
++};
+ #else
+ /* CONFIG_LFS is off */
+ # if UINT_MAX =3D=3D 0xffffffff
+@@ -269,15 +277,8 @@ typedef unsigned long uoff_t;
+ #  define STRTOOFF strtol
+ #  define OFF_FMT "l"
+ # endif
++#define OFF_T_MAX UINT_MAX
+ #endif
+-/* scary. better ideas? (but do *test* them first!) */
+-#define OFF_T_MAX  ((off_t)~((off_t)1 << (sizeof(off_t)*8-1)))
+-/* Users report bionic to use 32-bit off_t even if LARGEFILE support is r=
equested.
+- * We misdetected that. Don't let it build:
+- */
+-struct BUG_off_t_size_is_misdetected {
+-	char BUG_off_t_size_is_misdetected[sizeof(off_t) =3D=3D sizeof(uoff_t) ?=
 1 : -1];
+-};
+=20
+ /* Some useful definitions */
+ #undef FALSE
diff --git a/recipes-tweaks/busybox/busybox/z300-fix_off_t_misdetection_tri=
ggered_without_LFS.patch b/recipes-tweaks/busybox/busybox-1.32.%/z300-fix_o=
ff_t_misdetection_triggered_without_LFS.patch
similarity index 100%
rename from recipes-tweaks/busybox/busybox/z300-fix_off_t_misdetection_trig=
gered_without_LFS.patch
rename to recipes-tweaks/busybox/busybox-1.32.%/z300-fix_off_t_misdetection=
_triggered_without_LFS.patch
diff --git a/recipes-tweaks/busybox/busybox-1.33.%/z300-fix_off_t_misdetect=
ion_triggered_without_LFS.patch b/recipes-tweaks/busybox/busybox-1.33.%/z30=
0-fix_off_t_misdetection_triggered_without_LFS.patch
new file mode 100644
index 0000000..239c22f
--- /dev/null
+++ b/recipes-tweaks/busybox/busybox-1.33.%/z300-fix_off_t_misdetection_tri=
ggered_without_LFS.patch
@@ -0,0 +1,46 @@
+Author: Daniel F. Dickinson <cshored@thecshore.com>
+Date:   Tue Jan 16 03:06:33 2018 -0500
+
+    busybox: Fix compilation for musl on 32-bit archs
+
+    At least with core-image-minimal busybox triggers the recently
+    added off_t misdetection alert even when LFS is not enabled;
+    this is due to a bug in busybox handling of the case...this
+    patch should get upstremed.
+
+    Signed-off-by: Daniel F. Dickinson <cshored@thecshore.com>
+--- a/include/libbb.h
++++ b/include/libbb.h
+@@ -277,6 +277,14 @@ typedef unsigned long long uoff_t;
+ #  define STRTOOFF strtoull
+ #  define OFF_FMT "ll"
+ # endif
++/* scary. better ideas? (but do *test* them first!) */
++#define OFF_T_MAX  ((off_t)~((off_t)1 << (sizeof(off_t)*8-1)))
++/* Users report bionic to use 32-bit off_t even if LARGEFILE support is r=
equested.
++ * We misdetected that. Don't let it build:
++ */
++struct BUG_off_t_size_is_misdetected {
++	char BUG_off_t_size_is_misdetected[sizeof(off_t) =3D=3D sizeof(uoff_t) ?=
 1 : -1];
++};
+ #else
+ /* CONFIG_LFS is off */
+ # if UINT_MAX =3D=3D 0xffffffff
+@@ -294,16 +302,8 @@ typedef unsigned long uoff_t;
+ #  define STRTOOFF strtol
+ #  define OFF_FMT "l"
+ # endif
++#define OFF_T_MAX UINT_MAX
+ #endif
+-/* scary. better ideas? (but do *test* them first!) */
+-#define OFF_T_MAX  ((off_t)~((off_t)1 << (sizeof(off_t)*8-1)))
+-/* Users report bionic to use 32-bit off_t even if LARGEFILE support is r=
equested.
+- * On musl, !ENABLE_LFS on 32-bit arches thinks that off_t is 32-bit.
+- * We misdetected that. Don't let it build:
+- */
+-struct BUG_off_t_size_is_misdetected {
+-	char BUG_off_t_size_is_misdetected[sizeof(off_t) =3D=3D sizeof(uoff_t) ?=
 1 : -1];
+-};
+=20
+ /* Some useful definitions */
+ #undef FALSE
diff --git a/recipes-tweaks/busybox/busybox_%.bbappend b/recipes-tweaks/bus=
ybox/busybox_%.bbappend
index 81ebc1f..c78250d 100644
--- a/recipes-tweaks/busybox/busybox_%.bbappend
+++ b/recipes-tweaks/busybox/busybox_%.bbappend
@@ -12,7 +12,6 @@ SRC_URI +=3D "\
     file://fragment-lock.cfg \
     ${@bb.utils.contains('PACKAGECONFIG', 'oeoveropenwrt', '', 'file://fra=
gment-noifupdown.cfg', d)} \
     file://220-add_lock_util.patch \
-    file://z300-fix_off_t_misdetection_triggered_without_LFS.patch \
 "
=20
 do_install_append () {
diff --git a/recipes-tweaks/busybox/busybox_1.31.%.bbappend b/recipes-tweak=
s/busybox/busybox_1.31.%.bbappend
new file mode 100644
index 0000000..450f7ac
--- /dev/null
+++ b/recipes-tweaks/busybox/busybox_1.31.%.bbappend
@@ -0,0 +1,7 @@
+# SPDX-FileCopyrightText: 2021 Bosch Sicherheitssysteme GmbH
+#
+# SPDX-License-Identifier: MIT
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-${PV}:"
+
+SRC_URI +=3D "file://z300-fix_off_t_misdetection_triggered_without_LFS.pat=
ch"
diff --git a/recipes-tweaks/busybox/busybox_1.32.%.bbappend b/recipes-tweak=
s/busybox/busybox_1.32.%.bbappend
new file mode 100644
index 0000000..450f7ac
--- /dev/null
+++ b/recipes-tweaks/busybox/busybox_1.32.%.bbappend
@@ -0,0 +1,7 @@
+# SPDX-FileCopyrightText: 2021 Bosch Sicherheitssysteme GmbH
+#
+# SPDX-License-Identifier: MIT
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-${PV}:"
+
+SRC_URI +=3D "file://z300-fix_off_t_misdetection_triggered_without_LFS.pat=
ch"
diff --git a/recipes-tweaks/busybox/busybox_1.33.%.bbappend b/recipes-tweak=
s/busybox/busybox_1.33.%.bbappend
new file mode 100644
index 0000000..450f7ac
--- /dev/null
+++ b/recipes-tweaks/busybox/busybox_1.33.%.bbappend
@@ -0,0 +1,7 @@
+# SPDX-FileCopyrightText: 2021 Bosch Sicherheitssysteme GmbH
+#
+# SPDX-License-Identifier: MIT
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-${PV}:"
+
+SRC_URI +=3D "file://z300-fix_off_t_misdetection_triggered_without_LFS.pat=
ch"
--=20
2.25.1

