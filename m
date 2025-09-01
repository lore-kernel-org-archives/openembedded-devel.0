Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69006CA100D
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 22:42:53 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.64708.1756766572709758636
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 15:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dCLU1RGj;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so390733b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766572; x=1757371372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvGlcZiTYn+1La1i5ZpD6oXEWXstZYLi9UOcqntqFKw=;
        b=dCLU1RGjp33XzdkrR3sxWDJFFCGgLdIHisB2dyKNB/H+HHmzJnuLPfzLpIitjiqxtX
         lO/3t1nTEK8/6vrTjL53MHfWx4iFZ6VDEQlRmFy7vUdEHUN7nZszder2UFyF/PDF+0bu
         qGe9TwswDkfptiWUaZol0FMXGe7G4gAWj0yZ0m0kwbFpZMe602E/k0lQx927Mg/MlX7I
         UlrhfTwBbaCw4cB6wlO/poJsqfaK/3szjCq2FJJ2O4TDMgZ3xntESWBZl4riwfufFqiZ
         OO69NGuREA3FpeGeveFIqXIZ+LLU7XylZJ1n+6L7F3l4l5LC5ORdN1+bJFM9T0YpxChn
         Vclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766572; x=1757371372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvGlcZiTYn+1La1i5ZpD6oXEWXstZYLi9UOcqntqFKw=;
        b=GaNjOq0OmTW+aLoh1HNjtUaOF/8oUqKsHcMTY+UQM81vBgb3QbE39wZB052Q1nzD3G
         ihud7m+A87zR2x55DsZBd5D3nFTk7cxaoYG3GXHbO9sNXDc5nBKlHz32FxmHksmMiMU+
         nJz4VFbqFJIvc016zTi41O5ulOzrcpcBtoiFC/Od8sJ6Djtg0i8vOt68SnrMLTB04kBm
         WJ1O/x658E+rOPYRWrU4ICxeCSbxyQSUwwvYPxFsAVGgu/EXJMYaFT8VzYa+2zuqtzSV
         v4R70V+yZzZNVuBgNs+taJ6lox4m1tD5RV484Q9qrmRG8Pu8GnD77OdgSkNc48XHa9yg
         7sBg==
X-Gm-Message-State: AOJu0YwiPGnie2rGhl28QLToAn4acZBeLoQwGoatraP1yRbma3L4WGSK
	RtlOox/uVkggZYHSSKif1J3ihxveHRjHTaeo5PPqigJMRQdWHcPRkpGOOeC42VTd
X-Gm-Gg: ASbGncu4ly4vAKtSJyUtvvHPdCoPl0Wd9qGHX3hChoDLnq3X66iw4l59Xocb6M+nnnr
	3hZESvKTeihwcOJAtXQQn+0KEdHM71XkZIyxP0NBPn7uEfdOyqSIjR7naSKhX3JHU5z9FNpJaZQ
	2emY5vTdM6mesjvKMNe+7m0oYbYzFM93B8nOayxX9ww3Zg98GrLgtkk6Z6iaZx2Zi4KoGIzeITW
	MY3r2kJDiqNfvBG03tVQtyTtLVRsVRqdkb5gjbIcnKR330omhxTzdkG0n+re7nG8CMxwZf0YRVi
	H0BbQzBX73HUatjRp37SXTb37TyDR3oEHxQzLxMPWgPPGh7S3/qktSM8r+FH/CXquabRydNRapC
	cy7IRy3e8MNWYHjIBSL16I+dNdgMmuLrsBm8Fx/ctF9ltQPOv/rFXv7NX9qP+XjjEnPwM3eBoHE
	DQ9n9XOY+Tuz7dEg5QA1CEh+DXhoB+iu4ozYRtKIWd
X-Google-Smtp-Source: AGHT+IFjSih5vYjuDZ7hW8Yuk8ziD1VSQq76N01HoyoXK5Ts9qaDo1MX80ukLnKVzZ5k8r7bitlOCA==
X-Received: by 2002:a05:6a20:3d82:b0:240:20d:47ca with SMTP id adf61e73a8af0-243d6dd0165mr14789088637.10.1756766571698;
        Mon, 01 Sep 2025 15:42:51 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4beb72sm11648240b3a.61.2025.09.01.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:42:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 4/5] klibc: Upgrade to 2.0.14
Date: Mon,  1 Sep 2025 15:42:42 -0700
Message-ID: <20250901224244.1913647-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224244.1913647-1-raj.khem@gmail.com>
References: <20250901224244.1913647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 22:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119165

