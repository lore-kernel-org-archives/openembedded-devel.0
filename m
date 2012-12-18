Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1Tkv0X-0005AA-QQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 12:06:51 +0100
Received: from localhost.localdomain (sarotti.TechFak.Uni-Bielefeld.DE
	[129.70.144.156])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	894468002D; Tue, 18 Dec 2012 11:52:03 +0100 (CET)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 11:51:48 +0100
Message-Id: <1355827908-21336-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-oe][PATCH] opencv: fix pkg-config file generation
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
X-List-Received-Date: Tue, 18 Dec 2012 11:06:53 -0000

Replace absolute library path with library name spec and library search
path option in pkg-config file.

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 .../opencv/opencv-fix-pkgconfig-generation.patch   |   44 ++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_2.4.3.bb     |    3 +
 2 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generation.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generation.patch b/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generation.patch
new file mode 100644
index 0000000..d352778
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generation.patch
@@ -0,0 +1,44 @@
+Fix pkg-config generation
+
+Replace absolute library path with library name spec and library search
+path option.
+
+The fix has been provided by Ray Rashif (code.opencv.org/issues/1925)
+
+Upstream-Status: Pending
+
+diff -Nbaur OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake OpenCV-2.4.3/cmake/OpenCVGenPkgconfig.cmake
+--- OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40:14.243505926 +0000
++++ OpenCV-2.4.3/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40:42.286649120 +0000
+@@ -10,7 +10,7 @@
+ # -------------------------------------------------------------------------------------------
+ set(prefix      "${CMAKE_INSTALL_PREFIX}")
+ set(exec_prefix "\${prefix}")
+-set(libdir      "") #TODO: need link paths for OpenCV_EXTRA_COMPONENTS
++set(libdir      "\${prefix}/${OPENCV_LIB_INSTALL_PATH}")
+ set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
+ set(VERSION     ${OPENCV_VERSION})
+ 
+@@ -36,10 +36,11 @@
+ ocv_list_reverse(OpenCV_EXTRA_COMPONENTS)
+ 
+ #build the list of components
+-set(OpenCV_LIB_COMPONENTS_ "")
++set(OpenCV_LIB_COMPONENTS_ "-L\${libdir}")
+ foreach(CVLib ${OpenCV_LIB_COMPONENTS})
+   get_target_property(libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
+   get_filename_component(libname "${libpath}" NAME)
++  get_filename_component(lname "${libpath}" NAME_WE)
+ 
+   if(INSTALL_TO_MANGLED_PATHS)
+     set(libname "${libname}.${OPENCV_VERSION}")
+@@ -52,7 +53,8 @@
+     set(installDir "${OPENCV_LIB_INSTALL_PATH}")
+   endif()
+ 
+-  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} \${exec_prefix}/${installDir}/${libname}")
++  string(REPLACE "libopencv" "-lopencv" lname "${lname}")
++  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} ${lname}")
+ endforeach()
+ 
+ # add extra dependencies required for OpenCV
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
index 513e147..77d75da 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
@@ -10,11 +10,14 @@ ARM_INSTRUCTION_SET = "arm"
 DEPENDS = "python-numpy v4l-utils libav gtk+ libtool swig swig-native python jpeg bzip2 zlib libpng tiff glib-2.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz2 \
+           file://opencv-fix-pkgconfig-generation.patch \
            "
 
 SRC_URI[md5sum] = "c0a5af4ff9d0d540684c0bf00ef35dbe"
 SRC_URI[sha256sum] = "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b035233f58146f6f59b"
 
+PR = "r1"
+
 S = "${WORKDIR}/OpenCV-${PV}"
 
 EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
-- 
1.7.0.4



