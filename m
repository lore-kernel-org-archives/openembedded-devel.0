Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.13778.1611341804982555810
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 10:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=by0fAidV;
 spf=pass (domain: qtec.com, ip: 209.85.167.48, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f48.google.com with SMTP id q12so8937819lfo.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 10:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T5ZOYDz64gl7JifmRA6WUYZqSZiE2BpwegyVdOUsoig=;
        b=by0fAidVrjmyKrGDGlOE7hhMBnUVpcrBMipTU8XC+n97jfO2OQxLgcTDuZ668RfWal
         JguGmA1eXuxUUz1P8QyOFRKkF9TfgksMHT26ny/GQbrJtLSWgsSC2dYT8BKO+4Fx/lJM
         rYmerh80ujqeLK6ez9fItQmA4/K5urWQZSW4NMasubVOVpOWFM89HRDFWC1McYEo+bh2
         Rjn7uaKjrPrNBRxqf4GFvaJ9rrcpQ4OrcZRs7UPuJQ49cPtjPdpKCdBZsA6olDjLoD1z
         +ohZ0Jv5Nhq6YBHIaFk8Pr8IN/kX4E2PboNVPBTIuqABkSf9zBT/9qoFYbig6KytuM/6
         gV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T5ZOYDz64gl7JifmRA6WUYZqSZiE2BpwegyVdOUsoig=;
        b=MR6BWjf7QFDvh71LSrbKKfvhcFIhgo+hkK0a7D1x8U6c9YvupN9K5qdcVpPK93JkKC
         Degumlt4+NMJkKRoRWvHxTHM6vt+WmTT6bCzt6GWslAXyZgSLfEX5gMHsp2mVeI5/PQy
         0BfVH6wb6l1QfA3wAjUOVIrV2/U22oeKc/NyJOHQbFREcKka09s5IU5jIegoiG23dP7g
         EzaMkGWFFQwZ23ZwmCskG+pj/atGxQxWDnnIEUE5E8aKnSMDR6kL94T+AhW56QQK0ym+
         COwwtN1RhtsIiMwOZqHOLNwP/AlLLV+BeGF3pr6a1+8pBAUe1LBkvZefdCVvujgFztNy
         CPQg==
X-Gm-Message-State: AOAM5319wZA+TYX0WhTxS5wv3Lh7vymfYfUaDjCjQXOBrAscQFkTt1qw
	hEMvyg8b8pXAFo2ZBGVZfaNcHbAIzHZtHEa5DXDeoyYhckdH0A==
X-Google-Smtp-Source: ABdhPJxzVa8hhxUAgkMvx/rpI3cFH0zJRczi3vNTk/EOdyP0nUwdLm8Ujno3aXzoNzqsuhfYYFCVbvoiQiV+94N9Pj0=
X-Received: by 2002:ac2:4e8d:: with SMTP id o13mr234871lfr.259.1611341803204;
 Fri, 22 Jan 2021 10:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20210122091246.25423-1-daniel@qtec.com> <CAMKF1spc0tbpBXhOJw-7nbs52FTyEVTuRaROqKhxPtVXneAqtQ@mail.gmail.com>
In-Reply-To: <CAMKF1spc0tbpBXhOJw-7nbs52FTyEVTuRaROqKhxPtVXneAqtQ@mail.gmail.com>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Fri, 22 Jan 2021 19:56:32 +0100
Message-ID: <CAH1Ww+S4tY9ZTJdYTRcJhS4B40WBbT-320xNfeJDrAXpAFZejA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2] zbar: Add support for mchehab/zbar
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cac50905b981bf6c"

--000000000000cac50905b981bf6c
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Jan 2021 at 19:19, Khem Raj <raj.khem@gmail.com> wrote:

> Thanks Daniel
>
> Can you rebase it on latest master and resend ?
>
Done. Thanks!

