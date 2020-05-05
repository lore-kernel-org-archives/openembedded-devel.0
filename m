Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.3781.1588666334713340345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2020 01:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XWcKrgIb;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: gregory.vimont@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id f13so1532373wrm.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2020 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8f0keXW6WjJwpUl1j0aDwp3sgg1pBgfIpSI9citrSAE=;
        b=XWcKrgIbIiA4a82i3aqLUl+JL6moXuaWdvTt0lRsu9w/LXQFT5rzLvB8/hxN6kLeLA
         GIW0YYtMRdXacjvuiayQTohHumVZBK0AkC9ZfYfjjP9M46QrVJgu4wzbnUFEsM/rc4Yd
         WjBYlqUNO7RLYt9Dp3dQKw6clj95Dca8l9+ScWTEJpAMfbctFI7cjs6NJFMEIHfJ7aNZ
         Vulrk7KIdbuPfgOXdbMewjHFjzYuqDTj5qbCcdJo6Ji2oG4AuwSivTz1R7o+Lxr+gI6Z
         Ty7c7HZzyPDqJ/p6BnCRG1T/a+kwkBIpRjxJosXfYx2FVQXySI1cfZC8gAP3CoVz7+gZ
         SwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8f0keXW6WjJwpUl1j0aDwp3sgg1pBgfIpSI9citrSAE=;
        b=KBBy6j34v+1HOobmt0lX3fo77vo3nXxra4iPLmbo7re0fY6jUx7W5g6434b3V5E7TO
         lSfizIls9ZCp2ZRBfAFnDSqUidQy1EUGgLkmg6m8q4G+eE/YvNQ68FmCkL6vwV60OsYl
         GIYoXnh8kH+v9FoQ9dMuPh+de6rxFlNINQwdU8m6A8Ps0FIJO+ILRHmBTXK2bThntafy
         rt4Q0RMt+yuiL3fH/tTS4vSCKdgR7nohPR0IMSHDtv1VWOWn74iYn06xPtopR2mzEOcS
         zIjcyhvlbKOHq6V6OovDhESvq67WeoFHMPZk0SBZbjh7HQHnddngVyRVaKFK9XHhL0fz
         rBNw==
X-Gm-Message-State: AGi0Pub8cqE+es2zfjEQ+yA4OrAJ0xOBw5Hd6hXzznmt2E7GHKfjPJuw
	pwjwPT7DGnmYFiTAU0r9I3M3tWZQCA4=
X-Google-Smtp-Source: APiQypKGoFy4CS3TlpArliFUcjOBUWXEsQ2oRb/A+lJJMMYHCFlc6GSd025W1OrIAjcAo2zmgneD0Q==
X-Received: by 2002:a5d:4a0f:: with SMTP id m15mr2189281wrq.125.1588666332931;
        Tue, 05 May 2020 01:12:12 -0700 (PDT)
Return-Path: <gregory.vimont@gmail.com>
Received: from ALD-1799-DE.aldebaran.lan (softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu. [158.255.112.194])
        by smtp.gmail.com with ESMTPSA id f8sm1938566wrm.8.2020.05.05.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 01:12:12 -0700 (PDT)
