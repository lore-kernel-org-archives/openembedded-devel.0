Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.9638.1620150447666724294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 May 2021 10:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vZzo7Kgg;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id m11so8516640pfc.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 May 2021 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=54633lbSljnOMUjzOaTR6P3P3YCofDoFFz0NLV/Mlbo=;
        b=vZzo7Kgg29PC6bSpG951QM1UdwA5e9DKh2Lo4ydxVyHzMa5sOT7s9CJw5+myx68kaS
         QsuQFq4YMQb7JWWScCPTeMr+8xI9s3nbFyuKVbY31qJ8K0Nl5kPjiJlS28wuryZhg08w
         F/o9O55sDhvqIJ5NllCAkFIhEDgybMZQiQQp8H4IALcXwhQUtoRuMgqPB7YvCOgd4iAf
         BrdgCYCQsQRB8cgbNzq5m0hsSDs8J918Ll95MVm47GP9e9DfwvaQasrPF+3PwPdD0LfT
         ViLAqHPdS4Sa8Kn0pZ2yyhAwxVzVFg6DVVOkP/Xkyhw0UHcUH/HtSRAA8sQaSrsmqMLU
         wuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=54633lbSljnOMUjzOaTR6P3P3YCofDoFFz0NLV/Mlbo=;
        b=Z3a6vexGdP263QDxVUqJNSPfzg8QygUsBM1y2+ooWxRp4B2xTd6zmVQld6ny4KcfJU
         +cwlbRbvPrI7YVS6aonN6tsiIW59/NlRpqYhUFh2lLjya8qDBfanH4+1VVPh8ALgs7bt
         OxIMEEr33fXv4zebNEkn57db1sh3U5/+BDeCx8G4NrKu9ML6xUt4B0tZTYt/xtQ9qWlZ
         +i5v+SjbUXAh65NSQSNo2SO2Fl7zNOJ7LeXNtNs2JGQvMzA16srUEn1SASyMyy59F4Zv
         Wqf++COIQuWawnLxmiyQsfCUoyhjX28udmsZBLqBMm//Rp60v7Q2vIL3Kxv+Dvlemwtc
         nWcA==
X-Gm-Message-State: AOAM533FR2cIlkWyB39uOiX1mUS6cIejsdpTGZAzPQR4eCmTry5ZT9FK
	N04XQLekL3V2ov+tJPRuLxJjTVF8MNpL1w==
X-Google-Smtp-Source: ABdhPJyCOa41zIbrnUpGJZGJVdUPEiFlBwWMzUoo+tlCx6oExOXLalzLqvZHHgBcLKxp2wrehxXQlg==
X-Received: by 2002:a17:90b:e98:: with SMTP id fv24mr6662461pjb.216.1620150446742;
        Tue, 04 May 2021 10:47:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id z16sm4435063pjq.42.2021.05.04.10.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 10:47:26 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] liburing: Upgrade to 2.0
Date: Tue,  4 May 2021 10:47:24 -0700
Message-Id: <20210504174724.2740885-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove upstreamed 0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch
Fix for removal of SIGSTKSZ
Forward remaining patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../liburing/0001-do-not-build-examples.patch | 10 +++---
 ...es-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch | 29 +++++++++++++++
 ...n-32bit-architectures-with-6bit-time.patch | 35 -------------------
 .../{liburing_0.7.bb => liburing_2.0.bb}      |  4 +--
 4 files changed, 36 insertions(+), 42 deletions(-)
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch
 rename meta-oe/recipes-support/liburing/{liburing_0.7.bb => liburing_2.0.bb} (90%)

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch b/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch
index 19bf14708b..03ab075314 100644
--- a/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch
+++ b/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch
@@ -1,4 +1,4 @@
-From 3ee2f1e231bde18a99f86da747a9b8feca3c179d Mon Sep 17 00:00:00 2001
+From 653c39b0b30b2a329db5041e558cfc97c03d6bfb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 17 Feb 2021 19:18:16 -0800
 Subject: [PATCH] do not build examples
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 948e004..8b63024 100644
+index 5d9c4dc..53e1615 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -11,7 +11,6 @@ default: all
@@ -23,8 +23,8 @@ index 948e004..8b63024 100644
  	@$(MAKE) -C test
 -	@$(MAKE) -C examples
  
