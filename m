Return-Path: <frederico.cadete@awtce.be>
Received: from barracuda.aweurope.be (barracuda.aweurope.be [212.166.56.147])
	by mail.openembedded.org (Postfix) with ESMTP id F28C760118
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:57:04 +0000 (UTC)
X-ASG-Debug-ID: 1466593023-0a6d4a62ba7ac6c0001-aWHRdb
Received: from localhost.localdomain ([172.23.1.67]) by barracuda.aweurope.be
	with ESMTP id t3b7ZrAYx0qRIL0p;
	Wed, 22 Jun 2016 12:57:03 +0200 (CEST)
X-Barracuda-Envelope-From: frederico.cadete@awtce.be
X-Barracuda-RBL-Trusted-Forwarder: 172.23.1.67
X-ASG-Whitelist: Client
From: Frederico Cadete <frederico.cadete@awtce.be>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2016 12:56:52 +0200
X-ASG-Orig-Subj: [meta-oe][PATCH] gtest: fix installation in multilib
Message-Id: <1466593012-16243-1-git-send-email-frederico.cadete@awtce.be>
X-Mailer: git-send-email 1.9.1
X-Barracuda-Connect: UNKNOWN[172.23.1.67]
X-Barracuda-Start-Time: 1466593023
X-Barracuda-URL: https://172.23.0.236:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 7573
X-Virus-Scanned: by bsmtpd at aweurope.be
X-Barracuda-BRTS-Status: 1
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] gtest: fix installation in multilib
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
X-List-Received-Date: Wed, 22 Jun 2016 10:57:06 -0000

The installation and pkgconfig patches have to be reworked to consider
the install directories from OE.
---
 ...install-command-for-libraries-and-headers.patch | 32 ++++++++++++++++++
 ...test.pc.in-Add-pkg-config-support-to-gte.patch} | 24 ++++++-------
 ...install-command-for-libraries-and-headers.patch | 39 ----------------------
 meta-oe/recipes-test/gtest/gtest_1.7.0.bb          |  4 +--
 4 files changed, 46 insertions(+), 53 deletions(-)
 create mode 100644 meta-oe/recipes-test/gtest/gtest/0001-Add-install-command-for-libraries-and-headers.patch
 rename meta-oe/recipes-test/gtest/gtest/{CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch => 0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch} (68%)
 delete mode 100644 meta-oe/recipes-test/gtest/gtest/cmake-Add-install-command-for-libraries-and-headers.patch

