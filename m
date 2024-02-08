Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC24BC4829A
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 07:54:44 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.13007.1707378883919351964
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 23:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4htg5mN;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e055baec89so496679b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 23:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707378883; x=1707983683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tx0hWClgfzLY41nkPPZNK7k58rW3WECjQSEdRMQRgyI=;
        b=T4htg5mNtHMEhoineAHTQtYgxXjknGFQZFFaDuDa7k1hoqUJfa+nczGUXPZ7fgvxHp
         xdT1cSRj2FwT2pDuoIaRm/WP6KMalXoxMHZP2ZT1dPUyAycRdRHeQrv422StqSYczkv4
         3N3QX7dBPTE1z1NAaZpkfXC1aiXcTb9tSBGtg2mxTI42mszbRcXpYP94UlUpxJQHbprZ
         X8AKOpLWJJbfol7WVGroPLdu6rly9JjIbH8CoRyXm/06Yl4gfDh5Bp2Glh8qcJp9NmLC
         e8kxE35XXS5+HYcuItML7vg3o8NaI4CZkIpXJTEx8hb+ONC4QvygOe7Zp5IdaR5t09fF
         VHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707378883; x=1707983683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tx0hWClgfzLY41nkPPZNK7k58rW3WECjQSEdRMQRgyI=;
        b=UDucws0Z3NQ/BgMEOBG/YwRc/zHUsjLo2amlpziu56+WkcVHeaWfAnevBM8ZkfPB/D
         7FcBtiW08LKA8yisW+Zv3kIGMOJg1jFbX3WOZkrhVuYEPkaUAow8GAqadbzKo3vZRNex
         1T/HVVswrfE5RPCQJXKzdo0QYto/BdoLSqb7tjCBmRa9s3Ai+mQ85WDMdJTkG6XSt+AN
         KU+udKLnRTxkstV53Unl4HUxpNmUZo0HN9BjmFQx51bio7NY+E7yx48uu3TLMdo1tBHK
         BSWX0qO7EPl+WZwVNA8GMlALZMhuNC2i9GAb0LQ1LkOL6q1fhkBr7ekRUGpixOLJL7xf
         UVaA==
X-Gm-Message-State: AOJu0YxPZLjYSj1j3SvWA/Z+lleKE5W5jGrr9OCTrtDZDWyYhBVCLxPd
	XSb7BPra+4gtKHIYxXgTE8awUJ2crO9y9Ca89u6ZatXSzLzhdQd0fu7Xr76ZbZc=
X-Google-Smtp-Source: AGHT+IHz1nBvt0Q2nJ+f0/Myga7FlHjixaAH+xCoK8ZqKtYCPSkg3wwCbu9D0fcmUNEJjKHkFq7SUw==
X-Received: by 2002:a05:6a00:26db:b0:6db:bd97:3194 with SMTP id p27-20020a056a0026db00b006dbbd973194mr2836033pfw.1.1707378882694;
        Wed, 07 Feb 2024 23:54:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id p17-20020a056a0026d100b006dde1781800sm2390539pfw.94.2024.02.07.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 23:54:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] ot-br-posix: upgrade to latest trunk
Date: Wed,  7 Feb 2024 23:54:37 -0800
Message-ID: <20240208075438.1045660-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208075438.1045660-1-raj.khem@gmail.com>
References: <20240208075438.1045660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 07:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108659

Fix build with clang and drop unneeded patch for unused variable 'i'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-PIC-inline-ASM-compilation-with-GCC.patch | 13 ++++++-
 ...sable-nonnull-compare-warning-on-gcc.patch |  9 ++---
 .../ot-br-posix/default-cxx-std.patch         | 35 +++++++++++++++++++
 .../openthread/ot-br-posix/mbedtls.patch      | 17 ++-------
 .../openthread/ot-br-posix/unused_var.patch   | 12 -------
 .../openthread/ot-br-posix_git.bb             |  8 ++---
 6 files changed, 56 insertions(+), 38 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/default-cxx-std.patch
 delete mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
index 8122e725e7..8b286dfd14 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
@@ -36,7 +36,7 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 
 --- a/third_party/openthread/repo/third_party/mbedtls/repo/include/mbedtls/bn_mul.h
 +++ b/third_party/openthread/repo/third_party/mbedtls/repo/include/mbedtls/bn_mul.h
