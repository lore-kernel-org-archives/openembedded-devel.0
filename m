Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1148D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 22:10:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3889.1764627000610473748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 14:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=diy7IMCA;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42e2ddb8a13so797689f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 14:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764626999; x=1765231799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dn16wKkgS8gTA9oF5wa+36OgzlC3gKqwEproFTGLEto=;
        b=diy7IMCAHhNiaPDkBRN3TF3N+IvClqRNaYPxvJ50JfxjKzZNfLlxG9Ai4LIK+tBBrC
         5o2ObHN5mviFbXLSTn4Dn5XG417nz6oZ/F5L7EJzeWrWcQw6lho+yQSUS7divXtcKk+m
         a8ZSr2aqwRDu5uoB5LVCKWPaa/qPy/S7ryty4RZaaZvSBBHFoSkwqFMMRV1opp8A2VhV
         d7aG46OBXKhdzZT/UtRItBVAecbmlGVsKAbYNfXjycF67sHB4mACDhtfNfeA0971CzHC
         WOykIAJKyvganILX1D5bozbq/PaIQ48dbVwRE0Aeng6wSjWTW2PC6j8gGe2S+/HZGGgR
         rrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764626999; x=1765231799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn16wKkgS8gTA9oF5wa+36OgzlC3gKqwEproFTGLEto=;
        b=RDPu5RrE4g+0qiGxLhNAjuxiWcYvPhz3BIrij+2AEPjO2CASxx25qq0sBLao8kp+nw
         oLOUeT2voHSSkVsm4OBzrVbS4LWEbEamG29xX7C/apMIGB74c366SMB18/Tz0eVG3rnW
         2JWQrK0IW7iiywGHTp8AlTgV+5h3yZ0HFfb3bgAuwE49YmzffAj5dHzmaI9Kc2wPbY66
         qSAGvvHtVTKzeFJost2Z7j/D6kozDEmAGvo3uVt5MSqDfrgsrfs/267eU3ALAqBczGum
         eA1mSgJm4aUyYARJsu+/uNvh3OUg24XwUEdYNNZqYc9gkHQNzinzk7W/xbefKi2KK42V
         xrPw==
X-Gm-Message-State: AOJu0YwBKQQ5LWvDrQvcdYe8Wm48HZmpTAYCnVBLtN3sFJOIQq/856rZ
	FJ/GRzhrhhX7REAKe0VPx1EGxpvKyPox3WcGg02qLnNcCssJxdCB+pPpEi/hcQ==
X-Gm-Gg: ASbGnctLMDNF7NO8BrW6sv9Zai5rZqFgw3QNaXHykq7cxi/3JGzp5w7guoiuV//MeDe
	F+6TFZqEjHBxphPeUksi2KHOAeWo8bjwfzpEcbQDD25bfEIcFuzlVSkdGxRIZl4gc7IoEpUvhL+
	3bJh8Q7fKuKbQZgqXaYxi90w0BTyclERkyrygVjVnqkx8HkzpKXkCQhNWP+B45Ni1VJwOlb6/WO
	RjkifQZFhajOpaLGKEyg0D32VP7fqPBDUQSVD8TbpGVz2bhWqCaYjWGdRJA8upicNgzYcxdiKek
	PpNP5EtNpn6JXL9FJl7TwVBv9WflRmHm5v00WQ0atR+l53ee4SH85KdpVujJO+NS0TUtUmUZVAZ
	rnEEWTfDR1NEPf/h9Ftxkxbxe5DARBmEf6I/XZnMvlEkvhDq67wjv8VuPwiiwHDiB5Y++xgb9Ty
	Z9h9nsP6sv
X-Google-Smtp-Source: AGHT+IEZ/pTKacpVe3fAsnr5XKOaH4KKoJKLVQh3BZMi/aX2NQwYK3KeEEUmqQ4hXO4SYgmkBZ/8Iw==
X-Received: by 2002:a05:6000:4201:b0:42b:3cdf:9b6c with SMTP id ffacd0b85a97d-42cc1bc32b4mr47459710f8f.22.1764626998639;
        Mon, 01 Dec 2025 14:09:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1caa7406sm27519435f8f.37.2025.12.01.14.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 14:09:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Yogesh Tyagi <yogesh.tyagi@intel.com>
