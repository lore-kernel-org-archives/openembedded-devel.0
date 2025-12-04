Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D33D216BE
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 16:52:37 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48492.1764867149290885203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 08:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wgqbZvuF;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e445dbbso622545f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 08:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764867148; x=1765471948; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geLtHCoy3nDeTHrDCwWsb3RdtgSQd2UpORt7xQyUBo4=;
        b=wgqbZvuFCe7CE3gKVzVBq4Ew1jjhHLnBKbdiX8P+F3G1tnw4B2pzOaAkGons00jGmD
         zDi17G9yxUBs5wf4JZ/MWuXWKOHqK1ETE0mJPFRBqTglc2dC42tGttaroulyhwd43+HE
         /a0m5H4z7P8UVWZOp8/xsWT1IPeKAK8tCwKg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764867148; x=1765471948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=geLtHCoy3nDeTHrDCwWsb3RdtgSQd2UpORt7xQyUBo4=;
        b=rORiMTpywdZOmM3h341moX0cx2sGfFSLyVaBvp1SQXWACfO7mKTQc/LnVKJ8ArgonV
         u51/htXDXlALM73oFQ65l5W5h4rcIrarOvRsdZ56lfWiPXjoYVfO5BzzQGWA7B7xdXaO
         DGZej2x+lqOR9+cbcOx9m5pnZEU+ub68jEydL+6HWpbwR3tgb8GEJjHVZiSN3vKQtPey
         3U4gkPAs9IISVc4QSVuGuUFQMjo2hM2hTiu7g5u9DAgzPS1ElO4FiwBIwhJF2QbIO1el
         ap2qNvEJWRkIw8KOb2XN68XZ4t5ZvyyANtnv1/cGhM1VoNecSrzeZse/oNx7pQcowAg7
         tVrg==
X-Gm-Message-State: AOJu0YyMkcbt9fhtsGjv7MB5pd3ubPRLQTtlQRKBd4egZIOqLt1UFh/r
	O/AhueJexNmcD/lCdUIjGfxEaPsK4t685R3t9QNufMEabMZ5BvmkYokfJ6cmAWZIP4q7Zfl+mXU
	qh9pLUmJgS+znmsMO7uxVFRvnwnub5g6cJY/xTYCRDQ==
X-Gm-Gg: ASbGncvHadXzLZYAkHX99WQN1vNzLTWHvWgFhn+pTor3tDzCs/4j2HQho4DQbX1Ua2E
	bNDaA0BVmwdWWPz1kmlfMaBQH3wp0b3aH1JduimpEUlWwu6xY+LSj1YjeGUg82JpPHKPM1qMO+9
	Z6T7winSJgUJeJcvgs37dKcZDvxi/qF+XlmBMIsi1xJsQ7CywmJTFJeAwvekbCyOLP8QNV1SmZ9
	6wsu98taG1O/9GMh90Zl+/FxjRd27LZuQFkQXMW7jZI8ESBbASq2VB1sEPL/QBYvQ6VHO61EQO9
	u+IJJ06X3Usu3By7/uZhgV3NEd68
X-Google-Smtp-Source: AGHT+IEG/47mA12E2IB+cuqdnYGQVIuy+gLH+jtXgZwX34UjF5Mw2bftV+6b3tfDqWnlv/X4xWvKjyQCl0uxHp1TFSA=
X-Received: by 2002:a05:6000:2407:b0:429:66bf:1475 with SMTP id
 ffacd0b85a97d-42f73171fe9mr7228774f8f.3.1764867147496; Thu, 04 Dec 2025
 08:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20251201220957.2629951-1-skandigraun@gmail.com>
In-Reply-To: <20251201220957.2629951-1-skandigraun@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 4 Dec 2025 17:52:01 +0100
X-Gm-Features: AWmQ_bnalMB3HmPDpvOSR1bTegLPSxRbFhvWcQVLAA_bCQ7XsHOd2ox_EwcpbKw
Message-ID: <CAMSfU+6MEFLLqzQdYgt0W12bwenvw-B3JY0zpcHXrDrdPOfoEQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] yasm: drop recipe
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Yogesh Tyagi <yogesh.tyagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 16:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122325

