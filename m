Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC15FC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 18:05:58 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.17173.1638986758197778733
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 10:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WgzlzvU+;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso2726069pjl.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 10:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYgrqf+IlQvY8mvz7nSZI0MK91TLoYaiXJyTBKPUcno=;
        b=WgzlzvU+hSg3FFcmFrbkqp33GrmGuWvgNz6klr3F4FYLQkEms507Hat4Wb+QQ99a5J
         9pngvb5CZfer/iUvzsH8+033v0TdHLrCadsGFx2jaRRnBCG3bU8pALdZwi18hB3FVfrD
         0iNjgQK0FMQgphrfhVEyxB1yrglJ4HTRZr/xJamsbOsqIv3ajpgocxPaTrPYqwFW5PZ6
         YhjYgCjUJsLPsqjz4oqGwdsvV3tz7dWhMRqw4QgUOOixcj9Hb9Xl1zKyo5uSJ//ARiCj
         oWblLhz8zcA6qkDXgv7Wq89YWusVsougZnYCIaCHCd57b/MnXieplCgcxn4HraPuViY2
         qxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYgrqf+IlQvY8mvz7nSZI0MK91TLoYaiXJyTBKPUcno=;
        b=hXfv0lqiIka6XxgVy8Lk4sz2AiegLFP2sNTR6sAALZpELb0i8ilPhKAmEa4HPqPm5t
         FDh0uCdOC/Bv/VNejax+OMyg9kU/NCq/1m3YCYDCt8kr25OlnLiD5SPJ8c8gyNiW2dxb
         acRX3SgNc6YL9ezEYmXtUU2FOAPVQN7+IdmHgBCyaFKzRP0LcDNTsR7pL5xPv6JScq6w
         OpFOGiNqajyX1e3/9A1FsWR3e+qLW+aUfRVHIDPx0usFVufkEu/mZMYfUSW+sxWzoWCs
         nghmmIaOGBMAkPNzfdLHpaFrENHI6ycoiSVk2Gr3yMeRJe2oUpH/KxbIt34HrG8dJHhi
         fa4w==
X-Gm-Message-State: AOAM531PogAAXsADsZ0OAEsKIz4AZaBtvJhsQTDB5bzrLc6DZ+Hp8u2f
	pE2DPu1Ck4Cy4l76c4ms7zxO37Igbiee6w==
X-Google-Smtp-Source: 
 ABdhPJy614kchgefEUs7vNpDiuY19rM12FDspfBfwcex/vvROLtVeKfwFXiXGtElMqONqVdvhoLmVg==
X-Received: by 2002:a17:90a:1919:: with SMTP id
 25mr9274055pjg.154.1638986757133;
        Wed, 08 Dec 2021 10:05:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 k3sm3251563pgq.54.2021.12.08.10.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 10:05:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] tbb: Upgrade to 2021.4.0
Date: Wed,  8 Dec 2021 10:05:54 -0800
Message-Id: <20211208180554.1630650-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 18:05:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94254

* Drop upstreamed patches
* Drop 0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch
* which is fixed differently
* Forward port rest of them
* Add a patch to fix build with musl
* Add a patch to disable LTO on rv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build on rv32 and musl

 ...akeLists.txt-exclude-riscv64-riscv32.patch | 21 +++------
 .../0001-Disable-LTO-on-clang-riscv32.patch   | 34 ++++++++++++++
 ...1-Disable-use-of-_tpause-instruction.patch |  9 +---
 ...Musl-linux-can-not-use-RTLD_DEEPBIND.patch | 33 +++++++++++++
 .../tbb/tbb/0001-arena-Remove-dead-code.patch | 40 ----------------
 ...nfo-is-glibc-specific-API-mark-it-so.patch |  9 +---
 ...f_input-Use-an-arbitrary-but-valid-p.patch | 37 ---------------
 .../GLIBC-PREREQ-is-not-defined-on-musl.patch | 46 -------------------
 .../tbb/{tbb_2021.2.0.bb => tbb_2021.4.0.bb}  |  7 ++-
 9 files changed, 81 insertions(+), 155 deletions(-)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-arena-Remove-dead-code.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
 rename meta-oe/recipes-support/tbb/{tbb_2021.2.0.bb => tbb_2021.4.0.bb} (89%)

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch b/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
index ff6154808c..b34762710d 100644
--- a/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
+++ b/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
@@ -11,32 +11,25 @@ Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
  src/tbbmalloc/CMakeLists.txt | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/tbb/CMakeLists.txt b/src/tbb/CMakeLists.txt
