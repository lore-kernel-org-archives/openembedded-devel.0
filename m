Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB08CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 06:47:28 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.21519.1697698045222050638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 23:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKmNxLwi;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9be3b66f254so847281766b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 23:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697698043; x=1698302843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVsCYg5ZCnKz62Ltn9ykcb8mFfyCF7MxceDwqblklF4=;
        b=LKmNxLwi0xmq+z/Skjc2nHP1h8MNqHbbJEX/NpsRLFFRg9dTrbxJI+lUuJNoYzvFQw
         unxMI1YUoniDM+1n0yHzsLrVQNJtHvI7r2MF/Rmtp6OHEFVU403Xn5CZjaU9Gnf0LdHc
         GNY5YZ/RHNuKCBz9E5AmRGrICDns971llC2KFBL9Q2feF+XPsTBmpCx//XsuqpwRzbmo
         bbqOjFByb07aBGRPcVjqAnIdGikunSVLFwqLzIxFB0r6PuYVZjU7Ub8mHq6h0LF8aKjG
         mSCMvmP88XFl913ty0akx6fkgH/cfrUVhAyASwE8blJtI+VC0WzBz8lJl2VHGqN39GZe
         zTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697698043; x=1698302843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVsCYg5ZCnKz62Ltn9ykcb8mFfyCF7MxceDwqblklF4=;
        b=s0kFaHvlssu4DEhCvyBmW1vPbPd5OgncTyhpqNTpyuq3HbB0m4DSl3Szpt1Kp52kWF
         gZItZjpvSJA/hX6fHajSW+v7cNgZjEoOG1uLp9BmMFfzSSLgIGoRbaxDMXLqAq5SicG1
         oCr95BtGlEm3uPWlfZ+Hv+O1hToOM7HR1QYoRQ12RTaJbtXWPV2elQ1klU7N2pD8Gx6i
         GZ52icyPZOE9sNKExAbMsgU5jdSoGUF4ObGyyXjYzOE0B6NMRq6myiiOtbL4/sJ19E/i
         uS1Vcg1E1imdGxBuA+zQelIgCJ7CQ/nhDzmSS2jPY94C1dYhU3iU3JvLn6tMyww4Eji+
         Qv3Q==
X-Gm-Message-State: AOJu0YwpEHxnLkFch3MBIgyXLWWQIC7vWJNlL7Ezhzrb7D8OmeSk4+6L
	FMxFKbr/7IFzP2D3qENhou5S0zIFGyM=
X-Google-Smtp-Source: AGHT+IHuXPuo2lcfixioxXQW7Kc4hYYlPyg8QxlVghZ3Aju7Sl+aD50CNT8mzplaFinxGosUJ8xq2g==
X-Received: by 2002:a17:906:7315:b0:9ad:ef31:6efc with SMTP id di21-20020a170906731500b009adef316efcmr1151462ejc.21.1697698042978;
        Wed, 18 Oct 2023 23:47:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lg5-20020a170906f88500b009ad875d12d7sm2923670ejb.210.2023.10.18.23.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 23:47:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] opencv: refresh protobuf-v22 compatibility patch with backported version
Date: Thu, 19 Oct 2023 08:47:16 +0200
Message-ID: <20231019064717.3156959-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 06:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105590

* as a bonus it fixes building with tests PACKAGECONFIG enabled as reported in:
  https://github.com/openembedded/meta-openembedded/commit/225ce6a14a8110ab6b573b4dc9f5297a03d17e0f#r129831882

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../opencv/fix-build-with-protobuf-v22.patch  | 385 ++++--------------
 1 file changed, 88 insertions(+), 297 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch b/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch
index 536060cfd9..265d723c6e 100644
--- a/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch
+++ b/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch
@@ -1,19 +1,60 @@
-From 5e4150826fea6f37276f348c65d94ce4847d1211 Mon Sep 17 00:00:00 2001
+From 75f7475fcfb35cbe4d8f5ccf5c4ac8bc78f2dc30 Mon Sep 17 00:00:00 2001
 From: Kumataro <Kumataro@users.noreply.github.com>
