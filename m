Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web09.272.1617899829409160144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XTmmWT/U;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso2903208otq.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cbhG84+FoWST9JWjMycCgb5RRvnir0UhSQiJRq4GA9Q=;
        b=XTmmWT/UXioW7jBPTkx0k6HBk8eHw0Slnc+4FX8l/H8FDBGE2tcldW4M+xu11TcKWS
         x3IvNmQIRUOv9FhddkGruf8VsG/+ajRNkHZJgZCDcs0IJMlMmY8K9bLVcBV0cdfBEorp
         rlaymgyvrKQv4Z4iV6hRLuuDG2RRU5+vLys8wjVuTHoYJTbEQ1BsvkIJTKmOKBIMziPw
         n6JdpuIuYt2mB9ijHicXQJvZ7o9xUqTVNakqwhLV0hQR/lQ95tdzQU8BbE377iXiWeO8
         ieK0mUsJ8SRukpw6mE9LghE0t45hafrhlq6NuOO0eqDgJRb7YzSGu5gJ1pEuO8GjWLCg
         0MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cbhG84+FoWST9JWjMycCgb5RRvnir0UhSQiJRq4GA9Q=;
        b=c/c5+E3iW9J+Dks7zPzoKAwJtGXMFYA0bbBCoGcPySl6Kc9Tc51l2TrBgGMJl6TfHR
         tg22GSjntiFxgfW+yUO4F7eXqkZU2NbrV2uoXMPd1lFnsl6BYcR75E6frIDX8SS99TVs
         IY9IIe/7BnP7wS0dkObeYdjcwXMEhoamrpgr/ri2j4yvF+rmPsE27o2oEt6pALO1qQCL
         M3gV5ZPopOVuPoMhpIdxhkfwlku7Ag4rTHt5GqSKVcnGyBD1IpVO2XGM8OjZ4T1+lSmb
         RwOSyEAnr96GrcFrCz/wkd1214oR2XJUctFsu5ifUHz1cs7aw04oeJfgod5VlzudSiE/
         cMbQ==
X-Gm-Message-State: AOAM532V5NC+9AnzeeedC3kAtU2hoiqy809kbJHBAMMs7rvuLNTW9JG3
	7/C1F7OmOKYRh4UPdhHZX0TuREphwfY=
X-Google-Smtp-Source: ABdhPJzrBreGp463Cm6+AdtMU2vVIfsQMe7Q5VqcHruhPyEOug7+jr/UmDr076voCXC9LvwC1BsiZA==
X-Received: by 2002:a9d:7699:: with SMTP id j25mr8442818otl.177.1617899828595;
        Thu, 08 Apr 2021 09:37:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:08 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 59/64] librdkafka: Add initial recipe v1.6.1
Date: Thu,  8 Apr 2021 09:36:06 -0700
Message-Id: <6bd6a76b087d780f203f52bebdbf92f0b5cfc224.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: "hasan.men" <hasan.men@bosphorusiss.com>

* A patch is added to fix absolute path usage in cmake.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3e5209b691c9f4c720335d4f00dc143264c2df96)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001_fix_absolute_path_usage.patch        | 83 +++++++++++++++++++
 .../librdkafka/librdkafka_1.6.1.bb            | 23 +++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
 create mode 100644 meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch b/meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
new file mode 100644
index 00000000000..d60978661d3
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
index 00000000000..5314f4a48a0
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
2.17.1

