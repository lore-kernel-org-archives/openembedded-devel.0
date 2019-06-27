Return-Path: <chin.huat.ang@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 35D5E7D419
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 21:46:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 14:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,425,1557212400"; d="scan'208";a="313939879"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 27 Jun 2019 14:46:38 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 05:46:21 +0800
Message-Id: <1561671981-67750-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] opencv: 3.4.5 -> 4.1.0
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
X-List-Received-Date: Thu, 27 Jun 2019 21:46:39 -0000

Update both opencv and opencv_contrib to 4.1.0 and refresh all patches.

Remove tiny-dnn from SRC_URI as it is not picked up by opencv cmake
build system. This also fixes a QA warning about using unstable github
archive.

Also update FILES_* to capture new paths which uses new directory name
"opencv4" instead of "OpenCV".

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch |   8 +-
 .../opencv/opencv/0001-Dont-use-isystem.patch      |   8 +-
 ...-work-around-deprecated-ffmpeg-RAW-functi.patch |  10 +-
 ...-ts-create-share-library-intead-of-static.patch |  10 +-
 .../opencv/0003-To-fix-errors-as-following.patch   |  37 ++--
 .../opencv/opencv/fixpkgconfig.patch               |  30 ----
 .../opencv/opencv/uselocalxfeatures.patch          |  20 ---
 meta-oe/recipes-support/opencv/opencv_3.4.5.bb     | 190 ---------------------
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb     | 180 +++++++++++++++++++
 9 files changed, 213 insertions(+), 280 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv_3.4.5.bb
 create mode 100644 meta-oe/recipes-support/opencv/opencv_4.1.0.bb

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
index 4d76ad4..5f909c1 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
@@ -1,16 +1,17 @@
-From 4801a057730632225337d7f6d26b9335e6b9b078 Mon Sep 17 00:00:00 2001
+From 85b882b4ceb57fe6538f47af58d0a970923fde0e Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Thu, 31 Mar 2016 00:20:15 +0200
 Subject: [PATCH] 3rdparty/ippicv: Use pre-downloaded ipp
 
 Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
+
 ---
  3rdparty/ippicv/ippicv.cmake | 15 +--------------
  1 file changed, 1 insertion(+), 14 deletions(-)
 
 diff --git a/3rdparty/ippicv/ippicv.cmake b/3rdparty/ippicv/ippicv.cmake
-index d601da4bb..f6fc1098c 100644
+index ae8748c..305abdb 100644
 --- a/3rdparty/ippicv/ippicv.cmake
 +++ b/3rdparty/ippicv/ippicv.cmake
 @@ -39,18 +39,5 @@ function(download_ippicv root_var)
@@ -33,6 +34,3 @@ index d601da4bb..f6fc1098c 100644
 -  endif()
 +  set(${root_var} "${THE_ROOT}/${OPENCV_ICV_PACKAGE_SUBDIR}" PARENT_SCOPE)
  endfunction()
--- 
-2.13.4
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
index bf0b80a..40d3f53 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
@@ -1,4 +1,4 @@
-From 7144c44ec70dee73a628463b99ffeed74b1a8ef6 Mon Sep 17 00:00:00 2001
+From 9659f5a1e75fc29c9879c301767bba72ecf9042a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 11 Sep 2018 00:21:18 -0700
 Subject: [PATCH] Dont use isystem
@@ -8,12 +8,13 @@ clang really does not like it
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  cmake/OpenCVPCHSupport.cmake | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
-index f9b1b48b65..fe27a136f5 100644
+index 59bc826..055dfce 100644
 --- a/cmake/OpenCVPCHSupport.cmake
 +++ b/cmake/OpenCVPCHSupport.cmake
 @@ -18,6 +18,8 @@ IF(CV_GCC)