From: "Gregory Vimont" <gregory.vimont@gmail.com>
X-Google-Original-From: Gregory Vimont <gregory.vimont@softbankrobotics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Vimont <gregory.vimont@softbankrobotics.com>
Subject: [meta-oe][PATCH] opencv: 4.1.0 -> 4.3.0
Date: Tue,  5 May 2020 10:11:21 +0200
Message-Id: <20200505081121.10672-1-gregory.vimont@softbankrobotics.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
---
 ...dparty-ippicv-Use-pre-downloaded-ipp.patch |  6 +-
 .../opencv/opencv/0001-Dont-use-isystem.patch |  4 +-
 ...-around-deprecated-ffmpeg-RAW-functi.patch |  6 +-
 ...-ipcp-unit-growth-with-ipa-cp-unit-g.patch | 55 -------------------
 ...reate-share-library-intead-of-static.patch |  4 +-
 .../0003-To-fix-errors-as-following.patch     | 12 ++--
 .../opencv/opencv/download.patch              | 17 ++++--
 .../{opencv_4.1.0.bb => opencv_4.3.0.bb}      | 21 ++++---
 8 files changed, 39 insertions(+), 86 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.1.0.bb => opencv_4.3.0.bb} (94%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
index 5f909c1a8..9e6a61371 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
@@ -1,4 +1,4 @@
-From 85b882b4ceb57fe6538f47af58d0a970923fde0e Mon Sep 17 00:00:00 2001
+From 9b4959b97d2e95d4b49cf6ca2a3fce3cdb484f2d Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Thu, 31 Mar 2016 00:20:15 +0200
 Subject: [PATCH] 3rdparty/ippicv: Use pre-downloaded ipp
@@ -11,10 +11,10 @@ Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
  1 file changed, 1 insertion(+), 14 deletions(-)
 
 diff --git a/3rdparty/ippicv/ippicv.cmake b/3rdparty/ippicv/ippicv.cmake
-index ae8748c..305abdb 100644
+index 257af6fcc6..f88460450f 100644
 --- a/3rdparty/ippicv/ippicv.cmake
 +++ b/3rdparty/ippicv/ippicv.cmake
-@@ -39,18 +39,5 @@ function(download_ippicv root_var)
+@@ -34,18 +34,5 @@ function(download_ippicv root_var)
    endif()
  
    set(THE_ROOT "${OpenCV_BINARY_DIR}/3rdparty/ippicv")
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
index 40d3f53e1..948a80faf 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
@@ -1,4 +1,4 @@
-From 9659f5a1e75fc29c9879c301767bba72ecf9042a Mon Sep 17 00:00:00 2001
+From 66e50ee69fa9ee2469d349100e70d8b296c4b4dc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 11 Sep 2018 00:21:18 -0700
 Subject: [PATCH] Dont use isystem
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
-index 59bc826..055dfce 100644
+index 08cd06def4..46c9c02da3 100644
 --- a/cmake/OpenCVPCHSupport.cmake
 +++ b/cmake/OpenCVPCHSupport.cmake
 @@ -18,6 +18,8 @@ IF(CV_GCC)
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
index f8ccd1d55..1e47f8b16 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
@@ -1,4 +1,4 @@
-From fe27d0e2341683606704115949d16250e4cacbfa Mon Sep 17 00:00:00 2001
+From e4ec6cea72da9e9ae5ba57140fa2f5c63f1f8295 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Wed, 9 May 2018 13:33:59 -0700
 Subject: [PATCH] Temporarliy work around deprecated ffmpeg RAW function
@@ -11,10 +11,10 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
-index 0d360ad..566df66 100644
+index 6dca724a89..ae55dd4555 100644
 --- a/modules/videoio/src/cap_ffmpeg_impl.hpp
 +++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
-@@ -736,6 +736,14 @@ struct ImplMutex::Impl
+@@ -774,6 +774,14 @@ struct ImplMutex::Impl
  
  #endif
  
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch b/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch
deleted file mode 100644
index 43d32fbc7..000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 1edc925ecd7fb54d2dc78452069084475fbe2a70 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 16 Jan 2020 08:52:00 -0800
-Subject: [PATCH] carotene: Replace ipcp-unit-growth with ipa-cp-unit-growth on gcc >= 10
-
-gcc 10+ has renamed this option, therefore check for gcc version before
-deciding which name to use for opt parameter
-
-Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/16369]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- 3rdparty/carotene/CMakeLists.txt     | 8 ++++++--
- 3rdparty/carotene/hal/CMakeLists.txt | 7 ++++++-
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/3rdparty/carotene/CMakeLists.txt b/3rdparty/carotene/CMakeLists.txt
-index bfa9368d79..1c43b85b28 100644
---- a/3rdparty/carotene/CMakeLists.txt
-+++ b/3rdparty/carotene/CMakeLists.txt
-@@ -20,8 +20,12 @@ if(CMAKE_COMPILER_IS_GNUCC)
-     # - matchTemplate about 5-10%
-     # - goodFeaturesToTrack 10-20%
-     # - cornerHarris 30% for some cases
--
--    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
-+	    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipcp-unit-growth=100000 ${COMPILE_FLAGS}")
-+    else()
-+	    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipa-cp-unit-growth=100000 ${COMPILE_FLAGS}")
-+    endif()
- endif()
- 
- add_library(carotene_objs OBJECT
-diff --git a/3rdparty/carotene/hal/CMakeLists.txt b/3rdparty/carotene/hal/CMakeLists.txt
-index c4b9acaedd..bbc5b11a80 100644
---- a/3rdparty/carotene/hal/CMakeLists.txt
-+++ b/3rdparty/carotene/hal/CMakeLists.txt
-@@ -90,7 +90,12 @@ set_property(DIRECTORY APPEND PROPERTY COMPILE_DEFINITIONS ${carotene_defs})
-     #   matchTemplate about 5-10%
-     #   goodFeaturesToTrack 10-20%
-     #   cornerHarris 30% for some cases
--    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
-+      set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 ${COMPILE_FLAGS}")
-+    else()
-+      set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipa-cp-unit-growth=100000 ${COMPILE_FLAGS}")
-+    endif()
- #    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-   endif()
- 
--- 
-2.25.0
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
index 46198fb7b..20d54d407 100644
--- a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
@@ -1,4 +1,4 @@
-From 46ffa1f8f443b71673774fcb864eb741bbc26200 Mon Sep 17 00:00:00 2001
+From 78e2fc167fd27ab17175dcfd6eccf6f74bd5e1c7 Mon Sep 17 00:00:00 2001
 From: Bian Naimeng <biannm@cn.fujitsu.com>
 Date: Wed, 19 Apr 2017 03:11:37 +0900
 Subject: [PATCH] Make opencv-ts create share library intead of static.
@@ -10,7 +10,7 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt
-index f95bed0..ee67858 100644
+index f95bed0793..ee67858df8 100644
 --- a/modules/ts/CMakeLists.txt
 +++ b/modules/ts/CMakeLists.txt
 @@ -4,7 +4,7 @@ if(NOT BUILD_opencv_ts AND NOT BUILD_TESTS AND NOT BUILD_PERF_TESTS)
diff --git a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
index 336c2e08e..bb47ef2ba 100644
--- a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
@@ -1,4 +1,4 @@
-From 867caccc358266f7021f076fc8c8e41bf048782c Mon Sep 17 00:00:00 2001
+From f42c9b8c7bafcadc7e95fb25a391707f970eb426 Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Fri, 19 May 2017 04:27:50 +0900
 Subject: [PATCH] To fix errors as following:
@@ -21,10 +21,10 @@ Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/opencv2/ts.hpp
-index b9d6b74..f1ee7ee 100644
+index ed7491a89a..80919d13ee 100644
 --- a/modules/ts/include/opencv2/ts.hpp
 +++ b/modules/ts/include/opencv2/ts.hpp
-@@ -622,7 +622,7 @@ protected:
+@@ -728,7 +728,7 @@ protected:
      }
  };
  
