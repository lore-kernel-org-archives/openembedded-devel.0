Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B84FCC9A4
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 23:36:20 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28572.1773099372412467910
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 16:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hX7z9It2;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.43, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4AJKJShcSLgsohRKZLVgrvREGNzSFOM772Abs9hSN/9c1ekiLWjO2+nrtloqWzYIGf3nIY4a0RZ6Mkdy9obHdzu+kG0PXoygcJm5hnGB1Jpx7bG+dYB5kzzY3hnWAQ8SpOGI9FHMWXJ+E78VuM+UhYo9T4J1Cgir4VGWNBAmj6POo2nZiSiDkOu2wqKgaSGcb3Xf4ntUG6kq0klxx6AcEp+IsnfcKtM2dbaOxET12/t++dO/3FigInLwQkdp7heADq+HUerC/P8Ceh3gErf/4yNDaCy4jnxJiLugYKyxT4bqWNj1hkrOdssyCfETs0Ceg/wnv9nrlN92EK7UlwzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a855cokqPEM8qzwjC5te/dBpt1HLMnKIRvSncvTUDw=;
 b=Ucb4pI29UQ5Fo3pbo0TGDEnGMOcJzZ3zXR2PVGp3HIsZtj1MJzUM1q0rTgc79eoBKPX6PzZ72IXRzv0VHSAt5KGaeSCWhrL6df9yq1MjeMFyoHHmPw1Xei7WFuk7BlRO8ZCXnz1Uzk8CS4OBzC6ohTBfWK/XNydaNsMShJTWbH78/muf00z0dEpIt1Bz44z7n2V59X/h6p/VaIpkgIpjFBL0INjpSHnIFv1WjXy8xBoxAgxG++OQLqz1nlNDAVgrVNm4l++3pwTPNM9GWt0JS/lFdXchKTTeJolq0fjNSQmGUcKPfdmsRP/n9Zgz5sS22xTNitUMC2BYfng4azJIng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5a855cokqPEM8qzwjC5te/dBpt1HLMnKIRvSncvTUDw=;
 b=hX7z9It2+CPvd9yoG/7iVS7UZm9c3NqS1XBhRwkQyzcaZNwu4hdyQZTuMhnnzcrFag2dTWDerWmWbGASOrmwt8q3Bhlv2aIVuI27Ltq8bjallWhQYi+HW+sVOLI/Se6bqo1kreVSyJV3KKfibH3XeNb7EPKmumLecQr8nHQJJ+w=
Received: from DS0PR17CA0004.namprd17.prod.outlook.com (2603:10b6:8:191::12)
 by PH3PPFF6F1F7CB1.namprd10.prod.outlook.com (2603:10b6:518:1::7d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 23:36:09 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::90) by DS0PR17CA0004.outlook.office365.com
 (2603:10b6:8:191::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.28 via Frontend Transport; Mon,
 9 Mar 2026 23:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 23:36:08 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 18:36:08 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 18:36:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 18:36:07 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629Na7wL1474967;
	Mon, 9 Mar 2026 18:36:07 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <yoann.congal@smile.fr>, <alexandre.truong@smile.fr>
CC: <Openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH] xscreensaver: move to template and update for emptty
Date: Mon, 9 Mar 2026 18:34:52 -0500
Message-ID: <20260309233451.1995625-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|PH3PPFF6F1F7CB1:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf78a55-8255-42b6-2923-08de7e34a3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	QuosoItoGYFvnStdykTC4qKLPgyBpCOoORHz6wikgsfbn5d2IcKBmRI+b8HAI0peKyB69/jaWSm6lORCAtSMOl7K13Cz3EsdpnNFbgtSTEiPwehjtqHOavCgTsU8ysrK7ENiKoNFh/7HoBl7Q8N2vtINhu7kNRFcjPMG/XR/rXoqp6gMEKnaTH72Tn/cxz+M/fY0DtiQD4rxFCFsU1iA02CjwgNhG7UkGGrAB4pCslYCHI73sOBlfeUd3ayFp2tsBY6Oi3Pi9vBnsydE6QXc69Obez+cjtiZ7u9mLm5Z8L8lbJcmyBlD6QO/ZlBIW4K3UII1rxv3CZQ1OVEu4chBmS7/s7A1Rnrl3iQMMg70D1tZ0r5gTIyp5QO3QXqOGr/cmU4rV4xy0V7Ft6g1lXavraXeVHEQ23Ws1sExnzZfwJhAlh8BjKM0cn9LtO0Hs2fACcv3CSh1CtykL19P5YqmY03rAZlnJ20u+7Lt7aQb5XS2ebhtx0D3u2BT5jU2DbScAYMkeEIlsE0KeywuvH+YaT83iSa8n4wHb7MUh6eGG7JbcDtKQ4a2LgxIlsrLbA0s6rpNWR08KpVe25Icb1qYa951LnbBVKGr64iGl7zvgJ0oA7Hj5Ur/al7Y9QzliKfjzQ095GvFle8uDYaiheWu45JdHl6OwyTw1sUDHrRelmxpHwOPRmawm3nxTVaCQdK8HF0EGUY5s4l0T+Et6q0TR3CeHPRRkirmnD8W5FnPGns=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7scMhXERZDe1Dnf05VZunDn5deTRk0y39pvb1yyCx25apRiyKCv5gPB/iqyo3/qOa7D6gdML0QSTLj7aCavNhTZRPRyi1YR47SUiq2+SWR0LAZBuKGhzR4lKAmv5Kk13ZmY1JKEsjBaJTSHXZOeMNkQfvPFbxo8sMSsJtkUelrY73dzmZgIWf8OBtoDpmt1muNTSLtgKlK36alCKwnSTSC4JylxHqnSqa0r8utkqnOQxmQEZ+Hd+JXOhj3djD8M+fhkYpTw7U2TXhDqu/BDyFtWWmBCR8W3yyyVUjIpnbDJtFw1OLolY8H1bxymbNaPV/qyxeQpbEdjVksU5fZBEY2DHrB9zjto7wpgrJ9DhAvR7HQe5wvie/tXOBCnzAzqMb7LLfSUG65jM4dM5Pm/N1as+eUF4oaWKHqwteJoMnPyA4q5ly5bPLHGaUSKgvAZp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 23:36:08.6301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf78a55-8255-42b6-2923-08de7e34a3fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF6F1F7CB1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 23:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125012