@@ -25,6 +26,3 @@ index f9b1b48b65..fe27a136f5 100644
      SET(_PCH_include_prefix "-I")
      SET(_PCH_isystem_prefix "-isystem")
      SET(_PCH_define_prefix "-D")
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
index 63cb7f9..f8ccd1d 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
@@ -1,19 +1,20 @@
-From 7d31f41d2a6759e244983504ce855fc32916b97a Mon Sep 17 00:00:00 2001
+From fe27d0e2341683606704115949d16250e4cacbfa Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Wed, 9 May 2018 13:33:59 -0700
 Subject: [PATCH] Temporarliy work around deprecated ffmpeg RAW function
  compile failure until next uprev
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
 ---
  modules/videoio/src/cap_ffmpeg_impl.hpp | 8 ++++++++
  1 file changed, 8 insertions(+)
 
 diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
-index 5a9b10f075..97c6b74b07 100644
+index 0d360ad..566df66 100644
 --- a/modules/videoio/src/cap_ffmpeg_impl.hpp
 +++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
-@@ -667,6 +667,14 @@ struct ImplMutex::Impl
+@@ -736,6 +736,14 @@ struct ImplMutex::Impl
  
  #endif
  
@@ -28,6 +29,3 @@ index 5a9b10f075..97c6b74b07 100644
  void ImplMutex::init()
  {
      impl = new Impl();
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
index a845505..46198fb 100644
--- a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
@@ -1,15 +1,16 @@
-From 350525293aef65490e80104ddd99e1b21c5d54b0 Mon Sep 17 00:00:00 2001
+From 46ffa1f8f443b71673774fcb864eb741bbc26200 Mon Sep 17 00:00:00 2001
 From: Bian Naimeng <biannm@cn.fujitsu.com>
 Date: Wed, 19 Apr 2017 03:11:37 +0900
-Subject: [PATCH 2/3] Make opencv-ts create share library intead of static.
+Subject: [PATCH] Make opencv-ts create share library intead of static.
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+
 ---
  modules/ts/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt
-index f95bed079..ee67858df 100644
+index f95bed0..ee67858 100644
 --- a/modules/ts/CMakeLists.txt
 +++ b/modules/ts/CMakeLists.txt
 @@ -4,7 +4,7 @@ if(NOT BUILD_opencv_ts AND NOT BUILD_TESTS AND NOT BUILD_PERF_TESTS)
@@ -21,6 +22,3 @@ index f95bed079..ee67858df 100644
  set(OPENCV_MODULE_IS_PART_OF_WORLD FALSE)
  
  if(WINRT)
--- 
-2.13.4
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
index 5270b8c..336c2e0 100644
--- a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
@@ -1,7 +1,7 @@
-From ace48a628dca34d742615598afeef42ed323a029 Mon Sep 17 00:00:00 2001
+From 867caccc358266f7021f076fc8c8e41bf048782c Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Fri, 19 May 2017 04:27:50 +0900
-Subject: [PATCH 3/3] To fix errors as following:
+Subject: [PATCH] To fix errors as following:
 
 "test_main.cpp:45: undefined reference to `parseCustomOptions(int, char**)'"
 "perf_abs.cpp:13: undefined reference to `cvtest::param_seed'"
@@ -13,17 +13,18 @@ Also add the visibility changes for certain OpenCL-related functions in
 ts module.
 
 Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
+
 ---
- modules/ts/include/opencv2/ts.hpp          | 6 +++---
+ modules/ts/include/opencv2/ts.hpp          | 4 ++--
  modules/ts/include/opencv2/ts/ocl_test.hpp | 2 +-
  modules/ts/include/opencv2/ts/ts_ext.hpp   | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
+ 3 files changed, 4 insertions(+), 4 deletions(-)
 
-Index: git/modules/ts/include/opencv2/ts.hpp
-===================================================================
---- git.orig/modules/ts/include/opencv2/ts.hpp
-+++ git/modules/ts/include/opencv2/ts.hpp
-@@ -608,7 +608,7 @@ protected:
+diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/opencv2/ts.hpp
+index b9d6b74..f1ee7ee 100644
+--- a/modules/ts/include/opencv2/ts.hpp
++++ b/modules/ts/include/opencv2/ts.hpp
+@@ -622,7 +622,7 @@ protected:
      }
  };
  
