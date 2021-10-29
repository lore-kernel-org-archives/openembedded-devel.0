Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2B4C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 10:25:09 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.3557.1635503108394445155
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 03:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=CV20JG70;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.172, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f172.google.com with SMTP id e2so16045680ljg.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z7+ivMSuR31qcePCyQyR81pB2q+3VCZVbgT/XW9g0r4=;
        b=CV20JG70I79T7rq1qSEyO1G7YfF9rDLFSArGqNYa6fwXplRwEMB9cOjQcurtkc72zC
         54zqp+QVOcBycgs7ECjOggOP9oLDnepjdxGKpkhbN5gGuhs7Flr/0sKaVDQl+pd1Klbt
         Cvd0qru4iVdK3fyR48wNTTBl0FQKwTnt7dgWJ+MFtEvWj8EhJvtZZo4lNBsVynUWxMN8
         EX7ic33PbHLF+Fu7XbPc5pWzXlKLspIhGMqg1vCND7TORpXM0ijY3JBN64QWDXViG4ib
         t3hZdbi2pFSlBYRJd51Yqsre3q+P0fJB0m5CsCqz4AKxVzgNjlBL0IgvvuuaWLrG8/i8
         FEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z7+ivMSuR31qcePCyQyR81pB2q+3VCZVbgT/XW9g0r4=;
        b=B/YcLTktAoSH2vJvE447suAz+vRBFC9p9/9sR2ZV7xYO6rWOIIZ+nXpQtd7OoQZd/X
         wP3XOw/ji5IlvZhfdUbChSlR/P3P1XQgCkNMgxaTArw3Wyn80oEQu/oH+w06b8nVfBdN
         zxpFkzBBdIXZMzq8Z8TCbIYNH+ZxdD29/oWpMGVoxWzwBw8W4JB8SS4I3v0lW9am78/0
         a262tLATJhuWaVBmyer1h0f2o7/Sp5omfPObny0Bh6zE6xX8lwN8NYEhQfdIfOOgLG9X
         yecFGNBJ8Yh/mKd7TzAY+w5hmbkFFnx6hNcBnWv2SUyf8UwuuapEGdp/HfdOqFiRHvov
         U9uQ==
X-Gm-Message-State: AOAM5325BnYbbiW9XuRJB2FuV6TwdAWS1EIvdMmf2+HoiBOZ+vVg8iZR
	mPrJWAdx7x/EMJ47ot/ZHVpCikWKxaBVyzAK
X-Google-Smtp-Source: 
 ABdhPJy7oReLDnuY+6i0514oJuNyKYAs2V31qqBXRJJav3VCH/flxjfHRxEChaspKCr/c13QqCpfRQ==
X-Received: by 2002:a2e:8ece:: with SMTP id
 e14mr11213795ljl.176.1635503105706;
        Fri, 29 Oct 2021 03:25:05 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 f15sm567875lfu.104.2021.10.29.03.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 03:25:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] liburing: update to 2.1
Date: Fri, 29 Oct 2021 12:25:03 +0200
Message-Id: <20211029102503.2142727-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 10:25:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93651

