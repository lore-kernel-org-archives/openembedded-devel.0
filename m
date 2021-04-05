Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.484.1617594800071690083
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Apr 2021 20:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rE0qzBQG;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d8so5046635plh.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Apr 2021 20:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ecd49xRjI/gjNfdxtLk1zZR+t7LRo2v0sJ79GaiGydM=;
        b=rE0qzBQGLqOAeOtOdlIMoRcd40ddvro+S1Ja+74aQJKzH7pz4jgAHfZfYz3ah7AgV8
         exLF4wJOr8QnTUoG8g+lzFKlTgs9gmIKs6N1VDazRsacbHnfFMVc6QK7Hah/EWo9qtJU
         J4LQrPfrkQEjV1TbmG6j9YQ5kEXZ2z6w/ENIazlALv4w8NobBbqoqqavdT3OYsn0762c
         LrHuRoZiBRBeaCsQKyN+WQ1v87k5GQx5ClWNbX0Ey2Sa3E9yV9AxmM5H29nkheS495I6
         ufk7TRtN46CekDcGnK1Yp0aBdFUwlnYO+HmHCuSMg4heQE8/0t4AWh8qrl42bBtCqDe9
         at0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ecd49xRjI/gjNfdxtLk1zZR+t7LRo2v0sJ79GaiGydM=;
        b=hv+3u0WrUUrGVCcNgw8Ya75Tk2scTrFa7v7D6aBnIcW+0YGxYlX7/aW5qZknTSwuwF
         YJt6XEeQ693UnaYgNtrngz2OxcAdjddbK16WW950eiIZ4tgcXc6xli877FCp7PhbxNdK
         Yb7U6aBoY5V4ShPuqMxX29HRleXcym7CXF6oN8JpEK/7/JCDgKLfjIi/P9oEhkmVjRg7
         YNDS27Qs/caQLJxIoTyQqoUS3lq2dj/+wZVjLw44dJAjAyiCOBcb6ika/sOSx+WFpF0t
         IRhlZLKJtRq2t5KRX/prvw1tsA7DI3NHIkkHdHqE9YRCSjJyzot6nsTvMHbk9sMJwe1y
         OUyA==
X-Gm-Message-State: AOAM533u2HP8ru6FcMUBX++slB2TkBd50oIYW2YmiB9z9QvlWQo/8XB1
	ZmKpU0Jkp8SKsQSdEDcE+gw/za4nPlt7Eg==
X-Google-Smtp-Source: ABdhPJzNIk/BRU/+SymUcJX9H7hsnX2ptVOFKD5U2Bj0qPbr8YSM/XL9Jq2CwdjPrM8ocB1O2jdM4g==
X-Received: by 2002:a17:90a:d350:: with SMTP id i16mr9900323pjx.226.1617594799436;
        Sun, 04 Apr 2021 20:53:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id s7sm13770265pjr.18.2021.04.04.20.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 20:53:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "hasan.men" <hasan.men@bosphorusiss.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] librdkafka: Add initial recipe v1.6.1
Date: Sun,  4 Apr 2021 20:53:16 -0700
Message-Id: <20210405035317.196532-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "hasan.men" <hasan.men@bosphorusiss.com>

* A patch is added to fix absolute path usage in cmake.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001_fix_absolute_path_usage.patch        | 83 +++++++++++++++++++
 .../librdkafka/librdkafka_1.6.1.bb            | 23 +++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
 create mode 100644 meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch b/meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
