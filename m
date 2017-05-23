Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B78077D24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 14:55:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b84so24186572wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rrbr4wXvfpsWMSZOVu7vdvr0uvO7t8nwb88iM7cXzUE=;
	b=p//mjcVJ5kRQgED/mnvPgSbe3RbSGaX3wHTTXYDFhWRXE9DR8BVR9sN5Dmt/mP+XpX
	dY3fVwP3rruJAK6/4wpzN6Y7lteZsQBata1JoVx5OLPgazWbiz3boR/memTXP6c/Wqj5
	fr8AasG5yvqTjkqIIIlxcksEceyOwDJJkUQwFJuJ1DmdsKMlFwGdZfiAIhpiTy83CzL4
	p/yw2lR+bJ3P0VE4bi78A8bOniQ1IsFYTzdGIWTBndZaABkKsLk7xNMsMgjH/Qq6zIVX
	na9RVf6ulwttH3u8PehUeDKwtKm6pxnDMG+2I7CmspP6GzDsjFo9xT8qOOwuFbzxajjc
	VxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rrbr4wXvfpsWMSZOVu7vdvr0uvO7t8nwb88iM7cXzUE=;
	b=Xre7tjg0ExjTNecSEueKKEuRQWWgvgPS4+vb41Vq7fKqT6B+VmOD95e0tmIaIz6CgW
	ASDioQ42XobkFTPmvqbrjJ9HY/5PkNaFoEMxY/VHqtCj2DXNnBkKOxCU4JP47jc3RtdE
	c6gXjX0I1288wUl41dkLUtSFRP9PdV+iUAtRvI7u1Jd9wulOolNDA6iP5aLN++vOUOSe
	PzQPhkkrTOr26bpGBVtQelqIn03+tJ8NNflQKO3/FTyZW2SzQQ+w73seVDmFoNQbnRFT
	02xs8D2DhN+Eje4TjZjHFi+qTubNwAassK16PtgZ9j+/NMmT9YlAs0V7TK8yhytzsCWK
	MTwg==
X-Gm-Message-State: AODbwcCzLorLJ+Fab7tUmbiR1oayN6sM8zP8zn+MeNvdn5dQBduYJgkU
	2EC5abzN/ZISIOQZ28BgwipGkna7SA==
X-Received: by 10.80.182.35 with SMTP id b32mr21799516ede.123.1495551329235;
	Tue, 23 May 2017 07:55:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 23 May 2017 07:54:58 -0700 (PDT)
In-Reply-To: <611cb040503a0616ea4127228c9237b1d5f7a834.1495522368.git.jackie.huang@windriver.com>
References: <cover.1495522368.git.jackie.huang@windriver.com>
	<611cb040503a0616ea4127228c9237b1d5f7a834.1495522368.git.jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 May 2017 07:54:58 -0700
Message-ID: <CAMKF1spojsKhYPor8OpLYhZfeFN0fMbyHM-3x+JQbdYqBjY0ZA@mail.gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] xf86-video-mga: add new recipe
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
X-List-Received-Date: Tue, 23 May 2017 14:55:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 12:01 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> mga is an Xorg driver for Matrox video cards
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../xorg-driver/xf86-video-mga/checkfile.patch     | 68 ++++++++++++++++++++++
>  .../xorg-driver/xf86-video-mga_1.6.5.bb            | 21 +++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
>
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> new file mode 100644
> index 000000000..ceae6dfba
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> @@ -0,0 +1,68 @@
> +Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=57606]
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Thu, 29 Nov 2012 11:00:43 +0000
> +Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI
> +
> +Automatically enabling or disabling a feature based on installed files isn't
> +deterministic, and AC_CHECK_FILE returns an error when cross-compiling.
> +
> +Fix this by enabling DRI by default, and removing the explicit file checks as
> +pkg-config is good enough.
> +
> +(#57606)
> +
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +---
> + configure.ac |   25 ++-----------------------
> + 1 file changed, 2 insertions(+), 23 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fca1a9c..d2aa2ed 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,
> +             [moduledir="$libdir/xorg/modules"])
> +
> + AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],
> +-                                  [Disable DRI support [[default=auto]]]),
> ++                                  [Disable DRI support [[default=enabled]]]),
> +               [DRI="$enableval"],
> +-              [DRI=auto])
> ++              [DRI=yes])
> + AC_ARG_ENABLE(exa,
> +               AS_HELP_STRING([--disable-exa],
> +                              [Disable EXA support [[default=enabled]]]),
> +@@ -76,27 +76,6 @@ sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`
> +
> + # Checks for libraries.
> +
> +-if test "x$DRI" != xno; then
> +-        AC_CHECK_FILE([${sdkdir}/dri.h],
> +-                      [have_dri_h="yes"], [have_dri_h="no"])
> +-        AC_CHECK_FILE([${sdkdir}/sarea.h],
> +-                      [have_sarea_h="yes"], [have_sarea_h="no"])
> +-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
> +-                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
> +-fi
> +-
> +-AC_MSG_CHECKING([whether to include DRI support])
> +-if test "x$DRI" = xauto; then
> +-        if test "x$have_dri_h" = xyes && \
> +-           test "x$have_sarea_h" = xyes && \
> +-           test "x$have_dristruct_h" = xyes; then
> +-                DRI="yes"
> +-        else
> +-                DRI="no"
> +-        fi
> +-fi
> +-AC_MSG_RESULT([$DRI])
> +-
> + AM_CONDITIONAL(DRI, test "x$DRI" = xyes)
> + if test "x$DRI" = xyes; then
> +         PKG_CHECK_MODULES(DRI, [libdrm >= 2.0 xf86driproto])
> +--
> +1.7.10.4
> +
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
> new file mode 100644
> index 000000000..cd680597c
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
> @@ -0,0 +1,21 @@
> +require recipes-graphics/xorg-driver/xorg-driver-video.inc
> +
> +SUMMARY = "X.Org X server -- Matrox MGA display driver"
> +
> +DESCRIPTION = "mga is an Xorg driver for Matrox video cards"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bc1395d2cd32dfc5d6c57d2d8f83d3fc"
> +
> +SRC_URI += "file://checkfile.patch"
> +
> +DEPENDS += "virtual/libx11 libpciaccess"
> +
> +COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'

can this also include musl ? if yes then use linux*
and I think it could be a good thing to check for x11 as required
distro features may be

> +
> +SRC_URI[md5sum] = "3ee2549247e01de3e7bce52c27483118"
> +SRC_URI[sha256sum] = "b663cd8e6364f7c4e2637b9fcab9861d0e3971518c73b00d213f6545a1289422"
> +
> +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
> +PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,drm xf86driproto,xserver-xorg-extension-dri"
> +
> +RDEPENDS_${PN} = "xserver-xorg-module-exa"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

