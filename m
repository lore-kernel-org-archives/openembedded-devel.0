Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C256C28B30
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 20:52:14 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.4420.1741985526863023184
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 13:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Nx/Z74Iw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250314205207af41e663ebb65b8168-qdgnm3@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250314205207af41e663ebb65b8168
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 14 Mar 2025 21:52:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JjEdApuRL2j9cxmkGE9GNKN9TdZdk4gO+aU44+S3Wbo=;
 b=Nx/Z74IwhRdmpvU5gK9uhx0FzPhD3cOpn5Fto+zFUt92a+Zrt4tQThfDD4Lq8vJw2/mvg0
 EK6ggXWuoxDHjhrwaxm3FmD4/Hm8pPJV0fFlRF9J3FVLGmW+VOb6BK+Q8G5XANt7+70NRG95
 YRCZhr7xkApsq5qS3fnh4HkNsM4sflKJnzpxBUXzKK63A8lhKdDDFyo4xr0KVOE+nkX8Ygmw
 yYnOwWGVo7rmlUYejCs95c2MH/TCpfQQl5U54DVeYYXksc/JkQHyvIRqc6F1jbzAS8yrpXfS
 mPKE1DNJpiXeDmUrSeQXe4SgBFpD6XE3BYiT5JAGk/gyQ0Th4H6CYE3g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/7] fluentbit: upgrade 3.2.1 -> 3.2.8
Date: Fri, 14 Mar 2025 21:50:30 +0100
Message-Id: <20250314205035.386919-2-peter.marko@siemens.com>
In-Reply-To: <20250314205035.386919-1-peter.marko@siemens.com>
References: <20250314205035.386919-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 20:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115989

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2024-50608 and CVE-2024-50609 (in 3.2.7).

Drop two patches addressed upstream.
Refresh remaining patches.
zstd is now bundled without possibility to unbundle.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...rivate-makefile-targets-in-CMakelist.patch | 10 ++--
 ...ts.txt-Revise-init-manager-deduction.patch |  4 +-
 ...d-cmake-try_run-when-cross-compiling.patch | 42 --------------
 ..._text.c-fix-wrong-pointer-assignment.patch | 56 -------------------
 ...{fluentbit_3.2.1.bb => fluentbit_3.2.8.bb} | 11 ++--
 5 files changed, 11 insertions(+), 112 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0004-wasm-avoid-cmake-try_run-when-cross-compiling.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0005-cprof_encode_text.c-fix-wrong-pointer-assignment.patch
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_3.2.1.bb => fluentbit_3.2.8.bb} (94%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
index 642a73dac2..fae98f1f5d 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
@@ -70,8 +70,8 @@ diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
 index e47ba022d..0ddfd5f97 100644
 --- a/lib/ctraces/CMakeLists.txt
 +++ b/lib/ctraces/CMakeLists.txt
-@@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  5)
- set(CTR_VERSION_PATCH  7)
+@@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  6)
+ set(CTR_VERSION_PATCH  0)
  set(CTR_VERSION_STR "${CTR_VERSION_MAJOR}.${CTR_VERSION_MINOR}.${CTR_VERSION_PATCH}")
  
 -# Define __FILENAME__ consistently across Operating Systems
@@ -95,9 +95,9 @@ index 028240bcc..b386cb726 100644
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99 -Wall -Wextra")
 -set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$$(subst ${CMAKE_SOURCE_DIR}/,,$$(abspath \$$<))\"'")
 -else()
--set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
- endif()
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
++endif()
+ set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
+-endif()
  
  # Monkey Version
  set(MK_VERSION_MAJOR  1)
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
index 4da1650bc1..8dd4da47ec 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
@@ -18,7 +18,7 @@ diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
 index 8404b65c1..0c7876058 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -540,7 +540,7 @@ if(FLB_BINARY)
+@@ -546,7 +546,7 @@ if(FLB_BINARY)
      set(SYSTEMD_UNITDIR  /lib/systemd/system)
    endif()
  