From: Randolph Sapp <rs@ti.com>

Emptty is a new display manager that couples the user accounts with the
configuration profiles as a requirement moving forward. As such,
dependencies need to be updated in this recipe to ensure the xuser
account and session are present.

Previously the systemd service would wait for the session despite the
recipe only explicitly requiring the xuser-account. This fixes that
issue and also makes the service a template, allowing multiple instances
to be started for specific users.

Long term this should be migrated to use graphical-session.target [1],
but that requires a little more setup on the core side of things.

[1] https://systemd.io/DESKTOP_ENVIRONMENTS/

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Sending this now that emptty has been picked up on oe-core's master-next br=
anch.

 .../xscreensaver/files/xscreensaver.service        | 14 --------------
 .../xscreensaver/files/xscreensaver@.service       | 11 +++++++++++
 .../xscreensaver/xscreensaver_6.04.bb              | 14 +++++++++-----
 3 files changed, 20 insertions(+), 19 deletions(-)
 delete mode 100755 meta-oe/recipes-graphics/xscreensaver/files/xscreensave=
r.service
 create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/xscreensave=
r@.service

diff --git a/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.servi=
ce b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
deleted file mode 100755
index 17dfe75ef1..0000000000
--- a/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=3DXscreensaver service
-PartOf=3Dxserver-nodm.service
-After=3Dxserver-nodm.service
-
-[Service]
-ExecStart=3D/usr/bin/xscreensaver
-Environment=3D"DISPLAY=3D:0"
-User=3Dxuser
-Restart=3Dalways
-RestartSec=3D1
-
-[Install]
-WantedBy=3Dmulti-user.target
diff --git a/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver@.serv=
ice b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver@.service
new file mode 100644
index 0000000000..d63f0f9019
--- /dev/null
+++ b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver@.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=3DXscreensaver service for %I
+
+[Service]
+ExecStart=3D/usr/bin/xscreensaver
+User=3D%I
+Restart=3Dalways
+RestartSec=3D1
+
+[Install]
+WantedBy=3Ddefault.target
diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb b/m=
eta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
index 073b3f0912..69c71f2e67 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
@@ -4,7 +4,7 @@ LICENSE =3D "0BSD"
 LIC_FILES_CHKSUM =3D "file://driver/xscreensaver.h;endline=3D10;md5=3Dc3ce=
41cdff745eb1dc9d4fcfbffb4d51"
=20
 SRC_URI =3D "https://www.jwz.org/${BPN}/${BP}.tar.gz \
-    file://xscreensaver.service \
+    file://xscreensaver@.service \
     file://0001-Tweak-app-defaults.patch \
     file://0002-build-Do-not-build-po-files.patch \
     file://0001-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch=
 \
@@ -19,7 +19,7 @@ DEPENDS =3D "intltool-native libx11 libxext libxt libxft =
libxi glib-2.0-native bc-
 # These are only needed as part of the stopgap screensaver implementation:
 RDEPENDS:${PN} =3D " \
     liberation-fonts \
-    xuser-account \
+    xserver-nodm-init \
 "
=20
 inherit systemd perlnative pkgconfig gettext autotools-brokensep features_=
check
@@ -40,7 +40,7 @@ CONFIGUREOPTS:remove =3D "--disable-silent-rules --disabl=
e-dependency-tracking"
 EXTRA_OECONF:remove =3D "--disable-static"
=20
 do_install:append() {
-    install -D ${UNPACKDIR}/xscreensaver.service ${D}${systemd_unitdir}/sy=
stem/xscreensaver.service
+    install -D ${UNPACKDIR}/xscreensaver@.service ${D}${systemd_unitdir}/s=
ystem/xscreensaver@.service
     for f in xscreensaver-getimage-file xscreensaver-getimage-video webcol=
lage xscreensaver-text vidwhacker
     do
         sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native/perl|/usr/bin/pe=
rl|g" ${D}/${libexecdir}/${PN}/$f
@@ -56,8 +56,12 @@ FILES:${PN}-perl =3D "\
     ${libexecdir}/${PN}/xscreensaver-text \
     ${libexecdir}/${PN}/vidwhacker \
     "
-FILES:${PN} +=3D "${datadir}/X11/app-defaults/XScreenSaver ${datadir}/font=
s"
-SYSTEMD_SERVICE:${PN} =3D "xscreensaver.service"
+FILES:${PN} +=3D "\
+    ${systemd_unitdir}/system/xscreensaver@.service \
+    ${datadir}/X11/app-defaults/XScreenSaver \
+    ${datadir}/fonts \
+    "
+SYSTEMD_SERVICE:${PN} =3D "xscreensaver@xuser.service"
=20
 RDEPENDS:${PN}-perl =3D "perl"
=20
--=20
2.53.0


