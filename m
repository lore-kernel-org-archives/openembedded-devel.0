Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 898F46C230
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 14:39:26 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d23so59918639qto.2
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rpHYivz/CmDJj9nW+yg8Ii3ln959pH2LyU/4DvWl/YA=;
	b=QuGSLNBNbzOLgEsXnJ7zs0BBmSwukAXh/0pbG+K+0UtPwyUnXoGSQkT2dpPL6Qy0m4
	ssLiW5M9mHn6Vc753guJ3+g4HjPNqGGTKmrfnfXwf3vUJqHeUjqK8Oz4kzmfUKpfnWft
	ysGzywXkkFdwknR2JZ7JZSDeQ+nFfYe6nT8GhSHCtU8uzqRJANJ9C2bWOe1f7yNS1tx0
	SzYOt9Muj/6ktjWeg1HPkHGzDwr9OXU/5wevwe0pBORLqzqOSXYPdOOA7+pTFyV5IVyv
	0y5RTA3RP2L/gp5YwXOGf9xhTmRqfK4YpP/Kg+Hh7DvwT4VAx0iNzBgsC6m3qXQfZ/wk
	KmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rpHYivz/CmDJj9nW+yg8Ii3ln959pH2LyU/4DvWl/YA=;
	b=Y89peOCc+OjcZS9VaDJXGYBk7B1SKk/u6KG1jqC/9XVY59ClGwJh5FFDFgPysUvjSw
	socSCEHyI1Gzkzb5UKQQZjY0j2SsqXxCEwrCh6pJVKX+2To4G1XqOGFDJfqQOh3kigMZ
	nwDQCQs8VIUEdZmkIYF/SQOpf9e1Y9/JqMZy5PsGKfDc01QBckFk/cMPDU3bo4N84qnF
	H6+JPu3tfdkW+54oei3ypNsJhdkvGwpJhxL2is/A1/DA7FGW5A2KVDbFKKNa+iBCMv7L
	Gm73KnaWIYXMi+2bBE0IdpB9kMyYxNQDHGFxp5UcSckVmgVaf0Ba6J5JcY4Me9wjD5nz
	AgdQ==
X-Gm-Message-State: APjAAAV1QddGnQ/ezZuK2J33uNY4epNS5/t1rG0+j6fPgu1JjsYnFiib
	N8/pltbm8Ny6c1WDBYDQrZ5bVOCJFpEiWtyfG2g=
X-Google-Smtp-Source: APXvYqznmq9khUZMNbYohZa/a/AVEQA5TE9qz5ggkiYrKPJY0F09LBEevulJJU1hkB6EQF402gpxscFnHhuHi2TeMoU=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr81102154qvg.181.1564411167155;
	Mon, 29 Jul 2019 07:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190729041128.2874-1-naveen.kumar.saini@intel.com>
	<CAMKF1sqYr+Kni1_YyLNPnNgZvpqtx0VOWW6PUi0duyC-yoiEpg@mail.gmail.com>
In-Reply-To: <CAMKF1sqYr+Kni1_YyLNPnNgZvpqtx0VOWW6PUi0duyC-yoiEpg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jul 2019 07:39:10 -0700
Message-ID: <CAMKF1sp7KKLoc5zd7O9cWVTdWPYxrXycWbh5Baa2PAzBMuGC-Q@mail.gmail.com>
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] icewm: add recipe
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
X-List-Received-Date: Mon, 29 Jul 2019 14:39:26 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build with aarch64/musl see

https://errors.yoctoproject.org/Errors/Details/255459/

