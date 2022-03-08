Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05829C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 15:18:34 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.109])
 by mx.groups.io with SMTP id smtpd.web08.8963.1646752710173864474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:18:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Nbyz8jGG;
 spf=pass (domain: arri.de, ip: 40.107.7.109, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzZYktC0kPQgA1x6t5IUuWxWDiESkW6dMoQ6CJqkwNIbDfb3bu5L0a2NJZiMxfkNMCLcGPGh44bfMpr64lCOqOLMkGqKjXrQH5OSXm0GM5vV+T8LSysLvFuT2wRUbNNjIL+4ADbEDEvVJFzf1+zpZq3c+uDOQOKWzstSYCFZnIX/b3gIdB/RR0SW2XGy2+gl4lGcOg+krkOWlsEr0cQoxnpC4x3qUoyaoXyuG72mi1aFZ+oyqZAUtW0fkIxThdQjlZ/6N5D2HvX1k9nZYRVGBiFKN6Y9vBoQ4S2rbS30zebFLWA0sniJHyJzlrOoSOsxnrkSlFWpOjoQL/ZzdEolsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3enGJT4FHtL1aqgwV2qxgEdgsFwzvly9imLE0nBlSc=;
 b=NDWjruOx9HTMACSO2xAG6bsfYNdWxzbjZAO+we82jZ7jkl71dkuspjakdHz5Q/hyV4cUJ7rIzynnUXD0GaDDXrjOXRqSNX3FPaTCeDFrG1qVMBvdQSnoAoZ8XKT35qLCoprhuOERYZ39J1PFNWfHAjiEDB6foAkd3Epz/MMSKgirYBpOMIF+gm/a9nNXgFTSrgUnNymNLrjcGZst0GKv3WRVhRSssuFVSDh8pcZpv6XvuBewlDnl9oGsLV4GUcvNf5/KVcr3HnVKSMuzCrtqWoFyrye06nDz/OB8gJhG0GbvCPK/XOHM9KIfuoiw0+354Cz3DNwy/8xOKfw66PUBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3enGJT4FHtL1aqgwV2qxgEdgsFwzvly9imLE0nBlSc=;
 b=Nbyz8jGGNQtKsFqGKyEjq8pRXXVmTxxq59f9XpnEL8VdE9jB2glG3WtpX2wgKLG3Du6Aycp+Io5UU/0TCKnRmdOKCdxbL98SRtb3sygwJB1XquVhsAwLiUpKXtnprmsuVzI6PDv6y9t5HIQzNXlf8pCc7ghePBoIhl3gJxhmmq4=
Received: from AS8PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:20b:451::27)
 by DB6PR07MB4216.eurprd07.prod.outlook.com (2603:10a6:6:55::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.8; Tue, 8 Mar
 2022 15:18:26 +0000
Received: from AM5EUR02FT043.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::a) by AS8PR07CA0006.outlook.office365.com
 (2603:10a6:20b:451::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.17 via Frontend
 Transport; Tue, 8 Mar 2022 15:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT043.mail.protection.outlook.com (10.152.9.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 15:18:26 +0000
Received: from localhost.de (192.168.55.85) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 16:18:25 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] libiio: update to version 0.23
Date: Tue, 8 Mar 2022 16:18:02 +0100
Message-ID: <20220308151802.24837-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.55.85]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d34f41d-9870-438b-14c0-08da0116e4a0
X-MS-TrafficTypeDiagnostic: DB6PR07MB4216:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR07MB42162C275B805EA22A479468BF099@DB6PR07MB4216.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cFfx3RX2XH0iu7R+qDFjlA6JsB2aPm3lYNilMsL7X1cZzsba3MJ8Gd5qCTHfvMhxbwUiH2Nu2AW/DIYtkaCfuXEUCfLJ80SXU8Go9rXRt/QqKu2sCZdb9MLQUugjVoN+60sf38IdZHf6a4L7vP5cmZ9OZZfk8jEopc1F3VbyS1TnQKkAhKZtywBQoFOT/4iZ3WoHb9tq8qR1scgMtXfblGWcvaOYEP9J+za5YZbrx8gV0siaXayKZKzccDKaJbs8coEJv/sGbMclL6nJjyLtxHkXWo2k6EaHpvQDVZ/rYK1cjfmpY326RI+RIFfSW1/fBajf9tS+XtXFO1/jq8Rt26rYNoXw2qpafWHQwy5WDt+8eCKI6M6yZTztqRT1a4N9dt1fIBaXflyeuRzxIB5WVsnOn3DZ1cj+0vPV59q4wKh1EAfTqn3572OEp5tEsCX09UHHcbzc/ryrHMfMYshl6Uon9BTLsKFlx/zoB0Kb+kl7Ndyt23/U/Zxf+f0OBJFBT9YbgkvNnNw3cnz8U8PRBybTuLG5jaKrsRz2/Okea42ltjXh2RLeuT0vVzC6QMQEkLLYxhixrH7DzsnhOurFbH1Xne9+UJRKWkEodU7b6Um4VnX2vwc+JSz5MDVO2zA/14RLTSallsmFx0GSvgSdZnfIpQSs7IDRPSP3xmsVx4Y7Uku+ENx64IApd6DqigyW
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(1076003)(47076005)(336012)(426003)(316002)(8676002)(6916009)(508600001)(107886003)(2616005)(4326008)(70206006)(70586007)(186003)(36756003)(36860700001)(16526019)(26005)(83380400001)(6666004)(15650500001)(5660300002)(356005)(86362001)(2906002)(82310400004)(8936002)(81166007)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:18:26.2482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d34f41d-9870-438b-14c0-08da0116e4a0
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT043.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR07MB4216
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 15:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95882

