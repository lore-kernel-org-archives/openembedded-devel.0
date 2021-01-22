Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.6344.1611304548098426119
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 00:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=bXqtjR59;
 spf=pass (domain: qtec.com, ip: 209.85.208.179, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f179.google.com with SMTP id 3so5617094ljc.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 00:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YsYDpmdnPpI6PAuNlM7T8FzCjTfTPhw1hsM96QZB3YU=;
        b=bXqtjR59cQdmvZNTM/9rCvOBKLtm/uCsbXgWyWhPfwLpqP3ONUUmLPzi5c7XSOGYn5
         SxbX90b5Re4xqSRAA1PRiLnoRgsvVQevDM25LT5V2atfLl1mFAYaBmhcUg5GygwKZecE
         5Um9kVcXAshYehY3m9da3s99F0qgjh81q76LLd6vLMoxTCgIE2RFSX1moGmQAxlPP4Ei
         RuNCA7iZyyD/HmYz6ImtnAGTgB8L//DXTjzpBy89sOubdvd9XCdw2bT1hqcFwDAT+1VL
         4MeUO5VuzRXLIjCgcVdrcdbp+PTjwxQ4JKjLhft2/yQZeC1P8JrnFsRJwC2U9/caDwe0
         +uWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YsYDpmdnPpI6PAuNlM7T8FzCjTfTPhw1hsM96QZB3YU=;
        b=QsR40CRGTkxXQ+vfg9pZlSPzlb+KBbuX2on77yAN5fYyOTFzpGO9mxitQx0ud2K49Y
         LbGGK7SPKnYAtdNYJe8bwCCfIgPYR9lCrIDjpxp+Q7snUrRDzV7XO9zRjB12GQvCy20E
         RAHY4W+I8jyTi1+FpG8ZBWdERcBLX6TQATqAGst7c3e0hHeBSghEjgoe33oUEEAIjsFk
         rYaEk+CuXNDtspGrJcWK14vnKkFS2vcx0k+9NkE8gwNCZxFAL5deDL+vzE4teAL7bnHQ
         KN+rzJ4hbXTFfXTzHfc2v1PG0ixxmcdK6Hb7F9rbTwHQjye4Dn7EBmIeHK5JgN9OQAXm
         7SgQ==
X-Gm-Message-State: AOAM530N4pP9RyTEOx3qF5JyEm66f4GYsdwsaN0a9WKrW/fnfqqP9gKF
	JCxN0a2eCTNlygGRYeEuv3dQJYudwxJeguhZz4GF6Q==
X-Google-Smtp-Source: ABdhPJwOVBrl0ljNR2ul4ZGtOlMwkEGf1IYPZMYeTF4d4Ffpk364dsdK+JlVEJrxw3LrRTo/rShWvZBuUNuY6khqSU8=
X-Received: by 2002:a2e:a377:: with SMTP id i23mr40831ljn.103.1611304545962;
 Fri, 22 Jan 2021 00:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20210121204451.8110-1-daniel@qtec.com> <CAMKF1spWhjPpiwzPQ1S6yAb72tStHAZA7mN0Zjj4Bhpf0X=-1Q@mail.gmail.com>
In-Reply-To: <CAMKF1spWhjPpiwzPQ1S6yAb72tStHAZA7mN0Zjj4Bhpf0X=-1Q@mail.gmail.com>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Fri, 22 Jan 2021 09:35:35 +0100
Message-ID: <CAH1Ww+SDwCAKVd-7vK=R3RQ0QsU-NNfPkH7hFXFpqFAz_8BZNg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] zbar: Add support for mchehab/zbar
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000167b8c05b97913bd"

--000000000000167b8c05b97913bd
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Jan 2021 at 22:01, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jan 21, 2021 at 12:45 PM Daniel Gomez <daniel@qtec.com> wrote:
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
> > As ZBar (original project) and mchehab/zbar (new & updated) are
> > different, keep both recipes as:
>
> I would prefer to keep just one version if possible. What would be a
> reason for keeping 0.10 ?
>
Not really. I didn't want to delete the old version in the first place.

