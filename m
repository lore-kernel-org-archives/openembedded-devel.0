Return-Path: <youngseok1.jeong@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7B6CA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 06:26:41 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.3284.1755843999177907480
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 23:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: youngseok1.jeong@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 22 Aug 2025 15:26:37 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: youngseok1.jeong@lge.com
Received: from unknown (HELO ys-server..) (10.177.121.106)
	by 156.147.1.121 with ESMTP; 22 Aug 2025 15:26:37 +0900
X-Original-SENDERIP: 10.177.121.106
X-Original-MAILFROM: youngseok1.jeong@lge.com
From: youngseok1.jeong@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: Youngseok Jeong <youngseok1.jeong@lge.com>
Subject: [meta-oe][kirkstone][PATCH] json-schema-validator: Remove absolute path in INSTALL_CMAKE_DIR
Date: Fri, 22 Aug 2025 15:26:35 +0900
Message-Id: <20250822062635.2936356-1-youngseok1.jeong@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Aug 2025 06:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119084

From: Youngseok Jeong <youngseok1.jeong@lge.com>

Can't found properly in the sysroot dir due to the absolute path in
INSTALL_CMAKE_DIR.

Fixes:
The imported target "nlohmann_json_schema_validator" references the file
"/usr/lib/libnlohmann_json_schema_validator.so.2.1.0"
but this file does not exist.

Signed-off-by: Youngseok Jeong <youngseok1.jeong@lge.com>
---
 ...-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch | 45 +++++++++++++++++++
 .../json-schema-validator_2.1.0.bb            |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch
new file mode 100644
index 0000000000..ec260ed881
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch
@@ -0,0 +1,45 @@
+From 63ddedc5ed9702ea3966243cc33992339cdbf71c Mon Sep 17 00:00:00 2001
+From: Youngseok Jeong <youngseok1.jeong@lge.com>
+Date: Thu, 21 Aug 2025 19:17:22 +0900
+Subject: [PATCH] Do not use the CMAKE_INSTALL_PREFIX
+
+Remove absolute path in INSTALL_CMAKE_DIR for fixing sysroot path issue.
+This issue is resolved v2.3.0 which is in scarthgap but backport patch
+is not matched well in kirkstone branch.
+
+See patch:
+https://github.com/pboettch/json-schema-validator/pull/121/commits/1cdca2a64d6e15e9d3191cc175053b08095a74fa
+
+Upstream-Status: Inappropriate [kirkstone specific]
+
+Signed-off-by: Youngseok Jeong <youngseok1.jeong@lge.com>
+---
+ CMakeLists.txt | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 594dc5f..676071a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -157,7 +157,7 @@ if(JSON_VALIDATOR_INSTALL)
+     # Set Up the Project Targets and Config Files for CMake
+ 
+     # Set the install path to the cmake config files
+-    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
++    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
+ 
+     # Create the ConfigVersion file
+     include(CMakePackageConfigHelpers) # write_basic_package_version_file
+@@ -165,12 +165,6 @@ if(JSON_VALIDATOR_INSTALL)
+                                       VERSION ${PACKAGE_VERSION}
+                                       COMPATIBILITY SameMajorVersion)
+ 
+-    # Get the relative path from the INSTALL_CMAKE_DIR to the include directory
+-    file(RELATIVE_PATH REL_INCLUDE_DIR "${INSTALL_CMAKE_DIR}" "${CMAKE_INSTALL_PREFIX}/include")
+-
+-
+-    # Configure the Config.cmake file with the proper include directory
+-    set(CONF_INCLUDE_DIRS "\${JSON_SCHEMA_VALIDATOR_CMAKE_DIR}/${REL_INCLUDE_DIR}")
+     configure_file(${PROJECT_NAME}Config.cmake.in
+                    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake" @ONLY)
+ 
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
index 00d26d7b34..84fe6793c4 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
 
 SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=master;protocol=https \
            file://0001-cmake-Use-GNUInstallDirs.patch \
+           file://0002-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch \
           "
 SRCREV = "27fc1d094503623dfe39365ba82581507524545c"
 