-Date: Sat, 7 Oct 2023 10:11:25 +0900
-Subject: [PATCH] 3rdparty: supporting protobuf v22 and later
+Date: Thu, 19 Oct 2023 14:45:08 +0900
+Subject: [PATCH] Merge pull request #24372 from Kumataro:fix24369
 
-Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/24372]
+Supporting protobuf v22 and later(with abseil-cpp/C++17) #24372
+
+fix https://github.com/opencv/opencv/issues/24369
+related https://github.com/opencv/opencv/issues/23791
+
+1. This patch supports external protobuf v22 and later, it required abseil-cpp and c++17.
+    Even if the built-in protobuf is upgraded to v22 or later,
+    the dependency on abseil-cpp and the requirement for C++17 will continue.
+2. Some test for caffe required patched protobuf, so this patch disable them.
+
+This patch is tested by following libraries.
+-  Protobuf:                    /usr/local/lib/libprotobuf.so (4.24.4)
+-  abseil-cpp:                YES (20230125)
+
+See details at https://github.com/opencv/opencv/wiki/How_to_contribute#making-a-good-pull-request
+
+- [x] I agree to contribute to the project under Apache 2 License.
+- [x] To the best of my knowledge, the proposed patch is not based on a code under GPL or another license that is incompatible with OpenCV
+- [x] The PR is proposed to the proper branch
+- [x] There is a reference to the original bug report and related work
+- [x] There is accuracy test, performance test and test data in opencv_extra repository, if applicable
+      Patch to opencv_extra has the same branch name.
+- [x] The feature is well documented and sample code can be built with the project CMake
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/6e4280ea81b59c6dca45bb9801b758377beead55]
 ---
- cmake/OpenCVFindProtobuf.cmake | 37 ++++++++++++++++++++++++++++++++++
- modules/dnn/CMakeLists.txt     |  9 +++++++++
- 2 files changed, 46 insertions(+)
+ cmake/OpenCVFindProtobuf.cmake   | 35 +++++++++++++++++++++++++++-----
+ modules/dnn/CMakeLists.txt       |  6 ++++++
+ modules/dnn/test/test_layers.cpp | 24 ++++++++++++++++++----
+ 3 files changed, 56 insertions(+), 9 deletions(-)
 
 diff --git a/cmake/OpenCVFindProtobuf.cmake b/cmake/OpenCVFindProtobuf.cmake
-index 8835347d1d..9bd5c28db8 100644
+index 8835347d1d..5b1e17529f 100644
 --- a/cmake/OpenCVFindProtobuf.cmake
 +++ b/cmake/OpenCVFindProtobuf.cmake
-@@ -67,6 +67,38 @@ else()
+@@ -30,8 +30,14 @@ if(BUILD_PROTOBUF)
+   set(Protobuf_LIBRARIES "libprotobuf")
+   set(HAVE_PROTOBUF TRUE)
+ else()
++  # we still need this for command PROTOBUF_GENERATE_CPP.
++  set(protobuf_MODULE_COMPATIBLE ON)
++
+   unset(Protobuf_VERSION CACHE)
+-  find_package(Protobuf QUIET)
++  find_package(Protobuf QUIET CONFIG)
++  if(NOT Protobuf_FOUND)
++    find_package(Protobuf QUIET)
++  endif()
+ 
+   # Backwards compatibility
+   # Define camel case versions of input variables
+@@ -67,6 +73,20 @@ else()
    endif()
  endif()
  
@@ -21,82 +62,49 @@ index 8835347d1d..9bd5c28db8 100644
 +# In Protocol Buffers v22.0 and later drops C++11 support and depends abseil-cpp.
 +#   Details: https://protobuf.dev/news/2022-08-03/
 +# And if std::text_view is in abseil-cpp requests C++17 and later.
