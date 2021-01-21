Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.2531.1611262869770438265
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 13:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WOhRnDYN;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id r77so2936185qka.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 13:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gg6b1EiBkUPDCyBbBpLDR0MyN7TRhxhOXySUytZMiJ0=;
        b=WOhRnDYNboLogxYfvqvvgweVDeJIkpVVSkF8+iLDl5EwWnTSKR4bqaCvBQcFbCe7+g
         obSNeRytxNBrj87c/PefuYvyfGFKyyTuWOJhYrrlxLcEuuCrWK5/TtjKTY0s40Nn1JEN
         aHy9AA8GvkrMBuldF3SS0/EHXbpiDe6dHL51/n46nRLmQtgx48kDkYZ280HkbEIM9oGf
         JS7OIZKlqEoVvbOcFW2DyV/m5GxABqYpFhzO4E+tmFlIVYYuZLjvUYbutgYCs8y1WqtM
         2vvqZRVPj3cooWYoPHV6VQDNHtdcTYp1VxA1Km8Z6Ldja9Ustv9Z1Cx7RkBWlw8E59CP
         LEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gg6b1EiBkUPDCyBbBpLDR0MyN7TRhxhOXySUytZMiJ0=;
        b=roTkwrDC4GSIHBrxzxGLf1PZiWuVpG0VRLHkN/4ZJ+BtNUd1xszfAlgmLAyQz4vWhQ
         Ems+FALXtMeUTMITF/GjCUE75xokKSwJ+jPQ19CasIgR6XlJ/FXAqoHveZkbsUvCfvNt
         1+T0BxTJzyDJSva9s7MK5c3IbvfFQokqaw/PdcxvisyYq5JnMKnO6OwivH/mGc2BWk+p
         QTzI7cUxYtPXv1T8m4c9+vyxJfQxpFi/1rGf9BbZAUFh6ZGHXXa4+YsbbA5Yj3IQMySX
         F/Yb14GxPbx6T8OBKMjpILc73DM82qZoVantQIwej3T3EuSr63GXG5t9N1NYDWYvVpsY
         m2Rg==
X-Gm-Message-State: AOAM533RMUka+TQc97Q9thN2JiMud0TDxIzO9krmQJ6yitoC2Aq8qXwK
	nsm6XrshGast/D6YGaGnTZ6Nq8Cul+DTRexwXHw=
X-Google-Smtp-Source: ABdhPJxnlpNJ3fdjLrQ3BYgdlh6yUZqW65ArVefR+yFDNt3rAqs3nwpDpEKr1VJiG//7GBh7UHeeh/attmJNEPpNKfg=
X-Received: by 2002:a37:4286:: with SMTP id p128mr1672781qka.337.1611262868670;
 Thu, 21 Jan 2021 13:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20210121204451.8110-1-daniel@qtec.com>
In-Reply-To: <20210121204451.8110-1-daniel@qtec.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 21 Jan 2021 13:00:42 -0800
Message-ID: <CAMKF1spWhjPpiwzPQ1S6yAb72tStHAZA7mN0Zjj4Bhpf0X=-1Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] zbar: Add support for mchehab/zbar
To: Daniel Gomez <daniel@qtec.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 21, 2021 at 12:45 PM Daniel Gomez <daniel@qtec.com> wrote:
>
> ZBar project development stopped in 2012 but it was forked and
> maintained by Mauro Carvalho Chehab to keep it up to date with V4L2 api.
>
> Main repository:
> https://github.com/mchehab/zbar
>
> Add support for zbar library mantained by mchehab. Use latest
> version available 0.23.1.
>
> Compile by default with options: video & python3.
>
> As ZBar (original project) and mchehab/zbar (new & updated) are
> different, keep both recipes as:

I would prefer to keep just one version if possible. What would be a
reason for keeping 0.10 ?

