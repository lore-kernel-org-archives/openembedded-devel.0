Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 225CA772CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 14:11:38 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so6744185wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 06:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j8r0mY3mPEQedgbpQbOrdj6TO1eMCRW62EIYLS5W/aQ=;
	b=YKjWUjFoYUBua2JLLLPpGZI9rccoJA5f092Rz1UnnopyJwAOXYhI9Azw2BVUeI2EHd
	MBMo4p0IbtIphkbZsUoC+vTeyEVyqVJXzH4TNSLgoZwQO4NEPfrDFjoPgCLY5y3OX0Ot
	L4AwGpL78xq98m6cprAKLtS396TVoVxF2UkbDld240Zg2FTPznxI31diPaAtoWNLfA8W
	ilhpZ4llTYZ38Au2M6LHFg6OXhoFc/238jo9Dfuga8/kuaovwjziorCA+J2/GJWHmo5t
	q9UiatD/MYzVYI97yv51kD27bnWi2KlrHY3B5qkT3aIMbjl2Ff0Swxuyh/uJBJ6LnlFH
	XZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j8r0mY3mPEQedgbpQbOrdj6TO1eMCRW62EIYLS5W/aQ=;
	b=IekImFr+KakSwQ4TVqMlsL0MUid7TDK/8mACuGbd6QT5IePaf7Cu+SmVV0OT1Gsj6X
	99tcUp7tvglldIeG5C0ux2A6dcrWq21sV977c4U0CXvScN1EWjyzUZGP7bLjDR2wBjSh
	xpW2Kmf0KfoSjh6hQnSXDGcYWcBKzOSk9xx/vIWfyEsmWsFlPmFEKnGylBvV5cKOvjF9
	UPY6dkV5FY7K+SnnrlS94PoHZFWnhpvIILSwbUDhdva+xjQ/6dKq/IR8IHJMl5W5O67L
	v7HfZaypMwHkf8Px6EwqX8MM63+JF8TN1jb5ssO07akCDEgaI0Qisg2AZ2wXiilIsXSu
	+5xg==
X-Gm-Message-State: AIkVDXICJkkb1HhTatfe6TnNRvyOpFgRAZS5rVj6O30YKIjaMMw2BNhCzoECS0wM/J3icg==
X-Received: by 10.28.173.4 with SMTP id w4mr1604896wme.70.1481811099461;
	Thu, 15 Dec 2016 06:11:39 -0800 (PST)
Received: from localhost.localdomain
	(ip-217-103-177-37.ip.prioritytelecom.net. [217.103.177.37])
	by smtp.gmail.com with ESMTPSA id
	i10sm2241331wjd.15.2016.12.15.06.11.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Dec 2016 06:11:38 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2016 06:11:31 -0800
Message-Id: <1481811091-18644-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] gtest, gmock: update 1.7.0 -> 1.8.0
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
X-List-Received-Date: Thu, 15 Dec 2016 14:11:39 -0000

Starting from the 1.8.0 release, GoogleTest and GoogleMock are
maintained in the same repository and released together. Update the
gtest recipe to PROVIDE gmock (and drop the gmock recipe).

Patches to add CMake install rules have been dropped (now supported
upstream).

  https://github.com/google/googletest/commit/98d988deac06637364f6cd41c45c3db4a8a0b6bc
  https://github.com/google/googletest/commit/7c8ac4886a7ad513430d132c446a93c6d395345a

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...install-command-for-libraries-and-headers.patch |  40 --------
 .../cmake-gmock.pc.in-Add-pkg-config-support.patch |  56 -----------
 meta-oe/recipes-test/gmock/gmock_1.7.0.bb          |  23 -----
 ...install-command-for-libraries-and-headers.patch |  32 -------
 ...gtest.pc.in-Add-pkg-config-support-to-gte.patch |  55 -----------
 .../gtest/gtest/Add-pkg-config-support.patch       | 106 +++++++++++++++++++++
 meta-oe/recipes-test/gtest/gtest_1.7.0.bb          |  23 -----
 meta-oe/recipes-test/gtest/gtest_1.8.0.bb          |  27 ++++++
 8 files changed, 133 insertions(+), 229 deletions(-)
 delete mode 100644 meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
 delete mode 100644 meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
 delete mode 100644 meta-oe/recipes-test/gmock/gmock_1.7.0.bb
 delete mode 100644 meta-oe/recipes-test/gtest/gtest/0001-Add-install-command-for-libraries-and-headers.patch
 delete mode 100644 meta-oe/recipes-test/gtest/gtest/0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
 create mode 100644 meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch
 delete mode 100644 meta-oe/recipes-test/gtest/gtest_1.7.0.bb
 create mode 100644 meta-oe/recipes-test/gtest/gtest_1.8.0.bb