@@ -27,7 +27,7 @@ index 8404b65c1..0c7876058 100644
      set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
      configure_file(
        "${PROJECT_SOURCE_DIR}/init/systemd.in"
-@@ -548,7 +548,7 @@ if(FLB_BINARY)
+@@ -554,7 +554,7 @@ if(FLB_BINARY)
        )
      install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${SYSTEMD_UNITDIR})
      install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT binary)
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-wasm-avoid-cmake-try_run-when-cross-compiling.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-wasm-avoid-cmake-try_run-when-cross-compiling.patch
deleted file mode 100644
index b711b413bd..0000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-wasm-avoid-cmake-try_run-when-cross-compiling.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5f3bfd51851c6700b4dfd2ac25e83e5306b923f8 Mon Sep 17 00:00:00 2001
-From: Patrick Wicki <patrick.wicki@siemens.com>
-Date: Sat, 5 Oct 2024 21:36:12 +0200
-Subject: [PATCH] wasm: avoid cmake try_run when cross-compiling for x86
-
-This fixes building the wasm micro runtime used when enabling wasm
-support in fluentbit.
-cmake try_run does not work when cross-compiling because the test program
-cannot be executed:
-
-| CMake Error: try_run() invoked in cross-compiling mode, please set the following cache variables appropriately:
-|    TEST_WRGSBASE_RESULT (advanced)
-| For details see .../fluentbit/3.1.9/build/TryRunResults.cmake
-|      Write linear memory base addr to x86 GS register disabled
-| -- Configuring incomplete, errors occurred!
-
-Since we cannot run the test program, assume that the instruction is not
-available and disable the option.
-
-This patch is no longer needed once fluentbit updates WAMR, as it's been
-fixed in https://github.com/bytecodealliance/wasm-micro-runtime/pull/3066.
-
-Upstream-Status: Pending [https://github.com/fluent/fluent-bit/pull/8744]
-
-Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
----
- .../build-scripts/config_common.cmake                           | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake
-index e73ebc85f..c2504e007 100644
---- a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake
-+++ b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake
-@@ -408,7 +408,7 @@ if (WAMR_BUILD_STATIC_PGO EQUAL 1)
-   add_definitions (-DWASM_ENABLE_STATIC_PGO=1)
-   message ("     AOT static PGO enabled")
- endif ()
--if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
-+if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1 OR CMAKE_CROSSCOMPILING)
-   add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=1)
-   message ("     Write linear memory base addr to x86 GS register disabled")
- elseif (WAMR_BUILD_TARGET STREQUAL "X86_64"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-cprof_encode_text.c-fix-wrong-pointer-assignment.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-cprof_encode_text.c-fix-wrong-pointer-assignment.patch
deleted file mode 100644
index 1d2513aefb..0000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-cprof_encode_text.c-fix-wrong-pointer-assignment.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2e39a3cea7d03721298e90fad70560c541b092a5 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sat, 16 Nov 2024 20:55:37 +0100
-Subject: [PATCH] cprof_encode_text.c: fix wrong pointer assignment
-
-Fix cprofiles build.
-
-Upstream-Status: Submitted [https://github.com/fluent/cprofiles/pull/3]
-
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
-Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
----
- lib/cprofiles/src/cprof_encode_text.c | 6 +++---
- lib/cprofiles/src/cprof_profile.c     | 2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/lib/cprofiles/src/cprof_encode_text.c b/lib/cprofiles/src/cprof_encode_text.c
-index 218a72b5b..ab2d6247d 100644
---- a/lib/cprofiles/src/cprof_encode_text.c
-+++ b/lib/cprofiles/src/cprof_encode_text.c
-@@ -1909,7 +1909,7 @@ static int encode_cprof_resource_profiles(
-                 struct cprof_resource_profiles *instance) {
-     int result;
-     struct cfl_list             *iterator;
--    struct cprof_scope_profile *scope_profile;
-+    struct cprof_scope_profiles *scope_profiles;
- 
-     result = encode_string(context,
-                             CFL_TRUE,
-@@ -1958,11 +1958,11 @@ static int encode_cprof_resource_profiles(
- 
-         cfl_list_foreach(iterator,
-                          &instance->scope_profiles) {
--            scope_profile = cfl_list_entry(
-+            scope_profiles = cfl_list_entry(
-                                 iterator,
-                                 struct cprof_scope_profiles, _head);
- 
--            result = encode_cprof_scope_profiles(context, scope_profile);
-+            result = encode_cprof_scope_profiles(context, scope_profiles);
- 
-             if (result != CPROF_ENCODE_TEXT_SUCCESS) {
-                 return result;
-diff --git a/lib/cprofiles/src/cprof_profile.c b/lib/cprofiles/src/cprof_profile.c
-index 66d62b361..d059d0376 100644
---- a/lib/cprofiles/src/cprof_profile.c
-+++ b/lib/cprofiles/src/cprof_profile.c
-@@ -98,7 +98,7 @@ void cprof_profile_destroy(struct cprof_profile *instance)
-     struct cfl_list             *iterator_backup;
-     struct cprof_attribute_unit *attribute_unit;
-     struct cprof_value_type     *value_type;
--    struct cprof_mapping        *location;
-+    struct cprof_location        *location;
-     struct cprof_function       *function;
-     struct cfl_list             *iterator;
-     struct cprof_mapping        *mapping;
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
similarity index 94%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
index 30a62dbc12..fbaee9e121 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
@@ -17,14 +17,12 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "600b5a955b5ef7b9d025e0c128432260d0c6a5f1"
+SRCREV = "d13e8e4ab2029fa92600b7d1d0da28f8dcc350eb"
 SRC_URI = "\
-    git://github.com/fluent/fluent-bit.git;branch=master;protocol=https \
+    git://github.com/fluent/fluent-bit.git;branch=3.2;protocol=https \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
-    file://0004-wasm-avoid-cmake-try_run-when-cross-compiling.patch \
-    file://0005-cprof_encode_text.c-fix-wrong-pointer-assignment.patch \
 "
 SRC_URI:append:libc-musl = "\
     file://0004-chunkio-Link-with-fts-library-with-musl.patch \
@@ -114,9 +112,8 @@ PACKAGECONFIG[windows-defaults] = "-DFLB_WINDOWS_DEFAULTS=Yes,-DFLB_WINDOWS_DEFA
 # individual plugins then to enable (e.g. using EXTRA_OECMAKE:append = " -DFLB_FOOBAR=ON")
 PACKAGECONFIG[minimal] = "-DFLB_MINIMAL=Yes,-DFLB_MINIMAL=No"
 
-# Without zstd dependency, kafka plugin build fails at link attempt against native libzstd.so
-PACKAGECONFIG[in-kafka] = "-DFLB_IN_KAFKA=ON,-DFLB_IN_KAFKA=OFF,librdkafka zstd curl"
-PACKAGECONFIG[out-kafka] = "-DFLB_OUT_KAFKA=ON,-DFLB_OUT_KAFKA=OFF,librdkafka zstd curl"
+PACKAGECONFIG[in-kafka] = "-DFLB_IN_KAFKA=ON,-DFLB_IN_KAFKA=OFF,librdkafka curl"
+PACKAGECONFIG[out-kafka] = "-DFLB_OUT_KAFKA=ON,-DFLB_OUT_KAFKA=OFF,librdkafka curl"
 
 SYSTEMD_SERVICE:${PN} = "fluent-bit.service"
 

