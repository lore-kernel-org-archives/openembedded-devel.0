Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 036A17D350
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 04:09:04 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d13so25922583qth.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 21:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2s60qRVAgwudipWXNkN6LYXTpm93SGZ9ov3LMyULG5Q=;
	b=C5rBU7/ij25PYmlmv/ikz8G8aLQ3ACobAyyKvhCZpkZgmNn3gQw/SHf8ZH4NGDsZ0Z
	3VHumIWSjqerBwFkRQ9YPFahB6HrD6YGn9zYpjLmmrB5Y4Xk28hXFc2f2K9iVL4H+L5F
	ELGfi7Tn/RXf5n/RfpGp281sQfWlpCD1UvFckYqdbGlZSQAdl3hAJcSQhA5HhX4B1o0b
	sDptQNJ22dgUDp9YTbPsPxP79hmNPISb9P8xQTLOpvrRbotbVHHGt5iqrYS1GulvUfvt
	L5/RBV0YIq3EWlm7LjJkTJcV/2R8koPN0dJcqfBhvQk7NxCkfFEZzsjga8HvNUTwCT2S
	FuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2s60qRVAgwudipWXNkN6LYXTpm93SGZ9ov3LMyULG5Q=;
	b=HgeR7dlmUOkv7AdMA9zjAZ/KfzjfuCSXulOfJVDEbBlB4wox5RKBHij/R0aiOXfYsa
	XzG8ebdliysif3tj5rkeLE8D/Q/o6cv5w28mM4Y7dUHwy/hLx7Vt6t/Uzwu3MEUZmUL8
	ECVacUpYFynyajK7Ik6NJun4aV0HeC7cDZdF2UXFNOcNlR8sEsSX/Iiqvt3y4zYVWFGr
	Uw6doZY84T2p7J3YDT9nNpAFihoIbz47Bo2syIpZ0BnQgeiy38YrgUZtkcKJgny8khxW
	K39K1VT/tv0XGCDEbLDs++vXeM/lL8RWUzanJgTCSSu44OxNKj0oys3lkqSA73j4lNEg
	6myA==
X-Gm-Message-State: APjAAAVOSBuvvOpdSXR/eNHTAbuavOTTbrboK76BuTk6JmZYH4WW/Y5H
	oR+82W/I3xtlLHFmntyFJpcgAN+Vdr9toRvmyYEzcDNC
X-Google-Smtp-Source: APXvYqwfHRkQjNAH3GnEnXsa3bpoXVjSHQZU6Yk0ctcr54nNQS0Z2QVJVkwCEceF8ToVCp4MbvbqWAelxSdGn9YdNu8=
X-Received: by 2002:ac8:f86:: with SMTP id b6mr68748929qtk.330.1555474145767; 
	Tue, 16 Apr 2019 21:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <PSXP216MB02777C55F909552A664FC2D6DD240@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PSXP216MB02777C55F909552A664FC2D6DD240@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Apr 2019 21:08:39 -0700
Message-ID: <CAMKF1sr4PahrHE+799vZxDsVHCQocxxj5dmPPN7b9PoEZaxp5A@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Fix missing Python.h build failure
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
X-List-Received-Date: Wed, 17 Apr 2019 04:09:05 -0000
Content-Type: text/plain; charset="UTF-8"

wrong ml I guess.

On Tue, Apr 16, 2019 at 3:31 AM Alistair Francis <alistair@alistair23.me> wrote:
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  ...rt-pylibfdt-Use-Python-2-in-Makefile.patch | 37 +++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-Python-2-in-Makefile.patch
>
> diff --git a/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-Python-2-in-Makefile.patch b/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-Python-2-in-Makefile.patch
> new file mode 100644
> index 0000000000..a7c934d49e
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-Python-2-in-Makefile.patch
> @@ -0,0 +1,37 @@
> +From 30f41eae3d7a3d07e1d62b98d11430d5b2d24513 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair@alistair23.me>
> +Date: Sat, 13 Apr 2019 13:41:58 -0700
> +Subject: [PATCH] Revert "pylibfdt: Use Python 2 in Makefile"
> +
> +This reverts commit 03e6151d5bb42fd055e9c1e571440359bd5b5282.
> +
> +Revert the patch to avoid:
> +| scripts/dtc/pylibfdt/libfdt_wrap.c:149:11: fatal error: Python.h: No such file or directory
> +|  # include <Python.h>
> +|            ^~~~~~~~~~
> +| compilation terminated.
> +
> +errors when buildling u-boot in OE.
> +
> +Signed-off-by: Alistair Francis <alistair@alistair23.me>
> +Upstream-Status: Inappropriate [configuration]
> +---
> + scripts/dtc/pylibfdt/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/scripts/dtc/pylibfdt/Makefile b/scripts/dtc/pylibfdt/Makefile
> +index 15e66ad44d..c769d7db06 100644
> +--- a/scripts/dtc/pylibfdt/Makefile
> ++++ b/scripts/dtc/pylibfdt/Makefile
> +@@ -21,7 +21,7 @@ quiet_cmd_pymod = PYMOD   $@
> +               CPPFLAGS="$(HOSTCFLAGS) -I$(LIBFDT_srcdir)" OBJDIR=$(obj) \
> +               SOURCES="$(PYLIBFDT_srcs)" \
> +               SWIG_OPTS="-I$(LIBFDT_srcdir) -I$(LIBFDT_srcdir)/.." \
> +-              $(PYTHON2) $< --quiet build_ext --inplace
> ++              $(PYTHON) $< --quiet build_ext --inplace
> +
> + $(obj)/_libfdt.so: $(src)/setup.py $(PYLIBFDT_srcs) FORCE
> +       $(call if_changed,pymod)
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index a0212e1b6b..5e81cabdbd 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -10,6 +10,8 @@ PE = "1"
>  # repo during parse
>  SRCREV = "3c99166441bf3ea325af2da83cfe65430b49c066"
>
> -SRC_URI = "git://git.denx.de/u-boot.git"
> +SRC_URI = "git://git.denx.de/u-boot.git \
> +           file://0001-Revert-pylibfdt-Use-Python-2-in-Makefile.patch \
> +          "
>
>  S = "${WORKDIR}/git"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