Then, I'll send a v2 with 0.10 deleted.

>
> >
> > -  zbar_0.10.bb: ZBar version 0.10
> > -  zbar_git.bb: mchehab/zbar Version 0.23.1
> >
> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > ---
> >  .../0001-qt-Create-subdir-in-Makefile.patch   | 35 +++++++++++
> >  ...02-zbarcam-Create-subdir-in-Makefile.patch | 40 ++++++++++++
> >  meta-oe/recipes-support/zbar/zbar_0.10.bb     | 31 ++++++++++
> >  meta-oe/recipes-support/zbar/zbar_git.bb      | 62 ++++++++++++++-----
> >  4 files changed, 151 insertions(+), 17 deletions(-)
> >  create mode 100644
> meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> >  create mode 100644
> meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> >  create mode 100644 meta-oe/recipes-support/zbar/zbar_0.10.bb
> >
> > diff --git
> a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> > new file mode 100644
> > index 000000000..d7ca15207
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
> > diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb
> b/meta-oe/recipes-support/zbar/zbar_0.10.bb
> > new file mode 100644
> > index 000000000..181d7ae43
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
> > @@ -0,0 +1,31 @@
> > +DESCRIPTION = "2D barcode scanner toolkit."
> > +SECTION = "graphics"
> > +LICENSE = "LGPL-2.1"
> > +
> > +DEPENDS = "pkgconfig intltool-native libpng jpeg"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=4015840237ca7f0175cd626f78714ca8"
> > +
> > +PV = "0.10+git${SRCPV}"
> > +
> > +#  iPhoneSDK-1.3.1 tag
> > +SRCREV = "67003d2a985b5f9627bee2d8e3e0b26d0c474b57"
> > +SRC_URI = "git://github.com/ZBar/Zbar \
> > +           file://0001-make-relies-GNU-extentions.patch \
> > +"
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > +
> > +PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> > +
> > +PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau
> libxext libxv libice libxdmcp"
> > +
> > +EXTRA_OECONF = "--without-imagemagick --without-qt --without-python
> --disable-video --without-gtk"
> > +
> > +CPPFLAGS += "-Wno-error"
> > +
> > +do_install_append() {
> > +    #remove usr/bin if empty
> > +    rmdir ${D}${bindir}
> > +}
> > diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb
> b/meta-oe/recipes-support/zbar/zbar_git.bb
> > index 181d7ae43..dae912252 100644
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
> > \ No newline at end of file
> > --
> > 2.29.2
> >
> >
> > 
> >
>

--000000000000167b8c05b97913bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 21 Jan 2021 at 22:01, Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 2=
1, 2021 at 12:45 PM Daniel Gomez &lt;<a href=3D"mailto:daniel@qtec.com" tar=
get=3D"_blank">daniel@qtec.com</a>&gt; wrote:<br>
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
&gt; As ZBar (original project) and mchehab/zbar (new &amp; updated) are<b=
r>
&gt; different, keep both recipes as:<br>
<br>
I would prefer to keep just one version if possible. What would be a<br>
reason for keeping 0.10 ?<br></blockquote><div>Not really. I didn&#39;t wa=
nt to delete the old version in the first place.</div><div><br></div><div>T=
hen, I&#39;ll send a v2 with 0.10 deleted.<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; -=C2=A0 <a href=3D"http://zbar_0.10.bb" rel=3D"noreferrer" target=3D"=
_blank">zbar_0.10.bb</a>: ZBar version 0.10<br>
&gt; -=C2=A0 <a href=3D"http://zbar_git.bb" rel=3D"noreferrer" target=3D"_=
blank">zbar_git.bb</a>: mchehab/zbar Version 0.23.1<br>
&gt;<br>
&gt; Signed-off-by: Daniel Gomez &lt;<a href=3D"mailto:daniel@qtec.com" ta=
rget=3D"_blank">daniel@qtec.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-qt-Create-subdir-in-Makefile.patch=C2=A0 =C2=A0| 35 ++=
+++++++++<br>
&gt;=C2=A0 ...02-zbarcam-Create-subdir-in-Makefile.patch | 40 ++++++++++++=
<br>
&gt;=C2=A0 meta-oe/recipes-support/zbar/<a href=3D"http://zbar_0.10.bb" re=
l=3D"noreferrer" target=3D"_blank">zbar_0.10.bb</a>=C2=A0 =C2=A0 =C2=A0| 31=
 ++++++++++<br>
