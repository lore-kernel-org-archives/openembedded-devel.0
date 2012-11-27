Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1TdHlw-0000Of-Ik
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 10:48:09 +0100
Received: from localhost.localdomain (sarotti.TechFak.Uni-Bielefeld.DE
	[129.70.144.156])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	0D6268000E; Tue, 27 Nov 2012 10:33:54 +0100 (CET)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 10:33:33 +0100
Message-Id: <1354008813-15667-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353923798-29115-1-git-send-email-stefan@herbrechtsmeier.net>
References: <1353923798-29115-1-git-send-email-stefan@herbrechtsmeier.net>
Subject: [meta-oe][PATCH v3] opencv: update to 2.4.3 and fix some issues
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
X-List-Received-Date: Tue, 27 Nov 2012 09:48:09 -0000

* Update opencv and opencv-samples to 2.4.3
* Use tar instead of no longer available SVN repository
* Remove numpy detection patch and update related CMAKE variable
* Fix QA Issues: contains probably-redundant RPATH
* Add PACKAGES_DYNAMIC for split library packages

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 .../0001-Fix-CMakeLists.txt-numpy-detection.patch  |   36 --------------------
 ...encv-samples_2.4.bb => opencv-samples_2.4.3.bb} |   11 +++---
 .../opencv/{opencv_2.4.bb => opencv_2.4.3.bb}      |   18 +++++-----
 3 files changed, 14 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv-2.4.2/0001-Fix-CMakeLists.txt-numpy-detection.patch
 rename meta-oe/recipes-support/opencv/{opencv-samples_2.4.bb => opencv-samples_2.4.3.bb} (81%)
 rename meta-oe/recipes-support/opencv/{opencv_2.4.bb => opencv_2.4.3.bb} (84%)

diff --git a/meta-oe/recipes-support/opencv/opencv-2.4.2/0001-Fix-CMakeLists.txt-numpy-detection.patch b/meta-oe/recipes-support/opencv/opencv-2.4.2/0001-Fix-CMakeLists.txt-numpy-detection.patch
deleted file mode 100644
index 43f03d3..0000000
--- a/meta-oe/recipes-support/opencv/opencv-2.4.2/0001-Fix-CMakeLists.txt-numpy-detection.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 965616bdc73247448b8f07572a9a479235dd092d Mon Sep 17 00:00:00 2001
-From: Connor Abbott <cwabbott0@gmail.com>
-Date: Wed, 11 Jul 2012 13:55:38 +0200
-Subject: [PATCH] Fix CMakeLists.txt numpy detection
-
-Right now, the code opencv uses to detect where the numpy include files are doesn't work with cross-compiling because it uses the native python to determine the environment. To make this a little better, allow the user to explictly specify the path using -DPYTHON_NUMPY_INCLUDE_DIRS=path/to/numpy/include/dir .
-
-Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
----
- cmake/OpenCVDetectPython.cmake |    8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/OpenCVDetectPython.cmake b/cmake/OpenCVDetectPython.cmake
-index 8be94ca..5825a04 100644
---- a/cmake/OpenCVDetectPython.cmake
-+++ b/cmake/OpenCVDetectPython.cmake
-@@ -74,10 +74,14 @@ if(PYTHON_EXECUTABLE)
- 
-     if(NOT PYTHON_NUMPY_INCLUDE_DIR)
-       # Attempt to discover the NumPy include directory. If this succeeds, then build python API with NumPy
--      execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1'; import numpy.distutils; print numpy.distutils.misc_util.get_numpy_include_dirs()[0]"
-+      if(NOT DEFINED PYTHON_NUMPY_INCLUDE_DIRS)
-+          execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1'; import numpy.distutils; print numpy.distutils.misc_util.get_numpy_include_dirs()[0]"
-                       RESULT_VARIABLE PYTHON_NUMPY_PROCESS
--                      OUTPUT_VARIABLE PYTHON_NUMPY_INCLUDE_DIR
-+                      OUTPUT_VARIABLE PYTHON_NUMPY_INCLUDE_DIRS
-                       OUTPUT_STRIP_TRAILING_WHITESPACE)
-+      else()
-+          set(PYTHON_NUMPY_PROCESS 0)
-+      endif()
-                       
-       if(PYTHON_NUMPY_PROCESS EQUAL 0)
-         file(TO_CMAKE_PATH "${PYTHON_NUMPY_INCLUDE_DIR}" _PYTHON_NUMPY_INCLUDE_DIR)
--- 
-1.7.10
-
diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
similarity index 81%
rename from meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
rename to meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
index 7ede7c7..3d76226 100644
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
@@ -8,14 +8,13 @@ DEPENDS = "opencv"
 LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14 \
 "
 
-SRC_URI = "svn://code.opencv.org/svn/opencv/branches/2.4;module=opencv;protocol=http \
-          "
+SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz2 \
+           "
 
-SRCREV = "8988"
+SRC_URI[md5sum] = "c0a5af4ff9d0d540684c0bf00ef35dbe"
+SRC_URI[sha256sum] = "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b035233f58146f6f59b"
 
-PV = "2.4.2"
-
-S = "${WORKDIR}/opencv"
+S = "${WORKDIR}/OpenCV-${PV}"
 
 do_install() {
     cd samples/c
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
similarity index 84%
rename from meta-oe/recipes-support/opencv/opencv_2.4.bb
rename to meta-oe/recipes-support/opencv/opencv_2.4.3.bb
index 2877093..513e147 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
@@ -9,23 +9,21 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS = "python-numpy v4l-utils libav gtk+ libtool swig swig-native python jpeg bzip2 zlib libpng tiff glib-2.0"
 
-SRC_URI = "svn://code.opencv.org/svn/opencv/branches/2.4;module=opencv;protocol=http \
-           file://0001-Fix-CMakeLists.txt-numpy-detection.patch \
-          "
+SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz2 \
+           "
 
-SRCREV = "8988"
+SRC_URI[md5sum] = "c0a5af4ff9d0d540684c0bf00ef35dbe"
+SRC_URI[sha256sum] = "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b035233f58146f6f59b"
 
-PV = "2.4.2"
-PR = "r1"
+S = "${WORKDIR}/OpenCV-${PV}"
 
-S = "${WORKDIR}/opencv"
-
-EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIRS=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
+EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
                  -DBUILD_PYTHON_SUPPORT=ON \
                  -DWITH_FFMPEG=ON \
                  -DWITH_GSTREAMER=OFF \
                  -DWITH_V4L=ON \
                  -DWITH_GTK=ON \
+                 -DCMAKE_SKIP_RPATH=ON \
                 "
 
 inherit distutils-base pkgconfig cmake
@@ -59,6 +57,8 @@ python populate_packages_prepend () {
     d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
 }
 
+PACKAGES_DYNAMIC += "^libopencv-.*"
+
 FILES_${PN} = ""
 FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
 FILES_${PN}-dbg += "${libdir}/.debug"
-- 
1.7.0.4