@@ -32,7 +33,7 @@ Index: git/modules/ts/include/opencv2/ts.hpp
  
  struct DefaultRngAuto
  {
-@@ -671,7 +671,7 @@ private:
+@@ -685,7 +685,7 @@ private:
  #endif
  #endif
  
@@ -41,10 +42,10 @@ Index: git/modules/ts/include/opencv2/ts.hpp
  
  #define CV_TEST_INIT0_NOOP (void)0
  
-Index: git/modules/ts/include/opencv2/ts/ocl_test.hpp
-===================================================================
---- git.orig/modules/ts/include/opencv2/ts/ocl_test.hpp
-+++ git/modules/ts/include/opencv2/ts/ocl_test.hpp
+diff --git a/modules/ts/include/opencv2/ts/ocl_test.hpp b/modules/ts/include/opencv2/ts/ocl_test.hpp
+index 11572e9..438112e 100644
+--- a/modules/ts/include/opencv2/ts/ocl_test.hpp
++++ b/modules/ts/include/opencv2/ts/ocl_test.hpp
 @@ -82,7 +82,7 @@ inline UMat ToUMat(InputArray src)
      return dst;
  }
@@ -54,10 +55,10 @@ Index: git/modules/ts/include/opencv2/ts/ocl_test.hpp
  
  #define MAX_VALUE 357
  
-Index: git/modules/ts/include/opencv2/ts/ts_ext.hpp
-===================================================================
---- git.orig/modules/ts/include/opencv2/ts/ts_ext.hpp
-+++ git/modules/ts/include/opencv2/ts/ts_ext.hpp
+diff --git a/modules/ts/include/opencv2/ts/ts_ext.hpp b/modules/ts/include/opencv2/ts/ts_ext.hpp
+index b5cea3e..e5b0b4b 100644
+--- a/modules/ts/include/opencv2/ts/ts_ext.hpp
++++ b/modules/ts/include/opencv2/ts/ts_ext.hpp
 @@ -9,7 +9,7 @@
  #define OPENCV_TS_EXT_HPP
  