- drop 0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
  (integrated upstream)
- new PACKAGECONFIG "xml_backend" (WITH_XML_BACKEND=3Doff must be
  explicitly provided if libxml2 is not available)
- new PACKAGECONFIG "dnssd" (HAVE_DNS_SD=3Doff must be explicitly provided
  if libavahi is not available)
- python library has been renamed (libiio --> pylibiio)

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 ...rify-whether-libiio-is-installed-whe.patch | 34 -------------------
 meta-oe/recipes-support/libiio/libiio_git.bb  | 21 ++++++------
 2 files changed, 10 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libiio/files/0001-python-Do-not=
-verify-whether-libiio-is-installed-whe.patch

diff --git a/meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify=
-whether-libiio-is-installed-whe.patch b/meta-oe/recipes-support/libiio/fil=
es/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
deleted file mode 100644
index 4d3dcd5cedd4..000000000000
--- a/meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whethe=
r-libiio-is-installed-whe.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 717b0f46b23ddc042da481d1d446bdd1c6c49142 Mon Sep 17 00:00:00 2001
-From: Julien Malik <julien.malik@unseenlabs.fr>
-Date: Mon, 27 Jul 2020 14:34:44 +0200
-Subject: [PATCH] python: Do not verify whether libiio is installed when
- cross-compiling
-
-This should fix #561
-
-Signed-off-by: Julien Malik <julien.malik@paraiso.me>
----
- bindings/python/setup.py.cmakein | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/bindings/python/setup.py.cmakein b/bindings/python/setup.py.c=
makein
-index cd14e2e..96d58a8 100644
---- a/bindings/python/setup.py.cmakein
-+++ b/bindings/python/setup.py.cmakein
-@@ -54,6 +54,13 @@ class InstallWrapper(install):
-         install.run(self)
-=20
-     def _check_libiio_installed(self):
-+        cross_compiling =3D ("${CMAKE_CROSSCOMPILING}" =3D=3D "TRUE")
-+        if cross_compiling:
-+            # When cross-compiling, we generally cannot dlopen
-+            # the libiio shared lib from the build platform.
-+            # Simply skip this check in that case.
-+            return
-+
-         from platform import system as _system
-         from ctypes import CDLL as _cdll
-         from ctypes.util import find_library
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes=
-support/libiio/libiio_git.bb
index 2c22838bbf21..918ab277481c 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,12 +4,10 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376cea0ce68d2d2da0a1b=
3a72c"
=20
-SRCREV =3D "565bf68eccfdbbf22cf5cb6d792e23de564665c7"
-PV =3D "0.21+git${SRCPV}"
+SRCREV =3D "92d6a35f3d8d721cda7d6fe664b435311dd368b4"
+PV =3D "0.23"
=20
-SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhttps=
;branch=3Dmaster \
-           file://0001-python-Do-not-verify-whether-libiio-is-installed-wh=
e.patch \
-"
+SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhttps=
;branch=3Dmaster"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 S =3D "${WORKDIR}/git"
@@ -28,16 +26,16 @@ EXTRA_OECMAKE =3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=3DO=
N -DSYSTEMD_UNIT_INSTALL_DIR=3D${systemd_system_unitdir}', '', d)} \
 "
=20
-PACKAGECONFIG ??=3D "usb_backend network_backend serial_backend"
-
-NETWORK_BACKEND_DEPENDENCIES =3D "\
-    libxml2 \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
+PACKAGECONFIG ??=3D " \
+    usb_backend network_backend serial_backend xml_backend \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'dnssd', '', d)} \
 "
=20
 PACKAGECONFIG[usb_backend] =3D "-DWITH_USB_BACKEND=3DON,-DWITH_USB_BACKEND=
=3DOFF,libusb1 libxml2"
-PACKAGECONFIG[network_backend] =3D "-DWITH_NETWORK_BACKEND=3DON,-DWITH_NET=
WORK_BACKEND=3DOFF, ${NETWORK_BACKEND_DEPENDENCIES}"
+PACKAGECONFIG[network_backend] =3D "-DWITH_NETWORK_BACKEND=3DON,-DWITH_NET=
WORK_BACKEND=3DOFF,libxml2"
 PACKAGECONFIG[serial_backend] =3D "-DWITH_SERIAL_BACKEND=3DON,-DWITH_SERIA=
L_BACKEND=3Doff,libserialport libxml2"
+PACKAGECONFIG[xml_backend] =3D "-DWITH_XML_BACKEND=3DON,-DWITH_XML_BACKEND=
=3Doff,libxml2"
+PACKAGECONFIG[dnssd] =3D "-DHAVE_DNS_SD=3DON,-DHAVE_DNS_SD=3Doff,avahi"
 PACKAGECONFIG[libiio-python3] =3D "-DPYTHON_BINDINGS=3DON,-DPYTHON_BINDING=
S=3DOFF"
=20
 PACKAGES =3D+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
@@ -70,6 +68,7 @@ do_compile() {
     cmake_do_compile
 }
=20
+PIP_INSTALL_PACKAGE =3D "pylibiio"
 do_install() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'true', 'fa=
lse', d)}; then
         setuptools3_do_install
--=20
2.34.1