- partcheck: all
- 	@echo "make partcheck => TODO add tests with out kernel support"
+ .PHONY: all install default clean test
+ .PHONY: FORCE cscope
 -- 
-2.30.1
+2.31.1
 
diff --git a/meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch b/meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch
new file mode 100644
index 0000000000..4efd2ecbec
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch
@@ -0,0 +1,29 @@
+From a30d62dfb9ea30af58ef331fae1e6f727d0558c0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 4 May 2021 10:32:08 -0700
+Subject: [PATCH] examples/ucontext-cp.c: Do not use SIGSTKSZ
+
+glibc 2.34 has removed SIGSTKSZ therefore we replace it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ examples/ucontext-cp.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+--- a/examples/ucontext-cp.c
++++ b/examples/ucontext-cp.c
+@@ -22,13 +22,9 @@
+ #define QD	64
+ #define BS	1024
+ 
+-#ifndef SIGSTKSZ
+-#define SIGSTKSZ 8192
+-#endif
+-
+ typedef struct {
+ 	struct io_uring *ring;
+-	unsigned char stack_buf[SIGSTKSZ];
++	max_align_t stack_buf[(8 * 1024 + sizeof (max_align_t) - 1) / sizeof (max_align_t)];
+ 	ucontext_t ctx_main, ctx_fnew;
+ } async_context;
+ 
diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch
deleted file mode 100644
index 01c5ccd53a..0000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0a9b12eda0f6e487398dad004121bdd1be792428 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 14 Nov 2020 16:18:44 -0800
-Subject: [PATCH] test: Fix build on 32bit architectures with 6bit time_t
-
-It uses SYS_futex, which it expects from system C library.
-in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
-rv32 is using 64bit time_t from get go unlike other 32bit architectures
-in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
-this aliases it to NR_futex so that SYS_futex is then defined for rv32
-
-Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/237]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/35fa71a030ca-test.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/test/35fa71a030ca-test.c b/test/35fa71a030ca-test.c
-index 4ecf211..7f2124b 100644
---- a/test/35fa71a030ca-test.c
-+++ b/test/35fa71a030ca-test.c
-@@ -24,6 +24,10 @@
- 
- #include <linux/futex.h>
- 
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+# define SYS_futex SYS_futex_time64
-+#endif
-+
- static void sleep_ms(uint64_t ms)
- {
-   usleep(ms * 1000);
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-support/liburing/liburing_0.7.bb b/meta-oe/recipes-support/liburing/liburing_2.0.bb
similarity index 90%
rename from meta-oe/recipes-support/liburing/liburing_0.7.bb
rename to meta-oe/recipes-support/liburing/liburing_2.0.bb
index d79389a696..4777b4cef0 100644
--- a/meta-oe/recipes-support/liburing/liburing_0.7.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.0.bb
@@ -10,12 +10,12 @@ LICENSE = "LGPLv2.1 | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
 
 SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
-           file://0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch \
+           file://0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch \
            "
 SRC_URI_append_libc-musl_riscv64 = " file://0001-do-not-build-examples.patch "
 SRC_URI_append_libc-musl_riscv32 = " file://0001-do-not-build-examples.patch "
 
-SRCREV = "45f0735219a615ae848033c47c7e2d85d101d43e"
+SRCREV = "b013dfd5a5f65116373d5e0f0bdfb73db9d8816e"
 S = "${WORKDIR}/git"
 
 DEPENDS_append_libc-musl = " libucontext"
-- 
2.31.1

