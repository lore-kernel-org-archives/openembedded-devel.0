Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6FDCD11BF
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 05:52:10 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.45654.1711345928617062235
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Mar 2024 22:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YHSGSQV5;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6f4ad4c57so2970578b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 22:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711345928; x=1711950728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5R2IBZo5XvQfMfZnmhs8m8nyXS4ZirsuKHi3rySrU9E=;
        b=YHSGSQV50szLLdGZ+NVB4XlGLsNHbbFjsZusoyT55WL67enR58gYF5y4ucCndhBlni
         uFBHb4/kGi0R8FqEJm4a6m+kPhzMwc6INC7FrSCIRVRhAO3cJuFdnT8PB/6V7gAT3any
         oEfjTTBwCz9kPC3WqSJYtG29iVAJSbPUT8Fe0G332wNsqvCCO+TyGV6lA24h5GQeIaOn
         gbNX0fHlGoK0i1pRZ0a6QG4uEa49DlbCa2FAwUHdngLqdC7YUHCPKkCn8MjcR5mvJI7G
         FtJ3jw1SxILdo8a0YsX+N8IROErY1tL6p7dfZBVzNFFWvkQaDFLmsMCF6K7iHerBr6r4
         rzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711345928; x=1711950728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5R2IBZo5XvQfMfZnmhs8m8nyXS4ZirsuKHi3rySrU9E=;
        b=AG2/Ko3pD3jdKABU4OU/wHPy0mzEBEzJ7r6RsnsTkwDvuP4h1hYunFyuUAOwayQFN1
         aT7qON5JAfsKPjP4B1ieuWT0pXJK8fjJNIzyLau+4MpqeVmOb1/9WHZljh0qDwbBHzFn
         T6PQdkRnU20UbfcKgLEkN1PhnX99NB3pZap5vx0iyd/Yew8kQIsb2MhrFGVNfTFB/1S9
         UHIpZHeM+P5PVYAfz9VQqO5aK7vgxgvTh/X7moJKIOZaPbuhQk2nE8gbsPR7LwlBZnX7
         Y+cc/UzNy7PMHVfqGuaQhziSlYVFBL0MkHc8SmXk84kjdmLGmSgfLzB7hZoU25KWnQ+/
         MbFA==
X-Gm-Message-State: AOJu0Yxq3cLZ2n5JRXxPL51MLnPoLHKPZ2gVbjmMUVXM7VizoGvRaWvH
	z31hA9YNpIdGIM1OWySenBPFmXapgdwghX7mL3nZ3C/3Myrfx3MROuDEH7S9
X-Google-Smtp-Source: AGHT+IFpDa//E/ccLMRX2wEqlbkQuciwgQiN4/UbWn0s4A6v6KFx1gGZk5LmMg4JR/+ktaGF46bFUg==
X-Received: by 2002:a05:6a20:d394:b0:1a3:c305:a8eb with SMTP id iq20-20020a056a20d39400b001a3c305a8ebmr4549678pzb.53.1711345927615;
        Sun, 24 Mar 2024 22:52:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id x17-20020a17090a531100b002a03da6286asm5096971pjh.35.2024.03.24.22.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:52:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] ot-br-posix: Update to latest
Date: Sun, 24 Mar 2024 22:52:01 -0700
Message-ID: <20240325055204.150628-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325055204.150628-1-raj.khem@gmail.com>
References: <20240325055204.150628-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 05:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109570

Drop backports
Add a new patch to supply additional musl fixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-PIC-inline-ASM-compilation-with-GCC.patch | 79 -------------------
 .../openthread/ot-br-posix/mbedtls.patch      | 23 ------
 .../openthread/ot-br-posix/musl-fixes.patch   | 26 ++++++
 .../openthread/ot-br-posix_git.bb             |  6 +-
 4 files changed, 29 insertions(+), 105 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
 delete mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/musl-fixes.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
