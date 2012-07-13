Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc77-0006VU-5Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:41 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=X5E3zLa7sSyJiio/DAv015TaaF7UQN6z1EHQGKhvqLs=;
	b=UAgYNcj7jIZg37DDsGtT0wzTnb+nhXV4GX7E+18b3g7rrFhTN9BqlbtOeD5pebsg5t
	1z03zzP3KNNR1BNnQd9t5a6dpOByfoCpIV9hpQQJM2EzBNM4PYwfb8CK92w9k8E4n4Je
	XG+C98MsHJn/nvOBPNjJRdW82SurL5OkajIXR9gg4lDdB65/fTUCjoH7h9aZuKYAJ+TL
	x1phHHyYkGfel4AqgLZ9Z/TG4batXoND4dTwX/tejqgzgZ5AqiLVGF/HqwROVneniAAt
	odAetCSS+1/sPL9dwiD7apqN68wO+xY2hV3uGQ49Ki6s6QOxXvwFhRofKOaPuDkJihvn
	rPWw==
Received: by 10.14.96.207 with SMTP id r55mr75718eef.137.1342170808928;
	Fri, 13 Jul 2012 02:13:28 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id y11sm16447736eea.13.2012.07.13.02.13.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:08 +0200
Message-Id: <1342170730-14982-22-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk+akDrgFaHBvohav6AoJ4NNZYQKP9eoHyqDstHBDWBGsFB5bNCNhIX7xX7JSLaSZ/N08GF
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 22/24] opencv, opencv-samples: add 2.4.2
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
X-List-Received-Date: Fri, 13 Jul 2012 09:27:20 -0000

Libav is easier to get right than gstreamer, so switch back. Also enable libv4l for better v4l(2) support

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0001-Fix-CMakeLists.txt-numpy-detection.patch  |   36 +++++++++
 .../recipes-support/opencv/opencv-samples_2.4.bb   |   42 +++++++++++
 meta-oe/recipes-support/opencv/opencv_2.4.bb       |   77 ++++++++++++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv-2.4.2/0001-Fix-CMakeLists.txt-numpy-detection.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
 create mode 100644 meta-oe/recipes-support/opencv/opencv_2.4.bb

