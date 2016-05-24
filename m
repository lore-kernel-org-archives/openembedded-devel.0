Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4914373169
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 11:56:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2016 04:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498874"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:56:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2016 14:56:54 +0300
Message-Id: <81bcad0615d82454dfc8f9cc7f5d014ed9d1d80a.1464090710.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/8] Remove unnecessary exports of HOST_SYS and BUILD_SYS in python-based recipes
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
X-List-Received-Date: Tue, 24 May 2016 11:56:07 -0000

They are no longer required to build python software.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-efl/recipes-devtools/python/python-edbus.inc                  | 4 ----
 meta-efl/recipes-devtools/python/python-efl.inc                    | 4 ----
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb               | 2 --
 meta-networking/classes/waf-samba.bbclass                          | 2 --
 meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb       | 2 +-
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb        | 2 --
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb                     | 2 --
 meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb              | 2 --
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb                  | 2 --
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb                       | 6 ------
 meta-oe/recipes-support/opencv/opencv_2.4.bb                       | 2 --
 meta-oe/recipes-support/opencv/opencv_3.1.bb                       | 2 --
 meta-oe/recipes-support/postgresql/postgresql.inc                  | 2 +-
 meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb     | 3 ---
 meta-python/recipes-devtools/python/python-six.inc                 | 1 -
 meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb | 1 -
 16 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-edbus.inc b/meta-efl/recipes-devtools/python/python-edbus.inc
index 3e72261..cc60083 100644
--- a/meta-efl/recipes-devtools/python/python-edbus.inc
+++ b/meta-efl/recipes-devtools/python/python-edbus.inc
@@ -8,10 +8,6 @@ AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
 DEPENDS = "python-cython-native python-pyrex-native python-numeric eina edbus python-dbus"
 RDEPENDS_${PN} += "python-lang python-dbus"
 
-# necessary to let the call for python-config succeed
-export BUILD_SYS
-export HOST_SYS
-
 inherit e-base autotools pkgconfig distutils-base
 
 SRCNAME = "python-e_dbus"
diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index 92a26ed..6837dab 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -13,10 +13,6 @@ RDEPENDS_${PN} += "python-lang"
 
 PROVIDES = "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas"
 
-# necessary to let the call for python-config succeed
-export BUILD_SYS
-export HOST_SYS
-
 inherit e-base distutils pkgconfig
 
 SRCVER = "${PV}"
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index f14d4e1..0d8dd5c 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -52,8 +52,6 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 EXTRA_OECONF_append_armv7a = "--cpu=cortex-a8"
 
 # for python modules
-export HOST_SYS
-export BUILD_SYS
 export STAGING_LIBDIR
 export STAGING_INCDIR
 export PYTHON_DIR
diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index 45fbcc3..772bc75 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -65,8 +65,6 @@ do_configure() {
                 -L ${STAGING_DIR_HOST} \
                 -E LD_LIBRARY_PATH=${libdir_qemu}:${base_libdir_qemu}"
 
-    export BUILD_SYS=${BUILD_SYS}
-    export HOST_SYS=${HOST_SYS}
     export BUILD_ARCH=${BUILD_ARCH}
     export HOST_ARCH=${HOST_ARCH}
     export STAGING_LIBDIR=${STAGING_LIBDIR}
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb
index 303a032..aeec195 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/mercurial-${PV}"
 inherit native
 
 EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
-    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} PREFIX=${prefix}"
+    PREFIX=${prefix}"
 
 do_configure_append () {
     sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
index a2747c3..e203198 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
@@ -24,8 +24,6 @@ EXTRA_OECMAKE = "-DLIB='${baselib}' \
                  -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
 
 do_configure_prepend() {
-    export HOST_SYS=${HOST_SYS}
-    export BUILD_SYS=${BUILD_SYS}
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
     export ENV_INSTALL_PATH=${PYTHON_SITEPACKAGES_DIR}
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 86628b1..9848e5a 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -15,8 +15,6 @@ DEPENDS += "cups python libusb"
 
 inherit autotools-brokensep python-dir pythonnative pkgconfig
 
-export BUILD_SYS
-export HOST_SYS
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
index 52b271c..af9633d 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
@@ -39,8 +39,6 @@ EXTRA_OECMAKE = "-DBUILD_BINDINGS=NO \
                 "
 
 do_configure_prepend() {
-    export HOST_SYS=${HOST_SYS}
-    export BUILD_SYS=${BUILD_SYS}
     export STAGING_INCDIR=${STAGING_INCDIR}
     export STAGING_LIBDIR=${STAGING_LIBDIR}
 }
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 73a5d0e..a43e770 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -50,8 +50,6 @@ EXTRA_OECONF = " \
     --disable-rpath \
 "
 
-export BUILD_SYS
-export HOST_SYS
 export STAGING_LIBDIR
 export STAGING_INCDIR
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index aef9b13..6b883a8 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -55,9 +55,6 @@ do_compile_prepend() {
     export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
     export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
-
-    export BUILD_SYS="${BUILD_SYS}"
-    export HOST_SYS="${HOST_SYS}"
 }
 
 do_install() {
@@ -65,9 +62,6 @@ do_install() {
     export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
 
-    export BUILD_SYS="${BUILD_SYS}"
-    export HOST_SYS="${HOST_SYS}"
-
     export DESTDIR="${D}"
     # prefix is used for RPATH and DESTDIR/prefix for instalation
     ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} install ${EXTRA_OESCONS}|| \
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index eb38a5a..83e7de8 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -50,8 +50,6 @@ PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
 
 inherit distutils-base pkgconfig cmake
 
-export BUILD_SYS
-export HOST_SYS
 export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
 export PYTHON="${STAGING_BINDIR_NATIVE}/python"
 
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 789512f..961b9cb 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -70,8 +70,6 @@ PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
 
 inherit distutils-base pkgconfig cmake
 
-export BUILD_SYS
-export HOST_SYS
 export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
 export PYTHON="${STAGING_BINDIR_NATIVE}/python"
 export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 288a2d1..32ffe19 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -113,7 +113,7 @@ python populate_packages_prepend() {
 do_configure() {
     # do_configure_prepend
     # make sure configure finds python includdirs with these envs
-    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+    export \
            STAGING_INCDIR=${STAGING_INCDIR} \
            STAGING_LIBDIR=${STAGING_LIBDIR}
 
diff --git a/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
index 69f71c7..133e66d 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
@@ -19,15 +19,12 @@ EXTRA_OECONF = "--disable-docs --with-python-includes=${STAGING_INCDIR}/../"
 inherit distutils
 
 do_compile_prepend() {
-    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
     ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
     true
 }
 
 # need to export these variables for python-config to work
 export PYTHONPATH
-export BUILD_SYS
-export HOST_SYS
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
index 408c60e..625cbad 100644
--- a/meta-python/recipes-devtools/python/python-six.inc
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -6,7 +6,6 @@ SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
 SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
 
 do_compile_append() {
-    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
     ${PYTHON} setup.py -q bdist_egg --dist-dir ./
 }
 do_install_append() {
diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
index e87e50f..0df18f5 100644
--- a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
@@ -10,7 +10,6 @@ SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357
 inherit pypi setuptools
 
 do_compile_append() {
-    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
     ${PYTHON} setup.py -q bdist_egg --dist-dir ./
 }
 
-- 
2.8.1


