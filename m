Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A5829784FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 15:47:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q189so16757415wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UVo1PRzb1lWVVINKBwRD5D68jTVxRw5GwwOkdH2ElFU=;
	b=s1acxWtwOC3yYZchMfPKnjeOg4u0gGBo4G0dWxJ3byEDgKMLq9b6g+whuY4fqJnXoU
	UR4XkeUpwm+FVJMv8LYpoFXowAIj4aY0q2ga28+QCYJNsrAeMOk8QtksONtyxJmldVti
	ULHXqtk/JVuF0HITLL69/AU4rtlnYB9DzozbAiOT3yS6hsdowma3oJJoEkIN7tfrJ0Xa
	vfjGMF3Y7Y/r/J0A3BgSalH11e9qMUTw/4PSPcZYiLr0L0J5fbLwp237I6j7yVkiSyWy
	CyHMiHgRjVH/ZET7yVoMW0JfhUUZYlQideBRQX6tCDer2LZKpyCf1oLUdv5lDDf3C6oO
	TTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UVo1PRzb1lWVVINKBwRD5D68jTVxRw5GwwOkdH2ElFU=;
	b=OUk3ZPBBTPTjBLwg/anNS6fz/CGJKfmIkBqsooTPDyvkBZlKKpUw+DnDCX+Zc5xPhg
	I+1QmKVCw9adDyxE4DWmE/xFkvFR47d8D+IHZpNvoX/2hAAPY8YImiTZiVhpKvgvAHyY
	o0Cg+c+0c3B0vP91VQtJAQM16UpbczWOIvJGc9XLjk2puLiyaBonS8eSEnbbf6GXno51
	s87Bzyz7yCEAzJ9Rz5a0KW8VEmpTqxzTlirdQe2Cqc8wULZWQhdqWvmZMf70KSD1NsYw
	BBC4NXfhCkyixo01RappRzHH7BNy3FQv0ciF6MDrKth50nYMTSyG3FqYVxKJBFaiegaa
	tclA==
X-Gm-Message-State: AIVw112RAII2U9ZNtJJxyORTzI7S2twWsGOnTbjv0FYs7Mmsy9o6dfBE
	UyDsvb8gz9+mbLIjP37doQYpJNyqcg==
X-Received: by 10.80.176.162 with SMTP id j31mr7219005edd.186.1501256864262;
	Fri, 28 Jul 2017 08:47:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 28 Jul 2017 08:47:13 -0700 (PDT)
In-Reply-To: <1501254330.27323.401.camel@linux.intel.com>
References: <cover.1495522368.git.jackie.huang@windriver.com>
	<611cb040503a0616ea4127228c9237b1d5f7a834.1495522368.git.jackie.huang@windriver.com>
	<1501195791.27323.399.camel@linux.intel.com>
	<CAMKF1sqXveWzkNAGozc8ypmdVoydbMtgx1g1QuAisWEwtxVpnQ@mail.gmail.com>
	<1501254330.27323.401.camel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 08:47:13 -0700