Le lun. 1 d=C3=A9c. 2025 =C3=A0 23:10, Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
> Yasm was introduced as a rewrite of nasm, however its commits
> have dried up over the years, while its unmitigated CVEs keep
> piling up. Also, nasm is a healthier project with regular
> contributions still.
>
> There are no known recipes depending on yasm.
>
> Let's remove it.

Can you also remove it from the package groups?

From https://autobuilder.yoctoproject.org/valkyrie/?#/builders/82/builds/53=
7/steps/13/logs/stdio
(line 50+):
stdio: WARNING: Nothing RPROVIDES 'yasm' (but
/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-oe/=
recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-shells' (but
/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-oe/=
recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-security' (but
/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-oe/=
recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-multimedia'
(but /srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/met=
a-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-test' (but
/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-oe/=
recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-bsp' (but
/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-oe/=
recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)

Thanks!

>
> Cc: Ross Burton <ross.burton@arm.com>
> Cc: Yogesh Tyagi <yogesh.tyagi@intel.com>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>
> v2: added Yogesh Tyagi on Cc, as the maintainer of meta-intel
>
>  .../0001-bitvect-fix-build-with-gcc-15.patch  | 38 -----------------
>  ...-Set-build-date-to-SOURCE_DATE_EPOCH.patch | 37 ----------------
>  ...m-Use-BUILD_DATE-for-reproducibility.patch | 42 -------------------
>  .../yasm/yasm/CVE-2021-33456.patch            | 35 ----------------
>  .../yasm/yasm/CVE-2021-33464.patch            | 34 ---------------
>  .../yasm/yasm/CVE-2023-29579.patch            | 39 -----------------
>  meta-oe/recipes-devtools/yasm/yasm_git.bb     | 40 ------------------
>  7 files changed, 265 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-b=
uild-with-gcc-15.patch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-buil=
d-date-to-SOURCE_DATE_EPOCH.patch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUIL=
D_DATE-for-reproducibility.patch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.pat=
ch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.pat=
ch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.pat=
ch
>  delete mode 100644 meta-oe/recipes-devtools/yasm/yasm_git.bb
>
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-wi=
th-gcc-15.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build=
-with-gcc-15.patch
> deleted file mode 100644
> index f3f2c431d5..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-=
15.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 64ef740eb262f329e55eebadf2ce276b146d44e9 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <martin.jansa@gmail.com>
> -Date: Tue, 22 Apr 2025 19:06:24 +0200
> -Subject: [PATCH] bitvect: fix build with gcc-15
> -
> -* fixes:
> -libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeratio=
n constant
> -   86 |         typedef enum boolean { false =3D FALSE, true =3D TRUE } =
boolean;
> -      |                                ^~~~~
> -../git/libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=3D=
c23' onwards
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
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-=
to-SOURCE_DATE_EPOCH.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-S=
et-build-date-to-SOURCE_DATE_EPOCH.patch
> deleted file mode 100644
> index 42f5559e3f..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOUR=
CE_DATE_EPOCH.patch
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
> -+      BUILD_DATE=3D$(LC_ALL=3DC date -u -d "@$SOURCE_DATE_EPOCH" "+$DAT=
E_FMT")
> -+      AC_DEFINE_UNQUOTED([BUILD_DATE], ["$BUILD_DATE"], [Use reproducid=
le build date])
> -+fi
> -+
> -+
> - #
> - # Checks for typedefs, structures, and compiler characteristics.
> - #
> ---
> -2.33.0
> -
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-=
for-reproducibility.patch b/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Us=
e-BUILD_DATE-for-reproducibility.patch
> deleted file mode 100644
> index 4b9c933d01..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-rep=
roducibility.patch
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
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch b/me=
ta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
> deleted file mode 100644
> index 2340d8ed75..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 1126140b8f5ece18c58640725f0e4c08e5ec97b0 Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Sat, 15 Nov 2025 13:34:15 +0100
> -Subject: [PATCH] A potential null pointer difference is that the return =
value
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
> -diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nas=
m-pp.c
> -index f9f92dd1..473d98c1 100644
> ---- a/modules/preprocs/nasm/nasm-pp.c
> -+++ b/modules/preprocs/nasm/nasm-pp.c
> -@@ -1102,6 +1102,10 @@ hash(char *s)
> - {
> -     unsigned int h =3D 0;
> -     unsigned int i =3D 0;
> -+    /* Check if the input string is NULL to avoid null pointer derefere=
nce */
> -+    if (s =3D=3D NULL) {
> -+        return 0;
> -+    }
> -     /*
> -      * Powers of three, mod 31.
> -      */
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch b/me=
ta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
> deleted file mode 100644
> index ebae250ff9..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 3c3f968d48d768c1e355199d4067d99cb72abc26 Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Sat, 15 Nov 2025 13:30:12 +0100
> -Subject: [PATCH] Handle file descriptors with nonexisting env names bett=
er.
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
> -diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nas=
m-pp.c
> -index 512f02c3..f9f92dd1 100644
> ---- a/modules/preprocs/nasm/nasm-pp.c
> -+++ b/modules/preprocs/nasm/nasm-pp.c
> -@@ -1815,7 +1815,7 @@ inc_fopen(char *file, char **newname)
> -             error(ERR_WARNING, "environment variable `%s' does not exis=
t",
> -                   p1+1);
> -             *p2 =3D '%';
> --            p1 =3D p2+1;
> -+            pb =3D p1 =3D p2+1;
> -             continue;
> -         }
> -         /* need to expand */
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch b/me=
ta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
> deleted file mode 100644
> index 58b4ed1996..0000000000
> --- a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 81c1b7b0a28f052eaadddcb010944bf67e6ae257 Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Sat, 15 Nov 2025 13:24:21 +0100
> -Subject: [PATCH] Make sure CPU feature parsing use large enough string b=
uffer.
> -  Fixes CVE-2023-29579.
> -
> -Author: Petter Reinholdtsen <pere@debian.org>
> -Bug: https://github.com/yasm/yasm/issues/214
> -Bug-Debian: https://bugs.debian.org/1035951
> -Forwarded:  https://github.com/yasm/yasm/issues/214
> -Last-Update: 2025-04-30
> -
> -This patch is taken from Debian:
> -https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-202=
3-29579.patch/
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
> -@@ -165,8 +165,9 @@ x86_dir_cpu(yasm_object *object, yasm_valparamhead *=
valparams,
> -                 yasm_error_set(YASM_ERROR_SYNTAX,
> -                                N_("invalid argument to [%s]"), "CPU");
> -             else {
> --                char strcpu[16];
> --                sprintf(strcpu, "%lu", yasm_intnum_get_uint(intcpu));
> -+                char strcpu[21]; /* 21 =3D ceil(log10(LONG_MAX)+1) */
> -+                assert(8*sizeof(unsigned long) <=3D 64);
> -+                snprintf(strcpu, sizeof(strcpu), "%lu", yasm_intnum_get=
_uint(intcpu));
> -                 yasm_x86__parse_cpu(arch_x86, strcpu, strlen(strcpu));
> -             }
> -         } else
> diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-=
devtools/yasm/yasm_git.bb
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
> -     # Don't include $CC (which includes path to sysroot) in generated h=
eader.
> -     sed -i -e "s/^echo \"\/\* generated \$ac_cv_stdint_message \*\/\" >=
>\$ac_stdint$"// ${S}/m4/ax_create_stdint_h.m4
> -}
> -
> -CVE_STATUS_GROUPS +=3D "CVE_STATUS_HASH_UPDATE"
> -CVE_STATUS_HASH_UPDATE =3D "CVE-2021-33454 CVE-2023-31975 CVE-2023-37732=
"
> -CVE_STATUS_HASH_UPDATE[status] =3D "fixed-version: patched in current gi=
t hash"
> -
> -CVE_PRODUCT +=3D "tortall:yasm yasm_project:yasm"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122221): https://lists.openembedded.org/g/openembedde=
d-devel/message/122221
> Mute This Topic: https://lists.openembedded.org/mt/116566260/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [y=
oann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