-index a6edb6ad..4f261813 100644
 --- a/src/tbb/CMakeLists.txt
 +++ b/src/tbb/CMakeLists.txt
-@@ -55,7 +55,7 @@ target_compile_definitions(tbb
-                            PRIVATE
-                            __TBB_BUILD)
+@@ -58,7 +58,7 @@ target_compile_definitions(tbb
+                            $<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:__TBB_DYNAMIC_LOAD_ENABLED=0>
+                            $<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:__TBB_SOURCE_DIRECTLY_INCLUDED=1>)
  
 -if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64)" OR
 +if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64|riscv64|riscv32)" OR
           "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
           WINDOWS_STORE OR
           TBB_WINDOWS_DRIVER))
-diff --git a/src/tbbmalloc/CMakeLists.txt b/src/tbbmalloc/CMakeLists.txt
-index de7ca7ea..31e854fe 100644
 --- a/src/tbbmalloc/CMakeLists.txt
 +++ b/src/tbbmalloc/CMakeLists.txt
-@@ -28,7 +28,7 @@ target_compile_definitions(tbbmalloc
-                            PRIVATE
-                            __TBBMALLOC_BUILD)
+@@ -30,7 +30,7 @@ target_compile_definitions(tbbmalloc
+                            $<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:__TBB_DYNAMIC_LOAD_ENABLED=0>
+                            $<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:__TBB_SOURCE_DIRECTLY_INCLUDED=1>)
  
 -if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64)" OR
 +if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64|riscv64|riscv32)" OR
           "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
           WINDOWS_STORE OR
-          TBB_WINDOWS_DRIVER))
--- 
-2.17.1
-
+          TBB_WINDOWS_DRIVER OR
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch b/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch
new file mode 100644
index 0000000000..80cdd2b0a1
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch
@@ -0,0 +1,34 @@
+From 95a5c97122b7c5bdeba61f2e890bae9a961dd4bf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 8 Dec 2021 10:01:22 -0800
+Subject: [PATCH] Disable LTO on clang/riscv32
+
+With clang in OE LTO does not work as it does not seem to carry right
+target info and mixes ABIs
+
+| Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)
+| /mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/tbb/1_2021.4.0-r0/recipe-sysroot-native/usr/bin/riscv32-yoe-linux/riscv32-yoe-linux-ld: /tmp/lto-llvm-3fb1bf.o: can't link soft-float modules with double-float modules
+| /mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/tbb/1_2021.4.0-r0/recipe-sysroot-native/usr/bin/riscv32-yoe-linux/riscv32-yoe-linux-ld: failed to merge target specific data of file /tmp/lto-llvm-3fb1bf.o
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/compilers/Clang.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/compilers/Clang.cmake b/cmake/compilers/Clang.cmake
+index bb7401e3..99a28d61 100644
+--- a/cmake/compilers/Clang.cmake
++++ b/cmake/compilers/Clang.cmake
+@@ -60,7 +60,7 @@ endif()
+ 
+ # Enabling LTO on Android causes the NDK bug.
+ # NDK throws the warning: "argument unused during compilation: '-Wa,--noexecstack'"
+-if (NOT ANDROID_PLATFORM AND BUILD_SHARED_LIBS)
++if (NOT ANDROID_PLATFORM AND BUILD_SHARED_LIBS AND NOT CMAKE_SYSTEM_PROCESSOR MATCHES "(riscv32)")
+     set(TBB_IPO_COMPILE_FLAGS $<$<NOT:$<CONFIG:Debug>>:-flto>)
+     set(TBB_IPO_LINK_FLAGS $<$<NOT:$<CONFIG:Debug>>:-flto>)
+ endif()
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch b/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
index 7a4cc3e4e3..78051d7eef 100644
--- a/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
+++ b/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
@@ -16,19 +16,14 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  src/tbb/scheduler_common.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/tbb/scheduler_common.h b/src/tbb/scheduler_common.h
-index ee13dbf9..49052001 100644
 --- a/src/tbb/scheduler_common.h
 +++ b/src/tbb/scheduler_common.h