@@ -33,7 +33,7 @@ index b9d6b74..f1ee7ee 100644
  
  struct DefaultRngAuto
  {
-@@ -685,7 +685,7 @@ private:
+@@ -791,7 +791,7 @@ private:
  #endif
  #endif
  
@@ -43,7 +43,7 @@ index b9d6b74..f1ee7ee 100644
  #define CV_TEST_INIT0_NOOP (void)0
  
 diff --git a/modules/ts/include/opencv2/ts/ocl_test.hpp b/modules/ts/include/opencv2/ts/ocl_test.hpp
-index 11572e9..438112e 100644
+index 11572e9f48..438112e2aa 100644
 --- a/modules/ts/include/opencv2/ts/ocl_test.hpp
 +++ b/modules/ts/include/opencv2/ts/ocl_test.hpp
 @@ -82,7 +82,7 @@ inline UMat ToUMat(InputArray src)
@@ -56,7 +56,7 @@ index 11572e9..438112e 100644
  #define MAX_VALUE 357
  
 diff --git a/modules/ts/include/opencv2/ts/ts_ext.hpp b/modules/ts/include/opencv2/ts/ts_ext.hpp
-index b5cea3e..e5b0b4b 100644
+index b2a4cac241..b94c681c0c 100644
 --- a/modules/ts/include/opencv2/ts/ts_ext.hpp
 +++ b/modules/ts/include/opencv2/ts/ts_ext.hpp
 @@ -9,7 +9,7 @@
diff --git a/meta-oe/recipes-support/opencv/opencv/download.patch b/meta-oe/recipes-support/opencv/opencv/download.patch
index fa8db8807..33ac48312 100644
--- a/meta-oe/recipes-support/opencv/opencv/download.patch
+++ b/meta-oe/recipes-support/opencv/opencv/download.patch
@@ -1,3 +1,8 @@
+From b18a280fab06a680d9f831bf8b462647f3cb6214 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 9 Jan 2020 16:24:24 +0000
+Subject: [PATCH] opencv: abort configure if we need to download
+
 This CMake module will download files during do_configure.  This is bad as it
 means we can't do offline builds.
 
@@ -6,8 +11,12 @@ Add an option to disallow downloads by emitting a fatal error.
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ cmake/OpenCVDownload.cmake | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
 diff --git a/cmake/OpenCVDownload.cmake b/cmake/OpenCVDownload.cmake
-index cdc47ad2cb..74573f45a2 100644
+index 63cf6d3238..4acf477f70 100644
 --- a/cmake/OpenCVDownload.cmake
 +++ b/cmake/OpenCVDownload.cmake
 @@ -14,6 +14,7 @@
@@ -18,7 +27,7 @@ index cdc47ad2cb..74573f45a2 100644
  set(HELP_OPENCV_DOWNLOAD_PATH "Cache directory for downloaded files")
  if(DEFINED ENV{OPENCV_DOWNLOAD_PATH})
    set(OPENCV_DOWNLOAD_PATH "$ENV{OPENCV_DOWNLOAD_PATH}" CACHE PATH "${HELP_OPENCV_DOWNLOAD_PATH}")
-@@ -153,6 +154,11 @@ function(ocv_download)
+@@ -156,6 +157,11 @@ function(ocv_download)
  
    # Download
    if(NOT EXISTS "${CACHE_CANDIDATE}")
@@ -28,5 +37,5 @@ index cdc47ad2cb..74573f45a2 100644
 +    endif()
 +
      ocv_download_log("#cmake_download \"${CACHE_CANDIDATE}\" \"${DL_URL}\"")
-     file(DOWNLOAD "${DL_URL}" "${CACHE_CANDIDATE}"
-          INACTIVITY_TIMEOUT 60
+     foreach(try ${OPENCV_DOWNLOAD_TRIES_LIST})
+       ocv_download_log("#try ${try}")
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.3.0.bb
similarity index 94%
rename from meta-oe/recipes-support/opencv/opencv_4.1.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.3.0.bb
index d781da600..2587b189c 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.3.0.bb
@@ -3,16 +3,16 @@ HOMEPAGE = "http://opencv.org/"
 SECTION = "libs"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6450921bb12a3133c8f5cb2a80343710"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19598330421859a6dd353a4318091ac7"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "371bba8f54560b374fbcd47e7e02f015ac4969ad"
-SRCREV_contrib = "2c32791a9c500343568a21ea34bf2daeac2adae7"
-SRCREV_ipp = "32e315a5b106a7b89dbed51c28f8120a48b368b4"
+SRCREV_opencv = "01b2c5a77ca6dbef3baef24ebc0a5984579231d9"
+SRCREV_contrib = "e6f32c6a69043456a806a4e802ee3ce7b7059c93"
+SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
@@ -21,17 +21,17 @@ def ipp_filename(d):
     import re
     arch = d.getVar('TARGET_ARCH')
     if re.match("i.86$", arch):
-        return "ippicv_2019_lnx_ia32_general_20180723.tgz"
+        return "ippicv_2020_lnx_ia32_20191018_general.tgz"
     else:
-        return "ippicv_2019_lnx_intel64_general_20180723.tgz"
+        return "ippicv_2020_lnx_intel64_20191018_general.tgz"
 
 def ipp_md5sum(d):
     import re
     arch = d.getVar('TARGET_ARCH')
     if re.match("i.86$", arch):
-        return "4f38432c30bfd6423164b7a24bbc98a0"
+        return "ad189a940fb60eb71f291321322fe3e8"
     else:
-        return "c0bd78adb4156bbf552c1dfe90599607"
+        return "7421de0095c7a39162ae13a6098782f9"
 
 IPP_FILENAME = "${@ipp_filename(d)}"
 IPP_MD5 = "${@ipp_md5sum(d)}"
@@ -39,7 +39,7 @@ IPP_MD5 = "${@ipp_md5sum(d)}"
 SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
 SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
-           git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20180723;destsuffix=ipp;name=ipp \
+           git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20191018;destsuffix=ipp;name=ipp \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=face;name=face \
@@ -48,10 +48,9 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
-           file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \
            file://download.patch \
            "
-PV = "4.1.0"
+PV = "4.3.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