>
> On Fri, Jan 22, 2021 at 1:13 AM Daniel Gomez <daniel@qtec.com> wrote:
> >
> > ZBar project development stopped in 2012 but it was forked and
> > maintained by Mauro Carvalho Chehab to keep it up to date with V4L2 api.
> >
> > Main repository:
> > https://github.com/mchehab/zbar
> >
> > Add support for zbar library mantained by mchehab. Use latest
> > version available 0.23.1.
> >
> > Compile by default with options: video & python3.
> >
> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > ---
> >  .../0001-make-relies-GNU-extentions.patch     | 36 -----------
> >  .../0001-qt-Create-subdir-in-Makefile.patch   | 35 +++++++++++
> >  ...02-zbarcam-Create-subdir-in-Makefile.patch | 40 ++++++++++++
> >  meta-oe/recipes-support/zbar/zbar_git.bb      | 62 ++++++++++++++-----
> >  4 files changed, 120 insertions(+), 53 deletions(-)
> >  delete mode 100644
> meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
> >  create mode 100644
> meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> >  create mode 100644
> meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> >
> > diff --git
> a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
> b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
> > deleted file mode 100644
> > index c93af3296..000000000
> > ---
> a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From 224507bc4b6e58f7a6e445bfebfb59d6b8d78bd6 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Fri, 2 Dec 2016 17:38:51 -0800
> > -Subject: [PATCH] make relies GNU extentions
> > -
> > -We get errors like
> > -`%'-style pattern rules are a GNU make extension
> > -
> > -Disable this warning, since we use gmake with OE
> > -anyway
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - configure.ac | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -3,7 +3,7 @@ AC_PREREQ([2.61])
> > - AC_INIT([zbar], [0.10], [spadix@users.sourceforge.net])
> > - AC_CONFIG_AUX_DIR(config)
> > - AC_CONFIG_MACRO_DIR(config)
> > --AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects
> std-options dist-bzip2])
> > -+AM_INIT_AUTOMAKE([1.10 -Wall -Wno-error foreign subdir-objects
> std-options dist-bzip2])
> > - AC_CONFIG_HEADERS([include/config.h])
> > - AC_CONFIG_SRCDIR(zbar/scanner.c)
> > - LT_PREREQ([2.2])
> > -@@ -47,7 +47,7 @@ AC_DEFINE_UNQUOTED([LIB_VERSION_REVISION
> > -   [Library revision])
> > -
> > - AM_CPPFLAGS="-I$srcdir/include"
> > --AM_CFLAGS="-Wall -Wno-parentheses -Werror"
> > -+AM_CFLAGS="-Wall -Wno-parentheses"
> > - AM_CXXFLAGS="$AM_CFLAGS"
> > - AC_SUBST([AM_CPPFLAGS])
> > - AC_SUBST([AM_CFLAGS])
> > diff --git
> a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> > new file mode 100644
> > index 000000000..5e614f1fc
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> > @@ -0,0 +1,35 @@
> > +From 9c67f377477a07495a712f478eabfa8d33164c45 Mon Sep 17 00:00:00 2001
> > +From: Daniel Gomez <dagmcr@gmail.com>
> > +Date: Sun, 17 Jan 2021 23:32:51 +0100
> > +Subject: [PATCH 1/2] qt: Create subdir in Makefile
> > +
> > +Create builddir/qt subdir when --with-qt5 is enabled.
> > +
> > +Fixes the following error:
> > +
> > +moc -Iqt -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB
> >
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
> >
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
> >
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
> > +-I../git/include ../git/include/zbar/QZBar.h -o qt/moc_QZBar.cpp
> > +moc: Cannot create qt/moc_QZBar.cpp
> > +make: *** [Makefile:2459: qt/moc_QZBar.cpp] Error 1
> > +
> > +Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> > +---
> > + qt/Makefile.am.inc | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/qt/Makefile.am.inc b/qt/Makefile.am.inc
> > +index b099c2b..c98fbeb 100644
> > +--- a/qt/Makefile.am.inc
> > ++++ b/qt/Makefile.am.inc
> > +@@ -15,4 +15,5 @@ qt/moc_%.cpp: qt/%.h
> > +       $(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
> > +
> > + qt/moc_%.cpp: include/zbar/%.h
> > ++      @$(mkdir_p) qt 2>/dev/null
> > +       $(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
> > +--
> > +2.29.2
> > +
> > diff --git
> a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> > new file mode 100644
> > index 000000000..a1c27b8b4
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> > @@ -0,0 +1,40 @@
> > +From fe751929ccc8fd75e350ed6db9d28d04bd31fc79 Mon Sep 17 00:00:00 2001
> > +From: Daniel Gomez <dagmcr@gmail.com>
> > +Date: Sun, 17 Jan 2021 23:33:19 +0100
> > +Subject: [PATCH 2/2] zbarcam: Create subdir in Makefile
> > +
> > +Create builddir/zbarcam when --with-qt5 is enabled.
> > +
> > +Fixes the following error:
> > +
> > +moc -i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB
> > +-DQT_CORE_LIB
> >
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
> >
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtX11Extras
> >
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
> >
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
> > +-I../git/include ../git/zbarcam/zbarcam-qt.cpp -o
> > +zbarcam/moc_zbarcam_qt.h
> > +moc: Cannot create zbarcam/moc_zbarcam_qt.h
> > +make: *** [Makefile:2438: zbarcam/moc_zbarcam_qt.h] Error 1
> > +
> > +Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> > +---
> > + zbarcam/Makefile.am.inc | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/zbarcam/Makefile.am.inc b/zbarcam/Makefile.am.inc
> > +index b6de82c..e90c50c 100644
> > +--- a/zbarcam/Makefile.am.inc
> > ++++ b/zbarcam/Makefile.am.inc
> > +@@ -28,6 +28,7 @@ DISTCLEANFILES +=
> $(nodist_zbarcam_zbarcam_qt_SOURCES) zbarcam/moc_zbarcam_qt.h
> > +
> > +
> > + zbarcam/moc_zbarcam_qt.h: zbarcam/zbarcam-qt.cpp
> > ++      @$(mkdir_p) zbarcam 2>/dev/null
> > +       $(MOC) -i $(zbarcam_zbarcam_qt_CPPFLAGS) $< -o $@
> > + endif
> > +
> > +--
> > +2.29.2
> > +
> > diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb
> b/meta-oe/recipes-support/zbar/zbar_git.bb
> > index 181d7ae43..0bb0699a1 100644
> > --- a/meta-oe/recipes-support/zbar/zbar_git.bb
> > +++ b/meta-oe/recipes-support/zbar/zbar_git.bb
> > @@ -1,31 +1,59 @@
> > -DESCRIPTION = "2D barcode scanner toolkit."
> > +HOMEPAGE = "https://github.com/mchehab/zbar"
> > +SUMMARY = "A bar code library"
> > +DESRIPTION = "ZBar is an open source software suite for reading bar
> codes \
> > +from various sources, such as video streams, image files and raw \
> > +intensity sensors. It supports EAN-13/UPC-A, UPC-E, EAN-8, Code 128, \
> > +Code 93, Code 39, Codabar, Interleaved 2 of 5, QR Code and SQ Code"
> >  SECTION = "graphics"
> > +
> >  LICENSE = "LGPL-2.1"
> > +LIC_FILES_CHKSUM =
> "file://LICENSE.md;md5=5e9ee833a2118adc7d8b5ea38e5b1cef"
> >
> > -DEPENDS = "pkgconfig intltool-native libpng jpeg"
> > +SRC_URI = "git://github.com/mchehab/zbar.git;branch=master \
> > +           file://0001-qt-Create-subdir-in-Makefile.patch \
> > +           file://0002-zbarcam-Create-subdir-in-Makefile.patch \
> > +"
> > +SRCREV = "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
> >
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=4015840237ca7f0175cd626f78714ca8"
> > +S = "${WORKDIR}/git"
> > +PV = "0.23.1+git${SRCPV}"
> >
> > -PV = "0.10+git${SRCPV}"
> > +DEPENDS += "xmlto-native"
> >
> > -#  iPhoneSDK-1.3.1 tag
> > -SRCREV = "67003d2a985b5f9627bee2d8e3e0b26d0c474b57"
> > -SRC_URI = "git://github.com/ZBar/Zbar \
> > -           file://0001-make-relies-GNU-extentions.patch \
> > +PACKAGECONFIG ??= "\
> > +        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> >  "
> > -S = "${WORKDIR}/git"
> >
> > -inherit autotools pkgconfig
> > +PACKAGECONFIG ??= "video python3"
> >
> > -PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> > +inherit autotools pkgconfig gettext \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'python3',
> 'python3native', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'gtk3',
> 'gobject-introspection', '', d)} \
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths',
> '', d)}
> >
> > -PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau
> libxext libxv libice libxdmcp"
> > +PACKAGECONFIG[x11] = "--with-x, --without-x, libxv"
> > +PACKAGECONFIG[video] = "--enable-video, --disable-video, v4l-utils
> libv4l"
> > +PACKAGECONFIG[jpeg] = "--with-jpeg, --without-jpeg, jpeg"
> > +PACKAGECONFIG[python3] = "--with-python=auto, --without-python, python3"
> > +PACKAGECONFIG[gtk3] = "--with-gtk=gtk3, --without-gtk, gtk+3"
> > +PACKAGECONFIG[qt5] = "--with-qt5, --without-qt5, qtbase qtbase-native
> qtx11extras qtsvg, qtbase"
> > +PACKAGECONFIG[imagemagick] = "--with-imagemagick,
> --without-imagemagick, imagemagick"
> >
> > -EXTRA_OECONF = "--without-imagemagick --without-qt --without-python
> --disable-video --without-gtk"
> > +FILES_${PN} += "${bindir} \
> > +        ${@bb.utils.contains('DEPENDS', 'python3-native', '${libdir}',
> '', d)} \
> > +"
> > +
> > +CPPFLAGS_append = "\
> > +        ${@bb.utils.contains('PACKAGECONFIG', 'qt5', '\
> > +        -I${STAGING_INCDIR}/QtX11Extras \
> > +        -I${STAGING_INCDIR}/dbus-1.0 \
> > +        -I${STAGING_LIBDIR}/dbus-1.0/include \
> > +        ', '', d)} \
> > +"
> >
> > -CPPFLAGS += "-Wno-error"
> > +TARGET_CXXFLAGS_append = " -fPIC"
> >
> > -do_install_append() {
> > -    #remove usr/bin if empty
> > -    rmdir ${D}${bindir}
> > +do_prepare_recipe_sysroot_gettext() {
> > +        install -m 755 ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${S}/
> >  }
> > +addtask do_prepare_recipe_sysroot_gettext after
> do_prepare_recipe_sysroot before do_configure
> > --
> > 2.29.2
> >
> >
> > 
> >
>

--000000000000cac50905b981bf6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 22 Jan 2021 at 19:19, Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks Daniel=
<br>
<br>
Can you rebase it on latest master and resend ?<br></blockquote><div>Done.=
 Thanks!<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On Fri, Jan 22, 2021 at 1:13 AM Daniel Gomez &lt;<a href=3D"mailto:daniel@=
qtec.com" target=3D"_blank">daniel@qtec.com</a>&gt; wrote:<br>
&gt;<br>
&gt; ZBar project development stopped in 2012 but it was forked and<br>
&gt; maintained by Mauro Carvalho Chehab to keep it up to date with V4L2 a=
pi.<br>
&gt;<br>
&gt; Main repository:<br>
&gt; <a href=3D"https://github.com/mchehab/zbar" rel=3D"noreferrer" target=
=
=3D"_blank">https://github.com/mchehab/zbar</a><br>
&gt;<br>
&gt; Add support for zbar library mantained by mchehab. Use latest<br>
&gt; version available 0.23.1.<br>
&gt;<br>
&gt; Compile by default with options: video &amp; python3.<br>
&gt;<br>
&gt; Signed-off-by: Daniel Gomez &lt;<a href=3D"mailto:daniel@qtec.com" ta=
rget=3D"_blank">daniel@qtec.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-make-relies-GNU-extentions.patch=C2=A0 =C2=A0 =C2=A0| =
36 -----------<br>
&gt;=C2=A0 .../0001-qt-Create-subdir-in-Makefile.patch=C2=A0 =C2=A0| 35 ++=
+++++++++<br>
&gt;=C2=A0 ...02-zbarcam-Create-subdir-in-Makefile.patch | 40 ++++++++++++=
<br>
&gt;=C2=A0 meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.bb" rel=
=
=3D"noreferrer" target=3D"_blank">zbar_git.bb</a>=C2=A0 =C2=A0 =C2=A0 | 62=
 ++++++++++++++-----<br>
&gt;=C2=A0 4 files changed, 120 insertions(+), 53 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/zbar/zbar/0001-make-=
relies-GNU-extentions.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-qt-Cr=
eate-subdir-in-Makefile.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/zbar/zbar/0002-zbarc=
am-Create-subdir-in-Makefile.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-e=
xtentions.patch b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-ex=
tentions.patch<br>
&gt; deleted file mode 100644<br>
&gt; index c93af3296..000000000<br>
&gt; --- a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentio=
ns.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,36 +0,0 @@<br>
&gt; -From 224507bc4b6e58f7a6e445bfebfb59d6b8d78bd6 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Fri, 2 Dec 2016 17:38:51 -0800<br>
&gt; -Subject: [PATCH] make relies GNU extentions<br>
&gt; -<br>
&gt; -We get errors like<br>
&gt; -`%&#39;-style pattern rules are a GNU make extension<br>
&gt; -<br>
&gt; -Disable this warning, since we use gmake with OE<br>
&gt; -anyway<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a> | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; -@@ -3,7 +3,7 @@ AC_PREREQ([2.61])<br>
&gt; - AC_INIT([zbar], [0.10], [<a href=3D"mailto:spadix@users.sourceforge=
.net" target=3D"_blank">spadix@users.sourceforge.net</a>])<br>
&gt; - AC_CONFIG_AUX_DIR(config)<br>
&gt; - AC_CONFIG_MACRO_DIR(config)<br>
&gt; --AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-opt=
ions dist-bzip2])<br>
&gt; -+AM_INIT_AUTOMAKE([1.10 -Wall -Wno-error foreign subdir-objects std-=
options dist-bzip2])<br>
&gt; - AC_CONFIG_HEADERS([include/config.h])<br>
&gt; - AC_CONFIG_SRCDIR(zbar/scanner.c)<br>
&gt; - LT_PREREQ([2.2])<br>
&gt; -@@ -47,7 +47,7 @@ AC_DEFINE_UNQUOTED([LIB_VERSION_REVISION<br>
&gt; -=C2=A0 =C2=A0[Library revision])<br>
&gt; -<br>
&gt; - AM_CPPFLAGS=3D&quot;-I$srcdir/include&quot;<br>
&gt; --AM_CFLAGS=3D&quot;-Wall -Wno-parentheses -Werror&quot;<br>
&gt; -+AM_CFLAGS=3D&quot;-Wall -Wno-parentheses&quot;<br>
&gt; - AM_CXXFLAGS=3D&quot;$AM_CFLAGS&quot;<br>
&gt; - AC_SUBST([AM_CPPFLAGS])<br>
&gt; - AC_SUBST([AM_CFLAGS])<br>
&gt; diff --git a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-=
in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir=
-in-Makefile.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..5e614f1fc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Make=
file.patch<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +From 9c67f377477a07495a712f478eabfa8d33164c45 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Daniel Gomez &lt;<a href=3D"mailto:dagmcr@gmail.com" target=3D=
"_blank">dagmcr@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 17 Jan 2021 23:32:51 +0100<br>
&gt; +Subject: [PATCH 1/2] qt: Create subdir in Makefile<br>
&gt; +<br>
&gt; +Create builddir/qt subdir when --with-qt5 is enabled.<br>
&gt; +<br>
&gt; +Fixes the following error:<br>
&gt; +<br>
&gt; +moc -Iqt -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB<br>
&gt; +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.=
23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets<br>
&gt; +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.=
23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui<br>
&gt; +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.=
23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore<br>
&gt; +-I../git/include ../git/include/zbar/QZBar.h -o qt/moc_QZBar.cpp<br>
&gt; +moc: Cannot create qt/moc_QZBar.cpp<br>
&gt; +make: *** [Makefile:2459: qt/moc_QZBar.cpp] Error 1<br>
&gt; +<br>
&gt; +Signed-off-by: Daniel Gomez &lt;<a href=3D"mailto:dagmcr@gmail.com" =
target=3D"_blank">dagmcr@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + qt/Makefile.am.inc | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/qt/Makefile.am.inc b/qt/Makefile.am.inc<br>
&gt; +index b099c2b..c98fbeb 100644<br>
&gt; +--- a/qt/Makefile.am.inc<br>
&gt; ++++ b/qt/Makefile.am.inc<br>
&gt; +@@ -15,4 +15,5 @@ qt/moc_%.cpp: qt/%.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $&lt; =
-o $@<br>
&gt; +<br>
&gt; + qt/moc_%.cpp: include/zbar/%.h<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @$(mkdir_p) qt 2&gt;/dev/null<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $&lt; =
-o $@<br>
&gt; +--<br>
&gt; +2.29.2<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-su=
bdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Cre=
ate-subdir-in-Makefile.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..a1c27b8b4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in=
-Makefile.patch<br>
&gt; @@ -0,0 +1,40 @@<br>
&gt; +From fe751929ccc8fd75e350ed6db9d28d04bd31fc79 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Daniel Gomez &lt;<a href=3D"mailto:dagmcr@gmail.com" target=3D=
"_blank">dagmcr@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 17 Jan 2021 23:33:19 +0100<br>
&gt; +Subject: [PATCH 2/2] zbarcam: Create subdir in Makefile<br>
&gt; +<br>
&gt; +Create builddir/zbarcam when --with-qt5 is enabled.<br>
&gt; +<br>
&gt; +Fixes the following error:<br>
&gt; +<br>
&gt; +moc -i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB<br=
>
&gt; +-DQT_CORE_LIB<br>
&gt; +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.=
23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets<br>
&gt; +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.=
23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtX11Extras<br>
&gt; +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.=
23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui<br>
&gt; +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.=
23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore<br>
&gt; +-I../git/include ../git/zbarcam/zbarcam-qt.cpp -o<br>
&gt; +zbarcam/moc_zbarcam_qt.h<br>
&gt; +moc: Cannot create zbarcam/moc_zbarcam_qt.h<br>
&gt; +make: *** [Makefile:2438: zbarcam/moc_zbarcam_qt.h] Error 1<br>
&gt; +<br>
&gt; +Signed-off-by: Daniel Gomez &lt;<a href=3D"mailto:dagmcr@gmail.com" =
target=3D"_blank">dagmcr@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + zbarcam/Makefile.am.inc | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/zbarcam/Makefile.am.inc b/zbarcam/Makefile.am.inc<br>
&gt; +index b6de82c..e90c50c 100644<br>
&gt; +--- a/zbarcam/Makefile.am.inc<br>
&gt; ++++ b/zbarcam/Makefile.am.inc<br>
&gt; +@@ -28,6 +28,7 @@ DISTCLEANFILES +=3D $(nodist_zbarcam_zbarcam_qt_SO=
URCES) zbarcam/moc_zbarcam_qt.h<br>
&gt; +<br>
&gt; +<br>
&gt; + zbarcam/moc_zbarcam_qt.h: zbarcam/zbarcam-qt.cpp<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @$(mkdir_p) zbarcam 2&gt;/dev/null<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MOC) -i $(zbarcam_zbarcam_qt_CPPFLAGS) =
$&lt; -o $@<br>
&gt; + endif<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.29.2<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.=
bb" rel=3D"noreferrer" target=3D"_blank">zbar_git.bb</a> b/meta-oe/recipes-=
support/zbar/<a href=3D"http://zbar_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">zbar_git.bb</a><br>
&gt; index 181d7ae43..0bb0699a1 100644<br>
&gt; --- a/meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.bb" rel=
=
=3D"noreferrer" target=3D"_blank">zbar_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.bb" rel=
=
=3D"noreferrer" target=3D"_blank">zbar_git.bb</a><br>
&gt; @@ -1,31 +1,59 @@<br>
&gt; -DESCRIPTION =3D &quot;2D barcode scanner toolkit.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/mchehab/zbar" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/mchehab/zbar</a>&quot=
;<br>
&gt; +SUMMARY =3D &quot;A bar code library&quot;<br>
&gt; +DESRIPTION =3D &quot;ZBar is an open source software suite for readi=
ng bar codes \<br>
&gt; +from various sources, such as video streams, image files and raw \<b=
r>
&gt; +intensity sensors. It supports EAN-13/UPC-A, UPC-E, EAN-8, Code 128,=
 \<br>