deleted file mode 100644
index 8b286dfd14..0000000000
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From c0546e351f6d7ab50eb1de8cef1d0d167760fccc Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 27 Aug 2018 22:50:57 +0200
-Subject: [PATCH] bn_mul.h: fix x86 PIC inline ASM compilation with GCC < 5
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes #1910
-
-With ebx added to the MULADDC_STOP clobber list to fix #1550, the inline
-assembly fails to build with GCC < 5 in PIC mode with the following error:
-
-include/mbedtls/bn_mul.h:46:13: error: PIC register clobbered by ‘ebx’ in ‘asm’
-
-This is because older GCC versions treated the x86 ebx register (which is
-used for the GOT) as a fixed reserved register when building as PIC.
-
-This is fixed by an improved register allocator in GCC 5+.  From the release
-notes:
-
-Register allocation improvements: Reuse of the PIC hard register, instead of
-using a fixed register, was implemented on x86/x86-64 targets.  This
-improves generated PIC code performance as more hard registers can be used.
-
-https://www.gnu.org/software/gcc/gcc-5/changes.html
-
-As a workaround, detect this situation and disable the inline assembly,
-similar to the MULADDC_CANNOT_USE_R7 logic.
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/c0546e351f6d7ab50eb1de8cef1d0d167760fccc]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- library/bn_mul.h | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
---- a/third_party/openthread/repo/third_party/mbedtls/repo/include/mbedtls/bn_mul.h
-+++ b/third_party/openthread/repo/third_party/mbedtls/repo/include/mbedtls/bn_mul.h
-@@ -95,12 +95,28 @@
-     ( !defined(__ARMCC_VERSION) || __ARMCC_VERSION >= 6000000 )
- 
- /*
-+ * GCC < 5.0 treated the x86 ebx (which is used for the GOT) as a
-+ * fixed reserved register when building as PIC, leading to errors
-+ * like: bn_mul.h:46:13: error: PIC register clobbered by 'ebx' in 'asm'
-+ *
-+ * This is fixed by an improved register allocator in GCC 5+. From the
-+ * release notes:
-+ * Register allocation improvements: Reuse of the PIC hard register,
-+ * instead of using a fixed register, was implemented on x86/x86-64
-+ * targets. This improves generated PIC code performance as more hard
-+ * registers can be used.
-+ */
-+#if defined(__GNUC__) && __GNUC__ < 5 && defined(__PIC__)
-+#define MULADDC_CANNOT_USE_EBX
-+#endif
-+
-+/*
-  * Disable use of the i386 assembly code below if option -O0, to disable all
-  * compiler optimisations, is passed, detected with __OPTIMIZE__
-  * This is done as the number of registers used in the assembly code doesn't
-  * work with the -O0 option.
-  */
--#if defined(__i386__) && defined(__OPTIMIZE__)
-+#if defined(__i386__) && defined(__OPTIMIZE__) && !defined(MULADDC_CANNOT_USE_EBX)
- 
- #define MULADDC_INIT                        \
-     asm(                                    \
---- a/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
-+++ b/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
-@@ -210,7 +210,7 @@ if(CMAKE_COMPILER_IS_GNU)
- endif(CMAKE_COMPILER_IS_GNU)
- 
- if(CMAKE_COMPILER_IS_CLANG)
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=2 -Wno-format-nonliteral")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=2 -Wno-format-nonliteral -Wno-error=documentation")
-     set(CMAKE_C_FLAGS_RELEASE     "-O2")
-     set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
-     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
deleted file mode 100644
index 0824eb6b9a..0000000000
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-mbedtls: Disable documentation warning as error with clang
-
-There are shortcomings with doxygen info which clang-15+ flags, dont
-treat them as errors
-
-Remove unused variable
-
-Fixes
-library/bignum.c:1395:29: error: variable 't' set but not used [-Werror,-Wunused-but-set-variable]
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/third_party/openthread/repo/third_party/mbedtls/repo/library/bignum.c
-+++ b/third_party/openthread/repo/third_party/mbedtls/repo/library/bignum.c
-@@ -1392,7 +1392,7 @@ void mpi_mul_hlp( size_t i,
-                   mbedtls_mpi_uint *d,
-                   mbedtls_mpi_uint b )
- {
--    mbedtls_mpi_uint c = 0, t = 0;
-+    mbedtls_mpi_uint c = 0, t __attribute__ ((unused)) = 0;
- 
- #if defined(MULADDC_HUIT)
-     for( ; i >= 8; i -= 8 )
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/musl-fixes.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/musl-fixes.patch
new file mode 100644
index 0000000000..279a60741f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/musl-fixes.patch
@@ -0,0 +1,26 @@
+Musl fixes, which should be applied upstream too
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/dbus/common/types.hpp
++++ b/src/dbus/common/types.hpp
+@@ -715,7 +715,7 @@ struct TrelInfo
+     };
+ 
+     bool               mEnabled;      ///< Whether TREL is enabled.
+-    u_int16_t          mNumTrelPeers; ///< The number of TREL peers.
++    uint16_t          mNumTrelPeers; ///< The number of TREL peers.
+     TrelPacketCounters mTrelCounters; ///< The TREL counters.
+ };
+ 
+--- a/third_party/openthread/repo/src/posix/platform/CMakeLists.txt
++++ b/third_party/openthread/repo/src/posix/platform/CMakeLists.txt
+@@ -172,7 +172,7 @@ target_link_libraries(openthread-posix
+ )
+ 
+ option(OT_TARGET_OPENWRT "enable openthread posix for OpenWRT" OFF)
+-if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT)
++if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT AND NOT OT_TARGET_MUSL)
+     target_compile_definitions(ot-posix-config
+         INTERFACE "OPENTHREAD_POSIX_CONFIG_NAT64_AIL_PREFIX_ENABLE=1"
+     )
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index 271340a25b..d7be1cd71d 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -11,15 +11,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
                     file://third_party/openthread/repo/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     "
 DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue protobuf protobuf-native"
-SRCREV = "4e937939ba6ce146fd98537cb63e0f4c41c8dbe1"
+SRCREV = "a35cc682305bb2201c314472adf06a4960536750"
 PV = "0.3.0+git"
 
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
            file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
-           file://0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch \
-           file://mbedtls.patch \
            file://default-cxx-std.patch \
+           file://musl-fixes.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -56,6 +55,7 @@ EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DOT_DHCP6_CLIENT=ON \
                  -DOT_DHCP6_SERVER=ON \
                  "
+EXTRA_OECMAKE:append:libc-musl = " -DOT_TARGET_MUSL=ON"
 
 RDEPENDS:${PN} = "iproute2 ipset avahi-daemon"
 
-- 
2.44.0