On Mon, Jul 29, 2019 at 7:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Jul 28, 2019 at 9:09 PM Naveen Saini
> <naveen.kumar.saini@intel.com> wrote:
> >
> > From: "Yong, Jonathan" <jonathan.yong@intel.com>
> >
> > IceWM is a window manager for the X Window System.
> >
> > The goal of IceWM is to provide speed and simplicity.
> >
> > It comes with a taskbar with pager, global and per-window
> > keybindings and a dynamic menu system.
> >
> > Website:
> > https://ice-wm.org/
> >
> > Manual:
> > https://ice-wm.org/manual/
> >
> > Themes Howto
> > https://ice-wm.org/themes/
> >
> > Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> > Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> >
> > Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > ---
> >  ...p-running-test-program-when-cross-co.patch | 39 ++++++++++++++++++
> >  meta-oe/recipes-extended/icewm/icewm_1.5.5.bb | 40 +++++++++++++++++++
> >  2 files changed, 79 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
> >  create mode 100644 meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
> >
> > diff --git a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
> > new file mode 100644
> > index 000000000..98fd78c5c
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
> > @@ -0,0 +1,39 @@
> > +From 84620376d568c2c5e3ebd4f33de9793c68a36463 Mon Sep 17 00:00:00 2001
> > +From: Naveen Saini <naveen.kumar.saini@intel.com>
> > +Date: Mon, 22 Jul 2019 16:17:19 +0800
> > +Subject: [PATCH] configure.ac: skip running test program when cross-compiling
> > +
> > +Modified patch from Yong, Jonathan.
> > +
> > +Upstream-Status: Inappropriate [OE-Specific]
> > +
> > +Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> > +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > +---
> > + configure.ac | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index c5e3ca03..61d2d5a0 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -139,6 +139,7 @@ AC_CHECK_FUNCS([sysctl sysctlbyname sysinfo uname wordexp])
> > + AC_CHECK_FUNC([getloadavg],[AC_DEFINE([HAVE_GETLOADAVG2], 1, [getloadavg() is available])])
> > + AC_FUNC_SELECT_ARGTYPES
> > +
> > ++if test "$cross_compiling" = no ; then
> > + AC_MSG_CHECKING([for strlcpy])
> > + AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
> > +                char a[2];
> > +@@ -170,7 +171,7 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
> > +                AH_TEMPLATE([HAVE_STRLCAT],
> > +                            [Define to 1 if you have the strlcat function.])
> > +               ])
> > +-
> > ++fi
> > +
> > + PKG_CHECK_MODULES([CORE],[fontconfig xext x11])
> > + AC_SUBST([CORE_CFLAGS])
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb b/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
> > new file mode 100644
> > index 000000000..db81021d0
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
> > @@ -0,0 +1,40 @@
> > +DESCRIPTION = "Ice Window Manager (IceWM)"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
> > +
> > +SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
> > +           file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
> > +           "
> > +SRC_URI[md5sum] = "6eba94a7935a0531d2c14eeb1426aeef"
> > +SRC_URI[sha256sum] = "f1c1344b20a9e8635143f70ee27930b55f813c15ca61f84d77584d311b6ac027"
> > +
> > +inherit autotools pkgconfig gettext perlnative distro_features_check qemu
> > +REQUIRED_DISTRO_FEATURES = "x11"
> > +
> > +EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
> > +                --with-cfgdir=${sysconfdir}/icewm \
> > +                --with-docdir=${docdir}/icewm \
> > +                --enable-fribidi \
>
> libfribidi is not in rdeps, so I wonder if this will fail during runtime.
>
> > +                --enable-xinerama \
> > +                --enable-shape"
> > +
> > +DEPENDS = "asciidoc-native gdk-pixbuf libxft libxpm libxrandr libxinerama"
> > +DEPENDS_append = " qemu-native"
> > +RDEPENDS_${PN} = "perl"
> > +
> > +do_compile_prepend_class-target() {
> > +
> > +    cd ${B}
> > +    oe_runmake -C src genpref
> > +
> > +    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}',['$PWD/src/.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
>
> using PWD is not advised, probably you can construct it by using S or B
>
> > +    cat >qemuwrapper <<EOF
> > +#!/bin/sh
> > +${qemu_binary} src/genpref "\$@"
> > +EOF
> > +    chmod +x qemuwrapper
> > +    ./qemuwrapper > src/preferences
> > +}
> > +
> > +
> > +FILES_${PN} += "${datadir}/xsessions"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

