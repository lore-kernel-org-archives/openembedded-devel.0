Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.3816.1616314542250864415
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Mar 2021 01:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HWZ28IBE;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so9875172wma.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Mar 2021 01:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8GAQJPeSyEoui9Oq/UDJ+2QatF37CNkfNdnRBXKxJ0I=;
        b=HWZ28IBEOLS23GOKoVS2Ad9TkF34/mjr0hKTljAgafghg7DvF/kW7YCDwtRrZ80Pet
         PSPLmsopbQH68yn6xip2D6y27Jv1+COduovGRtx03e97QZ6obGethY70Eywesezl9iE6
         3iUOHZoAGa95gy1MKiZ8787L9sc07E7J1dY7uFMv471GgBwfWppLmdGwwi8VI9lpTUHF
         6WFFy//JJDzenP4gHVHETEuVIALgmiftyAG+VTP8VB8iWrT06o//QIL8+ZglSaF1vl4s
         4h78kdwzLrMExQzHUYapOThKMUQNAk9/bbWtdYq9IuWJAUxT/HuWJYEV+CVeK1EuHoWi
         k8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8GAQJPeSyEoui9Oq/UDJ+2QatF37CNkfNdnRBXKxJ0I=;
        b=W6T2Vpdou4+k+DvqeWObFpBFcRIhiG1zJ9s5XydB+QCHT+1sbFoSBjteGblcWs9v8B
         E/qGaaro6X1BetAvOhpbYo0enQpbiz6VAcjolm7/XI2RJWcUpP7KBnVZxRlkpiZREifG
         4JoR7GtCZQUeWBTuCGZRmCy7VJzV5ij1Xuc8+EUPw7crcbO0TEKXJ5KzTirzQyz7Ml65
         JvejuC2kRGScoAP2BbXqzH9Ojy6pf2deBWjEXsMD9MiLXR6b5v5KpbqURh38b7DzvODZ
         gSpphKdLkwayFSExj/jQHZYhz7Yus2aSvkZ+JNdBaoqu6HS+U1/VaVbEDgfqrZ5Ro1ce
         7xRA==
X-Gm-Message-State: AOAM532o0DJlR431MYiLPBVeFzPw1FiboYSHAa1ZnGuK/qdV4xUOXm1C
	Dbr6MiGZQH+gB2rohUU8uCGvkbJlq2I=
X-Google-Smtp-Source: ABdhPJxFvsRBwLcXWPF3DDexVgmh9bRhjc34f0/Ez37jgJLKBqp1xoo8qeABCsn488V/Snb74olLzw==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr10818938wmk.156.1616314540350;
        Sun, 21 Mar 2021 01:15:40 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d13sm16156665wro.23.2021.03.21.01.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 01:15:39 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Neetika.Singh@kpit.com,
	akuster808@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][PATCH] opencv: refresh patches with devtool to apply cleanly
Date: Sun, 21 Mar 2021 09:15:34 +0100
Message-Id: <20210321081534.4228-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <166E1A8A6496A609.21408@lists.openembedded.org>
References: <166E1A8A6496A609.21408@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
WARNING: opencv-4.1.0-r0 do_patch: Fuzz detected:

Applying patch CVE-2019-14491.patch
patching file modules/objdetect/src/cascadedetect.cpp
Hunk #1 succeeded at 46 with fuzz 1 (offset -1 lines).
Hunk #2 succeeded at 540 (offset -1 lines).
Hunk #3 succeeded at 552 (offset -1 lines).
Hunk #4 succeeded at 613 (offset -1 lines).
Hunk #5 succeeded at 774 (offset -1 lines).
Hunk #6 succeeded at 825 (offset -1 lines).
Hunk #7 succeeded at 1470 (offset -36 lines).
patching file modules/objdetect/src/cascadedetect.hpp

The context lines in the patches can be updated with devtool:

    devtool modify opencv
    devtool finish --force-patch-refresh opencv <layer_path>

Don't forget to review changes done by devtool!

WARNING: opencv-4.1.0-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...dparty-ippicv-Use-pre-downloaded-ipp.patch |   4 +-
 .../opencv/opencv/0001-Dont-use-isystem.patch |   4 +-
 ...-around-deprecated-ffmpeg-RAW-functi.patch |   4 +-
 ...-ipcp-unit-growth-with-ipa-cp-unit-g.patch |   9 +-
 ...reate-share-library-intead-of-static.patch |   4 +-
 .../0003-To-fix-errors-as-following.patch     |   8 +-
 .../opencv/opencv/CVE-2019-14491.patch        |  56 +++++-----
 .../opencv/opencv/CVE-2019-14493.patch        | 104 +++++++++---------
 .../opencv/opencv/CVE-2019-15939.patch        |  20 ++--
 .../opencv/opencv/CVE-2019-19624.patch        |  22 ++--
 .../opencv/opencv/download.patch              |   9 ++
 11 files changed, 126 insertions(+), 118 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