-@@ -219,7 +219,7 @@ inline void prolonged_pause_impl() {
+@@ -220,7 +220,7 @@ inline void prolonged_pause_impl() {
  #endif
  
  inline void prolonged_pause() {
--#if __TBB_WAITPKG_INTRINSICS_PRESENT && (_WIN32 || _WIN64 || __linux__) && (__TBB_x86_32 || __TBB_x86_64)
+-#if __TBB_WAITPKG_INTRINSICS_PRESENT && (_WIN32 || _WIN64 || __unix__) && (__TBB_x86_32 || __TBB_x86_64)
 +#if 0
      if (governor::wait_package_enabled()) {
          std::uint64_t time_stamp = machine_time_stamp();
          // _tpause function directs the processor to enter an implementation-dependent optimized state
--- 
-2.29.0
-
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch b/meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
new file mode 100644
index 0000000000..355cf2e0bb
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
@@ -0,0 +1,33 @@
+From a7289eeff4ac9e3ca2d2289672c923518433124c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 8 Dec 2021 09:26:58 -0800
+Subject: [PATCH] Musl/linux can not use RTLD_DEEPBIND
+
+Exclude non-glibc linux systems along with android
+Fixes
+src/tbb/dynamic_link.cpp:417:29: error: use
+ of undeclared identifier 'RTLD_DEEPBIND'                                                                                    |             flags = flags | RTLD_DEEPBIND;
+|                             ^
+
+Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/684]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tbb/dynamic_link.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tbb/dynamic_link.cpp b/src/tbb/dynamic_link.cpp
+index 12f35cfd..942c1c64 100644
+--- a/src/tbb/dynamic_link.cpp
++++ b/src/tbb/dynamic_link.cpp
+@@ -413,7 +413,7 @@ namespace r1 {
+         int flags = RTLD_NOW;
+         if (local_binding) {
+             flags = flags | RTLD_LOCAL;
+-#if __linux__ && !__ANDROID__ && !__TBB_USE_SANITIZERS
++#if (__linux__ && __GLIBC__) && !__TBB_USE_SANITIZERS
+             flags = flags | RTLD_DEEPBIND;
+ #endif
+         } else {
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-arena-Remove-dead-code.patch b/meta-oe/recipes-support/tbb/tbb/0001-arena-Remove-dead-code.patch
deleted file mode 100644
index 8a603ffe30..0000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-arena-Remove-dead-code.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b94a1e3d6b5c733ba24cfa0d35450d8659d48289 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 4 Jun 2021 13:07:28 -0700
-Subject: [PATCH] arena: Remove dead code
-
-Fixes clang warning
-arena.cpp:226:19: error: variable 'drained' set b
-ut not used [-Werror,-Wunused-but-set-variable]
-|     std::intptr_t drained = 0;
-|                   ^
-
-Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/429]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tbb/arena.cpp | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/tbb/arena.cpp b/src/tbb/arena.cpp
-index 4a9c0f8a..c8ed4999 100644
---- a/src/tbb/arena.cpp
-+++ b/src/tbb/arena.cpp
-@@ -232,14 +232,13 @@ void arena::free_arena () {
-     __TBB_ASSERT( !my_global_concurrency_mode, NULL );
- #endif
-     poison_value( my_guard );
--    std::intptr_t drained = 0;
-     for ( unsigned i = 0; i < my_num_slots; ++i ) {
-         // __TBB_ASSERT( !my_slots[i].my_scheduler, "arena slot is not empty" );
-         // TODO: understand the assertion and modify
-         // __TBB_ASSERT( my_slots[i].task_pool == EmptyTaskPool, NULL );
-         __TBB_ASSERT( my_slots[i].head == my_slots[i].tail, NULL ); // TODO: replace by is_quiescent_local_task_pool_empty
-         my_slots[i].free_task_pool();
--        drained += mailbox(i).drain();
-+        mailbox(i).drain();
-         my_slots[i].my_default_task_dispatcher->~task_dispatcher();
-     }
-     __TBB_ASSERT(my_fifo_task_stream.empty(), "Not all enqueued tasks were executed");
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
index 49325447e8..9af37ebc64 100644
--- a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
+++ b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
@@ -13,11 +13,9 @@ Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
  src/tbbmalloc_proxy/proxy.cpp | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.cpp
-index f9942bf1..fe0dad89 100644
 --- a/src/tbbmalloc_proxy/proxy.cpp
 +++ b/src/tbbmalloc_proxy/proxy.cpp
-@@ -253,6 +253,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
+@@ -260,6 +260,7 @@ int mallopt(int /*param*/, int /*value*/
      return 1;
  }
  
@@ -25,7 +23,7 @@ index f9942bf1..fe0dad89 100644
  struct mallinfo mallinfo() __THROW
  {
      struct mallinfo m;
-@@ -260,6 +261,7 @@ struct mallinfo mallinfo() __THROW
+@@ -267,6 +268,7 @@ struct mallinfo mallinfo() __THROW
  
      return m;
  }
@@ -33,6 +31,3 @@ index f9942bf1..fe0dad89 100644
  
  #if __ANDROID__
  // Android doesn't have malloc_usable_size, provide it to be compatible
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch b/meta-oe/recipes-support/tbb/tbb/0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch
deleted file mode 100644
index caa68e64c5..0000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a996fd451bbd7be93cff5f466bff7282ae972fe1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 11 May 2021 10:52:51 -0700
-Subject: [PATCH] set_my_tls_end_of_input: Use an arbitrary but valid pointer
- as value
-
-Pass a valid pointer to pthread_setspecific to avoid GCC 11 warning.
-Fixes
-
-src/tbb/tls.h:44:46: error: 'int pthread_setspecific(pthread_key_t, const void*)' expecting 1 byte in a region of size 0 [-Werror=stringop-overread]
-|    44 |     void set( T value ) { pthread_setspecific(my_key, (void*)value); }
-|       |                           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
-| compilation terminated due to -Wfatal-errors.
-
-Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/394]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tbb/parallel_pipeline.cpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/tbb/parallel_pipeline.cpp b/src/tbb/parallel_pipeline.cpp
-index b7655c6b..ca518b5b 100644
---- a/src/tbb/parallel_pipeline.cpp
-+++ b/src/tbb/parallel_pipeline.cpp
-@@ -243,7 +243,8 @@ public:
-         return end_of_input_tls.get() != 0;
-     }
-     void set_my_tls_end_of_input() {
--        end_of_input_tls.set(1);
-+	// Use an arbitrary but valid pointer as value.
-+        end_of_input_tls.set(array_size);
-     }
- };
- 
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
deleted file mode 100644
index fb10684cde..0000000000
--- a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 5cac8b5fffa4ebf5f0090456c9e0cbf43827242a Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Wed, 7 Apr 2021 11:32:52 +0800
-Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defined on 
- musl
-
-Do not call __GLIBC_PREREQ if it is not defined otherwise build will
-fail on musl
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/203]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- src/tbbmalloc_proxy/proxy.cpp | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.cpp
-index fe0dad89..93e68049 100644
---- a/src/tbbmalloc_proxy/proxy.cpp
-+++ b/src/tbbmalloc_proxy/proxy.cpp
-@@ -24,7 +24,8 @@
- // of aligned_alloc as required by new C++ standard, this makes it hard to
- // redefine aligned_alloc here. However, running on systems with new libc
- // version, it still needs it to be redefined, thus tricking system headers
--#if defined(__GLIBC_PREREQ) && !__GLIBC_PREREQ(2, 16) && _GLIBCXX_HAVE_ALIGNED_ALLOC
-+#if defined(__GLIBC_PREREQ)
-+#if !__GLIBC_PREREQ(2, 16) && _GLIBCXX_HAVE_ALIGNED_ALLOC
- // tell <cstdlib> that there is no aligned_alloc
- #undef _GLIBCXX_HAVE_ALIGNED_ALLOC
- // trick <stdlib.h> to define another symbol instead
-@@ -32,7 +33,8 @@
- // Fix the state and undefine the trick
- #include <cstdlib>
- #undef aligned_alloc
--#endif // defined(__GLIBC_PREREQ)&&!__GLIBC_PREREQ(2, 16)&&_GLIBCXX_HAVE_ALIGNED_ALLOC
-+#endif // defined(__GLIBC_PREREQ)
-+#endif // !__GLIBC_PREREQ(2, 16)&&_GLIBCXX_HAVE_ALIGNED_ALLOC
- #endif // __linux__ && !__ANDROID__
- 
- #include "proxy.h"
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.4.0.bb
similarity index 89%
rename from meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.4.0.bb
index c726bef3b5..6c64f019cb 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.4.0.bb
@@ -12,14 +12,13 @@ DEPENDS:append:libc-musl = " libucontext"
 PE = "1"
 
 BRANCH = "onetbb_2021"
-SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
+SRCREV = "4e021eafc03519cb1081ed775c9502cae72f8d8d"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
             file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
-            file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
             file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
             file://0001-Disable-use-of-_tpause-instruction.patch \
-            file://0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch \
-            file://0001-arena-Remove-dead-code.patch \
+            file://0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch \
+            file://0001-Disable-LTO-on-clang-riscv32.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


