Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 57C3E6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 06:01:24 +0000 (UTC)
Received: from hulk.bmw-carit.intra (hulk.bmw-carit.intra [192.168.101.92])
	by linuxmail.bmw-carit.de (Postfix) with ESMTP id DFE91401A9;
	Fri, 23 Oct 2015 07:52:43 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2015 08:01:15 +0200
Message-Id: <1445580076-32195-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 1/2] libeigen: update to 3.2.6
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
X-List-Received-Date: Fri, 23 Oct 2015 06:01:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It seems that the libeigen patch is not required anymore. I could
not find any issue while building libeigen and other recipes
depending on libeigen.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 .../libeigen/libeigen/eigen-disable-tests.patch    | 75 ----------------------
 meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb | 22 -------
 meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb | 21 ++++++
 3 files changed, 21 insertions(+), 97 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libeigen/libeigen/eigen-disable-tests.patch
 delete mode 100644 meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb
 create mode 100644 meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb

diff --git a/meta-oe/recipes-support/libeigen/libeigen/eigen-disable-tests.patch b/meta-oe/recipes-support/libeigen/libeigen/eigen-disable-tests.patch
deleted file mode 100644
index b3dddbe..0000000
--- a/meta-oe/recipes-support/libeigen/libeigen/eigen-disable-tests.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-libeigen: don't try building tests
-
-While configuring, if the tests are enabled, it checks some machine-specific
-settings which we don't want to do while cross-compiling.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
-
---- a/CMakeLists.txt~	2013-07-29 16:59:48.403504947 -0400
-+++ b/CMakeLists.txt	2013-07-29 17:00:19.868020948 -0400
-@@ -346,25 +346,25 @@
-
- add_subdirectory(doc EXCLUDE_FROM_ALL)
-
--include(EigenConfigureTesting)
-+#include(EigenConfigureTesting)
-
- # fixme, not sure this line is still needed:
--enable_testing() # must be called from the root CMakeLists, see man page
-+#enable_testing() # must be called from the root CMakeLists, see man page
-
-
--if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
--  add_subdirectory(test) # can't do EXCLUDE_FROM_ALL here, breaks CTest
--else()
--  add_subdirectory(test EXCLUDE_FROM_ALL)
--endif()
-+#if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
-+#  add_subdirectory(test) # can't do EXCLUDE_FROM_ALL here, breaks CTest
-+#else()
-+#  add_subdirectory(test EXCLUDE_FROM_ALL)
-+#endif()
-
--if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
--  add_subdirectory(blas)
--  add_subdirectory(lapack)
--else()
--  add_subdirectory(blas EXCLUDE_FROM_ALL)
--  add_subdirectory(lapack EXCLUDE_FROM_ALL)
--endif()
-+#if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
-+#  add_subdirectory(blas)
-+#  add_subdirectory(lapack)
-+#else()
-+#  add_subdirectory(blas EXCLUDE_FROM_ALL)
-+#  add_subdirectory(lapack EXCLUDE_FROM_ALL)
-+#endif()
-
- add_subdirectory(unsupported)
-
-@@ -384,7 +384,7 @@
-
- configure_file(scripts/cdashtesting.cmake.in cdashtesting.cmake @ONLY)
-
--ei_testing_print_summary()
-+#ei_testing_print_summary()
-
- message(STATUS "")
- message(STATUS "Configured Eigen ${EIGEN_VERSION_NUMBER}")
---- a/unsupported/CMakeLists.txt~	2013-07-29 16:59:54.091598607 -0400
-+++ b/unsupported/CMakeLists.txt	2013-07-29 17:00:27.052139300 -0400
-@@ -1,7 +1,7 @@
- add_subdirectory(Eigen)
- add_subdirectory(doc EXCLUDE_FROM_ALL)
--if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
--  add_subdirectory(test) # can't do EXCLUDE_FROM_ALL here, breaks CTest
--else()
--  add_subdirectory(test EXCLUDE_FROM_ALL)
--endif()
-+#if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
-+#  add_subdirectory(test) # can't do EXCLUDE_FROM_ALL here, breaks CTest
-+#else()
-+#  add_subdirectory(test EXCLUDE_FROM_ALL)
-+#endif()
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb
deleted file mode 100644
index de5186f..0000000
--- a/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
-AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
-HOMEPAGE = "http://eigen.tuxfamily.org/"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
-
-SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2 \
-           file://eigen-disable-tests.patch"
-SRC_URI[md5sum] = "894381be5be65bb7099c6fd91d61b357"
-SRC_URI[sha256sum] = "011f78960d939227f9276173d0c4cc0053bb9e0a7356539a9a6c7c89d984fab6"
-
-S = "${WORKDIR}/eigen-eigen-ffa86ffb5570"
-
-inherit cmake
-
-EXTRA_OECMAKE += "-Dpkg_config_libdir=${libdir}"
-
-FILES_${PN} = "${includedir} ${libdir}"
-
-# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb b/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
new file mode 100644
index 0000000..4d73597
--- /dev/null
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
+AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
+HOMEPAGE = "http://eigen.tuxfamily.org/"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
+
+SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2"
+SRC_URI[md5sum] = "87274966745d2d3e7964fcc654d0a24b"
+SRC_URI[sha256sum] = "8a3352f9a5361fe90e451a7305fb1896fc7f771dc16cc0edd8e6b157f52c343e"
+
+S = "${WORKDIR}/eigen-eigen-c58038c56923"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-Dpkg_config_libdir=${libdir}"
+
+FILES_${PN} = "${includedir} ${libdir}"
+
+# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
1.9.3


