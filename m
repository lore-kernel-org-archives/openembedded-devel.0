Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26696C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 05:52:10 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.45652.1711345928051652915
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Mar 2024 22:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEOxyOBu;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29df0ca87d1so3307169a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 22:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711345927; x=1711950727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+x2WM4jYIK/tILsyWD07s+AM8vNYqPY4cNMMUTcnyk=;
        b=CEOxyOBugV6WhuaaewfbOiAtl3yxuc5No7DJaY0m6x9mYLULHJLEQ0mhbr38PoeOoI
         qhjslNA29Dymnw6giz2WIecGAc6i8ecRnwKrGnUXZfgMwcQkktW+4rLk15Lamdz9+tIq
         ES1VG5fl/3MDLefcnMO9p0eiDg57YXrpOqvbmwyRWDKjncC/1YvNT40xaGi/v+DLoy+A
         N+TZGMDft3vq4G5uvcuADnD87meu5b0QS98M6qFkFW5VpP2o60V4XpjpDK7XxiA2gDxs
         xXGUgTv7q7X8HYNqid9ajS6RCZO6FX7PtpXIkil1y09BgEnjx2+9GfBJUmA0F4h44Cr/
         JO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711345927; x=1711950727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+x2WM4jYIK/tILsyWD07s+AM8vNYqPY4cNMMUTcnyk=;
        b=vxlTVR5ROaRw/KthpuXoajuG+pIM0jaz9I/ljhPCuYJzEq5dCPsqe2s5jC94VomKXH
         6KzUo1RQkzRJDSlZAetnb/t8L+atC7/PG3s2uqVPgr6zdKOyqmqQS3UzyhW8FvazuIrJ
         Ay5stzGkTGkshuwX/ahEJ0Cd+OOR5BE0QftwE1PFR83xITJ7DghnEdptyp1DddkMGerD
         Vr6xe43A3fBOx3uZQiwO1FHoul36eUHx7MKFXmJUHVZm1OraXWL0TavvdSF4sXFln9kZ
         NiDzQ76hX5HObXn0F2+Q3iD9uvbQvo9lZy1rSTSySYgLuRrbgKiu1H5f09fB75zSWPUt
         8IFg==
X-Gm-Message-State: AOJu0Yy9XQBEE17ydrsgAgbF4zBazLrJmke9Sk4GN45QMOnpbMd0agHZ
	vAUd8erM0jLtfvvL8xhUiM8reCwbhQy9iWP3sPilFH8RSfs/zTmHmNtggyvE
X-Google-Smtp-Source: AGHT+IFJ+dOmvol5hgChGtDQrOgE4NKvEaxhIEDjvwwEIkCGjMEocdeEmohUGKaoJWz9ORZsTh40zQ==
X-Received: by 2002:a17:90a:8998:b0:2a0:1720:f5dc with SMTP id v24-20020a17090a899800b002a01720f5dcmr5593777pjn.9.1711345926866;
        Sun, 24 Mar 2024 22:52:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id x17-20020a17090a531100b002a03da6286asm5096971pjh.35.2024.03.24.22.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:52:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/4] ot-daemon: Update to tip of trunk
Date: Sun, 24 Mar 2024 22:52:00 -0700
Message-ID: <20240325055204.150628-2-raj.khem@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109569

Drop backports which are not already available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-PIC-inline-ASM-compilation-with-GCC.patch | 68 -------------------
 .../openthread/ot-daemon/mbedtls.patch        | 34 ----------
 .../openthread/ot-daemon_git.bb               |  8 +--
 3 files changed, 4 insertions(+), 106 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/openthread/ot-daemon/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
 delete mode 100644 meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch b/meta-networking/recipes-connectivity/openthread/ot-daemon/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
deleted file mode 100644
index c9edb0098b..0000000000
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
+++ /dev/null
@@ -1,68 +0,0 @@
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
---- a/third_party/mbedtls/repo/include/mbedtls/bn_mul.h
-+++ b/third_party/mbedtls/repo/include/mbedtls/bn_mul.h
-@@ -55,12 +55,28 @@
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
diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch b/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch
deleted file mode 100644
index ffaff48dd4..0000000000
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch
+++ /dev/null
@@ -1,34 +0,0 @@
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
---- a/third_party/mbedtls/repo/library/bignum.c
-+++ b/third_party/mbedtls/repo/library/bignum.c
-@@ -1544,7 +1544,7 @@ __attribute__ ((noinline))
- #endif
- void mpi_mul_hlp( size_t i, mbedtls_mpi_uint *s, mbedtls_mpi_uint *d, mbedtls_mpi_uint b )
- {
--    mbedtls_mpi_uint c = 0, t = 0;
-+    mbedtls_mpi_uint c = 0, t __attribute__ ((unused)) = 0;
- 
- #if defined(MULADDC_HUIT)
-     for( ; i >= 8; i -= 8 )
---- a/third_party/mbedtls/repo/CMakeLists.txt
-+++ b/third_party/mbedtls/repo/CMakeLists.txt
-@@ -192,7 +192,7 @@ if(CMAKE_COMPILER_IS_GNU)
- endif(CMAKE_COMPILER_IS_GNU)
- 
- if(CMAKE_COMPILER_IS_CLANG)
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wno-error=documentation")
-     set(CMAKE_C_FLAGS_RELEASE     "-O2")
-     set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
-     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
index 1583a3f837..4456835410 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
@@ -5,15 +5,13 @@ SUMMARY = "OpenThread Daemon is an OpenThread POSIX build mode that runs OpenThr
 SECTION = "net"
 LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
-                    file://third_party/mbedtls/repo/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://third_party/mbedtls/repo/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d \
                     "
 DEPENDS = "readline"
-SRCREV = "7dfde1f12923f03c9680be4d838b94b7a2320324"
+SRCREV = "90adc86d34e21a9e8f86d093c2190030042c4a59"
 PV = "0.1+git"
 
 SRC_URI = "git://github.com/openthread/openthread.git;protocol=https;branch=main \
-           file://0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch \
-           file://mbedtls.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -27,3 +25,5 @@ EXTRA_OECMAKE = "-DOT_DAEMON=ON \
                  -DOT_PLATFORM=posix \
                  -DCMAKE_BUILD_TYPE=Release \
                  "
+
+EXTRA_OECMAKE:append:libc-musl = " -DOT_TARGET_OPENWRT=ON"
-- 
2.44.0


