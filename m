Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E948C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 16:38:49 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.387.1638895128913779194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ErREZYnU;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id u80so14036310pfc.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfVyGpGaABiM0vqDlDysO0+FHQHOQa6OYbU8a7n6x2Q=;
        b=ErREZYnUAswv0+lvSVjcrKAJoYDKYU+lcyuVsfCa9bFQqAt7E7DOtSwGoFFgPYv/do
         G2m6WwmskW7sAImIYvKVFfeuXXpkzhnK/0yza6/knK8d9ZuiX9kXrCQ4pFsjNp3nCIgN
         CZBDLpFk9Pdijww5t2WdHsmUIfcoIQKOi6Zmb1Yj/Ler7JpteJ6ojh5K9exQLtNnV2Jv
         gSiNBJeEeNcQUm2t1/6RQ6QjsDCKW5G8j0vnVvM5r89cqxqqzUvxo54y3AlVeZIW6JaK
         9M7VmzUR+pa3ZPFhdaza66BN/2pnVUFJ7JQ34hJk4tpnXbrEVb29iwaEHcTOunvoYJMD
         qUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfVyGpGaABiM0vqDlDysO0+FHQHOQa6OYbU8a7n6x2Q=;
        b=DvGFiPnHf3Kgzu2K9pReYDWgwIqj85udMbRQxsMIQfjoCMORIY12OYJiIsyCSTul82
         +T40WKk67VXL+7xzFd+osFkKxp54LZpw58Pv+NJPeIUJXpCxa4PNXOrvdhPZJwSIYvZu
         m9gLk1pI0GMyGcyqhGSTdhocXVABKsmqn+9sWMrNdBpyHTD6TK1/s3GMCuNAfSXSwyFp
         6SaQkMPzZ7GA3/KYy2TN5pnupsmcxMM0M9lMULYi2FJ6Oga9elE66DE28y3iq4D6PMle
         lT9vxH6zjtbqqbtvyhhdsv5WQ3Swh9x0FEOxJ5D1US6HiXRa0z05kgezcHQi28voGBeR
         2DgA==
X-Gm-Message-State: AOAM53290Sr0e6GQyuSL5XcQjsksY28hgtoKZ0Ctjd1SDLgl5aQvSJsS
	tgll+AGueM/e5pXMJ0mSrxDpnyvT4IKtSA==
X-Google-Smtp-Source: 
 ABdhPJyRf6lkIC76pWnLN0oMwDnJVTicFjYlhdET7MrRs0z1r/mdLkT2GUnhlgyrkiR9XM2/pFGBWQ==
X-Received: by 2002:a63:914a:: with SMTP id
 l71mr24946804pge.224.1638895127984;
        Tue, 07 Dec 2021 08:38:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 y11sm150391pfg.204.2021.12.07.08.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:38:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tbb: Upgrade to 2021.4.0
Date: Tue,  7 Dec 2021 08:38:45 -0800
Message-Id: <20211207163845.2026814-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 16:38:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94240

Drop upstreamed patches
Drop 0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch
which is fixed differently
Forward port rest of them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...akeLists.txt-exclude-riscv64-riscv32.patch | 21 +++------
 ...1-Disable-use-of-_tpause-instruction.patch |  9 +---
 .../tbb/tbb/0001-arena-Remove-dead-code.patch | 40 ----------------
 ...nfo-is-glibc-specific-API-mark-it-so.patch |  9 +---
 ...f_input-Use-an-arbitrary-but-valid-p.patch | 37 ---------------
 .../GLIBC-PREREQ-is-not-defined-on-musl.patch | 46 -------------------
 .../tbb/{tbb_2021.2.0.bb => tbb_2021.4.0.bb}  |  5 +-
 7 files changed, 12 insertions(+), 155 deletions(-)
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
index c726bef3b5..5396e1735a 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.4.0.bb
@@ -12,14 +12,11 @@ DEPENDS:append:libc-musl = " libucontext"
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
 "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


