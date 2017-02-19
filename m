Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E27EC71CCB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 19:57:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r18so11068741wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d39ILyoSsT3tdd+enT6lTN7caaButQCIliEvaSyrZx8=;
	b=afUDOULCD7F8An/ScH9+LsH5Z3HfMO4EoVgyszryD07lFIweAcetAwyzVgXucljJrO
	9L/ZVELKWcUj3M1KbpzvqkN4Oydmu8q+3qtfs3fFqgl5X+2x8BYWZGHMTbvpIBlolESQ
	bdeX/VPaOjkOUgJTbsxyDW0UhL/6J/NuKT4Ig+b8gwb2KZd1JHWr7gtH5Fml/4KHyk0B
	8Hu+NZRUJvJD/b4401ZzPQedY0q6/5PG3tc0qEhxuTHaNkHO94oKUd/K2HyURzCLSo9o
	igd8hRyq9/Dew8DdH5xYAi0ahheTTPM61lLN1eYoVYoXZ9Kdhjfo/OI3V+fjof4z4hqJ
	kdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d39ILyoSsT3tdd+enT6lTN7caaButQCIliEvaSyrZx8=;
	b=Mt74ykhkaN/Gbe9ctQVE/KmQ+Ak9JzzuaiGrk8hGH5QKCPNVjNcfJOhYGS4UjNHo/2
	WkKUBcKJhyYZ1M7s0fVYUKvqmyYdTfwz9Ioes48cjVTdjUBXaeLtVZep1GxWmgT2HSiq
	Y5e8ahCY3y2NRIV+Ghq1T3XuMmuZg4rjS4cLc1H+g2DsLHMHWpXSbn2EYpgwoZCAXa6s
	MKWja28J8d/AIHFsmEeUpzhssxiPkHYWO6wiB2KYDEY5cNDPjZfd7L3rnB5sAhjvmRuS
	s8Vf/bqkHBeo8AO5yNf5E3ougGMZY5ki2peDi0XwmioVOU8Uj/YU8be2fYUGdv7MhZQv
	jOmA==
X-Gm-Message-State: AMke39kxxNdw25DcDiBB8QBUrLOtfuCOSkBv49UzYucQpKEgDjXPIAnFm3Voghyzzmb9Lc5dgEgP7SW/o/P7cg==
X-Received: by 10.28.211.205 with SMTP id k196mr14238228wmg.124.1487534247526; 
	Sun, 19 Feb 2017 11:57:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Sun, 19 Feb 2017 11:57:26 -0800 (PST)
In-Reply-To: <20170217081125.9677-1-koen.kooi@linaro.org>
References: <20170217081125.9677-1-koen.kooi@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 19 Feb 2017 20:57:26 +0100
Message-ID: <CA+chaQf-4B3MVmPTW9s_aw=yyUCha78y=vUA=3fQqL7gFMt0-w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] efivar: update to 0.30 to fix readdir* issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Feb 2017 19:57:28 -0000
Content-Type: text/plain; charset=UTF-8

The native version is now failing:
http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132936.html

On Fri, Feb 17, 2017 at 9:11 AM, Koen Kooi <koen.kooi@linaro.org> wrote:

> Drop patches with upstream fixes.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  .../efivar/efivar/0002-disable-static-build.patch  | 33 ----------------
>  .../0004-fix-unknow-option-for-gold-linker.patch   | 38
> ------------------
>  .../fix-compile-failure-with-host-gcc-4.6.patch    | 45
> ----------------------
>  .../efivar/{efivar_0.24.bb => efivar_0.30.bb}      |  8 +---
>  4 files changed, 2 insertions(+), 122 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-
> static-build.patch
>  delete mode 100644 meta-oe/recipes-extended/
> efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar/fix-compile-
> failure-with-host-gcc-4.6.patch
>  rename meta-oe/recipes-extended/efivar/{efivar_0.24.bb => efivar_0.30.bb}
> (72%)
>
> diff --git a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> b/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> deleted file mode 100644
> index 951b159..0000000
> --- a/meta-oe/recipes-extended/efivar/efivar/0002-disable-
> static-build.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 126e0d3c1ad74cf5b0abe9e98ec444bcc3c83159 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen.kooi@linaro.org>
> -Date: Fri, 4 Mar 2016 14:53:55 +0100
> -Subject: [PATCH 2/2] disable static build
> -
> -Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> -
> -Upstream-Status: Inappropriate [meta-oe specific]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> ----
> - src/Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/Makefile b/src/Makefile
> -index 1829d22..c7a0ca3 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -8,9 +8,9 @@ include $(TOPDIR)/Make.defaults
> -
> - LIBTARGETS=libefivar.so libefiboot.so
> - STATICLIBTARGETS=libefivar.a libefiboot.a
> --BINTARGETS=efivar efivar-static
> -+BINTARGETS=efivar
> - PCTARGETS=efivar.pc efiboot.pc
> --TARGETS=$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS) $(PCTARGETS)
> -+TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS)
> -
> - LIBEFIBOOT_SOURCES = crc32.c creator.c disk.c gpt.c linux.c loadopt.c
> - LIBEFIBOOT_OBJECTS = $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES))
> ---
> -2.4.3
> -
> diff --git a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
> b/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-
> option-for-gold-linker.patch
> deleted file mode 100644
> index 5d50c19..0000000
> --- a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-
> option-for-gold-linker.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From b3d35e7dd27a755df5acbe050837885914dbb28b Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Tue, 10 May 2016 11:34:50 -0400
> -Subject: [PATCH]  fix unknow option for gold linker
> -
> -- Revert the following patch, since oe-core work with gcc 5
> -...
> -commit 3055a3797f16693dfdd855fa68bc57fd900dc408
> -Author: Peter Jones <pjones@redhat.com>
> -Date:   Mon Feb 15 14:15:40 2016 -0500
> -
> -    Make gcc.specs work with gcc 6 / binutils 2.26
> -
> -    Apparently binutils 2.26 gets real picky about "ld -PIC" vs "ld
> -fPIC".
> -
> -    Signed-off-by: Peter Jones <pjones@redhat.com>
> -...
> -
> -- Remove unknown option '--add-needed'
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc.specs | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc.specs b/gcc.specs
> -index 24fabc2..5b0fdef 100644
> ---- a/gcc.specs
> -+++ b/gcc.specs
> -@@ -14,4 +14,4 @@
> - + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings
> -Wl,-static -static -Wl,-z,relro,-z,now}
> -
> - *link:
> --+ %{!static:--fatal-warnings} --no-undefined-version
> --no-allow-shlib-undefined --add-needed -z now --build-id
> %{!static:%{!shared:-PIE}} %{shared:-z relro -PIC} %{static:%<pie}
> -++ %{!static:--fatal-warnings} --no-undefined-version
> --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}}
> %{shared:-z relro -fPIC} %{static:%<pie}
> ---
> -2.8.1
> -
> diff --git a/meta-oe/recipes-extended/efivar/efivar/fix-compile-
> failure-with-host-gcc-4.6.patch b/meta-oe/recipes-extended/
> efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
> deleted file mode 100644
> index 1c68a29..0000000
> --- a/meta-oe/recipes-extended/efivar/efivar/fix-compile-
> failure-with-host-gcc-4.6.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 1361225abbaba878960f970df39a4570bbc39553 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 26 May 2016 21:50:01 -0400
> -Subject: [PATCH] fix compile failure with older host gcc (<=4.6)
> -
> -While host gcc version is 4.6.3 in ubuntu 1204, it
> -did not recognize -std=gnu11 and -Wmaybe-uninitialized.
> -
> -While host gcc version is 4.4.7 in centos6, it
> -did not recognize -std=gnu11, -Wmaybe-uninitialized,
> -and -flto.
> -
> -For native build, use -std=gnu99 to replace -std=gnu11,
> -and directly remove -Wmaybe-uninitialized and -flto.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc.specs | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc.specs b/gcc.specs
> -index 0d4bbda..3802ca6 100644
> ---- a/gcc.specs
> -+++ b/gcc.specs
> -@@ -2,13 +2,13 @@
> - + -D_GNU_SOURCE
> -
> - *efivar_cpp_options:
> -- -Werror -Wall -std=gnu11 -Wextra
> -+ -Werror -Wall -std=gnu99 -Wextra
> -
> - *cpp_options:
> - + %(efivar_cpp_options)
> -
> - *cc1_options:
> --+ %(efivar_cpp_options) -Wmaybe-uninitialized -fno-merge-constants -flto
> -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%
> {!fPIC:%{!fno-pic:-fPIE}}}}}}
> -++ %(efivar_cpp_options) -fno-merge-constants -fvisibility=hidden
> %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
> -
> - *self_spec:
> - + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings
> -Wl,-static -static -Wl,-z,relro,-z,now}
> ---
> -2.8.1
> -
> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
> b/meta-oe/recipes-extended/efivar/efivar_0.30.bb
> similarity index 72%
> rename from meta-oe/recipes-extended/efivar/efivar_0.24.bb
> rename to meta-oe/recipes-extended/efivar/efivar_0.30.bb
> index 4c7793f..f002a27 100644
> --- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
> +++ b/meta-oe/recipes-extended/efivar/efivar_0.30.bb
> @@ -10,15 +10,13 @@ DEPENDS_append_class-target = " efivar-native"
>
>  COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
>
> -SRCREV = "963cb2e5adc145fe00717f94e382f2973f80e753"
> +SRCREV = "270205d88598d60d4e75f9cec13b8d25d82ee550"
>  SRC_URI = "git://github.com/rhinstaller/efivar.git \
> -           file://0002-disable-static-build.patch \
>  "
>  SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch
> \
>                                  file://0003-efivar-fix-for-cross-compile.patch
> \
> -                                ${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '',
> d)} \
>                                "
> -SRC_URI_append_class-native = " file://fix-compile-failure-with-host-gcc-4.6.patch
> \
> +SRC_URI_append_class-native = " \
>                                  file://allow-multi-definitions-for-native.patch
> \
>                                "
>
> @@ -41,5 +39,3 @@ do_install_append_class-native() {
>
>  BBCLASSEXTEND = "native"
>
> -
> -PNBLACKLIST[efivar] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/132821/"
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