diff --git a/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch b/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
deleted file mode 100644
index 3ed3468..0000000
--- a/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Index: git/cmake/OpenCVGenPkgconfig.cmake
-===================================================================
---- git.orig/cmake/OpenCVGenPkgconfig.cmake
-+++ git/cmake/OpenCVGenPkgconfig.cmake
-@@ -31,7 +31,7 @@ macro(fix_prefix lst isown)
-       get_filename_component(libdir "${item}" PATH)
-       get_filename_component(_libname "${item}" NAME)
-       ocv_get_libname(libname "${_libname}")
--      list(APPEND _lst "-L${libdir}" "-l${libname}")
-+      list(APPEND _lst "-l${libname}")
-     else()
-       list(APPEND _lst "-l${item}")
-     endif()
-@@ -124,11 +124,14 @@ ocv_list_unique(_extra)
- ocv_list_unique(_3rdparty)
- 
- set(OPENCV_PC_LIBS
--  "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"
-+  "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"
-   "${_modules}"
- )
- if(BUILD_SHARED_LIBS)
--  set(OPENCV_PC_LIBS_PRIVATE "${_extra}")
-+  set(OPENCV_PC_LIBS_PRIVATE
-+    "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"
-+    "${_extra}"
-+  )
- else()
-   set(OPENCV_PC_LIBS_PRIVATE
-     "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"
diff --git a/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch b/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
deleted file mode 100644
index fc273a8..0000000
--- a/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff --git a/modules/xfeatures2d/CMakeLists.txt b/modules/xfeatures2d/CMakeLists.txt
-index e1755595..c7009c47 100644
---- a/modules/xfeatures2d/CMakeLists.txt
-+++ b/modules/xfeatures2d/CMakeLists.txt
-@@ -5,10 +5,10 @@ ocv_define_module(xfeatures2d opencv_core opencv_imgproc opencv_features2d openc
- include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/download_vgg.cmake)
- include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/download_boostdesc.cmake)
- set(DOWNLOAD_DIR "${OpenCV_BINARY_DIR}/downloads/xfeatures2d")
--download_boost_descriptors("${DOWNLOAD_DIR}" boost_status)
--download_vgg_descriptors("${DOWNLOAD_DIR}" vgg_status)
--if(NOT boost_status OR NOT vgg_status)
--  ocv_module_disable(xfeatures2d)
--endif()
-+#download_boost_descriptors("${DOWNLOAD_DIR}" boost_status)
-+#download_vgg_descriptors("${DOWNLOAD_DIR}" vgg_status)
-+#if(NOT boost_status OR NOT vgg_status)
-+#  ocv_module_disable(xfeatures2d)
-+#endif()
- 
- ocv_module_include_directories("${DOWNLOAD_DIR}")
diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
deleted file mode 100644
index ce60698..0000000
--- a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
+++ /dev/null
@@ -1,190 +0,0 @@
-SUMMARY = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.org/"
-SECTION = "libs"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=62d89c5dcb0583609ea919c56be0ee76"
-
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-
-DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
-
-SRCREV_opencv = "8f1356c3c5b16721349582db461a2051653059e8"
-SRCREV_contrib = "7292df62624ded8af8035231435dfd17c93e1a80"
-SRCREV_ipp = "32e315a5b106a7b89dbed51c28f8120a48b368b4"
-SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
-SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
-SRC_URI[tinydnn.md5sum] = "adb1c512e09ca2c7a6faef36f9c53e59"
-SRC_URI[tinydnn.sha256sum] = "e2c61ce8c5debaa644121179e9dbdcf83f497f39de853f8dd5175846505aa18b"
-
-def ipp_filename(d):
-    import re
-    arch = d.getVar('TARGET_ARCH')
-    if re.match("i.86$", arch):
-        return "ippicv_2019_lnx_ia32_general_20180723.tgz"
-    else:
-        return "ippicv_2019_lnx_intel64_general_20180723.tgz"
-
-def ipp_md5sum(d):
-    import re
-    arch = d.getVar('TARGET_ARCH')
-    if re.match("i.86$", arch):
-        return "4f38432c30bfd6423164b7a24bbc98a0"
-    else:
-        return "c0bd78adb4156bbf552c1dfe90599607"
-
-IPP_FILENAME = "${@ipp_filename(d)}"
-IPP_MD5 = "${@ipp_md5sum(d)}"
-
-SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
-SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
-    git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
-    git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20180723;destsuffix=ipp;name=ipp \
-    git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc \
-    git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
-    https://github.com/tiny-dnn/tiny-dnn/archive/v1.0.0a3.tar.gz;destsuffix=git/3rdparty/tinydnn/tiny-dnn-1.0.0a3;name=tinydnn;unpack=false \
-    file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
-    file://uselocalxfeatures.patch;patchdir=../contrib/ \
-    file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch \
-    file://0003-To-fix-errors-as-following.patch \
-    file://fixpkgconfig.patch \
-    file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
-    file://0001-Dont-use-isystem.patch \
-"
-PV = "3.4.5"
-
-S = "${WORKDIR}/git"
-
-do_unpack_extra() {
-    mkdir -p ${S}/3rdparty/tinydnn/
-    tar xzf ${WORKDIR}/v1.0.0a3.tar.gz -C ${S}/3rdparty/tinydnn/
-    tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}
-    cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
-    cp ${WORKDIR}/boostdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
-}
-addtask unpack_extra after do_unpack before do_patch
-
-EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
-    -DWITH_1394=OFF \
-    -DENABLE_PRECOMPILED_HEADERS=OFF \
-    -DCMAKE_SKIP_RPATH=ON \
-    -DOPENCV_ICV_HASH=${IPP_MD5} \
-    -DIPPROOT=${WORKDIR}/ippicv_lnx \
-    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
-    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
-    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-"
-EXTRA_OECMAKE_append_x86 = " -DX86=ON"
-
-PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
-
-PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
-PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
-PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
-PACKAGECONFIG[freetype] = "-DBUILD_opencv_freetype=ON,-DBUILD_opencv_freetype=OFF,freetype,"
-PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
-PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
-PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
-PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
-PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native fastjar-native openjdk-8-native,"
-PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
-PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
-PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
-PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"
-PACKAGECONFIG[python3] = "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
-PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
-PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
-PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
-PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
-PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-
-inherit pkgconfig cmake
-
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'distutils3-base', '', d)}
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'distutils-base', '', d)}
-
-export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON="${STAGING_BINDIR_NATIVE}/${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3', 'python', d)}"
-export ORACLE_JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
-export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"
-export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
-
-TARGET_CC_ARCH += "-I${S}/include "
-
-PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'samples', '${PN}-samples', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${BPN}', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${BPN}', '', d)} \
-    ${PN}-apps"
-
-python populate_packages_prepend () {
-    cv_libdir = d.expand('${libdir}')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
-    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
-
-    pn = d.getVar('PN')
-    metapkg =  pn + '-dev'
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    blacklist = [ metapkg ]
-    metapkg_rdepends = [ ]
-    packages = d.getVar('PACKAGES').split()
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
-            metapkg_rdepends.append(pkg)
-    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
-
-    metapkg =  pn
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    blacklist = [ metapkg, "libopencv-ts" ]
-    metapkg_rdepends = [ ]
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
-            metapkg_rdepends.append(pkg)
-    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
-}
-
-PACKAGES_DYNAMIC += "^libopencv-.*"
-
-FILES_${PN} = ""
-FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/samples/bin/.debug/*"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake"
-FILES_${PN}-staticdev += "${datadir}/OpenCV/3rdparty/lib/*.a"
-FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-java = "${datadir}/OpenCV/java"
-FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
-
-INSANE_SKIP_${PN}-java = "libdir"
-INSANE_SKIP_${PN}-dbg = "libdir"
-
-ALLOW_EMPTY_${PN} = "1"
-
-SUMMARY_python-opencv = "Python bindings to opencv"
-FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-opencv = "python-core python-numpy"
-
-SUMMARY_python3-opencv = "Python bindings to opencv"
-FILES_python3-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python3-opencv = "python3-core python3-numpy"
-
-RDEPENDS_${PN}-apps  = "bash"
-
-do_install_append() {
-    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
-
-    # Move Python files into correct library folder (for multilib build)
-    if [ "$libdir" != "/usr/lib" -a -d ${D}/usr/lib ]; then
-        mv ${D}/usr/lib/* ${D}/${libdir}/
-        rm -rf ${D}/usr/lib
-    fi
-}
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
new file mode 100644
index 0000000..77b5dd6
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -0,0 +1,180 @@
+SUMMARY = "Opencv : The Open Computer Vision Library"
+HOMEPAGE = "http://opencv.org/"
+SECTION = "libs"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6450921bb12a3133c8f5cb2a80343710"
+
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
+DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
+
+SRCREV_opencv = "371bba8f54560b374fbcd47e7e02f015ac4969ad"
+SRCREV_contrib = "2c32791a9c500343568a21ea34bf2daeac2adae7"
+SRCREV_ipp = "32e315a5b106a7b89dbed51c28f8120a48b368b4"
+SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
+SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
+
+def ipp_filename(d):
+    import re
+    arch = d.getVar('TARGET_ARCH')
+    if re.match("i.86$", arch):
+        return "ippicv_2019_lnx_ia32_general_20180723.tgz"
+    else:
+        return "ippicv_2019_lnx_intel64_general_20180723.tgz"
+
+def ipp_md5sum(d):
+    import re
+    arch = d.getVar('TARGET_ARCH')
+    if re.match("i.86$", arch):
+        return "4f38432c30bfd6423164b7a24bbc98a0"
+    else:
+        return "c0bd78adb4156bbf552c1dfe90599607"
+
+IPP_FILENAME = "${@ipp_filename(d)}"
+IPP_MD5 = "${@ipp_md5sum(d)}"
+
+SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
+SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
+           git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
+           git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20180723;destsuffix=ipp;name=ipp \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
+           file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
+           file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch \
+           file://0003-To-fix-errors-as-following.patch \
+           file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
+           file://0001-Dont-use-isystem.patch \
+           "
+PV = "4.1.0"
+
+S = "${WORKDIR}/git"
+
+do_unpack_extra() {
+    tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}
+    cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
+    cp ${WORKDIR}/boostdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
+}
+addtask unpack_extra after do_unpack before do_patch
+
+EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
+    -DWITH_1394=OFF \
+    -DENABLE_PRECOMPILED_HEADERS=OFF \
+    -DCMAKE_SKIP_RPATH=ON \
+    -DOPENCV_ICV_HASH=${IPP_MD5} \
+    -DIPPROOT=${WORKDIR}/ippicv_lnx \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
+"
+EXTRA_OECMAKE_append_x86 = " -DX86=ON"
+
+PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
+
+PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
+PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
+PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
+PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
+PACKAGECONFIG[freetype] = "-DBUILD_opencv_freetype=ON,-DBUILD_opencv_freetype=OFF,freetype,"
+PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
+PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
+PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
+PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native fastjar-native openjdk-8-native,"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
+PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
+PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
+PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
+PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
+PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"
+PACKAGECONFIG[python3] = "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
+PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
+PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
+PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
+PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
+PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+
+inherit pkgconfig cmake
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'distutils3-base', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'distutils-base', '', d)}
+
+export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
+export PYTHON="${STAGING_BINDIR_NATIVE}/${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3', 'python', d)}"
+export ORACLE_JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
+export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"
+export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
+
+TARGET_CC_ARCH += "-I${S}/include "
+
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'samples', '${PN}-samples', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${BPN}', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${BPN}', '', d)} \
+    ${PN}-apps"
+
+python populate_packages_prepend () {
+    cv_libdir = d.expand('${libdir}')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
+    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
+
+    pn = d.getVar('PN')
+    metapkg =  pn + '-dev'
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    blacklist = [ metapkg ]
+    metapkg_rdepends = [ ]
+    packages = d.getVar('PACKAGES').split()
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
+            metapkg_rdepends.append(pkg)
+    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
+
+    metapkg =  pn
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    blacklist = [ metapkg, "libopencv-ts" ]
+    metapkg_rdepends = [ ]
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
+            metapkg_rdepends.append(pkg)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
+}
+
+PACKAGES_DYNAMIC += "^libopencv-.*"
+
+FILES_${PN} = ""
+FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/samples/bin/.debug/*"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig  ${libdir}/cmake/opencv4/*.cmake"
+FILES_${PN}-staticdev += "${libdir}/opencv4/3rdparty/*.a"
+FILES_${PN}-apps = "${bindir}/* ${datadir}/opencv4 ${datadir}/licenses"
+FILES_${PN}-java = "${datadir}/OpenCV/java"
+FILES_${PN}-samples = "${datadir}/opencv4/samples/"
+
+INSANE_SKIP_${PN}-java = "libdir"
+INSANE_SKIP_${PN}-dbg = "libdir"
+
+ALLOW_EMPTY_${PN} = "1"
+
+SUMMARY_python-opencv = "Python bindings to opencv"
+FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python-opencv = "python-core python-numpy"
+
+SUMMARY_python3-opencv = "Python bindings to opencv"
+FILES_python3-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python3-opencv = "python3-core python3-numpy"
+
+RDEPENDS_${PN}-apps  = "bash"
+
+do_install_append() {
+    # Move Python files into correct library folder (for multilib build)
+    if [ "$libdir" != "/usr/lib" -a -d ${D}/usr/lib ]; then
+        mv ${D}/usr/lib/* ${D}/${libdir}/
+        rm -rf ${D}/usr/lib
+    fi
+}
-- 
2.7.4