-+if(HAVE_PROTOBUF)
-+    if("${Protobuf_VERSION}" MATCHES [[[0-9]+.([0-9]+).[0-9]+]])
-+        string(COMPARE GREATER_EQUAL "${CMAKE_MATCH_1}" "22" REQUEST_ABSL)
-+
-+        if(REQUEST_ABSL)
-+            string(COMPARE GREATER_EQUAL "${CMAKE_CXX_STANDARD}" "17" USED_AFTER_CXX17)
-+            if(NOT USED_AFTER_CXX17)
-+                message("CMAKE_CXX_STANDARD : ${CMAKE_CXX_STANDARD}")
-+                message("protobuf           : ${Protobuf_VERSION}")
-+                message(FATAL_ERROR "protobuf(v22 and later) and abseil-cpp request CMAKE_CXX_STANDARD=17 and later.")
-+            endif()
-+
-+            ocv_check_modules(ABSL_STRINGS absl_strings)
-+            if(NOT ABSL_STRINGS_FOUND)
-+                message(FATAL_ERROR "protobuf(v22 and later) requests abseil-cpp(strings), but missing.")
-+            endif()
-+
-+            ocv_check_modules(ABSL_LOG absl_log)
-+            if(NOT ABSL_LOG_FOUND)
-+                message(FATAL_ERROR "protobuf(v22 and later) requests abseil-cpp(log), but missing.")
-+            endif()
 +
-+        endif()
-+    else()
-+        message(FATAL_ERROR "Protobuf version(${Protobuf_VERSION}) is unexpected to split.")
++if(HAVE_PROTOBUF)
++  if(NOT (Protobuf_VERSION VERSION_LESS 22))
++    if((CMAKE_CXX_STANDARD EQUAL 98) OR (CMAKE_CXX_STANDARD LESS 17))
++      message(STATUS "CMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD} is too old to support protobuf(${Protobuf_VERSION}) and/or abseil-cpp. Use C++17 or later. Turning HAVE_PROTOBUF off")
++      set(HAVE_PROTOBUF FALSE)
 +    endif()
++  endif()
 +endif()
 +
  if(HAVE_PROTOBUF AND PROTOBUF_UPDATE_FILES AND NOT COMMAND PROTOBUF_GENERATE_CPP)
    message(FATAL_ERROR "Can't configure protobuf dependency (BUILD_PROTOBUF=${BUILD_PROTOBUF} PROTOBUF_UPDATE_FILES=${PROTOBUF_UPDATE_FILES})")
  endif()
-@@ -89,3 +121,8 @@ if(HAVE_PROTOBUF)
-     BUILD_PROTOBUF THEN "build (${Protobuf_VERSION})"
-     ELSE "${__location} (${Protobuf_VERSION})")
- endif()
-+
-+if(HAVE_ABSL_STRINGS AND HAVE_ABSL_LOG)
-+  list(APPEND CUSTOM_STATUS absl)
-+  list(APPEND CUSTOM_STATUS_absl "      abseil-cpp:" "YES (${ABSL_STRINGS_VERSION})" )
-+endif()
-diff --git a/modules/dnn/CMakeLists.txt b/modules/dnn/CMakeLists.txt
-index 804b78ead2..d32007b37e 100644
---- a/modules/dnn/CMakeLists.txt
-+++ b/modules/dnn/CMakeLists.txt
-@@ -149,6 +149,15 @@ if(NOT BUILD_PROTOBUF)
-   list(APPEND include_dirs ${Protobuf_INCLUDE_DIRS})
- endif()
- 
-+if(HAVE_ABSL_STRINGS)
-+  list(APPEND libs ${ABSL_STRINGS_LIBRARIES})
-+  list(APPEND include_dirs ${ABSL_STRTRINGS_INCLUDE_DIRS})
-+endif()
-+if(HAVE_ABSL_LOG)
-+  list(APPEND libs ${ABSL_LOG_LIBRARIES})
-+  list(APPEND include_dirs ${ABSL_LOG_INCLUDE_DIRS})
-+endif()
+@@ -74,15 +94,20 @@ endif()
+ if(HAVE_PROTOBUF)
+   list(APPEND CUSTOM_STATUS protobuf)
+   if(NOT BUILD_PROTOBUF)
++    unset( __location)
+     if(TARGET "${Protobuf_LIBRARIES}")
+       get_target_property(__location "${Protobuf_LIBRARIES}" IMPORTED_LOCATION_RELEASE)
+       if(NOT __location)
+         get_target_property(__location "${Protobuf_LIBRARIES}" IMPORTED_LOCATION)
+       endif()
+-    elseif(Protobuf_LIBRARY)
+-      set(__location "${Protobuf_LIBRARY}")
+-    else()
+-      set(__location "${Protobuf_LIBRARIES}")
++    endif()
 +
