Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc7A-0006Vo-Mc
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:44 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so352488eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=QUop6BvCxlugtnz7qbTP5OQNbWTcgcUAuXS5Zb33kbc=;
	b=EbAjXg7eFikMyJdfio/Wc8SCxXTI0ecNHPciQ4rZ12ZVTOAeGjOR8hnh9Nr7E53uJW
	6jQ9oDBPnl2nZzGY4HwyQv+feLNOGtpQSyng1DvsP4nyaJaiW+vBwHfJhXyyS8KRGdPQ
	5zwBPZib8GokVXg2N4cQHdnQ9lgwYP5f+HgaB9YZMgebUE6KqsbM3gCghcwOXF3nYFB1
	y9dySRG59+YLw7eLxdws5mVff2l3b+chTLH/T5NJq59d+CXpchSbO5ihUL6k9vpgAPcQ
	YQwoRip/4f2VfbTsq7cd5wx+XfWMHPRHFt2H/tYoEoNx9/e9/ybFb++tn4cXWBpV7+nG
	Z9Cg==
Received: by 10.14.47.70 with SMTP id s46mr72742eeb.150.1342170812477;
	Fri, 13 Jul 2012 02:13:32 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a16sm23307805eeg.0.2012.07.13.02.13.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:09 +0200
Message-Id: <1342170730-14982-23-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlVANKqlhtviEPC/b85scAQJyBorinxnodwGzETofSU/BJqyEMRZ+xgJHobIwWmwCL6BEpp
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 23/24] opencv, opencv-samples: drop 2.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 09:24:44 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-support/opencv/opencv-samples_2.3.bb   |   42 -----------
 .../0001-Fix-CMakeLists.txt-numpy-detection.patch  |   37 ----------
 meta-oe/recipes-support/opencv/opencv_2.3.bb       |   76 --------------------
 3 files changed, 155 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv-samples_2.3.bb
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv_2.3.bb

diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.3.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.3.bb
deleted file mode 100644
index 89bbc01..0000000
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.3.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
-SECTION = "libs"
-LICENSE = "BSD"
-
-DEPENDS = "opencv"
-
-LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14 \
-"
-
-SRC_URI = "svn://code.ros.org/svn/opencv/tags/2.3.1;module=opencv;proto=https \
-"
-
-SRCREV = "7198"
-PV = "2.3.1"
-PR = "r2"
-
-S = "${WORKDIR}/opencv"
-
-do_install() {
-    cd samples/c
-	install -d ${D}/${bindir}
-	install -d ${D}/${datadir}/opencv/samples
-
-	cp * ${D}/${datadir}/opencv/samples || true
-
-    for i in *.c; do
-        echo "compiling $i"
-        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o `basename $i .c` $i `pkg-config --libs opencv` || true
-		install -m 0755 `basename $i .c` ${D}/${bindir} || true
-		rm ${D}/${datadir}/opencv/samples/`basename $i .c` || true
-	done
-    for i in *.cpp; do
-        echo "compiling $i"
-        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o `basename $i .cpp` $i `pkg-config --libs opencv` || true
-		install -m 0755 `basename $i .cpp` ${D}/${bindir} || true
-		rm ${D}/${datadir}/opencv/samples/`basename $i .cpp` || true
-	done
-}
-
-FILES_${PN}-dev += "${datadir}/opencv/samples/*.c* ${datadir}/opencv/samples/*.vcp* ${datadir}/opencv/samples/build*" 
-FILES_${PN} += "${bindir} ${datadir}/opencv"
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch b/meta-oe/recipes-support/opencv/opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch
deleted file mode 100644
index dba00f8..0000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a7301911a3cdf9196abd93ff894a9e86e0bcdc5e Mon Sep 17 00:00:00 2001
-From: Connor Abbott <cwabbott0@gmail.com>
-Date: Sun, 30 Oct 2011 20:00:03 -0400
-Subject: [PATCH] Fix CMakeLists.txt numpy detection
-
-Right now, the code opencv uses to detect where the numpy include files are doesn't work with cross-compiling because it uses the native python to determine the environment. To make this a little better, allow the user to explictly specify the path using -DPYTHON_NUMPY_INCLUDE_DIRS=path/to/numpy/include/dir .
-Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
----
- CMakeLists.txt |   12 ++++++++----
- 1 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ff8f20c..8edbd78 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -715,10 +715,14 @@ IF ("${PYTHON_VERSION_MAJOR_MINOR}" VERSION_GREATER 2.4)
- ENDIF()
- 
- # Attempt to discover the NumPy include directory. If this succeeds, then build python API with NumPy
--execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1'; import numpy.distutils; print numpy.distutils.misc_util.get_numpy_include_dirs()[0]"
--            RESULT_VARIABLE PYTHON_NUMPY_PROCESS
--            OUTPUT_VARIABLE PYTHON_NUMPY_INCLUDE_DIRS
--            OUTPUT_STRIP_TRAILING_WHITESPACE)
-+if(NOT DEFINED PYTHON_NUMPY_INCLUDE_DIRS)
-+    execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1'; import numpy.distutils; print numpy.distutils.misc_util.get_numpy_include_dirs()[0]"
-+                RESULT_VARIABLE PYTHON_NUMPY_PROCESS
-+                OUTPUT_VARIABLE PYTHON_NUMPY_INCLUDE_DIRS
-+                OUTPUT_STRIP_TRAILING_WHITESPACE)
-+else()
-+    set(PYTHON_NUMPY_PROCESS 0)
-+endif()
- 
- if(PYTHON_NUMPY_PROCESS EQUAL 0)
-     set(PYTHON_USE_NUMPY 1)
--- 
-1.7.4.1
-
diff --git a/meta-oe/recipes-support/opencv/opencv_2.3.bb b/meta-oe/recipes-support/opencv/opencv_2.3.bb
deleted file mode 100644
index 0534c27..0000000
--- a/meta-oe/recipes-support/opencv/opencv_2.3.bb
+++ /dev/null
@@ -1,76 +0,0 @@
-DESCRIPTION = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
-SECTION = "libs"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
-
-ARM_INSTRUCTION_SET = "arm"
-
-DEPENDS = "python-numpy gstreamer gtk+ libtool swig swig-native python jpeg bzip2 zlib libpng tiff glib-2.0"
-
-SRC_URI = "svn://code.ros.org/svn/opencv/tags/2.3.1;module=opencv;proto=https \
-           file://opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch \
-          "
-
-SRCREV = "7198"
-
-PV = "2.3.1"
-PR = "r3"
-
-S = "${WORKDIR}/opencv"
-
-EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIRS=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
-                 -DBUILD_PYTHON_SUPPORT=ON \
-                 -DWITH_FFMPEG=OFF \
-                 -DWITH_GSTREAMER=ON \
-                "
-
-inherit distutils-base pkgconfig cmake
-
-export BUILD_SYS
-export HOST_SYS
-export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON="${STAGING_BINDIR_NATIVE}/python"
-
-TARGET_CC_ARCH += "-I${S}/include "
-
-PACKAGES += "${PN}-apps python-opencv"
-
-python populate_packages_prepend () {
-	cv_libdir = bb.data.expand('${libdir}', d)
-	cv_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
-	do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
-	do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
-
-	pn = bb.data.getVar('PN', d, 1)
-	metapkg =  pn + '-dev'
-	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
-	blacklist = [ metapkg ]
-	metapkg_rdepends = [ ] 
-	packages = bb.data.getVar('PACKAGES', d, 1).split()
-	for pkg in packages[1:]:
-		if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
-			metapkg_rdepends.append(pkg)
-	bb.data.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
-}
-
-FILES_${PN} = ""
-FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-dbg += "${libdir}/.debug"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
-FILES_${PN}-doc = "${datadir}/OpenCV/doc"
-
-ALLOW_EMPTY_${PN} = "1"
-
-INSANE_SKIP_python-opencv = "True"
-DESCRIPTION_python-opencv = "Python bindings to opencv"
-FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-opencv = "python-core python-numpy"
-
-do_install_append() {
-	cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-	sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
-}
-- 
1.7.10