new file mode 100644
index 0000000000..d60978661d
--- /dev/null
+++ b/meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
@@ -0,0 +1,83 @@
+From dd06894a786edf4bea11dace50d7380b89dfaba5 Mon Sep 17 00:00:00 2001
+From: hasan.men <hasan.men@bosphorusiss.com>
+Date: Sun, 4 Apr 2021 17:20:32 +0200
+Subject: [PATCH] fix absolute path problem
+
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index c6c05e06..e6c47374 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -176,7 +176,7 @@ if(MINGW)
+ endif(MINGW)
+ 
+ # Support '#include <rdkafka.h>'
+-target_include_directories(rdkafka PUBLIC "$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>")
++target_include_directories(rdkafka PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}> $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
+ target_compile_definitions(rdkafka PUBLIC ${rdkafka_compile_definitions})
+ if(RDKAFKA_BUILD_STATIC)
+   target_compile_definitions(rdkafka PUBLIC LIBRDKAFKA_STATICLIB)
+@@ -188,7 +188,7 @@ if(MINGW)
+   target_link_libraries(rdkafka PUBLIC crypt32 ws2_32 secur32)
+ endif(MINGW)
+ 
+-if(WIN32)  
++if(WIN32)
+   if(RDKAFKA_BUILD_STATIC)
+     target_link_libraries(rdkafka PUBLIC crypt32)
+   else()
+@@ -207,13 +207,13 @@ endif()
+ 
+ if(WITH_ZLIB)
+   find_package(ZLIB REQUIRED)
+-  target_include_directories(rdkafka PUBLIC ${ZLIB_INCLUDE_DIRS})
++  target_include_directories(rdkafka PRIVATE ${ZLIB_INCLUDE_DIRS})
+   target_link_libraries(rdkafka PUBLIC ZLIB::ZLIB)
+ endif()
+ 
+ if(WITH_ZSTD)
+-  target_link_libraries(rdkafka PUBLIC ${ZSTD_LIBRARY})
+-  target_include_directories(rdkafka PUBLIC ${ZSTD_INCLUDE_DIR})
++  target_link_libraries(rdkafka PRIVATE ${ZSTD_LIBRARY})
++  target_include_directories(rdkafka PRIVATE ${ZSTD_INCLUDE_DIR})
+   message(STATUS "Found ZSTD: ${ZSTD_LIBRARY}")
+ endif()
+ 
+@@ -222,12 +222,12 @@ if(WITH_SSL)
+     if(NOT TARGET bundled-ssl)
+       message(FATAL_ERROR "bundled-ssl target not exist")
+     endif()
+-    target_include_directories(rdkafka BEFORE PUBLIC ${BUNDLED_SSL_INCLUDE_DIR})
++    target_include_directories(rdkafka BEFORE PRIVATE ${BUNDLED_SSL_INCLUDE_DIR})
+     target_link_libraries(rdkafka PUBLIC ${BUNDLED_SSL_LIBRARIES})
+     add_dependencies(rdkafka bundled-ssl)
+   else()
+     find_package(OpenSSL REQUIRED)
+-    target_include_directories(rdkafka PUBLIC ${OPENSSL_INCLUDE_DIR})
++    target_include_directories(rdkafka PRIVATE ${OPENSSL_INCLUDE_DIR})
+     target_link_libraries(rdkafka PUBLIC OpenSSL::SSL OpenSSL::Crypto)
+     get_target_property(OPENSSL_TARGET_TYPE OpenSSL::SSL TYPE)
+     if(OPENSSL_CRYPTO_LIBRARY MATCHES "\\.a$")
+@@ -244,7 +244,7 @@ find_package(Threads REQUIRED)
+ target_link_libraries(rdkafka PUBLIC Threads::Threads)
+ 
+ if(WITH_SASL_CYRUS)
+-  target_include_directories(rdkafka PUBLIC ${SASL_INCLUDE_DIRS})
++  target_include_directories(rdkafka PRIVATE ${SASL_INCLUDE_DIRS})
+   target_link_libraries(rdkafka PUBLIC ${SASL_LIBRARIES})
+ endif()
+ 
+@@ -253,7 +253,7 @@ if(WITH_LIBDL)
+ endif()
+ 
+ if(WITH_LZ4_EXT)
+-  target_include_directories(rdkafka PUBLIC ${LZ4_INCLUDE_DIRS})
++  target_include_directories(rdkafka PRIVATE ${LZ4_INCLUDE_DIRS})
+   target_link_libraries(rdkafka PUBLIC LZ4::LZ4)
+ endif()
+ 
+-- 
+2.17.1
\ No newline at end of file
diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb b/meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb
new file mode 100644
index 0000000000..5314f4a48a
--- /dev/null
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "the Apache Kafka C/C++ client library"
+DESCRIPTION = "librdkafka is a C library implementation of the Apache Kafka protocol, providing Producer, Consumer and Admin clients."
+HOMEPAGE = "https://github.com/edenhill/librdkafka"
+SECTION = "libs"
+LICENSE = "BSD-2-Clause"
+
+LIC_FILES_CHKSUM = " \
+file://LICENSE;md5=2be8675acbfdac48935e73897af5f646 \
+"
+
+SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https \
+            file://0001_fix_absolute_path_usage.patch"
+SRCREV = "1a722553638bba85dbda5050455f7b9a5ef302de"
+
+DEPENDS = "zlib openssl zstd"
+
+inherit cmake
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${datadir}"
+
+EXTRA_OECMAKE += "-DRDKAFKA_BUILD_EXAMPLES=OFF -DRDKAFKA_BUILD_TESTS=OFF"
\ No newline at end of file
-- 
2.31.1

