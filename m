Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 657 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Feb 2019 11:11:06 UTC
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7A17C3E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3930; q=dns/txt; s=iport;
	t=1549537868; x=1550747468;
	h=from:to:cc:subject:date:message-id;
	bh=0juFdli/q/mSAT9vWC9WjizZ0q7ScM+AU5NSa40rL+I=;
	b=BmAvXN77dlQJ1wVDSMtheVWAIly9KT8yHxa5XYz+RUOiHiERuDUrXGGz
	LS85dHGaIfvwumhjD5H/+q4E6lHEB5WoZLafkgdwuD42laS3QJuuKfQkZ
	skJZIpeznewamwmw6fpRdeobj3ovNTJ/Z+ABxrM+XOOlIUiExvvyRqUA7 I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AEAAA+D1xc/xbLJq1kGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBUQQBAQEBAQsBgmpQASASJ4wdX4w1mHmBew0lhAFGg0Q?=
	=?us-ascii?q?0CQ0BAwEBAgEBAm0cDIVKAX8sAwECfg4BEoMkAYIBD640hC8BgRSEZxSHboR?=
	=?us-ascii?q?YgUA/gRGGMAKHQQKjEAmHN4sOAheCP5AWii2FOIw+gUY4gVYzGggbFYMnCYI?=
	=?us-ascii?q?gFhODOIJWh389AzAKjnABAQ?=
X-IronPort-AV: E=Sophos;i="5.58,343,1544486400"; 
   d="scan'208";a="9933299"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Feb 2019 11:00:01 +0000
Received: from localhost ([10.63.15.137])
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id x17B01Pm027078;
	Thu, 7 Feb 2019 11:00:01 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Thu,  7 Feb 2019 13:00:01 +0200
Message-Id: <1549537201-4781-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.63.15.137, [10.63.15.137]
X-Outbound-Node: aer-core-2.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [meta-oe] [PATCH] rapidjson: fix cmake artifacts installation for non-default BASELIB case
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2019 11:11:06 -0000

If BASELIB is set to non-default value (like lib64),
next 'installed but not shipped' issue happens:
  /usr/lib
  /usr/lib/cmake
  /usr/lib/pkgconfig
  /usr/lib/cmake/RapidJSON
  /usr/lib/cmake/RapidJSON/RapidJSONConfigVersion.cmake
  /usr/lib/cmake/RapidJSON/RapidJSONConfig.cmake
  /usr/lib/pkgconfig/RapidJSON.pc

This is because rapidjson has library installation dir set
to 'lib' by default and hardcoded in another place.
Fix this by next changes:
 - set appropriate LIB_INSTALL_DIR
 - fix hardcoded 'lib' in CMAKECONFIG_INSTALL_DIR case

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 ...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 ++++++++++++++++++++++
 .../recipes-devtools/rapidjson/rapidjson_git.bb    |  5 +--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
new file mode 100644
index 0000000..745f5d0
--- /dev/null
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
@@ -0,0 +1,36 @@
+From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001
+From: Ruslan Bilovol <rbilovol@cisco.com>
+Date: Thu, 24 Jan 2019 18:11:39 +0200
+Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path
+
+Currently this path is hardcoded to lib/cmake.
+Some distributions have different library path (like lib64).
+So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR
+configurable and usable in such distros.
+
+Upstream-Status: Backport [https://github.com/Tencent/rapidjson/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9]
+
+Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7c60407..0275672 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -199,9 +199,9 @@ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}ConfigVersion.cmake.in
+     ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake @ONLY)
+ 
+ # ... for the install tree
+-SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )
++SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )
+ FILE( RELATIVE_PATH REL_INCLUDE_DIR
+-    "${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DIR}"
++    "${CMAKECONFIG_INSTALL_DIR}"
+     "${CMAKE_INSTALL_PREFIX}/include" )
+ 
+ SET( ${PROJECT_NAME}_INCLUDE_DIR "\${${PROJECT_NAME}_CMAKE_DIR}/${REL_INCLUDE_DIR}" )
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index c90eab0..e3ed9c6 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,7 +4,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
+           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
 
 SRCREV = "6a905f9311f82d306da77bd963ec5aa5da07da9c"
 
@@ -14,7 +15,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
+EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DLIB_INSTALL_DIR:STRING=${libdir}"
 
 # RapidJSON is a header-only C++ library, so the main package will be empty.
 
-- 
1.9.1


