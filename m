Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob06.myregisteredsite.com
	(atl4mhob06.myregisteredsite.com [209.17.115.44])
	by mail.openembedded.org (Postfix) with ESMTP id BF65C65C7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 10:24:30 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob06.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t25AOU0v007091 for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Mar 2015 05:24:30 -0500
Received: (qmail 4060 invoked by uid 0); 5 Mar 2015 10:24:30 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 5 Mar 2015 10:24:29 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 11:24:25 +0100
Message-Id: <1425551065-23840-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20150305082106.GL2337@jama>
References: <20150305082106.GL2337@jama>
Subject: [meta-oe][PATCH v2] opencv: Upgrade to 2.4.11
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
X-List-Received-Date: Thu, 05 Mar 2015 10:24:33 -0000

Upgrade OpenCV to the 2.4.11 release.

Remove the opencv-fix-pkgconfig-generation patch which has been integrated upstream,
be it in modified form.
Disable 1394 support by default to get a deterministic build.
Fix "jasper" dependency, the BUILD_JASPER parameter served only to build an internal
library, while WITH_JASPER actually controls whether jpeg2000 support was desired.
---
v2: Fix non-deterministic jasper and lib1394 dependencies. Tested by first building
    these libraries and building opencv after that.

 .../opencv/opencv-fix-pkgconfig-generation.patch   | 44 ----------------------
 meta-oe/recipes-support/opencv/opencv_2.4.bb       | 11 +++---
 2 files changed, 5 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generation.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generation.patch b/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generation.patch
deleted file mode 100644
index d352778..0000000
--- a/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generation.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Fix pkg-config generation
-
-Replace absolute library path with library name spec and library search
-path option.
-
-The fix has been provided by Ray Rashif (code.opencv.org/issues/1925)
-
-Upstream-Status: Pending
-
-diff -Nbaur OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake OpenCV-2.4.3/cmake/OpenCVGenPkgconfig.cmake
---- OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40:14.243505926 +0000
-+++ OpenCV-2.4.3/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40:42.286649120 +0000
-@@ -10,7 +10,7 @@
- # -------------------------------------------------------------------------------------------
- set(prefix      "${CMAKE_INSTALL_PREFIX}")
- set(exec_prefix "\${prefix}")
--set(libdir      "") #TODO: need link paths for OpenCV_EXTRA_COMPONENTS
-+set(libdir      "\${prefix}/${OPENCV_LIB_INSTALL_PATH}")
- set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
- set(VERSION     ${OPENCV_VERSION})
- 
-@@ -36,10 +36,11 @@
- ocv_list_reverse(OpenCV_EXTRA_COMPONENTS)
- 
- #build the list of components
--set(OpenCV_LIB_COMPONENTS_ "")
-+set(OpenCV_LIB_COMPONENTS_ "-L\${libdir}")
- foreach(CVLib ${OpenCV_LIB_COMPONENTS})
-   get_target_property(libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
-   get_filename_component(libname "${libpath}" NAME)
-+  get_filename_component(lname "${libpath}" NAME_WE)
- 
-   if(INSTALL_TO_MANGLED_PATHS)
-     set(libname "${libname}.${OPENCV_VERSION}")
-@@ -52,7 +53,8 @@
-     set(installDir "${OPENCV_LIB_INSTALL_PATH}")
-   endif()
- 
--  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} \${exec_prefix}/${installDir}/${libname}")
-+  string(REPLACE "libopencv" "-lopencv" lname "${lname}")
-+  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} ${lname}")
- endforeach()
- 
- # add extra dependencies required for OpenCV
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 63d7c8b..2754616 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -9,12 +9,10 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
 
-SRCREV = "df8e28283f09825cca0c2902160b7abebcfe1b64"
-SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
-           file://opencv-fix-pkgconfig-generation.patch \
-"
+SRCREV = "2c9547e3147779001811d01936aed38f560929fc"
+SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4"
 
-PV = "2.4.9+git${SRCPV}"
+PV = "2.4.11+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -25,6 +23,7 @@ OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
 EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
                  -DBUILD_PYTHON_SUPPORT=ON \
                  -DWITH_GSTREAMER=OFF \
+                 -DWITH_1394=OFF \
                  -DCMAKE_SKIP_RPATH=ON \
                  ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
@@ -40,7 +39,7 @@ PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-PACKAGECONFIG[jasper] = "-DBUILD_JASPER=ON,-DBUILD_JASPER=OFF,jasper"
+PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
 
 inherit distutils-base pkgconfig cmake
 
-- 
1.9.1