diff --git a/meta-oe/recipes-support/opencv/opencv-2.4.2/0001-Fix-CMakeLists.txt-numpy-detection.patch b/meta-oe/recipes-support/opencv/opencv-2.4.2/0001-Fix-CMakeLists.txt-numpy-detection.patch
new file mode 100644
index 0000000..43f03d3
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv-2.4.2/0001-Fix-CMakeLists.txt-numpy-detection.patch
@@ -0,0 +1,36 @@
+From 965616bdc73247448b8f07572a9a479235dd092d Mon Sep 17 00:00:00 2001
+From: Connor Abbott <cwabbott0@gmail.com>
+Date: Wed, 11 Jul 2012 13:55:38 +0200
+Subject: [PATCH] Fix CMakeLists.txt numpy detection
+
+Right now, the code opencv uses to detect where the numpy include files are doesn't work with cross-compiling because it uses the native python to determine the environment. To make this a little better, allow the user to explictly specify the path using -DPYTHON_NUMPY_INCLUDE_DIRS=path/to/numpy/include/dir .
+
+Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
+---
+ cmake/OpenCVDetectPython.cmake |    8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/OpenCVDetectPython.cmake b/cmake/OpenCVDetectPython.cmake
+index 8be94ca..5825a04 100644
+--- a/cmake/OpenCVDetectPython.cmake
++++ b/cmake/OpenCVDetectPython.cmake
+@@ -74,10 +74,14 @@ if(PYTHON_EXECUTABLE)
+ 
+     if(NOT PYTHON_NUMPY_INCLUDE_DIR)
+       # Attempt to discover the NumPy include directory. If this succeeds, then build python API with NumPy
+-      execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1'; import numpy.distutils; print numpy.distutils.misc_util.get_numpy_include_dirs()[0]"
++      if(NOT DEFINED PYTHON_NUMPY_INCLUDE_DIRS)
++          execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1'; import numpy.distutils; print numpy.distutils.misc_util.get_numpy_include_dirs()[0]"
+                       RESULT_VARIABLE PYTHON_NUMPY_PROCESS
+-                      OUTPUT_VARIABLE PYTHON_NUMPY_INCLUDE_DIR
++                      OUTPUT_VARIABLE PYTHON_NUMPY_INCLUDE_DIRS
+                       OUTPUT_STRIP_TRAILING_WHITESPACE)
++      else()
++          set(PYTHON_NUMPY_PROCESS 0)
++      endif()
+                       
+       if(PYTHON_NUMPY_PROCESS EQUAL 0)
+         file(TO_CMAKE_PATH "${PYTHON_NUMPY_INCLUDE_DIR}" _PYTHON_NUMPY_INCLUDE_DIR)
+-- 
+1.7.10
+
diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
new file mode 100644
index 0000000..90f7536
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Opencv : The Open Computer Vision Library"
+HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
+SECTION = "libs"
+LICENSE = "BSD"
+
+DEPENDS = "opencv"
+
+LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14 \
+"
+
+SRC_URI = "svn://code.opencv.org/svn/opencv/branches/2.4;module=opencv;proto=http \
+          "
+
+SRCREV = "8988"
+
+PV = "2.4.2"
+
+S = "${WORKDIR}/opencv"
+
+do_install() {
+    cd samples/c
+	install -d ${D}/${bindir}
+	install -d ${D}/${datadir}/opencv/samples
+
+	cp * ${D}/${datadir}/opencv/samples || true
+
+    for i in *.c; do
+        echo "compiling $i"
+        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o `basename $i .c` $i `pkg-config --libs opencv` || true
+		install -m 0755 `basename $i .c` ${D}/${bindir} || true
+		rm ${D}/${datadir}/opencv/samples/`basename $i .c` || true
+	done
+    for i in *.cpp; do
+        echo "compiling $i"
+        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o `basename $i .cpp` $i `pkg-config --libs opencv` || true
+		install -m 0755 `basename $i .cpp` ${D}/${bindir} || true
+		rm ${D}/${datadir}/opencv/samples/`basename $i .cpp` || true
+	done
+}
+
+FILES_${PN}-dev += "${datadir}/opencv/samples/*.c* ${datadir}/opencv/samples/*.vcp* ${datadir}/opencv/samples/build*" 
+FILES_${PN} += "${bindir} ${datadir}/opencv"
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
new file mode 100644
index 0000000..e56eacd
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -0,0 +1,77 @@
+DESCRIPTION = "Opencv : The Open Computer Vision Library"
+HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
+SECTION = "libs"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
+
+ARM_INSTRUCTION_SET = "arm"
+
+DEPENDS = "python-numpy v4l-utils libav gtk+ libtool swig swig-native python jpeg bzip2 zlib libpng tiff glib-2.0"
+
+SRC_URI = "svn://code.opencv.org/svn/opencv/branches/2.4;module=opencv;proto=http \
+           file://0001-Fix-CMakeLists.txt-numpy-detection.patch \
+          "
+
+SRCREV = "8988"
+
+PV = "2.4.2"
+
+S = "${WORKDIR}/opencv"
+
+EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIRS=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
+                 -DBUILD_PYTHON_SUPPORT=ON \
+                 -DWITH_FFMPEG=ON \
+                 -DWITH_GSTREAMER=OFF \
+                 -DWITH_V4L=ON \
+                 -DWITH_GTK=ON \
+                "
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
+	cv_libdir = bb.data.expand('${libdir}', d)
+	cv_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
+	do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
+	do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+	do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+	do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
+
+	pn = bb.data.getVar('PN', d, 1)
+	metapkg =  pn + '-dev'
+	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
+	blacklist = [ metapkg ]
+	metapkg_rdepends = [ ] 
+	packages = bb.data.getVar('PACKAGES', d, 1).split()
+	for pkg in packages[1:]:
+		if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
+			metapkg_rdepends.append(pkg)
+	bb.data.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+}
+
+FILES_${PN} = ""
+FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
+FILES_${PN}-dbg += "${libdir}/.debug"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
+FILES_${PN}-doc = "${datadir}/OpenCV/doc"
+
+ALLOW_EMPTY_${PN} = "1"
+
+INSANE_SKIP_python-opencv = "True"
+DESCRIPTION_python-opencv = "Python bindings to opencv"
+FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python-opencv = "python-core python-numpy"
+
+do_install_append() {
+	cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
+	sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
+}
-- 
1.7.10



