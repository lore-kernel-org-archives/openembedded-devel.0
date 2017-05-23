Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1797F77FCE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 19:37:07 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id c15so26045988ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iMjzElpy8UBBvJzpJ/2tKZrd9UK3bJGbwXkg60xm+lU=;
	b=JA/lJI4R51I4zNGSDF3fTLF4xgYB7FiEEl7GC4PcT5DwjyMNGn1GxdBYsw1CR1gUhS
	u/xmJ7IzzCl+MDd/ytq3mqXOZe8+dStG1N/0EkVT//7eZaGc1DkPx6viS7u/F3RtGHkv
	304ZI03Jnia060Tyt3IeUpBoaMjycfT0lSFapsRrXw/2TbJBmk0AIKuLmbIGrbKEQMVE
	IThJibcsP12gzMiCq98EMGUlrrHS+0RXWcnFKvMLzfzElLM+02jJhdukb8ivIC2KZUHa
	O2sBdBtJllA0g8pECFWjQ8gwXAnMnhJI5tMcqEIv5UD4+SapNEixHsMokE5EjGU08Tdp
	KrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iMjzElpy8UBBvJzpJ/2tKZrd9UK3bJGbwXkg60xm+lU=;
	b=RhJxFHJN6rYoD8Vv2iA1P0Q1a+svGsASj4Hb8o+mriBr/tHsR9kmFid7DiMn1ruzQG
	sCubjF8iaMFqD2n4X2nIfAjelyVw3sSUUbD2NevgJAH4mjV/aqRu9iIsW18TGIYwSeZN
	VyJx5zNNMPuhMmhzW8GtTXlhVdhceD/JiBY14tLLW8xDw36t0yJQ7ClOtSmoHbIu8B/G
	ZcBEQr6z94LZwyUmTefR8XK+cqJPT5qjGkefdnWR346zp3nr4HuFpObj3r8laJPvApL4
	Y+Yock5JF8tpwklZ+es4AfqnePmAd+nEtpLs0Gt+q7KPxmNriLqVK3i+nTo0xBFzHriD
	zJHg==
X-Gm-Message-State: AODbwcC81wjx+qwf4ebHyvfs/3CbiDvFd+6TntGjmCzBZOudlX96xbXE
	Edc5laVDs/e76BADqoWYmG/ZpPORd9Ul
X-Received: by 10.36.103.9 with SMTP id u9mr4646958itc.17.1495568228922; Tue,
	23 May 2017 12:37:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.170 with HTTP; Tue, 23 May 2017 12:36:38 -0700 (PDT)
In-Reply-To: <CAMKF1spojsKhYPor8OpLYhZfeFN0fMbyHM-3x+JQbdYqBjY0ZA@mail.gmail.com>
References: <cover.1495522368.git.jackie.huang@windriver.com>
	<611cb040503a0616ea4127228c9237b1d5f7a834.1495522368.git.jackie.huang@windriver.com>
	<CAMKF1spojsKhYPor8OpLYhZfeFN0fMbyHM-3x+JQbdYqBjY0ZA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 23 May 2017 22:36:38 +0300
Message-ID: <CAHiDW_F3sz9jXCFMDG=5pmjYq2PjAh5z1Hy1Q-Q73B7RO=7xYw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 23 May 2017 19:37:08 -0000
Content-Type: text/plain; charset="UTF-8"

On 23 May 2017 at 17:54, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, May 23, 2017 at 12:01 AM,  <jackie.huang@windriver.com> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > mga is an Xorg driver for Matrox video cards
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../xorg-driver/xf86-video-mga/checkfile.patch     | 68
> ++++++++++++++++++++++
> >  .../xorg-driver/xf86-video-mga_1.6.5.bb            | 21 +++++++
> >  2 files changed, 89 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/
> checkfile.patch
> >  create mode 100644 meta-oe/recipes-graphics/xorg-driver/
> xf86-video-mga_1.6.5.bb
> >
> > diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> > new file mode 100644
> > index 000000000..ceae6dfba
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/
> checkfile.patch
> > @@ -0,0 +1,68 @@
> > +Upstream-Status: Submitted [https://bugs.freedesktop.org/
> show_bug.cgi?id=57606]
> > +Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +
> > +From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17 00:00:00 2001
> > +From: Ross Burton <ross.burton@intel.com>
> > +Date: Thu, 29 Nov 2012 11:00:43 +0000
> > +Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI
> > +
> > +Automatically enabling or disabling a feature based on installed files
> isn't
> > +deterministic, and AC_CHECK_FILE returns an error when cross-compiling.
> > +
> > +Fix this by enabling DRI by default, and removing the explicit file
> checks as
> > +pkg-config is good enough.
> > +
> > +(#57606)
> > +
> > +Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +---
> > + configure.ac |   25 ++-----------------------
> > + 1 file changed, 2 insertions(+), 23 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index fca1a9c..d2aa2ed 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,
> > +             [moduledir="$libdir/xorg/modules"])
> > +
> > + AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],
> > +-                                  [Disable DRI support
> [[default=auto]]]),
> > ++                                  [Disable DRI support
> [[default=enabled]]]),
> > +               [DRI="$enableval"],
> > +-              [DRI=auto])
> > ++              [DRI=yes])
> > + AC_ARG_ENABLE(exa,
> > +               AS_HELP_STRING([--disable-exa],
> > +                              [Disable EXA support
> [[default=enabled]]]),
> > +@@ -76,27 +76,6 @@ sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`
> > +
> > + # Checks for libraries.
> > +
> > +-if test "x$DRI" != xno; then
> > +-        AC_CHECK_FILE([${sdkdir}/dri.h],
> > +-                      [have_dri_h="yes"], [have_dri_h="no"])
> > +-        AC_CHECK_FILE([${sdkdir}/sarea.h],
> > +-                      [have_sarea_h="yes"], [have_sarea_h="no"])
> > +-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
> > +-                      [have_dristruct_h="yes"],
> [have_dristruct_h="no"])
> > +-fi
> > +-
> > +-AC_MSG_CHECKING([whether to include DRI support])
> > +-if test "x$DRI" = xauto; then
> > +-        if test "x$have_dri_h" = xyes && \
> > +-           test "x$have_sarea_h" = xyes && \
> > +-           test "x$have_dristruct_h" = xyes; then
> > +-                DRI="yes"
> > +-        else
> > +-                DRI="no"
> > +-        fi
> > +-fi
> > +-AC_MSG_RESULT([$DRI])
> > +-
> > + AM_CONDITIONAL(DRI, test "x$DRI" = xyes)
> > + if test "x$DRI" = xyes; then
> > +         PKG_CHECK_MODULES(DRI, [libdrm >= 2.0 xf86driproto])
> > +--
> > +1.7.10.4
> > +
> > diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.
> 6.5.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
> > new file mode 100644
> > index 000000000..cd680597c
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
> > @@ -0,0 +1,21 @@
> > +require recipes-graphics/xorg-driver/xorg-driver-video.inc
> > +
> > +SUMMARY = "X.Org X server -- Matrox MGA display driver"
> > +
> > +DESCRIPTION = "mga is an Xorg driver for Matrox video cards"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=bc1395d2cd32dfc5d6c57d2d8f83d3
> fc"
> > +
> > +SRC_URI += "file://checkfile.patch"
> > +
> > +DEPENDS += "virtual/libx11 libpciaccess"
> > +
> > +COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
>
> can this also include musl ? if yes then use linux*
> and I think it could be a good thing to check for x11 as required
> distro features may be
>
>
xorg-driver-common.inc (via xorg-driver-video.inc) should already take care
of requiring "x11" distro feature.

