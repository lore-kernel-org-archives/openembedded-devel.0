Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA7BC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 08:53:13 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.121])
 by mx.groups.io with SMTP id smtpd.web10.3649.1646815988347271041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 00:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Mf0vYzsu;
 spf=pass (domain: arri.de, ip: 40.107.4.121, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAGA0beAt73FsPbeA+jDir8cGCsKabrO9QBU+LYAAdFBn9Z9910zzCnnXShBv7NFhODg59jj1CSk1namlMYTwwLADRpovH2EiH6mM6239iPz6aJASf6oTZzIZ4ksVzAs4zpTz4YOs5sAfq6pOCjCKp/HoDQlFYQaqlmM/dkLzrzbMX5qXbIRWYJZSN8cFl4zm7KqqS+LYcR5s2atGAIj7jMmAQahspkr1C39MW48E80ZKtrua62p5kkWGpOhbNtIEZEfEj/bZCCbycPdYyWyBokD2GG5+Mqjkrzulh14K5vPrVq5T6dA57d5/TZCnYXNiLRND/zDm1QXzynOULDFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dm5qByR7LCYbqFC3wyBEUhm+T7cnMGDAs/WRoYINCRc=;
 b=Ty+JrCXzJejzHjw6GtHZoDpnsUkcJd13pt2qQpPI2VKfATpLKGPusc0JwqiTPsTMB8sRrFORHbSQugvSMfy7v9MUygTJlDroD+GuK8uM+MaUCsJ+IerCrf+AxN0w7C6Cahh9MlMPFlSlxllR6tT61z0nLyWT/E3Q234as4pGbgqiznPKwyRQm2LVf2JrQ/F3O4cGIl75EuCdp0RXRffNBCdgzVsgM7dtyxFyAriqDQ39D41X+bdfcDk3/arQl8NSUFEct4Vxe1q6d7XSFxPDJp9iqMV70Dsg62oBw3HIw2aFLUtXyED+mZoIuwGG7vVTCj/aPeRA7VewUYBbNm+Vqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dm5qByR7LCYbqFC3wyBEUhm+T7cnMGDAs/WRoYINCRc=;
 b=Mf0vYzsuRE7GMlMPAYiWVhMRDS5DCvSw6h4ogPB6H/h6fO1tYG+NOzzxKogrl0T5MyievEet43VjZF2eAlgAku6bvZTu2uGkI/1cY6ddHOkjcE42HFOkRqHipABaQyEHs8vLc0xCjRGzojLWwcA5krp3u/mrMrx4Le/EQ1RdLNw=
Received: from AM7PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:20b:100::30)
 by PR3PR07MB8259.eurprd07.prod.outlook.com (2603:10a6:102:17a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.7; Wed, 9 Mar
 2022 08:53:04 +0000
Received: from VE1EUR02FT053.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::13) by AM7PR02CA0020.outlook.office365.com
 (2603:10a6:20b:100::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Wed, 9 Mar 2022 08:53:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT053.mail.protection.outlook.com (10.152.13.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Wed, 9 Mar 2022 08:53:04 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.55.52) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Mar
 2022 09:53:03 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH v2] libiio: update to version 0.23