&gt; +Code 93, Code 39, Codabar, Interleaved 2 of 5, QR Code and SQ Code&q=
uot;<br>
&gt;=C2=A0 SECTION =3D &quot;graphics&quot;<br>
&gt; +<br>
&gt;=C2=A0 LICENSE =3D &quot;LGPL-2.1&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D5e9ee833a2118adc7=
d8b5ea38e5b1cef&quot;<br>
&gt;<br>
&gt; -DEPENDS =3D &quot;pkgconfig intltool-native libpng jpeg&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/mchehab/zbar.gi=
t;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/mchehab/=
zbar.git;branch=3Dmaster</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-qt-Create-subdi=
r-in-Makefile.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-zbarcam-Create-=
subdir-in-Makefile.patch \<br>
&gt; +&quot;<br>
&gt; +SRCREV =3D &quot;89e7900d85dd54ef351a7ed582aec6a5a5d7fa37&quot;<br>
&gt;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4015840237ca7f0175cd=
626f78714ca8&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +PV =3D &quot;0.23.1+git${SRCPV}&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.10+git${SRCPV}&quot;<br>
&gt; +DEPENDS +=3D &quot;xmlto-native&quot;<br>
&gt;<br>
&gt; -#=C2=A0 iPhoneSDK-1.3.1 tag<br>
&gt; -SRCREV =3D &quot;67003d2a985b5f9627bee2d8e3e0b26d0c474b57&quot;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/ZBar/Zbar" rel=
=3D"noreferrer" target=3D"_blank">github.com/ZBar/Zbar</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-make-relies-GNU=
-extentions.patch \<br>
&gt; +PACKAGECONFIG ??=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 &quot;<br>
&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -inherit autotools pkgconfig<br>
&gt; +PACKAGECONFIG ??=3D &quot;video python3&quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;=
, &#39;x11&#39;, d)}&quot;<br>
&gt; +inherit autotools pkgconfig gettext \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG&=
#39;, &#39;python3&#39;, &#39;python3native&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG&=
#39;, &#39;gtk3&#39;, &#39;gobject-introspection&#39;, &#39;&#39;, d)} \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG&=
#39;, &#39;qt5&#39;, &#39;qmake5_paths&#39;, &#39;&#39;, d)}<br>
&gt;<br>
&gt; -PACKAGECONFIG[x11] =3D &quot;--with-x,-without-x,libxcb libx11 libsm=
 libxau libxext libxv libice libxdmcp&quot;<br>
&gt; +PACKAGECONFIG[x11] =3D &quot;--with-x, --without-x, libxv&quot;<br>
&gt; +PACKAGECONFIG[video] =3D &quot;--enable-video, --disable-video, v4l-=
utils libv4l&quot;<br>
&gt; +PACKAGECONFIG[jpeg] =3D &quot;--with-jpeg, --without-jpeg, jpeg&quot=
;<br>
&gt; +PACKAGECONFIG[python3] =3D &quot;--with-python=3Dauto, --without-pyt=
hon, python3&quot;<br>
&gt; +PACKAGECONFIG[gtk3] =3D &quot;--with-gtk=3Dgtk3, --without-gtk, gtk+=
3&quot;<br>
&gt; +PACKAGECONFIG[qt5] =3D &quot;--with-qt5, --without-qt5, qtbase qtbas=
e-native qtx11extras qtsvg, qtbase&quot;<br>
&gt; +PACKAGECONFIG[imagemagick] =3D &quot;--with-imagemagick, --without-i=
magemagick, imagemagick&quot;<br>
&gt;<br>
&gt; -EXTRA_OECONF =3D &quot;--without-imagemagick --without-qt --without-=
python --disable-video --without-gtk&quot;<br>
&gt; +FILES_${PN} +=3D &quot;${bindir} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DEPENDS&#39;, =
&#39;python3-native&#39;, &#39;${libdir}&#39;, &#39;&#39;, d)} \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +CPPFLAGS_append =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG&=
#39;, &#39;qt5&#39;, &#39;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -I${STAGING_INCDIR}/QtX11Extras \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -I${STAGING_INCDIR}/dbus-1.0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -I${STAGING_LIBDIR}/dbus-1.0/include \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;, &#39;&#39;, d)} \<br>
&gt; +&quot;<br>
&gt;<br>
&gt; -CPPFLAGS +=3D &quot;-Wno-error&quot;<br>
&gt; +TARGET_CXXFLAGS_append =3D &quot; -fPIC&quot;<br>
&gt;<br>
&gt; -do_install_append() {<br>
&gt; -=C2=A0 =C2=A0 #remove usr/bin if empty<br>
&gt; -=C2=A0 =C2=A0 rmdir ${D}${bindir}<br>
&gt; +do_prepare_recipe_sysroot_gettext() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 ${STAGING_DATADIR_NATIVE}=
/gettext/ABOUT-NLS ${S}/<br>
&gt;=C2=A0 }<br>
&gt; +addtask do_prepare_recipe_sysroot_gettext after do_prepare_recipe_sy=
sroot before do_configure<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000cac50905b981bf6c--
