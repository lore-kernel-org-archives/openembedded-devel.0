Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C408D771DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 10:59:47 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so660400wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Gq60zKvFgbgkCnmKaRPhGB/TpBWQ9fmvN0kqkmFT0ok=;
	b=B+xH51/fSgWbR0Ls4WWfCU08l2o3VtUaEXAzJBtJYCqNycUeUKW7y7FUSzC5AsdxZS
	lyf+R1JBQh5gHRRAUU9/hChIzUr0LGKyNMC8hOUDGHvEUK9omOFaQ9zQKh4OLos9kh6g
	76z/2/wpPc58AK7O6RpUdHy0+PZ0+y4Wux39XKOO22C01IxVBYYTdN1eC2XFn8nzwSdW
	fmmljZpIqai0ab9PdCb7VzGfbuhJMqbFesbO2RrtYqYrS6XPdoxHMPQ6Ob0uxi1rvsKY
	XHiw3mlA7Zr6XbSrFtxZW+4y9zdNZN5a8jke4sCQLQbqSJNKMK+nAC52j7pZP98x4AXn
	0Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Gq60zKvFgbgkCnmKaRPhGB/TpBWQ9fmvN0kqkmFT0ok=;
	b=k+A8yNMAwDLMtiWWXKp920xF/6XDKHQBZFFooaNKY2WBqssj75DLp0mbKUFqSBRv/A
	tqtIygg7H35RbUPNmSSqUDYEv72uqRLtb8As+11Nxzq634CObJgOtwnee/fTC8m3U0GS
	mCu4UHxVBeh7FbrPzhlzmGTLMgJazag30443ZguaeRiN/ray+DlVsoO7lJb8rTVMQGCk
	FscX3ii/SNr8uY5SI2eTLiA+zLpgYfD7H1tkia+NKH2Y3AY022ySCQteTbkkmqUtffd1
	dlKyWaJhGV2KPeE5UsIj36/VesauRPUZCJBxnvcJxy0xaSqDVRv6kGg3Huij21Dor4O/
	nSJQ==
X-Gm-Message-State: AEkoouvnj7k2CR5a4CEL9gQUYEZDEmMfSae/XKTI6jL7rh+sxW/pVqFdFxv/cDRVr/BeaMTKYfu+5NKsayW4oQ==
X-Received: by 10.25.21.16 with SMTP id l16mr1465863lfi.229.1470913186878;
	Thu, 11 Aug 2016 03:59:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 11 Aug 2016 03:59:46 -0700 (PDT)
In-Reply-To: <1470910246-952-2-git-send-email-ricardo.ribalda@gmail.com>
References: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
	<1470910246-952-2-git-send-email-ricardo.ribalda@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 Aug 2016 12:59:46 +0200
Message-ID: <CA+chaQfOXyJgkU9W=9rxetwQfwG38FioJ_kKfg=XUcPRaqZZ5g@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/2] glog: Update to version 0.3.4
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
X-List-Received-Date: Thu, 11 Aug 2016 10:59:48 -0000
Content-Type: text/plain; charset=UTF-8

github archives are regenerated from time to time with checksum change, so
use normal git checkout instead of archive.

Move LIC* variable bellow HOMEPAGE where they were and resend with -M.

On Thu, Aug 11, 2016 at 12:10 PM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> -The repository has been moved to github.
> -There is a new release 0.3.4
> -Add a user configurable dependency on gflag
> -Merge .inc file on the recipe
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/glog/glog.inc              | 11 -------
>  ...configure.ac-Allow-user-to-disable-gflags.patch | 35
> ++++++++++++++++++++++
>  meta-oe/recipes-support/glog/glog_0.3.3.bb         |  6 ----
>  meta-oe/recipes-support/glog/glog_0.3.4.bb         | 22 ++++++++++++++
>  4 files changed, 57 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/glog/glog.inc
>  create mode 100644 meta-oe/recipes-support/glog/
> glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
>  delete mode 100644 meta-oe/recipes-support/glog/glog_0.3.3.bb
>  create mode 100644 meta-oe/recipes-support/glog/glog_0.3.4.bb
>
> diff --git a/meta-oe/recipes-support/glog/glog.inc
> b/meta-oe/recipes-support/glog/glog.inc
> deleted file mode 100644
> index 8a1fb4250bbb..000000000000
> --- a/meta-oe/recipes-support/glog/glog.inc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -DESCRIPTION = "The glog library implements application-level logging.
> This \
> -library provides logging APIs based on C++-style streams and various
> helper \
> -macros."
> -HOMEPAGE = "https://code.google.com/p/google-glog/"
> -
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
> -
> -DEPENDS = "libunwind"
> -
> -inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-support/glog/glog/0001-configure.ac-
> Allow-user-to-disable-gflags.patch b/meta-oe/recipes-support/
> glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
> new file mode 100644
> index 000000000000..596281ff6842
> --- /dev/null
> +++ b/meta-oe/recipes-support/glog/glog/0001-configure.ac-
> Allow-user-to-disable-gflags.patch
> @@ -0,0 +1,35 @@
> +From 0fabde0515e180c53961c27346dd7a79cffa4c1f Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Date: Thu, 11 Aug 2016 11:49:36 +0200
> +Subject: [PATCH] configure.ac: Allow user to disable gflags
> +
> +Under some circumstances like cross-compilation, the user might not want
> +to enable support for gflags.
> +
> +This patch allows support for --without-gflags
> +
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +---
> + configure.ac | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 7b4d21e7ae8a..eba5e5cda1ea 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -136,7 +136,11 @@ AC_ARG_WITH(gflags, AS_HELP_STRING[--with-gflags=
> GFLAGS_DIR],
> +   CFLAGS="$CFLAGS $GFLAGS_CFLAGS"
> +   LIBS="$LIBS $GFLAGS_LIBS"
> + )
> +-AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=1,
> ac_cv_have_libgflags=0)
> ++if test x"$with_gflags" = x"no"; then
> ++  ac_cv_have_libgflags=0
> ++else
> ++  AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=1,
> ac_cv_have_libgflags=0)
> ++fi
> + if test x"$ac_cv_have_libgflags" = x"1"; then
> +   AC_DEFINE(HAVE_LIB_GFLAGS, 1, [define if you have google gflags
> library])
> +   if test x"$GFLAGS_LIBS" = x""; then
> +--
> +2.8.1
> +
> diff --git a/meta-oe/recipes-support/glog/glog_0.3.3.bb
> b/meta-oe/recipes-support/glog/glog_0.3.3.bb
> deleted file mode 100644
> index de3f0765dec9..000000000000
> --- a/meta-oe/recipes-support/glog/glog_0.3.3.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require glog.inc
> -
> -SRC_URI = "http://google-glog.googlecode.com/files/glog-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "a6fd2c22f8996846e34c763422717c18"
> -SRC_URI[sha256sum] = "fbf90c2285ba0561db7a40f8a4eefb
> 9aa963e7d399bd450363e959929fe849d0"
> diff --git a/meta-oe/recipes-support/glog/glog_0.3.4.bb
> b/meta-oe/recipes-support/glog/glog_0.3.4.bb
> new file mode 100644
> index 000000000000..6d91ae941ac3
> --- /dev/null
> +++ b/meta-oe/recipes-support/glog/glog_0.3.4.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "The glog library implements application-level logging.
> This \
> +library provides logging APIs based on C++-style streams and various
> helper \
> +macros."
> +HOMEPAGE = "https://github.com/google/glog"
> +
> +SRC_URI = "\
> +          https://github.com/google/glog/archive/v${PV}.tar.gz \
> +          file://0001-configure.ac-Allow-user-to-disable-gflags.patch \
> +          "
> +
> +SRC_URI[md5sum] = "df92e05c9d02504fb96674bc776a41cb"
> +SRC_URI[sha256sum] = "ce99d58dce74458f7656a68935d7a0
> c048fa7b4626566a71b7f4e545920ceb10"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
> +
> +DEPENDS = "libunwind"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[gflags] = ",--without-gflags,gflags,"
> +
> +inherit autotools pkgconfig
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