- set(sources_options "")
- 
- list(APPEND libs ${LAPACK_LIBRARIES})
-From 06a7669521d205f647d3e718322ccd153cdbbb77 Mon Sep 17 00:00:00 2001
-From: Kumataro <Kumataro@users.noreply.github.com>
-Date: Sun, 8 Oct 2023 09:39:35 +0900
-Subject: [PATCH] dnn: disable some tests for external protobuf
-
----
- modules/dnn/CMakeLists.txt         |  5 +++++
- modules/dnn/src/caffe/caffe_io.cpp | 24 ++++++++++++++++++++++--
- modules/dnn/test/test_layers.cpp   | 16 ++++++++++++++++
- 3 files changed, 43 insertions(+), 2 deletions(-)
-
++    if(NOT __location)
++      if(Protobuf_LIBRARY)
++        set(__location "${Protobuf_LIBRARY}")
++      else()
++        set(__location "${Protobuf_LIBRARIES}")
++      endif()
+     endif()
+   endif()
+   list(APPEND CUSTOM_STATUS_protobuf "    Protobuf:"
 diff --git a/modules/dnn/CMakeLists.txt b/modules/dnn/CMakeLists.txt
-index d32007b37e..face38465f 100644
+index 804b78ead2..9fcc460909 100644
 --- a/modules/dnn/CMakeLists.txt
 +++ b/modules/dnn/CMakeLists.txt
-@@ -254,6 +254,12 @@ ocv_create_module(${libs} ${dnn_runtime_libs})
+@@ -245,6 +245,12 @@ ocv_create_module(${libs} ${dnn_runtime_libs})
  ocv_add_samples()
  ocv_add_accuracy_tests(${dnn_runtime_libs})
  
@@ -109,215 +117,13 @@ index d32007b37e..face38465f 100644
  set(perf_path "${CMAKE_CURRENT_LIST_DIR}/perf")
  file(GLOB_RECURSE perf_srcs "${perf_path}/*.cpp")
  file(GLOB_RECURSE perf_hdrs "${perf_path}/*.hpp" "${perf_path}/*.h")
-@@ -318,3 +322,4 @@ if(OPENCV_TEST_DNN_TFLITE)
-     ocv_target_compile_definitions(opencv_perf_dnn PRIVATE "OPENCV_TEST_DNN_TFLITE=1")
-   endif()
- endif()
-+
-diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
-index ebecf95eea..ebceca84cf 100644
---- a/modules/dnn/src/caffe/caffe_io.cpp
-+++ b/modules/dnn/src/caffe/caffe_io.cpp
-@@ -1130,7 +1130,17 @@ bool ReadProtoFromTextFile(const char* filename, Message* proto) {
-     parser.AllowUnknownField(true);
-     parser.SetRecursionLimit(1000);
- #endif
--    return parser.Parse(&input, proto);
-+    const bool ret = parser.Parse(&input, proto);
-+
-+#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
-+    if(!ret)
-+    {
-+        LOG(ERROR) << "Some data requires patched protobuf (available in OpenCV source tree only).";
-+        CV_Error_(Error::StsError,("Some data requires patched protobuf (available in OpenCV source tree only)."));
-+    }
-+#endif
-+
-+    return ret;
- }
- 
- bool ReadProtoFromBinaryFile(const char* filename, Message* proto) {
-@@ -1148,7 +1158,17 @@ bool ReadProtoFromTextBuffer(const char* data, size_t len, Message* proto) {
-     parser.AllowUnknownField(true);
-     parser.SetRecursionLimit(1000);
- #endif
--    return parser.Parse(&input, proto);
-+    const bool ret = parser.Parse(&input, proto);
-+
-+#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
-+    if(!ret)
-+    {
-+        LOG(ERROR) << "Some data requires patched protobuf (available in OpenCV source tree only).";
-+        CV_Error_(Error::StsError,("Some data requires patched protobuf (available in OpenCV source tree only)."));
-+    }
-+#endif
-+
-+    return ret;
- }
- 
- 
 diff --git a/modules/dnn/test/test_layers.cpp b/modules/dnn/test/test_layers.cpp
-index 763d94b99c..a07d442d76 100644
+index 763d94b99c..6cb6d54b3f 100644
 --- a/modules/dnn/test/test_layers.cpp
 +++ b/modules/dnn/test/test_layers.cpp
-@@ -754,7 +754,11 @@ TEST_F(Layer_RNN_Test, get_set_test)
-     EXPECT_EQ(shape(outputs[1]), shape(nT, nS, nH));
- }
+@@ -756,11 +756,15 @@ TEST_F(Layer_RNN_Test, get_set_test)
  
-+#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
  TEST_P(Test_Caffe_layers, Accum)
-+#else
-+TEST_P(Test_Caffe_layers, DISABLED_Accum)  // requires patched protobuf (available in OpenCV source tree only)
-+#endif
- {
-     if (backend == DNN_BACKEND_OPENCV && target != DNN_TARGET_CPU)
-         applyTestTag(CV_TEST_TAG_DNN_SKIP_OPENCL, CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
-@@ -778,7 +782,11 @@ TEST_P(Test_Caffe_layers, ChannelNorm)
-     testLayerUsingCaffeModels("channel_norm", false, false);
- }
- 
-+#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
- TEST_P(Test_Caffe_layers, DataAugmentation)
-+#else
-+TEST_P(Test_Caffe_layers, DISABLED_DataAugmentation)  // requires patched protobuf (available in OpenCV source tree only)
-+#endif
- {
-     if (backend == DNN_BACKEND_OPENCV && target == DNN_TARGET_OPENCL_FP16)
-         applyTestTag(CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
-@@ -787,7 +795,11 @@ TEST_P(Test_Caffe_layers, DataAugmentation)
-     testLayerUsingCaffeModels("data_augmentation_8x6", true, false);
- }
- 
-+#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
- TEST_P(Test_Caffe_layers, Resample)
-+#else
-+TEST_P(Test_Caffe_layers, DISABLED_Resample)  // requires patched protobuf (available in OpenCV source tree only)
-+#endif
- {
-     if (backend != DNN_BACKEND_OPENCV)
-         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_NN_BUILDER, CV_TEST_TAG_DNN_SKIP_IE_NGRAPH);
-@@ -795,7 +807,11 @@ TEST_P(Test_Caffe_layers, Resample)
-     testLayerUsingCaffeModels("nearest", false, false);
- }
- 
-+#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
- TEST_P(Test_Caffe_layers, Correlation)
-+#else
-+TEST_P(Test_Caffe_layers, DISABLED_Correlation)  // requires patched protobuf (available in OpenCV source tree only)
-+#endif
- {
-     if (backend == DNN_BACKEND_OPENCV && target == DNN_TARGET_OPENCL_FP16)
-         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_NGRAPH, CV_TEST_TAG_DNN_SKIP_IE_NN_BUILDER,
-From 2c33798f41942aefc203183d673ce4846f32dba4 Mon Sep 17 00:00:00 2001
-From: Kumataro <Kumataro@users.noreply.github.com>
-Date: Sun, 8 Oct 2023 13:28:40 +0900
-Subject: [PATCH] use GREATER instead of GREATER_EQUAL and remove new blank
- line at EOF
-
----
- cmake/OpenCVFindProtobuf.cmake | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/OpenCVFindProtobuf.cmake b/cmake/OpenCVFindProtobuf.cmake
-index 9bd5c28db8..ba147526d6 100644
---- a/cmake/OpenCVFindProtobuf.cmake
-+++ b/cmake/OpenCVFindProtobuf.cmake
-@@ -71,12 +71,14 @@ endif()
- # In Protocol Buffers v22.0 and later drops C++11 support and depends abseil-cpp.
- #   Details: https://protobuf.dev/news/2022-08-03/
- # And if std::text_view is in abseil-cpp requests C++17 and later.
-+
- if(HAVE_PROTOBUF)
-     if("${Protobuf_VERSION}" MATCHES [[[0-9]+.([0-9]+).[0-9]+]])
--        string(COMPARE GREATER_EQUAL "${CMAKE_MATCH_1}" "22" REQUEST_ABSL)
-+        string(COMPARE GREATER "${CMAKE_MATCH_1}" "21" REQUEST_ABSL)  # >=22
- 
-         if(REQUEST_ABSL)
--            string(COMPARE GREATER_EQUAL "${CMAKE_CXX_STANDARD}" "17" USED_AFTER_CXX17)
-+            string(COMPARE GREATER "${CMAKE_CXX_STANDARD}" "16" USED_AFTER_CXX17)  # >=17
-+
-             if(NOT USED_AFTER_CXX17)
-                 message("CMAKE_CXX_STANDARD : ${CMAKE_CXX_STANDARD}")
-                 message("protobuf           : ${Protobuf_VERSION}")
-From cd709eefbeedd116bf3495b42280323b932791ff Mon Sep 17 00:00:00 2001
-From: Kumataro <Kumataro@users.noreply.github.com>
-Date: Mon, 9 Oct 2023 21:51:04 +0900
-Subject: [PATCH] fix for review
-
----
- cmake/OpenCVFindProtobuf.cmake     |  5 ----
- modules/dnn/src/caffe/caffe_io.cpp | 24 ++----------------
- modules/dnn/test/test_layers.cpp   | 40 +++++++++++++++---------------
- 3 files changed, 22 insertions(+), 47 deletions(-)
-
-diff --git a/cmake/OpenCVFindProtobuf.cmake b/cmake/OpenCVFindProtobuf.cmake
-index ba147526d6..2faf1010bf 100644
---- a/cmake/OpenCVFindProtobuf.cmake
-+++ b/cmake/OpenCVFindProtobuf.cmake
-@@ -123,8 +123,3 @@ if(HAVE_PROTOBUF)
-     BUILD_PROTOBUF THEN "build (${Protobuf_VERSION})"
-     ELSE "${__location} (${Protobuf_VERSION})")
- endif()
--
--if(HAVE_ABSL_STRINGS AND HAVE_ABSL_LOG)
--  list(APPEND CUSTOM_STATUS absl)
--  list(APPEND CUSTOM_STATUS_absl "      abseil-cpp:" "YES (${ABSL_STRINGS_VERSION})" )
--endif()
-diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
-index ebceca84cf..ebecf95eea 100644
---- a/modules/dnn/src/caffe/caffe_io.cpp
-+++ b/modules/dnn/src/caffe/caffe_io.cpp
-@@ -1130,17 +1130,7 @@ bool ReadProtoFromTextFile(const char* filename, Message* proto) {
-     parser.AllowUnknownField(true);
-     parser.SetRecursionLimit(1000);
- #endif
--    const bool ret = parser.Parse(&input, proto);
--
--#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
--    if(!ret)
--    {
--        LOG(ERROR) << "Some data requires patched protobuf (available in OpenCV source tree only).";
--        CV_Error_(Error::StsError,("Some data requires patched protobuf (available in OpenCV source tree only)."));
--    }
--#endif
--
--    return ret;
-+    return parser.Parse(&input, proto);
- }
- 
- bool ReadProtoFromBinaryFile(const char* filename, Message* proto) {
-@@ -1158,17 +1148,7 @@ bool ReadProtoFromTextBuffer(const char* data, size_t len, Message* proto) {
-     parser.AllowUnknownField(true);
-     parser.SetRecursionLimit(1000);
- #endif
--    const bool ret = parser.Parse(&input, proto);
--
--#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
--    if(!ret)
--    {
--        LOG(ERROR) << "Some data requires patched protobuf (available in OpenCV source tree only).";
--        CV_Error_(Error::StsError,("Some data requires patched protobuf (available in OpenCV source tree only)."));
--    }
--#endif
--
--    return ret;
-+    return parser.Parse(&input, proto);
- }
- 
- 
-diff --git a/modules/dnn/test/test_layers.cpp b/modules/dnn/test/test_layers.cpp
-index a07d442d76..5c6fc541d7 100644
---- a/modules/dnn/test/test_layers.cpp
-+++ b/modules/dnn/test/test_layers.cpp
-@@ -754,17 +754,17 @@ TEST_F(Layer_RNN_Test, get_set_test)
-     EXPECT_EQ(shape(outputs[1]), shape(nT, nS, nH));
- }
- 
--#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
- TEST_P(Test_Caffe_layers, Accum)
--#else
--TEST_P(Test_Caffe_layers, DISABLED_Accum)  // requires patched protobuf (available in OpenCV source tree only)
--#endif
  {
 +#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
 +    throw SkipTestException("Requires patched protobuf");
@@ -331,15 +137,9 @@ index a07d442d76..5c6fc541d7 100644
  }
  
  TEST_P(Test_Caffe_layers, FlowWarp)
-@@ -782,42 +782,42 @@ TEST_P(Test_Caffe_layers, ChannelNorm)
-     testLayerUsingCaffeModels("channel_norm", false, false);
- }
+@@ -780,27 +784,39 @@ TEST_P(Test_Caffe_layers, ChannelNorm)
  
--#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
  TEST_P(Test_Caffe_layers, DataAugmentation)
--#else
--TEST_P(Test_Caffe_layers, DISABLED_DataAugmentation)  // requires patched protobuf (available in OpenCV source tree only)
--#endif
  {
 +#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
 +    throw SkipTestException("Requires patched protobuf");
@@ -352,11 +152,7 @@ index a07d442d76..5c6fc541d7 100644
 +#endif
  }
  
--#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
  TEST_P(Test_Caffe_layers, Resample)
--#else
--TEST_P(Test_Caffe_layers, DISABLED_Resample)  // requires patched protobuf (available in OpenCV source tree only)
--#endif
  {
 +#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
 +    throw SkipTestException("Requires patched protobuf");
@@ -368,11 +164,7 @@ index a07d442d76..5c6fc541d7 100644
 +#endif
  }
  
--#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
  TEST_P(Test_Caffe_layers, Correlation)
--#else
--TEST_P(Test_Caffe_layers, DISABLED_Correlation)  // requires patched protobuf (available in OpenCV source tree only)
--#endif
  {
 +#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
 +    throw SkipTestException("Requires patched protobuf");
@@ -381,12 +173,11 @@ index a07d442d76..5c6fc541d7 100644
          applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_NGRAPH, CV_TEST_TAG_DNN_SKIP_IE_NN_BUILDER,
                       CV_TEST_TAG_DNN_SKIP_OPENCL, CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
      testLayerUsingCaffeModels("correlation", false, false, 0.0, 0.0, 2);
- }
 +#endif
+ }
  
  TEST_P(Test_Caffe_layers, Convolution2Inputs)
- {
-@@ -1657,12 +1657,11 @@ private:
+@@ -1641,12 +1657,11 @@ private:
      int outWidth, outHeight, zoomFactor;
  };
  
@@ -402,7 +193,7 @@ index a07d442d76..5c6fc541d7 100644
  #if defined(INF_ENGINE_RELEASE) && INF_ENGINE_VER_MAJOR_EQ(2021030000)
      if (backend == DNN_BACKEND_INFERENCE_ENGINE_NGRAPH && target == DNN_TARGET_MYRIAD)
          applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_MYRIAD, CV_TEST_TAG_DNN_SKIP_IE_NGRAPH);  // exception
-@@ -1686,6 +1685,7 @@ TEST_P(Test_Caffe_layers, DISABLED_Interp)  // requires patched protobuf (availa
+@@ -1670,6 +1685,7 @@ TEST_P(Test_Caffe_layers, DISABLED_Interp)  // requires patched protobuf (availa
  
      // Test an implemented layer.
      testLayerUsingCaffeModels("layer_interp", false, false);
-- 
2.42.0