Removed upstreamed patcches.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...es-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch | 37 -------------
 ...ility-issue-when-using-__NR_mmap-sys.patch | 53 -------------------
 .../{liburing_2.0.bb => liburing_2.1.bb}      |  7 +--
 3 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch
 rename meta-oe/recipes-support/liburing/{liburing_2.0.bb => liburing_2.1.bb} (83%)

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch b/meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch
deleted file mode 100644
index a2ba66c3a..000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a30d62dfb9ea30af58ef331fae1e6f727d0558c0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 4 May 2021 10:32:08 -0700
-Subject: [PATCH] examples/ucontext-cp.c: Do not use SIGSTKSZ
-
-glibc 2.34 has removed SIGSTKSZ therefore we replace it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- examples/ucontext-cp.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
---- a/examples/ucontext-cp.c
-+++ b/examples/ucontext-cp.c
-@@ -3,6 +3,7 @@
-  * gcc -Wall -O2 -D_GNU_SOURCE -o ucontext-cp ucontext-cp.c -luring
-  */
- #define _POSIX_C_SOURCE 199309L
-+#include <stddef.h>
- #include <stdio.h>
- #include <fcntl.h>
- #include <string.h>
-@@ -22,13 +23,9 @@
- #define QD	64
- #define BS	1024
- 
--#ifndef SIGSTKSZ
--#define SIGSTKSZ 8192
--#endif
--
- typedef struct {
- 	struct io_uring *ring;
--	unsigned char stack_buf[SIGSTKSZ];
-+	max_align_t stack_buf[(8 * 1024 + sizeof (max_align_t) - 1) / sizeof (max_align_t)];
- 	ucontext_t ctx_main, ctx_fnew;
- } async_context;
- 
diff --git a/meta-oe/recipes-support/liburing/liburing/0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch b/meta-oe/recipes-support/liburing/liburing/0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch
deleted file mode 100644
index f2f03c18b..000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2d3940163e14d183fddc4d8b24cc1d3865bba0b3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 May 2021 09:36:36 -0700
-Subject: [PATCH] tests: fix portability issue when using __NR_mmap syscall
-
-On some architectures e.g. ARM and RISCV32, __NR_mmap does not exist and
-libc will then use NR_mmap2 to implement mmap() API, therefore use
-system C library mmap() API instead of calling the syscall directly
-
-Upstream-Status: Partial Backport [https://github.com/axboe/liburing/commit/808b6c72ab753bda0c300b5683cfd31750d1d49b]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/double-poll-crash.c   | 6 +++---
- test/sqpoll-disable-exit.c | 6 +++---
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/test/double-poll-crash.c b/test/double-poll-crash.c
-index 1a219c7..6e08285 100644
---- a/test/double-poll-crash.c
-+++ b/test/double-poll-crash.c
-@@ -150,9 +150,9 @@ int main(int argc, char *argv[])
-   if (argc > 1)
-     return 0;
- 
--  syscall(__NR_mmap, 0x1ffff000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
--  syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
--  syscall(__NR_mmap, 0x21000000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
-+  mmap((void *) 0x1ffff000, (size_t) 0x1000, PROT_NONE, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-+  mmap((void *) 0x20000000, (size_t) 0x1000000,  PROT_READ | PROT_WRITE | PROT_EXEC, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-+  mmap((void *) 0x21000000, (size_t) 0x1000, PROT_NONE, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-   intptr_t res = 0;
-   *(uint32_t*)0x20000484 = 0;
-   *(uint32_t*)0x20000488 = 0;
-diff --git a/test/sqpoll-disable-exit.c b/test/sqpoll-disable-exit.c
-index d4e17f8..a0d00cc 100644
---- a/test/sqpoll-disable-exit.c
-+++ b/test/sqpoll-disable-exit.c
-@@ -223,9 +223,9 @@ void execute_one(void)
- }
- int main(void)
- {
--  syscall(__NR_mmap, 0x1ffff000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
--  syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
--  syscall(__NR_mmap, 0x21000000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
-+  mmap((void *) 0x1ffff000, (size_t) 0x1000, PROT_NONE, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-+  mmap((void *) 0x20000000, (size_t) 0x1000000,  PROT_READ | PROT_WRITE | PROT_EXEC, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-+  mmap((void *) 0x21000000, (size_t) 0x1000, PROT_NONE, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-   loop();
-   return 0;
- }
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-support/liburing/liburing_2.0.bb b/meta-oe/recipes-support/liburing/liburing_2.1.bb
similarity index 83%
rename from meta-oe/recipes-support/liburing/liburing_2.0.bb
rename to meta-oe/recipes-support/liburing/liburing_2.1.bb
index 7a903e5d4..b4f0b11f4 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.0.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.1.bb
@@ -9,14 +9,11 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
 
-SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
-           file://0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch \
-           file://0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch \
-           "
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
 SRC_URI:append:libc-musl:riscv64 = " file://0001-do-not-build-examples.patch "
 SRC_URI:append:libc-musl:riscv32 = " file://0001-do-not-build-examples.patch "
+SRCREV = "41a61c97c2e3df4475c93fdf5026d575ce3f1377"
 
-SRCREV = "b013dfd5a5f65116373d5e0f0bdfb73db9d8816e"
 S = "${WORKDIR}/git"
 
 DEPENDS:append:libc-musl = " libucontext"
-- 
2.25.1