diff --git a/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch b/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
deleted file mode 100644
index 0dac998..0000000
--- a/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ba0a7d65c918cb7e3f2073553c4cc7af5858ed03 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Thu, 31 Jul 2014 16:54:00 -0300
-Subject: [PATCH] cmake: Add install command for libraries and headers
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- CMakeLists.txt | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 572d044..90e797a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -63,6 +63,8 @@ include_directories("${gmock_SOURCE_DIR}/include"
-                     # Test sources.
-                     "${gtest_SOURCE_DIR}")
- 
-+install(DIRECTORY ${gmock_SOURCE_DIR}/include/gmock DESTINATION include)
-+
- ########################################################################
- #
- # Defines the gmock & gmock_main libraries.  User tests should link
-@@ -82,6 +84,10 @@ cxx_library(gmock_main
-             src/gmock-all.cc
-             src/gmock_main.cc)
- 
-+
-+install(TARGETS gmock DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+install(TARGETS gmock_main DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+
- ########################################################################
- #
- # Google Mock's own tests.
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch b/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
deleted file mode 100644
index 8ffe1a6..0000000
--- a/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 45661183a7c78d8c4f75adcf53c6ddd663dc8b2d Mon Sep 17 00:00:00 2001
-From: Mario Domenech Goulart <mario@ossystems.com.br>
-Date: Mon, 20 Oct 2014 17:12:58 -0200
-Subject: [PATCH] CMakeLists, gmock.pc.in: Add pkg-config support
-Organization: O.S. Systems Software LTDA.
-
-Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
----
- CMakeLists.txt | 7 ++++++-
- gmock.pc.in    | 9 +++++++++
- 2 files changed, 15 insertions(+), 1 deletion(-)
- create mode 100644 gmock.pc.in
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 90e797a..98fd824 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -27,6 +27,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
-   pre_project_set_up_hermetic_build()
- endif()
- 
-+# pkg-config support
-+configure_file("gmock.pc.in" "gmock.pc" @ONLY)
-+
- ########################################################################
- #
- # Project-wide settings
-@@ -87,7 +90,9 @@ cxx_library(gmock_main
- 
- install(TARGETS gmock DESTINATION ${CMAKE_INSTALL_LIBDIR})
- install(TARGETS gmock_main DESTINATION ${CMAKE_INSTALL_LIBDIR})
--
-+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gmock.pc"
-+    DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/"
-+)  
- ########################################################################
- #
- # Google Mock's own tests.
-diff --git a/gmock.pc.in b/gmock.pc.in
-new file mode 100644
-index 0000000..08ad8d2
---- /dev/null
-+++ b/gmock.pc.in
-@@ -0,0 +1,9 @@
-+Name: libgmock
-+Version: 1.7.0
-+Description: Google's framework for writing C++ tests on a variety of platforms
-+ 
-+prefix=@CMAKE_INSTALL_PREFIX@
-+includedir=${prefix}/include
-+libdir=${prefix}/lib
-+Cflags:-I${includedir}/gmock
-+Libs: -L${libdir} -lgmock -lgmock_main
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-test/gmock/gmock_1.7.0.bb b/meta-oe/recipes-test/gmock/gmock_1.7.0.bb
deleted file mode 100644
index a537f4c..0000000
--- a/meta-oe/recipes-test/gmock/gmock_1.7.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Google C++ Mocking Framework"
-SECTION = "libs"
-HOMEPAGE = "http://code.google.com/p/googlemock/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
-
-SRC_URI = "\
-    http://googlemock.googlecode.com/files/${BPN}-${PV}.zip \
-    file://cmake-Add-install-command-for-libraries-and-headers.patch \
-    file://cmake-gmock.pc.in-Add-pkg-config-support.patch \
-"
-
-SRC_URI[md5sum] = "073b984d8798ea1594f5e44d85b20d66"
-SRC_URI[sha256sum] = "26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b"
-
-inherit lib_package cmake
-
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-dbg = "1"
-
-RDEPENDS_${PN}-dev += "${PN}-staticdev"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-test/gtest/gtest/0001-Add-install-command-for-libraries-and-headers.patch b/meta-oe/recipes-test/gtest/gtest/0001-Add-install-command-for-libraries-and-headers.patch
deleted file mode 100644
index b8f5d6f..0000000
--- a/meta-oe/recipes-test/gtest/gtest/0001-Add-install-command-for-libraries-and-headers.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bdcbef7b8adde424ee29e7eddc3b0570cc336449 Mon Sep 17 00:00:00 2001
-From: Frederico Cadete <frederico.cadete@awtce.be>
-Date: Tue, 21 Jun 2016 10:55:38 +0200
-Subject: [PATCH 1/2] Add install command for libraries and headers
-
-Signed-off-by: Frederico Cadete <frederico.cadete@awtce.be>
----
- CMakeLists.txt | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 57470c8..e969648 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -73,6 +73,14 @@ target_link_libraries(gtest_main gtest)
- 
- ########################################################################
- #
-+# Install rules
-+install(TARGETS gtest gtest_main
-+  DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+install(DIRECTORY ${gtest_SOURCE_DIR}/include/gtest
-+  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
-+
-+########################################################################
-+#
- # Samples on how to link user tests with gtest or gtest_main.
- #
- # They are not built by default.  To build them, set the
--- 
-2.5.0
-
diff --git a/meta-oe/recipes-test/gtest/gtest/0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch b/meta-oe/recipes-test/gtest/gtest/0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
deleted file mode 100644
index 7a19f72..0000000
--- a/meta-oe/recipes-test/gtest/gtest/0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 89639e76d5ee039a55004e5e910d565e6e84ed35 Mon Sep 17 00:00:00 2001
-From: Rodrigo Caimi <caimi@datacom.ind.br>
-Date: Tue, 7 Oct 2014 15:37:10 -0300
-Subject: [PATCH 2/2] CMakeLists, gtest.pc.in: Add pkg-config support to gtest
- 1.7.0
-
-Signed-off-by: Rodrigo Caimi <caimi@datacom.ind.br>
----
- CMakeLists.txt | 6 ++++++
- gtest.pc.in    | 9 +++++++++
- 2 files changed, 15 insertions(+)
- create mode 100644 gtest.pc.in
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e969648..0038826 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -29,6 +29,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
-   pre_project_set_up_hermetic_build()
- endif()
- 
-+# pkg-config support
-+configure_file("gtest.pc.in" "gtest.pc" @ONLY)
-+
- ########################################################################
- #
- # Project-wide settings
-@@ -78,6 +81,9 @@ install(TARGETS gtest gtest_main
-   DESTINATION ${CMAKE_INSTALL_LIBDIR})
- install(DIRECTORY ${gtest_SOURCE_DIR}/include/gtest
-   DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
-+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gtest.pc"
-+    DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/"
-+)
- 
- ########################################################################
- #
-diff --git a/gtest.pc.in b/gtest.pc.in
-new file mode 100644
-index 0000000..52e622b
---- /dev/null
-+++ b/gtest.pc.in
-@@ -0,0 +1,9 @@
-+Name: libgtest
-+Version: 1.7.0
-+Description: Google's framework for writing C++ tests on a variety of platforms
-+
-+prefix=@CMAKE_INSTALL_PREFIX@
-+includedir=@CMAKE_INSTALL_INCLUDEDIR@
-+libdir=@CMAKE_INSTALL_LIBDIR@
-+Cflags:-I${includedir}/gtest
-+Libs: -L${libdir} -lgtest -lgtest_main
--- 
-2.5.0
-
diff --git a/meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch b/meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch
new file mode 100644
index 0000000..4c8977b
--- /dev/null
+++ b/meta-oe/recipes-test/gtest/gtest/Add-pkg-config-support.patch
@@ -0,0 +1,106 @@
+From ec9256bb704e94f41407fc8ace6a580491430196 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Thu, 15 Dec 2016 04:35:41 -0800
+Subject: [PATCH] Add pkg-config support
+
+Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
+Signed-off-by: Rodrigo Caimi <caimi@datacom.ind.br>
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ googlemock/CMakeLists.txt | 9 +++++++--
+ googlemock/gmock.pc.in    | 9 +++++++++
+ googletest/CMakeLists.txt | 9 +++++++--
+ googletest/gtest.pc.in    | 9 +++++++++
+ 4 files changed, 32 insertions(+), 4 deletions(-)
+ create mode 100644 googlemock/gmock.pc.in
+ create mode 100644 googletest/gtest.pc.in
+
+diff --git a/googlemock/CMakeLists.txt b/googlemock/CMakeLists.txt
+index beb259a..f17e2d7 100644
+--- a/googlemock/CMakeLists.txt
++++ b/googlemock/CMakeLists.txt
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
+@@ -104,9 +107,11 @@ endif()
+ #
+ # Install rules
+ install(TARGETS gmock gmock_main
+-  DESTINATION lib)
++  DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install(DIRECTORY ${gmock_SOURCE_DIR}/include/gmock
+-  DESTINATION include)
++  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gmock.pc"
++  DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/")
+ 
+ ########################################################################
+ #
+diff --git a/googlemock/gmock.pc.in b/googlemock/gmock.pc.in
+new file mode 100644
+index 0000000..04bc0b4
+--- /dev/null
++++ b/googlemock/gmock.pc.in
+@@ -0,0 +1,9 @@
++Name: libgmock
++Version: 1.8.0
++Description: Google's framework for writing C++ tests on a variety of platforms
++
++prefix=@CMAKE_INSTALL_PREFIX@
++includedir=@CMAKE_INSTALL_INCLUDEDIR@
++libdir=@CMAKE_INSTALL_LIBDIR@
++Cflags:-I${includedir}/gmock
++Libs: -L${libdir} -lgmock -lgmock_main
+diff --git a/googletest/CMakeLists.txt b/googletest/CMakeLists.txt
+index 621d0f0..58aaf54 100644
+--- a/googletest/CMakeLists.txt
++++ b/googletest/CMakeLists.txt
+@@ -34,6 +34,9 @@ if (COMMAND pre_project_set_up_hermetic_build)
+   pre_project_set_up_hermetic_build()
+ endif()
+ 
++# pkg-config support
++configure_file("gtest.pc.in" "gtest.pc" @ONLY)
++
+ ########################################################################
+ #
+ # Project-wide settings
+@@ -103,9 +106,11 @@ endif()
+ #
+ # Install rules
+ install(TARGETS gtest gtest_main
+-  DESTINATION lib)
++  DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install(DIRECTORY ${gtest_SOURCE_DIR}/include/gtest
+-  DESTINATION include)
++  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gtest.pc"
++  DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/")
+ 
+ ########################################################################
+ #
+diff --git a/googletest/gtest.pc.in b/googletest/gtest.pc.in
+new file mode 100644
+index 0000000..fb95152
+--- /dev/null
++++ b/googletest/gtest.pc.in
+@@ -0,0 +1,9 @@
++Name: libgtest
++Version: 1.8.0
++Description: Google's framework for writing C++ tests on a variety of platforms
++
++prefix=@CMAKE_INSTALL_PREFIX@
++includedir=@CMAKE_INSTALL_INCLUDEDIR@
++libdir=@CMAKE_INSTALL_LIBDIR@
++Cflags:-I${includedir}/gtest
++Libs: -L${libdir} -lgtest -lgtest_main
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-test/gtest/gtest_1.7.0.bb b/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
deleted file mode 100644
index 5bacf6c..0000000
--- a/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Google's framework for writing C++ tests"
-HOMEPAGE = "http://code.google.com/p/googletest/"
-SECTION = "libs"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
-
-SRC_URI = "\
-    http://googletest.googlecode.com/files/${BPN}-${PV}.zip \
-    file://0001-Add-install-command-for-libraries-and-headers.patch \
-    file://0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch \
-"
-
-SRC_URI[md5sum] = "2d6ec8ccdf5c46b05ba54a9fd1d130d7"
-SRC_URI[sha256sum] = "247ca18dd83f53deb1328be17e4b1be31514cedfc1e3424f672bf11fd7e0d60d"
-
-inherit lib_package cmake
-
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-dbg = "1"
-
-RDEPENDS_${PN}-dev += "${PN}-staticdev"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
new file mode 100644
index 0000000..483dc1f
--- /dev/null
+++ b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Google's framework for writing C++ tests"
+HOMEPAGE = "https://github.com/google/googletest"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
+                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
+
+PROVIDES += "gmock"
+
+SRC_URI = "\
+    https://github.com/google/googletest/archive/release-${PV}.tar.gz \
+    file://Add-pkg-config-support.patch \
+"
+
+SRC_URI[md5sum] = "16877098823401d1bf2ed7891d7dce36"
+SRC_URI[sha256sum] = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8"
+
+S = "${WORKDIR}/googletest-release-${PV}"
+
+inherit cmake
+
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dbg = "1"
+
+RDEPENDS_${PN}-dev += "${PN}-staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


