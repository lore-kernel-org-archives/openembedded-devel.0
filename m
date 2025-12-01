Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C03BD116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 21:47:29 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3355.1764625642239720602
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 13:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CvCx/G+E;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-641e4744e59so4899290d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 13:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764625641; x=1765230441; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vF04K0fXQZgxRACn6/2+CbfNsKKVEKEoVZvplATfzdI=;
        b=CvCx/G+EAvtR+d7dPiUfIDjkKwF6ztjYkIPCivTM1RnKWEGBx5DVYGzKRwSm+3DDBq
         l/J9xxtMZwhXe8KOWAH39M+FUK5sazY5D40ZYxpbbJN6IVMlwyHJagv9i1b51QEOODyO
         T5YfBd0rR476Tp6JiHhT7zVzmIPRUbNAuT+daND79FJ/84/rl1T4K3yGs8uzWOlNyLd6
         2zSJT3f761l1zvWvJeT9bMs6PvrdzzgnLnBqdmEgMut8RN3VFtuZVbjlBCzqt9GnqIRZ
         CUeN9KfFT2gbK89fc7SQ+Z/hb6Qi3Q5/jLdMwi7fYNHd44aMj0k2QIouVduo8RvnY959
         Askg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764625641; x=1765230441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vF04K0fXQZgxRACn6/2+CbfNsKKVEKEoVZvplATfzdI=;
        b=KIFhoElOa9CyzOSZofX3cSOHb2QJlhcWSWfC5vJlNGYUQoqTlcsebaPkpbSnJKXnuq
         VjbJCIV9n2qh/bCMQq+FY7Rka9a2Xgf/hQwc2EowRr94LtWiYO6Y5eFWrkOCFFFn7PuF
         /9lEMWFdaQJwxg4AYPtKXxzY3mzCjcm9GiRWr89L9B8qHLUlR9dDyHaFD3c/oVJghFY/
         ovB/Owvt9K15g5sC3Ks4ZohcQv8DXZmA1R96BcXVhJhtw80HOAPSgbSeU9kjwAPyq6KC
         ng+HQsU77cY2OllbsuG3m5PNwugNxy/WFkY7oUpEMWcCZEwS1Cn7HUs6VlbQUjU192Qm
         OB0Q==
X-Gm-Message-State: AOJu0YysOAVNyaoNOzK0SPpwtPOrgRVCdgeXyUSQfphWBZR89JmLbAAh
	T1K0nM8JsvtIdk2eSdiVDk5tRPsCTWFzi6aOxZukStz2KhnnLnNo+78dlu66R9lig0CPuLRZ/1r
	dO89kdGtV+RVotoI6cPF4CRa1pYj7qb8ZQ7hhXKU=
X-Gm-Gg: ASbGncvtMWQMqUJzY0SwXHa9zcixXehsIamRlLRvCTiPH6G7L2f1SZ4QFoLVJdYBRZp
	pi/QOh0ZHy1YSo4CHBZIumT/S4slXlZe0Sw2JRf3KltIrRKuH/FC9WbRUvYdLTCx4TMx2zkckMD
	Y8KO3V1dfTtAwubI5jcMaGttzI3nNlx0IwpdZSyXcAYmLSM46ZTOQ2kwJwJ4KQuhKOquqIV9Web
	rVTGEMciFW9EqbNXuJbKgkLgqeyawhDe159J3CeIov/CpeWgd5N/Bt+Aa29rRbIZXXT7P/AHXr7
	BOv4COMk6bNICQp4hIO/XDJIqg3EalIQTAIYqamoZLXasmcDwKbrFwQicGclvIY45lUsqD8Mk1o
	9Bb8R+DV5GUBGDao5GgLTmLi6t/S02d8I602WrfQkow==
X-Google-Smtp-Source: AGHT+IGwQaKNi96yOg4LFv6zo4bVdf2R6logcAS3icQ+lGIBy5gla9M0dZu+iI95mD7WSfnmux1XFiU4QBNFx4qcvGQ=
X-Received: by 2002:a05:690e:128c:b0:640:dd02:a777 with SMTP id
 956f58d0204a3-64302ae17a4mr26810565d50.69.1764625641137; Mon, 01 Dec 2025
 13:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20251201204936.2777637-1-skandigraun@gmail.com>
In-Reply-To: <20251201204936.2777637-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Dec 2025 13:46:54 -0800
X-Gm-Features: AWmQ_bllvYE-PIZ_QwrnJ-hLH9pVNWBCNJeGYICqAjSfhjdTbKbfuxmQ5YcuRzg
Message-ID: <CAMKF1sqHPzsJGWiAKXvuPjNNvr-5sRugeF+HJXiAm4oUvzFQhg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] yasm: drop recipe
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000806d060644eaecf5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 21:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122220

