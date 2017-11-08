Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 92F817843E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 12:10:32 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id a16so2880469lfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Nov 2017 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7VhoZHOoaBQ90i3pg1Z9mfVIKC/eChh4lS1b3fgH5I8=;
	b=nJ5Erc4xDwIWoiFrq5cSeR4pU8nBynazjeYLc9S4WLlvxX6nmTz19EjdX9rji93vUh
	zEsVtwxoxgvJ5PqxPISh8Ous4H/AXf6Pykqd4MuVnPbrxpQ7ycb77YZYcCm1A6DlOmuE
	gKAlN7lAl10ldUVe4U5duvEUGEiqJS3jK4g+7gRdSdsDDJhylCp40iYVkXDg4wv4RltL
	wRKmKtLkyLGb4cNwnpI9+Y8bZFTLTW6+dOiPv7pwNZiedG3Fd1YMGYLdhWVJUAOPwCDK
	AueBrO8PG6rKhrh4BNVsdKTc4+8lF6E7mRkFuPHV2JEMuzc/HhMt1hBbdMnG2ZrVf+qH
	kBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7VhoZHOoaBQ90i3pg1Z9mfVIKC/eChh4lS1b3fgH5I8=;
	b=tfXZptDs0rQ1QMdeTh8w4D/eWgUp7pBfAj6vKe9IK/TvxACPlJVBrXEHnFyFNf+cKm
	dzvNDXpjJ3M6eGYfdDEKwvOJo1scwsgqw3Bllk+b+rClQ6EK1oVeYj926v7uFVwW8PB1
	Vjq81Ac0GdilGQHNX3DCboQ59BkkGNfhfXNXHwxvFZDsm9c/ZYcK2LCk4/45ini57mPc
	/yPHnBlRaa6jpPmSIrQbe7C+S6E7ZU0YXTZcSPgTLYYMW4Q8je7kofqo0BxJVn6+Qbi6
	UVYhONyUXfVModKItQF3iH1OexbRFwKpnk73qOY6AEexqCRJF9PIMz0Bx/kvdCoSX/ze
	Owgg==
X-Gm-Message-State: AJaThX4Ym5ZcmYHVKfz1KI1Ccuz0PscotWHqozs0xfcH1nknWePAnILr
	9xAZkOTuBXuuA32ha+b0db42lmpO
X-Google-Smtp-Source: AGs4zMZcz7GtQ7ulkzBXCwD1HzmP0+XDsfV4cx0yQNjyX7DuOt9Kq0h7BW+pK40w4DovZpW9EIv9mA==
X-Received: by 10.25.20.228 with SMTP id 97mr92443lfu.211.1510143032948;
	Wed, 08 Nov 2017 04:10:32 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x18sm744216lja.55.2017.11.08.04.10.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 04:10:31 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Nov 2017 13:10:25 +0100
Message-Id: <20171108121027.27572-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171108121027.27572-1-ricardo.ribalda@gmail.com>
References: <20171108121027.27572-1-ricardo.ribalda@gmail.com>
Subject: [PATCH 2/4] opencv: Use OE built Protobuf
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
X-List-Received-Date: Wed, 08 Nov 2017 12:10:33 -0000

When dnn is enabled via PACKAGECONFIG it requires protobuf and
protobuf-native.

