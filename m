Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.13515.1611339574474894563
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 10:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sn3NzfrK;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id e17so4819008qto.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 10:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmuDXPPGu3gqS5NdywdNviUOvLH8y4y8rhc8cVPDiHs=;
        b=Sn3NzfrK22pEwMn2THnDl+c8K/+FA1mQLYF2O2W0jN/5LRvZEk7YwtLVsuyMvNItSx
         Lz9Np7HKGQ1S7s1LL3LuULk3daMNh5h8G34mIHRQyshPj+pWEg7/pn82W7WU8f3+Ja/C
         8p312y4pTq9mLRhyV33tFuOI0urz7H6SYTm2jwW6kmD/G+NcEVxPG2jtvxiyMTENuepN
         1dPAXJSWfVWowzSkwRI1e+jQUgexX5Bew9xbnN5ZP7hh7UILjrr7p7ra/9cHjYQvGoGJ
         Cf/LaAY1p8DRP+uyW+IpA+7JAgzK8oFBuoEJHgKUiI+YBnfecnPcDQ2cRu6yqbViDQEM
         heKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmuDXPPGu3gqS5NdywdNviUOvLH8y4y8rhc8cVPDiHs=;
        b=aUWSA1xRlsVtCMI3sYqWxVHwv6fIJzylCaOaglltCJcC++LjKIGmYmeBK5YLGRm6Hz
         NP9fHurVFadzUWc7jN3HsFkmdvV0pfPGkvw0NtZx1nY1HMGKpMsupE7YgutHTY0UX4u+
         JdkSvm51zb29yV1PP7MYeiexdVoBPYr8mQhbPXsSAlsS8fh0Wj4AxptT0BOc1rNQKzcW
         PBH4lstu1zLJofpiFbYWX0gBlnnDgQXXIuAK8Nmb10NrsWkNQjg7ZcbzLIvJ+VK56rHX
         xiQaYUKkHgenm+f1Fv6omEyQpM25zNdNxVDF0nBarM+HMmv7BLTWbLKpDhpIYi7UvHBN
         1MPw==
X-Gm-Message-State: AOAM530JHYd0T04AwjJDlwF+MDhu1gXI91R5noMU1T5JU3XDGv/9GDh8
	52ao0f0M2iXe1eg055I6XCktYnEY554t7VNPsDPn4USmewM=
X-Google-Smtp-Source: ABdhPJwQRFORjkuHWdd+5q+HHYh1EDCIereQ62QvhxPclroLg5HpsqySHWHgNbs20UeHnwi9+C+dnt50trrB151nypc=
X-Received: by 2002:ac8:5bd1:: with SMTP id b17mr5382053qtb.53.1611339573308;
 Fri, 22 Jan 2021 10:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20210122091246.25423-1-daniel@qtec.com>
In-Reply-To: <20210122091246.25423-1-daniel@qtec.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 22 Jan 2021 10:19:07 -0800
Message-ID: <CAMKF1spc0tbpBXhOJw-7nbs52FTyEVTuRaROqKhxPtVXneAqtQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2] zbar: Add support for mchehab/zbar
To: Daniel Gomez <daniel@qtec.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks Daniel

Can you rebase it on latest master and resend ?

On Fri, Jan 22, 2021 at 1:13 AM Daniel Gomez <daniel@qtec.com> wrote:
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
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>  .../0001-make-relies-GNU-extentions.patch     | 36 -----------
>  .../0001-qt-Create-subdir-in-Makefile.patch   | 35 +++++++++++
>  ...02-zbarcam-Create-subdir-in-Makefile.patch | 40 ++++++++++++
>  meta-oe/recipes-support/zbar/zbar_git.bb      | 62 ++++++++++++++-----
>  4 files changed, 120 insertions(+), 53 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
>  create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
>  create mode 100644 meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
>
> diff --git a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
> deleted file mode 100644
> index c93af3296..000000000
> --- a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 224507bc4b6e58f7a6e445bfebfb59d6b8d78bd6 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 2 Dec 2016 17:38:51 -0800
> -Subject: [PATCH] make relies GNU extentions
> -
> -We get errors like
> -`%'-style pattern rules are a GNU make extension
> -
> -Disable this warning, since we use gmake with OE
> -anyway
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -3,7 +3,7 @@ AC_PREREQ([2.61])
> - AC_INIT([zbar], [0.10], [spadix@users.sourceforge.net])
> - AC_CONFIG_AUX_DIR(config)
> - AC_CONFIG_MACRO_DIR(config)
> --AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options dist-bzip2])
> -+AM_INIT_AUTOMAKE([1.10 -Wall -Wno-error foreign subdir-objects std-options dist-bzip2])
> - AC_CONFIG_HEADERS([include/config.h])
> - AC_CONFIG_SRCDIR(zbar/scanner.c)
> - LT_PREREQ([2.2])
> -@@ -47,7 +47,7 @@ AC_DEFINE_UNQUOTED([LIB_VERSION_REVISION
> -   [Library revision])
> -
> - AM_CPPFLAGS="-I$srcdir/include"
> --AM_CFLAGS="-Wall -Wno-parentheses -Werror"
> -+AM_CFLAGS="-Wall -Wno-parentheses"
> - AM_CXXFLAGS="$AM_CFLAGS"
> - AC_SUBST([AM_CPPFLAGS])
> - AC_SUBST([AM_CFLAGS])
> diff --git a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> new file mode 100644
> index 000000000..5e614f1fc
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
> diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
> index 181d7ae43..0bb0699a1 100644
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
> --
> 2.29.2
>
>
> 
>