Date: Wed, 9 Mar 2022 09:52:51 +0100
Message-ID: <20220309085251.25969-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.55.52]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b2afa3e-5e86-41cb-0bc7-08da01aa392c
X-MS-TrafficTypeDiagnostic: PR3PR07MB8259:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR07MB8259A0934B35DEB51DF41045BF0A9@PR3PR07MB8259.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y2+e5xiZsi5ywk4MVDrFi52w5lzER7znd4nu4CJvRz8xyS5ynNHpz022zi9kv01JfGZC4EDAk4qp1QHUXgCE2T1pbJAHJAhsaMntcO02u72wMcrPFTovfoTyxQYRO1vOL7Vx2bTgqp/PQtOahD/bj86gD3FbMgOhDKB9JPu4ep+pfjtBij9XUOiTm+oxVs8OMQw4yjsOdlcgQGyn0kWPUj+/VU16I/q6eR4+KLlTS2Z5TAzBaJ4e+Ir2pncqYl7la9ViX+FQHavouU/JhPktX0Jr0v9DGSefCUVCtX7OILbwt2ZqyfwLWzSPdvdKQYhxRXAbNzIqaEnfjQ4d6ZcjZd1pXUCHuxNRlA4/N9Jehq4fFVB38gVlFxdsEeiMMlIMcI5JXJboYy1FxDiEEeFII0Hbn5UI6R+OvwWC1gUDf88jgG/b+ALbUWK2pZw0zgnO14KBUZ5O8UcOk/t+unqYYK5Ut01awme6uonf5NCeZm9KMWiyLvKaS47dLp9yNIMNEG+OC+4rtpDOTwrhZLBlkTD/nCx3CZhEyCT0pnWfTD3TELInnBAtr0EgfAPmr5sTvDCG+oUDQgcM2J6kzCRspmxrvFBq7pACku/iCs510dJo3+hwjDCkrAsQCEQ3QovtZTAG8igbOQGorS2qSUOpBaDNKiTUq6PARfbzhX3c94JbIsOlf5Z7LbaX62YZI6hmIq+5JOsBBt9iJNSWhthZvTmXv4N0P9/JkzPAkW7Sv2S33quFOWCPEA7mh6Ctrxo2ZlMQ3QiryeO7G4Yx2WGHqgv4FRgHkRhqzO0Cz4l3U/8=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70586007)(8936002)(70206006)(1076003)(336012)(8676002)(4326008)(2616005)(81166007)(47076005)(36860700001)(107886003)(36756003)(83380400001)(356005)(82310400004)(6916009)(508600001)(966005)(16526019)(26005)(186003)(6666004)(5660300002)(15650500001)(86362001)(2906002)(316002)(40460700003)(426003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 08:53:04.1133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b2afa3e-5e86-41cb-0bc7-08da01aa392c
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT053.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB8259
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 08:53:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95897

- drop 0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
  (integrated upstream)
- new PACKAGECONFIG "xml_backend" (WITH_XML_BACKEND=3Doff must be
explicitly provided if libxml2 is not available)
- new PACKAGECONFIG "dnssd" (HAVE_DNS_SD=3Doff must be explicitly provided
if libavahi is not available)
- python library has been renamed (libiio --> pylibiio)

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
Changes in v2:
--------------
- added 0001-CMake-Move-include-CheckCSourceCompiles-before-its-m.patch (ta=
ken
  from upstream)
- PACKAGECONFIG: don't disable xml_backend if either network_backend,
  serial_backend or usb_backend is enabled.

On Wednesday, 9 March 2022, 02:33:02 CET, Khem Raj wrote:
> this fails to configure see
>=20
> https://errors.yoctoproject.org/Errors/Details/651289/
>=20
> I think you need a patch something on these lines
>=20
>   diff --git a/CMakeLists.txt b/CMakeLists.txt
>  index 91db382a..eed83a46 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
>  @@ -291,7 +291,7 @@ if (WITH_ZSTD)
>   endif (WITH_ZSTD)
>=20
>   include_directories(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_=
DIR})
>  -
>  +include(CheckCSourceCompiles)
>   if(WITH_NETWORK_BACKEND)
>      message(STATUS "Building with Network back end support")
>      if (WIN32)
>=20
>=20
> Try it out and test and resend if it fixes the problem.
Although I understand the problem, I am not able to reproduce it. So need
please test again on your CI for this.

regards,
Christian

 ...rify-whether-libiio-is-installed-whe.patch | 34 -----------------
 ...de-CheckCSourceCompiles-before-its-m.patch | 38 +++++++++++++++++++
 meta-oe/recipes-support/libiio/libiio_git.bb  | 26 +++++++------
 3 files changed, 53 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libiio/files/0001-python-Do-not=
-verify-whether-libiio-is-installed-whe.patch
 create mode 100644 meta-oe/recipes-support/libiio/libiio/0001-CMake-Move-i=
