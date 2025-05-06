Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260F0C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 12:57:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.69865.1746511270229408768
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 23:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: lgo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lgo@pengutronix.de>)
	id 1uCBMa-0001PA-B0; Tue, 06 May 2025 08:01:08 +0200
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lgo@pengutronix.de>)
	id 1uCBMa-001LRU-0T;
	Tue, 06 May 2025 08:01:08 +0200
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <lgo@pengutronix.de>)
	id 1uCBMa-0053cx-0F;
	Tue, 06 May 2025 08:01:08 +0200
From: =?UTF-8?B?TGVvbmFyZCBHw7ZocnM=?= <l.goehrs@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
Subject: [meta-oe][PATCH] bcu: upgrade 1.1.100 -> 1.1.115
Date: Tue,  6 May 2025 08:00:57 +0200
Message-Id: <20250506060057.1205551-1-l.goehrs@pengutronix.de>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 12:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117349

Version 1.1.115 is the first non-prerelease since 1.1.100.

Changes between 1.1.100 and 1.1.115 include:

  - All BCU settings will now be cleared by default after using the
    `reset` command unless `-keep` is used.
  - `remote_en` will be deasserted after using `onoff` command unless
    `-keep` is used.
  - Add i.MX6ULL support
  - Add i.MX943 19x19 A0 and B1 EVK support

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
---
 ...akeLists-do-not-use-vendored-libcurl.patch | 29 ++++++++++++-------
 .../bcu/{bcu_1.1.100.bb => bcu_1.1.115.bb}    |  2 +-
 2 files changed, 19 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-support/bcu/{bcu_1.1.100.bb => bcu_1.1.115.bb} (94%)

diff --git a/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch b/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
index f4c0be19b6..bab1d1f301 100644
--- a/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
+++ b/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
@@ -1,6 +1,6 @@
-From ef1aaeee984ab13dab5d46c73e9b207cbdf62c55 Mon Sep 17 00:00:00 2001
+From 678c32f867931fd9f410b6e46ea8d101714c7ed5 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
-Date: Wed, 20 Dec 2023 14:37:20 +0100
+Date: Tue, 6 May 2025 07:45:36 +0200
 Subject: [PATCH] CMakeLists: do not use vendored libcurl
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -10,14 +10,14 @@ Upstream-Status: Inappropriate [upstream ticket https://github.com/nxp-imx/bcu/i
 
 Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
 ---
- CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
+ CMakeLists.txt | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3475179..bfecdb0 100644
+index 42158a2..ac840fc 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -17,15 +17,16 @@ pkg_check_modules(LIBFTDI REQUIRED libftdi1)
+@@ -17,17 +17,17 @@ pkg_check_modules(LIBFTDI REQUIRED libftdi1)
  pkg_check_modules(LIBYAML REQUIRED yaml-0.1)
  pkg_check_modules(LIBOPENSSL REQUIRED openssl)
  pkg_check_modules(LIBUSB REQUIRED libusb-1.0)
@@ -30,9 +30,16 @@ index 3475179..bfecdb0 100644
  message("operation system is ${CMAKE_SYSTEM}")
  if (LINUX)
          add_executable(bcu bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_https.c bcu_ftdi_eeprom.c)
-         link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS})
--        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${PROJECT_SOURCE_DIR}/libcurl/build.bcu/lib/libcurl.a -lpthread -lssl -lcrypto -lm)
-+        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} -lcurl -lpthread -lssl -lcrypto -lm)
-         execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR}
-                          COMMAND ${PROJECT_SOURCE_DIR}/build_libs.sh ${PROJECT_SOURCE_DIR})
+-        link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS})
+-        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${PROJECT_SOURCE_DIR}/libcurl/build.bcu/lib/libcurl.a -lpthread -lssl -lcrypto -lm -ldl)
+-        execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR}
+-                         COMMAND ${PROJECT_SOURCE_DIR}/build_libs.sh ${PROJECT_SOURCE_DIR})
++        link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS} ${LIBCURL_LIBRARY_DIRS})
++        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${LIBCURL_LIBRARIES} -lpthread -lssl -lcrypto -lm -ldl)
++        execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR})
          install(TARGETS bcu DESTINATION bin)
+ elseif (MACOS)
+         add_executable(bcu_mac bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_https.c bcu_ftdi_eeprom.c)
+-- 
+2.39.5
+
diff --git a/meta-oe/recipes-support/bcu/bcu_1.1.100.bb b/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
similarity index 94%
rename from meta-oe/recipes-support/bcu/bcu_1.1.100.bb
rename to meta-oe/recipes-support/bcu/bcu_1.1.115.bb
index bf6e4f4b69..897e7031ca 100644
--- a/meta-oe/recipes-support/bcu/bcu_1.1.100.bb
+++ b/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=884d48c2aa7b82e1ad4a33909fab24b6"
 SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;branch=master \
            file://0001-CMakeLists-do-not-use-vendored-libcurl.patch \
            "
-SRCREV = "c34d89b29f3d0d12793cd78b194d2f1d11728baf"
+SRCREV = "f081c69c26e330cf03ec790051c415c4716509d9"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