Message-ID: <CAMKF1sr8c6tfHFBdqwabRTtu3JyTA20Y7nWLSdTVOet5qKkfMA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Fri, 28 Jul 2017 15:47:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 8:05 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On Thu, 2017-07-27 at 23:46 +0000, Khem Raj wrote:
>>
>> On Thu, Jul 27, 2017 at 3:50 PM Saul Wold <sgw@linux.intel.com>
>> wrote:
>> > On Tue, 2017-05-23 at 15:01 +0800, jackie.huang@windriver.com
>> > wrote:
>> > >
>> > > From: Jackie Huang <jackie.huang@windriver.com>
>> > >
>> > > mga is an Xorg driver for Matrox video cards
>> > >
>> > I missed the inclusion of this driver into meta-oe, we have been
>> > maintaining this driver in meta-intel and have been for a while
>> > (it's
>> > listed in layers.openembedded.org.
>> >
>> > If there are multiple layers using this Xorg driver, we should
>> > consider
>> > moving into oe-core proper.
>>
>> I think it falls into bsp area and unless we can
>> Excercise it with qemu it just doesn't seem right to move to core I
>> would even not put it in meta-oe
>>
> So your suggesting just update the meta-intel BSP with the newer
> version and remove it from meta-oe?

right. May be between intel and amd, there should be a common layer
too, since there are lot of x86 specific packages which are shared at
architecture level. I am doing llvm right now and its only useful for x86
based systems there is no single place to put it and oe-core seems
a bit of overkill.

>
> Sau!
>> >
>> >
>> > There are multiple x86* HW platforms that use the Matrox hardware
>> > still.  I would prefer not to have meta-intel depending on meta-oe
>> > for
>> > one Xorg driver.
>> >
>> > Thoughts of moving it?
>> >
>> > Sau!
>> >
>> >
>> > >
>> > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> > > ---
>> > >  .../xorg-driver/xf86-video-mga/checkfile.patch     | 68
>> > > ++++++++++++++++++++++
>> > >  .../xorg-driver/xf86-video-mga_1.6.5.bb            | 21 +++++++
>> > >  2 files changed, 89 insertions(+)
>> > >  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-
>> > video-
>> > > mga/checkfile.patch
>> > >  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-
>> > video-
>> > > mga_1.6.5.bb
>> > >
>> > > diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-
>> > > mga/checkfile.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-
>> > > video-mga/checkfile.patch
>> > > new file mode 100644
>> > > index 000000000..ceae6dfba
>> > > --- /dev/null
>> > > +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-
>> > > mga/checkfile.patch
>> > > @@ -0,0 +1,68 @@
>> > > +Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bu
>> > g.cg
>> > > i?id=57606]
>> > > +Signed-off-by: Ross Burton <ross.burton@intel.com>
>> > > +
>> > > +From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17
>> > 00:00:00
>> > > 2001
>> > > +From: Ross Burton <ross.burton@intel.com>
>> > > +Date: Thu, 29 Nov 2012 11:00:43 +0000
>> > > +Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI
>> > > +
>> > > +Automatically enabling or disabling a feature based on installed
>> > > files isn't
>> > > +deterministic, and AC_CHECK_FILE returns an error when cross-
>> > > compiling.
>> > > +
>> > > +Fix this by enabling DRI by default, and removing the explicit
>> > file
>> > > checks as
>> > > +pkg-config is good enough.
>> > > +
>> > > +(#57606)
>> > > +
>> > > +Signed-off-by: Ross Burton <ross.burton@intel.com>
>> > > +---
>> > > + configure.ac |   25 ++-----------------------
>> > > + 1 file changed, 2 insertions(+), 23 deletions(-)
>> > > +
>> > > +diff --git a/configure.ac b/configure.ac
>> > > +index fca1a9c..d2aa2ed 100644
>> > > +--- a/configure.ac
>> > > ++++ b/configure.ac
>> > > +@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,
>> > > +             [moduledir="$libdir/xorg/modules"])
>> > > +
>> > > + AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],
>> > > +-                                  [Disable DRI support
>> > > [[default=auto]]]),
>> > > ++                                  [Disable DRI support
>> > > [[default=enabled]]]),
>> > > +               [DRI="$enableval"],
>> > > +-              [DRI=auto])
>> > > ++              [DRI=yes])
>> > > + AC_ARG_ENABLE(exa,
>> > > +               AS_HELP_STRING([--disable-exa],
>> > > +                              [Disable EXA support
>> > > [[default=enabled]]]),
>> > > +@@ -76,27 +76,6 @@ sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-
>> > > server`
>> > > +
>> > > + # Checks for libraries.
>> > > +
>> > > +-if test "x$DRI" != xno; then
>> > > +-        AC_CHECK_FILE([${sdkdir}/dri.h],
>> > > +-                      [have_dri_h="yes"], [have_dri_h="no"])
>> > > +-        AC_CHECK_FILE([${sdkdir}/sarea.h],
>> > > +-                      [have_sarea_h="yes"],
>> > [have_sarea_h="no"])
>> > > +-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
>> > > +-                      [have_dristruct_h="yes"],
>> > > [have_dristruct_h="no"])
>> > > +-fi
>> > > +-
>> > > +-AC_MSG_CHECKING([whether to include DRI support])
>> > > +-if test "x$DRI" = xauto; then
>> > > +-        if test "x$have_dri_h" = xyes && \
>> > > +-           test "x$have_sarea_h" = xyes && \
>> > > +-           test "x$have_dristruct_h" = xyes; then
>> > > +-                DRI="yes"
>> > > +-        else
>> > > +-                DRI="no"
>> > > +-        fi
>> > > +-fi
>> > > +-AC_MSG_RESULT([$DRI])
>> > > +-
>> > > + AM_CONDITIONAL(DRI, test "x$DRI" = xyes)
>> > > + if test "x$DRI" = xyes; then
>> > > +         PKG_CHECK_MODULES(DRI, [libdrm >= 2.0 xf86driproto])
>> > > +--
>> > > +1.7.10.4
>> > > +
>> > > diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-
>> > > mga_1.6.5.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-
>> > > mga_1.6.5.bb
>> > > new file mode 100644
>> > > index 000000000..cd680597c
>> > > --- /dev/null
>> > > +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-
>> > mga_1.6.5.bb
>> > > @@ -0,0 +1,21 @@
>> > > +require recipes-graphics/xorg-driver/xorg-driver-video.inc
>> > > +
>> > > +SUMMARY = "X.Org X server -- Matrox MGA display driver"
>> > > +
>> > > +DESCRIPTION = "mga is an Xorg driver for Matrox video cards"
>> > > +
>> > > +LIC_FILES_CHKSUM =
>> > > "file://COPYING;md5=bc1395d2cd32dfc5d6c57d2d8f83d3fc"
>> > > +
>> > > +SRC_URI += "file://checkfile.patch"
>> > > +
>> > > +DEPENDS += "virtual/libx11 libpciaccess"
>> > > +
>> > > +COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
>> > > +
>> > > +SRC_URI[md5sum] = "3ee2549247e01de3e7bce52c27483118"
>> > > +SRC_URI[sha256sum] =
>> > >
>> > "b663cd8e6364f7c4e2637b9fcab9861d0e3971518c73b00d213f6545a1289422"
>> > > +
>> > > +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES',
>> > 'opengl',
>> > > 'dri', '', d)}"
>> > > +PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,drm
>> > > xf86driproto,xserver-xorg-extension-dri"
>> > > +
>> > > +RDEPENDS_${PN} = "xserver-xorg-module-exa"
>> > > --
>> > > 2.11.0
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >

