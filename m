Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id C2C3A7CC7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 01:37:24 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id x6so8919048qki.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 17:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wfCyeGQffa83o+yy0pNFhKYZgdK0w7+mkg22LhZTLA0=;
	b=KtJT4ifoaYlcsmH39lcdaF1Asqs5+fR/xURqrJs1i5CLT1F8k3Tkz57lyfPL09uWO/
	CWMlxJ2QuZKF59O0bm7cEOjWMQriijMWTAZPQIePCcCQR0pKBCyWpdRmWYp0XTaER8xI
	wpLbsCtitWLRlu5hjtuvOpgj3ZRenrhJDofyc/d9vZrF29sLmRvxItbK7MB1EwsHfClT
	HTOsVB5qn80XfGqfD+Z0ERdFZJ1URL1aSuRkypSODEEf1IifpdJ0EBzmYKYtRdIM4vxZ
	e1BePpJLuNdkNyJkRPNtSrj5YUsbNw3K8PZgPkPtaLq3Oj07+JyfMk/8vPY/jgpP780Q
	6ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wfCyeGQffa83o+yy0pNFhKYZgdK0w7+mkg22LhZTLA0=;
	b=olvah/7aCl1zni64+mXE+kLGk+G6uE9LPpJ7dwiA8+GOMkbEpv+UwqCKoL9tyyBu7o
	RoHx3fShBM8rB5mQR+iqEI/935UVFFAla+7mE8MDsw4l5DJMcpR/nKzkbdi/UUt1ri3h
	OFS2lnbvtb5qWAxEf3BEZdQW3v1Y0HQzXSeRklUt9kQo7iAhDUWfgillgQqIfJJdmVY9
	hqHEnDxPJZW2uZAkl6GhbMTVwJuESagBb4p52VdQx8W9RDNO+q5zgXlglvSUC/rVCOVt
	crsgWw27ZmuUTfmCTvARGC7WzoQFuBMaN6fNDhZ7gZY7L6aQIQptgX6yxZicvN97Uusv
	HGCA==
X-Gm-Message-State: AHQUAuYw6V5mNpIWocxzK4EXNhpOGWANppSCCA3Sp28RoXxv9GZjBTku
	i+ZHK1A8r1BYlZsf4zaoc06jZEH/rX0xT+c05Zy+n5/o
X-Google-Smtp-Source: AHgI3IZ/nCYkyoaIiuEGoEllD1LBa8CMSh8W/8TQN0EyjKhK0fYWf8U4z8J35mj/0kx2mQtNwgq4Ys7BeeYmSmcFcHU=
X-Received: by 2002:a37:a7ca:: with SMTP id q193mr389690qke.102.1551231445340; 
	Tue, 26 Feb 2019 17:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20190226024522.113503-1-mingli.yu@windriver.com>
In-Reply-To: <20190226024522.113503-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 17:36:59 -0800
Message-ID: <CAMKF1sqfUttvk00sNMQS6JGXvB=gBOm=_9zLaiWQ-zBAchs8tg@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] indent: Upgrade to 2.2.12
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
X-List-Received-Date: Wed, 27 Feb 2019 01:37:24 -0000
Content-Type: text/plain; charset="UTF-8"

Native version fails to build on ubuntu 14.04

https://errors.yoctoproject.org/Errors/Details/230511/

