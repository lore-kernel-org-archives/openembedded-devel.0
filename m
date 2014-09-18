Return-Path: <nickdademo@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id A7B6A60144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 12:05:40 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id ft15so1281615pdb.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MdMGWSQD8oDvsBzF2plqbrCYadcTJ+oBlkRHNFwR2w8=;
	b=jU6hDskTtPceCTaKYttciQyaJkNMlrb+VYsgYSWm9uU9hUrqXv5gcrIkBjo8d+LfiW
	8JKLdApj9t6GJTBOG3CBpb+r9MDq/lUqreP/B/b2k1AvZeZFcrpvbybSdhRGIbshwXPT
	W0ca5SvS9i7mq8OF2SLsBhRKnjYZwMMlK1/aT99V0H6WXdB6ea09BkDviGBhfo1Pjdw6
	mCnMaTxhjftjPnEU3rz+a1Rr+Gb490JvUQVLvIJ0msUVR6ywAqFrVthXk9FkQMNuR9MX
	SlgDnA02Md8QL8sqG1fnF5pQ7Jo3emnEK1Uk5SQLh7OjuOFBp8bcxqZ7UQWmyTVoQD4e
	sssw==
X-Received: by 10.66.165.4 with SMTP id yu4mr3884439pab.157.1411041940191;
	Thu, 18 Sep 2014 05:05:40 -0700 (PDT)
Received: from localhost.localdomain
	(d122-111-84-208.meb803.vic.optusnet.com.au. [122.111.84.208])
	by mx.google.com with ESMTPSA id
	fk10sm20136342pab.29.2014.09.18.05.05.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Sep 2014 05:05:39 -0700 (PDT)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Sep 2014 22:05:27 +1000
Message-Id: <1411041927-9041-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] opencv: Add recipe for OpenCV v3.0.0-alpha.
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
X-List-Received-Date: Thu, 18 Sep 2014 12:05:40 -0000

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.0.0.bb | 95 ++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.0.bb

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.0.bb
new file mode 100644
index 0000000..3922964
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.0.bb
@@ -0,0 +1,95 @@
+DESCRIPTION = "Opencv : The Open Computer Vision Library"
+HOMEPAGE = "http://opencv.org/"
+SECTION = "libs"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
+
+ARM_INSTRUCTION_SET = "arm"
+
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 gstreamer gst-plugins-base"
+
+# Commit hash for 3.0.0-alpha tag
+SRCREV = "fb9a143429f86603ff93e5bcb2d94b94780b7234"
+SRC_URI = "git://github.com/Itseez/opencv.git;branch=master \
+           file://opencv-fix-pkgconfig-generation.patch \
+"
+
+PV = "3.0.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+# Do an out-of-tree build
+OECMAKE_SOURCEPATH = "${S}"
+OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
+
+EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
+                 -DBUILD_PYTHON_SUPPORT=ON \
+                 -DWITH_FFMPEG=ON \
+                 -DCMAKE_SKIP_RPATH=ON \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+"
+
+PACKAGECONFIG ??= "eigen gtk jpeg libav png tiff v4l jasper"
+PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
+PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
+PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
+PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
+PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
+PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+PACKAGECONFIG[jasper] = "-DBUILD_JASPER=ON,-DBUILD_JASPER=OFF,jasper"
+PACKAGECONFIG[pvapi] = '-DWITH_PVAPI=ON -DPVAPI_LIBRARY="${STAGING_LIBDIR}/libPvAPI.a",-DWITH_PVAPI=OFF,pvapi'
+
+inherit distutils-base pkgconfig cmake
+
+export BUILD_SYS
+export HOST_SYS
+export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
+export PYTHON="${STAGING_BINDIR_NATIVE}/python"
+
+TARGET_CC_ARCH += "-I${S}/include "
+
+PACKAGES += "${PN}-apps python-opencv"
+
+python populate_packages_prepend () {
+    cv_libdir = d.expand('${libdir}')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
+    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
+
+    pn = d.getVar('PN', 1)
+    metapkg =  pn + '-dev'
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    blacklist = [ metapkg ]
+    metapkg_rdepends = [ ] 
+    packages = d.getVar('PACKAGES', 1).split()
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
+            metapkg_rdepends.append(pkg)
+    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
+}
+
+PACKAGES_DYNAMIC += "^libopencv-.*"
+
+FILES_${PN} = ""
+FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
+FILES_${PN}-dbg += "${libdir}/.debug"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
+FILES_${PN}-doc = "${datadir}/OpenCV/doc"
+FILES_${PN}-staticdev += "${datadir}/OpenCV/3rdparty${base_libdir}"
+
+ALLOW_EMPTY_${PN} = "1"
+
+INSANE_SKIP_python-opencv = "True"
+DESCRIPTION_python-opencv = "Python bindings to opencv"
+FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python-opencv = "python-core python-numpy"
+
+do_install_append() {
+    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
+    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
+}
-- 
1.9.1