--000000000000806d060644eaecf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is good. I do see meta-intel mentioning it in libipt tests

https://git.yoctoproject.org/meta-intel/tree/lib/oeqa/runtime/cases/libipt.=
py

It will be good for meta-intel maintainers to notice this and take action
accordingly
so please add them to thread

On Mon, Dec 1, 2025 at 12:49=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Yasm was introduced as a rewrite of nasm, however its commits
> have dried up over the years, while its unmitigated CVEs keep
> piling up. Also, nasm is a healthier project with regular
> contributions still.
>
> There are no known recipes depending on yasm.
>
> Let's remove it.
>
> Cc: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../0001-bitvect-fix-build-with-gcc-15.patch  | 38 -----------------
>  ...-Set-build-date-to-SOURCE_DATE_EPOCH.patch | 37 ----------------
>  ...m-Use-BUILD_DATE-for-reproducibility.patch | 42 -------------------
>  .../yasm/yasm/CVE-2021-33456.patch            | 35 ----------------
>  .../yasm/yasm/CVE-2021-33464.patch            | 34 ---------------
>  .../yasm/yasm/CVE-2023-29579.patch            | 39 -----------------
>  meta-oe/recipes-devtools/yasm/yasm_git.bb     | 40 ------------------
>  7 files changed, 265 deletions(-)
>  delete mode 100644
> meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.pat=
ch
>  delete mode 100644
> meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DAT=
E_EPOCH.patch
>  delete mode 100644
> meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproduci=
bility.patch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.pat=
ch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.pat=
ch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.pat=
ch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm_git.bb
>
> diff --git
> a/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.p=
atch
> b/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.p=
atch
> deleted file mode 100644
> index f3f2c431d5..0000000000
> ---
> a/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.p=
atch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 64ef740eb262f329e55eebadf2ce276b146d44e9 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <martin.jansa@gmail.com>
> -Date: Tue, 22 Apr 2025 19:06:24 +0200
> -Subject: [PATCH] bitvect: fix build with gcc-15
> -
> -* fixes:
> -libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeratio=
n
> constant
> -   86 |         typedef enum boolean { false =3D FALSE, true =3D TRUE }
> boolean;
> -      |                                ^~~~~
> -../git/libyasm/bitvect.h:86:32: note: 'false' is a keyword with
> '-std=3Dc23' onwards
> -
> -as suggested in:
> -https://github.com/yasm/yasm/issues/283#issuecomment-2661108816
> -
> -Upstream-Status: Submitted [https://github.com/yasm/yasm/pull/287]
> -
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ----
> - libyasm/bitvect.h | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/libyasm/bitvect.h b/libyasm/bitvect.h
> -index 3aee3a53..a13470ad 100644
> ---- a/libyasm/bitvect.h
> -+++ b/libyasm/bitvect.h
> -@@ -83,7 +83,11 @@ typedef  Z_longword         *Z_longwordptr;
> -     #ifdef MACOS_TRADITIONAL
> -         #define boolean Boolean
> -     #else
> --        typedef enum boolean { false =3D FALSE, true =3D TRUE } boolean=
;
> -+        #if __STDC_VERSION__ < 202311L
> -+             typedef enum boolean { false =3D FALSE, true =3D TRUE } bo=
olean;
> -+        #else
> -+             typedef bool boolean;
> -+        #endif
> -     #endif
> - #endif
> -
> diff --git
> a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_D=
ATE_EPOCH.patch
> b/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_D=
ATE_EPOCH.patch
> deleted file mode 100644
> index 42f5559e3f..0000000000
> ---
> a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_D=
ATE_EPOCH.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From eb164bb201c0f792fa8aa78270c47294065183a3 Mon Sep 17 00:00:00 2001
> -From: Oleh Matiusha <omatiush@cisco.com>
> -Date: Tue, 6 Feb 2024 09:33:11 +0000
> -Subject: [PATCH 1/2] yasm: Set build date to SOURCE_DATE_EPOCH
> -
> -If SOURCE_DATE_EPOCH is set, use it to generate a reproducible
> -string for BUILD_DATE.
> -
> -Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
> -
> -Upstream-Status: Pending
> ----
> - configure.ac | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 2823ecd..eeb51ce 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -103,6 +103,14 @@ AM_WITH_DMALLOC
> - #
> - AC_CHECK_HEADERS([strings.h libgen.h unistd.h direct.h sys/stat.h])
> -
> -+# Use reproducible build date and time
> -+if test "$SOURCE_DATE_EPOCH"; then
> -+      DATE_FMT=3D"%d %b %Y %H:%M:%S"
> -+      BUILD_DATE=3D$(LC_ALL=3DC date -u -d "@$SOURCE_DATE_EPOCH"
> "+$DATE_FMT")
> -+      AC_DEFINE_UNQUOTED([BUILD_DATE], ["$BUILD_DATE"], [Use
> reproducidle build date])
> -+fi
> -+
> -+
> - #
> - # Checks for typedefs, structures, and compiler characteristics.
> - #
> ---
> -2.33.0
> -
> diff --git
> a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reprodu=
cibility.patch
> b/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reprodu=
cibility.patch
> deleted file mode 100644
> index 4b9c933d01..0000000000
> ---
> a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reprodu=
cibility.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 19fffab74a201dc41c3da7e74d86eafa8f68bbc6 Mon Sep 17 00:00:00 2001
> -From: Oleh Matiusha <omatiush@cisco.com>
> -Date: Tue, 6 Feb 2024 09:34:26 +0000
> -Subject: [PATCH] yasm: Use BUILD_DATE for reproducibility
> -
> -Use reproducible build date instead of compilation time and date.
> -
> -Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
> -
> -
> -Upstream-Status: Pending
> ----
> - tools/re2c/parser.c | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/tools/re2c/parser.c b/tools/re2c/parser.c
> -index 02d5c66..1c90aee 100644
> ---- a/tools/re2c/parser.c
> -+++ b/tools/re2c/parser.c
> -@@ -5,6 +5,7 @@
> - #include "tools/re2c/globals.h"
> - #include "tools/re2c/parse.h"
> - #include "tools/re2c/parser.h"
> -+#include "config.h"
> -
> - int yylex(void);
> - static RegExp *parse_expr(void);
> -@@ -233,7 +234,11 @@ void parse(FILE *i, FILE *o){
> -     peektok =3D NONE;
> -
> -     fputs("/* Generated by re2c 0.9.1-C on ", o);
> -+#ifndef BUILD_DATE
> -     fprintf(o, "%-24s", ctime(&now));
> -+#else
> -+    fprintf(o, "%-24s", BUILD_DATE " ");
> -+#endif
> -     fputs(" */\n", o); oline+=3D2;
> -
> -     in =3D Scanner_new(i);
> ---
> -2.33.0
> -
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
> b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
> deleted file mode 100644
> index 2340d8ed75..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 1126140b8f5ece18c58640725f0e4c08e5ec97b0 Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Sat, 15 Nov 2025 13:34:15 +0100
> -Subject: [PATCH] A potential null pointer difference is that the return
> value
> - of the hash may be null. This fixes CVE-2021-33456.
> -
> -From: lixuebing <lixuebing@cqsoftware.com.cn>
> -Date: Mon, 25 Aug 2025 13:51:28 +0800
> -Subject: Fix null-pointer-dereference in hash
> -Bug: https://github.com/yasm/yasm/issues/175
> -Origin: https://github.com/yasm/yasm/pull/290
> -
> -CVE: CVE-2021-33456
> -Upstream-Status: Submitted [https://github.com/yasm/yasm/pull/290]
> -
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - modules/preprocs/nasm/nasm-pp.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/modules/preprocs/nasm/nasm-pp.c
> b/modules/preprocs/nasm/nasm-pp.c
> -index f9f92dd1..473d98c1 100644
> ---- a/modules/preprocs/nasm/nasm-pp.c
> -+++ b/modules/preprocs/nasm/nasm-pp.c
> -@@ -1102,6 +1102,10 @@ hash(char *s)
> - {
> -     unsigned int h =3D 0;
> -     unsigned int i =3D 0;
> -+    /* Check if the input string is NULL to avoid null pointer
> dereference */
> -+    if (s =3D=3D NULL) {
> -+        return 0;
> -+    }
> -     /*
> -      * Powers of three, mod 31.
> -      */
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
> b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
> deleted file mode 100644
> index ebae250ff9..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 3c3f968d48d768c1e355199d4067d99cb72abc26 Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Sat, 15 Nov 2025 13:30:12 +0100
> -Subject: [PATCH] Handle file descriptors with nonexisting env names
> better.
> - Avoid writing past allocated memory.
> -
> -This fixes CVE-2021-33464.
> -Author: Petter Reinholdtsen <pere@debian.org>
> -Bug: https://github.com/yasm/yasm/issues/164
> -Bug-Debian: https://bugs.debian.org/1016353
> -Forwarded: https://github.com/yasm/yasm/issues/164
> -Last-Update: 2025-04-30
> -
> -CVE: CVE-2021-33464
> -Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/164]
> -
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - modules/preprocs/nasm/nasm-pp.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/modules/preprocs/nasm/nasm-pp.c
> b/modules/preprocs/nasm/nasm-pp.c
> -index 512f02c3..f9f92dd1 100644
> ---- a/modules/preprocs/nasm/nasm-pp.c
> -+++ b/modules/preprocs/nasm/nasm-pp.c
> -@@ -1815,7 +1815,7 @@ inc_fopen(char *file, char **newname)
> -             error(ERR_WARNING, "environment variable `%s' does not
> exist",
> -                   p1+1);
> -             *p2 =3D '%';
> --            p1 =3D p2+1;
> -+            pb =3D p1 =3D p2+1;
> -             continue;
> -         }
> -         /* need to expand */
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
> b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
> deleted file mode 100644
> index 58b4ed1996..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 81c1b7b0a28f052eaadddcb010944bf67e6ae257 Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Sat, 15 Nov 2025 13:24:21 +0100
> -Subject: [PATCH] Make sure CPU feature parsing use large enough string
> buffer.
> -  Fixes CVE-2023-29579.
> -
> -Author: Petter Reinholdtsen <pere@debian.org>
> -Bug: https://github.com/yasm/yasm/issues/214
> -Bug-Debian: https://bugs.debian.org/1035951
> -Forwarded:  https://github.com/yasm/yasm/issues/214
> -Last-Update: 2025-04-30
> -
> -This patch is taken from Debian:
> -
> https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023=
-29579.patch/
> -
> -CVE: CVE-2023-29579
> -Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/214]
> -
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - modules/arch/x86/x86arch.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/modules/arch/x86/x86arch.c b/modules/arch/x86/x86arch.c
> -index bac11774..58327958 100644
> ---- a/modules/arch/x86/x86arch.c
> -+++ b/modules/arch/x86/x86arch.c
> -@@ -165,8 +165,9 @@ x86_dir_cpu(yasm_object *object, yasm_valparamhead
> *valparams,
> -                 yasm_error_set(YASM_ERROR_SYNTAX,
> -                                N_("invalid argument to [%s]"), "CPU");
> -             else {
> --                char strcpu[16];
> --                sprintf(strcpu, "%lu", yasm_intnum_get_uint(intcpu));
> -+                char strcpu[21]; /* 21 =3D ceil(log10(LONG_MAX)+1) */
> -+                assert(8*sizeof(unsigned long) <=3D 64);
> -+                snprintf(strcpu, sizeof(strcpu), "%lu",
> yasm_intnum_get_uint(intcpu));
> -                 yasm_x86__parse_cpu(arch_x86, strcpu, strlen(strcpu));
> -             }
> -         } else
> diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> deleted file mode 100644
> index 6ddd94621a..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -SUMMARY =3D "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
> -LICENSE =3D "MIT"
> -HOMEPAGE =3D "http://www.tortall.net/projects/yasm/"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da12d8903508fb6bfd49d8d82c6170=
dd9"
> -
> -DEPENDS +=3D "flex-native bison-native"
> -PACKAGECONFIG[docs] =3D ",,xmlto-native,"
> -
> -PV =3D "1.3.0+git"
> -# v1.3.0-87
> -SRCREV =3D "121ab150b3577b666c79a79f4a511798d7ad2432"
> -SRC_URI =3D "git://github.com/yasm/yasm.git;branch=3Dmaster;protocol=3Dh=
ttps \
> -           file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
> -           file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
> -           file://0001-bitvect-fix-build-with-gcc-15.patch \
> -           file://CVE-2023-29579.patch \
> -           file://CVE-2021-33464.patch \
> -           file://CVE-2021-33456.patch \
> -           "
> -
> -
> -inherit autotools gettext python3native
> -
> -CACHED_CONFIGUREVARS =3D "CCLD_FOR_BUILD=3D'${CC_FOR_BUILD}'"
> -
> -BBCLASSEXTEND =3D "native"
> -
> -PARALLEL_MAKE =3D ""
> -
> -do_configure:prepend() {
> -     # Don't include $CC (which includes path to sysroot) in generated
> header.
> -     sed -i -e "s/^echo \"\/\* generated \$ac_cv_stdint_message \*\/\"
> >>\$ac_stdint$"// ${S}/m4/ax_create_stdint_h.m4
> -}
> -
> -CVE_STATUS_GROUPS +=3D "CVE_STATUS_HASH_UPDATE"
> -CVE_STATUS_HASH_UPDATE =3D "CVE-2021-33454 CVE-2023-31975 CVE-2023-37732=
"
> -CVE_STATUS_HASH_UPDATE[status] =3D "fixed-version: patched in current gi=
t
> hash"
> -
> -CVE_PRODUCT +=3D "tortall:yasm yasm_project:yasm"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122218):
> https://lists.openembedded.org/g/openembedded-devel/message/122218
> Mute This Topic: https://lists.openembedded.org/mt/116564756/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000806d060644eaecf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is good. I do see meta-intel mentioning it in libipt =
tests<div><br></div><div><a href=3D"https://git.yoctoproject.org/meta-intel=
/tree/lib/oeqa/runtime/cases/libipt.py">https://git.yoctoproject.org/meta-i=
ntel/tree/lib/oeqa/runtime/cases/libipt.py</a></div><div><br></div><div>It =
will be good for meta-intel maintainers to notice this and take action acco=
rdingly</div><div>so please add them to thread=C2=A0</div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Dec 1, 2025 at 12:49=E2=80=AFPM Gyorgy Sarvari via <a href=3D"=
http://lists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Yasm was introduced as a rewrite of nasm, however its commits<b=
r>
have dried up over the years, while its unmitigated CVEs keep<br>
piling up. Also, nasm is a healthier project with regular<br>
contributions still.<br>
<br>
There are no known recipes depending on yasm.<br>
<br>
Let&#39;s remove it.<br>
<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank=
">ross.burton@arm.com</a>&gt;<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-bitvect-fix-build-with-gcc-15.patch=C2=A0 | 38 -------------=
----<br>
=C2=A0...-Set-build-date-to-SOURCE_DATE_EPOCH.patch | 37 ----------------<b=
r>
=C2=A0...m-Use-BUILD_DATE-for-reproducibility.patch | 42 ------------------=
-<br>
=C2=A0.../yasm/yasm/CVE-2021-33456.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 35 ----------------<br>
=C2=A0.../yasm/yasm/CVE-2021-33464.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 34 ---------------<br>
=C2=A0.../yasm/yasm/CVE-2023-29579.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 39 -----------------<br>
=C2=A0meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yasm_git.bb</a>=C2=A0 =C2=A0 =C2=A0| 40 ------=
------------<br>
=C2=A07 files changed, 265 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fi=
x-build-with-gcc-15.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-b=
uild-date-to-SOURCE_DATE_EPOCH.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-B=
UILD_DATE-for-reproducibility.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.=
patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.=
patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.=
patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/yasm/<a href=3D"http://ya=
sm_git.bb" rel=3D"noreferrer" target=3D"_blank">yasm_git.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with=
-gcc-15.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-w=
ith-gcc-15.patch<br>
deleted file mode 100644<br>
index f3f2c431d5..0000000000<br>
--- a/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15=
.patch<br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-From 64ef740eb262f329e55eebadf2ce276b146d44e9 Mon Sep 17 00:00:00 2001<br>
-From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D=
"_blank">martin.jansa@gmail.com</a>&gt;<br>
-Date: Tue, 22 Apr 2025 19:06:24 +0200<br>
-Subject: [PATCH] bitvect: fix build with gcc-15<br>
-<br>
-* fixes:<br>
-libyasm/bitvect.h:86:32: error: cannot use keyword &#39;false&#39; as enum=
eration constant<br>
-=C2=A0 =C2=A086 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef enum boolean { =
false =3D FALSE, true =3D TRUE } boolean;<br>
-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~<br>
-../git/libyasm/bitvect.h:86:32: note: &#39;false&#39; is a keyword with &#=
39;-std=3Dc23&#39; onwards<br>
-<br>
-as suggested in:<br>
-<a href=3D"https://github.com/yasm/yasm/issues/283#issuecomment-2661108816=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/yasm/yasm/issues/=
283#issuecomment-2661108816</a><br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/yasm/yasm/pull/2=
87" rel=3D"noreferrer" target=3D"_blank">https://github.com/yasm/yasm/pull/=
287</a>]<br>
-<br>
-Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
----<br>
- libyasm/bitvect.h | 6 +++++-<br>
- 1 file changed, 5 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/libyasm/bitvect.h b/libyasm/bitvect.h<br>
-index 3aee3a53..a13470ad 100644<br>
---- a/libyasm/bitvect.h<br>
-+++ b/libyasm/bitvect.h<br>
-@@ -83,7 +83,11 @@ typedef=C2=A0 Z_longword=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*Z_longwordptr;<br>
-=C2=A0 =C2=A0 =C2=A0#ifdef MACOS_TRADITIONAL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#define boolean Boolean<br>
-=C2=A0 =C2=A0 =C2=A0#else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef enum boolean { false =3D FALSE, true =
=3D TRUE } boolean;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #if __STDC_VERSION__ &lt; 202311L<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef enum boolean { fa=
lse =3D FALSE, true =3D TRUE } boolean;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef bool boolean;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
-=C2=A0 =C2=A0 =C2=A0#endif<br>
- #endif<br>
- <br>
diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to=
-SOURCE_DATE_EPOCH.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set=
-build-date-to-SOURCE_DATE_EPOCH.patch<br>
deleted file mode 100644<br>
index 42f5559e3f..0000000000<br>
--- a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE=
_DATE_EPOCH.patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From eb164bb201c0f792fa8aa78270c47294065183a3 Mon Sep 17 00:00:00 2001<br>
-From: Oleh Matiusha &lt;<a href=3D"mailto:omatiush@cisco.com" target=3D"_b=
lank">omatiush@cisco.com</a>&gt;<br>
-Date: Tue, 6 Feb 2024 09:33:11 +0000<br>
-Subject: [PATCH 1/2] yasm: Set build date to SOURCE_DATE_EPOCH<br>
-<br>
-If SOURCE_DATE_EPOCH is set, use it to generate a reproducible<br>
-string for BUILD_DATE.<br>
-<br>
-Signed-off-by: Oleh Matiusha &lt;<a href=3D"mailto:omatiush@cisco.com" tar=
get=3D"_blank">omatiush@cisco.com</a>&gt;<br>
-<br>
-Upstream-Status: Pending<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 8 ++++++++<br>
- 1 file changed, 8 insertions(+)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 2823ecd..eeb51ce 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -103,6 +103,14 @@ AM_WITH_DMALLOC<br>
- #<br>
- AC_CHECK_HEADERS([strings.h libgen.h unistd.h direct.h sys/stat.h])<br>
- <br>
-+# Use reproducible build date and time<br>
-+if test &quot;$SOURCE_DATE_EPOCH&quot;; then<br>
-+=C2=A0 =C2=A0 =C2=A0 DATE_FMT=3D&quot;%d %b %Y %H:%M:%S&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 BUILD_DATE=3D$(LC_ALL=3DC date -u -d &quot;@$SOURCE_=
DATE_EPOCH&quot; &quot;+$DATE_FMT&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_DEFINE_UNQUOTED([BUILD_DATE], [&quot;$BUILD_DATE&=
quot;], [Use reproducidle build date])<br>
-+fi<br>
-+<br>
-+<br>
- #<br>
- # Checks for typedefs, structures, and compiler characteristics.<br>
- #<br>
--- <br>
-2.33.0<br>
-<br>
diff --git a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-fo=
r-reproducibility.patch b/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-=
BUILD_DATE-for-reproducibility.patch<br>
deleted file mode 100644<br>
index 4b9c933d01..0000000000<br>
--- a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-repro=
ducibility.patch<br>
+++ /dev/null<br>
@@ -1,42 +0,0 @@<br>
-From 19fffab74a201dc41c3da7e74d86eafa8f68bbc6 Mon Sep 17 00:00:00 2001<br>
-From: Oleh Matiusha &lt;<a href=3D"mailto:omatiush@cisco.com" target=3D"_b=
lank">omatiush@cisco.com</a>&gt;<br>
-Date: Tue, 6 Feb 2024 09:34:26 +0000<br>
-Subject: [PATCH] yasm: Use BUILD_DATE for reproducibility<br>
-<br>
-Use reproducible build date instead of compilation time and date.<br>
-<br>
-Signed-off-by: Oleh Matiusha &lt;<a href=3D"mailto:omatiush@cisco.com" tar=
get=3D"_blank">omatiush@cisco.com</a>&gt;<br>
-<br>
-<br>
-Upstream-Status: Pending<br>
----<br>
- tools/re2c/parser.c | 5 +++++<br>
- 1 file changed, 5 insertions(+)<br>
-<br>
-diff --git a/tools/re2c/parser.c b/tools/re2c/parser.c<br>
-index 02d5c66..1c90aee 100644<br>
---- a/tools/re2c/parser.c<br>
-+++ b/tools/re2c/parser.c<br>
-@@ -5,6 +5,7 @@<br>
- #include &quot;tools/re2c/globals.h&quot;<br>
- #include &quot;tools/re2c/parse.h&quot;<br>
- #include &quot;tools/re2c/parser.h&quot;<br>
-+#include &quot;config.h&quot;<br>
- <br>
- int yylex(void);<br>
- static RegExp *parse_expr(void);<br>
-@@ -233,7 +234,11 @@ void parse(FILE *i, FILE *o){<br>
-=C2=A0 =C2=A0 =C2=A0peektok =3D NONE;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0fputs(&quot;/* Generated by re2c 0.9.1-C on &quot;, o)=
;<br>
-+#ifndef BUILD_DATE<br>
-=C2=A0 =C2=A0 =C2=A0fprintf(o, &quot;%-24s&quot;, ctime(&amp;now));<br>
-+#else<br>
-+=C2=A0 =C2=A0 fprintf(o, &quot;%-24s&quot;, BUILD_DATE &quot; &quot;);<br=
>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0fputs(&quot; */\n&quot;, o); oline+=3D2;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0in =3D Scanner_new(i);<br>
--- <br>
-2.33.0<br>
-<br>
diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch b/meta=
-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch<br>
deleted file mode 100644<br>
index 2340d8ed75..0000000000<br>
--- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From 1126140b8f5ece18c58640725f0e4c08e5ec97b0 Mon Sep 17 00:00:00 2001<br>
-From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
-Date: Sat, 15 Nov 2025 13:34:15 +0100<br>
-Subject: [PATCH] A potential null pointer difference is that the return va=
lue<br>
- of the hash may be null. This fixes CVE-2021-33456.<br>
-<br>
-From: lixuebing &lt;<a href=3D"mailto:lixuebing@cqsoftware.com.cn" target=
=3D"_blank">lixuebing@cqsoftware.com.cn</a>&gt;<br>
-Date: Mon, 25 Aug 2025 13:51:28 +0800<br>
-Subject: Fix null-pointer-dereference in hash<br>
-Bug: <a href=3D"https://github.com/yasm/yasm/issues/175" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/yasm/yasm/issues/175</a><br>
-Origin: <a href=3D"https://github.com/yasm/yasm/pull/290" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/yasm/yasm/pull/290</a><br>
-<br>
-CVE: CVE-2021-33456<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/yasm/yasm/pull/2=
90" rel=3D"noreferrer" target=3D"_blank">https://github.com/yasm/yasm/pull/=
290</a>]<br>
-<br>
-Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
----<br>
- modules/preprocs/nasm/nasm-pp.c | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
-<br>
-diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nasm-=
pp.c<br>
-index f9f92dd1..473d98c1 100644<br>
---- a/modules/preprocs/nasm/nasm-pp.c<br>
-+++ b/modules/preprocs/nasm/nasm-pp.c<br>
-@@ -1102,6 +1102,10 @@ hash(char *s)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0unsigned int h =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0unsigned int i =3D 0;<br>
-+=C2=A0 =C2=A0 /* Check if the input string is NULL to avoid null pointer =
dereference */<br>
-+=C2=A0 =C2=A0 if (s =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 * Powers of three, mod 31.<br>
-=C2=A0 =C2=A0 =C2=A0 */<br>
diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch b/meta=
-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch<br>
deleted file mode 100644<br>
index ebae250ff9..0000000000<br>
--- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From 3c3f968d48d768c1e355199d4067d99cb72abc26 Mon Sep 17 00:00:00 2001<br>
-From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
-Date: Sat, 15 Nov 2025 13:30:12 +0100<br>
-Subject: [PATCH] Handle file descriptors with nonexisting env names better=
. <br>
- Avoid writing past allocated memory.<br>
-<br>
-This fixes CVE-2021-33464.<br>
-Author: Petter Reinholdtsen &lt;<a href=3D"mailto:pere@debian.org" target=
=3D"_blank">pere@debian.org</a>&gt;<br>
-Bug: <a href=3D"https://github.com/yasm/yasm/issues/164" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/yasm/yasm/issues/164</a><br>
-Bug-Debian: <a href=3D"https://bugs.debian.org/1016353" rel=3D"noreferrer"=
 target=3D"_blank">https://bugs.debian.org/1016353</a><br>
-Forwarded: <a href=3D"https://github.com/yasm/yasm/issues/164" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/yasm/yasm/issues/164</a><br>
-Last-Update: 2025-04-30<br>
-<br>
-CVE: CVE-2021-33464<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/yasm/yasm/issues=
/164" rel=3D"noreferrer" target=3D"_blank">https://github.com/yasm/yasm/iss=
ues/164</a>]<br>
-<br>
-Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
----<br>
- modules/preprocs/nasm/nasm-pp.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nasm-=
pp.c<br>
-index 512f02c3..f9f92dd1 100644<br>
---- a/modules/preprocs/nasm/nasm-pp.c<br>
-+++ b/modules/preprocs/nasm/nasm-pp.c<br>
-@@ -1815,7 +1815,7 @@ inc_fopen(char *file, char **newname)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error(ERR_WARNING, &quot;e=
nvironment variable `%s&#39; does not exist&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p1+1)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*p2 =3D &#39;%&#39;;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p1 =3D p2+1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pb =3D p1 =3D p2+1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* need to expand */<br>
diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch b/meta=
-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch<br>
deleted file mode 100644<br>
index 58b4ed1996..0000000000<br>
--- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-From 81c1b7b0a28f052eaadddcb010944bf67e6ae257 Mon Sep 17 00:00:00 2001<br>
-From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
-Date: Sat, 15 Nov 2025 13:24:21 +0100<br>
-Subject: [PATCH] Make sure CPU feature parsing use large enough string buf=
fer.<br>
-=C2=A0 Fixes CVE-2023-29579.<br>
-<br>
-Author: Petter Reinholdtsen &lt;<a href=3D"mailto:pere@debian.org" target=
=3D"_blank">pere@debian.org</a>&gt;<br>
-Bug: <a href=3D"https://github.com/yasm/yasm/issues/214" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/yasm/yasm/issues/214</a><br>
-Bug-Debian: <a href=3D"https://bugs.debian.org/1035951" rel=3D"noreferrer"=
 target=3D"_blank">https://bugs.debian.org/1035951</a><br>
-Forwarded:=C2=A0 <a href=3D"https://github.com/yasm/yasm/issues/214" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/yasm/yasm/issues/214</=
a><br>
-Last-Update: 2025-04-30<br>
-<br>
-This patch is taken from Debian:<br>
-<a href=3D"https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cp=
u-CVE-2023-29579.patch/" rel=3D"noreferrer" target=3D"_blank">https://sourc=
es.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/</=
a><br>
-<br>
-CVE: CVE-2023-29579<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/yasm/yasm/issues=
/214" rel=3D"noreferrer" target=3D"_blank">https://github.com/yasm/yasm/iss=
ues/214</a>]<br>
-<br>
-Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
----<br>
- modules/arch/x86/x86arch.c | 5 +++--<br>
- 1 file changed, 3 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/modules/arch/x86/x86arch.c b/modules/arch/x86/x86arch.c<br>
-index bac11774..58327958 100644<br>
---- a/modules/arch/x86/x86arch.c<br>
-+++ b/modules/arch/x86/x86arch.c<br>
-@@ -165,8 +165,9 @@ x86_dir_cpu(yasm_object *object, yasm_valparamhead *va=
lparams,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yasm_error_s=
et(YASM_ERROR_SYNTAX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 N_(&quot;invalid argument to [%s]&qu=
ot;), &quot;CPU&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char strcpu[16];<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(strcpu, &=
quot;%lu&quot;, yasm_intnum_get_uint(intcpu));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char strcpu[21]; =
/* 21 =3D ceil(log10(LONG_MAX)+1) */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(8*sizeof(u=
nsigned long) &lt;=3D 64);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(strcpu, =
sizeof(strcpu), &quot;%lu&quot;, yasm_intnum_get_uint(intcpu));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yasm_x86__pa=
rse_cpu(arch_x86, strcpu, strlen(strcpu));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
diff --git a/meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" r=
el=3D"noreferrer" target=3D"_blank">yasm_git.bb</a> b/meta-oe/recipes-devto=
ols/yasm/<a href=3D"http://yasm_git.bb" rel=3D"noreferrer" target=3D"_blank=
">yasm_git.bb</a><br>
deleted file mode 100644<br>
index 6ddd94621a..0000000000<br>
--- a/meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yasm_git.bb</a><br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-SUMMARY =3D &quot;x86 (SSE) assembler supporting NASM and GAS-syntaxes&quo=
t;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://www.tortall.net/projects/yasm/" rel=
=3D"noreferrer" target=3D"_blank">http://www.tortall.net/projects/yasm/</a>=
&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da12d8903508fb6bfd49d8d82c6=
170dd9&quot;<br>
-<br>
-DEPENDS +=3D &quot;flex-native bison-native&quot;<br>
-PACKAGECONFIG[docs] =3D &quot;,,xmlto-native,&quot;<br>
-<br>
-PV =3D &quot;1.3.0+git&quot;<br>
-# v1.3.0-87<br>
-SRCREV =3D &quot;121ab150b3577b666c79a79f4a511798d7ad2432&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/yasm/yasm.git;branch=
=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/yasm/yasm.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-yasm-Set-build-date-t=
o-SOURCE_DATE_EPOCH.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-yasm-Use-BUILD_DATE-f=
or-reproducibility.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bitvect-fix-build-wit=
h-gcc-15.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-29579.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-33464.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-33456.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-<br>
-inherit autotools gettext python3native<br>
-<br>
-CACHED_CONFIGUREVARS =3D &quot;CCLD_FOR_BUILD=3D&#39;${CC_FOR_BUILD}&#39;&=
quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
-<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
-<br>
-do_configure:prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0# Don&#39;t include $CC (which includes path to sysroo=
t) in generated header.<br>
-=C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s/^echo \&quot;\/\* generated \$ac_cv_=
stdint_message \*\/\&quot; &gt;&gt;\$ac_stdint$&quot;// ${S}/m4/ax_create_s=
tdint_h.m4<br>
-}<br>
-<br>
-CVE_STATUS_GROUPS +=3D &quot;CVE_STATUS_HASH_UPDATE&quot;<br>
-CVE_STATUS_HASH_UPDATE =3D &quot;CVE-2021-33454 CVE-2023-31975 CVE-2023-37=
732&quot;<br>
-CVE_STATUS_HASH_UPDATE[status] =3D &quot;fixed-version: patched in current=
 git hash&quot;<br>
-<br>
-CVE_PRODUCT +=3D &quot;tortall:yasm yasm_project:yasm&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122218): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122218" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122218</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116564756/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116564756/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000806d060644eaecf5--

