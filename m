Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11ABCCD80D2
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 13:28:39 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.91059.1696944515010351593
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 06:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KCQyOxyo;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99357737980so980930766b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696944513; x=1697549313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kK3uHrrwQ/1iZpjSZWRrzxrb5EcC3/TfjGoUk1ooPRU=;
        b=KCQyOxyoFD8PcAa6FEBO9yeHGM1LI3dLvxKeNEqFOGIxFEQ7ZtEXSwdpZWWwJRQtHr
         LXwyWuDVWRiVi6nUiMh5Fy3Y+eKcNHfMMkcpaXSDdxFIh2b1Gmh3tzQ1OMuB0zDeq3Yj
         9+sOEVdKhopc54MgcGdcLOqFrBjpWIWTi7U521QJzA+bcLVsKFxARxcpesqO1/fH9H5S
         OrsKYT42Gj27A0jZvr6h6LDuCyFnMMmSvslpGQarh/wr+DBdLLG0Z+vAtNN3sNOjecd5
         Zac90DXkNkcK+LEUppUraT1eFUTYnCMpGuVFSBLfHk6WLEPs4ge8U4SF8dFRfj8QX+kX
         appA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696944513; x=1697549313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kK3uHrrwQ/1iZpjSZWRrzxrb5EcC3/TfjGoUk1ooPRU=;
        b=KiVxbpQO6GykXWqvXCpwDBiQeI8B8pX4vd681QGl9EoWaY8nr34nXo8ZFQF6yQIgpl
         BW4g6MWCpOIREkSAJKxn3izHsm5t46c1yd34oJJs3sGwznba5axGj+lc6vSdlob8mE9n
         mR6CLSN9SDgGyPI2FAXUd7LTsoGvome1nzHhJA1JjdRv125WlWphnBdoY5/nr9CclkSK
         OgH1AS70V4uyUEJREjPsFREro6CwGQgdPZGkcaYPZPfWcdV7lUDNskmMz27XEFcW1LMr
         6xD2nJcZbCjx+MeBhwmp9DLcg4/5hzMBxKXl7/g6/1UdF97YMXUDvU0J3sgXSs2Eum7S
         pccw==
X-Gm-Message-State: AOJu0YwvFkwKHNH1i2AOQ6Sz9SDftjuDHSXX78SuFEbFv+e+/wNGUjFz
	xn4DKf7V5qtfDkQCwCUpXCwTQRNIxpI=
X-Google-Smtp-Source: AGHT+IHhJFRDNBYWlwQWfIf66g1+bXqOJX2fbAeGbFOiaQ3ed0le0nJTKZrI6Bn5O+BvQ5auDXrEmw==
X-Received: by 2002:a17:906:257:b0:9b8:8bcf:8739 with SMTP id 23-20020a170906025700b009b88bcf8739mr15308665ejl.75.1696944513059;
        Tue, 10 Oct 2023 06:28:33 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x26-20020a170906711a00b0099329b3ab67sm8460528ejj.71.2023.10.10.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:28:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] opencv: Fix build with protobuf v22 and dnn enabled
Date: Tue, 10 Oct 2023 15:28:29 +0200
Message-ID: <20231010132829.2074006-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 13:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105406

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../opencv/fix-build-with-protobuf-v22.patch  | 412 ++++++++++++++++++
 .../recipes-support/opencv/opencv_4.8.0.bb    |   3 +-
 2 files changed, 414 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch b/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch
new file mode 100644
index 0000000000..536060cfd9
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/fix-build-with-protobuf-v22.patch
@@ -0,0 +1,412 @@
+From 5e4150826fea6f37276f348c65d94ce4847d1211 Mon Sep 17 00:00:00 2001
+From: Kumataro <Kumataro@users.noreply.github.com>
+Date: Sat, 7 Oct 2023 10:11:25 +0900
+Subject: [PATCH] 3rdparty: supporting protobuf v22 and later
+
+Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/24372]
+---
+ cmake/OpenCVFindProtobuf.cmake | 37 ++++++++++++++++++++++++++++++++++
+ modules/dnn/CMakeLists.txt     |  9 +++++++++
+ 2 files changed, 46 insertions(+)
+
+diff --git a/cmake/OpenCVFindProtobuf.cmake b/cmake/OpenCVFindProtobuf.cmake
+index 8835347d1d..9bd5c28db8 100644
+--- a/cmake/OpenCVFindProtobuf.cmake
++++ b/cmake/OpenCVFindProtobuf.cmake
+@@ -67,6 +67,38 @@ else()
+   endif()
+ endif()
+ 
++# See https://github.com/opencv/opencv/issues/24369
++# In Protocol Buffers v22.0 and later drops C++11 support and depends abseil-cpp.
++#   Details: https://protobuf.dev/news/2022-08-03/
++# And if std::text_view is in abseil-cpp requests C++17 and later.
++if(HAVE_PROTOBUF)
++    if("${Protobuf_VERSION}" MATCHES [[[0-9]+.([0-9]+).[0-9]+]])
++        string(COMPARE GREATER_EQUAL "${CMAKE_MATCH_1}" "22" REQUEST_ABSL)
++
++        if(REQUEST_ABSL)
++            string(COMPARE GREATER_EQUAL "${CMAKE_CXX_STANDARD}" "17" USED_AFTER_CXX17)
++            if(NOT USED_AFTER_CXX17)
++                message("CMAKE_CXX_STANDARD : ${CMAKE_CXX_STANDARD}")
++                message("protobuf           : ${Protobuf_VERSION}")
++                message(FATAL_ERROR "protobuf(v22 and later) and abseil-cpp request CMAKE_CXX_STANDARD=17 and later.")
++            endif()
++
++            ocv_check_modules(ABSL_STRINGS absl_strings)
++            if(NOT ABSL_STRINGS_FOUND)
++                message(FATAL_ERROR "protobuf(v22 and later) requests abseil-cpp(strings), but missing.")
++            endif()
++
++            ocv_check_modules(ABSL_LOG absl_log)
++            if(NOT ABSL_LOG_FOUND)
++                message(FATAL_ERROR "protobuf(v22 and later) requests abseil-cpp(log), but missing.")
++            endif()
++
++        endif()
++    else()
++        message(FATAL_ERROR "Protobuf version(${Protobuf_VERSION}) is unexpected to split.")
++    endif()
++endif()
++
+ if(HAVE_PROTOBUF AND PROTOBUF_UPDATE_FILES AND NOT COMMAND PROTOBUF_GENERATE_CPP)
+   message(FATAL_ERROR "Can't configure protobuf dependency (BUILD_PROTOBUF=${BUILD_PROTOBUF} PROTOBUF_UPDATE_FILES=${PROTOBUF_UPDATE_FILES})")
+ endif()
+@@ -89,3 +121,8 @@ if(HAVE_PROTOBUF)
+     BUILD_PROTOBUF THEN "build (${Protobuf_VERSION})"
+     ELSE "${__location} (${Protobuf_VERSION})")
+ endif()
++
++if(HAVE_ABSL_STRINGS AND HAVE_ABSL_LOG)
++  list(APPEND CUSTOM_STATUS absl)
++  list(APPEND CUSTOM_STATUS_absl "      abseil-cpp:" "YES (${ABSL_STRINGS_VERSION})" )
++endif()
+diff --git a/modules/dnn/CMakeLists.txt b/modules/dnn/CMakeLists.txt
+index 804b78ead2..d32007b37e 100644
+--- a/modules/dnn/CMakeLists.txt
++++ b/modules/dnn/CMakeLists.txt
+@@ -149,6 +149,15 @@ if(NOT BUILD_PROTOBUF)
+   list(APPEND include_dirs ${Protobuf_INCLUDE_DIRS})
+ endif()
+ 
++if(HAVE_ABSL_STRINGS)
++  list(APPEND libs ${ABSL_STRINGS_LIBRARIES})
++  list(APPEND include_dirs ${ABSL_STRTRINGS_INCLUDE_DIRS})
++endif()
++if(HAVE_ABSL_LOG)
++  list(APPEND libs ${ABSL_LOG_LIBRARIES})
++  list(APPEND include_dirs ${ABSL_LOG_INCLUDE_DIRS})
++endif()
++
+ set(sources_options "")
+ 
+ list(APPEND libs ${LAPACK_LIBRARIES})
+From 06a7669521d205f647d3e718322ccd153cdbbb77 Mon Sep 17 00:00:00 2001
+From: Kumataro <Kumataro@users.noreply.github.com>
+Date: Sun, 8 Oct 2023 09:39:35 +0900
+Subject: [PATCH] dnn: disable some tests for external protobuf
+
+---
+ modules/dnn/CMakeLists.txt         |  5 +++++
+ modules/dnn/src/caffe/caffe_io.cpp | 24 ++++++++++++++++++++++--
+ modules/dnn/test/test_layers.cpp   | 16 ++++++++++++++++
+ 3 files changed, 43 insertions(+), 2 deletions(-)
+
+diff --git a/modules/dnn/CMakeLists.txt b/modules/dnn/CMakeLists.txt
+index d32007b37e..face38465f 100644
+--- a/modules/dnn/CMakeLists.txt
++++ b/modules/dnn/CMakeLists.txt
+@@ -254,6 +254,12 @@ ocv_create_module(${libs} ${dnn_runtime_libs})
+ ocv_add_samples()
+ ocv_add_accuracy_tests(${dnn_runtime_libs})
+ 
++if(NOT BUILD_PROTOBUF)
++  if(TARGET opencv_test_dnn)
++    ocv_target_compile_definitions(opencv_test_dnn PRIVATE "OPENCV_DNN_EXTERNAL_PROTOBUF=1")
++  endif()
++endif()
++
+ set(perf_path "${CMAKE_CURRENT_LIST_DIR}/perf")
+ file(GLOB_RECURSE perf_srcs "${perf_path}/*.cpp")
+ file(GLOB_RECURSE perf_hdrs "${perf_path}/*.hpp" "${perf_path}/*.h")
+@@ -318,3 +322,4 @@ if(OPENCV_TEST_DNN_TFLITE)
+     ocv_target_compile_definitions(opencv_perf_dnn PRIVATE "OPENCV_TEST_DNN_TFLITE=1")
+   endif()
+ endif()
++
+diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
+index ebecf95eea..ebceca84cf 100644
+--- a/modules/dnn/src/caffe/caffe_io.cpp
++++ b/modules/dnn/src/caffe/caffe_io.cpp
+@@ -1130,7 +1130,17 @@ bool ReadProtoFromTextFile(const char* filename, Message* proto) {
+     parser.AllowUnknownField(true);
+     parser.SetRecursionLimit(1000);
+ #endif
+-    return parser.Parse(&input, proto);
++    const bool ret = parser.Parse(&input, proto);
++
++#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
++    if(!ret)
++    {
++        LOG(ERROR) << "Some data requires patched protobuf (available in OpenCV source tree only).";
++        CV_Error_(Error::StsError,("Some data requires patched protobuf (available in OpenCV source tree only)."));
++    }
++#endif
++
++    return ret;
+ }
+ 
+ bool ReadProtoFromBinaryFile(const char* filename, Message* proto) {
+@@ -1148,7 +1158,17 @@ bool ReadProtoFromTextBuffer(const char* data, size_t len, Message* proto) {
+     parser.AllowUnknownField(true);
+     parser.SetRecursionLimit(1000);
+ #endif
+-    return parser.Parse(&input, proto);
++    const bool ret = parser.Parse(&input, proto);
++
++#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
++    if(!ret)
++    {
++        LOG(ERROR) << "Some data requires patched protobuf (available in OpenCV source tree only).";
++        CV_Error_(Error::StsError,("Some data requires patched protobuf (available in OpenCV source tree only)."));
++    }
++#endif
++
++    return ret;
+ }
+ 
+ 
+diff --git a/modules/dnn/test/test_layers.cpp b/modules/dnn/test/test_layers.cpp
+index 763d94b99c..a07d442d76 100644
+--- a/modules/dnn/test/test_layers.cpp
++++ b/modules/dnn/test/test_layers.cpp
+@@ -754,7 +754,11 @@ TEST_F(Layer_RNN_Test, get_set_test)
+     EXPECT_EQ(shape(outputs[1]), shape(nT, nS, nH));
+ }
+ 
++#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
+ TEST_P(Test_Caffe_layers, Accum)
++#else
++TEST_P(Test_Caffe_layers, DISABLED_Accum)  // requires patched protobuf (available in OpenCV source tree only)
++#endif
+ {
+     if (backend == DNN_BACKEND_OPENCV && target != DNN_TARGET_CPU)
+         applyTestTag(CV_TEST_TAG_DNN_SKIP_OPENCL, CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
+@@ -778,7 +782,11 @@ TEST_P(Test_Caffe_layers, ChannelNorm)
+     testLayerUsingCaffeModels("channel_norm", false, false);
+ }
+ 
++#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
+ TEST_P(Test_Caffe_layers, DataAugmentation)
++#else
++TEST_P(Test_Caffe_layers, DISABLED_DataAugmentation)  // requires patched protobuf (available in OpenCV source tree only)
++#endif
+ {
+     if (backend == DNN_BACKEND_OPENCV && target == DNN_TARGET_OPENCL_FP16)
+         applyTestTag(CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
+@@ -787,7 +795,11 @@ TEST_P(Test_Caffe_layers, DataAugmentation)
+     testLayerUsingCaffeModels("data_augmentation_8x6", true, false);
+ }
+ 
++#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
+ TEST_P(Test_Caffe_layers, Resample)
++#else
++TEST_P(Test_Caffe_layers, DISABLED_Resample)  // requires patched protobuf (available in OpenCV source tree only)
++#endif
+ {
+     if (backend != DNN_BACKEND_OPENCV)
+         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_NN_BUILDER, CV_TEST_TAG_DNN_SKIP_IE_NGRAPH);
+@@ -795,7 +807,11 @@ TEST_P(Test_Caffe_layers, Resample)
+     testLayerUsingCaffeModels("nearest", false, false);
+ }
+ 
++#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
+ TEST_P(Test_Caffe_layers, Correlation)
++#else
++TEST_P(Test_Caffe_layers, DISABLED_Correlation)  // requires patched protobuf (available in OpenCV source tree only)
++#endif
+ {
+     if (backend == DNN_BACKEND_OPENCV && target == DNN_TARGET_OPENCL_FP16)
+         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_NGRAPH, CV_TEST_TAG_DNN_SKIP_IE_NN_BUILDER,
+From 2c33798f41942aefc203183d673ce4846f32dba4 Mon Sep 17 00:00:00 2001
+From: Kumataro <Kumataro@users.noreply.github.com>
+Date: Sun, 8 Oct 2023 13:28:40 +0900
+Subject: [PATCH] use GREATER instead of GREATER_EQUAL and remove new blank
+ line at EOF
+
+---
+ cmake/OpenCVFindProtobuf.cmake | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/OpenCVFindProtobuf.cmake b/cmake/OpenCVFindProtobuf.cmake
+index 9bd5c28db8..ba147526d6 100644
+--- a/cmake/OpenCVFindProtobuf.cmake
++++ b/cmake/OpenCVFindProtobuf.cmake
+@@ -71,12 +71,14 @@ endif()
+ # In Protocol Buffers v22.0 and later drops C++11 support and depends abseil-cpp.
+ #   Details: https://protobuf.dev/news/2022-08-03/
+ # And if std::text_view is in abseil-cpp requests C++17 and later.
++
+ if(HAVE_PROTOBUF)
+     if("${Protobuf_VERSION}" MATCHES [[[0-9]+.([0-9]+).[0-9]+]])
+-        string(COMPARE GREATER_EQUAL "${CMAKE_MATCH_1}" "22" REQUEST_ABSL)
++        string(COMPARE GREATER "${CMAKE_MATCH_1}" "21" REQUEST_ABSL)  # >=22
+ 
+         if(REQUEST_ABSL)
+-            string(COMPARE GREATER_EQUAL "${CMAKE_CXX_STANDARD}" "17" USED_AFTER_CXX17)
++            string(COMPARE GREATER "${CMAKE_CXX_STANDARD}" "16" USED_AFTER_CXX17)  # >=17
++
+             if(NOT USED_AFTER_CXX17)
+                 message("CMAKE_CXX_STANDARD : ${CMAKE_CXX_STANDARD}")
+                 message("protobuf           : ${Protobuf_VERSION}")
+From cd709eefbeedd116bf3495b42280323b932791ff Mon Sep 17 00:00:00 2001
+From: Kumataro <Kumataro@users.noreply.github.com>
+Date: Mon, 9 Oct 2023 21:51:04 +0900
+Subject: [PATCH] fix for review
+
+---
+ cmake/OpenCVFindProtobuf.cmake     |  5 ----
+ modules/dnn/src/caffe/caffe_io.cpp | 24 ++----------------
+ modules/dnn/test/test_layers.cpp   | 40 +++++++++++++++---------------
+ 3 files changed, 22 insertions(+), 47 deletions(-)
+
+diff --git a/cmake/OpenCVFindProtobuf.cmake b/cmake/OpenCVFindProtobuf.cmake
+index ba147526d6..2faf1010bf 100644
+--- a/cmake/OpenCVFindProtobuf.cmake
++++ b/cmake/OpenCVFindProtobuf.cmake
+@@ -123,8 +123,3 @@ if(HAVE_PROTOBUF)
+     BUILD_PROTOBUF THEN "build (${Protobuf_VERSION})"
+     ELSE "${__location} (${Protobuf_VERSION})")
+ endif()
+-
+-if(HAVE_ABSL_STRINGS AND HAVE_ABSL_LOG)
+-  list(APPEND CUSTOM_STATUS absl)
+-  list(APPEND CUSTOM_STATUS_absl "      abseil-cpp:" "YES (${ABSL_STRINGS_VERSION})" )
+-endif()
+diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
+index ebceca84cf..ebecf95eea 100644
+--- a/modules/dnn/src/caffe/caffe_io.cpp
++++ b/modules/dnn/src/caffe/caffe_io.cpp
+@@ -1130,17 +1130,7 @@ bool ReadProtoFromTextFile(const char* filename, Message* proto) {
+     parser.AllowUnknownField(true);
+     parser.SetRecursionLimit(1000);
+ #endif
+-    const bool ret = parser.Parse(&input, proto);
+-
+-#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
+-    if(!ret)
+-    {
+-        LOG(ERROR) << "Some data requires patched protobuf (available in OpenCV source tree only).";
+-        CV_Error_(Error::StsError,("Some data requires patched protobuf (available in OpenCV source tree only)."));
+-    }
+-#endif
+-
+-    return ret;
++    return parser.Parse(&input, proto);
+ }
+ 
+ bool ReadProtoFromBinaryFile(const char* filename, Message* proto) {
+@@ -1158,17 +1148,7 @@ bool ReadProtoFromTextBuffer(const char* data, size_t len, Message* proto) {
+     parser.AllowUnknownField(true);
+     parser.SetRecursionLimit(1000);
+ #endif
+-    const bool ret = parser.Parse(&input, proto);
+-
+-#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
+-    if(!ret)
+-    {
+-        LOG(ERROR) << "Some data requires patched protobuf (available in OpenCV source tree only).";
+-        CV_Error_(Error::StsError,("Some data requires patched protobuf (available in OpenCV source tree only)."));
+-    }
+-#endif
+-
+-    return ret;
++    return parser.Parse(&input, proto);
+ }
+ 
+ 
+diff --git a/modules/dnn/test/test_layers.cpp b/modules/dnn/test/test_layers.cpp
+index a07d442d76..5c6fc541d7 100644
+--- a/modules/dnn/test/test_layers.cpp
++++ b/modules/dnn/test/test_layers.cpp
+@@ -754,17 +754,17 @@ TEST_F(Layer_RNN_Test, get_set_test)
+     EXPECT_EQ(shape(outputs[1]), shape(nT, nS, nH));
+ }
+ 
+-#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
+ TEST_P(Test_Caffe_layers, Accum)
+-#else
+-TEST_P(Test_Caffe_layers, DISABLED_Accum)  // requires patched protobuf (available in OpenCV source tree only)
+-#endif
+ {
++#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
++    throw SkipTestException("Requires patched protobuf");
++#else
+     if (backend == DNN_BACKEND_OPENCV && target != DNN_TARGET_CPU)
+         applyTestTag(CV_TEST_TAG_DNN_SKIP_OPENCL, CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
+ 
+     testLayerUsingCaffeModels("accum", false, false, 0.0, 0.0, 2);
+     testLayerUsingCaffeModels("accum_ref", false, false, 0.0, 0.0, 2);
++#endif
+ }
+ 
+ TEST_P(Test_Caffe_layers, FlowWarp)
+@@ -782,42 +782,42 @@ TEST_P(Test_Caffe_layers, ChannelNorm)
+     testLayerUsingCaffeModels("channel_norm", false, false);
+ }
+ 
+-#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
+ TEST_P(Test_Caffe_layers, DataAugmentation)
+-#else
+-TEST_P(Test_Caffe_layers, DISABLED_DataAugmentation)  // requires patched protobuf (available in OpenCV source tree only)
+-#endif
+ {
++#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
++    throw SkipTestException("Requires patched protobuf");
++#else
+     if (backend == DNN_BACKEND_OPENCV && target == DNN_TARGET_OPENCL_FP16)
+         applyTestTag(CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
+     testLayerUsingCaffeModels("data_augmentation", true, false);
+     testLayerUsingCaffeModels("data_augmentation_2x1", true, false);
+     testLayerUsingCaffeModels("data_augmentation_8x6", true, false);
++#endif
+ }
+ 
+-#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
+ TEST_P(Test_Caffe_layers, Resample)
+-#else
+-TEST_P(Test_Caffe_layers, DISABLED_Resample)  // requires patched protobuf (available in OpenCV source tree only)
+-#endif
+ {
++#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
++    throw SkipTestException("Requires patched protobuf");
++#else
+     if (backend != DNN_BACKEND_OPENCV)
+         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_NN_BUILDER, CV_TEST_TAG_DNN_SKIP_IE_NGRAPH);
+     testLayerUsingCaffeModels("nearest_2inps", false, false, 0.0, 0.0, 2);
+     testLayerUsingCaffeModels("nearest", false, false);
++#endif
+ }
+ 
+-#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
+ TEST_P(Test_Caffe_layers, Correlation)
+-#else
+-TEST_P(Test_Caffe_layers, DISABLED_Correlation)  // requires patched protobuf (available in OpenCV source tree only)
+-#endif
+ {
++#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
++    throw SkipTestException("Requires patched protobuf");
++#else
+     if (backend == DNN_BACKEND_OPENCV && target == DNN_TARGET_OPENCL_FP16)
+         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_NGRAPH, CV_TEST_TAG_DNN_SKIP_IE_NN_BUILDER,
+                      CV_TEST_TAG_DNN_SKIP_OPENCL, CV_TEST_TAG_DNN_SKIP_OPENCL_FP16);
+     testLayerUsingCaffeModels("correlation", false, false, 0.0, 0.0, 2);
+ }
++#endif
+ 
+ TEST_P(Test_Caffe_layers, Convolution2Inputs)
+ {
+@@ -1657,12 +1657,11 @@ private:
+     int outWidth, outHeight, zoomFactor;
+ };
+ 
+-#ifndef OPENCV_DNN_EXTERNAL_PROTOBUF
+ TEST_P(Test_Caffe_layers, Interp)
+-#else
+-TEST_P(Test_Caffe_layers, DISABLED_Interp)  // requires patched protobuf (available in OpenCV source tree only)
+-#endif
+ {
++#ifdef OPENCV_DNN_EXTERNAL_PROTOBUF
++    throw SkipTestException("Requires patched protobuf");
++#else
+ #if defined(INF_ENGINE_RELEASE) && INF_ENGINE_VER_MAJOR_EQ(2021030000)
+     if (backend == DNN_BACKEND_INFERENCE_ENGINE_NGRAPH && target == DNN_TARGET_MYRIAD)
+         applyTestTag(CV_TEST_TAG_DNN_SKIP_IE_MYRIAD, CV_TEST_TAG_DNN_SKIP_IE_NGRAPH);  // exception
+@@ -1686,6 +1685,7 @@ TEST_P(Test_Caffe_layers, DISABLED_Interp)  // requires patched protobuf (availa
+ 
+     // Test an implemented layer.
+     testLayerUsingCaffeModels("layer_interp", false, false);
++#endif
+ }
+ 
+ INSTANTIATE_TEST_CASE_P(/*nothing*/, Test_Caffe_layers, dnnBackendsAndTargets());
diff --git a/meta-oe/recipes-support/opencv/opencv_4.8.0.bb b/meta-oe/recipes-support/opencv/opencv_4.8.0.bb
index 9564bbbe9d..85eb230b08 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.8.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.8.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
+           file://fix-build-with-protobuf-v22.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
@@ -98,7 +99,7 @@ PACKAGECONFIG:remove:libc-musl:riscv32 = "tbb"
 PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
+PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF -DCMAKE_CXX_STANDARD=17,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
 PACKAGECONFIG[freetype] = "-DBUILD_opencv_freetype=ON,-DBUILD_opencv_freetype=OFF,freetype,"
 PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
-- 
2.42.0


