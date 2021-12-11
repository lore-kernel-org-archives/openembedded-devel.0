Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9549C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 16:53:29 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.23881.1639241608723495168
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 08:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=SslSvi7U;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.177, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f177.google.com with SMTP id 207so17865327ljf.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 08:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emiGQo0nKMxGeZA93tKNcvzL1faKoe/bi/7Mvmr9tEU=;
        b=SslSvi7UEdhSpW1a/JFzlNpv33hYDZkMahe5nylv5K0spacXtryYsYUdeJLASJx4Fa
         476yoD58lMgf5leq8dVXtf7UMNrWAjUVR6AtdnC9k0rRjKoRQnOL35j6GHvoQzlTENKR
         58Tb24VUm03IufcywpdCz2Mr1dyZAROWLsZGi8bV07pZGbSCgQQelGJ4YF7u0UB+S2fJ
         H99Zh5BXKmPeVVgS6Nu3AUaeKYub8BQXPt3ZMe8Xr08DoO/4IPGzp/7kW9MQaCm0Za9e
         kqyGStEZNNBg9sWN/6JS347G5yj9dEoxc1Z0T7dq+N5nGDfx5xLUKDuuv5VQdiQbKu7A
         Zf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emiGQo0nKMxGeZA93tKNcvzL1faKoe/bi/7Mvmr9tEU=;
        b=Gu50P8Tdyxt9DPYylcsu+2KF6T82/g9zC3bSwdz4F83Qm/L0if7e3XZTlALHRwTHuI
         Yg+DgNcfCHEErBHt3KVn6qKQZDt/ot/x+PmKGjYTkdos/7WJ9SJVgSeJKk8KcN0KQQCD
         9ECvpKmExZ4fs1IrWjXiFvrTAO6422YfbTlYaJ+X1/4xeL2Yvl7QPDo6bpX+2bbHxihj
         14Qbtsm/5g69BXfjkyIG4M4XqedgB0fLt9S5DRWWjxU+/9otkJibV6cLWia1qzTUP97f
         meLIYdQCeBZztfmUvthEA2tKW6kUlSNEHgqTr/i3ePPY6IVslE6aY6E7CGPkqzgX9hcu
         foOg==
X-Gm-Message-State: AOAM5302GaGflP+8KbBeG0HxeCVTA10HhmGI4nBV6xGtl7jWNIWgPhzF
	XyBGQFF7OlGciNsVaGnS1LTRxGC9EFe9bdkH
X-Google-Smtp-Source: 
 ABdhPJz6aFqUOQjUx70vkCl4N+Q2lP+RNI7zVoojqpYnSdAGtzl/LpGWzg4lmJrYGLXT+WZ/pvWsSQ==
X-Received: by 2002:a2e:b8d0:: with SMTP id
 s16mr19085535ljp.496.1639241606279;
        Sat, 11 Dec 2021 08:53:26 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 i17sm693880lfu.57.2021.12.11.08.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 08:53:25 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] librdkafka: update to 1.8.2
Date: Sat, 11 Dec 2021 17:53:21 +0100
Message-Id: <20211211165321.3609178-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 16:53:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94287

Dropped upstreamed patch.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001_fix_absolute_path_usage.patch        | 83 -------------------
 ...ibrdkafka_1.6.1.bb => librdkafka_1.8.2.bb} | 14 ++--
 2 files changed, 6 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
 rename meta-oe/recipes-support/librdkafka/{librdkafka_1.6.1.bb => librdkafka_1.8.2.bb} (60%)

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch b/meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
deleted file mode 100644
index d60978661..000000000
--- a/meta-oe/recipes-support/librdkafka/librdkafka/0001_fix_absolute_path_usage.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From dd06894a786edf4bea11dace50d7380b89dfaba5 Mon Sep 17 00:00:00 2001
-From: hasan.men <hasan.men@bosphorusiss.com>
-Date: Sun, 4 Apr 2021 17:20:32 +0200
-Subject: [PATCH] fix absolute path problem
-
----
- src/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index c6c05e06..e6c47374 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -176,7 +176,7 @@ if(MINGW)
- endif(MINGW)
- 
- # Support '#include <rdkafka.h>'
--target_include_directories(rdkafka PUBLIC "$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>")
-+target_include_directories(rdkafka PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}> $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
- target_compile_definitions(rdkafka PUBLIC ${rdkafka_compile_definitions})
- if(RDKAFKA_BUILD_STATIC)
-   target_compile_definitions(rdkafka PUBLIC LIBRDKAFKA_STATICLIB)
-@@ -188,7 +188,7 @@ if(MINGW)
-   target_link_libraries(rdkafka PUBLIC crypt32 ws2_32 secur32)
- endif(MINGW)
- 
--if(WIN32)  
-+if(WIN32)
-   if(RDKAFKA_BUILD_STATIC)
-     target_link_libraries(rdkafka PUBLIC crypt32)
-   else()
-@@ -207,13 +207,13 @@ endif()
- 
- if(WITH_ZLIB)
-   find_package(ZLIB REQUIRED)
--  target_include_directories(rdkafka PUBLIC ${ZLIB_INCLUDE_DIRS})
-+  target_include_directories(rdkafka PRIVATE ${ZLIB_INCLUDE_DIRS})
-   target_link_libraries(rdkafka PUBLIC ZLIB::ZLIB)
- endif()
- 
- if(WITH_ZSTD)
--  target_link_libraries(rdkafka PUBLIC ${ZSTD_LIBRARY})
--  target_include_directories(rdkafka PUBLIC ${ZSTD_INCLUDE_DIR})
-+  target_link_libraries(rdkafka PRIVATE ${ZSTD_LIBRARY})
-+  target_include_directories(rdkafka PRIVATE ${ZSTD_INCLUDE_DIR})
-   message(STATUS "Found ZSTD: ${ZSTD_LIBRARY}")
- endif()
- 
-@@ -222,12 +222,12 @@ if(WITH_SSL)
-     if(NOT TARGET bundled-ssl)
-       message(FATAL_ERROR "bundled-ssl target not exist")
-     endif()
--    target_include_directories(rdkafka BEFORE PUBLIC ${BUNDLED_SSL_INCLUDE_DIR})
-+    target_include_directories(rdkafka BEFORE PRIVATE ${BUNDLED_SSL_INCLUDE_DIR})
-     target_link_libraries(rdkafka PUBLIC ${BUNDLED_SSL_LIBRARIES})
-     add_dependencies(rdkafka bundled-ssl)
-   else()
-     find_package(OpenSSL REQUIRED)
--    target_include_directories(rdkafka PUBLIC ${OPENSSL_INCLUDE_DIR})
-+    target_include_directories(rdkafka PRIVATE ${OPENSSL_INCLUDE_DIR})
-     target_link_libraries(rdkafka PUBLIC OpenSSL::SSL OpenSSL::Crypto)
-     get_target_property(OPENSSL_TARGET_TYPE OpenSSL::SSL TYPE)
-     if(OPENSSL_CRYPTO_LIBRARY MATCHES "\\.a$")
-@@ -244,7 +244,7 @@ find_package(Threads REQUIRED)
- target_link_libraries(rdkafka PUBLIC Threads::Threads)
- 
- if(WITH_SASL_CYRUS)
--  target_include_directories(rdkafka PUBLIC ${SASL_INCLUDE_DIRS})
-+  target_include_directories(rdkafka PRIVATE ${SASL_INCLUDE_DIRS})
-   target_link_libraries(rdkafka PUBLIC ${SASL_LIBRARIES})
- endif()
- 
-@@ -253,7 +253,7 @@ if(WITH_LIBDL)
- endif()
- 
- if(WITH_LZ4_EXT)
--  target_include_directories(rdkafka PUBLIC ${LZ4_INCLUDE_DIRS})
-+  target_include_directories(rdkafka PRIVATE ${LZ4_INCLUDE_DIRS})
-   target_link_libraries(rdkafka PUBLIC LZ4::LZ4)
- endif()
- 
--- 
-2.17.1
\ No newline at end of file
diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
similarity index 60%
rename from meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb
rename to meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
index ba235e9de..f9f3baaf2 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
@@ -1,16 +1,14 @@
 SUMMARY = "the Apache Kafka C/C++ client library"
-DESCRIPTION = "librdkafka is a C library implementation of the Apache Kafka protocol, providing Producer, Consumer and Admin clients."
+DESCRIPTION = "librdkafka is a C library implementation of the Apache Kafka protocol, \
+               providing Producer, Consumer and Admin clients."
 HOMEPAGE = "https://github.com/edenhill/librdkafka"
 SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 
-LIC_FILES_CHKSUM = " \
-file://LICENSE;md5=2be8675acbfdac48935e73897af5f646 \
-"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2be8675acbfdac48935e73897af5f646"
 
-SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master \
-            file://0001_fix_absolute_path_usage.patch"
-SRCREV = "1a722553638bba85dbda5050455f7b9a5ef302de"
+SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master"
+SRCREV = "063a9ae7a65cebdf1cc128da9815c05f91a2a996"
 
 DEPENDS = "zlib openssl zstd"
 
@@ -20,4 +18,4 @@ S = "${WORKDIR}/git"
 
 FILES:${PN} += "${datadir}"
 
-EXTRA_OECMAKE += "-DRDKAFKA_BUILD_EXAMPLES=OFF -DRDKAFKA_BUILD_TESTS=OFF"
\ No newline at end of file
+EXTRA_OECMAKE += "-DRDKAFKA_BUILD_EXAMPLES=OFF -DRDKAFKA_BUILD_TESTS=OFF"
-- 
2.25.1


