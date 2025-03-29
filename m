Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C30C28B20
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 01:18:32 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.3088.1743211106904189989
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 18:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id 24E98571;
	Sat, 29 Mar 2025 02:18:25 +0100 (CET)
Received: from [192.168.178.20] ([84.154.160.140]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tyKq8-0Tysc40; Sat, 29 Mar 2025 02:18:24 +0100
Date: Sat, 29 Mar 2025 02:19:02 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv8] gimp: update 2.10.38 - 3.0.2
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Message-Id: <QB2VTS.JOWELJKU4VU32@t-online.de>
In-Reply-To: <18312139CF3E0A11.1841@lists.openembedded.org>
References: <18312139CF3E0A11.1841@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dXIMRWJlP+7TdI5TkSPM"
X-TOI-EXPURGATEID: 150726::1743211104-F2FFA910-53AB78FF/10/3626336762 SUSPECT URL
X-TOI-MSGID: 7c22aab0-20be-40ee-a1ae-d2ba64201f29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 01:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116361

--=-dXIMRWJlP+7TdI5TkSPM
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

v8: update patch-status

On Sa, M=C3=A4r 29 2025 at 02:18:14 +01:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> At long last, the first release of GIMP 3.0 is here! This is the end=20
> result of seven years of hard work
> by volunteer developers, designers, artists, and community members=20
> (for reference, GIMP 2.10
> was first published in 2018 and the initial development version of=20
> GIMP 3.0 was released in 2020).
> With GIMP 3.0 you can do more than ever before, more easily, more=20
> quickly!
>=20
> Highlights
>=20
> - Need to tweak a filter you applied hours ago? New in GIMP 3.0 is=20
> non-destructive editing for most commonly-used filters. See the=20
> changes in real time with on-canvas preview.
> - Exchange files with more applications, including BC7 DDS files as=20
> well as better PSD export and many new formats.
> - Don=E2=80=99t know how big to make your drawing? Simply set your paint=20
> tool to expand layers automatically as needed.
> - Making pro-quality text got easier, too. Style your text, apply=20
> outlines, shadows, bevels, and more, and you can still edit your=20
> text, change font and size, and even tweak the style settings.
> - Organizing your layers has become much easier with the ability to=20
> select multiple items at once, move them or transform them all=20
> together!
> - Color Management was again improved, as our long-term project to=20
> make GIMP an advanced image editor for all usages.
> - Updated graphical toolkit (GTK3) for modern desktop usage.
> - New Wilber logo!
>=20
> <https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_type=3Dta=
gs>
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
> ---
>  ...irst-line-of-compiler-version-string.patch |  30 ----
>  ...f-load-fix-mismatching-variable-type.patch |  24 ----
>  .../0001-gimp-cross-compile-fix-for-bz2.patch |  30 ++++
>  ...1-gimptool-allow-default-CC-override.patch |  85 -----------
>  ...dd-build-time-library-paths-to-LD_LI.patch |  34 -----
>  .../0001-meson.build-dont-check-for-lgi.patch |  35 +++++
>  ...meson.build-require-iso-codes-native.patch |  35 +++++
>  ...001-metadata-shut-up-a-weird-warning.patch |  22 ---
>  ...0002-meson.build-reproducibility-fix.patch |  56 ++++++++
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  | 101 --------------
>  meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb    | 132=20
> ++++++++++++++++++
>  11 files changed, 288 insertions(+), 296 deletions(-)
>  delete mode 100644=20
> meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compi=
ler-version-string.patch
>  delete mode 100644=20
> meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-var=
iable-type.patch
>  create mode 100644=20
> meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.pat=
ch
>  delete mode 100644=20
> meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override=
.patch
>  delete mode 100644=20
> meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-libr=
ary-paths-to-LD_LI.patch
>  create mode 100644=20
> meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-check-for-lgi.pat=
ch
>  create mode 100644=20
> meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-iso-codes-nati=
ve.patch
>  delete mode 100644=20
> meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.p=
atch
>  create mode 100644=20
> meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.pa=
tch
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
>=20
> diff --git=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-com=
piler-version-string.patch=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-com=
piler-version-string.patch
> deleted file mode 100644
> index 618b4cc7a7..0000000000
> ---=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-com=
piler-version-string.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 5711ccfab40e304ced7f5be39a4083e3fcecff91 Mon Sep 17 00:00:00=20
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Wed, 24 May 2023 22:22:41 -0700
> -Subject: [PATCH] configure: Keep first line of compiler version=20
> string
> -
> -Full output of cc -v may contain additional information which could
> -contain build path information, which is unnessasary
> -
> -Upstream-Status: Submitted=20
> [<https://gitlab.gnome.org/GNOME/gimp/-/merge_requests/926>]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index c25415d..68707a0 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -599,7 +599,7 @@ fi
> - for CC_VERSION_OPT in $CC_VERSION_OPTS; do
> -   # We run $CC, and escape and format its output, in a single step,
> -   # since some shells expand escape sequences in "echo" arguments.
> --  CC_VERSION=3D"`$CC $CC_VERSION_OPT 2>&1 | sed -e=20
> 's/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
> -+  CC_VERSION=3D"`$CC $CC_VERSION_OPT 2>&1 | head -1 | sed -e=20
> 's/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
> -   if test $? -eq 0; then
> -     break
> -   fi
> ---
> -2.40.1
> -
> diff --git=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-v=
ariable-type.patch=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-v=
ariable-type.patch
> deleted file mode 100644
> index 13b3dda144..0000000000
> ---=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-v=
ariable-type.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From a2458f1528e5733574bb26ff5452b1329116e6db Mon Sep 17 00:00:00=20
> 2001
> -From: Simon Budig <simon@budig.de <mailto:simon@budig.de>>
> -Date: Sat, 20 May 2023 18:40:41 +0200
> -Subject: [PATCH] file-tiff-load: fix mismatching variable type
> -
> -Upstream-Status: Backport=20
> [<https://gitlab.gnome.org/GNOME/gimp/-/commit/a2458f1528e5733574bb26ff54=
52b1329116e6db>]
> -Signed-off-by: Khem Raj <raj.khem@gmai.com=20
> <mailto:raj.khem@gmai.com>>
> ----
> - plug-ins/file-tiff/file-tiff-load.c | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> ---- a/plug-ins/file-tiff/file-tiff-load.c
> -+++ b/plug-ins/file-tiff/file-tiff-load.c
> -@@ -1301,8 +1301,8 @@ load_image (GFile        *file,
> -
> -       /* any resolution info in the file? */
> -       {
> --        gfloat   xres =3D 72.0;
> --        gfloat   yres =3D 72.0;
> -+        gdouble   xres =3D 72.0;
> -+        gdouble   yres =3D 72.0;
> -         gushort  read_unit;
> -         GimpUnit unit =3D GIMP_UNIT_PIXEL; /* invalid unit */
> -
> diff --git=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.p=
atch=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.p=
atch
> new file mode 100644
> index 0000000000..721225c8b3
> --- /dev/null
> +++=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.p=
atch
> @@ -0,0 +1,30 @@
> +From a7e40e19d17404cf5ec4135fc1becd5a90f5e1e1 Mon Sep 17 00:00:00=20
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Wed, 25 Dec 2024 07:27:04 +0100
> +Subject: [PATCH] gimp: cross-compile fix for bz2
> +
> +autotools bzip2 build does not create pkgconfig files so looking for=20
> the dependency fails.
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> +
> +Upstream-Status: Inappropriate [can probably be removed once bzip2=20
> is built with meson or cmake]
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 4e48f8c64c..d5dce47015 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -765,7 +765,7 @@ zlib =3D dependency('zlib')
> + MIMEtypes +=3D 'image/x-psp'
> +
> + # Compiler-provided headers can't be found in crossroads environment
> +-if not meson.is_cross_build()
> ++if true
> +   bz2 =3D cc.find_library('bz2')
> + else
> +   bz2 =3D dependency('bzip2')
> +--
> +2.47.1
> +
> diff --git=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-overri=
de.patch=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-overri=
de.patch
> deleted file mode 100644
> index b04a16cec7..0000000000
> ---=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-overri=
de.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -From 7e5b986cb7797a6535fe2471b9a5fb7c00821f51 Mon Sep 17 00:00:00=20
> 2001
> -From: Yoann Congal <yoann.congal@smile.fr=20
> <mailto:yoann.congal@smile.fr>>
> -Date: Sun, 13 Oct 2024 01:00:10 +0200
> -Subject: [PATCH] gimptool: allow default CC override
> -
> -From: Yoann Congal <yoann.congal@smile.fr=20
> <mailto:yoann.congal@smile.fr>>
> -
> -In OE, CC contains sysroot path. Storing CC in binary then leads to
> -non-reproducibility.
> -
> -This commit add a new configure option "--with-default-cc=3D'cmd'" for
> -force the CC stored in gimptool to a reproducible value.
> -
> -Upstream-Status: Inappropriate [does not apply on master (upstream=20
> has moved to meson)]
> -Signed-off-by: Yoann Congal <yoann.congal@smile.fr=20
> <mailto:yoann.congal@smile.fr>>
> ----
> - app-tools/Makefile.am |  2 +-
> - configure.ac          | 13 +++++++++++++
> - tools/Makefile.am     |  2 +-
> - tools/gimptool.c      |  2 +-
> - 4 files changed, 16 insertions(+), 3 deletions(-)
> -
> -diff --git a/app-tools/Makefile.am b/app-tools/Makefile.am
> -index a7cd4ce..81a3a00 100644
> ---- a/app-tools/Makefile.am
> -+++ b/app-tools/Makefile.am
> -@@ -67,7 +67,7 @@ AM_CPPFLAGS =3D \
> - 	-DMANDIR=3D\""$(mandir)"\"				\
> - 	-DGIMPPLUGINDIR=3D\""$(gimpplugindir)"\"			\
> - 	-DGIMPDATADIR=3D\""$(gimpdatadir)"\"			\
> --	-DCC=3D\""$(CC)"\"					\
> -+	-DDEFAULT_CC=3D\""@DEFAULT_CC@"\"				\
> - 	-DGIMPDIR=3D\""$(gimpdir)"\"				\
> - 	-DGIMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\"	\
> - 	-I$(top_srcdir)						\
> -diff --git a/configure.ac b/configure.ac
> -index a88b7cc..d90b6db 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -2457,6 +2457,19 @@ fi
> - AM_CONDITIONAL(DESKTOP_DATADIR, test "x$with_desktop_dir" !=3D xno)
> - AC_SUBST(DESKTOP_DATADIR)
> -
> -+######################
> -+# Determine default CC
> -+######################
> -+
> -+AC_ARG_WITH(default-cc, [ --with-default-cc=3D"cmd" default CC to=20
> print in gimptool (default=3DCC)])
> -+
> -+if test "x$with_default_cc" !=3D x; then
> -+  DEFAULT_CC=3D$with_default_cc
> -+else
> -+  DEFAULT_CC=3DCC
> -+fi
> -+
> -+AC_SUBST(DEFAULT_CC)
> -
> - #####################
> - # Check for XML tools
> -diff --git a/tools/Makefile.am b/tools/Makefile.am
> -index 420b9b1..ccabde8 100644
> ---- a/tools/Makefile.am
> -+++ b/tools/Makefile.am
> -@@ -87,7 +87,7 @@ AM_CPPFLAGS =3D \
> - 	-DMANDIR=3D\""$(mandir)"\"				\
> - 	-DGIMPPLUGINDIR=3D\""$(gimpplugindir)"\"			\
> - 	-DGIMPDATADIR=3D\""$(gimpdatadir)"\"			\
> --	-DCC=3D\""$(CC)"\"					\
> -+	-DDEFAULT_CC=3D\""@DEFAULT_CC@"\"				\
> - 	-DGIMPDIR=3D\""$(gimpdir)"\"				\
> - 	-DGIMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\"	\
> - 	-I$(top_srcdir)						\
> -diff --git a/tools/gimptool.c b/tools/gimptool.c
> -index 21fc043..bbf3fa5 100644
> ---- a/tools/gimptool.c
> -+++ b/tools/gimptool.c
> -@@ -280,7 +280,7 @@ find_out_env_flags (void)
> -   else if (msvc_syntax)
> -     env_cc =3D "cl -MD";
> -   else
> --    env_cc =3D CC;
> -+    env_cc =3D DEFAULT_CC;
> -
> -   if (g_ascii_strncasecmp (env_cc, "cl", 2)    =3D=3D 0 &&
> -       g_ascii_strncasecmp (env_cc, "clang", 5) !=3D 0)
> diff --git=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-li=
brary-paths-to-LD_LI.patch=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-li=
brary-paths-to-LD_LI.patch
> deleted file mode 100644
> index cec0055284..0000000000
> ---=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-li=
brary-paths-to-LD_LI.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From c720df90dfe3a3e92e34bfb36a04cc792064a501 Mon Sep 17 00:00:00=20
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Wed, 24 May 2023 22:39:02 -0700
> -Subject: [PATCH] libtool: Do not add build time library paths to
> - LD_LIBRARY_PATH
> -
> -This does not serve much purpose on cross builds as it will add build
> -time paths which are only useful when trying to run these tools from
> -build area but when they are cross built this is not possible to run
> -them like this.
> -
> -Upstream-Status: Inappropriate [Cross-compile specific]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
> ----
> - ltmain.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/ltmain.sh b/ltmain.sh
> -index 134902c..068d74a 100644
> ---- a/ltmain.sh
> -+++ b/ltmain.sh
> -@@ -5748,7 +5748,7 @@ func_exec_program ()
> - 	if test yes =3D "$shlibpath_overrides_runpath" && test -n=20
> "$shlibpath_var" && test -n "$temp_rpath"; then
> - 	  $ECHO "\
> -     # Add our own library path to $shlibpath_var
> --    $shlibpath_var=3D\"$temp_rpath\$$shlibpath_var\"
> -+    $shlibpath_var=3D\"$shlibpath_var\"
> -
> -     # Some systems cannot cope with colon-terminated $shlibpath_var
> -     # The second colon is a workaround for a bug in BeOS R4 sed
> ---
> -2.40.1
> -
> diff --git=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-check-for-lgi.p=
atch=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-check-for-lgi.p=
atch
> new file mode 100644
> index 0000000000..63a9159a43
> --- /dev/null
> +++=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-check-for-lgi.p=
atch
> @@ -0,0 +1,35 @@
> +From e56a6330f1e29e489601ea3e7cb31bfd2ebb787a Mon Sep 17 00:00:00=20
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Thu, 27 Mar 2025 21:02:22 +0100
> +Subject: [PATCH] meson.build: dont check for lgi
> +
> +Checking if host can run lgi is pointless for cross-compile
> +Set to be always true because we ensure to install lgi via=20
> PACKAGECONFIG
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + meson.build | 6 +-----
> + 1 file changed, 1 insertion(+), 5 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index c91e8fc97d..efbc2d8175 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1235,11 +1235,7 @@ if have_lua
> +       endif
> +
> +       if is_supported_lua
> +-        have_lua_lgi =3D run_command(lua, '-e',
> +-                                   '''
> +-                                   local lgi =3D require 'lgi'
> +-                                   ''',
> +-                                   check: false).returncode() =3D=3D 0
> ++        have_lua_lgi =3D true
> +       endif
> +
> +       if have_lua_lgi
> +--
> +2.49.0
> +
> diff --git=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-iso-codes-na=
tive.patch=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-iso-codes-na=
tive.patch
> new file mode 100644
> index 0000000000..ffb8ef29df
> --- /dev/null
> +++=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-iso-codes-na=
tive.patch
> @@ -0,0 +1,35 @@
> +From 8ccd12d6ec3330e9646ae9db6fd491226d516dc3 Mon Sep 17 00:00:00=20
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Fri, 28 Mar 2025 01:33:00 +0100
> +Subject: [PATCH] meson.build: require iso-codes-native
> +
> +This fixes:
> +FAILED: app/widgets/gimplanguagestore-data.h
> +/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/gimp/3.0.2/buil=
d/tools/gen-languages
> +gimp_language_store_parser_init: 0.006277 seconds
> +ERROR: parse_iso_codes: error parsing=20
> '/usr/share/xml/iso-codes/iso_639_3.xml': No such file or directory
> +
> +Upstream-Status: Denied=20
> [<https://gitlab.gnome.org/GNOME/gimp/-/merge_requests/2185>]
> +Upstream argues that iso-codes locale (.mo files) are required on=20
> the target
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index efbc2d8175..fd050f4d3c 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1135,7 +1135,7 @@ endif
> +=20
> #########################################################################=
#######
> + # ISO codes
> +
> +-isocodes =3D dependency('iso-codes', required: false)
> ++isocodes =3D dependency('iso-codes', required: false, native: true)
> + if isocodes.found()
> +   isocodes_prefix =3D isocodes.get_variable(pkgconfig: 'prefix')
> +   isocodes_location =3D isocodes_prefix / 'share' / 'xml' /=20
> 'iso-codes'
> +--
> +2.49.0
> +
> diff --git=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning=
.patch=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning=
.patch
> deleted file mode 100644
> index 4f04ac8250..0000000000
> ---=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning=
.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -From 51311f913d9f417d121f59b83d560c7b4b853d1c Mon Sep 17 00:00:00=20
> 2001
> -From: Simon Budig <simon@budig.de <mailto:simon@budig.de>>
> -Date: Sat, 20 May 2023 22:25:40 +0200
> -Subject: [PATCH] metadata: shut up a weird warning
> -
> -Upstream-Status: Backport=20
> [<https://gitlab.gnome.org/GNOME/gimp/-/commit/51311f913d9f417d121f59b83d=
560c7b4b853d1c>]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
> ----
> - plug-ins/metadata/metadata-editor.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- a/plug-ins/metadata/metadata-editor.c
> -+++ b/plug-ins/metadata/metadata-editor.c
> -@@ -2140,7 +2140,7 @@ metadata_dialog_editor_set_metadata (GEx
> -                             }
> -                           else
> -                             {
> --                              if (! g_strv_contains (values,=20
> equiv_values[evi]))
> -+                              if (! g_strv_contains ((const gchar *=20
> const *) values, equiv_values[evi]))
> -                                 {
> -                                   gchar *tmpvalue;
> -
> diff --git=20
> a/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.=
patch=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.=
patch
> new file mode 100644
> index 0000000000..532715d588
> --- /dev/null
> +++=20
> b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.=
patch
> @@ -0,0 +1,56 @@
> +From bf19c5687703769e406a8086036d4ed6421c33cb Mon Sep 17 00:00:00=20
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Mon, 13 Jan 2025 10:04:33 +0100
> +Subject: [PATCH] meson.build: reproducibility fix
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + meson.build | 28 ++++++++++++++--------------
> + 1 file changed, 14 insertions(+), 14 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 97cd621780..e47180db87 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1599,23 +1599,23 @@ conf.set('HAVE_FUNC_ATTRIBUTE_DESTRUCTOR',
> + conf.set_quoted('CC',             cc.get_id())
> +
> + cc_version=3D''
> +-if cc.get_id() =3D=3D 'gcc' or cc.get_id() =3D=3D 'clang'
> +-  cc_cmd =3D run_command(cc, '-v', check: false)
> ++#if cc.get_id() =3D=3D 'gcc' or cc.get_id() =3D=3D 'clang'
> ++#  cc_cmd =3D run_command(cc, '-v', check: false)
> +   # Note: the call might actually fail when using ccache.
> +   # See: <https://github.com/mesonbuild/meson/issues/6174>
> +-  if cc_cmd.returncode() =3D=3D 0
> +-    cc_version =3D cc_cmd.stdout() + cc_cmd.stderr()
> +-  endif
> +-else
> ++#  if cc_cmd.returncode() =3D=3D 0
> ++#    cc_version =3D cc_cmd.stdout() + cc_cmd.stderr()
> ++#  endif
> ++#else
> +   # Various compilers have various options. Try most common ones.=20
> This
> +   # list of options comes from autotools checks.
> +-  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
> +-    cc_cmd =3D run_command(cc, arg, check: false)
> +-    if cc_cmd.returncode() =3D=3D 0
> +-      cc_version =3D cc_cmd.stdout()
> +-    endif
> +-  endforeach
> +-endif
> ++#  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
> ++#    cc_cmd =3D run_command(cc, arg, check: false)
> ++#    if cc_cmd.returncode() =3D=3D 0
> ++#      cc_version =3D cc_cmd.stdout()
> ++#    endif
> ++#  endforeach
> ++#endif
> + if cc_version =3D=3D ''
> +   # We didn't manage to get a meaningful verbose version from the
> +   # compiler. Just save its name and version.
> +--
> +2.47.1
> +
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb=20
> b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> deleted file mode 100644
> index 0272e05e96..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> +++ /dev/null
> @@ -1,101 +0,0 @@
> -SUMMARY =3D "The GIMP is the GNU Image Manipulation Program"
> -HOMEPAGE =3D "http://www.gimp.org <http://www.gimp.org/>"
> -SECTION =3D "x11/graphics"
> -LICENSE =3D "GPL-3.0-only"
> -LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a71e"=20
> <file://copying;md5=3Dc678957b0c8e964aa6c70fd77641a71e/>
> -
> -DEPENDS =3D " \
> -    alsa-lib \
> -    atk \
> -    cairo \
> -    fontconfig \
> -    freetype \
> -    gdk-pixbuf-native \
> -    intltool-native \
> -    libxslt-native \
> -    gegl-native \
> -    dbus-glib \
> -    gtk+ \
> -    babl \
> -    gegl \
> -    libmypaint \
> -    mypaint-brushes-1.0 \
> -    gexiv2 \
> -    jpeg \
> -    libmng \
> -    libpng \
> -    libexif \
> -    tiff \
> -    lcms \
> -    poppler \
> -    poppler-data \
> -    jasper \
> -    bzip2 \
> -    libgudev \
> -    libmng \
> -    ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'libxmu=20
> libxpm', '', d)} \
> -"
> -DEPENDS:append:libc-musl =3D " libexecinfo"
> -
> -GNOMEBASEBUILDCLASS =3D "autotools"
> -inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
> -
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> -
> -SHPV =3D "${@gnome_verdir("${PV}")}"
> -
> -SRC_URI =3D=20
> "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2=20
> <https://download.gimp.org/pub/$%7BBPN%7D/v$%7BSHPV%7D/$%7BBP%7D.tar.bz2>=
=20
> \
> -          =20
> file://0001-configure-Keep-first-line-of-compiler-version-string.patch=20
> <file://0001-configure-keep-first-line-of-compiler-version-string.patch/>=
=20
> \
> -          =20
> file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch=20
> <file://0001-libtool-do-not-add-build-time-library-paths-to-ld_li.patch/>=
=20
> \
> -          =20
> file://0001-file-tiff-load-fix-mismatching-variable-type.patch=20
> <file://0001-file-tiff-load-fix-mismatching-variable-type.patch/> \
> -           file://0001-metadata-shut-up-a-weird-warning.patch=20
> <file://0001-metadata-shut-up-a-weird-warning.patch/> \
> -           file://0001-gimptool-allow-default-CC-override.patch=20
> <file://0001-gimptool-allow-default-cc-override.patch/> \
> -           "
> -SRC_URI[sha256sum] =3D=20
> "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
> -
> -EXTRA_OECONF =3D "--disable-python \
> -                --without-webkit \
> -                --disable-check-update \
> -                --without-wmf"
> -
> -EXTRA_OECONF +=3D "${@oe.utils.conditional=20
> <mailto:${@oe.utils.conditional>('SITEINFO_BITS', '32', '=20
> --disable-vector-icons', '', d)}"
> -
> -do_configure:append() {
> -    find ${B} -name Makefile | xargs sed -i=20
> s:'-I$(includedir)':'-I.':g
> -    find ${B} -name Makefile | xargs sed -i=20
> s:'-I/usr/include':'-I${STAGING_INCDIR}':g
> -}
> -
> -do_compile:prepend() {
> -    # Let native babl/gegl find their plugins
> -    export BABL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1=20
> -name 'babl-*'`
> -    export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1=20
> -name 'gegl-*'`
> -}
> -
> -FILES:${PN}  +=3D "${datadir}/metainfo"
> -
> -RDEPENDS:${PN} +=3D "mypaint-brushes-1.0"
> -
> -
> -# gimptool
> -
> -# gimptool needs a CC definition, use current CC without sysroot
> -python __anonymous() {
> -    import shlex
> -    CC_WITHOUT_SYSROOT =3D shlex.join(filter(lambda x: not=20
> x.startswith("--sysroot=3D"), shlex.split(d.getVar("CC"))))
> -    d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT)
> -}
> -EXTRA_OECONF +=3D "--with-default-cc=3D'${CC_WITHOUT_SYSROOT}'"
> -
> -# Split gimptool in its own package
> -PACKAGE_BEFORE_PN +=3D "${PN}-gimptool"
> -FILES:${PN}-gimptool +=3D "${bindir}/gimptool-2.0"
> -
> -# gimptool depends on gimp .pc file being installed and tools to=20
> build the plugin.
> -RDEPENDS:${PN}-gimptool +=3D "${PN}-dev=20
> packagegroup-core-buildessential"
> -INSANE_SKIP:${PN}-gimptool +=3D "dev-deps"
> -
> -
> -CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform: This only=20
> applies for Mandriva Linux"
> -CVE_STATUS[CVE-2009-0581] =3D "cpe-incorrect: The current version=20
> (2.10.38) is not affected."
> -CVE_STATUS[CVE-2009-0723] =3D "cpe-incorrect: The current version=20
> (2.10.38) is not affected."
> -CVE_STATUS[CVE-2009-0733] =3D "cpe-incorrect: The current version=20
> (2.10.38) is not affected."
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb=20
> b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
> new file mode 100644
> index 0000000000..2018ea04c4
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
> @@ -0,0 +1,132 @@
> +SUMMARY =3D "The GIMP is the GNU Image Manipulation Program"
> +HOMEPAGE =3D "http://www.gimp.org <http://www.gimp.org/>"
> +SECTION =3D "graphics"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a71e"=20
> <file://copying;md5=3Dc678957b0c8e964aa6c70fd77641a71e/>
> +
> +DEPENDS =3D " \
> +    appstream-glib \
> +    atk \
> +    babl \
> +    bzip2 \
> +    bison-native \
> +    cairo \
> +    fontconfig \
> +    freetype \
> +    gdk-pixbuf-native \
> +    gegl \
> +    gexiv2 \
> +    glib-2.0 \
> +    glib-2.0-native \
> +    gtk+3 \
> +    harfbuzz \
> +    iso-codes-native \
> +    jpeg \
> +    json-glib \
> +    lcms \
> +    libarchive \
> +    libexif \
> +    libmypaint \
> +    libpng \
> +    librsvg \
> +    librsvg-native \
> +    libxmu \
> +    libxslt-native \
> +    mypaint-brushes-1.0 \
> +    pango \
> +    poppler \
> +    poppler-data \
> +    python3-pygobject-native \
> +    tiff \
> +    xz \
> +    zlib \
> +"
> +
> +DEPENDS:append:libc-musl =3D " libexecinfo"
> +
> +inherit meson gtk-icon-cache mime-xdg pkgconfig gettext=20
> gobject-introspection vala
> +
> +GIR_MESON_OPTION =3D 'can-crosscompile-gir'
> +VALA_MESON_OPTION =3D "vala"
> +VALA_MESON_ENABLE_FLAG =3D "enabled"
> +VALA_MESON_DISABLE_FLAG =3D "disabled"
> +GIDOCGEN_MESON_OPTION =3D "gi-docgen"
> +GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
> +GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
> +
> +SRC_URI =3D=20
> "https://download.gimp.org/gimp/v${@oe.utils.trim_version('${PV=20
> <https://download.gimp.org/gimp/v$%7B@oe.utils.trim_version('$%7BPV>}',=20
> 2)}/gimp-${PV}.tar.xz"
> +SRC_URI +=3D "file://0001-gimp-cross-compile-fix-for-bz2.patch"=20
> <file://0001-gimp-cross-compile-fix-for-bz2.patch/>
> +SRC_URI +=3D "file://0002-meson.build-reproducibility-fix.patch"=20
> <file://0002-meson.build-reproducibility-fix.patch/>
> +SRC_URI +=3D "file://0001-meson.build-dont-check-for-lgi.patch"=20
> <file://0001-meson.build-dont-check-for-lgi.patch/>
> +SRC_URI +=3D "file://0001-meson.build-require-iso-codes-native.patch"=20
> <file://0001-meson.build-require-iso-codes-native.patch/>
> +SRC_URI[sha256sum] =3D=20
> "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0ad8cbcbf6ea571a2"
> +
> +PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
> +PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
> +PACKAGECONFIG[appdata-test] =3D=20
> "-Dappdata-test=3Denabled,-Dappdata-test=3Ddisabled,appstream-native"
> +PACKAGECONFIG[cairo-pdf] =3D "-Dcairo-pdf=3Denabled,-Dcairo-pdf=3Ddisabl=
ed"
> +PACKAGECONFIG[check-update] =3D "-Dcheck-update=3Dyes,-Dcheck-update=3Dn=
o"
> +PACKAGECONFIG[ghostscript] =3D=20
> "-Dghostscript=3Denabled,-Dghostscript=3Ddisabled,ghostscript,ghostscript=
"
> +PACKAGECONFIG[gudev] =3D "-Dgudev=3Denabled,-Dgudev=3Ddisabled,libgudev"
> +PACKAGECONFIG[heif] =3D "-Dheif=3Denabled,-Dheif=3Ddisabled,libheif"
> +PACKAGECONFIG[javascript] =3D=20
> "-Djavascript=3Denabled,-Djavascript=3Ddisabled,,gjs"
> +PACKAGECONFIG[jpeg2000] =3D=20
> "-Djpeg2000=3Denabled,-Djpeg2000=3Ddisabled,jasper"
> +PACKAGECONFIG[jpeg-xl] =3D=20
> "-Djpeg-xl=3Denabled,-Djpeg-xl=3Ddisabled,libjxl"
> +PACKAGECONFIG[libunwind] =3D=20
> "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libunwind"
> +PACKAGECONFIG[libbacktrace] =3D=20
> "-Dlibbacktrace=3Dtrue,-Dlibbacktrace=3Dfalse,libbacktrace"
> +PACKAGECONFIG[lua] =3D "-Dlua=3Dtrue,-Dlua=3Dfalse,,luajit lua-lgi"
> +PACKAGECONFIG[mng] =3D "-Dmng=3Denabled,-Dmng=3Ddisabled,libmng"
> +PACKAGECONFIG[openmp] =3D=20
> "-Dopenmp=3Denabled,-Dopenmp=3Ddisabled,gcc-runtime"
> +PACKAGECONFIG[vector-icons] =3D=20
> "-Dvector-icons=3Dtrue,-Dvector-icons=3Dfalse,librsvg shared-mime-info"
> +PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,libwebp"
> +PACKAGECONFIG[xcursor] =3D=20
> "-Dxcursor=3Denabled,-Dxcursor=3Ddisabled,libxcursor"
> +PACKAGECONFIG[x11] =3D "-Dxpm=3Denabled,-Dxpm=3Ddisabled,libxpm libxext=20
> libxfixes"
> +
> +PACKAGECONFIG ?=3D " \
> +    alsa \
> +    cairo-pdf \
> +    ghostscript \
> +    gudev \
> +    javascript \
> +    jpeg2000 \
> +    jpeg-xl \
> +    lua \
> +    mng \
> +    webp \
> +    ${@oe.utils.conditional=20
> <mailto:${@oe.utils.conditional>('SITEINFO_BITS', '32', '',=20
> 'vector-icons', d)} \
> +    ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('LICENSE_FLAGS_ACCEPTED', 'commercial',=20
> 'heif', '', d)} \
> +    ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'x11=20
> xcursor', '', d)} \
> +"
> +
> +PACKAGECONFIG:remove:riscv32 =3D "lua"
> +PACKAGECONFIG:remove:riscv64 =3D "lua"
> +PACKAGECONFIG:remove:powerpc64 =3D "lua"
> +PACKAGECONFIG:remove:powerpc64le =3D "lua"
> +
> +EXTRA_OEMESON +=3D " \
> +    -Dshmem-type=3Dposix \
> +    -Dlinux-input=3Denabled \
> +    --buildtype release \
> +    --cross-file=3D${WORKDIR}/meson-${PN}.cross \
> +"
> +
> +do_write_config:append() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +gjs =3D '${bindir}/gjs'
> +luajit =3D '${bindir}/luajit'
> +EOF
> +}
> +
> +do_configure:append () {
> +    sed -i -e "s|build_by_default: true|build_by_default: false|"=20
> ${S}/gimp-data/images/meson.build
> +}
> +
> +do_install:prepend() {
> +    sed -i -e "s|${B}||" ${B}/app/widgets/gimplanguagestore-data.h
> +    sed -i -e "s|${B}||" ${B}/plug-ins/file-bmp/huffman.h
> +}
> +
> +FILES:${PN} +=3D "${datadir}/metainfo"
> +
> +RDEPENDS:${PN} =3D "mypaint-brushes-1.0 glib-networking=20
> python3-pygobject"
> --
> 2.49.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116360):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/116360>
> Mute This Topic: <https://lists.openembedded.org/mt/111965838/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-dXIMRWJlP+7TdI5TkSPM
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v8: update patch-status</div></div=
><div id=3D"geary-quote" dir=3D"auto"><br>On Sa, M=C3=A4r 29 2025 at 02:18:=
14 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
At long last, the first release of GIMP 3.0 is here! This is the end result=
 of seven years of hard work
by volunteer developers, designers, artists, and community members (for ref=
erence, GIMP 2.10
was first published in 2018 and the initial development version of GIMP 3.0=
 was released in 2020).
With GIMP 3.0 you can do more than ever before, more easily, more quickly!

Highlights

- Need to tweak a filter you applied hours ago? New in GIMP 3.0 is non-dest=
ructive editing for most commonly-used filters. See the changes in real tim=
e with on-canvas preview.
- Exchange files with more applications, including BC7 DDS files as well as=
 better PSD export and many new formats.
- Don=E2=80=99t know how big to make your drawing? Simply set your paint to=
ol to expand layers automatically as needed.
- Making pro-quality text got easier, too. Style your text, apply outlines,=
 shadows, bevels, and more, and you can still edit your text, change font a=
nd size, and even tweak the style settings.
- Organizing your layers has become much easier with the ability to select =
multiple items at once, move them or transform them all together!
- Color Management was again improved, as our long-term project to make GIM=
P an advanced image editor for all usages.
- Updated graphical toolkit (GTK3) for modern desktop usage.
- New Wilber logo!

<a href=3D"https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_t=
ype=3Dtags">https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_=
type=3Dtags</a>

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;
---
 ...irst-line-of-compiler-version-string.patch |  30 ----
 ...f-load-fix-mismatching-variable-type.patch |  24 ----
 .../0001-gimp-cross-compile-fix-for-bz2.patch |  30 ++++
 ...1-gimptool-allow-default-CC-override.patch |  85 -----------
 ...dd-build-time-library-paths-to-LD_LI.patch |  34 -----
 .../0001-meson.build-dont-check-for-lgi.patch |  35 +++++
 ...meson.build-require-iso-codes-native.patch |  35 +++++
 ...001-metadata-shut-up-a-weird-warning.patch |  22 ---
 ...0002-meson.build-reproducibility-fix.patch |  56 ++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  | 101 --------------
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb    | 132 ++++++++++++++++++
 11 files changed, 288 insertions(+), 296 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-f=
irst-line-of-compiler-version-string.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-f=
ix-mismatching-variable-type.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compi=
le-fix-for-bz2.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-d=
efault-CC-override.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-a=
dd-build-time-library-paths-to-LD_LI.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont=
-check-for-lgi.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-requ=
ire-iso-codes-native.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up=
-a-weird-warning.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-repr=
oducibility-fix.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-li=
ne-of-compiler-version-string.patch b/meta-gnome/recipes-gimp/gimp/gimp/000=
1-configure-Keep-first-line-of-compiler-version-string.patch
deleted file mode 100644
index 618b4cc7a7..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-c=
ompiler-version-string.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5711ccfab40e304ced7f5be39a4083e3fcecff91 Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;
-Date: Wed, 24 May 2023 22:22:41 -0700
-Subject: [PATCH] configure: Keep first line of compiler version string
-
-Full output of cc -v may contain additional information which could
-contain build path information, which is unnessasary
-
-Upstream-Status: Submitted [<a href=3D"https://gitlab.gnome.org/GNOME/gimp=
/-/merge_requests/926">https://gitlab.gnome.org/GNOME/gimp/-/merge_requests=
/926</a>]
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c25415d..68707a0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -599,7 +599,7 @@ fi
- for CC_VERSION_OPT in $CC_VERSION_OPTS; do
-   # We run $CC, and escape and format its output, in a single step,
-   # since some shells expand escape sequences in "echo" arguments.
--  CC_VERSION=3D"`$CC $CC_VERSION_OPT 2&gt;&amp;1 | sed -e 's/\\\\/\\\\\\\=
\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
-+  CC_VERSION=3D"`$CC $CC_VERSION_OPT 2&gt;&amp;1 | head -1 | sed -e 's/\\=
\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
-   if test $? -eq 0; then
-     break
-   fi
---=20
-2.40.1
-
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mism=
atching-variable-type.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-file-t=
iff-load-fix-mismatching-variable-type.patch
deleted file mode 100644
index 13b3dda144..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching=
-variable-type.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From a2458f1528e5733574bb26ff5452b1329116e6db Mon Sep 17 00:00:00 2001
-From: Simon Budig &lt;<a href=3D"mailto:simon@budig.de">simon@budig.de</a>=
&gt;
-Date: Sat, 20 May 2023 18:40:41 +0200
-Subject: [PATCH] file-tiff-load: fix mismatching variable type
-
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/gimp/=
-/commit/a2458f1528e5733574bb26ff5452b1329116e6db">https://gitlab.gnome.org=
/GNOME/gimp/-/commit/a2458f1528e5733574bb26ff5452b1329116e6db</a>]
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai.com">raj.khem@=
gmai.com</a>&gt;
----
- plug-ins/file-tiff/file-tiff-load.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/plug-ins/file-tiff/file-tiff-load.c
-+++ b/plug-ins/file-tiff/file-tiff-load.c
-@@ -1301,8 +1301,8 @@ load_image (GFile        *file,
-=20
-       /* any resolution info in the file? */
-       {
--        gfloat   xres =3D 72.0;
--        gfloat   yres =3D 72.0;
-+        gdouble   xres =3D 72.0;
-+        gdouble   yres =3D 72.0;
-         gushort  read_unit;
-         GimpUnit unit =3D GIMP_UNIT_PIXEL; /* invalid unit */
-=20
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-=
for-bz2.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-f=
ix-for-bz2.patch
new file mode 100644
index 0000000000..721225c8b3
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2=
.patch
@@ -0,0 +1,30 @@
+From a7e40e19d17404cf5ec4135fc1becd5a90f5e1e1 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.=
de</a>&gt;
+Date: Wed, 25 Dec 2024 07:27:04 +0100
+Subject: [PATCH] gimp: cross-compile fix for bz2
+
+autotools bzip2 build does not create pkgconfig files so looking for the d=
ependency fails.
+
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
+
+Upstream-Status: Inappropriate [can probably be removed once bzip2 is buil=
t with meson or cmake]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 4e48f8c64c..d5dce47015 100644
+--- a/meson.build
++++ b/meson.build
+@@ -765,7 +765,7 @@ zlib =3D dependency('zlib')
+ MIMEtypes +=3D 'image/x-psp'
+=20
+ # Compiler-provided headers can't be found in crossroads environment
+-if not meson.is_cross_build()
++if true
+   bz2 =3D cc.find_library('bz2')
+ else
+   bz2 =3D dependency('bzip2')
+--=20
+2.47.1
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-=
CC-override.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-d=
efault-CC-override.patch
deleted file mode 100644
index b04a16cec7..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-over=
ride.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 7e5b986cb7797a6535fe2471b9a5fb7c00821f51 Mon Sep 17 00:00:00 2001
-From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.cong=
al@smile.fr</a>&gt;
-Date: Sun, 13 Oct 2024 01:00:10 +0200
-Subject: [PATCH] gimptool: allow default CC override
-
-From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.cong=
al@smile.fr</a>&gt;
-
-In OE, CC contains sysroot path. Storing CC in binary then leads to
-non-reproducibility.
-
-This commit add a new configure option "--with-default-cc=3D'cmd'" for
-force the CC stored in gimptool to a reproducible value.
-
-Upstream-Status: Inappropriate [does not apply on master (upstream has mov=
ed to meson)]
-Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">y=
oann.congal@smile.fr</a>&gt;
----
- app-tools/Makefile.am |  2 +-
- configure.ac          | 13 +++++++++++++
- tools/Makefile.am     |  2 +-
- tools/gimptool.c      |  2 +-
- 4 files changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/app-tools/Makefile.am b/app-tools/Makefile.am
-index a7cd4ce..81a3a00 100644
---- a/app-tools/Makefile.am
-+++ b/app-tools/Makefile.am
-@@ -67,7 +67,7 @@ AM_CPPFLAGS =3D \
- 	-DMANDIR=3D\""$(mandir)"\"				\
- 	-DGIMPPLUGINDIR=3D\""$(gimpplugindir)"\"			\
- 	-DGIMPDATADIR=3D\""$(gimpdatadir)"\"			\
--	-DCC=3D\""$(CC)"\"					\
-+	-DDEFAULT_CC=3D\""@DEFAULT_CC@"\"				\
- 	-DGIMPDIR=3D\""$(gimpdir)"\"				\
- 	-DGIMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\"	\
- 	-I$(top_srcdir)						\
-diff --git a/configure.ac b/configure.ac
-index a88b7cc..d90b6db 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2457,6 +2457,19 @@ fi
- AM_CONDITIONAL(DESKTOP_DATADIR, test "x$with_desktop_dir" !=3D xno)
- AC_SUBST(DESKTOP_DATADIR)
-=20
-+######################
-+# Determine default CC
-+######################
-+
-+AC_ARG_WITH(default-cc, [ --with-default-cc=3D"cmd" default CC to print i=
n gimptool (default=3DCC)])
-+
-+if test "x$with_default_cc" !=3D x; then
-+  DEFAULT_CC=3D$with_default_cc
-+else
-+  DEFAULT_CC=3DCC
-+fi
-+
-+AC_SUBST(DEFAULT_CC)
-=20
- #####################
- # Check for XML tools
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 420b9b1..ccabde8 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -87,7 +87,7 @@ AM_CPPFLAGS =3D \
- 	-DMANDIR=3D\""$(mandir)"\"				\
- 	-DGIMPPLUGINDIR=3D\""$(gimpplugindir)"\"			\
- 	-DGIMPDATADIR=3D\""$(gimpdatadir)"\"			\
--	-DCC=3D\""$(CC)"\"					\
-+	-DDEFAULT_CC=3D\""@DEFAULT_CC@"\"				\
- 	-DGIMPDIR=3D\""$(gimpdir)"\"				\
- 	-DGIMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\"	\
- 	-I$(top_srcdir)						\
-diff --git a/tools/gimptool.c b/tools/gimptool.c
-index 21fc043..bbf3fa5 100644
---- a/tools/gimptool.c
-+++ b/tools/gimptool.c
-@@ -280,7 +280,7 @@ find_out_env_flags (void)
-   else if (msvc_syntax)
-     env_cc =3D "cl -MD";
-   else
--    env_cc =3D CC;
-+    env_cc =3D DEFAULT_CC;
-=20
-   if (g_ascii_strncasecmp (env_cc, "cl", 2)    =3D=3D 0 &amp;&amp;
-       g_ascii_strncasecmp (env_cc, "clang", 5) !=3D 0)
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-buil=
d-time-library-paths-to-LD_LI.patch b/meta-gnome/recipes-gimp/gimp/gimp/000=
1-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
deleted file mode 100644
index cec0055284..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-=
library-paths-to-LD_LI.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c720df90dfe3a3e92e34bfb36a04cc792064a501 Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;
-Date: Wed, 24 May 2023 22:39:02 -0700
-Subject: [PATCH] libtool: Do not add build time library paths to
- LD_LIBRARY_PATH
-
-This does not serve much purpose on cross builds as it will add build
-time paths which are only useful when trying to run these tools from
-build area but when they are cross built this is not possible to run
-them like this.
-
-Upstream-Status: Inappropriate [Cross-compile specific]
-
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
----
- ltmain.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index 134902c..068d74a 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -5748,7 +5748,7 @@ func_exec_program ()
- 	if test yes =3D "$shlibpath_overrides_runpath" &amp;&amp; test -n "$shli=
bpath_var" &amp;&amp; test -n "$temp_rpath"; then
- 	  $ECHO "\
-     # Add our own library path to $shlibpath_var
--    $shlibpath_var=3D\"$temp_rpath\$$shlibpath_var\"
-+    $shlibpath_var=3D\"$shlibpath_var\"
-=20
-     # Some systems cannot cope with colon-terminated $shlibpath_var
-     # The second colon is a workaround for a bug in BeOS R4 sed
---=20
-2.40.1
-
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-check-=
for-lgi.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-che=
ck-for-lgi.patch
new file mode 100644
index 0000000000..63a9159a43
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-check-for-lgi=
.patch
@@ -0,0 +1,35 @@
+From e56a6330f1e29e489601ea3e7cb31bfd2ebb787a Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.=
de</a>&gt;
+Date: Thu, 27 Mar 2025 21:02:22 +0100
+Subject: [PATCH] meson.build: dont check for lgi
+
+Checking if host can run lgi is pointless for cross-compile
+Set to be always true because we ensure to install lgi via PACKAGECONFIG
+
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index c91e8fc97d..efbc2d8175 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1235,11 +1235,7 @@ if have_lua
+       endif
+=20
+       if is_supported_lua
+-        have_lua_lgi =3D run_command(lua, '-e',
+-                                   '''
+-                                   local lgi =3D require 'lgi'
+-                                   ''',
+-                                   check: false).returncode() =3D=3D 0
++        have_lua_lgi =3D true
+       endif
+=20
+       if have_lua_lgi
+--=20
+2.49.0
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-iso=
-codes-native.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-re=
quire-iso-codes-native.patch
new file mode 100644
index 0000000000..ffb8ef29df
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-iso-codes-=
native.patch
@@ -0,0 +1,35 @@
+From 8ccd12d6ec3330e9646ae9db6fd491226d516dc3 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.=
de</a>&gt;
+Date: Fri, 28 Mar 2025 01:33:00 +0100
+Subject: [PATCH] meson.build: require iso-codes-native
+
+This fixes:
+FAILED: app/widgets/gimplanguagestore-data.h
+/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/gimp/3.0.2/build/=
tools/gen-languages
+gimp_language_store_parser_init: 0.006277 seconds
+ERROR: parse_iso_codes: error parsing '/usr/share/xml/iso-codes/iso_639_3.=
xml': No such file or directory
+
+Upstream-Status: Denied [<a href=3D"https://gitlab.gnome.org/GNOME/gimp/-/=
merge_requests/2185">https://gitlab.gnome.org/GNOME/gimp/-/merge_requests/2=
185</a>]
+Upstream argues that iso-codes locale (.mo files) are required on the targ=
et
+
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index efbc2d8175..fd050f4d3c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1135,7 +1135,7 @@ endif
+ #########################################################################=
#######
+ # ISO codes
+=20
+-isocodes =3D dependency('iso-codes', required: false)
++isocodes =3D dependency('iso-codes', required: false, native: true)
+ if isocodes.found()
+   isocodes_prefix =3D isocodes.get_variable(pkgconfig: 'prefix')
+   isocodes_location =3D isocodes_prefix / 'share' / 'xml' / 'iso-codes'
+--=20
+2.49.0
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weir=
d-warning.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a=
-weird-warning.patch
deleted file mode 100644
index 4f04ac8250..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warni=
ng.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 51311f913d9f417d121f59b83d560c7b4b853d1c Mon Sep 17 00:00:00 2001
-From: Simon Budig &lt;<a href=3D"mailto:simon@budig.de">simon@budig.de</a>=
&gt;
-Date: Sat, 20 May 2023 22:25:40 +0200
-Subject: [PATCH] metadata: shut up a weird warning
-
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/gimp/=
-/commit/51311f913d9f417d121f59b83d560c7b4b853d1c">https://gitlab.gnome.org=
/GNOME/gimp/-/commit/51311f913d9f417d121f59b83d560c7b4b853d1c</a>]
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
----
- plug-ins/metadata/metadata-editor.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/plug-ins/metadata/metadata-editor.c
-+++ b/plug-ins/metadata/metadata-editor.c
-@@ -2140,7 +2140,7 @@ metadata_dialog_editor_set_metadata (GEx
-                             }
-                           else
-                             {
--                              if (! g_strv_contains (values, equiv_values=
[evi]))
-+                              if (! g_strv_contains ((const gchar * const=
 *) values, equiv_values[evi]))
-                                 {
-                                   gchar *tmpvalue;
-=20
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibi=
lity-fix.patch b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reprodu=
cibility-fix.patch
new file mode 100644
index 0000000000..532715d588
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fi=
x.patch
@@ -0,0 +1,56 @@
+From bf19c5687703769e406a8086036d4ed6421c33cb Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.=
de</a>&gt;
+Date: Mon, 13 Jan 2025 10:04:33 +0100
+Subject: [PATCH] meson.build: reproducibility fix
+
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 97cd621780..e47180db87 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1599,23 +1599,23 @@ conf.set('HAVE_FUNC_ATTRIBUTE_DESTRUCTOR',
+ conf.set_quoted('CC',             cc.get_id())
+=20
+ cc_version=3D''
+-if cc.get_id() =3D=3D 'gcc' or cc.get_id() =3D=3D 'clang'
+-  cc_cmd =3D run_command(cc, '-v', check: false)
++#if cc.get_id() =3D=3D 'gcc' or cc.get_id() =3D=3D 'clang'
++#  cc_cmd =3D run_command(cc, '-v', check: false)
+   # Note: the call might actually fail when using ccache.
+   # See: <a href=3D"https://github.com/mesonbuild/meson/issues/6174">http=
s://github.com/mesonbuild/meson/issues/6174</a>
+-  if cc_cmd.returncode() =3D=3D 0
+-    cc_version =3D cc_cmd.stdout() + cc_cmd.stderr()
+-  endif
+-else
++#  if cc_cmd.returncode() =3D=3D 0
++#    cc_version =3D cc_cmd.stdout() + cc_cmd.stderr()
++#  endif
++#else
+   # Various compilers have various options. Try most common ones. This
+   # list of options comes from autotools checks.
+-  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
+-    cc_cmd =3D run_command(cc, arg, check: false)
+-    if cc_cmd.returncode() =3D=3D 0
+-      cc_version =3D cc_cmd.stdout()
+-    endif
+-  endforeach
+-endif
++#  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
++#    cc_cmd =3D run_command(cc, arg, check: false)
++#    if cc_cmd.returncode() =3D=3D 0
++#      cc_version =3D cc_cmd.stdout()
++#    endif
++#  endforeach
++#endif
+ if cc_version =3D=3D ''
+   # We didn't manage to get a meaningful verbose version from the
+   # compiler. Just save its name and version.
+--=20
+2.47.1
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_2.10.38.bb
deleted file mode 100644
index 0272e05e96..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ /dev/null
@@ -1,101 +0,0 @@
-SUMMARY =3D "The GIMP is the GNU Image Manipulation Program"
-HOMEPAGE =3D "<a href=3D"http://www.gimp.org">http://www.gimp.org</a>"
-SECTION =3D "x11/graphics"
-LICENSE =3D "GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3Dc678957b0c8e964aa6c7=
0fd77641a71e" "=3D"">file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a71e"=
</a>
-
-DEPENDS =3D " \
-    alsa-lib \
-    atk \
-    cairo \
-    fontconfig \
-    freetype \
-    gdk-pixbuf-native \
-    intltool-native \
-    libxslt-native \
-    gegl-native \
-    dbus-glib \
-    gtk+ \
-    babl \
-    gegl \
-    libmypaint \
-    mypaint-brushes-1.0 \
-    gexiv2 \
-    jpeg \
-    libmng \
-    libpng \
-    libexif \
-    tiff \
-    lcms \
-    poppler \
-    poppler-data \
-    jasper \
-    bzip2 \
-    libgudev \
-    libmng \
-    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DIST=
RO_FEATURES', 'x11', 'libxmu libxpm', '', d)} \
-"
-DEPENDS:append:libc-musl =3D " libexecinfo"
-
-GNOMEBASEBUILDCLASS =3D "autotools"
-inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
-
-REQUIRED_DISTRO_FEATURES =3D "x11"
-
-SHPV =3D "${@gnome_verdir("${PV}")}"
-
-SRC_URI =3D "<a href=3D"https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP=
}.tar.bz2">https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2</a> =
\
-           <a href=3D"file://0001-configure-Keep-first-line-of-compiler-ve=
rsion-string.patch">file://0001-configure-Keep-first-line-of-compiler-versi=
on-string.patch</a> \
-           <a href=3D"file://0001-libtool-Do-not-add-build-time-library-pa=
ths-to-LD_LI.patch">file://0001-libtool-Do-not-add-build-time-library-paths=
-to-LD_LI.patch</a> \
-           <a href=3D"file://0001-file-tiff-load-fix-mismatching-variable-=
type.patch">file://0001-file-tiff-load-fix-mismatching-variable-type.patch<=
/a> \
-           <a href=3D"file://0001-metadata-shut-up-a-weird-warning.patch">=
file://0001-metadata-shut-up-a-weird-warning.patch</a> \
-           <a href=3D"file://0001-gimptool-allow-default-CC-override.patch=
">file://0001-gimptool-allow-default-CC-override.patch</a> \
-           "
-SRC_URI[sha256sum] =3D "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf9=
8f85c1133f856e"
-
-EXTRA_OECONF =3D "--disable-python \
-                --without-webkit \
-                --disable-check-update \
-                --without-wmf"
-
-EXTRA_OECONF +=3D "<a href=3D"mailto:${@oe.utils.conditional">${@oe.utils.=
conditional</a>('SITEINFO_BITS', '32', ' --disable-vector-icons', '', d)}"
-
-do_configure:append() {
-    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGIN=
G_INCDIR}':g
-}
-
-do_compile:prepend() {
-    # Let native babl/gegl find their plugins
-    export BABL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name 'b=
abl-*'`
-    export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name 'g=
egl-*'`
-}
-
-FILES:${PN}  +=3D "${datadir}/metainfo"
-
-RDEPENDS:${PN} +=3D "mypaint-brushes-1.0"
-
-
-# gimptool
-
-# gimptool needs a CC definition, use current CC without sysroot
-python __anonymous() {
-    import shlex
-    CC_WITHOUT_SYSROOT =3D shlex.join(filter(lambda x: not x.startswith("-=
-sysroot=3D"), shlex.split(d.getVar("CC"))))
-    d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT)
-}
-EXTRA_OECONF +=3D "--with-default-cc=3D'${CC_WITHOUT_SYSROOT}'"
-
-# Split gimptool in its own package
-PACKAGE_BEFORE_PN +=3D "${PN}-gimptool"
-FILES:${PN}-gimptool +=3D "${bindir}/gimptool-2.0"
-
-# gimptool depends on gimp .pc file being installed and tools to build the=
 plugin.
-RDEPENDS:${PN}-gimptool +=3D "${PN}-dev packagegroup-core-buildessential"
-INSANE_SKIP:${PN}-gimptool +=3D "dev-deps"
-
-
-CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform: This only applies =
for Mandriva Linux"
-CVE_STATUS[CVE-2009-0581] =3D "cpe-incorrect: The current version (2.10.38=
) is not affected."
-CVE_STATUS[CVE-2009-0723] =3D "cpe-incorrect: The current version (2.10.38=
) is not affected."
-CVE_STATUS[CVE-2009-0733] =3D "cpe-incorrect: The current version (2.10.38=
) is not affected."
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/recipe=
s-gimp/gimp/gimp_3.0.2.bb
new file mode 100644
index 0000000000..2018ea04c4
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
@@ -0,0 +1,132 @@
+SUMMARY =3D "The GIMP is the GNU Image Manipulation Program"
+HOMEPAGE =3D "<a href=3D"http://www.gimp.org">http://www.gimp.org</a>"
+SECTION =3D "graphics"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3Dc678957b0c8e964aa6c7=
0fd77641a71e" "=3D"">file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a71e"=
</a>
+
+DEPENDS =3D " \
+    appstream-glib \
+    atk \
+    babl \
+    bzip2 \
+    bison-native \
+    cairo \
+    fontconfig \
+    freetype \
+    gdk-pixbuf-native \
+    gegl \
+    gexiv2 \
+    glib-2.0 \
+    glib-2.0-native \
+    gtk+3 \
+    harfbuzz \
+    iso-codes-native \
+    jpeg \
+    json-glib \
+    lcms \
+    libarchive \
+    libexif \
+    libmypaint \
+    libpng \
+    librsvg \
+    librsvg-native \
+    libxmu \
+    libxslt-native \
+    mypaint-brushes-1.0 \
+    pango \
+    poppler \
+    poppler-data \
+    python3-pygobject-native \
+    tiff \
+    xz \
+    zlib \
+"
+
+DEPENDS:append:libc-musl =3D " libexecinfo"
+
+inherit meson gtk-icon-cache mime-xdg pkgconfig gettext gobject-introspect=
ion vala
+
+GIR_MESON_OPTION =3D 'can-crosscompile-gir'
+VALA_MESON_OPTION =3D "vala"
+VALA_MESON_ENABLE_FLAG =3D "enabled"
+VALA_MESON_DISABLE_FLAG =3D "disabled"
+GIDOCGEN_MESON_OPTION =3D "gi-docgen"
+GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
+GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
+
+SRC_URI =3D "<a href=3D"https://download.gimp.org/gimp/v${@oe.utils.trim_v=
ersion('${PV">https://download.gimp.org/gimp/v${@oe.utils.trim_version('${P=
V</a>}', 2)}/gimp-${PV}.tar.xz"
+SRC_URI +=3D "<a href=3D"file://0001-gimp-cross-compile-fix-for-bz2.patch"=
 "=3D"">file://0001-gimp-cross-compile-fix-for-bz2.patch"</a>
+SRC_URI +=3D "<a href=3D"file://0002-meson.build-reproducibility-fix.patch=
" "=3D"">file://0002-meson.build-reproducibility-fix.patch"</a>
+SRC_URI +=3D "<a href=3D"file://0001-meson.build-dont-check-for-lgi.patch"=
 "=3D"">file://0001-meson.build-dont-check-for-lgi.patch"</a>
+SRC_URI +=3D "<a href=3D"file://0001-meson.build-require-iso-codes-native.=
patch" "=3D"">file://0001-meson.build-require-iso-codes-native.patch"</a>
+SRC_URI[sha256sum] =3D "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0ad=
8cbcbf6ea571a2"
+
+PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
+PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
+PACKAGECONFIG[appdata-test] =3D "-Dappdata-test=3Denabled,-Dappdata-test=
=3Ddisabled,appstream-native"
+PACKAGECONFIG[cairo-pdf] =3D "-Dcairo-pdf=3Denabled,-Dcairo-pdf=3Ddisabled=
"
+PACKAGECONFIG[check-update] =3D "-Dcheck-update=3Dyes,-Dcheck-update=3Dno"
+PACKAGECONFIG[ghostscript] =3D "-Dghostscript=3Denabled,-Dghostscript=3Ddi=
sabled,ghostscript,ghostscript"
+PACKAGECONFIG[gudev] =3D "-Dgudev=3Denabled,-Dgudev=3Ddisabled,libgudev"
+PACKAGECONFIG[heif] =3D "-Dheif=3Denabled,-Dheif=3Ddisabled,libheif"
+PACKAGECONFIG[javascript] =3D "-Djavascript=3Denabled,-Djavascript=3Ddisab=
led,,gjs"
+PACKAGECONFIG[jpeg2000] =3D "-Djpeg2000=3Denabled,-Djpeg2000=3Ddisabled,ja=
sper"
+PACKAGECONFIG[jpeg-xl] =3D "-Djpeg-xl=3Denabled,-Djpeg-xl=3Ddisabled,libjx=
l"
+PACKAGECONFIG[libunwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libun=
wind"
+PACKAGECONFIG[libbacktrace] =3D "-Dlibbacktrace=3Dtrue,-Dlibbacktrace=3Dfa=
lse,libbacktrace"
+PACKAGECONFIG[lua] =3D "-Dlua=3Dtrue,-Dlua=3Dfalse,,luajit lua-lgi"
+PACKAGECONFIG[mng] =3D "-Dmng=3Denabled,-Dmng=3Ddisabled,libmng"
+PACKAGECONFIG[openmp] =3D "-Dopenmp=3Denabled,-Dopenmp=3Ddisabled,gcc-runt=
ime"
+PACKAGECONFIG[vector-icons] =3D "-Dvector-icons=3Dtrue,-Dvector-icons=3Dfa=
lse,librsvg shared-mime-info"
+PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,libwebp"
+PACKAGECONFIG[xcursor] =3D "-Dxcursor=3Denabled,-Dxcursor=3Ddisabled,libxc=
ursor"
+PACKAGECONFIG[x11] =3D "-Dxpm=3Denabled,-Dxpm=3Ddisabled,libxpm libxext li=
bxfixes"
+
+PACKAGECONFIG ?=3D " \
+    alsa \
+    cairo-pdf \
+    ghostscript \
+    gudev \
+    javascript \
+    jpeg2000 \
+    jpeg-xl \
+    lua \
+    mng \
+    webp \
+    <a href=3D"mailto:${@oe.utils.conditional">${@oe.utils.conditional</a>=
('SITEINFO_BITS', '32', '', 'vector-icons', d)} \
+    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('LICE=
NSE_FLAGS_ACCEPTED', 'commercial', 'heif', '', d)} \
+    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DIST=
RO_FEATURES', 'x11', 'x11 xcursor', '', d)} \
+"
+
+PACKAGECONFIG:remove:riscv32 =3D "lua"
+PACKAGECONFIG:remove:riscv64 =3D "lua"
+PACKAGECONFIG:remove:powerpc64 =3D "lua"
+PACKAGECONFIG:remove:powerpc64le =3D "lua"
+
+EXTRA_OEMESON +=3D " \
+    -Dshmem-type=3Dposix \
+    -Dlinux-input=3Denabled \
+    --buildtype release \
+    --cross-file=3D${WORKDIR}/meson-${PN}.cross \
+"
+
+do_write_config:append() {
+    cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF
+[binaries]
+gjs =3D '${bindir}/gjs'
+luajit =3D '${bindir}/luajit'
+EOF
+}
+
+do_configure:append () {
+    sed -i -e "s|build_by_default: true|build_by_default: false|" ${S}/gim=
p-data/images/meson.build
+}
+
+do_install:prepend() {
+    sed -i -e "s|${B}||" ${B}/app/widgets/gimplanguagestore-data.h
+    sed -i -e "s|${B}||" ${B}/plug-ins/file-bmp/huffman.h
+}
+
+FILES:${PN} +=3D "${datadir}/metainfo"
+
+RDEPENDS:${PN} =3D "mypaint-brushes-1.0 glib-networking python3-pygobject"
<div>--=20
</div>2.49.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#116360): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/116360">https://lists.openembedded.org/g/openembed=
ded-devel/message/116360</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111965838/361=
8223">https://lists.openembedded.org/mt/111965838/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-dXIMRWJlP+7TdI5TkSPM--