-@@ -55,12 +55,28 @@
+@@ -95,12 +95,28 @@
      ( !defined(__ARMCC_VERSION) || __ARMCC_VERSION >= 6000000 )
  
  /*
@@ -66,3 +66,14 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  
  #define MULADDC_INIT                        \
      asm(                                    \
+--- a/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
++++ b/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
+@@ -210,7 +210,7 @@ if(CMAKE_COMPILER_IS_GNU)
+ endif(CMAKE_COMPILER_IS_GNU)
+ 
+ if(CMAKE_COMPILER_IS_CLANG)
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=2 -Wno-format-nonliteral")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=2 -Wno-format-nonliteral -Wno-error=documentation")
+     set(CMAKE_C_FLAGS_RELEASE     "-O2")
+     set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
+     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch
index f0bb392a9f..7c32166797 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch
@@ -20,13 +20,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  CMakeLists.txt | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 59a567e729..3134740ff6 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -57,6 +57,10 @@ endif()
- 
+@@ -59,6 +59,10 @@ endif()
  set(CMAKE_CXX_EXTENSIONS OFF)
+ set(CMAKE_EXE_LINKER_FLAGS "-rdynamic ${CMAKE_EXE_LINKER_FLAGS}")
  
 +if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
 +	add_compile_options(-Wno-error=nonnull-compare)
@@ -35,6 +33,3 @@ index 59a567e729..3134740ff6 100644
  if (OTBR_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
      message(STATUS "Coverage: ON")
      target_compile_options(otbr-config INTERFACE -g -O0 --coverage)
--- 
-2.36.0
-
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/default-cxx-std.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/default-cxx-std.patch
new file mode 100644
index 0000000000..d6b3146a9d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/default-cxx-std.patch
@@ -0,0 +1,35 @@
+Do not hardcode C std to C99 or C++ std to C++11 if not set
+OE compilers are using newer than these standards and absl needs C++14 minimum
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -46,16 +46,6 @@ set_property(CACHE OTBR_MDNS PROPERTY ST
+ 
+ include("${PROJECT_SOURCE_DIR}/etc/cmake/options.cmake")
+ 
+-if(NOT CMAKE_C_STANDARD)
+-    set(CMAKE_C_STANDARD 99)
+-    set(CMAKE_C_STANDARD_REQUIRED ON)
+-endif()
+-
+-if(NOT CMAKE_CXX_STANDARD)
+-    set(CMAKE_CXX_STANDARD 11)
+-    set(CMAKE_CXX_STANDARD_REQUIRED ON)
+-endif()
+-
+ set(CMAKE_CXX_EXTENSIONS OFF)
+ set(CMAKE_EXE_LINKER_FLAGS "-rdynamic ${CMAKE_EXE_LINKER_FLAGS}")
+ 
+@@ -63,6 +53,10 @@ if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
+ 	add_compile_options(-Wno-error=nonnull-compare)
+ endif()
+ 
++if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
++	add_compile_options(-Wno-error=vla-cxx-extension)
++endif()
++
+ if (OTBR_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
+     message(STATUS "Coverage: ON")
+     target_compile_options(otbr-config INTERFACE -g -O0 --coverage)
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
index 23e4368d27..0824eb6b9a 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
@@ -12,23 +12,12 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/third_party/openthread/repo/third_party/mbedtls/repo/library/bignum.c
 +++ b/third_party/openthread/repo/third_party/mbedtls/repo/library/bignum.c
-@@ -1544,7 +1544,7 @@ __attribute__ ((noinline))
- #endif
- void mpi_mul_hlp( size_t i, mbedtls_mpi_uint *s, mbedtls_mpi_uint *d, mbedtls_mpi_uint b )
+@@ -1392,7 +1392,7 @@ void mpi_mul_hlp( size_t i,
+                   mbedtls_mpi_uint *d,
+                   mbedtls_mpi_uint b )
  {
 -    mbedtls_mpi_uint c = 0, t = 0;
 +    mbedtls_mpi_uint c = 0, t __attribute__ ((unused)) = 0;
  
  #if defined(MULADDC_HUIT)
      for( ; i >= 8; i -= 8 )
---- a/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
-+++ b/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
-@@ -192,7 +192,7 @@ if(CMAKE_COMPILER_IS_GNU)
- endif(CMAKE_COMPILER_IS_GNU)
- 
- if(CMAKE_COMPILER_IS_CLANG)
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wno-error=documentation")
-     set(CMAKE_C_FLAGS_RELEASE     "-O2")
-     set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
-     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch
deleted file mode 100644
index f10cec2d6c..0000000000
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Pending
-
---- a/third_party/openthread/repo/src/cli/cli.cpp
-+++ b/third_party/openthread/repo/src/cli/cli.cpp
-@@ -1785,6 +1785,7 @@ template <> otError Interpreter::Process
- 
-     for (uint8_t i = 0;; i++)
-     {
-+    	OT_UNUSED_VARIABLE(i);
-         SuccessOrExit(otThreadGetNextCacheEntry(GetInstancePtr(), &entry, &iterator));
-         OutputEidCacheEntry(entry);
-     }
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index 71e5a8d43b..271340a25b 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -5,13 +5,13 @@ SUMMARY = "OpenThread Border Router"
 SECTION = "net"
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
-                    file://third_party/Simple-web-server/repo/LICENSE;md5=852b3f7f320b19f6431487b8b2fb1d74 \
+                    file://third_party/Simple-web-server/repo/LICENSE;md5=091ac9fd29d87ad1ae5bf765d95278b0 \
                     file://third_party/cJSON/repo/LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0 \
                     file://third_party/http-parser/repo/LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778 \
                     file://third_party/openthread/repo/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     "
-DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue"
-SRCREV = "ad6822257ffddbac295db97186e4ab449a2ed32a"
+DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue protobuf protobuf-native"
+SRCREV = "4e937939ba6ce146fd98537cb63e0f4c41c8dbe1"
 PV = "0.3.0+git"
 
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
@@ -19,7 +19,7 @@ SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=m
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            file://0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch \
            file://mbedtls.patch \
-           file://unused_var.patch \
+           file://default-cxx-std.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


