Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7122F77E68
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 02:46:36 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id d127so49776927wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 19:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mKI0aqUzLolrsdq3AKj4M+eVhGaiU2w2ctqu1hw4aT0=;
	b=s0B54f5FRC7+W3Ak6qp5aVJlsfLPoUPwyVmATPVWz7iIxISxEx+ADUCLdUFZ+ecHZ4
	GzsMKxNReQ1dytUIM10QtU2JdCF5T+IyoQoanbwH1XbS1RMV/uJoI8LnfER1ee0jIiLL
	4bwWZgTjokMwXxj8eSoKeUKxJSTi31FoCoRwEaGGtlwDPTb8AJlgYIsKOckppGFTsQPp
	GZOhq+HUwcXv2l2hUa6UHhhLnrFJ/yoLcygAfKBdlRLt8pgUtrO3yjK5UZ+StiYf+AYC
	8z1rTgEKVw6DBokfPZOGv9EyuAs2jyNEGaa68l5ReuhTFKcAGBc+P5rPwnKpIohXaSf/
	K1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mKI0aqUzLolrsdq3AKj4M+eVhGaiU2w2ctqu1hw4aT0=;
	b=TIbbZI/7QNt7Xegm1WVrXWTyrj/658ECbcjk4cYErselyUTFwweT06VDEEFPi0s8FY
	7zRe15i/d7ggqVh42S4Rgi3OFMWVDRTh/KkPs8yjSpL3xgE3pBjMG83PqSS3II1PW6gP
	lc8g7VuF3JWIxa85KsubzMvSGdieizjTuzKRj0lNXmut9s22RAfmReRAxDijhq/mbFbP
	hhZhjfKlTUVDAS/q0PFDlFR17Zubpv9PSIZOTav7HPB3ngimfZRHQXERbj0QzW5SyrU2
	fegbKlhs51Jub0c7LLvc6MX/1V/qInfkXgjfQqtQwHygC8CaaiTHB8vxR8gp3TWxf+fT
	wj/A==
X-Gm-Message-State: AODbwcCZjsH6CBR6+YbcX6T/KSx2OjmJk9vr78KhiN2sM9CfrnvxiYse
	ckFXK/MjnukbTF6yrSQABCn4Z+Ewzw==
X-Received: by 10.80.151.5 with SMTP id c5mr23617759edb.30.1495593997238; Tue,
	23 May 2017 19:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1495522368.git.jackie.huang@windriver.com>
	<611cb040503a0616ea4127228c9237b1d5f7a834.1495522368.git.jackie.huang@windriver.com>
	<CAMKF1spojsKhYPor8OpLYhZfeFN0fMbyHM-3x+JQbdYqBjY0ZA@mail.gmail.com>
	<CAHiDW_F3sz9jXCFMDG=5pmjYq2PjAh5z1Hy1Q-Q73B7RO=7xYw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B7B04E3@ALA-MBC.corp.ad.wrs.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B7B04E3@ALA-MBC.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 May 2017 02:46:26 +0000
Message-ID: <CAMKF1sq-u-GPxR=6+Giqbq7vSoiUoFp3qW1f7+_uF5wmhbyWwA@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>, 
	"KUKKONEN, JUSSI" <jussi.kukkonen@intel.com>
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
X-List-Received-Date: Wed, 24 May 2017 02:46:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 7:11 PM Huang, Jie (Jackie) <
Jackie.Huang@windriver.com> wrote:

