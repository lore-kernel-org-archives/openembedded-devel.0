Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 400F871ED6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 13:11:05 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id x3so4032217qcv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=cLXjTj99gRTRFAjUGIU5MEpdcJJxl5EerH20FLKAphM=;
	b=Mi9hSPmqdHeMfxF7QM1DNKDBQ/GIanxOkg5al/mbJhMdxJMNXFzYZm0P72j3RDeEiC
	KtKw4Z483tkpShKS0YOgeBerdvyQcAt2uWFnTCobuV5c3aq/YC4OJg/cugofLec/ANrY
	osuXa72iZ4gx15LIFh6eeJbWT08h/W49JVnpTXWqOLyTKMAkB91rHEF1KSCw0Y56rf24
	XU0D2y9GSnOzCMKaRj3e6u+GsKY0F66W1QjDxBVvELuX+15sIKkE7jd4HRx/yn1y4tfc
	nkq5kRS8wKga9xr81z7pvb2712PgX9mwvz6uYbLfwn9+BmihyENK1OCZP8BGPX0dda63
	Sy8Q==
X-Received: by 10.140.29.226 with SMTP id b89mr24992735qgb.94.1414674666207;
	Thu, 30 Oct 2014 06:11:06 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.195.2])
	by mx.google.com with ESMTPSA id a9sm6691265qgf.7.2014.10.30.06.11.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Oct 2014 06:11:05 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Oct 2014 11:10:46 -0200
Message-Id: <1414674647-18708-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1414674647-18708-1-git-send-email-mario@ossystems.com.br>
References: <1414674647-18708-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] gmock: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Oct 2014 13:11:09 -0000

gmock is a library for writing and using C++ mock classes, by Google.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 ...install-command-for-libraries-and-headers.patch |   40 ++++++++++++++
 .../cmake-gmock.pc.in-Add-pkg-config-support.patch |   56 ++++++++++++++++++++
 meta-oe/recipes-test/gmock/gmock_1.7.0.bb          |   23 ++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
 create mode 100644 meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
 create mode 100644 meta-oe/recipes-test/gmock/gmock_1.7.0.bb

diff --git a/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch b/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
new file mode 100644
index 0000000..92a6393
--- /dev/null
+++ b/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
@@ -0,0 +1,40 @@
+From ba0a7d65c918cb7e3f2073553c4cc7af5858ed03 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Thu, 31 Jul 2014 16:54:00 -0300
+Subject: [PATCH] cmake: Add install command for libraries and headers
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ CMakeLists.txt | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 572d044..90e797a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -63,6 +63,8 @@ include_directories("${gmock_SOURCE_DIR}/include"
+                     # Test sources.
+                     "${gtest_SOURCE_DIR}")
+ 
++install(DIRECTORY ${gmock_SOURCE_DIR}/include/gmock DESTINATION include)
++
+ ########################################################################
+ #
+ # Defines the gmock & gmock_main libraries.  User tests should link
+@@ -82,6 +84,10 @@ cxx_library(gmock_main
+             src/gmock-all.cc
+             src/gmock_main.cc)
+ 
++
++install(TARGETS gmock DESTINATION lib)
++install(TARGETS gmock_main DESTINATION lib)
++
+ ########################################################################
+ #
+ # Google Mock's own tests.
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch b/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
new file mode 100644
index 0000000..aa38fe4
--- /dev/null
+++ b/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
@@ -0,0 +1,56 @@
+From 45661183a7c78d8c4f75adcf53c6ddd663dc8b2d Mon Sep 17 00:00:00 2001
+From: Mario Domenech Goulart <mario@ossystems.com.br>
+Date: Mon, 20 Oct 2014 17:12:58 -0200
+Subject: [PATCH] CMakeLists, gmock.pc.in: Add pkg-config support
+Organization: O.S. Systems Software LTDA.
+
+Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
+---
+ CMakeLists.txt | 7 ++++++-
+ gmock.pc.in    | 9 +++++++++
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+ create mode 100644 gmock.pc.in
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 90e797a..98fd824 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -27,6 +27,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
+   pre_project_set_up_hermetic_build()
+ endif()
+ 
++# pkg-config support
++configure_file("gmock.pc.in" "gmock.pc" @ONLY)
++
+ ########################################################################
+ #
+ # Project-wide settings
+@@ -87,7 +90,9 @@ cxx_library(gmock_main
+ 
+ install(TARGETS gmock DESTINATION lib)
+ install(TARGETS gmock_main DESTINATION lib)
+-
++install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gmock.pc"
++    DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/"
++)  
+ ########################################################################
+ #
+ # Google Mock's own tests.
+diff --git a/gmock.pc.in b/gmock.pc.in
+new file mode 100644
+index 0000000..08ad8d2
+--- /dev/null
++++ b/gmock.pc.in
+@@ -0,0 +1,9 @@
++Name: libgmock
++Version: 1.7.0
++Description: Google's framework for writing C++ tests on a variety of platforms
++ 
++prefix=@CMAKE_INSTALL_PREFIX@
++includedir=${prefix}/include
++libdir=${prefix}/lib
++Cflags:-I${includedir}/gmock
++Libs: -L${libdir} -lgmock -lgmock_main
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-test/gmock/gmock_1.7.0.bb b/meta-oe/recipes-test/gmock/gmock_1.7.0.bb
new file mode 100644
index 0000000..bd5cf4e
--- /dev/null
+++ b/meta-oe/recipes-test/gmock/gmock_1.7.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Google C++ Mocking Framework"
+SECTION = "libs"
+HOMEPAGE = "http://code.google.com/p/googlemock/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
+
+SRC_URI = "\
+    http://googlemock.googlecode.com/files/${BPN}-${PV}.zip \
+    file://cmake-Add-install-command-for-libraries-and-headers.patch \
+    file://cmake-gmock.pc.in-Add-pkg-config-support.patch \
+"
+
+SRC_URI[md5sum] = "073b984d8798ea1594f5e44d85b20d66"
+SRC_URI[sha256sum] = "26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b"
+
+inherit lib_package cmake
+
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dbg = "1"
+
+RDEPENDS_${PN}-dev += "${PN}-staticdev"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.10.4


