Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E49FFC591E
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 09:59:09 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67084.1772099943447641724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 01:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oEP4pVof;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772099943; x=1803635943;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cFRV/DsH7mGgIu1TyvnZpnYnNLvbxNNSq22PYAXUufA=;
  b=oEP4pVofXBqlx9nPfO5riz2bxgg5tPhwoQwwoDeBj+zMisneR0Yw0Gjt
   7DV7cCmi4oJ60eNlBcZff21NNqzSZiXYQJkS6MzrvGfdY3zvhCW/MIQL6
   cyklL02E5Bm29mXAdKj6AY7PWZ1fczfsH+qOraz9vJqis/YEICj6OIeAp
   bHYtybNumG8EuVNmfBYwTfER4tX58o9LSr/sykYn8n5HSRWYpKrnEI9FZ
   IXNesSgrnXJVOOurP4vQ6xeLbWpDh+zausrOWjfxTeXsN6baymcUJ+3IW
   SQIKJYxDIAmDut7gduw0bZYJulLwLzcUxbT3bpsumx37QKo58zuBTWbF1
   A==;
X-CSE-ConnectionGUID: +06UCW5RR2Gd9YJSFLsRVA==
X-CSE-MsgGUID: Xe2e6uc3RkCshvsGM64qKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="218587261"
X-IronPort-AV: E=Sophos;i="6.21,312,1763391600"; 
   d="scan'208";a="218587261"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id ACC151C1C706
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 09:59:01 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 66006C041E6
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 09:59:01 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.167.241])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 1DB95402991
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 09:58:58 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] bcu: upgrade 1.1.115 -> 1.1.128
Date: Thu, 26 Feb 2026 17:58:44 +0800
Message-ID: <20260226095855.3160-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 09:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124670

1. Changelog:
  Support i.MX952 15x15 EVK with Power group updated.

2. Update 0001-CMakeLists-do-not-use-vendored-libcurl.patch for 1.1.128

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...akeLists-do-not-use-vendored-libcurl.patch | 34 +++++++------------
 .../bcu/{bcu_1.1.115.bb => bcu_1.1.128.bb}    |  4 +--
 2 files changed, 15 insertions(+), 23 deletions(-)
 rename meta-oe/recipes-support/bcu/{bcu_1.1.115.bb => bcu_1.1.128.bb} (91%)

diff --git a/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch b/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
index bab1d1f301..ac72be44dc 100644
--- a/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
+++ b/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
@@ -1,45 +1,37 @@
-From 678c32f867931fd9f410b6e46ea8d101714c7ed5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
-Date: Tue, 6 May 2025 07:45:36 +0200
 Subject: [PATCH] CMakeLists: do not use vendored libcurl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Inappropriate [upstream ticket https://github.com/nxp-imx/bcu/issues/17]
 
 Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
+
+Update for 1.1.128
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
- CMakeLists.txt | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 42158a2..ac840fc 100644
+index 0d6b915..f8c76ca 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -17,17 +17,17 @@ pkg_check_modules(LIBFTDI REQUIRED libftdi1)
+@@ -16,14 +16,15 @@ find_package(PkgConfig REQUIRED)
+ pkg_check_modules(LIBFTDI REQUIRED libftdi1)
  pkg_check_modules(LIBYAML REQUIRED yaml-0.1)
- pkg_check_modules(LIBOPENSSL REQUIRED openssl)
  pkg_check_modules(LIBUSB REQUIRED libusb-1.0)
 +pkg_check_modules(LIBCURL REQUIRED libcurl)
  project(bcu)
--include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${PROJECT_SOURCE_DIR}/libftdi/src ${LIBYAML_INCLUDEDIR} ${PROJECT_SOURCE_DIR}/libcurl/include)
+-include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${PROJECT_SOURCE_DIR}/libftdi/src ${LIBYAML_INCLUDEDIR})
 +include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${LIBYAML_INCLUDEDIR})
  include_directories(${PROJECT_SOURCE_DIR})
  
  message("operation system is ${CMAKE_SYSTEM}")
  if (LINUX)
-         add_executable(bcu bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_https.c bcu_ftdi_eeprom.c)
+         add_executable(bcu bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_ftdi_eeprom.c)
 -        link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS})
--        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${PROJECT_SOURCE_DIR}/libcurl/build.bcu/lib/libcurl.a -lpthread -lssl -lcrypto -lm -ldl)
--        execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR}
--                         COMMAND ${PROJECT_SOURCE_DIR}/build_libs.sh ${PROJECT_SOURCE_DIR})
 +        link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS} ${LIBCURL_LIBRARY_DIRS})
-+        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${LIBCURL_LIBRARIES} -lpthread -lssl -lcrypto -lm -ldl)
-+        execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR})
+         target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} -lpthread -lm -ldl)
+         execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR} )
          install(TARGETS bcu DESTINATION bin)
- elseif (MACOS)
-         add_executable(bcu_mac bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_https.c bcu_ftdi_eeprom.c)
 -- 
-2.39.5
+2.43.0
 
diff --git a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb b/meta-oe/recipes-support/bcu/bcu_1.1.128.bb
similarity index 91%
rename from meta-oe/recipes-support/bcu/bcu_1.1.115.bb
rename to meta-oe/recipes-support/bcu/bcu_1.1.128.bb
index 260fba02a9..2b2e5e7fa0 100644
--- a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
+++ b/meta-oe/recipes-support/bcu/bcu_1.1.128.bb
@@ -9,10 +9,10 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=884d48c2aa7b82e1ad4a33909fab24b6"
 
-SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;branch=master \
+SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;branch=master;tag=${BPN}_${PV} \
            file://0001-CMakeLists-do-not-use-vendored-libcurl.patch \
            "
-SRCREV = "f081c69c26e330cf03ec790051c415c4716509d9"
+SRCREV = "e7027dcb867dae7aebc8fd0a78ab13f05a4557f2"
 
 
 DEPENDS = "curl libyaml libusb1 openssl libftdi"
-- 
2.43.0