This patch modifies cmake files to detect properly protobuf.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../recipes-support/opencv/opencv/protobuf.patch   | 57 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.3.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/protobuf.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/protobuf.patch b/meta-oe/recipes-support/opencv/opencv/protobuf.patch
new file mode 100644
index 000000000000..c63dc142ea3d
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/protobuf.patch
@@ -0,0 +1,57 @@
+Upstream-status: Inappropriate [OE specific]
+
+Signed-off-by: Ricardo Ribalda <ricardo.ribalda@gmail.com>
+diff --git a/cmake/OpenCVFindLibProtobuf.cmake b/cmake/OpenCVFindLibProtobuf.cmake
+index b6ce1e7fd56b..e916ec0df2a6 100644
+--- a/cmake/OpenCVFindLibProtobuf.cmake
++++ b/cmake/OpenCVFindLibProtobuf.cmake
+@@ -7,21 +7,21 @@ OCV_OPTION(BUILD_PROTOBUF "Force to build libprotobuf from sources" ON)
+ OCV_OPTION(PROTOBUF_UPDATE_FILES "Force to rebuild .proto files" OFF)
+ 
+ if(PROTOBUF_UPDATE_FILES)
+-  if(NOT DEFINED Protobuf_PROTOC_EXECUTABLE)
++  if(NOT DEFINED PROTOBUF_PROTOC_EXECUTABLE)
+     find_package(Protobuf QUIET)
+   endif()
+-  if(DEFINED Protobuf_PROTOC_EXECUTABLE AND EXISTS ${Protobuf_PROTOC_EXECUTABLE})
+-    message(STATUS "The protocol buffer compiler is found (${Protobuf_PROTOC_EXECUTABLE})")
++  if(DEFINED PROTOBUF_PROTOC_EXECUTABLE AND EXISTS ${PROTOBUF_PROTOC_EXECUTABLE})
++    message(STATUS "The protocol buffer compiler is found (${PROTOBUF_PROTOC_EXECUTABLE})")
+   else()
+-    message(FATAL_ERROR "The protocol buffer compiler is not found (Protobuf_PROTOC_EXECUTABLE='${Protobuf_PROTOC_EXECUTABLE}')")
++    message(FATAL_ERROR "The protocol buffer compiler is not found (PROTOBUF_PROTOC_EXECUTABLE='${PROTOBUF_PROTOC_EXECUTABLE}')")
+   endif()
+ endif()
+ 
+-if(NOT BUILD_PROTOBUF AND NOT (DEFINED Protobuf_INCLUDE_DIRS AND DEFINED Protobuf_LIBRARIES))
++if(NOT BUILD_PROTOBUF AND NOT (DEFINED PROTOBUF_INCLUDE_DIR AND DEFINED PROTOBUF_LIBRARIES))
+   find_package(Protobuf QUIET)
+ endif()
+ 
+-if(Protobuf_FOUND)
++if(PROTOBUF_FOUND OR (DEFINED PROTOBUF_INCLUDE_DIR AND DEFINED PROTOBUF_LIBRARIES))
+   # nothing
+ else()
+   set(Protobuf_LIBRARIES libprotobuf)
+diff --git a/modules/dnn/CMakeLists.txt b/modules/dnn/CMakeLists.txt
+index 2a71568d1a44..c6329a742263 100644
+--- a/modules/dnn/CMakeLists.txt
++++ b/modules/dnn/CMakeLists.txt
+@@ -7,7 +7,7 @@ if(DEFINED BUILD_opencv_dnn AND NOT BUILD_opencv_dnn)
+ endif()
+ 
+ include(${OpenCV_SOURCE_DIR}/cmake/OpenCVFindLibProtobuf.cmake)
+-if(NOT Protobuf_FOUND)
++if(NOT PROTOBUF_FOUND)
+   ocv_module_disable(opencv_dnn)
+ endif()
+ 
+@@ -72,7 +72,7 @@ ocv_source_group("Src\\protobuf" FILES ${Protobuf_SRCS} ${Protobuf_HDRS})
+ ocv_module_include_directories(include ${Protobuf_INCLUDE_DIRS})
+ 
+ ocv_glob_module_sources(${Protobuf_SRCS} ${Protobuf_HDRS} ${CBLAS_H_PROXY_PATH})
+-ocv_create_module(${Protobuf_LIBRARIES} ${LAPACK_LIBRARIES})
++ocv_create_module(${PROTOBUF_LIBRARIES} ${LAPACK_LIBRARIES})
+ ocv_add_samples()
+ ocv_add_accuracy_tests()
+ ocv_add_perf_tests()
diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index bcb17d34f8fb..1c398aacc110 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -53,6 +53,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://0001-carotene-don-t-use-__asm__-with-aarch64.patch \
     file://0002-Do-not-enable-asm-with-clang.patch \
     file://CVE-2017-14136.patch \
+    file://protobuf.patch \
 "
 PV = "3.3+git${SRCPV}"
 
-- 
2.14.2


