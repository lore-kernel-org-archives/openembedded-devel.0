Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 58CB8607A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 06:01:24 +0000 (UTC)
Received: from hulk.bmw-carit.intra (hulk.bmw-carit.intra [192.168.101.92])
	by linuxmail.bmw-carit.de (Postfix) with ESMTP id 5226D4032F;
	Fri, 23 Oct 2015 07:52:45 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2015 08:01:16 +0200
Message-Id: <1445580076-32195-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1445580076-32195-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1445580076-32195-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Subject: [PATCH 2/2] libeigen: patch to install the find cmake script
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

This commit is needed for the pcl-ros 1.3.0 recipe in the
meta-ros layer, which detects the Eigen library with the provided
cmake script.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 ...Lists.txt-install-FindEigen3.cmake-script.patch | 28 ++++++++++++++++++++++
 meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libeigen/libeigen/0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch

diff --git a/meta-oe/recipes-support/libeigen/libeigen/0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch b/meta-oe/recipes-support/libeigen/libeigen/0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch
new file mode 100644
index 0000000..761dadb
--- /dev/null
+++ b/meta-oe/recipes-support/libeigen/libeigen/0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch
@@ -0,0 +1,28 @@
+From fd8bc66efac1059c1068f804746b01b90177c333 Mon Sep 17 00:00:00 2001
+From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
+Date: Sun, 18 Oct 2015 16:52:25 +0200
+Subject: [PATCH] CMakeLists.txt: install FindEigen3.cmake script
+
+Upstream-Status: Pending
+
+Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 76a11b9..ec6c6ea 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -342,6 +342,8 @@ if(EIGEN_BUILD_PKGCONFIG)
+         )
+ endif(EIGEN_BUILD_PKGCONFIG)
+ 
++install(FILES "${PROJECT_SOURCE_DIR}/cmake/FindEigen3.cmake" DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake/Modules")
++
+ add_subdirectory(Eigen)
+ 
+ add_subdirectory(doc EXCLUDE_FROM_ALL)
+-- 
+1.9.3
+
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb b/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
index 4d73597..89a25a9 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2"
+SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2 \
+           file://0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch"
 SRC_URI[md5sum] = "87274966745d2d3e7964fcc654d0a24b"
 SRC_URI[sha256sum] = "8a3352f9a5361fe90e451a7305fb1896fc7f771dc16cc0edd8e6b157f52c343e"
 
@@ -15,6 +16,7 @@ inherit cmake
 EXTRA_OECMAKE += "-Dpkg_config_libdir=${libdir}"
 
 FILES_${PN} = "${includedir} ${libdir}"
+FILES_${PN}-dev = "${datadir}/cmake/Modules"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
1.9.3


