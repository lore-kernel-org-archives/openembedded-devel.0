Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1994C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 23:12:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.2133.1707520372079777325
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 15:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Blcuk694;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4108cce1353so673355e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 15:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707520370; x=1708125170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufWVd7OfNHH6pE10Qf/TwlxOJb+51eFp7Pln2Q0BW3Q=;
        b=Blcuk694BonLd6qko+zubtWDggdmVTxXOP8VPTRcucx8gNqm7Zg3+lPLHHFHTnJHIY
         AboEj2jbw2u9Sg6XcmYPFblrzuu1CSO36lyj1XS3GoLJYme+SHQFN7eFFUkt8gAmd/MO
         a43R9EYr7JdwDdTQOt4ySZ8o1gQgKNjf1W8HzIehTE9n0x06SW+6K/yb9qrVkYWIpyRP
         AM289KIT1TcXCxv0hI4WpYIwcuqffAs/MA+kz0zGjv4rFD9XnppqC0/GIwaWObBqKTF9
         kgOQj0iPN2XvCwUodiDQu1NmW3uOp0YA9EBKFcM1CEYvici1lJ3ftVsLELLdU1hZdxN+
         tDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707520370; x=1708125170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufWVd7OfNHH6pE10Qf/TwlxOJb+51eFp7Pln2Q0BW3Q=;
        b=AKpSDwUvMHXtfs9Y4CMkpUnKW7AgiOth7LrvXXe0YUT8Fx+QQiheUlpSvpMA9FFhQu
         A7pd7NsC4GAIsxisjYDrKyWXgZAAdbp4+suXOdNqcImL3OroAH90/y5WwwQ5z2bUXfFI
         jTVg8KcM3VUMIpfgLd0aHenZwOR1C1458GgQPkgVeQgCmvfnJL8DRHXCQu5fny8fyRJb
         HIsrUOgLX/ZI0+Te3VJs3kVOIzEbEblZ049YDbKUkf42PhGrk8SDmqa9G5VbwxzC7rIO
         MNWAxHfA8hFpqk+xe+6TdRYogoFE2eY9VmR/GI75noMvn5pj8N8CUgbeVxpEHGzeDhCM
         fu4Q==
X-Gm-Message-State: AOJu0YyR7zmq2v88r2jjSJktNijuVC2yls8ijxMaZFL70n9IvG5DrYZ7
	E+dWouKcpMg/AvmTzcb+I484iRjMQx8g0/JAsDoiQDMUbhQueqYCKb4zUjUX
X-Google-Smtp-Source: AGHT+IFbkb1aOsi1kt/1cTw9/TCdZwMSlcOTfhcRZluyxXZ3E2Veov0uDCzkf4L1pge8cjFb2We6qw==
X-Received: by 2002:a05:600c:1f91:b0:40f:de23:b8f3 with SMTP id je17-20020a05600c1f9100b0040fde23b8f3mr460636wmb.23.1707520370233;
        Fri, 09 Feb 2024 15:12:50 -0800 (PST)
Received: from swi-bsandu-l1.corp.ad.wrs.com ([2a01:4b00:8855:a800:9327:574c:62b7:40c4])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b00410709fa0d3sm1859929wmq.33.2024.02.09.15.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 15:12:49 -0800 (PST)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH v2] opencv: upgrade 4.8.0 -> 4.9.0
Date: Fri,  9 Feb 2024 23:12:21 +0000
Message-Id: <20240209231221.186097-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 23:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108693

Full changelogs:
https://github.com/opencv/opencv/wiki/ChangeLog#version481
https://github.com/opencv/opencv/wiki/ChangeLog#version490

Also drop python2 support.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../opencv/fix-build-with-protobuf-v22.patch  | 203 ------------------
 .../{opencv_4.8.0.bb => opencv_4.9.0.bb}      |  17 +-
 2 files changed, 3 insertions(+), 217 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.8.0.bb => opencv_4.9.0.bb} (92%)