diff --git a/meta-oe/recipes-test/gtest/gtest/0001-Add-install-command-for-libraries-and-headers.patch b/meta-oe/recipes-test/gtest/gtest/0001-Add-install-command-for-libraries-and-headers.patch
new file mode 100644
index 0000000..b8f5d6f
--- /dev/null
+++ b/meta-oe/recipes-test/gtest/gtest/0001-Add-install-command-for-libraries-and-headers.patch
@@ -0,0 +1,32 @@
+From bdcbef7b8adde424ee29e7eddc3b0570cc336449 Mon Sep 17 00:00:00 2001
+From: Frederico Cadete <frederico.cadete@awtce.be>
+Date: Tue, 21 Jun 2016 10:55:38 +0200
+Subject: [PATCH 1/2] Add install command for libraries and headers
+
+Signed-off-by: Frederico Cadete <frederico.cadete@awtce.be>
+---
+ CMakeLists.txt | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 57470c8..e969648 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -73,6 +73,14 @@ target_link_libraries(gtest_main gtest)
+ 
+ ########################################################################
+ #
++# Install rules
++install(TARGETS gtest gtest_main
++  DESTINATION ${CMAKE_INSTALL_LIBDIR})
++install(DIRECTORY ${gtest_SOURCE_DIR}/include/gtest
++  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++
++########################################################################
++#
+ # Samples on how to link user tests with gtest or gtest_main.
+ #
+ # They are not built by default.  To build them, set the
+-- 
+2.5.0
+
diff --git a/meta-oe/recipes-test/gtest/gtest/CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch b/meta-oe/recipes-test/gtest/gtest/0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
similarity index 68%
rename from meta-oe/recipes-test/gtest/gtest/CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
rename to meta-oe/recipes-test/gtest/gtest/0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
index 1ece136..7a19f72 100644
--- a/meta-oe/recipes-test/gtest/gtest/CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
+++ b/meta-oe/recipes-test/gtest/gtest/0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
@@ -1,7 +1,7 @@
-From d4b25ce723812faf78d8ee038b7cbed00cbba682 Mon Sep 17 00:00:00 2001
+From 89639e76d5ee039a55004e5e910d565e6e84ed35 Mon Sep 17 00:00:00 2001
 From: Rodrigo Caimi <caimi@datacom.ind.br>
 Date: Tue, 7 Oct 2014 15:37:10 -0300
-Subject: [PATCH] CMakeLists, gtest.pc.in: Add pkg-config support to gtest
+Subject: [PATCH 2/2] CMakeLists, gtest.pc.in: Add pkg-config support to gtest
  1.7.0
 
 Signed-off-by: Rodrigo Caimi <caimi@datacom.ind.br>
@@ -12,7 +12,7 @@ Signed-off-by: Rodrigo Caimi <caimi@datacom.ind.br>
  create mode 100644 gtest.pc.in
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 281c4c2..e4354a8 100644
+index e969648..0038826 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -29,6 +29,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
@@ -25,19 +25,19 @@ index 281c4c2..e4354a8 100644
  ########################################################################
  #
  # Project-wide settings
-@@ -75,6 +78,9 @@ target_link_libraries(gtest_main gtest)
- 
- install(TARGETS gtest DESTINATION lib)
- install(TARGETS gtest_main DESTINATION lib)
+@@ -78,6 +81,9 @@ install(TARGETS gtest gtest_main
+   DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install(DIRECTORY ${gtest_SOURCE_DIR}/include/gtest
+   DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
 +install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gtest.pc"
-+    DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/"
++    DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/"
 +)
  
  ########################################################################
  #
 diff --git a/gtest.pc.in b/gtest.pc.in
 new file mode 100644
-index 0000000..57b1049
+index 0000000..52e622b
 --- /dev/null
 +++ b/gtest.pc.in
 @@ -0,0 +1,9 @@
@@ -46,10 +46,10 @@ index 0000000..57b1049
 +Description: Google's framework for writing C++ tests on a variety of platforms
 +
 +prefix=@CMAKE_INSTALL_PREFIX@
-+includedir=${prefix}/include
-+libdir=${prefix}/lib
++includedir=@CMAKE_INSTALL_INCLUDEDIR@
++libdir=@CMAKE_INSTALL_LIBDIR@
 +Cflags:-I${includedir}/gtest
 +Libs: -L${libdir} -lgtest -lgtest_main
 -- 
-1.9.1
+2.5.0
 
diff --git a/meta-oe/recipes-test/gtest/gtest/cmake-Add-install-command-for-libraries-and-headers.patch b/meta-oe/recipes-test/gtest/gtest/cmake-Add-install-command-for-libraries-and-headers.patch
deleted file mode 100644
index 0c160b0..0000000
--- a/meta-oe/recipes-test/gtest/gtest/cmake-Add-install-command-for-libraries-and-headers.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5318983562be6babeb5a6996e7dda4b31acfdba8 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Wed, 30 Jul 2014 16:49:53 -0300
-Subject: [PATCH] cmake: Add install command for libraries and headers
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- CMakeLists.txt | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 57470c8..281c4c2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -56,6 +56,8 @@ include_directories(
-   ${gtest_SOURCE_DIR}/include
-   ${gtest_SOURCE_DIR})
- 
-+install(DIRECTORY ${gtest_SOURCE_DIR}/include/gtest DESTINATION include)
-+
- # Where Google Test's libraries can be found.
- link_directories(${gtest_BINARY_DIR}/src)
- 
-@@ -71,6 +73,9 @@ cxx_library(gtest "${cxx_strict}" src/gtest-all.cc)
- cxx_library(gtest_main "${cxx_strict}" src/gtest_main.cc)
- target_link_libraries(gtest_main gtest)
- 
-+install(TARGETS gtest DESTINATION lib)
-+install(TARGETS gtest_main DESTINATION lib)
-+
- ########################################################################
- #
- # Samples on how to link user tests with gtest or gtest_main.
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-test/gtest/gtest_1.7.0.bb b/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
index edeeab6..8e68c7c 100644
--- a/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
+++ b/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 
 SRC_URI = "\
     http://googletest.googlecode.com/files/${BPN}-${PV}.zip \
-    file://cmake-Add-install-command-for-libraries-and-headers.patch \
-    file://CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch \
+    file://0001-Add-install-command-to-Yocto-destinations.patch \
+    file://0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch \
 "
 
 SRC_URI[md5sum] = "2d6ec8ccdf5c46b05ba54a9fd1d130d7"
-- 
1.9.1