nclude-CheckCSourceCompiles-before-its-m.patch

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
diff --git a/meta-oe/recipes-support/libiio/libiio/0001-CMake-Move-include-=
CheckCSourceCompiles-before-its-m.patch b/meta-oe/recipes-support/libiio/li=
biio/0001-CMake-Move-include-CheckCSourceCompiles-before-its-m.patch
new file mode 100644
index 000000000000..a2cfd47f1809
--- /dev/null
+++ b/meta-oe/recipes-support/libiio/libiio/0001-CMake-Move-include-CheckCS=
ourceCompiles-before-its-m.patch
@@ -0,0 +1,38 @@
+From 758ba58c81273d9075a539216f8a322935c2e434 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul@crapouillou.net>
+Date: Fri, 12 Nov 2021 16:49:21 +0000
+Subject: [PATCH] CMake: Move include(CheckCSourceCompiles) before its macr=
os
+ are used
+
+Move include(CheckCSourceCompiles) before any of the
+check_c_source_compiles() macros is called.
+
+This fixes a CMake error when compiling with WITH_NETWORK_GET_BUFFER
+disabled.
+
+Upstream-Status: Accepted [https://github.com/analogdevicesinc/libiio/comm=
it/758ba58c81273d9075a539216f8a322935c2e434]
+
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7437136c8210..05b4feff233b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -296,9 +296,10 @@ if(WITH_NETWORK_BACKEND)
+ 	endif()
+=20
+ 	if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
++		include(CheckCSourceCompiles)
++
+ 		option(WITH_NETWORK_GET_BUFFER "Enable experimental zero-copy transfers=
" OFF)
+ 		if (WITH_NETWORK_GET_BUFFER)
+-			include(CheckCSourceCompiles)
+ 			check_c_source_compiles("#define _GNU_SOURCE=3D1\n#include <fcntl.h>\n=
int main(void) { return O_TMPFILE; }"
+ 				HAS_O_TMPFILE)
+=20
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes=
-support/libiio/libiio_git.bb
index 2c22838bbf21..bb253f421ab1 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,11 +4,11 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376cea0ce68d2d2da0a1b=
3a72c"
=20
-SRCREV =3D "565bf68eccfdbbf22cf5cb6d792e23de564665c7"
-PV =3D "0.21+git${SRCPV}"
+SRCREV =3D "92d6a35f3d8d721cda7d6fe664b435311dd368b4"
+PV =3D "0.23"
=20
 SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhttps=
;branch=3Dmaster \
-           file://0001-python-Do-not-verify-whether-libiio-is-installed-wh=
e.patch \
+           file://0001-CMake-Move-include-CheckCSourceCompiles-before-its-=
m.patch \
 "
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
@@ -28,16 +28,19 @@ EXTRA_OECMAKE =3D " \
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
-PACKAGECONFIG[usb_backend] =3D "-DWITH_USB_BACKEND=3DON,-DWITH_USB_BACKEND=
=3DOFF,libusb1 libxml2"
-PACKAGECONFIG[network_backend] =3D "-DWITH_NETWORK_BACKEND=3DON,-DWITH_NET=
WORK_BACKEND=3DOFF, ${NETWORK_BACKEND_DEPENDENCIES}"
-PACKAGECONFIG[serial_backend] =3D "-DWITH_SERIAL_BACKEND=3DON,-DWITH_SERIA=
L_BACKEND=3Doff,libserialport libxml2"
+# network_backend, serial_backend and usb_backend depend on xml_backend, s=
o don't switch it off
+XML_BACKEND_DISABLE =3D "${@bb.utils.contains_any('PACKAGECONFIG', 'networ=
k_backend serial_backend usb_backend', '', '-DWITH_XML_BACKEND=3Doff', d)}"
+
+PACKAGECONFIG[usb_backend] =3D "-DWITH_USB_BACKEND=3DON -DWITH_XML_BACKEND=
=3DON,-DWITH_USB_BACKEND=3DOFF,libusb1 libxml2"
+PACKAGECONFIG[network_backend] =3D "-DWITH_NETWORK_BACKEND=3DON -DWITH_XML=
_BACKEND=3DON,-DWITH_NETWORK_BACKEND=3DOFF,libxml2"
+PACKAGECONFIG[serial_backend] =3D "-DWITH_SERIAL_BACKEND=3DON -DWITH_XML_B=
ACKEND=3DON,-DWITH_SERIAL_BACKEND=3Doff,libserialport libxml2"
+PACKAGECONFIG[xml_backend] =3D "-DWITH_XML_BACKEND=3DON,${XML_BACKEND_DISA=
BLE},libxml2"
+PACKAGECONFIG[dnssd] =3D "-DHAVE_DNS_SD=3DON,-DHAVE_DNS_SD=3Doff,avahi"
 PACKAGECONFIG[libiio-python3] =3D "-DPYTHON_BINDINGS=3DON,-DPYTHON_BINDING=
S=3DOFF"
=20
 PACKAGES =3D+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
@@ -70,6 +73,7 @@ do_compile() {
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


