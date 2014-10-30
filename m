Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 44F0371918
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 13:10:58 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id i17so4068425qcy.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=eO0A60U8xApzsNSBTMG6sxW16UtCQwc3Ewy+nzbkPqQ=;
	b=BBmFwe5g5ZcMkUGAgZ+7ExXvT0dpi+cRbRFKlOGIQzv0XXSXi8Cy66mud+R6BF6TKU
	6R7cOLraJIzxBWYe787BqhajPNU5uqLG5hZQNdI90wn/vBOzYK4tikYkV2w2MtbaTyqT
	z08C0dVYnxjfYxkRMB9KScVPsInKWq082MlK/+B6rTeHDApVm8T0lczTI96dL1Y/UD2z
	h8tmKKulbZgBcw0JJnS3qjs4lGeVrWl3D+jb+y3CFfL36qF8ocBPM/QrnfLhkaYvFXuX
	M9O7OO/nJFuWRxll0MMWLlqlXAme10HwT0E+xdpakcZI7aB1Yh0PZF1FOy3EDJeTvyuj
	GA2g==
X-Received: by 10.140.30.165 with SMTP id d34mr6435435qgd.55.1414674659318;
	Thu, 30 Oct 2014 06:10:59 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.195.2])
	by mx.google.com with ESMTPSA id a9sm6691265qgf.7.2014.10.30.06.10.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Oct 2014 06:10:58 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Oct 2014 11:10:45 -0200
Message-Id: <1414674647-18708-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] gtest: add recipe
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
X-List-Received-Date: Thu, 30 Oct 2014 13:11:02 -0000

gtest is a framework for writing C++ tests, by Google.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 ...gtest.pc.in-Add-pkg-config-support-to-gte.patch |   55 ++++++++++++++++++++
 ...install-command-for-libraries-and-headers.patch |   39 ++++++++++++++
 meta-oe/recipes-test/gtest/gtest_1.7.0.bb          |   23 ++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-test/gtest/gtest/CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
 create mode 100644 meta-oe/recipes-test/gtest/gtest/cmake-Add-install-command-for-libraries-and-headers.patch
 create mode 100644 meta-oe/recipes-test/gtest/gtest_1.7.0.bb

diff --git a/meta-oe/recipes-test/gtest/gtest/CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch b/meta-oe/recipes-test/gtest/gtest/CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
new file mode 100644
index 0000000..1ece136
--- /dev/null
+++ b/meta-oe/recipes-test/gtest/gtest/CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
@@ -0,0 +1,55 @@
+From d4b25ce723812faf78d8ee038b7cbed00cbba682 Mon Sep 17 00:00:00 2001
+From: Rodrigo Caimi <caimi@datacom.ind.br>
+Date: Tue, 7 Oct 2014 15:37:10 -0300
+Subject: [PATCH] CMakeLists, gtest.pc.in: Add pkg-config support to gtest
+ 1.7.0
+
+Signed-off-by: Rodrigo Caimi <caimi@datacom.ind.br>
+---
+ CMakeLists.txt | 6 ++++++
+ gtest.pc.in    | 9 +++++++++
+ 2 files changed, 15 insertions(+)
+ create mode 100644 gtest.pc.in
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 281c4c2..e4354a8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -29,6 +29,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
+   pre_project_set_up_hermetic_build()
+ endif()
+ 
++# pkg-config support
++configure_file("gtest.pc.in" "gtest.pc" @ONLY)
++
+ ########################################################################
+ #
+ # Project-wide settings
+@@ -75,6 +78,9 @@ target_link_libraries(gtest_main gtest)
+ 
+ install(TARGETS gtest DESTINATION lib)
+ install(TARGETS gtest_main DESTINATION lib)
++install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gtest.pc"
++    DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/"
++)
+ 
+ ########################################################################
+ #
+diff --git a/gtest.pc.in b/gtest.pc.in
+new file mode 100644
+index 0000000..57b1049
+--- /dev/null
++++ b/gtest.pc.in
+@@ -0,0 +1,9 @@
++Name: libgtest
++Version: 1.7.0
++Description: Google's framework for writing C++ tests on a variety of platforms
++
++prefix=@CMAKE_INSTALL_PREFIX@
++includedir=${prefix}/include
++libdir=${prefix}/lib
++Cflags:-I${includedir}/gtest
++Libs: -L${libdir} -lgtest -lgtest_main
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-test/gtest/gtest/cmake-Add-install-command-for-libraries-and-headers.patch b/meta-oe/recipes-test/gtest/gtest/cmake-Add-install-command-for-libraries-and-headers.patch
new file mode 100644
index 0000000..0c160b0
--- /dev/null
+++ b/meta-oe/recipes-test/gtest/gtest/cmake-Add-install-command-for-libraries-and-headers.patch
@@ -0,0 +1,39 @@
+From 5318983562be6babeb5a6996e7dda4b31acfdba8 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Wed, 30 Jul 2014 16:49:53 -0300
+Subject: [PATCH] cmake: Add install command for libraries and headers
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 57470c8..281c4c2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -56,6 +56,8 @@ include_directories(
+   ${gtest_SOURCE_DIR}/include
+   ${gtest_SOURCE_DIR})
+ 
++install(DIRECTORY ${gtest_SOURCE_DIR}/include/gtest DESTINATION include)
++
+ # Where Google Test's libraries can be found.
+ link_directories(${gtest_BINARY_DIR}/src)
+ 
+@@ -71,6 +73,9 @@ cxx_library(gtest "${cxx_strict}" src/gtest-all.cc)
+ cxx_library(gtest_main "${cxx_strict}" src/gtest_main.cc)
+ target_link_libraries(gtest_main gtest)
+ 
++install(TARGETS gtest DESTINATION lib)
++install(TARGETS gtest_main DESTINATION lib)
++
+ ########################################################################
+ #
+ # Samples on how to link user tests with gtest or gtest_main.
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-test/gtest/gtest_1.7.0.bb b/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
new file mode 100644
index 0000000..9f148d5
--- /dev/null
+++ b/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Google's framework for writing C++ tests"
+HOMEPAGE = "http://code.google.com/p/googletest/"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
+
+SRC_URI = "\
+    http://googletest.googlecode.com/files/${BPN}-${PV}.zip \
+    file://cmake-Add-install-command-for-libraries-and-headers.patch \
+    file://CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch \
+"
+
+SRC_URI[md5sum] = "2d6ec8ccdf5c46b05ba54a9fd1d130d7"
+SRC_URI[sha256sum] = "247ca18dd83f53deb1328be17e4b1be31514cedfc1e3424f672bf11fd7e0d60d"
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