Subject: [meta-oe][PATCH v2] yasm: drop recipe
Date: Mon,  1 Dec 2025 23:09:57 +0100
Message-ID: <20251201220957.2629951-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 22:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122221

Yasm was introduced as a rewrite of nasm, however its commits
have dried up over the years, while its unmitigated CVEs keep
piling up. Also, nasm is a healthier project with regular
contributions still.

There are no known recipes depending on yasm.

Let's remove it.

Cc: Ross Burton <ross.burton@arm.com>
Cc: Yogesh Tyagi <yogesh.tyagi@intel.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: added Yogesh Tyagi on Cc, as the maintainer of meta-intel

 .../0001-bitvect-fix-build-with-gcc-15.patch  | 38 -----------------
 ...-Set-build-date-to-SOURCE_DATE_EPOCH.patch | 37 ----------------
 ...m-Use-BUILD_DATE-for-reproducibility.patch | 42 -------------------
 .../yasm/yasm/CVE-2021-33456.patch            | 35 ----------------
 .../yasm/yasm/CVE-2021-33464.patch            | 34 ---------------
 .../yasm/yasm/CVE-2023-29579.patch            | 39 -----------------
 meta-oe/recipes-devtools/yasm/yasm_git.bb     | 40 ------------------
 7 files changed, 265 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.patch
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
 delete mode 100644 meta-oe/recipes-devtools/yasm/yasm_git.bb

diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.patch
deleted file mode 100644
index f3f2c431d5..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 64ef740eb262f329e55eebadf2ce276b146d44e9 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Tue, 22 Apr 2025 19:06:24 +0200
-Subject: [PATCH] bitvect: fix build with gcc-15
-
-* fixes:
-libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeration constant
-   86 |         typedef enum boolean { false = FALSE, true = TRUE } boolean;
-      |                                ^~~~~
-../git/libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=c23' onwards
-
-as suggested in:
-https://github.com/yasm/yasm/issues/283#issuecomment-2661108816
-
-Upstream-Status: Submitted [https://github.com/yasm/yasm/pull/287]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- libyasm/bitvect.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/libyasm/bitvect.h b/libyasm/bitvect.h
-index 3aee3a53..a13470ad 100644
---- a/libyasm/bitvect.h
-+++ b/libyasm/bitvect.h
-@@ -83,7 +83,11 @@ typedef  Z_longword         *Z_longwordptr;
-     #ifdef MACOS_TRADITIONAL
-         #define boolean Boolean
-     #else
--        typedef enum boolean { false = FALSE, true = TRUE } boolean;
-+        #if __STDC_VERSION__ < 202311L
-+             typedef enum boolean { false = FALSE, true = TRUE } boolean;
-+        #else
-+             typedef bool boolean;
-+        #endif
-     #endif
- #endif
- 
diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch
deleted file mode 100644
index 42f5559e3f..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From eb164bb201c0f792fa8aa78270c47294065183a3 Mon Sep 17 00:00:00 2001
-From: Oleh Matiusha <omatiush@cisco.com>
-Date: Tue, 6 Feb 2024 09:33:11 +0000
-Subject: [PATCH 1/2] yasm: Set build date to SOURCE_DATE_EPOCH
-
-If SOURCE_DATE_EPOCH is set, use it to generate a reproducible
-string for BUILD_DATE.
-
-Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
-
-Upstream-Status: Pending
----
- configure.ac | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 2823ecd..eeb51ce 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -103,6 +103,14 @@ AM_WITH_DMALLOC
- #
- AC_CHECK_HEADERS([strings.h libgen.h unistd.h direct.h sys/stat.h])
- 
-+# Use reproducible build date and time
-+if test "$SOURCE_DATE_EPOCH"; then
-+	DATE_FMT="%d %b %Y %H:%M:%S"
-+	BUILD_DATE=$(LC_ALL=C date -u -d "@$SOURCE_DATE_EPOCH" "+$DATE_FMT")
-+	AC_DEFINE_UNQUOTED([BUILD_DATE], ["$BUILD_DATE"], [Use reproducidle build date])
-+fi
-+
-+
- #
- # Checks for typedefs, structures, and compiler characteristics.
- #
--- 
-2.33.0
-
diff --git a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch b/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch
deleted file mode 100644
index 4b9c933d01..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 19fffab74a201dc41c3da7e74d86eafa8f68bbc6 Mon Sep 17 00:00:00 2001
-From: Oleh Matiusha <omatiush@cisco.com>
-Date: Tue, 6 Feb 2024 09:34:26 +0000
-Subject: [PATCH] yasm: Use BUILD_DATE for reproducibility
-
-Use reproducible build date instead of compilation time and date.
-
-Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
-
-
-Upstream-Status: Pending
----
- tools/re2c/parser.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/tools/re2c/parser.c b/tools/re2c/parser.c
-index 02d5c66..1c90aee 100644
---- a/tools/re2c/parser.c
-+++ b/tools/re2c/parser.c
-@@ -5,6 +5,7 @@
- #include "tools/re2c/globals.h"
- #include "tools/re2c/parse.h"
- #include "tools/re2c/parser.h"
-+#include "config.h"
- 
- int yylex(void);
- static RegExp *parse_expr(void);
-@@ -233,7 +234,11 @@ void parse(FILE *i, FILE *o){
-     peektok = NONE;
- 
-     fputs("/* Generated by re2c 0.9.1-C on ", o);
-+#ifndef BUILD_DATE
-     fprintf(o, "%-24s", ctime(&now));
-+#else
-+    fprintf(o, "%-24s", BUILD_DATE " ");
-+#endif
-     fputs(" */\n", o); oline+=2;
- 
-     in = Scanner_new(i);
--- 
-2.33.0
-
diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
deleted file mode 100644
index 2340d8ed75..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1126140b8f5ece18c58640725f0e4c08e5ec97b0 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sat, 15 Nov 2025 13:34:15 +0100
-Subject: [PATCH] A potential null pointer difference is that the return value
- of the hash may be null. This fixes CVE-2021-33456.
-
-From: lixuebing <lixuebing@cqsoftware.com.cn>
-Date: Mon, 25 Aug 2025 13:51:28 +0800
-Subject: Fix null-pointer-dereference in hash
-Bug: https://github.com/yasm/yasm/issues/175
-Origin: https://github.com/yasm/yasm/pull/290
-
-CVE: CVE-2021-33456
-Upstream-Status: Submitted [https://github.com/yasm/yasm/pull/290]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- modules/preprocs/nasm/nasm-pp.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nasm-pp.c
-index f9f92dd1..473d98c1 100644
---- a/modules/preprocs/nasm/nasm-pp.c
-+++ b/modules/preprocs/nasm/nasm-pp.c
-@@ -1102,6 +1102,10 @@ hash(char *s)
- {
-     unsigned int h = 0;
-     unsigned int i = 0;
-+    /* Check if the input string is NULL to avoid null pointer dereference */
-+    if (s == NULL) {
-+        return 0;
-+    }
-     /*
-      * Powers of three, mod 31.
-      */
diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
deleted file mode 100644
index ebae250ff9..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3c3f968d48d768c1e355199d4067d99cb72abc26 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sat, 15 Nov 2025 13:30:12 +0100
-Subject: [PATCH] Handle file descriptors with nonexisting env names better. 
- Avoid writing past allocated memory.
-
-This fixes CVE-2021-33464.
-Author: Petter Reinholdtsen <pere@debian.org>
-Bug: https://github.com/yasm/yasm/issues/164
-Bug-Debian: https://bugs.debian.org/1016353
-Forwarded: https://github.com/yasm/yasm/issues/164
-Last-Update: 2025-04-30
-
-CVE: CVE-2021-33464
-Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/164]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- modules/preprocs/nasm/nasm-pp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nasm-pp.c
-index 512f02c3..f9f92dd1 100644
---- a/modules/preprocs/nasm/nasm-pp.c
-+++ b/modules/preprocs/nasm/nasm-pp.c
-@@ -1815,7 +1815,7 @@ inc_fopen(char *file, char **newname)
-             error(ERR_WARNING, "environment variable `%s' does not exist",
-                   p1+1);
-             *p2 = '%';
--            p1 = p2+1;
-+            pb = p1 = p2+1;
-             continue;
-         }
-         /* need to expand */
diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
deleted file mode 100644
index 58b4ed1996..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 81c1b7b0a28f052eaadddcb010944bf67e6ae257 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sat, 15 Nov 2025 13:24:21 +0100
-Subject: [PATCH] Make sure CPU feature parsing use large enough string buffer.
-  Fixes CVE-2023-29579.
-
-Author: Petter Reinholdtsen <pere@debian.org>
-Bug: https://github.com/yasm/yasm/issues/214
-Bug-Debian: https://bugs.debian.org/1035951
-Forwarded:  https://github.com/yasm/yasm/issues/214
-Last-Update: 2025-04-30
-
-This patch is taken from Debian:
-https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/
-
-CVE: CVE-2023-29579
-Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/214]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- modules/arch/x86/x86arch.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/modules/arch/x86/x86arch.c b/modules/arch/x86/x86arch.c
-index bac11774..58327958 100644
---- a/modules/arch/x86/x86arch.c
-+++ b/modules/arch/x86/x86arch.c
-@@ -165,8 +165,9 @@ x86_dir_cpu(yasm_object *object, yasm_valparamhead *valparams,
-                 yasm_error_set(YASM_ERROR_SYNTAX,
-                                N_("invalid argument to [%s]"), "CPU");
-             else {
--                char strcpu[16];
--                sprintf(strcpu, "%lu", yasm_intnum_get_uint(intcpu));
-+                char strcpu[21]; /* 21 = ceil(log10(LONG_MAX)+1) */
-+                assert(8*sizeof(unsigned long) <= 64);
-+                snprintf(strcpu, sizeof(strcpu), "%lu", yasm_intnum_get_uint(intcpu));
-                 yasm_x86__parse_cpu(arch_x86, strcpu, strlen(strcpu));
-             }
-         } else
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
deleted file mode 100644
index 6ddd94621a..0000000000
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
-LICENSE = "MIT"
-HOMEPAGE = "http://www.tortall.net/projects/yasm/"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
-
-DEPENDS += "flex-native bison-native"
-PACKAGECONFIG[docs] = ",,xmlto-native,"
-
-PV = "1.3.0+git"
-# v1.3.0-87
-SRCREV = "121ab150b3577b666c79a79f4a511798d7ad2432"
-SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
-           file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
-           file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
-           file://0001-bitvect-fix-build-with-gcc-15.patch \
-           file://CVE-2023-29579.patch \
-           file://CVE-2021-33464.patch \
-           file://CVE-2021-33456.patch \
-           "
-
-
-inherit autotools gettext python3native
-
-CACHED_CONFIGUREVARS = "CCLD_FOR_BUILD='${CC_FOR_BUILD}'"
-
-BBCLASSEXTEND = "native"
-
-PARALLEL_MAKE = ""
-
-do_configure:prepend() {
-     # Don't include $CC (which includes path to sysroot) in generated header.
-     sed -i -e "s/^echo \"\/\* generated \$ac_cv_stdint_message \*\/\" >>\$ac_stdint$"// ${S}/m4/ax_create_stdint_h.m4
-}
-
-CVE_STATUS_GROUPS += "CVE_STATUS_HASH_UPDATE"
-CVE_STATUS_HASH_UPDATE = "CVE-2021-33454 CVE-2023-31975 CVE-2023-37732"
-CVE_STATUS_HASH_UPDATE[status] = "fixed-version: patched in current git hash"
-
-CVE_PRODUCT += "tortall:yasm yasm_project:yasm"