On Mon, Feb 25, 2019 at 6:45 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add two patches to fix the build error.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...01-Makefile.am-remove-regression-dir.patch | 67 +++++++++++++++++++
>  ...ent.c-correct-the-check-for-locale.h.patch | 40 +++++++++++
>  .../{indent_2.2.10.bb => indent_2.2.12.bb}    |  9 ++-
>  3 files changed, 113 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/indent/indent/0001-Makefile.am-remove-regression-dir.patch
>  create mode 100644 meta-oe/recipes-extended/indent/indent/0001-src-indent.c-correct-the-check-for-locale.h.patch
>  rename meta-oe/recipes-extended/indent/{indent_2.2.10.bb => indent_2.2.12.bb} (68%)
>
> diff --git a/meta-oe/recipes-extended/indent/indent/0001-Makefile.am-remove-regression-dir.patch b/meta-oe/recipes-extended/indent/indent/0001-Makefile.am-remove-regression-dir.patch
> new file mode 100644
> index 000000000..357d77d83
> --- /dev/null
> +++ b/meta-oe/recipes-extended/indent/indent/0001-Makefile.am-remove-regression-dir.patch
> @@ -0,0 +1,67 @@
> +From 27bda5ee884e79d6d0e76955124d2b0c5798d6cf Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Mon, 25 Feb 2019 00:34:17 -0800
> +Subject: [PATCH] Makefile.am: remove regression dir
> +
> +Remove regression dir to fix below do_compile
> +error:
> +| Making all in regression
> +| /bin/sh: line 20: cd: regression: No such file or directory
> +| Makefile:451: recipe for target 'all-recursive' failed
> +
> +BTW, it should be safe not to cover regression dir
> +as there is no Makefile.in under ${S}/regression
> +and the content of ${S}/regression/Makefile as below.
> +-------------------------------------
> +all:
> +
> +install:
> +
> +check:
> +        ./TEST
> +
> +distclean: clean
> +
> +maintainer-clean: clean
> +
> +distdir:
> +
> +clean:
> +        @rm -rf output
> +
> +.PHONY: all install
> +-------------------------------------
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + Makefile.am | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index ba37a42..548fea7 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,7 +1,7 @@
> + ## Process this file with automake to produce Makefile.in
> + AUTOMAKE_OPTIONS = no-texinfo.tex
> +
> +-SUBDIRS = intl src doc po man regression
> ++SUBDIRS = intl src doc po man
> +
> + BUILT_SOURCES =
> +
> +@@ -13,8 +13,7 @@ EXTRA_DIST =         README.md \
> +               aclocal/UTIMBUF.m4 \
> +               miscel/Makefile.mingw32 \
> +               miscel/README.vc++ \
> +-              bootstrap \
> +-              regression
> ++              bootstrap
> +
> + DISTCLEANFILES=config/config.cache config/config.log config.h
> +
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/indent/indent/0001-src-indent.c-correct-the-check-for-locale.h.patch b/meta-oe/recipes-extended/indent/indent/0001-src-indent.c-correct-the-check-for-locale.h.patch
> new file mode 100644
> index 000000000..7df7ecb38
> --- /dev/null
> +++ b/meta-oe/recipes-extended/indent/indent/0001-src-indent.c-correct-the-check-for-locale.h.patch
> @@ -0,0 +1,40 @@
> +From 75369ce004ec0f5e46a432fa1dac8cfc7ae1ef8d Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Sun, 24 Feb 2019 22:35:08 -0800
> +Subject: [PATCH] src/indent.c: correct the check for locale.h
> +
> +Adjust to check HAVE_LC_MESSAGES or HAVE_LOCALE_H
> +to determine whether include locale.h or not to
> +fix below issue:
> +
> +| ../../indent-2.2.12/src/indent.c: In function 'main':
> +| ../../indent-2.2.12/src/indent.c:1062:5: error: implicit declaration of function 'setlocale'; did you mean 'setstate'? [-Werror=implicit-function-declaration]
> +|      setlocale(LC_ALL, "");
> +|      ^~~~~~~~~
> +|      setstate
> +| ../../indent-2.2.12/src/indent.c:1062:5: error: nested extern declaration of 'setlocale' [-Werror=nested-externs]
> +| ../../indent-2.2.12/src/indent.c:1062:15: error: 'LC_ALL' undeclared (first use in this function)
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + src/indent.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/indent.c b/src/indent.c
> +index 4d666e2..0c2780b 100644
> +--- a/src/indent.c
> ++++ b/src/indent.c
> +@@ -71,7 +71,7 @@
> + #include <string.h>
> + #include <ctype.h>
> + #include <stdlib.h>
> +-#ifdef HAVE_LOCALE_H
> ++#if defined(HAVE_LC_MESSAGES) || defined(HAVE_LOCALE_H)
> + #include <locale.h>
> + #endif
> + #include "indent.h"
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/indent/indent_2.2.10.bb b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
> similarity index 68%
> rename from meta-oe/recipes-extended/indent/indent_2.2.10.bb
> rename to meta-oe/recipes-extended/indent/indent_2.2.12.bb
> index d25e8e317..eda388e37 100644
> --- a/meta-oe/recipes-extended/indent/indent_2.2.10.bb
> +++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
> @@ -11,9 +11,12 @@ LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  DEPENDS = "virtual/gettext"
>
> -SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
> -SRC_URI[md5sum] = "be35ea62705733859fbf8caf816d8959"
> -SRC_URI[sha256sum] = "8a9b41be5bfcab5d8c1be74204b10ae78789fc3deabea0775fdced8677292639"
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
> +           file://0001-src-indent.c-correct-the-check-for-locale.h.patch \
> +           file://0001-Makefile.am-remove-regression-dir.patch \
> +"
> +SRC_URI[md5sum] = "4764b6ac98f6654a35da117b8e5e8e14"
> +SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb3472664263bb8b"
>
>  inherit autotools gettext
>
> --
> 2.17.1
>