> >
> >
> > From: Jussi Kukkonen [mailto:jussi.kukkonen@intel.com]
> > Sent: Wednesday, May 24, 2017 03:37
> > To: Khem Raj
> > Cc: Huang, Jie (Jackie); openembeded-devel
> > Subject: Re: [oe] [meta-oe][PATCH 1/2] xf86-video-mga: add new recipe
> >
> > On 23 May 2017 at 17:54, Khem Raj <raj.khem@gmail.com> wrote:
> > On Tue, May 23, 2017 at 12:01 AM,  <jackie.huang@windriver.com> wrote:
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > >
> > > mga is an Xorg driver for Matrox video cards
> > >
> > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > ---
> > >  .../xorg-driver/xf86-video-mga/checkfile.patch     | 68
> ++++++++++++++++++++++
> > >  .../xorg-driver/xf86-video-mga_1.6.5.bb            | 21 +++++++
> > >  2 files changed, 89 insertions(+)
> > >  create mode 100644
> meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> > >  create mode 100644 meta-oe/recipes-graphics/xorg-driver/
> xf86-video-mga_1.6.5.bb
> > >
> > > diff --git
> a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> > > new file mode 100644
> > > index 000000000..ceae6dfba
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> > > @@ -0,0 +1,68 @@
> > > +Upstream-Status: Submitted [
> https://bugs.freedesktop.org/show_bug.cgi?id=57606]
> > > +Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > +
> > > +From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17 00:00:00 2001
> > > +From: Ross Burton <ross.burton@intel.com>
> > > +Date: Thu, 29 Nov 2012 11:00:43 +0000
> > > +Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI
> > > +
> > > +Automatically enabling or disabling a feature based on installed
> files isn't
> > > +deterministic, and AC_CHECK_FILE returns an error when
> cross-compiling.
> > > +
> > > +Fix this by enabling DRI by default, and removing the explicit file
> checks as
> > > +pkg-config is good enough.
> > > +
> > > +(#57606)
> > > +
> > > +Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > +---
> > > + configure.ac |   25 ++-----------------------
> > > + 1 file changed, 2 insertions(+), 23 deletions(-)
> > > +
> > > +diff --git a/configure.ac b/configure.ac
> > > +index fca1a9c..d2aa2ed 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,
> > > +             [moduledir="$libdir/xorg/modules"])
> > > +
> > > + AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],
> > > +-                                  [Disable DRI support
> [[default=auto]]]),
> > > ++                                  [Disable DRI support
> [[default=enabled]]]),
> > > +               [DRI="$enableval"],
> > > +-              [DRI=auto])
> > > ++              [DRI=yes])
> > > + AC_ARG_ENABLE(exa,
> > > +               AS_HELP_STRING([--disable-exa],
> > > +                              [Disable EXA support
> [[default=enabled]]]),
> > > +@@ -76,27 +76,6 @@ sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`
> > > +
> > > + # Checks for libraries.
> > > +
> > > +-if test "x$DRI" != xno; then
> > > +-        AC_CHECK_FILE([${sdkdir}/dri.h],
> > > +-                      [have_dri_h="yes"], [have_dri_h="no"])
> > > +-        AC_CHECK_FILE([${sdkdir}/sarea.h],
> > > +-                      [have_sarea_h="yes"], [have_sarea_h="no"])
> > > +-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
> > > +-                      [have_dristruct_h="yes"],
> [have_dristruct_h="no"])
> > > +-fi
> > > +-
> > > +-AC_MSG_CHECKING([whether to include DRI support])
> > > +-if test "x$DRI" = xauto; then
> > > +-        if test "x$have_dri_h" = xyes && \
> > > +-           test "x$have_sarea_h" = xyes && \
> > > +-           test "x$have_dristruct_h" = xyes; then
> > > +-                DRI="yes"
> > > +-        else
> > > +-                DRI="no"
> > > +-        fi
> > > +-fi
> > > +-AC_MSG_RESULT([$DRI])
> > > +-
> > > + AM_CONDITIONAL(DRI, test "x$DRI" = xyes)
> > > + if test "x$DRI" = xyes; then
> > > +         PKG_CHECK_MODULES(DRI, [libdrm >= 2.0 xf86driproto])
> > > +--
> > > +1.7.10.4
> > > +
> > > diff --git a/meta-oe/recipes-graphics/xorg-driver/
> xf86-video-mga_1.6.5.bb b/meta-oe/recipes-graphics/xorg-driver/
> xf86-video-mga_1.6.5.bb
> > > new file mode 100644
> > > index 000000000..cd680597c
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
> > > @@ -0,0 +1,21 @@
> > > +require recipes-graphics/xorg-driver/xorg-driver-video.inc
> > > +
> > > +SUMMARY = "X.Org X server -- Matrox MGA display driver"
> > > +
> > > +DESCRIPTION = "mga is an Xorg driver for Matrox video cards"
> > > +
> > > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=bc1395d2cd32dfc5d6c57d2d8f83d3fc"
> > > +
> > > +SRC_URI += "file://checkfile.patch"
> > > +
> > > +DEPENDS += "virtual/libx11 libpciaccess"
> > > +
> > > +COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
> > can this also include musl ? if yes then use linux*
>
> Yes, it includes musl but I don't think linux* is necessary, the
> linux-musl can be matched already with the above pattern
> and xf86-video-mga builds fine with:
>
> COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
> HOST_SYS="i586-poky-linux-musl"
>
> And I see that other xorg-drivers are the same:
>

Ok thanks

>
> In oe-core:
> $ grep -r COMPATIBLE_HOST *
> xf86-input-vmmouse_13.1.0.bb:COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> xf86-video-intel_git.bb:COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> xf86-video-vesa_2.3.4.bb:COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> xf86-video-vmware_13.2.1.bb:COMPATIBLE_HOST =
> '(i.86.*-linux|x86_64.*-linux)'
>
> In meta-oe:
> $ grep -r COMPATIBLE_HOST *
> xf86-video-ati_7.8.0.bb:COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> xf86-video-geode_2.11.16.bb:COMPATIBLE_HOST = "i.86.*-linux"
> xf86-video-nouveau_1.0.12.bb:COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
>
> > and I think it could be a good thing to check for x11 as required
> > distro features may be
> >
> >
> > xorg-driver-common.inc (via xorg-driver-video.inc) should already take
> care of requiring "x11" distro feature.
>
> Yes, that's correct:
> $ grep REQUIRED_DISTRO_FEATURES xorg-driver-common.inc
> REQUIRED_DISTRO_FEATURES = "x11"
>
> Thanks,
> Jackie
>
> >
> >
>