&gt;=C2=A0 meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.bb" rel=
=
=3D"noreferrer" target=3D"_blank">zbar_git.bb</a>=C2=A0 =C2=A0 =C2=A0 | 62=
 ++++++++++++++-----<br>
&gt;=C2=A0 4 files changed, 151 insertions(+), 17 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-qt-Cr=
eate-subdir-in-Makefile.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/zbar/zbar/0002-zbarc=
am-Create-subdir-in-Makefile.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/zbar/<a href=3D"http=
://zbar_0.10.bb" rel=3D"noreferrer" target=3D"_blank">zbar_0.10.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-=
in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir=
-in-Makefile.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..d7ca15207<br>
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
&gt; diff --git a/meta-oe/recipes-support/zbar/<a href=3D"http://zbar_0.10=
.bb" rel=3D"noreferrer" target=3D"_blank">zbar_0.10.bb</a> b/meta-oe/recipe=
s-support/zbar/<a href=3D"http://zbar_0.10.bb" rel=3D"noreferrer" target=3D=
"_blank">zbar_0.10.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..181d7ae43<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/zbar/<a href=3D"http://zbar_0.10.bb" re=
l=3D"noreferrer" target=3D"_blank">zbar_0.10.bb</a><br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +DESCRIPTION =3D &quot;2D barcode scanner toolkit.&quot;<br>
&gt; +SECTION =3D &quot;graphics&quot;<br>
&gt; +LICENSE =3D &quot;LGPL-2.1&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;pkgconfig intltool-native libpng jpeg&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4015840237ca7f0175cd=
626f78714ca8&quot;<br>
&gt; +<br>
&gt; +PV =3D &quot;0.10+git${SRCPV}&quot;<br>
&gt; +<br>
&gt; +#=C2=A0 iPhoneSDK-1.3.1 tag<br>
&gt; +SRCREV =3D &quot;67003d2a985b5f9627bee2d8e3e0b26d0c474b57&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/ZBar/Zbar" rel=
=3D"noreferrer" target=3D"_blank">github.com/ZBar/Zbar</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-make-relies-GNU=
-extentions.patch \<br>
&gt; +&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit autotools pkgconfig<br>
&gt; +<br>
&gt; +PACKAGECONFIG =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;=
, &#39;x11&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG[x11] =3D &quot;--with-x,-without-x,libxcb libx11 libsm=
 libxau libxext libxv libice libxdmcp&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECONF =3D &quot;--without-imagemagick --without-qt --without-=
python --disable-video --without-gtk&quot;<br>
&gt; +<br>
&gt; +CPPFLAGS +=3D &quot;-Wno-error&quot;<br>
&gt; +<br>
&gt; +do_install_append() {<br>
&gt; +=C2=A0 =C2=A0 #remove usr/bin if empty<br>
&gt; +=C2=A0 =C2=A0 rmdir ${D}${bindir}<br>
&gt; +}<br>
&gt; diff --git a/meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.=
bb" rel=3D"noreferrer" target=3D"_blank">zbar_git.bb</a> b/meta-oe/recipes-=
support/zbar/<a href=3D"http://zbar_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">zbar_git.bb</a><br>
&gt; index 181d7ae43..dae912252 100644<br>
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
&gt; \ No newline at end of file<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000167b8c05b97913bd--
