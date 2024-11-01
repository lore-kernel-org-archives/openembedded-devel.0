Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B60E6B278
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 13:10:05 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.36535.1730464851432361580
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 05:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: lgo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lgo@pengutronix.de>)
	id 1t6qxN-0000zt-BF; Fri, 01 Nov 2024 13:40:49 +0100
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lgo@pengutronix.de>)
	id 1t6qxM-001VrU-1Q;
	Fri, 01 Nov 2024 13:40:48 +0100
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <lgo@pengutronix.de>)
	id 1t6qxM-00AMIA-19;
	Fri, 01 Nov 2024 13:40:48 +0100
From: =?UTF-8?B?TGVvbmFyZCBHw7ZocnM=?= <l.goehrs@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
Subject: [meta-oe][PATCH] bcu: add nxp board control utilities version 1.1.100
Date: Fri,  1 Nov 2024 13:40:42 +0100
Message-Id: <20241101124042.2468698-1-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 13:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113384

The bcu command can be used to communicate with board control hardware on
NXP EVK development boards to:

  - reset / power cycle the board into a specified boot mode.
  - monitor the power consumption.
  - read / write the eeprom content.
  - measure temperatures.
  - etc.

Supported boards are e.g.:

  - i.MX8MP-EVK
  - i.MX8DXL-EVK
  - i.MX8ULP-EVK
  - i.MX93-EVK

The tool can either be built for the target architecture to control a
board from a system running Yocto (less common) or for the host
architecture to run it via `oe-run-native bcu-native bcu`.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
---
 ...akeLists-do-not-use-vendored-libcurl.patch | 38 +++++++++++++++++++
 meta-oe/recipes-support/bcu/bcu_1.1.100.bb    | 23 +++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
 create mode 100644 meta-oe/recipes-support/bcu/bcu_1.1.100.bb

diff --git a/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch b/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
new file mode 100644
index 000000000..f4c0be19b
--- /dev/null
+++ b/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
@@ -0,0 +1,38 @@
+From ef1aaeee984ab13dab5d46c73e9b207cbdf62c55 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
+Date: Wed, 20 Dec 2023 14:37:20 +0100
+Subject: [PATCH] CMakeLists: do not use vendored libcurl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [upstream ticket https://github.com/nxp-imx/bcu/issues/17]
+
+Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
+---
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3475179..bfecdb0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -17,15 +17,16 @@ pkg_check_modules(LIBFTDI REQUIRED libftdi1)
+ pkg_check_modules(LIBYAML REQUIRED yaml-0.1)
+ pkg_check_modules(LIBOPENSSL REQUIRED openssl)
+ pkg_check_modules(LIBUSB REQUIRED libusb-1.0)
++pkg_check_modules(LIBCURL REQUIRED libcurl)
+ project(bcu)
+-include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${PROJECT_SOURCE_DIR}/libftdi/src ${LIBYAML_INCLUDEDIR} ${PROJECT_SOURCE_DIR}/libcurl/include)
++include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${LIBYAML_INCLUDEDIR})
+ include_directories(${PROJECT_SOURCE_DIR})
+ 
+ message("operation system is ${CMAKE_SYSTEM}")
+ if (LINUX)
+         add_executable(bcu bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_https.c bcu_ftdi_eeprom.c)
+         link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS})
+-        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${PROJECT_SOURCE_DIR}/libcurl/build.bcu/lib/libcurl.a -lpthread -lssl -lcrypto -lm)
++        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} -lcurl -lpthread -lssl -lcrypto -lm)
+         execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR}
+                          COMMAND ${PROJECT_SOURCE_DIR}/build_libs.sh ${PROJECT_SOURCE_DIR})
+         install(TARGETS bcu DESTINATION bin)
diff --git a/meta-oe/recipes-support/bcu/bcu_1.1.100.bb b/meta-oe/recipes-support/bcu/bcu_1.1.100.bb
new file mode 100644
index 000000000..bf6e4f4b6
--- /dev/null
+++ b/meta-oe/recipes-support/bcu/bcu_1.1.100.bb
@@ -0,0 +1,23 @@
+SUMMARY = "NXP Board Control Utilities"
+DESCRIPTION = "The NXP Board Control Utilities are able to control various \
+               features of NXP i.MX evaluation boards (EVK) from a host \
+               computer. \
+               Features like resetting the board, selecting the boot mode, \
+               monitoring power consumption, programming the EEPROM and others"
+HOMEPAGE = "https://github.com/nxp-imx/bcu"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=884d48c2aa7b82e1ad4a33909fab24b6"
+
+SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;branch=master \
+           file://0001-CMakeLists-do-not-use-vendored-libcurl.patch \
+           "
+SRCREV = "c34d89b29f3d0d12793cd78b194d2f1d11728baf"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "curl libyaml libusb1 openssl libftdi"
+
+inherit cmake pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


