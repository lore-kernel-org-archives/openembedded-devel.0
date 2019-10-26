Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6E87FC3D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:43:00 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 71so4137282qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=98P9CVAk5z00stTFNeLiN4jQMNwJskpPgSD1zWEC0DE=;
	b=AMF2n/G21uVDKX1OT7pbqHleu30VqGBgNwFL64bqD9hOxS6OZm/loD3TLg8+xOj15I
	KSycKTChO3VptKkueIC8EHfVHcBiXHJ35LxIzSiCP2Wnt6/ygSFnpCmACkBpX+6c46UD
	hMV6uMEkLY9AAy/oftKBezIWshdaEzBPAWrN9LrEIZWQMhAPeqcJYv4A0BqeHxboIvPx
	HgHOB4B7Rp+rxia9amFghMqhCshd0+YEMt0N8qCVnPo27toPYu6qT7Q37bNoTq/tmFAY
	yD+tVcW3+ff0NsiREOCYszm8vd3AwPwyGA/A+O4oDy4bXlYWwWsjinlW/3K+wvbpkn4E
	ed+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=98P9CVAk5z00stTFNeLiN4jQMNwJskpPgSD1zWEC0DE=;
	b=c3rgbB2ZFAzsvbnL2sizb1+rHOjtgM+pOYUpAPZoh0tvVfoqosxRCEGF0b7MO5wDIl
	qAEO52kJcjKrlJ3erSkF5C4S3qQf5UWa6aGXjALyr+6oN3d9MRbP2BcMBJMN/mQItXIc
	Gm8Xic+/PNy8LbUvhMhSwFWbN5nk7uajqB61sgFhWypY1PcZN/fIRA1CAlWu5+Y0jTcQ
	SBMhG91Bw5Hqu27vUAMsDweg5nZ3NpT7rfkNdtrhW/GAkbBMxKD581anat8oQaY54UdZ
	c/W+H+4zBNwCLFkCu47pWn5RCCbzdTbDMGGapxm/hg1HEEsh0qsPbf9OcOIWo/0oWDqG
	uJFQ==
X-Gm-Message-State: APjAAAVFjWoEnYG5bk5beI5I0TLi6yRFd9tmbl3oVILG3aUYZgPNTNxd
	hw+l4PTIHpyb1V0LuFY35odqiv4GVt89a1yP1Po=
X-Google-Smtp-Source: APXvYqyEbqIoO9aPsPojl4AvZLUysrIWccKbAGKjoZhwNK/yXXO7+xTKTpfbp9BN45kU9fZUPeManmG5rF7tqYNTgc4=
X-Received: by 2002:a05:620a:1645:: with SMTP id
	c5mr7191153qko.212.1572082981462; 
	Sat, 26 Oct 2019 02:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
	<20191026093404.19659-4-schnitzeltony@gmail.com>
In-Reply-To: <20191026093404.19659-4-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Oct 2019 10:42:35 +0100
Message-ID: <CAMKF1sqBUTk01=tQ=V6ECnXz5jj6r9ARi1kMyJFL5Xp2-41UjQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] zenity: rework recipe
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
X-List-Received-Date: Sat, 26 Oct 2019 09:43:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I dropped https://patchwork.openembedded.org/patch/166178/ and took
this one. It seems to include those changes as well.

On Sat, Oct 26, 2019 at 10:35 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> * "xz" is default for GNOME_COMPRESS_TYPE
> * instead of patching away help-files, build them and let users decide if=
 and
>   how to pack them by inheriting gnome-help.bbclass
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../0001-build-don-t-generate-manual.patch    | 50 -------------------
>  .../recipes-gnome/zenity/zenity_3.32.0.bb     | 12 ++---
>  2 files changed, 5 insertions(+), 57 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/zenity/zenity/0001-build-don=
-t-generate-manual.patch
>
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-gene=
rate-manual.patch b/meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t=
-generate-manual.patch
> deleted file mode 100644
> index 488548667..000000000
> --- a/meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-ma=
nual.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 38eeb345fdfca0298b11427aa942b68e627ba10e Mon Sep 17 00:00:00 2001
> -From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> -Date: Thu, 12 Sep 2019 13:14:55 +0200
> -Subject: [PATCH] build: don't generate manual
> -
> -We don't have yelp in yocto and even if we did it would pull in
> -webkitgtk just to generate help. Just remove the manual generation
> -altogether.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ----
> - Makefile.am  | 3 +--
> - configure.ac | 5 -----
> - 2 files changed, 1 insertion(+), 7 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 81ae6a7..bd073dd 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -4,8 +4,7 @@ AM_CPPFLAGS =3D src
> - SUBDIRS =3D \
> -       src     \
> -       po      \
> --      data    \
> --      help
> -+      data
> -
> - EXTRA_DIST =3D \
> -       autogen.sh              \
> -diff --git a/configure.ac b/configure.ac
> -index 5dccdb0..f88b2c0 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -115,11 +115,6 @@ GETTEXT_PACKAGE=3Dzenity
> - AC_SUBST([GETTEXT_PACKAGE])
> - AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[Gettext doma=
in])
> -
> --# *******************************
> --# User manual
> --# *******************************
> --YELP_HELP_INIT
> --
> - # *******************************
> -
> - AC_SUBST([AM_CPPFLAGS])
> ---
> -2.21.0
> -
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb b/meta-gnom=
e/recipes-gnome/zenity/zenity_3.32.0.bb
> index 295288bfb..fb58d1712 100644
> --- a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
> +++ b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
> @@ -4,19 +4,17 @@ LICENSE =3D "GPLv2+"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f=
7e7"
>
> -inherit distro_features_check gnomebase gettext
> +inherit gnomebase gnome-help distro_features_check gettext
>
> -DEPENDS =3D "gtk+3"
> +DEPENDS =3D " \
> +    yelp-tools-native \
> +    gtk+3 \
> +"
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOM=
EBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
> -    file://0001-build-don-t-generate-manual.patch \
> -"
> -
>  SRC_URI[archive.md5sum] =3D "ba2b2a13248773b4ec0fd323d95e6d5a"
>  SRC_URI[archive.sha256sum] =3D "e786e733569c97372c3ef1776e71be7e7599ebe8=
7e11e8ad67dcc2e63a82cd95"
> -GNOME_COMPRESS_TYPE=3D"xz"
>
>  do_install_append() {
>      # Remove gdialog compatibility helper - we don't want to pull in per=
l
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

