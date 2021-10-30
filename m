Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81965C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 07:39:17 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.16286.1635579556281177338
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 00:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=otzjX5sx;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id r15so11666237qkp.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 00:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eRLMrfG3Z7olHmkr7JzhSLXSRLekwNukm7qnvO0VkWw=;
        b=otzjX5sxXgeFyMNWxYGydAyIk/HavK/QZn2uu/ZD8fO4QBI9j9etpGtAltHXJt65+u
         7yxwI+f+0+bUs0pWQFmRq2kZcxI/8m3Qd+ZznxIMXFQRtEReLTcTJMv+ol29iEMp3Wdg
         uTArdpDeAImfapOtMyZts+qLFseOqwIkK5dRD4YGRozcWU7zoS4kR05VE+xFOCGysasy
         qQQYY34RX3GXoWYMRwvLe/GplukUHajuzTTt/xhAQY+S1O8b2xgH5eyNrtp1N7pu1rFv
         7byPLtgBX8Mdzbi6ymYC+pY4B4o8MqyVi0MS/Fu1iKkb8+n4lKkHP7iXZtagPEWtZAs6
         DVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eRLMrfG3Z7olHmkr7JzhSLXSRLekwNukm7qnvO0VkWw=;
        b=AvG9ZA60m9YmfCNZjIBQJ7zfZhAii4iYkvWkKOy+CmVXn57CrHpeqa8qcR6bF0SFz0
         w6vhOAcSX8TGpiQ0S4xjyCRhzAEiwpH7fnvnqXspKc8mqClpSeg0Fzq7VNpuZidBMX5r
         0WXOiVwcSgPhmEWK4m3/uvMWbpFPYIEcLvFHKh781YxJL/PfZPx6NGETKAuadcrygVvs
         mtM+iWmwyepOYeFQ6DeL2aW1meegi6CIMcOb74/nxHXvfP9B2ROa+FetL8hOBw/8GOpH
         XbvHcC5GsMMBTnfXGKPtvbJPFpMi85uKMkg5KrAa/5ueEadUqt7HzULldNwUxpMhLODP
         mJxw==
X-Gm-Message-State: AOAM532geGFxRw8SKOhtYlmtcavSJfLpUKzsItVyuQZ6g3k8JFEWJo7L
	e68mw14v4t8pF5FAVXMjZpqCBavVjCERC/EHAcw=
X-Google-Smtp-Source: 
 ABdhPJwKttP3ya/5kw4PhmOXkgBUYBm0NDSdLGJaJtVG4X/QvTOLqwuhDnFe04QsSzlRqrQJ88cgGqYpGGdwPUWyobw=
X-Received: by 2002:ae9:e108:: with SMTP id g8mr12687230qkm.98.1635579555238;
 Sat, 30 Oct 2021 00:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211029102503.2142727-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211029102503.2142727-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Oct 2021 00:38:49 -0700
Message-ID: 
 <CAMKF1sqM_+e8v9h2usbjXGzSApRApMR=V9tfjJ3JOKDPSkJqnw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] liburing: update to 2.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 07:39:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93655

seeing this https://errors.yoctoproject.org/Errors/Details/615582/