index 5f909c1a8f..896d6ce9dc 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
@@ -1,4 +1,4 @@
-From 85b882b4ceb57fe6538f47af58d0a970923fde0e Mon Sep 17 00:00:00 2001
+From 806de12b95a69572fffea8eb49b4ec3fb722b65f Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Thu, 31 Mar 2016 00:20:15 +0200
 Subject: [PATCH] 3rdparty/ippicv: Use pre-downloaded ipp
@@ -11,7 +11,7 @@ Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
  1 file changed, 1 insertion(+), 14 deletions(-)
 
 diff --git a/3rdparty/ippicv/ippicv.cmake b/3rdparty/ippicv/ippicv.cmake
-index ae8748c..305abdb 100644
+index ae8748c283..305abdb58d 100644
 --- a/3rdparty/ippicv/ippicv.cmake
 +++ b/3rdparty/ippicv/ippicv.cmake
 @@ -39,18 +39,5 @@ function(download_ippicv root_var)
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
index 40d3f53e1a..a899b7e9a4 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
@@ -1,4 +1,4 @@
-From 9659f5a1e75fc29c9879c301767bba72ecf9042a Mon Sep 17 00:00:00 2001
+From b34a6e8d4582aa13ad4cd58547d8e0f0a0f1c6a6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 11 Sep 2018 00:21:18 -0700
 Subject: [PATCH] Dont use isystem
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
-index 59bc826..055dfce 100644
+index 59bc826ed0..055dfce251 100644
 --- a/cmake/OpenCVPCHSupport.cmake
 +++ b/cmake/OpenCVPCHSupport.cmake
 @@ -18,6 +18,8 @@ IF(CV_GCC)
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
index f8ccd1d558..26041e09fb 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
@@ -1,4 +1,4 @@
-From fe27d0e2341683606704115949d16250e4cacbfa Mon Sep 17 00:00:00 2001
+From 23425e45f6e26f2b1e387b88e104872b3a1ea5d1 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Wed, 9 May 2018 13:33:59 -0700
 Subject: [PATCH] Temporarliy work around deprecated ffmpeg RAW function
@@ -11,7 +11,7 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
-index 0d360ad..566df66 100644
+index 0d360ad5d9..566df6664b 100644
 --- a/modules/videoio/src/cap_ffmpeg_impl.hpp
 +++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
 @@ -736,6 +736,14 @@ struct ImplMutex::Impl
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch b/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch
index 43d32fbc75..df5bd67460 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch
@@ -1,13 +1,15 @@
-From 1edc925ecd7fb54d2dc78452069084475fbe2a70 Mon Sep 17 00:00:00 2001
+From d9bdafa95f329f33d829d89a2e51adaf833768cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Jan 2020 08:52:00 -0800
-Subject: [PATCH] carotene: Replace ipcp-unit-growth with ipa-cp-unit-growth on gcc >= 10
+Subject: [PATCH] carotene: Replace ipcp-unit-growth with ipa-cp-unit-growth on
+ gcc >= 10
 
 gcc 10+ has renamed this option, therefore check for gcc version before
 deciding which name to use for opt parameter
 
 Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/16369]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  3rdparty/carotene/CMakeLists.txt     | 8 ++++++--
  3rdparty/carotene/hal/CMakeLists.txt | 7 ++++++-
@@ -50,6 +52,3 @@ index c4b9acaedd..bbc5b11a80 100644
  #    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
    endif()
  
--- 
-2.25.0
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
index 46198fb7be..3dd63829e5 100644
--- a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
@@ -1,4 +1,4 @@
-From 46ffa1f8f443b71673774fcb864eb741bbc26200 Mon Sep 17 00:00:00 2001
+From 6a490df70aadc43ed4f503452c278e334716826d Mon Sep 17 00:00:00 2001
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
index 336c2e08e6..77571ead98 100644
--- a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
@@ -1,4 +1,4 @@
-From 867caccc358266f7021f076fc8c8e41bf048782c Mon Sep 17 00:00:00 2001
+From b3dc5478cb0d2d2b617dc6c5e28d59559edadf36 Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Fri, 19 May 2017 04:27:50 +0900
 Subject: [PATCH] To fix errors as following:
@@ -21,7 +21,7 @@ Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/opencv2/ts.hpp
-index b9d6b74..f1ee7ee 100644
+index b9d6b74ffc..f1ee7ee429 100644
 --- a/modules/ts/include/opencv2/ts.hpp
 +++ b/modules/ts/include/opencv2/ts.hpp
 @@ -622,7 +622,7 @@ protected:
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
+index b5cea3e46d..e5b0b4ba8c 100644
 --- a/modules/ts/include/opencv2/ts/ts_ext.hpp
 +++ b/modules/ts/include/opencv2/ts/ts_ext.hpp
 @@ -9,7 +9,7 @@
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
index 656000a8e1..54a553fb38 100644
--- a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
@@ -1,4 +1,4 @@
-From 321c74ccd6077bdea1d47450ca4fe955cb5b6330 Mon Sep 17 00:00:00 2001
+From 5a9628c134a7314e10ea0bcc4e789c935251a7f5 Mon Sep 17 00:00:00 2001
 From: Alexander Alekhin <alexander.alekhin@intel.com>
 Date: Thu, 25 Jul 2019 17:15:59 +0300
 Subject: [PATCH] objdetect: validate feature rectangle on reading
@@ -9,39 +9,40 @@ Upstream-Status: Backport [https://github.com/opencv/opencv/commit/ac425f67e4c1d
 Comment: No changes in any hunk
 
 Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+
 ---
  modules/objdetect/src/cascadedetect.cpp | 43 +++++++++++++++++++++----
  modules/objdetect/src/cascadedetect.hpp |  6 ++--
  2 files changed, 40 insertions(+), 9 deletions(-)
 
 diff --git a/modules/objdetect/src/cascadedetect.cpp b/modules/objdetect/src/cascadedetect.cpp
-index 4b2078306fe..bd62cd21a1b 100644
+index a1865e9062..b7ef04ea7b 100644
 --- a/modules/objdetect/src/cascadedetect.cpp
 +++ b/modules/objdetect/src/cascadedetect.cpp
-@@ -47,6 +47,10 @@
- #include "opencv2/objdetect/objdetect_c.h"
+@@ -46,6 +46,10 @@
+ #include "cascadedetect.hpp"
  #include "opencl_kernels_objdetect.hpp"
-
+ 
 +#if defined(_MSC_VER)
 +#  pragma warning(disable:4458)  // declaration of 'origWinSize' hides class member
 +#endif
 +
  namespace cv
  {
-
-@@ -537,7 +541,7 @@ bool FeatureEvaluator::setImage( InputArray _image, const std::vector<float>& _s
-
+ 
+@@ -536,7 +540,7 @@ bool FeatureEvaluator::setImage( InputArray _image, const std::vector<float>& _s
+ 
  //----------------------------------------------  HaarEvaluator ---------------------------------------
-
+ 
 -bool HaarEvaluator::Feature :: read( const FileNode& node )
 +bool HaarEvaluator::Feature::read(const FileNode& node, const Size& origWinSize)
  {
      FileNode rnode = node[CC_RECTS];
      FileNodeIterator it = rnode.begin(), it_end = rnode.end();
-@@ -549,11 +553,23 @@ bool HaarEvaluator::Feature :: read( const FileNode& node )
+@@ -548,11 +552,23 @@ bool HaarEvaluator::Feature :: read( const FileNode& node )
          rect[ri].weight = 0.f;
      }
-
+ 
 +    const int W = origWinSize.width;
 +    const int H = origWinSize.height;
 +
@@ -62,10 +63,10 @@ index 4b2078306fe..bd62cd21a1b 100644
 +            CV_CheckLE(rw.r.y + rw.r.height, H, "Invalid HAAR feature");
 +        }
      }
-
+ 
      tilted = (int)node[CC_TILTED] != 0;
-@@ -598,7 +614,7 @@ bool HaarEvaluator::read(const FileNode& node, Size _origWinSize)
-
+@@ -597,7 +613,7 @@ bool HaarEvaluator::read(const FileNode& node, Size _origWinSize)
+ 
      for(i = 0; i < n; i++, ++it)
      {
 -        if(!ff[i].read(*it))
@@ -73,9 +74,9 @@ index 4b2078306fe..bd62cd21a1b 100644
              return false;
          if( ff[i].tilted )
              hasTiltedFeatures = true;
-@@ -759,11 +775,24 @@ int HaarEvaluator::getSquaresOffset() const
+@@ -758,11 +774,24 @@ int HaarEvaluator::getSquaresOffset() const
  }
-
+ 
  //----------------------------------------------  LBPEvaluator -------------------------------------
 -bool LBPEvaluator::Feature :: read(const FileNode& node )
 +bool LBPEvaluator::Feature::read(const FileNode& node, const Size& origWinSize)
@@ -98,8 +99,8 @@ index 4b2078306fe..bd62cd21a1b 100644
 +
      return true;
  }
-
-@@ -797,7 +826,7 @@ bool LBPEvaluator::read( const FileNode& node, Size _origWinSize )
+ 
+@@ -796,7 +825,7 @@ bool LBPEvaluator::read( const FileNode& node, Size _origWinSize )
      std::vector<Feature>& ff = *features;
      for(int i = 0; it != it_end; ++it, i++)
      {
@@ -108,41 +109,40 @@ index 4b2078306fe..bd62cd21a1b 100644
              return false;
      }
      nchannels = 1;
-@@ -1477,6 +1506,8 @@ bool CascadeClassifierImpl::Data::read(const FileNode &root)
+@@ -1441,6 +1470,8 @@ bool CascadeClassifierImpl::Data::read(const FileNode &root)
      origWinSize.width = (int)root[CC_WIDTH];
      origWinSize.height = (int)root[CC_HEIGHT];
      CV_Assert( origWinSize.height > 0 && origWinSize.width > 0 );
 +    CV_CheckLE(origWinSize.width, 1000000, "Invalid window size (too large)");
 +    CV_CheckLE(origWinSize.height, 1000000, "Invalid window size (too large)");
-
+ 
      // load feature params
      FileNode fn = root[CC_FEATURE_PARAMS];
 diff --git a/modules/objdetect/src/cascadedetect.hpp b/modules/objdetect/src/cascadedetect.hpp
-index f9910530b94..d9a288fcdda 100644
+index a011ed4804..ffc03af841 100644
 --- a/modules/objdetect/src/cascadedetect.hpp
 +++ b/modules/objdetect/src/cascadedetect.hpp
-@@ -317,12 +317,12 @@ class HaarEvaluator CV_FINAL : public FeatureEvaluator
+@@ -317,12 +317,12 @@ public:
      struct Feature
      {
          Feature();
 -        bool read( const FileNode& node );
 +        bool read(const FileNode& node, const Size& origWinSize);
-
+ 
          bool tilted;
-
+ 
          enum { RECT_NUM = 3 };
 -        struct
 +        struct RectWeigth
          {
              Rect r;
              float weight;
-@@ -412,7 +412,7 @@ class LBPEvaluator CV_FINAL : public FeatureEvaluator
+@@ -412,7 +412,7 @@ public:
          Feature( int x, int y, int _block_w, int _block_h  ) :
                   rect(x, y, _block_w, _block_h) {}
-
+ 
 -        bool read(const FileNode& node );
 +        bool read(const FileNode& node, const Size& origWinSize);
-
+ 
          Rect rect; // weight and height for block
      };
-
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
index 2b5e06f23f..37be12b500 100644
--- a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
@@ -1,4 +1,4 @@
-From 5691d998ead1d9b0542bcfced36c2dceb3a59023 Mon Sep 17 00:00:00 2001
+From 0d88c87ed94e89af490c3d882597e034422aa4a5 Mon Sep 17 00:00:00 2001
 From: Alexander Alekhin <alexander.alekhin@intel.com>
 Date: Thu, 25 Jul 2019 15:14:22 +0300
 Subject: [PATCH] core(persistence): added null ptr checks
@@ -8,6 +8,7 @@ Upstream-Status: Backport [https://github.com/opencv/opencv/commit/5691d998ead1d
 Comment: No changes in any hunk
 
 Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+
 ---
  modules/core/src/persistence_json.cpp | 12 ++++++++++++
  modules/core/src/persistence_xml.cpp  | 21 +++++++++++++++++++++
@@ -15,11 +16,11 @@ Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
  3 files changed, 54 insertions(+)
 
 diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/persistence_json.cpp
-index ae678e1b8b1..89914e6534f 100644
+index ae678e1b8b..89914e6534 100644
 --- a/modules/core/src/persistence_json.cpp
 +++ b/modules/core/src/persistence_json.cpp
-@@ -296,6 +296,8 @@ class JSONParser : public FileStorageParser
-
+@@ -296,6 +296,8 @@ public:
+ 
          while ( is_eof == false && is_completed == false )
          {
 +            if (!ptr)
@@ -27,7 +28,7 @@ index ae678e1b8b1..89914e6534f 100644
              switch ( *ptr )
              {
                  /* comment */
-@@ -381,6 +383,7 @@ class JSONParser : public FileStorageParser
+@@ -381,6 +383,7 @@ public:
          if ( is_eof || !is_completed )
          {
              ptr = fs->bufferStart();
@@ -35,8 +36,8 @@ index ae678e1b8b1..89914e6534f 100644
              *ptr = '\0';
              fs->setEof();
              if( !is_completed )
-@@ -392,6 +395,9 @@ class JSONParser : public FileStorageParser
-
+@@ -392,6 +395,9 @@ public:
+ 
      char* parseKey( char* ptr, FileNode& collection, FileNode& value_placeholder )
      {
 +        if (!ptr)
@@ -44,9 +45,9 @@ index ae678e1b8b1..89914e6534f 100644
 +
          if( *ptr != '"' )
              CV_PARSE_ERROR_CPP( "Key must start with \'\"\'" );
-
-@@ -430,6 +436,9 @@ class JSONParser : public FileStorageParser
-
+ 
+@@ -430,6 +436,9 @@ public:
+ 
      char* parseValue( char* ptr, FileNode& node )
      {
 +        if (!ptr)
@@ -55,8 +56,8 @@ index ae678e1b8b1..89914e6534f 100644
          ptr = skipSpaces( ptr );
          if( !ptr || !*ptr )
              CV_PARSE_ERROR_CPP( "Unexpected End-Of-File" );
-@@ -817,6 +826,9 @@ class JSONParser : public FileStorageParser
-
+@@ -817,6 +826,9 @@ public:
+ 
      bool parse( char* ptr )
      {
 +        if (!ptr)
@@ -66,21 +67,21 @@ index ae678e1b8b1..89914e6534f 100644
          if ( !ptr || !*ptr )
              return false;
 diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/persistence_xml.cpp
-index fb30d90896e..89876dd3da8 100644
+index fb30d90896..89876dd3da 100644
 --- a/modules/core/src/persistence_xml.cpp
 +++ b/modules/core/src/persistence_xml.cpp
-@@ -360,6 +360,9 @@ class XMLParser : public FileStorageParser
-
+@@ -360,6 +360,9 @@ public:
+ 
      char* skipSpaces( char* ptr, int mode )
      {
 +        if (!ptr)
 +            CV_PARSE_ERROR_CPP("Invalid input");
 +
          int level = 0;
-
+ 
          for(;;)
-@@ -441,6 +444,9 @@ class XMLParser : public FileStorageParser
-
+@@ -441,6 +444,9 @@ public:
+ 
      char* parseValue( char* ptr, FileNode& node )
      {
 +        if (!ptr)
@@ -89,7 +90,7 @@ index fb30d90896e..89876dd3da8 100644
          FileNode new_elem;
          bool have_space = true;
          int value_type = node.type();
-@@ -456,6 +462,8 @@ class XMLParser : public FileStorageParser
+@@ -456,6 +462,8 @@ public:
                  (c == '<' && ptr[1] == '!' && ptr[2] == '-') )
              {
                  ptr = skipSpaces( ptr, 0 );
@@ -98,16 +99,16 @@ index fb30d90896e..89876dd3da8 100644
                  have_space = true;
                  c = *ptr;
              }
-@@ -502,6 +510,8 @@ class XMLParser : public FileStorageParser
+@@ -502,6 +510,8 @@ public:
                  {
                      ptr = fs->parseBase64( ptr, 0, new_elem);
                      ptr = skipSpaces( ptr, 0 );
 +                    if (!ptr)
 +                        CV_PARSE_ERROR_CPP("Invalid input");
                  }
-
+ 
                  ptr = parseTag( ptr, key2, type_name, tag_type );
-@@ -645,6 +655,9 @@ class XMLParser : public FileStorageParser
+@@ -645,6 +655,9 @@ public:
      char* parseTag( char* ptr, std::string& tag_name,
                      std::string& type_name, int& tag_type )
      {
@@ -116,8 +117,8 @@ index fb30d90896e..89876dd3da8 100644
 +
          if( *ptr == '\0' )
              CV_PARSE_ERROR_CPP( "Unexpected end of the stream" );
-
-@@ -702,6 +715,8 @@ class XMLParser : public FileStorageParser
+ 
+@@ -702,6 +715,8 @@ public:
                  if( *ptr != '=' )
                  {
                      ptr = skipSpaces( ptr, CV_XML_INSIDE_TAG );
@@ -126,7 +127,7 @@ index fb30d90896e..89876dd3da8 100644
                      if( *ptr != '=' )
                          CV_PARSE_ERROR_CPP( "Attribute name should be followed by \'=\'" );
                  }
-@@ -740,6 +755,8 @@ class XMLParser : public FileStorageParser
+@@ -740,6 +755,8 @@ public:
              if( c != '>' )
              {
                  ptr = skipSpaces( ptr, CV_XML_INSIDE_TAG );
@@ -134,31 +135,31 @@ index fb30d90896e..89876dd3da8 100644
 +                    CV_PARSE_ERROR_CPP("Invalid input");
                  c = *ptr;
              }
-
-@@ -781,6 +798,8 @@ class XMLParser : public FileStorageParser
-
+ 
+@@ -781,6 +798,8 @@ public:
+ 
          // CV_XML_INSIDE_TAG is used to prohibit leading comments
          ptr = skipSpaces( ptr, CV_XML_INSIDE_TAG );
 +        if (!ptr)
 +            CV_PARSE_ERROR_CPP("Invalid input");
-
+ 
          if( memcmp( ptr, "<?xml", 5 ) != 0 )  // FIXIT ptr[1..] - out of bounds read without check
              CV_PARSE_ERROR_CPP( "Valid XML should start with \'<?xml ...?>\'" );
-@@ -791,6 +810,8 @@ class XMLParser : public FileStorageParser
+@@ -791,6 +810,8 @@ public:
          while( ptr && *ptr != '\0' )
          {
              ptr = skipSpaces( ptr, 0 );
 +            if (!ptr)
 +                CV_PARSE_ERROR_CPP("Invalid input");
-
+ 
              if( *ptr != '\0' )
              {
 diff --git a/modules/core/src/persistence_yml.cpp b/modules/core/src/persistence_yml.cpp
-index 4129ca1dc57..7742e827701 100644
+index 4129ca1dc5..7742e82770 100644
 --- a/modules/core/src/persistence_yml.cpp
 +++ b/modules/core/src/persistence_yml.cpp
-@@ -330,6 +330,9 @@ class YAMLParser : public FileStorageParser
-
+@@ -330,6 +330,9 @@ public:
+ 
      char* skipSpaces( char* ptr, int min_indent, int max_comment_indent )
      {
 +        if (!ptr)
@@ -167,8 +168,8 @@ index 4129ca1dc57..7742e827701 100644
          for(;;)
          {
              while( *ptr == ' ' )
-@@ -374,6 +377,9 @@ class YAMLParser : public FileStorageParser
-
+@@ -374,6 +377,9 @@ public:
+ 
      bool getBase64Row(char* ptr, int indent, char* &beg, char* &end)
      {
 +        if (!ptr)
@@ -177,8 +178,8 @@ index 4129ca1dc57..7742e827701 100644
          beg = end = ptr = skipSpaces(ptr, 0, INT_MAX);
          if (!ptr || !*ptr)
              return false; // end of file
-@@ -394,6 +400,9 @@ class YAMLParser : public FileStorageParser
-
+@@ -394,6 +400,9 @@ public:
+ 
      char* parseKey( char* ptr, FileNode& map_node, FileNode& value_placeholder )
      {
 +        if (!ptr)
@@ -186,9 +187,9 @@ index 4129ca1dc57..7742e827701 100644
 +
          char c;
          char *endptr = ptr - 1, *saveptr;
-
-@@ -422,6 +431,9 @@ class YAMLParser : public FileStorageParser
-
+ 
+@@ -422,6 +431,9 @@ public:
+ 
      char* parseValue( char* ptr, FileNode& node, int min_indent, bool is_parent_flow )
      {
 +        if (!ptr)
@@ -197,35 +198,35 @@ index 4129ca1dc57..7742e827701 100644
          char* endptr = 0;
          char c = ptr[0], d = ptr[1];
          int value_type = FileNode::NONE;
-@@ -508,6 +520,8 @@ class YAMLParser : public FileStorageParser
-
+@@ -508,6 +520,8 @@ public:
+ 
              *endptr = d;
              ptr = skipSpaces( endptr, min_indent, INT_MAX );
 +            if (!ptr)
 +                CV_PARSE_ERROR_CPP("Invalid input");
-
+ 
              c = *ptr;
-
-@@ -634,6 +648,8 @@ class YAMLParser : public FileStorageParser
+ 
+@@ -634,6 +648,8 @@ public:
                  FileNode elem;
-
+ 
                  ptr = skipSpaces( ptr, new_min_indent, INT_MAX );
 +                if (!ptr)
 +                    CV_PARSE_ERROR_CPP("Invalid input");
                  if( *ptr == '}' || *ptr == ']' )
                  {
                      if( *ptr != d )
-@@ -647,6 +663,8 @@ class YAMLParser : public FileStorageParser
+@@ -647,6 +663,8 @@ public:
                      if( *ptr != ',' )
                          CV_PARSE_ERROR_CPP( "Missing , between the elements" );
                      ptr = skipSpaces( ptr + 1, new_min_indent, INT_MAX );
 +                    if (!ptr)
 +                        CV_PARSE_ERROR_CPP("Invalid input");
                  }
-
+ 
                  if( struct_type == FileNode::MAP )
-@@ -746,6 +764,9 @@ class YAMLParser : public FileStorageParser
-
+@@ -746,6 +764,9 @@ public:
+ 
      bool parse( char* ptr )
      {
 +        if (!ptr)
@@ -234,4 +235,3 @@ index 4129ca1dc57..7742e827701 100644
          bool first = true;
          bool ok = true;
          FileNode root_collection(fs->getFS(), 0, 0);
-
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
index e9f8514cbe..ad61d7c231 100644
--- a/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
@@ -1,4 +1,4 @@
-From 5a497077f109d543ab86dfdf8add1c76c0e47d29 Mon Sep 17 00:00:00 2001
+From 384c5fa5f09aec5512343340fe65ccaaf83dfc48 Mon Sep 17 00:00:00 2001
 From: Alexander Alekhin <alexander.alekhin@intel.com>
 Date: Fri, 23 Aug 2019 16:14:53 +0300
 Subject: [PATCH] objdetect: add input check in HOG detector
@@ -8,24 +8,25 @@ Upstream-Status: Backport [https://github.com/opencv/opencv/commit/5a497077f109d
 Comment: No changes in any hunk
 
 Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+
 ---
  modules/objdetect/src/hog.cpp | 19 ++++++++++++-------
  1 file changed, 12 insertions(+), 7 deletions(-)
 
 diff --git a/modules/objdetect/src/hog.cpp b/modules/objdetect/src/hog.cpp
-index 9524851eebb..378bab30876 100644
+index e3e43bb86e..af814658fe 100644
 --- a/modules/objdetect/src/hog.cpp
 +++ b/modules/objdetect/src/hog.cpp
-@@ -68,6 +68,7 @@ enum {DESCR_FORMAT_COL_BY_COL, DESCR_FORMAT_ROW_BY_ROW};
-
+@@ -65,6 +65,7 @@ namespace cv
+ 
  static int numPartsWithin(int size, int part_size, int stride)
  {
 +    CV_Assert(stride != 0);
      return (size - part_size + stride) / stride;
  }
-
-@@ -80,13 +81,17 @@ static Size numPartsWithin(cv::Size size, cv::Size part_size,
-
+ 
+@@ -77,13 +78,17 @@ static Size numPartsWithin(cv::Size size, cv::Size part_size,
+ 
  static size_t getBlockHistogramSize(Size block_size, Size cell_size, int nbins)
  {
 +    CV_Assert(!cell_size.empty());
@@ -34,7 +35,7 @@ index 9524851eebb..378bab30876 100644
 +                                block_size.height / cell_size.height);
      return (size_t)(nbins * cells_per_block.area());
  }
-
+ 
  size_t HOGDescriptor::getDescriptorSize() const
  {
 +    CV_Assert(!cellSize.empty());
@@ -43,7 +44,7 @@ index 9524851eebb..378bab30876 100644
      CV_Assert(blockSize.width % cellSize.width == 0 &&
          blockSize.height % cellSize.height == 0);
      CV_Assert((winSize.width - blockSize.width) % blockStride.width == 0 &&
-@@ -144,20 +149,20 @@ bool HOGDescriptor::read(FileNode& obj)
+@@ -141,20 +146,20 @@ bool HOGDescriptor::read(FileNode& obj)
      if( !obj.isMap() )
          return false;
      FileNodeIterator it = obj["winSize"].begin();
@@ -70,4 +71,3 @@ index 9524851eebb..378bab30876 100644
      if (obj["signedGradient"].empty())
          signedGradient = false;
      else
-
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
index 79f8514bdd..3510e1eb98 100644
--- a/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
@@ -1,4 +1,4 @@
-From d1615ba11a93062b1429fce9f0f638d1572d3418 Mon Sep 17 00:00:00 2001
+From 34195a57528a3f2c807bc3eeb8c934b8ea8289bd Mon Sep 17 00:00:00 2001
 From: Thang Tran <TranKimThang279@gmail.com>
 Date: Mon, 27 May 2019 08:18:26 +0200
 Subject: [PATCH] video:fixed DISOpticalFlow segfault from small img
@@ -8,13 +8,14 @@ Upstream-Status: Backport [https://github.com/opencv/opencv/commit/d1615ba11a930
 Comment: No changes in any hunk
 
 Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+
 ---
  modules/video/src/dis_flow.cpp          | 67 ++++++++++++++++++++++++-
  modules/video/test/test_OF_accuracy.cpp | 28 +++++++++++
  2 files changed, 93 insertions(+), 2 deletions(-)
 
 diff --git a/modules/video/src/dis_flow.cpp b/modules/video/src/dis_flow.cpp
-index a453d8b2b51..806d6f1ddaf 100644
+index b86df1564b..adafcc92d8 100644
 --- a/modules/video/src/dis_flow.cpp
 +++ b/modules/video/src/dis_flow.cpp
 @@ -140,6 +140,8 @@ class DISOpticalFlowImpl CV_FINAL : public DISOpticalFlow
@@ -23,13 +24,13 @@ index a453d8b2b51..806d6f1ddaf 100644
                                     Mat &I0y);
 +    int autoSelectCoarsestScale(int img_width);
 +    void autoSelectPatchSizeAndScales(int img_width);
-
+ 
      struct PatchInverseSearch_ParBody : public ParallelLoopBody
      {
 @@ -435,6 +437,44 @@ void DISOpticalFlowImpl::precomputeStructureTensor(Mat &dst_I0xx, Mat &dst_I0yy,
      }
  }
-
+ 
 +int DISOpticalFlowImpl::autoSelectCoarsestScale(int img_width)
 +{
 +    const int fratio = 5;
@@ -71,14 +72,14 @@ index a453d8b2b51..806d6f1ddaf 100644
  DISOpticalFlowImpl::PatchInverseSearch_ParBody::PatchInverseSearch_ParBody(DISOpticalFlowImpl &_dis, int _nstripes,
                                                                             int _hs, Mat &dst_Sx, Mat &dst_Sy,
                                                                             Mat &src_Ux, Mat &src_Uy, Mat &_I0, Mat &_I1,
-@@ -1318,9 +1358,20 @@ bool DISOpticalFlowImpl::ocl_calc(InputArray I0, InputArray I1, InputOutputArray
+@@ -1313,9 +1353,20 @@ bool DISOpticalFlowImpl::ocl_calc(InputArray I0, InputArray I1, InputOutputArray
      else
          flow.create(I1Mat.size(), CV_32FC2);
      UMat &u_flowMat = flow.getUMatRef();
 -    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code serach for maximal movement of width/4 */
 +    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code search for maximal movement of width/4 */
                           (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_size) / log(2.0)));              /* Deepest pyramid level greater or equal than patch*/
-
+ 
 +    if (coarsest_scale<0)
 +        CV_Error(cv::Error::StsBadSize, "The input image must have either width or height >= 12");
 +
@@ -93,7 +94,7 @@ index a453d8b2b51..806d6f1ddaf 100644
      ocl_prepareBuffers(I0Mat, I1Mat, u_flowMat, use_input_flow);
      u_Ux[coarsest_scale].setTo(0.0f);
      u_Uy[coarsest_scale].setTo(0.0f);
-@@ -1385,8 +1436,20 @@ void DISOpticalFlowImpl::calc(InputArray I0, InputArray I1, InputOutputArray flo
+@@ -1380,8 +1431,20 @@ void DISOpticalFlowImpl::calc(InputArray I0, InputArray I1, InputOutputArray flo
      else
          flow.create(I1Mat.size(), CV_32FC2);
      Mat flowMat = flow.getMat();
@@ -113,16 +114,16 @@ index a453d8b2b51..806d6f1ddaf 100644
 +    }
 +
      int num_stripes = getNumThreads();
-
+ 
      prepareBuffers(I0Mat, I1Mat, flowMat, use_input_flow);
 diff --git a/modules/video/test/test_OF_accuracy.cpp b/modules/video/test/test_OF_accuracy.cpp
-index affbab65866..b99ffce2a8b 100644
+index affbab6586..b99ffce2a8 100644
 --- a/modules/video/test/test_OF_accuracy.cpp
 +++ b/modules/video/test/test_OF_accuracy.cpp
 @@ -121,6 +121,34 @@ TEST(DenseOpticalFlow_DIS, ReferenceAccuracy)
      }
  }
-
+ 
 +TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanZero)
 +{
 +    cv::Ptr<cv::DISOpticalFlow> of = cv::DISOpticalFlow::create();
@@ -154,4 +155,3 @@ index affbab65866..b99ffce2a8b 100644
  TEST(DenseOpticalFlow_VariationalRefinement, ReferenceAccuracy)
  {
      Mat frame1, frame2, GT;
-
diff --git a/meta-oe/recipes-support/opencv/opencv/download.patch b/meta-oe/recipes-support/opencv/opencv/download.patch
index fa8db88078..ae01a5edcd 100644
--- a/meta-oe/recipes-support/opencv/opencv/download.patch
+++ b/meta-oe/recipes-support/opencv/opencv/download.patch
@@ -1,3 +1,8 @@
+From 3b1a69503dea2075d51655a0cea5369c88a67632 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 9 Jan 2020 16:24:24 +0000
+Subject: [PATCH] opencv: abort configure if we need to download
+
 This CMake module will download files during do_configure.  This is bad as it
 means we can't do offline builds.
 
@@ -6,6 +11,10 @@ Add an option to disallow downloads by emitting a fatal error.
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ cmake/OpenCVDownload.cmake | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
 diff --git a/cmake/OpenCVDownload.cmake b/cmake/OpenCVDownload.cmake
 index cdc47ad2cb..74573f45a2 100644
 --- a/cmake/OpenCVDownload.cmake
-- 
2.30.2