diff --git a/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch b/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch
deleted file mode 100644
index 265d723c6..000000000
--- a/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-From 75f7475fcfb35cbe4d8f5ccf5c4ac8bc78f2dc30 Mon Sep 17 00:00:00 2001
-From: Kumataro <Kumataro@users.noreply.github.com>
-Date: Thu, 19 Oct 2023 14:45:08 +0900
-Subject: [PATCH] Merge pull request #24372 from Kumataro:fix24369
-
-Supporting protobuf v22 and later(with abseil-cpp/C++17) #24372
-
-fix https://github.com/opencv/opencv/issues/24369
-related https://github.com/opencv/opencv/issues/23791
-
-1. This patch supports external protobuf v22 and later, it required abseil-cpp and c++17.
-    Even if the built-in protobuf is upgraded to v22 or later,
-    the dependency on abseil-cpp and the requirement for C++17 will continue.
-2. Some test for caffe required patched protobuf, so this patch disable them.
-
-This patch is tested by following libraries.
--  Protobuf:                    /usr/local/lib/libprotobuf.so (4.24.4)
--  abseil-cpp:                YES (20230125)
-
-See details at https://github.com/opencv/opencv/wiki/How_to_contribute#making-a-good-pull-request
-
-- [x] I agree to contribute to the project under Apache 2 License.
-- [x] To the best of my knowledge, the proposed patch is not based on a code under GPL or another license that is incompatible with OpenCV
-- [x] The PR is proposed to the proper branch
-- [x] There is a reference to the original bug report and related work
-- [x] There is accuracy test, performance test and test data in opencv_extra repository, if applicable
-      Patch to opencv_extra has the same branch name.
-- [x] The feature is well documented and sample code can be built with the project CMake
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/commit/6e4280ea81b59c6dca45bb9801b758377beead55]
----
- cmake/OpenCVFindProtobuf.cmake   | 35 +++++++++++++++++++++++++++-----
- modules/dnn/CMakeLists.txt       |  6 ++++++
- modules/dnn/test/test_layers.cpp | 24 ++++++++++++++++++----
- 3 files changed, 56 insertions(+), 9 deletions(-)
-
-diff --git a/cmake/OpenCVFindProtobuf.cmake b/cmake/OpenCVFindProtobuf.cmake
-index 8835347d1d..5b1e17529f 100644
---- a/cmake/OpenCVFindProtobuf.cmake
-+++ b/cmake/OpenCVFindProtobuf.cmake
-@@ -30,8 +30,14 @@ if(BUILD_PROTOBUF)
-   set(Protobuf_LIBRARIES "libprotobuf")
-   set(HAVE_PROTOBUF TRUE)
- else()
-+  # we still need this for command PROTOBUF_GENERATE_CPP.
-+  set(protobuf_MODULE_COMPATIBLE ON)
-+
-   unset(Protobuf_VERSION CACHE)
--  find_package(Protobuf QUIET)
-+  find_package(Protobuf QUIET CONFIG)
-+  if(NOT Protobuf_FOUND)
-+    find_package(Protobuf QUIET)
-+  endif()
- 
-   # Backwards compatibility
-   # Define camel case versions of input variables
-@@ -67,6 +73,20 @@ else()
-   endif()
- endif()
- 
-+# See https://github.com/opencv/opencv/issues/24369
-+# In Protocol Buffers v22.0 and later drops C++11 support and depends abseil-cpp.
-+#   Details: https://protobuf.dev/news/2022-08-03/
-+# And if std::text_view is in abseil-cpp requests C++17 and later.
-+
-+if(HAVE_PROTOBUF)
-+  if(NOT (Protobuf_VERSION VERSION_LESS 22))
-+    if((CMAKE_CXX_STANDARD EQUAL 98) OR (CMAKE_CXX_STANDARD LESS 17))
-+      message(STATUS "CMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD} is too old to support protobuf(${Protobuf_VERSION}) and/or abseil-cpp. Use C++17 or later. Turning HAVE_PROTOBUF off")
-+      set(HAVE_PROTOBUF FALSE)
-+    endif()
-+  endif()
-+endif()
-+
- if(HAVE_PROTOBUF AND PROTOBUF_UPDATE_FILES AND NOT COMMAND PROTOBUF_GENERATE_CPP)
-   message(FATAL_ERROR "Can't configure protobuf dependency (BUILD_PROTOBUF=${BUILD_PROTOBUF} PROTOBUF_UPDATE_FILES=${PROTOBUF_UPDATE_FILES})")
- endif()
-@@ -74,15 +94,20 @@ endif()
- if(HAVE_PROTOBUF)
-   list(APPEND CUSTOM_STATUS protobuf)
-   if(NOT BUILD_PROTOBUF)
-+    unset( __location)
-     if(TARGET "${Protobuf_LIBRARIES}")
-       get_target_property(__location "${Protobuf_LIBRARIES}" IMPORTED_LOCATION_RELEASE)
-       if(NOT __location)
-         get_target_property(__location "${Protobuf_LIBRARIES}" IMPORTED_LOCATION)
-       endif()
--    elseif(Protobuf_LIBRARY)
--      set(__location "${Protobuf_LIBRARY}")
--    else()
--      set(__location "${Protobuf_LIBRARIES}")
-+    endif()
-+
-+    if(NOT __location)
-+      if(Protobuf_LIBRARY)
-+        set(__location "${Protobuf_LIBRARY}")
-+      else()
-+        set(__location "${Protobuf_LIBRARIES}")
-+      endif()
-     endif()
-   endif()
-   list(APPEND CUSTOM_STATUS_protobuf "    Protobuf:"
-diff --git a/modules/dnn/CMakeLists.txt b/modules/dnn/CMakeLists.txt
-index 804b78ead2..9fcc460909 100644
---- a/modules/dnn/CMakeLists.txt
-+++ b/modules/dnn/CMakeLists.txt
-@@ -245,6 +245,12 @@ ocv_create_module(${libs} ${dnn_runtime_libs})
- ocv_add_samples()
- ocv_add_accuracy_tests(${dnn_runtime_libs})
- 
-+if(NOT BUILD_PROTOBUF)
-+  if(TARGET opencv_test_dnn)
-+    ocv_target_compile_definitions(opencv_test_dnn PRIVATE "OPENCV_DNN_EXTERNAL_PROTOBUF=1")
-+  endif()
-+endif()
-+
- set(perf_path "${CMAKE_CURRENT_LIST_DIR}/perf")
- file(GLOB_RECURSE perf_srcs "${perf_path}/*.cpp")
- file(GLOB_RECURSE perf_hdrs "${perf_path}/*.hpp" "${perf_path}/*.h")
-diff --git a/modules/dnn/test/test_layers.cpp b/modules/dnn/test/test_layers.cpp
-index 763d94b99c..6cb6d54b3f 100644
---- a/modules/dnn/test/test_layers.cpp
-+++ b/modules/dnn/test/test_layers.cpp
-@@ -756,11 +756,15 @@ TEST_F(Layer_RNN_Test, get_set_test)
- 
- TEST_P(Test_Caffe_layers, Accum)
- {
-+#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
-+    throw SkipTestException("Requires patched protobuf");
-+#else
-     if (backend == DNN_BACKEND_OPENCV && target != DNN_TARGET_CPU)
-         applyTestTag(CV_TEST_TAG_DNN_SKIP_OPENCL, CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
- 
-     testLayerUsingCaffeModels("accum", false, false, 0.0, 0.0, 2);
-     testLayerUsingCaffeModels("accum_ref", false, false, 0.0, 0.0, 2);
-+#endif
- }
- 
- TEST_P(Test_Caffe_layers, FlowWarp)
-@@ -780,27 +784,39 @@ TEST_P(Test_Caffe_layers, ChannelNorm)
- 
- TEST_P(Test_Caffe_layers, DataAugmentation)
- {
-+#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
-+    throw SkipTestException("Requires patched protobuf");
-+#else
-     if (backend == DNN_BACKEND_OPENCV && target == DNN_TARGET_OPENCL_FP16)
-         applyTestTag(CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
-     testLayerUsingCaffeModels("data_augmentation", true, false);
-     testLayerUsingCaffeModels("data_augmentation_2x1", true, false);
-     testLayerUsingCaffeModels("data_augmentation_8x6", true, false);
-+#endif
- }
- 
- TEST_P(Test_Caffe_layers, Resample)
- {
-+#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
-+    throw SkipTestException("Requires patched protobuf");
-+#else
-     if (backend != DNN_BACKEND_OPENCV)
-         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_NN_BUILDER, CV_TEST_TAG_DNN_SKIP_IE_NGRAPH);
-     testLayerUsingCaffeModels("nearest_2inps", false, false, 0.0, 0.0, 2);
-     testLayerUsingCaffeModels("nearest", false, false);
-+#endif
- }
- 
- TEST_P(Test_Caffe_layers, Correlation)
- {
-+#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
-+    throw SkipTestException("Requires patched protobuf");
-+#else
-     if (backend == DNN_BACKEND_OPENCV && target == DNN_TARGET_OPENCL_FP16)
-         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_NGRAPH, CV_TEST_TAG_DNN_SKIP_IE_NN_BUILDER,
-                      CV_TEST_TAG_DNN_SKIP_OPENCL, CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
-     testLayerUsingCaffeModels("correlation", false, false, 0.0, 0.0, 2);
-+#endif
- }
- 
- TEST_P(Test_Caffe_layers, Convolution2Inputs)
-@@ -1641,12 +1657,11 @@ private:
-     int outWidth, outHeight, zoomFactor;
- };
- 
--#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
- TEST_P(Test_Caffe_layers, Interp)
--#else
--TEST_P(Test_Caffe_layers, DISABLED_Interp)  // requires patched protobuf (available in OpenCV source tree only)
--#endif
- {
-+#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
-+    throw SkipTestException("Requires patched protobuf");
-+#else
- #if defined(INF_ENGINE_RELEASE) && INF_ENGINE_VER_MAJOR_EQ(2021030000)
-     if (backend == DNN_BACKEND_INFERENCE_ENGINE_NGRAPH && target == DNN_TARGET_MYRIAD)
-         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_MYRIAD, CV_TEST_TAG_DNN_SKIP_IE_NGRAPH);  // exception
-@@ -1670,6 +1685,7 @@ TEST_P(Test_Caffe_layers, DISABLED_Interp)  // requires patched protobuf (availa
- 
-     // Test an implemented layer.
-     testLayerUsingCaffeModels("layer_interp", false, false);
-+#endif
- }
- 
- INSTANTIATE_TEST_CASE_P(/*nothing*/, Test_Caffe_layers, dnnBackendsAndTargets());
diff --git a/meta-oe/recipes-support/opencv/opencv_4.8.0.bb b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
similarity index 92%
rename from meta-oe/recipes-support/opencv/opencv_4.8.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.9.0.bb
index 85eb230b0..7c9624119 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.8.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "f9a59f2592993d3dcc080e495f4f5e02dd8ec7ef"
-SRCREV_contrib = "f10c84d48b0714f2b408c9e5cccfac1277c8e6cc"
+SRCREV_opencv = "dad8af6b17f8e60d7b95a1203a1b4d22f56574cf"
+SRCREV_contrib = "c7602a8f74205e44389bd6a4e8d727d32e7e27b4"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
@@ -31,7 +31,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
-           file://fix-build-with-protobuf-v22.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
@@ -114,7 +113,6 @@ PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtu
 PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"
 PACKAGECONFIG[python3] = "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
 PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
@@ -123,13 +121,9 @@ PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
 
-inherit pkgconfig cmake
-
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'setuptools3-base', '', d)}
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'distutils-base', '', d)}
+inherit pkgconfig cmake setuptools3-base python3native
 
 export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON="${STAGING_BINDIR_NATIVE}/${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3', 'python', d)}"
 export ORACLE_JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
 export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"
 export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
@@ -139,7 +133,6 @@ TARGET_CC_ARCH += "-I${S}/include "
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'samples', '${PN}-samples', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${BPN}', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${BPN}', '', d)} \
     ${PN}-apps"
 
@@ -186,10 +179,6 @@ INSANE_SKIP:${PN}-dbg = "libdir"
 
 ALLOW_EMPTY:${PN} = "1"
 
-SUMMARY:python-opencv = "Python bindings to opencv"
-FILES:python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS:python-opencv = "python-core python-numpy"
-
 SUMMARY:python3-opencv = "Python bindings to opencv"
 FILES:python3-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS:python3-opencv = "python3-core python3-numpy"
-- 
2.34.1