>
> -  zbar_0.10.bb: ZBar version 0.10
> -  zbar_git.bb: mchehab/zbar Version 0.23.1
>
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>  .../0001-qt-Create-subdir-in-Makefile.patch   | 35 +++++++++++
>  ...02-zbarcam-Create-subdir-in-Makefile.patch | 40 ++++++++++++
>  meta-oe/recipes-support/zbar/zbar_0.10.bb     | 31 ++++++++++
>  meta-oe/recipes-support/zbar/zbar_git.bb      | 62 ++++++++++++++-----
>  4 files changed, 151 insertions(+), 17 deletions(-)
>  create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
>  create mode 100644 meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
>  create mode 100644 meta-oe/recipes-support/zbar/zbar_0.10.bb
>
> diff --git a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> new file mode 100644
> index 000000000..d7ca15207
> --- /dev/null
> +++ b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> @@ -0,0 +1,35 @@
> +From 9c67f377477a07495a712f478eabfa8d33164c45 Mon Sep 17 00:00:00 2001
> +From: Daniel Gomez <dagmcr@gmail.com>
> +Date: Sun, 17 Jan 2021 23:32:51 +0100
> +Subject: [PATCH 1/2] qt: Create subdir in Makefile
> +
> +Create builddir/qt subdir when --with-qt5 is enabled.
> +
> +Fixes the following error:
> +
> +moc -Iqt -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
> +-I../git/include ../git/include/zbar/QZBar.h -o qt/moc_QZBar.cpp
> +moc: Cannot create qt/moc_QZBar.cpp
> +make: *** [Makefile:2459: qt/moc_QZBar.cpp] Error 1
> +
> +Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> +---
> + qt/Makefile.am.inc | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/qt/Makefile.am.inc b/qt/Makefile.am.inc
> +index b099c2b..c98fbeb 100644
> +--- a/qt/Makefile.am.inc
> ++++ b/qt/Makefile.am.inc
> +@@ -15,4 +15,5 @@ qt/moc_%.cpp: qt/%.h
> +       $(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
> +
> + qt/moc_%.cpp: include/zbar/%.h
> ++      @$(mkdir_p) qt 2>/dev/null
> +       $(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
> +--
> +2.29.2
> +
> diff --git a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> new file mode 100644
> index 000000000..a1c27b8b4
> --- /dev/null
> +++ b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> @@ -0,0 +1,40 @@
> +From fe751929ccc8fd75e350ed6db9d28d04bd31fc79 Mon Sep 17 00:00:00 2001
> +From: Daniel Gomez <dagmcr@gmail.com>
> +Date: Sun, 17 Jan 2021 23:33:19 +0100
> +Subject: [PATCH 2/2] zbarcam: Create subdir in Makefile
> +
> +Create builddir/zbarcam when --with-qt5 is enabled.
> +
> +Fixes the following error:
> +
> +moc -i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB
> +-DQT_CORE_LIB
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtX11Extras
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
> +-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
> +-I../git/include ../git/zbarcam/zbarcam-qt.cpp -o
> +zbarcam/moc_zbarcam_qt.h
> +moc: Cannot create zbarcam/moc_zbarcam_qt.h
> +make: *** [Makefile:2438: zbarcam/moc_zbarcam_qt.h] Error 1
> +
> +Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> +---
> + zbarcam/Makefile.am.inc | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/zbarcam/Makefile.am.inc b/zbarcam/Makefile.am.inc
> +index b6de82c..e90c50c 100644
> +--- a/zbarcam/Makefile.am.inc
> ++++ b/zbarcam/Makefile.am.inc
> +@@ -28,6 +28,7 @@ DISTCLEANFILES += $(nodist_zbarcam_zbarcam_qt_SOURCES) zbarcam/moc_zbarcam_qt.h
> +
> +
> + zbarcam/moc_zbarcam_qt.h: zbarcam/zbarcam-qt.cpp
> ++      @$(mkdir_p) zbarcam 2>/dev/null
> +       $(MOC) -i $(zbarcam_zbarcam_qt_CPPFLAGS) $< -o $@
> + endif
> +
> +--
> +2.29.2
> +
> diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb b/meta-oe/recipes-support/zbar/zbar_0.10.bb
> new file mode 100644
> index 000000000..181d7ae43
> --- /dev/null
> +++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "2D barcode scanner toolkit."
> +SECTION = "graphics"
> +LICENSE = "LGPL-2.1"
> +
> +DEPENDS = "pkgconfig intltool-native libpng jpeg"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4015840237ca7f0175cd626f78714ca8"
> +
> +PV = "0.10+git${SRCPV}"
> +
> +#  iPhoneSDK-1.3.1 tag
> +SRCREV = "67003d2a985b5f9627bee2d8e3e0b26d0c474b57"
> +SRC_URI = "git://github.com/ZBar/Zbar \
> +           file://0001-make-relies-GNU-extentions.patch \
> +"
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +
> +PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau libxext libxv libice libxdmcp"
> +
> +EXTRA_OECONF = "--without-imagemagick --without-qt --without-python --disable-video --without-gtk"
> +
> +CPPFLAGS += "-Wno-error"
> +
> +do_install_append() {
> +    #remove usr/bin if empty
> +    rmdir ${D}${bindir}
> +}
> diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
> index 181d7ae43..dae912252 100644
> --- a/meta-oe/recipes-support/zbar/zbar_git.bb
> +++ b/meta-oe/recipes-support/zbar/zbar_git.bb
> @@ -1,31 +1,59 @@
> -DESCRIPTION = "2D barcode scanner toolkit."
> +HOMEPAGE = "https://github.com/mchehab/zbar"
> +SUMMARY = "A bar code library"
> +DESRIPTION = "ZBar is an open source software suite for reading bar codes \
> +from various sources, such as video streams, image files and raw \
> +intensity sensors. It supports EAN-13/UPC-A, UPC-E, EAN-8, Code 128, \
> +Code 93, Code 39, Codabar, Interleaved 2 of 5, QR Code and SQ Code"
>  SECTION = "graphics"
> +
>  LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e9ee833a2118adc7d8b5ea38e5b1cef"
>
> -DEPENDS = "pkgconfig intltool-native libpng jpeg"
> +SRC_URI = "git://github.com/mchehab/zbar.git;branch=master \
> +           file://0001-qt-Create-subdir-in-Makefile.patch \
> +           file://0002-zbarcam-Create-subdir-in-Makefile.patch \
> +"
> +SRCREV = "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4015840237ca7f0175cd626f78714ca8"
> +S = "${WORKDIR}/git"
> +PV = "0.23.1+git${SRCPV}"
>
> -PV = "0.10+git${SRCPV}"
> +DEPENDS += "xmlto-native"
>
> -#  iPhoneSDK-1.3.1 tag
> -SRCREV = "67003d2a985b5f9627bee2d8e3e0b26d0c474b57"
> -SRC_URI = "git://github.com/ZBar/Zbar \
> -           file://0001-make-relies-GNU-extentions.patch \
> +PACKAGECONFIG ??= "\
> +        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>  "
> -S = "${WORKDIR}/git"
>
> -inherit autotools pkgconfig
> +PACKAGECONFIG ??= "video python3"
>
> -PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +inherit autotools pkgconfig gettext \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'gtk3', 'gobject-introspection', '', d)} \
> +        ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
>
> -PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau libxext libxv libice libxdmcp"
> +PACKAGECONFIG[x11] = "--with-x, --without-x, libxv"
> +PACKAGECONFIG[video] = "--enable-video, --disable-video, v4l-utils libv4l"
> +PACKAGECONFIG[jpeg] = "--with-jpeg, --without-jpeg, jpeg"
> +PACKAGECONFIG[python3] = "--with-python=auto, --without-python, python3"
> +PACKAGECONFIG[gtk3] = "--with-gtk=gtk3, --without-gtk, gtk+3"
> +PACKAGECONFIG[qt5] = "--with-qt5, --without-qt5, qtbase qtbase-native qtx11extras qtsvg, qtbase"
> +PACKAGECONFIG[imagemagick] = "--with-imagemagick, --without-imagemagick, imagemagick"
>
> -EXTRA_OECONF = "--without-imagemagick --without-qt --without-python --disable-video --without-gtk"
> +FILES_${PN} += "${bindir} \
> +        ${@bb.utils.contains('DEPENDS', 'python3-native', '${libdir}', '', d)} \
> +"
> +
> +CPPFLAGS_append = "\
> +        ${@bb.utils.contains('PACKAGECONFIG', 'qt5', '\
> +        -I${STAGING_INCDIR}/QtX11Extras \
> +        -I${STAGING_INCDIR}/dbus-1.0 \
> +        -I${STAGING_LIBDIR}/dbus-1.0/include \
> +        ', '', d)} \
> +"
>
> -CPPFLAGS += "-Wno-error"
> +TARGET_CXXFLAGS_append = " -fPIC"
>
> -do_install_append() {
> -    #remove usr/bin if empty
> -    rmdir ${D}${bindir}
> +do_prepare_recipe_sysroot_gettext() {
> +        install -m 755 ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${S}/
>  }
> +addtask do_prepare_recipe_sysroot_gettext after do_prepare_recipe_sysroot before do_configure
> \ No newline at end of file
> --
> 2.29.2
>
>
> 
>
