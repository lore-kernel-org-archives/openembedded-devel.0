Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 97F1A6022E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 15:30:18 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j3so8732639pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 08:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1+5gSRQ6yzw8lN2DYjZQfN/19BaENrNiFyUIPh6/wnE=;
	b=TAKToLwUdu5Cp1GSxEbH+JY7348pThqg6QITLGSmVnnPMfUW3GZEl38AIXP/JsqFXh
	DwdaTS2Afu6a8fVgamy93lgyZLAZS7dhV/Y4mIRSqcQPwb1tvgG4AIHDlrNLnjR9yrWL
	eYahDlbeepFZrN0ga73oj6S5EWZE7ilyR1Py1AxLWST1cebt6OC24pEUEATQJN3PIMP1
	6eeK/p/jwBvVXK9I1lhXFGhbvEF8/uZKlzaAoU9x7yPS8LD7Xl9gx6VDvJcp21LCCzmd
	1ljGWcGWzoNdUaySNw3R5yHxSkSMRYnWgpiuucSslJy19xJOyzNfzqZlZVtpjeLgbmKI
	SA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1+5gSRQ6yzw8lN2DYjZQfN/19BaENrNiFyUIPh6/wnE=;
	b=FrErCgQIMb9MLhoEVpbehqianyPicVFH/FEqrI34/NPe3135AmpqeyOIUiaF6TZT9o
	Qe6Vk69e4P0t1oDhEi0qxnvu+8vNaFRBdD9Z3oCDTmyFVLGcYsBOWdTCrhcMb8LT0B+G
	RmKg71sIMPmiwjXQdz7WM5/MSjaWX1y/H/kBeaU73bogwzFB7JPPwbiGfjMVJrZy7oll
	PRWeALDUV5nnFSIpJ1zfWRWFg5c/Hl0Rzg9/d2ajXhrNOM8ywVR56+tWnvr6yBaXWAe1
	IcpJQwrorQdRt8iKEXlYqlvXD20ony1YVP2LOBil5evPcZ5oBRYWQ8byP2hEbgr7Snln
	gD2w==
X-Gm-Message-State: AMCzsaWKyGDgK3Yi0zKuuLulcv2enSL0cO+B4VsjfUu2wfttBKeVyJQk
	9cnaUBoAjwkrTCAisbsfvkSjjiaPvtObN8imIj+Okg==
X-Google-Smtp-Source: ABhQp+Ty3tmJVWIdow/Kp3RcScRyCRjtClWtY1jBbMpwI785o2cln/Z4nXb48OvpKwgRJD+P6eu1QvNMq72Z6mBI66Y=
X-Received: by 10.98.166.205 with SMTP id r74mr8072900pfl.285.1508599819477;
	Sat, 21 Oct 2017 08:30:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Sat, 21 Oct 2017 08:29:48 -0700 (PDT)
In-Reply-To: <1508274082-5871-2-git-send-email-athoik@gmail.com>
References: <1508274082-5871-1-git-send-email-athoik@gmail.com>
	<1508274082-5871-2-git-send-email-athoik@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Oct 2017 08:29:48 -0700
Message-ID: <CAMKF1sqe0QA+pBO3K22ww6NML4Qnv8up86_rCM_jH1MxfxzkOw@mail.gmail.com>
To: Athanasios Oikonomou <athoik@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] smbnetfs: update update 0.5.3a -> 0.6.0
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
X-List-Received-Date: Sat, 21 Oct 2017 15:30:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 2:01 PM, Athanasios Oikonomou <athoik@gmail.com> wr=
ote:
> It seems that updating smbnetfs to latest revision fixes build issues.
> Also remove the blacklist allowing the plugin to build again.
> Patches reworked to apply on 0.6.0.
>

This fails to build for musl

| ../../git/src/common.c:7:10: fatal error: execinfo.h: No such file
or directory
|  #include <execinfo.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [Makefile:429: smbnetfs-common.o] Error 1

you might want to add dependency DEPENDS_append_libc-musl =3D "
libexecinfo" and also make sure that -lexecinfo is added to linker
cmdline

> Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
> ---
>  .../Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch    | 6 =
+++---
>  .../recipes-filesystems/smbnetfs/smbnetfs/configure.patch           | 6 =
+++---
>  meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb       | 4 =
+---
>  3 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using=
-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch b/meta-filesystems/=
recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-head=
ers-and-libraries.patch
> index f05f09f..371ab89 100644
> --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CH=
ECK_MODULES-to-found-headers-and-libraries.patch
> +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CH=
ECK_MODULES-to-found-headers-and-libraries.patch
> @@ -10,10 +10,10 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>   src/Makefile.am | 3 +++
>   2 files changed, 8 insertions(+)
>
> -diff --git a/configure.in b/configure.in
> +diff --git a/configure.ac b/configure.ac
>  index ce21aef..ecd7119 100644
> ---- a/configure.in
> -+++ b/configure.in
> +--- a/configure.ac
> ++++ b/configure.ac
>  @@ -125,6 +125,11 @@ AC_CHECK_LIB(smbclient, smbc_setOptionUserData,
>       )]
>   )
> diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/confi=
gure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configu=
re.patch
> index c80fed1..152507c 100644
> --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.pa=
tch
> +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.pa=
tch
> @@ -1,9 +1,9 @@
>  Index: git/configure.in
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/configure.in      2014-06-18 16:06:16.040721349 +0000
> -+++ git/configure.in   2014-07-18 07:49:17.085552256 +0000
> +--- git.orig/configure.ac      2014-06-18 16:06:16.040721349 +0000
> ++++ git/configure.ac   2014-07-18 07:49:17.085552256 +0000
>  @@ -1,5 +1,5 @@
> - AC_INIT([SMBNetFS],[0.5.3=D0=B0])
> + AC_INIT([SMBNetFS],[0.6.0])
>  -AM_INIT_AUTOMAKE
>  +AM_INIT_AUTOMAKE([foreign])
>   AC_CONFIG_HEADERS([src/config.h])
> diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.b=
b b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> index 6995ad3..03e6b2b 100644
> --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> @@ -14,7 +14,7 @@ inherit autotools gitpkgv pkgconfig
>
>  PKGV =3D "${GITPKGVTAG}"
>
> -SRCREV =3D "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
> +SRCREV =3D "21c63ed60202e5540613d4c822a57a0b81764499"
>
>  SRC_URI =3D "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetf=
s;branch=3Dmaster \
>             file://configure.patch \
> @@ -24,5 +24,3 @@ PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[gnome-keyring] =3D "--with-gnome-keyring=3Dyes,--with-gnom=
e-keyring=3Dno,libgnome-keyring"
>
>  S =3D "${WORKDIR}/git"
> -
> -PNBLACKLIST[smbnetfs] ?=3D "Fails to build with RSS http://errors.yoctop=
roject.org/Errors/Details/132827/ - the recipe will be removed on 2017-09-0=
1 unless the issue is fixed"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