On Fri, Oct 29, 2021 at 3:25 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Removed upstreamed patcches.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...es-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch | 37 -------------
>  ...ility-issue-when-using-__NR_mmap-sys.patch | 53 -------------------
>  .../{liburing_2.0.bb => liburing_2.1.bb}      |  7 +--
>  3 files changed, 2 insertions(+), 95 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch
>  delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch
>  rename meta-oe/recipes-support/liburing/{liburing_2.0.bb => liburing_2.1.bb} (83%)
>
> diff --git a/meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch b/meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch
> deleted file mode 100644
> index a2ba66c3a..000000000
> --- a/meta-oe/recipes-support/liburing/liburing/0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From a30d62dfb9ea30af58ef331fae1e6f727d0558c0 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 4 May 2021 10:32:08 -0700
> -Subject: [PATCH] examples/ucontext-cp.c: Do not use SIGSTKSZ
> -
> -glibc 2.34 has removed SIGSTKSZ therefore we replace it
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - examples/ucontext-cp.c | 6 +-----
> - 1 file changed, 1 insertion(+), 5 deletions(-)
> -
> ---- a/examples/ucontext-cp.c
> -+++ b/examples/ucontext-cp.c
> -@@ -3,6 +3,7 @@
> -  * gcc -Wall -O2 -D_GNU_SOURCE -o ucontext-cp ucontext-cp.c -luring
> -  */
> - #define _POSIX_C_SOURCE 199309L
> -+#include <stddef.h>
> - #include <stdio.h>
> - #include <fcntl.h>
> - #include <string.h>
> -@@ -22,13 +23,9 @@
> - #define QD    64
> - #define BS    1024
> -
> --#ifndef SIGSTKSZ
> --#define SIGSTKSZ 8192
> --#endif
> --
> - typedef struct {
> -       struct io_uring *ring;
> --      unsigned char stack_buf[SIGSTKSZ];
> -+      max_align_t stack_buf[(8 * 1024 + sizeof (max_align_t) - 1) / sizeof (max_align_t)];
> -       ucontext_t ctx_main, ctx_fnew;
> - } async_context;
> -
> diff --git a/meta-oe/recipes-support/liburing/liburing/0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch b/meta-oe/recipes-support/liburing/liburing/0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch
> deleted file mode 100644
> index f2f03c18b..000000000
> --- a/meta-oe/recipes-support/liburing/liburing/0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 2d3940163e14d183fddc4d8b24cc1d3865bba0b3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 5 May 2021 09:36:36 -0700
> -Subject: [PATCH] tests: fix portability issue when using __NR_mmap syscall
> -
> -On some architectures e.g. ARM and RISCV32, __NR_mmap does not exist and
> -libc will then use NR_mmap2 to implement mmap() API, therefore use
> -system C library mmap() API instead of calling the syscall directly
> -
> -Upstream-Status: Partial Backport [https://github.com/axboe/liburing/commit/808b6c72ab753bda0c300b5683cfd31750d1d49b]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - test/double-poll-crash.c   | 6 +++---
> - test/sqpoll-disable-exit.c | 6 +++---
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/test/double-poll-crash.c b/test/double-poll-crash.c
> -index 1a219c7..6e08285 100644
> ---- a/test/double-poll-crash.c
> -+++ b/test/double-poll-crash.c
> -@@ -150,9 +150,9 @@ int main(int argc, char *argv[])
> -   if (argc > 1)
> -     return 0;
> -
> --  syscall(__NR_mmap, 0x1ffff000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
> --  syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
> --  syscall(__NR_mmap, 0x21000000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
> -+  mmap((void *) 0x1ffff000, (size_t) 0x1000, PROT_NONE, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -+  mmap((void *) 0x20000000, (size_t) 0x1000000,  PROT_READ | PROT_WRITE | PROT_EXEC, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -+  mmap((void *) 0x21000000, (size_t) 0x1000, PROT_NONE, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -   intptr_t res = 0;
> -   *(uint32_t*)0x20000484 = 0;
> -   *(uint32_t*)0x20000488 = 0;
> -diff --git a/test/sqpoll-disable-exit.c b/test/sqpoll-disable-exit.c
> -index d4e17f8..a0d00cc 100644
> ---- a/test/sqpoll-disable-exit.c
> -+++ b/test/sqpoll-disable-exit.c
> -@@ -223,9 +223,9 @@ void execute_one(void)
> - }
> - int main(void)
> - {
> --  syscall(__NR_mmap, 0x1ffff000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
> --  syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
> --  syscall(__NR_mmap, 0x21000000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
> -+  mmap((void *) 0x1ffff000, (size_t) 0x1000, PROT_NONE, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -+  mmap((void *) 0x20000000, (size_t) 0x1000000,  PROT_READ | PROT_WRITE | PROT_EXEC, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -+  mmap((void *) 0x21000000, (size_t) 0x1000, PROT_NONE, MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -   loop();
> -   return 0;
> - }
> ---
> -2.31.1
> -
> diff --git a/meta-oe/recipes-support/liburing/liburing_2.0.bb b/meta-oe/recipes-support/liburing/liburing_2.1.bb
> similarity index 83%
> rename from meta-oe/recipes-support/liburing/liburing_2.0.bb
> rename to meta-oe/recipes-support/liburing/liburing_2.1.bb
> index 7a903e5d4..b4f0b11f4 100644
> --- a/meta-oe/recipes-support/liburing/liburing_2.0.bb
> +++ b/meta-oe/recipes-support/liburing/liburing_2.1.bb
> @@ -9,14 +9,11 @@ SECTION = "libs"
>  LICENSE = "LGPLv2.1 | MIT"
>  LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
>
> -SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
> -           file://0001-examples-ucontext-cp.c-Do-not-use-SIGSTKSZ.patch \
> -           file://0001-tests-fix-portability-issue-when-using-__NR_mmap-sys.patch \
> -           "
> +SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
>  SRC_URI:append:libc-musl:riscv64 = " file://0001-do-not-build-examples.patch "
>  SRC_URI:append:libc-musl:riscv32 = " file://0001-do-not-build-examples.patch "
> +SRCREV = "41a61c97c2e3df4475c93fdf5026d575ce3f1377"
>
> -SRCREV = "b013dfd5a5f65116373d5e0f0bdfb73db9d8816e"
>  S = "${WORKDIR}/git"
>
>  DEPENDS:append:libc-musl = " libucontext"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93651): https://lists.openembedded.org/g/openembedded-devel/message/93651
> Mute This Topic: https://lists.openembedded.org/mt/86673561/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

