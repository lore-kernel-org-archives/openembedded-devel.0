Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 130DD747EC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 13:09:12 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id t14-v6so3407459uao.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jul 2018 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OvUjbRL5xgrFmIa0ZNJfQCCQmdEaNuK4Otbgi/daloo=;
	b=AHFFUEP97k6E5q1fiZ6dwQQWT3dfAn7H9GtlRYgojOViI8yVivyhSxTt5BFcDF02hd
	w7x9zVxt2+6/KhZnhYY2kncskQ3ERYocFjQfFM2lkDZIsyjjWtsiKYSDblF1Kqcg+SS0
	FwHwHf/0wGAbY1tzKPeapBncRrpnym4VjNaW/fP68NAgEpNwemD+TXPkYsXVhWvkE62s
	JwX/ZXOmOHE2UUmI4Bc+wpWV/pVj9+hxqdTvsGwzD1zWj2bxpigUoNYrM3zY6FDVtcfA
	UT7i0j6oEnWWYmSFqWLIMcV3Vg7MOvHzQOB6RqzTIxpO4J506v9z3XUe5k1gDt1Au2gA
	fFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OvUjbRL5xgrFmIa0ZNJfQCCQmdEaNuK4Otbgi/daloo=;
	b=TJGY9xh4bAQu/Lev9H6cKCWVRdkt92UCWr7VMy68/j8cZ4CfaKFBiBMsM9o/1vGxX3
	lIT4sSiZb33CbEq9POD9YBgvnJ69G6BIDRoAsN95NZmmNyBLsV3AxDeAEgmvuZuf3QbO
	LyxM7Vw9Z93ouL9oEQnko8ujtUeVW0yC0qFsKYeMsJDnpKA1umXvZ9JaOmXaFFVI8y8Q
	GAP/r8pjHqphzC193yhQX2SXx2KH37vhP/zQnsGmJLgUtg8eMs+iIu5s2IsxbwIe/0pP
	jDuxpfsNSUsdQFYeTSmn3aoKD5t/8+/eBTgDvb7AD/8PLBqamJHud4Biir3SpRnByXaN
	MqFA==
X-Gm-Message-State: APt69E33lTfYSwZqLjcQnjokjJ0W6BYekQhNLblm6vQnthcnl1/gZTmf
	AmA/AM5flZLOzFlg0x5GFMs+DauyhmondRupAxk=
X-Google-Smtp-Source: AAOMgpfL3FygncUrpPkKyMUOBfXiozCqAgnJp/C70RRSmiBqGXI7TVSeIwFsBYckO36cgr6n27F+soZVVcvTDmckR6Q=
X-Received: by 2002:ab0:5323:: with SMTP id
	x32-v6mr1144298uax.139.1530709753697; 
	Wed, 04 Jul 2018 06:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20180703092018.5018-1-ross.burton@intel.com>
	<20180703092018.5018-2-ross.burton@intel.com>
In-Reply-To: <20180703092018.5018-2-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jul 2018 06:08:05 -0700
Message-ID: <CAMKF1sr_FmVM2m9dgU4xGVpNapzJqhng-pbHEx+RCc22zagQEA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/4] php: disable non-deterministic valgrind
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
X-List-Received-Date: Wed, 04 Jul 2018 13:09:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 3, 2018 at 2:42 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Valgrind support in PHP looks on the host for Valgrind headers, backport a patch
> from upstream so that Valgrind support is disabled by default.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc            |   1 +
>  meta-oe/recipes-devtools/php/php/valgrind.patch | 115 ++++++++++++++++++++++++
>  2 files changed, 116 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/php/php/valgrind.patch
>

Fails to apply

Applying patch valgrind.patch
patching file NEWS
Hunk #1 succeeded at 133 with fuzz 2 (offset 131 lines).
patching file acinclude.m4
Hunk #1 FAILED at 3249.
1 out of 1 hunk FAILED -- rejects in file acinclude.m4
patching file configure.ac
patch unexpectedly ends in middle of line
Hunk #1 FAILED at 753.
1 out of 1 hunk FAILED -- rejects in file configure.ac
Patch valgrind.patch does not apply (enforce with -f)



> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 066b97cd26..f262d60d15 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -24,6 +24,7 @@ SRC_URI_append_class-target = " \
>              file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
>              file://70_mod_php${PHP_MAJOR_VERSION}.conf \
>              file://php-fpm.service \
> +            file://valgrind.patch \
>            "
>  S = "${WORKDIR}/php-${PV}"
>
> diff --git a/meta-oe/recipes-devtools/php/php/valgrind.patch b/meta-oe/recipes-devtools/php/php/valgrind.patch
> new file mode 100644
> index 0000000000..c3e232ba23
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/valgrind.patch
> @@ -0,0 +1,115 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 25ba60b1479eb332a7388732f3ee5467000fbe73 Mon Sep 17 00:00:00 2001
> +From: Michael Heimpold <mhei@heimpold.de>
> +Date: Wed, 14 Feb 2018 14:46:17 +0100
> +Subject: [PATCH] Fixed bug #75722: Rework valgrind detection
> +
> +As described in bug report #75722, the configure script (acinclude.m4)
> +currently searches for the valgrind header file and enables valgrind
> +support if found.
> +
> +When cross-compiling the searched paths are invalid for the target
> +platform because they belong to the host system. At the moment, there is
> +no way to tell the build system a dedicated path where to look for the
> +header file.
> +
> +This leads to the issue, that when cross-compiling eg. for ARMv5 platform,
> +that valgrind header file is detected - e.g. because host system is amd64 -
> +and support is enabled - but target platform will never support valgrind
> +(valgrind requires e.g. at least ARMv7).
> +
> +This change reworks the detection so that user could manually opt-in
> +valgrind support and optionally specify a directory where the build system
> +should look for the header file using the --with-valgrind option.
> +---
> + NEWS         |  4 ++++
> + acinclude.m4 | 20 --------------------
> + configure.ac | 30 +++++++++++++++++++++++++++++-
> + 3 files changed, 33 insertions(+), 21 deletions(-)
> +
> +diff --git a/NEWS b/NEWS
> +index 1faf13831ebd..5d65fd083357 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -2,6 +2,10 @@ PHP                                                                        NEWS
> + |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
> + ?? ??? 2018, PHP 7.2.5
> +
> ++- Core:
> ++  . Fixed bug #75722 (Convert valgrind detection to configure option).
> ++    (Michael Heimpold)
> ++
> + - Mbstring:
> +   . Fixed bug #75944 (Wrong cp1251 detection). (dmk001)
> +   . Fixed bug #76113 (mbstring does not build with Oniguruma 6.8.1).
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index d42d70853515..eb06cb7e363f 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -3249,23 +3249,3 @@ AC_DEFUN([PHP_CHECK_BUILTIN_SSUBLL_OVERFLOW], [
> +
> + dnl Load the AX_CHECK_COMPILE_FLAG macro from the autoconf archive.
> + m4_include([build/ax_check_compile_flag.m4])
> +-
> +-dnl PHP_CHECK_VALGRIND
> +-AC_DEFUN([PHP_CHECK_VALGRIND], [
> +-  AC_MSG_CHECKING([for valgrind])
> +-
> +-  SEARCH_PATH="/usr/local /usr"
> +-  SEARCH_FOR="/include/valgrind/valgrind.h"
> +-  for i in $SEARCH_PATH ; do
> +-    if test -r $i/$SEARCH_FOR; then
> +-      VALGRIND_DIR=$i
> +-    fi
> +-  done
> +-
> +-  if test -z "$VALGRIND_DIR"; then
> +-    AC_MSG_RESULT([not found])
> +-  else
> +-    AC_MSG_RESULT(found in $VALGRIND_DIR)
> +-    AC_DEFINE(HAVE_VALGRIND, 1, [ ])
> +-  fi
> +-])
> +diff --git a/configure.ac b/configure.ac
> +index 05f94f08a9c8..c5d9be978bda 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -753,7 +753,35 @@ if test "x$php_crypt_r" = "x1"; then
> +   PHP_CRYPT_R_STYLE
> + fi
> +
> +-PHP_CHECK_VALGRIND
> ++dnl Check valgrind support
> ++PHP_ARG_WITH(valgrind, [whether to enable valgrind support],
> ++[  --with-valgrind=DIR     Enable valgrind support], yes, no)
> ++
> ++if test "$PHP_VALGRIND" != "no"; then
> ++
> ++  AC_MSG_CHECKING([for valgrind header])
> ++
> ++  if test "$PHP_VALGRIND" = "yes"; then
> ++    SEARCH_PATH="/usr/local /usr"
> ++  else
> ++    SEARCH_PATH="$PHP_VALGRIND"
> ++  fi
> ++
> ++  SEARCH_FOR="/include/valgrind/valgrind.h"
> ++  for i in $SEARCH_PATH ; do
> ++    if test -r $i/$SEARCH_FOR; then
> ++      VALGRIND_DIR=$i
> ++    fi
> ++  done
> ++
> ++  if test -z "$VALGRIND_DIR"; then
> ++    AC_MSG_RESULT([not found])
> ++  else
> ++    AC_MSG_RESULT(found in $VALGRIND_DIR)
> ++    AC_DEFINE(HAVE_VALGRIND, 1, [ ])
> ++  fi
> ++
> ++fi
> +
> + dnl General settings.
> + dnl -------------------------------------------------------------------------
> \ No newline at end of file
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

