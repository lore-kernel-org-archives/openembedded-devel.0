Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id CDD8F79C9D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:42:36 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a132so6433002qkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 20:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=37Yn2H4kKcIZH2vyyaq1l0U5FMV62M9WSGWrw/59WpQ=;
	b=qDZoLC86KwDost5c0j685ieAm9lKhtBAXpU7DyUfT95iw06I4MZI/nLCiVxjLgHSJ8
	N03b6NBHM3kwRONmrMSIGSvmaHjcC5Kdgr7iBOsraUw+BA+5wWz1wxqWB3zfBqlr9lNr
	OZCFLGMW9lrILxNFTy4aE+5+FoprI/JcH+elCuuMWaBDgdUbLKvx+sCJu6OKpe5SY9HH
	fYs0OM7Xl39dUTLZtyU/XOnzct4rQ+GRmmOkW3AXphu82LUARbwzOef/c3w/Sa30fD31
	7h9z6Qh99l0hFuH+VlFLPrUgUE/TUaNa8QATOVuXPIfEL8Pl6ojld6L4gMaWRj63BPB3
	FsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=37Yn2H4kKcIZH2vyyaq1l0U5FMV62M9WSGWrw/59WpQ=;
	b=Bqb6DXSDLwRRTOXfL5B/vh7h1QLG5Fpuod2txTmtkE7LXEUvqeDV9Nd+cMVbDu5qp6
	qIvTq7a5DK6dWhr9EdR7LsEV9mCJZTbG0FK9+Z8i9MLsSEueqpMzTrhY8LCy77DpESBr
	Gxasc/sVbRKk6VZfN0wg9gKjjmkGdAPXEZ8FfWVvLYzvD9SPLuYQSV6zQ77jx/dSIYBf
	b5RpAL5dtPr0lEHQKZuhwhC2Dpr54ihFhSJ69hP+XeNbJGWWlNDIh96WXHxJcMvpyimH
	zZdN+r5l9a49kjt3/q8v7enB2+4e6Y0OG6aMWe/GB0I88651kqpQoXUgHO9/WkrGN3Kw
	WlPw==
X-Gm-Message-State: AGRZ1gKA61bh+O/u8W79R5DusfywD/XsXUkSi0qbRwVhFnrhK2PIyTLZ
	hiEz/TxNsNyfR1CwGdYTP5Nl1SV5HLvBITw1ev8aaA==
X-Google-Smtp-Source: AJdET5deeiBox4/sj69TYfwiVVAPPsotu4FLTF5WhvqzTGlY2H5FslCTles869Xy51tgz6jbQL2yRGm9SYOEfGSxjyk=
X-Received: by 2002:a37:a84b:: with SMTP id r72mr15010338qke.2.1540870957605; 
	Mon, 29 Oct 2018 20:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<96e86320d4d21de21552cf98eb6145a114fcd69f.1540830650.git.brendank310@gmail.com>
In-Reply-To: <96e86320d4d21de21552cf98eb6145a114fcd69f.1540830650.git.brendank310@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 19:47:50 -0700
Message-ID: <CAMKF1sq1rrU35w6eVTER88mnu+iEu=O=fb+cHoTR28D+OiqiRA@mail.gmail.com>
To: brendank310 <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: schnitzeltony@googlemail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 12/16] mutter: add recipe for mutter window manager
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
X-List-Received-Date: Tue, 30 Oct 2018 03:42:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 9:43 AM brendank310 <brendank310@gmail.com> wrote:

> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../mutter/0001-disable-zenity-check.patch    | 27 ++++++++
>  ...spection-variables-with-correct-path.patch | 63 +++++++++++++++++++
>  .../0003-packageconfig-variable-fixup.patch   | 29 +++++++++
>  .../mutter/0004-fix-broken-includes.patch     | 37 +++++++++++
>  meta-gnome/recipes-gnome/gnome3/mutter_git.bb | 59 +++++++++++++++++
>  5 files changed, 215 insertions(+)
>  create mode 100644
> meta-gnome/recipes-gnome/gnome3/mutter/0001-disable-zenity-check.patch
>  create mode 100644
> meta-gnome/recipes-gnome/gnome3/mutter/0002-fixup-introspection-variables-with-correct-path.patch
>  create mode 100644
> meta-gnome/recipes-gnome/gnome3/mutter/0003-packageconfig-variable-fixup.patch
>  create mode 100644
> meta-gnome/recipes-gnome/gnome3/mutter/0004-fix-broken-includes.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter_git.bb
>
> diff --git
> a/meta-gnome/recipes-gnome/gnome3/mutter/0001-disable-zenity-check.patch
> b/meta-gnome/recipes-gnome/gnome3/mutter/0001-disable-zenity-check.patch
> new file mode 100644
> index 000000000..a37aec276
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome3/mutter/0001-disable-zenity-check.patch
> @@ -0,0 +1,27 @@
> +mutter: Disable check for zenity
> +
> +  Disable autoconf check for zenity, no need graphical dialog boxes.
> +
> +  Upstream-status: Inappropriate [disable-feature]
> +
> +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
> +diff --git a/configure.ac b/configure.ac
> +index ef92f5ecb..5eede9e63 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -427,11 +427,6 @@ fi
> +
> + AM_CONDITIONAL(HAVE_SM, test "$found_sm" = "yes")
> +
> +-AC_PATH_PROG(ZENITY, zenity, no)
> +-if test x"$ZENITY" = xno; then
> +-  AC_MSG_ERROR([zenity not found in your path - needed for dialogs])
> +-fi
> +-
> + AC_ARG_ENABLE(debug,
> +       [  --enable-debug               enable debugging],,
> +       enable_debug=no)
> +--
> +2.17.1
> +
> diff --git
> a/meta-gnome/recipes-gnome/gnome3/mutter/0002-fixup-introspection-variables-with-correct-path.patch
> b/meta-gnome/recipes-gnome/gnome3/mutter/0002-fixup-introspection-variables-with-correct-path.patch
> new file mode 100644
> index 000000000..07c1f371a
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome3/mutter/0002-fixup-introspection-variables-with-correct-path.patch
> @@ -0,0 +1,63 @@
> +mutter: Fixup introspection paths
> +
> +  Fixup the introspection paths to enable correct results with
> +  gobject-introspection.
> +
> +  Upstream-status: Innappropriate [embedded specific]
> +
> +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
> +diff --git a/clutter/build/autotools/introspection.m4
> b/clutter/build/autotools/introspection.m4
> +index d89c3d907..d2c60de4d 100644
> +--- a/clutter/build/autotools/introspection.m4
> ++++ b/clutter/build/autotools/introspection.m4
> +@@ -56,14 +56,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
> +     INTROSPECTION_GIRDIR=
> +     INTROSPECTION_TYPELIBDIR=
> +     if test "x$found_introspection" = "xyes"; then
> +-       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner
> gobject-introspection-1.0`
> +-       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler
> gobject-introspection-1.0`
> +-       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate
> gobject-introspection-1.0`
> +-       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir
> gobject-introspection-1.0`
> +-       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir
> gobject-introspection-1.0)"
> ++       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=g_ir_scanner gobject-introspection-1.0`
> ++       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=g_ir_compiler gobject-introspection-1.0`
> ++       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=g_ir_generate gobject-introspection-1.0`
> ++       INTROSPECTION_GIRDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=girdir gobject-introspection-1.0`
> ++       INTROSPECTION_TYPELIBDIR=$PKG_CONFIG_SYSROOT_DIR"$($PKG_CONFIG
> --variable=typelibdir gobject-introspection-1.0)"
> +        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags
> gobject-introspection-1.0`
> +        INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
> +-       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir
> gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
> ++       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=datadir
> gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
> +     fi
> +     AC_SUBST(INTROSPECTION_SCANNER)
> +     AC_SUBST(INTROSPECTION_COMPILER)
> +diff --git a/cogl/build/autotools/introspection.m4
> b/cogl/build/autotools/introspection.m4
> +index 589721c5a..683ebdcc6 100644
> +--- a/cogl/build/autotools/introspection.m4
> ++++ b/cogl/build/autotools/introspection.m4
> +@@ -54,14 +54,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
> +     INTROSPECTION_GIRDIR=
> +     INTROSPECTION_TYPELIBDIR=
> +     if test "x$found_introspection" = "xyes"; then
> +-       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner
> gobject-introspection-1.0`
> +-       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler
> gobject-introspection-1.0`
> +-       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate
> gobject-introspection-1.0`
> +-       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir
> gobject-introspection-1.0`
> +-       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir
> gobject-introspection-1.0)"
> ++       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=g_ir_scanner gobject-introspection-1.0`
> ++       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=g_ir_compiler gobject-introspection-1.0`
> ++       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=g_ir_generate gobject-introspection-1.0`
> ++       INTROSPECTION_GIRDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=girdir gobject-introspection-1.0`
> ++       INTROSPECTION_TYPELIBDIR=$PKG_CONFIG_SYSROOT_DIR"$($PKG_CONFIG
> --variable=typelibdir gobject-introspection-1.0)"
> +        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags
> gobject-introspection-1.0`
> +-       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
> +-       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir
> gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
> ++       INTROSPECTION_LIBS=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --libs
> gobject-introspection-1.0`
> ++       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=datadir
> gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
> +     fi
> +     AC_SUBST(INTROSPECTION_SCANNER)
> +     AC_SUBST(INTROSPECTION_COMPILER)
> +--
> +2.17.1
> +
> diff --git
> a/meta-gnome/recipes-gnome/gnome3/mutter/0003-packageconfig-variable-fixup.patch
> b/meta-gnome/recipes-gnome/gnome3/mutter/0003-packageconfig-variable-fixup.patch
> new file mode 100644
> index 000000000..1e44218a6
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome3/mutter/0003-packageconfig-variable-fixup.patch
> @@ -0,0 +1,29 @@
> +mutter: Fixup pkgconfig variables
> +
> +  Pkgconfig variables relating to the paths of datadirs, and
> +  gir, typelib.
> +
> +  Upstream-status: Innappropriate [embedded-specific]
> +
> +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
> +diff --git a/src/libmutter.pc.in b/src/libmutter.pc.in
> +index d2e837f4a..0c8db1a66 100644
> +--- a/src/libmutter.pc.in
> ++++ b/src/libmutter.pc.in
> +@@ -2,8 +2,10 @@ prefix=@prefix@
> + exec_prefix=@exec_prefix@
> + libdir=@libdir@
> + includedir=@includedir@
> +-girdir=@libdir@/mutter
> +-typelibdir=@libdir@/mutter
> ++datarootdir=${prefix}/share
> ++datadir=${datarootdir}
> ++girdir=${datadir}/gir-1.0
> ++typelibdir=${libdir}/mutter
> + apiversion=@LIBMUTTER_API_VERSION@
> +
> + Name: libmutter
> +--
> +2.17.1
> +
> diff --git
> a/meta-gnome/recipes-gnome/gnome3/mutter/0004-fix-broken-includes.patch
> b/meta-gnome/recipes-gnome/gnome3/mutter/0004-fix-broken-includes.patch
> new file mode 100644
> index 000000000..2a7580653
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/mutter/0004-fix-broken-includes.patch
> @@ -0,0 +1,37 @@
> +mutter: Fix broken includes for xcursor
> +
> +  Add missing include for the xcursor header to required
> +  files.
> +
> +  Upstream-status: Pending
> +
> +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
> +diff --git a/src/core/display.c b/src/core/display.c
> +index f6b4d5b9f..3930f1c32 100644
> +--- a/src/core/display.c
> ++++ b/src/core/display.c
> +@@ -54,6 +54,7 @@
> + #include <meta/meta-backend.h>
> + #include "backends/meta-cursor-sprite-xcursor.h"
> + #include "backends/meta-logical-monitor.h"
> ++#include "backends/meta-cursor-sprite-xcursor.h"
> + #include "backends/native/meta-backend-native.h"
> + #include "backends/x11/meta-backend-x11.h"
> + #include "backends/meta-stage-private.h"
> +diff --git a/src/x11/meta-x11-display.c b/src/x11/meta-x11-display.c
> +index 83f7dfbae..36ea95b91 100644
> +--- a/src/x11/meta-x11-display.c
> ++++ b/src/x11/meta-x11-display.c
> +@@ -55,6 +55,8 @@
> + #include "backends/meta-logical-monitor.h"
> + #include "backends/meta-settings-private.h"
> + #include "backends/x11/meta-backend-x11.h"
> ++#include "backends/meta-cursor-sprite-xcursor.h"
> ++
> + #include "core/frame.h"
> + #include "core/meta-workspace-manager-private.h"
> + #include "core/util-private.h"
> +--
> +2.17.1
> +
> diff --git a/meta-gnome/recipes-gnome/gnome3/mutter_git.bb
> b/meta-gnome/recipes-gnome/gnome3/mutter_git.bb
> new file mode 100644
> index 000000000..b2065f224
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/mutter_git.bb
> @@ -0,0 +1,59 @@
> +DESCRIPTION = "Mutter (Gnome 3 window manager)"
> +LICENSE = "GPLv2"
> +DEPENDS = " \
> +           glib-2.0 \
> +           gsettings-desktop-schemas \
> +           wayland-native \
> +           wayland-protocols \


Same as last comment we need to use distro feature to include it

>
> +           libxinerama \
> +           libinput \
> +           gtk+3 \
> +           gnome-desktop3 \
> +           libxcursor \
> +           libxkbfile \
> +           cogl-1.0 \
> +           clutter-1.0 \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = " \
> +           git://
> gitlab.gnome.org/GNOME/mutter.git;protocol=http;branch=master \
> +           file://0001-disable-zenity-check.patch \
> +
>  file://0002-fixup-introspection-variables-with-correct-path.patch \
> +           file://0003-packageconfig-variable-fixup.patch \
> +           file://0004-fix-broken-includes.patch \
> +          "
> +
> +SRCREV="${AUTOREV}"
>

We need to use a hard coded locked down Sha value here for consistency
across builds

+S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig distro_features_check gobject-introspection
> gettext
> +
> +FILES_${PN} += "${datadir}"
> +
> +do_configure_prepend() {
> +       # Autotools expects config.rpath to be with in the source tree
> +       install -d ${S}/build-aux
> +       cp ${STAGING_DIR_NATIVE}${datadir}/gettext/config.rpath
> ${S}/build-aux/config.rpath
> +
> +        # There are several Werrors that trip when building with Wayland
> enabled:
> +       # -Wno-error=implicit-function-declaration
> -Wno-error=nested-externs -Wno-error=int-conversion
> +       # and setting those as no-error does not seem to get picked up (it
> does appear in the compilation
> +       # command
> +       sed -i 's^-Werror
> -Wno-error=deprecated-declarations^-Wno-error=deprecated-declarations^g'
> ${S}/configure.ac
> +}
> +
> +do_compile_prepend() {
> +       export
> GIR_EXTRA_LIBS_PATH="${B}/cogl/cogl/.libs:${B}/cogl/cogl-pango/.libs:${B}/cogl/cogl-path/.libs:${B}/clutter/clutter/.libs"
> +}
> +
> +do_install_append() {
> +       install -d ${D}/${datadir}/gir-1.0
> +       install ${B}/src/Meta-3.gir ${D}/${datadir}/gir-1.0
> +       install ${B}/cogl/cogl/Cogl-3.gir ${D}/${datadir}/gir-1.0
> +       install ${B}/cogl/cogl-pango/CoglPango-3.gir
> ${D}/${datadir}/gir-1.0
> +       install ${B}/clutter/clutter/Cally-3.gir ${D}/${datadir}/gir-1.0
> +       install ${B}/clutter/clutter/ClutterX11-3.gir
> ${D}/${datadir}/gir-1.0
> +       install ${B}/clutter/clutter/Clutter-3.gir ${D}/${datadir}/gir-1.0
> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