Backport couple of clang related fixes from upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-stdint.h-Fix-build-with-newer-clang.patch | 99 +++++++++++++++++++
 ...t_opts-Fix-the-mount_opts-str-length.patch | 41 ++++++++
 ...c-cross_2.0.13.bb => klcc-cross_2.0.14.bb} |  0
 ...2.0.13.bb => klibc-static-utils_2.0.14.bb} |  0
 ...-utils_2.0.13.bb => klibc-utils_2.0.14.bb} |  0
 .../recipes-devtools/klibc/klibc.inc          |  4 +-
 .../{klibc_2.0.13.bb => klibc_2.0.14.bb}      |  0
 7 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-stdint.h-Fix-build-with-newer-clang.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/0002-mount_opts-Fix-the-mount_opts-str-length.patch
 rename meta-initramfs/recipes-devtools/klibc/{klcc-cross_2.0.13.bb => klcc-cross_2.0.14.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-static-utils_2.0.13.bb => klibc-static-utils_2.0.14.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-utils_2.0.13.bb => klibc-utils_2.0.14.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc_2.0.13.bb => klibc_2.0.14.bb} (100%)

diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-stdint.h-Fix-build-with-newer-clang.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-stdint.h-Fix-build-with-newer-clang.patch
new file mode 100644
index 0000000000..82d02f9fb3
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-stdint.h-Fix-build-with-newer-clang.patch
@@ -0,0 +1,99 @@
+From 84bfb7a85900446e3cc96a103601052781627043 Mon Sep 17 00:00:00 2001
+From: Florent Revest <revest@chromium.org>
+Date: Mon, 14 Jul 2025 19:25:04 +0200
+Subject: [PATCH 1/2] stdint.h: Fix build with newer clang
+
+Recent versions of Clang introduced definitions for __*INT64_C:
+https://github.com/llvm/llvm-project/commit/33ad474c45e6d7a0de7bc75e15e27cf6cb9ff895
+
+This results in these build errors:
+
+usr/include/bits64/bitsize/stdint.h:27:9: error: '__INT64_C' macro redefined [-Werror,-Wmacro-redefined]
+   27 | #define __INT64_C(c)  c ## L
+      |         ^
+<built-in>:194:9: note: previous definition is here
+  194 | #define __INT64_C(c) c##L
+      |         ^
+
+Renaming these macros to something more unique avoids the errors.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=1d27e1732f1326eaf98f4624100f83232d843616]
+Signed-off-by: Florent Revest <revest@chromium.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/include/bits32/bitsize/stdint.h |  4 ++--
+ usr/include/bits64/bitsize/stdint.h |  4 ++--
+ usr/include/stdint.h                | 10 +++++-----
+ 3 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/usr/include/bits32/bitsize/stdint.h b/usr/include/bits32/bitsize/stdint.h
+index 8e444b6..147090b 100644
+--- a/usr/include/bits32/bitsize/stdint.h
++++ b/usr/include/bits32/bitsize/stdint.h
+@@ -24,8 +24,8 @@ typedef unsigned int		uint_fast32_t;
+ typedef int			intptr_t;
+ typedef unsigned int		uintptr_t;
+ 
+-#define __INT64_C(c)   c ## LL
+-#define __UINT64_C(c)  c ## ULL
++#define __KLIBC_INT64_C(c)   c ## LL
++#define __KLIBC_UINT64_C(c)  c ## ULL
+ 
+ #define __PRI64_RANK   "ll"
+ #define __PRIFAST_RANK ""
+diff --git a/usr/include/bits64/bitsize/stdint.h b/usr/include/bits64/bitsize/stdint.h
+index 988e639..5bc64bf 100644
+--- a/usr/include/bits64/bitsize/stdint.h
++++ b/usr/include/bits64/bitsize/stdint.h
+@@ -24,8 +24,8 @@ typedef unsigned long int	uint_fast32_t;
+ typedef long int		intptr_t;
+ typedef unsigned long int	uintptr_t;
+ 
+-#define __INT64_C(c)  c ## L
+-#define __UINT64_C(c) c ## UL
++#define __KLIBC_INT64_C(c)  c ## L
++#define __KLIBC_UINT64_C(c) c ## UL
+ 
+ #define __PRI64_RANK	"l"
+ #define __PRIFAST_RANK  "l"
+diff --git a/usr/include/stdint.h b/usr/include/stdint.h
+index f64f027..6cda583 100644
+--- a/usr/include/stdint.h
++++ b/usr/include/stdint.h
+@@ -31,17 +31,17 @@ typedef uint64_t	uintmax_t;
+ #define INT8_MIN	(-128)
+ #define INT16_MIN	(-32768)
+ #define INT32_MIN	(-2147483647-1)
+-#define INT64_MIN	(__INT64_C(-9223372036854775807)-1)
++#define INT64_MIN	(__KLIBC_INT64_C(-9223372036854775807)-1)
+ 
+ #define INT8_MAX	(127)
+ #define INT16_MAX	(32767)
+ #define INT32_MAX	(2147483647)
+-#define INT64_MAX	(__INT64_C(9223372036854775807))
++#define INT64_MAX	(__KLIBC_INT64_C(9223372036854775807))
+ 
+ #define UINT8_MAX	(255U)
+ #define UINT16_MAX	(65535U)
+ #define UINT32_MAX	(4294967295U)
+-#define UINT64_MAX	(__UINT64_C(18446744073709551615))
++#define UINT64_MAX	(__KLIBC_UINT64_C(18446744073709551615))
+ 
+ #define INT_LEAST8_MIN	INT8_MIN
+ #define INT_LEAST16_MIN	INT16_MIN
+@@ -80,12 +80,12 @@ typedef uint64_t	uintmax_t;
+ #define INT8_C(c)	c
+ #define INT16_C(c)	c
+ #define INT32_C(c)	c
+-#define INT64_C(c)	__INT64_C(c)
++#define INT64_C(c)	__KLIBC_INT64_C(c)
+ 
+ #define UINT8_C(c)	c ## U
+ #define UINT16_C(c)	c ## U
+ #define UINT32_C(c)	c ## U
+-#define UINT64_C(c)	__UINT64_C(c)
++#define UINT64_C(c)	__KLIBC_UINT64_C(c)
+ 
+ #define INT_LEAST8_C(c)	 INT8_C(c)
+ #define INT_LEAST16_C(c) INT16_C(c)
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0002-mount_opts-Fix-the-mount_opts-str-length.patch b/meta-initramfs/recipes-devtools/klibc/files/0002-mount_opts-Fix-the-mount_opts-str-length.patch
new file mode 100644
index 0000000000..ad1f7f03a8
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/0002-mount_opts-Fix-the-mount_opts-str-length.patch
@@ -0,0 +1,41 @@
+From eaecc37c86fff0ff951e1930abdb9e51364c2d14 Mon Sep 17 00:00:00 2001
+From: Florent Revest <revest@chromium.org>
+Date: Thu, 10 Jul 2025 19:39:11 +0200
+Subject: [PATCH 2/2] mount_opts: Fix the mount_opts str length
+
+Newer versions of LLVM report:
+
+usr/utils/mount_opts.c:20:3: error: initializer-string for character array is too long, array size is 8 but initializer has size 9 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Werror,-Wunterminated-string-initialization]
+   20 |         {"diratime", MS_NODIRATIME, 0, MS_NODIRATIME},
+      |          ^~~~~~~~~~
+
+This is indeed a bit odd. "diratime" is 9 bytes long with the \0
+terminator but placed into a struct that uses a static length of 8 bytes
+for that buffer. I suppose this can cause all sorts of undefined
+behaviors in theory but that in practice this never caused anything bad
+because the next field is an unsigned long containing 2048 so the upper
+bytes are 0 and act as string terminators by chance.
+
+Anyway, fixing this helps unblock builds with newer toolchains.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=f7d9399d1035d2a70067fa6995db7ea02ed0c311]
+Signed-off-by: Florent Revest <revest@chromium.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/utils/mount_opts.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/utils/mount_opts.h b/usr/utils/mount_opts.h
+index cf47cae..5195c88 100644
+--- a/usr/utils/mount_opts.h
++++ b/usr/utils/mount_opts.h
+@@ -2,7 +2,7 @@
+ #define UTILS_MOUNT_OPTS_H
+ 
+ struct mount_opts {
+-	const char str[8];
++	const char str[9];
+ 	unsigned long rwmask;
+ 	unsigned long rwset;
+ 	unsigned long rwnoset;
diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.13.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.14.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.13.bb
rename to meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.14.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.13.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.14.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.13.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.14.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.13.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.14.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.13.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.14.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 2af53b18e3..26d4ebc72c 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -20,6 +20,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
            file://cross-clang.patch \
            file://0001-workaround-for-overlapping-sections-in-binary.patch \
+           file://0001-stdint.h-Fix-build-with-newer-clang.patch \
+           file://0002-mount_opts-Fix-the-mount_opts-str-length.patch \
            "
 
 ARMPATCHES ?= ""
@@ -27,7 +29,7 @@ ARMPATCHES ?= ""
 ARMPATCHES:arm = " \
                   file://armv4-fix-v4bx.patch \
                  "
-SRC_URI[sha256sum] = "d673a294f742d59368222ff5c38462d81098c55063799de6fb8a7ba3d4af0436"
+SRC_URI[sha256sum] = "281bfb683e196818412af70b8968b7726475a80ff1c4bd67119e6bf5059f9075"
 
 S = "${UNPACKDIR}/klibc-${PV}"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.13.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.14.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc_2.0.13.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc_2.0.14.bb

