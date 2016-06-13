Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (unknown [212.118.206.70])
	by mail.openembedded.org (Postfix) with ESMTP id B20F6607F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 12:23:31 +0000 (UTC)
Received: from hulk.bmw-carit.intra (unknown [10.10.50.129])
	by linuxmail.bmw-carit.de (Postfix) with ESMTP id 371CA40411;
	Mon, 13 Jun 2016 14:15:27 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jun 2016 14:23:28 +0200
Message-Id: <1465820608-5732-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] libeigen: update to 3.2.8
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
X-List-Received-Date: Mon, 13 Jun 2016 12:23:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Due to the update, the pkg_config_libdir configuration has become
obsolete, and instead the pkgconfig directory must be added to the
dev-package.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb | 23 ----------------------
 meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb | 21 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 23 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
 create mode 100644 meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb b/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
deleted file mode 100644
index 89a25a9..0000000
--- a/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
-AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
-HOMEPAGE = "http://eigen.tuxfamily.org/"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
-
-SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2 \
-           file://0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch"
-SRC_URI[md5sum] = "87274966745d2d3e7964fcc654d0a24b"
-SRC_URI[sha256sum] = "8a3352f9a5361fe90e451a7305fb1896fc7f771dc16cc0edd8e6b157f52c343e"
-
-S = "${WORKDIR}/eigen-eigen-c58038c56923"
-
-inherit cmake
-
-EXTRA_OECMAKE += "-Dpkg_config_libdir=${libdir}"
-
-FILES_${PN} = "${includedir} ${libdir}"
-FILES_${PN}-dev = "${datadir}/cmake/Modules"
-
-# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb b/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
new file mode 100644
index 0000000..9e14ee1
--- /dev/null
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
+AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
+HOMEPAGE = "http://eigen.tuxfamily.org/"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
+
+SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2 \
+           file://0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch"
+SRC_URI[md5sum] = "9e3bfaaab3db18253cfd87ea697b3ab1"
+SRC_URI[sha256sum] = "722a63d672b70f39c271c5e2a4a43ba14d12015674331790414fcb167c357e55"
+
+S = "${WORKDIR}/eigen-eigen-07105f7124f9"
+
+inherit cmake
+
+FILES_${PN} = "${includedir} ${libdir}"
+FILES_${PN}-dev = "${datadir}/cmake/Modules ${datadir}/pkgconfig"
+
+# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.5.5


