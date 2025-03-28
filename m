Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245E5C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 04:38:44 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.4254.1743136720424858363
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 21:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bu3aYvos;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72bf87b8fcbso497961a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 21:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743136719; x=1743741519; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0qonv7wWHIVJuIw8bygg078C3aCptMt+4T86+dvpgY=;
        b=bu3aYvosjw00EsyGv5u6cIXp/ZdIEBSKCHJoaLYk7wmQSsyo62MwGx0lEDxf0O/NQL
         5+0yDxlo+HHGT9z/BH+aDZxmJ42XctzeMyLtgMwBX5MifDha6Dk2BExhVmTqNuJ6ZaLA
         2EQT/GicyH1MbhXE2XbxxJ8r6fBejRQWQjYDixubvZSpcZqkfDCK1+z7lkUS0cmpoafx
         xUKaqdOmE8/7xGuPiBuYo+P6ejua9Fbttgp5dA77k69/dOqzbSUSYR9QA9PKitokA+TS
         2ZbtMopYDqQi2VEe43CuGRoY6XC1jj4mVIrbWYT1e7AlxDAn9ejCS8J3/qZvtxv/CVOW
         K2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743136719; x=1743741519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0qonv7wWHIVJuIw8bygg078C3aCptMt+4T86+dvpgY=;
        b=ospZTk/mCB1znk5JKTh+OfbYd3J8iP9tsnb1kTirdph57Uh4k0hw/xR/uqCRGG/jDy
         kz0NkFhTJW1l3x8haizQiekD/5aExsYTjupHBdAqH/ZO4msXc4Xph9vN3sG1cU3mAevE
         0QNODp4ahGK9MTDXIV7xvImLgUQOxjqP2eHLFeBnwCBvY9GaxcukgUtdjlgd6m4SJ8v7
         177XQZtvvIl2O/u1d6Ryg2+pnTAa05agkcrfxihupntNRQ35AeA7ZPmJId7q6Wd7hB3M
         0Hk7wUj8TansMxq9tUjfAvwYp07M8QRa6jLSasy5On2vao9egey41WtglVWlWMVFxgMh
         IESA==
X-Gm-Message-State: AOJu0YwJIrrBoeg5BnyFAa3c6x3uni1ZVGL1dMKBqkF05iptGhk9DE4U
	1JT02/nIDSXuQ+WEeEdHCPwG3+71nMHKUJOU9XDEPKEX9Wb7cJGBiUSQNl7qIhvoN2PZYTiB7P6
	052Sxa8qW60CejfTZHS8icdT+AWdQAEogfeM=
X-Gm-Gg: ASbGncus287xtKVK+MZiDNOz8aap194U+Mohq3agU4KdTB64/oOrNgyAfNhYjLBmsyE
	eRMhAqZwR1jedHnSEBF4rwSdK1AC6qsHUDBvPR9/0VZaARNLi5oG1WF8sUOg1/AsijPO9ToisUB
	S8WmjiEEx2LPsEuOHooHY4w9nC6+snJZ/exE2+ljIyhQyYjzGQjm+wk442+a6Czfo5CmkZ5w==
X-Google-Smtp-Source: AGHT+IEZ7r5XGjRgywXJkS3Bn6F8ICl1TOwe84qSDmIXsDKGWPRVKdBCoVIY6R0vSIuAAbRLqLfq2Q/n1Jb9EfcseAQ=
X-Received: by 2002:a05:6808:1703:b0:3f6:ab22:4d28 with SMTP id
 5614622812f47-3fefa61cc95mr4016490b6e.32.1743136719022; Thu, 27 Mar 2025
 21:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250328004446.472090-1-f_l_k@t-online.de>
In-Reply-To: <20250328004446.472090-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Mar 2025 21:38:12 -0700
X-Gm-Features: AQ5f1Jrq88lDZRCEO_eo6j_DftDTWaxpvV1gAPf2SwaBE-jTRh6xC2SEwxjmGog
Message-ID: <CAMKF1sqgT=GfbgksvFFKmHuUkbBugVR21f+icV_Apq1wr8sPKg@mail.gmail.com>
Subject: Re: [meta-gnome][PATCHv7] gimp: update 2.10.38 - 3.0.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 04:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116340

Next failure it on musl it looks for backtrace API see

http://0x0.st/8e_L.24457

It should perhaps link with libexecinfo

On Thu, Mar 27, 2025 at 5:44=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> At long last, the first release of GIMP 3.0 is here! This is the end resu=
lt of seven years of hard work
> by volunteer developers, designers, artists, and community members (for r=
eference, GIMP 2.10
> was first published in 2018 and the initial development version of GIMP 3=
.0 was released in 2020).
> With GIMP 3.0 you can do more than ever before, more easily, more quickly=
!
>
> Highlights
>
> - Need to tweak a filter you applied hours ago? New in GIMP 3.0 is non-de=
structive editing for most commonly-used filters. See the changes in real t=
ime with on-canvas preview.
> - Exchange files with more applications, including BC7 DDS files as well =
as better PSD export and many new formats.
> - Don=E2=80=99t know how big to make your drawing? Simply set your paint =
tool to expand layers automatically as needed.
> - Making pro-quality text got easier, too. Style your text, apply outline=
s, shadows, bevels, and more, and you can still edit your text, change font=
 and size, and even tweak the style settings.
> - Organizing your layers has become much easier with the ability to selec=
t multiple items at once, move them or transform them all together!
> - Color Management was again improved, as our long-term project to make G=
IMP an advanced image editor for all usages.
> - Updated graphical toolkit (GTK3) for modern desktop usage.
> - New Wilber logo!
>
> https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_type=3Dtag=
s
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...irst-line-of-compiler-version-string.patch |  30 ----
>  ...f-load-fix-mismatching-variable-type.patch |  24 ----
>  .../0001-gimp-cross-compile-fix-for-bz2.patch |  30 ++++
>  ...1-gimptool-allow-default-CC-override.patch |  85 -----------
>  ...dd-build-time-library-paths-to-LD_LI.patch |  34 -----
>  .../0001-meson.build-dont-check-for-lgi.patch |  35 +++++
>  ...meson.build-require-iso-codes-native.patch |  34 +++++
>  ...001-metadata-shut-up-a-weird-warning.patch |  22 ---
>  ...0002-meson.build-reproducibility-fix.patch |  56 ++++++++
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  | 101 --------------
>  meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb    | 132 ++++++++++++++++++
>  11 files changed, 287 insertions(+), 296 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep=
-first-line-of-compiler-version-string.patch
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load=
-fix-mismatching-variable-type.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-com=
pile-fix-for-bz2.patch
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow=
-default-CC-override.patch
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not=
-add-build-time-library-paths-to-LD_LI.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-do=
nt-check-for-lgi.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-re=
quire-iso-codes-native.patch
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-=
up-a-weird-warning.patch
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-re=
producibility-fix.patch
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-=
line-of-compiler-version-string.patch b/meta-gnome/recipes-gimp/gimp/gimp/0=
001-configure-Keep-first-line-of-compiler-version-string.patch
> deleted file mode 100644
> index 618b4cc7a7..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of=
-compiler-version-string.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 5711ccfab40e304ced7f5be39a4083e3fcecff91 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 24 May 2023 22:22:41 -0700
> -Subject: [PATCH] configure: Keep first line of compiler version string
> -
> -Full output of cc -v may contain additional information which could
> -contain build path information, which is unnessasary
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gimp/-/merge_=
requests/926]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
> --  CC_VERSION=3D"`$CC $CC_VERSION_OPT 2>&1 | sed -e 's/\\\\/\\\\\\\\\\\\=
\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
> -+  CC_VERSION=3D"`$CC $CC_VERSION_OPT 2>&1 | head -1 | sed -e 's/\\\\/\\=
\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
> -   if test $? -eq 0; then
> -     break
> -   fi
> ---
> -2.40.1
> -
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mi=
smatching-variable-type.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-file=
-tiff-load-fix-mismatching-variable-type.patch
> deleted file mode 100644
> index 13b3dda144..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatchi=
ng-variable-type.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From a2458f1528e5733574bb26ff5452b1329116e6db Mon Sep 17 00:00:00 2001
> -From: Simon Budig <simon@budig.de>
> -Date: Sat, 20 May 2023 18:40:41 +0200
> -Subject: [PATCH] file-tiff-load: fix mismatching variable type
> -
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
a2458f1528e5733574bb26ff5452b1329116e6db]
> -Signed-off-by: Khem Raj <raj.khem@gmai.com>
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
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fi=
x-for-bz2.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile=
-fix-for-bz2.patch
> new file mode 100644
> index 0000000000..721225c8b3
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-b=
z2.patch
> @@ -0,0 +1,30 @@
> +From a7e40e19d17404cf5ec4135fc1becd5a90f5e1e1 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Wed, 25 Dec 2024 07:27:04 +0100
> +Subject: [PATCH] gimp: cross-compile fix for bz2
> +
> +autotools bzip2 build does not create pkgconfig files so looking for the=
 dependency fails.
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Upstream-Status: Inappropriate [can probably be removed once bzip2 is bu=
ilt with meson or cmake]
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
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-defaul=
t-CC-override.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow=
-default-CC-override.patch
> deleted file mode 100644
> index b04a16cec7..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-ov=
erride.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -From 7e5b986cb7797a6535fe2471b9a5fb7c00821f51 Mon Sep 17 00:00:00 2001
> -From: Yoann Congal <yoann.congal@smile.fr>
> -Date: Sun, 13 Oct 2024 01:00:10 +0200
> -Subject: [PATCH] gimptool: allow default CC override
> -
> -From: Yoann Congal <yoann.congal@smile.fr>
> -
> -In OE, CC contains sysroot path. Storing CC in binary then leads to
> -non-reproducibility.
> -
> -This commit add a new configure option "--with-default-cc=3D'cmd'" for
> -force the CC stored in gimptool to a reproducible value.
> -
> -Upstream-Status: Inappropriate [does not apply on master (upstream has m=
oved to meson)]
> -Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
> -       -DMANDIR=3D\""$(mandir)"\"                                \
> -       -DGIMPPLUGINDIR=3D\""$(gimpplugindir)"\"                  \
> -       -DGIMPDATADIR=3D\""$(gimpdatadir)"\"                      \
> --      -DCC=3D\""$(CC)"\"                                        \
> -+      -DDEFAULT_CC=3D\""@DEFAULT_CC@"\"                         \
> -       -DGIMPDIR=3D\""$(gimpdir)"\"                              \
> -       -DGIMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\"      \
> -       -I$(top_srcdir)                                         \
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
> -+AC_ARG_WITH(default-cc, [ --with-default-cc=3D"cmd" default CC to print=
 in gimptool (default=3DCC)])
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
> -       -DMANDIR=3D\""$(mandir)"\"                                \
> -       -DGIMPPLUGINDIR=3D\""$(gimpplugindir)"\"                  \
> -       -DGIMPDATADIR=3D\""$(gimpdatadir)"\"                      \
> --      -DCC=3D\""$(CC)"\"                                        \
> -+      -DDEFAULT_CC=3D\""@DEFAULT_CC@"\"                         \
> -       -DGIMPDIR=3D\""$(gimpdir)"\"                              \
> -       -DGIMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\"      \
> -       -I$(top_srcdir)                                         \
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
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-bu=
ild-time-library-paths-to-LD_LI.patch b/meta-gnome/recipes-gimp/gimp/gimp/0=
001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
> deleted file mode 100644
> index cec0055284..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-tim=
e-library-paths-to-LD_LI.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From c720df90dfe3a3e92e34bfb36a04cc792064a501 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
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
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - ltmain.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/ltmain.sh b/ltmain.sh
> -index 134902c..068d74a 100644
> ---- a/ltmain.sh
> -+++ b/ltmain.sh
> -@@ -5748,7 +5748,7 @@ func_exec_program ()
> -       if test yes =3D "$shlibpath_overrides_runpath" && test -n "$shlib=
path_var" && test -n "$temp_rpath"; then
> -         $ECHO "\
> -     # Add our own library path to $shlibpath_var
> --    $shlibpath_var=3D\"$temp_rpath\$$shlibpath_var\"
> -+    $shlibpath_var=3D\"$shlibpath_var\"
> -
> -     # Some systems cannot cope with colon-terminated $shlibpath_var
> -     # The second colon is a workaround for a bug in BeOS R4 sed
> ---
> -2.40.1
> -
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-chec=
k-for-lgi.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-c=
heck-for-lgi.patch
> new file mode 100644
> index 0000000000..63a9159a43
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-check-for-l=
gi.patch
> @@ -0,0 +1,35 @@
> +From e56a6330f1e29e489601ea3e7cb31bfd2ebb787a Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Thu, 27 Mar 2025 21:02:22 +0100
> +Subject: [PATCH] meson.build: dont check for lgi
> +
> +Checking if host can run lgi is pointless for cross-compile
> +Set to be always true because we ensure to install lgi via PACKAGECONFIG
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
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
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-i=
so-codes-native.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-=
require-iso-codes-native.patch
> new file mode 100644
> index 0000000000..c91b25a914
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-iso-code=
s-native.patch
> @@ -0,0 +1,34 @@
> +From 8ccd12d6ec3330e9646ae9db6fd491226d516dc3 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Fri, 28 Mar 2025 01:33:00 +0100
> +Subject: [PATCH] meson.build: require iso-codes-native
> +
> +This fixes:
> +FAILED: app/widgets/gimplanguagestore-data.h
> +/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/gimp/3.0.2/buil=
d/tools/gen-languages
> +gimp_language_store_parser_init: 0.006277 seconds
> +ERROR: parse_iso_codes: error parsing '/usr/share/xml/iso-codes/iso_639_=
3.xml': No such file or directory
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index efbc2d8175..fd050f4d3c 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1135,7 +1135,7 @@ endif
> + #######################################################################=
#########
> + # ISO codes
> +
> +-isocodes =3D dependency('iso-codes', required: false)
> ++isocodes =3D dependency('iso-codes', required: false, native: true)
> + if isocodes.found()
> +   isocodes_prefix =3D isocodes.get_variable(pkgconfig: 'prefix')
> +   isocodes_location =3D isocodes_prefix / 'share' / 'xml' / 'iso-codes'
> +--
> +2.49.0
> +
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-we=
ird-warning.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up=
-a-weird-warning.patch
> deleted file mode 100644
> index 4f04ac8250..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-war=
ning.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -From 51311f913d9f417d121f59b83d560c7b4b853d1c Mon Sep 17 00:00:00 2001
> -From: Simon Budig <simon@budig.de>
> -Date: Sat, 20 May 2023 22:25:40 +0200
> -Subject: [PATCH] metadata: shut up a weird warning
> -
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
51311f913d9f417d121f59b83d560c7b4b853d1c]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
> --                              if (! g_strv_contains (values, equiv_valu=
es[evi]))
> -+                              if (! g_strv_contains ((const gchar * con=
st *) values, equiv_values[evi]))
> -                                 {
> -                                   gchar *tmpvalue;
> -
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproduci=
bility-fix.patch b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-repro=
ducibility-fix.patch
> new file mode 100644
> index 0000000000..532715d588
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-=
fix.patch
> @@ -0,0 +1,56 @@
> +From bf19c5687703769e406a8086036d4ed6421c33cb Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 13 Jan 2025 10:04:33 +0100
> +Subject: [PATCH] meson.build: reproducibility fix
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
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
> +   # See: https://github.com/mesonbuild/meson/issues/6174
> +-  if cc_cmd.returncode() =3D=3D 0
> +-    cc_version =3D cc_cmd.stdout() + cc_cmd.stderr()
> +-  endif
> +-else
> ++#  if cc_cmd.returncode() =3D=3D 0
> ++#    cc_version =3D cc_cmd.stdout() + cc_cmd.stderr()
> ++#  endif
> ++#else
> +   # Various compilers have various options. Try most common ones. This
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
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/re=
cipes-gimp/gimp/gimp_2.10.38.bb
> deleted file mode 100644
> index 0272e05e96..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> +++ /dev/null
> @@ -1,101 +0,0 @@
> -SUMMARY =3D "The GIMP is the GNU Image Manipulation Program"
> -HOMEPAGE =3D "http://www.gimp.org"
> -SECTION =3D "x11/graphics"
> -LICENSE =3D "GPL-3.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a=
71e"
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
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', =
d)} \
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
> -SRC_URI =3D "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2=
 \
> -           file://0001-configure-Keep-first-line-of-compiler-version-str=
ing.patch \
> -           file://0001-libtool-Do-not-add-build-time-library-paths-to-LD=
_LI.patch \
> -           file://0001-file-tiff-load-fix-mismatching-variable-type.patc=
h \
> -           file://0001-metadata-shut-up-a-weird-warning.patch \
> -           file://0001-gimptool-allow-default-CC-override.patch \
> -           "
> -SRC_URI[sha256sum] =3D "50a845eec11c8831fe8661707950f5b8446e35f30edfb9ac=
f98f85c1133f856e"
> -
> -EXTRA_OECONF =3D "--disable-python \
> -                --without-webkit \
> -                --disable-check-update \
> -                --without-wmf"
> -
> -EXTRA_OECONF +=3D "${@oe.utils.conditional('SITEINFO_BITS', '32', ' --di=
sable-vector-icons', '', d)}"
> -
> -do_configure:append() {
> -    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
> -    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAG=
ING_INCDIR}':g
> -}
> -
> -do_compile:prepend() {
> -    # Let native babl/gegl find their plugins
> -    export BABL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name =
'babl-*'`
> -    export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name =
'gegl-*'`
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
> -    CC_WITHOUT_SYSROOT =3D shlex.join(filter(lambda x: not x.startswith(=
"--sysroot=3D"), shlex.split(d.getVar("CC"))))
> -    d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT)
> -}
> -EXTRA_OECONF +=3D "--with-default-cc=3D'${CC_WITHOUT_SYSROOT}'"
> -
> -# Split gimptool in its own package
> -PACKAGE_BEFORE_PN +=3D "${PN}-gimptool"
> -FILES:${PN}-gimptool +=3D "${bindir}/gimptool-2.0"
> -
> -# gimptool depends on gimp .pc file being installed and tools to build t=
he plugin.
> -RDEPENDS:${PN}-gimptool +=3D "${PN}-dev packagegroup-core-buildessential=
"
> -INSANE_SKIP:${PN}-gimptool +=3D "dev-deps"
> -
> -
> -CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform: This only applie=
s for Mandriva Linux"
> -CVE_STATUS[CVE-2009-0581] =3D "cpe-incorrect: The current version (2.10.=
38) is not affected."
> -CVE_STATUS[CVE-2009-0723] =3D "cpe-incorrect: The current version (2.10.=
38) is not affected."
> -CVE_STATUS[CVE-2009-0733] =3D "cpe-incorrect: The current version (2.10.=
38) is not affected."
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.2.bb
> new file mode 100644
> index 0000000000..2018ea04c4
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
> @@ -0,0 +1,132 @@
> +SUMMARY =3D "The GIMP is the GNU Image Manipulation Program"
> +HOMEPAGE =3D "http://www.gimp.org"
> +SECTION =3D "graphics"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a=
71e"
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
> +inherit meson gtk-icon-cache mime-xdg pkgconfig gettext gobject-introspe=
ction vala
> +
> +GIR_MESON_OPTION =3D 'can-crosscompile-gir'
> +VALA_MESON_OPTION =3D "vala"
> +VALA_MESON_ENABLE_FLAG =3D "enabled"
> +VALA_MESON_DISABLE_FLAG =3D "disabled"
> +GIDOCGEN_MESON_OPTION =3D "gi-docgen"
> +GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
> +GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
> +
> +SRC_URI =3D "https://download.gimp.org/gimp/v${@oe.utils.trim_version('$=
{PV}', 2)}/gimp-${PV}.tar.xz"
> +SRC_URI +=3D "file://0001-gimp-cross-compile-fix-for-bz2.patch"
> +SRC_URI +=3D "file://0002-meson.build-reproducibility-fix.patch"
> +SRC_URI +=3D "file://0001-meson.build-dont-check-for-lgi.patch"
> +SRC_URI +=3D "file://0001-meson.build-require-iso-codes-native.patch"
> +SRC_URI[sha256sum] =3D "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0=
ad8cbcbf6ea571a2"
> +
> +PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
> +PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
> +PACKAGECONFIG[appdata-test] =3D "-Dappdata-test=3Denabled,-Dappdata-test=
=3Ddisabled,appstream-native"
> +PACKAGECONFIG[cairo-pdf] =3D "-Dcairo-pdf=3Denabled,-Dcairo-pdf=3Ddisabl=
ed"
> +PACKAGECONFIG[check-update] =3D "-Dcheck-update=3Dyes,-Dcheck-update=3Dn=
o"
> +PACKAGECONFIG[ghostscript] =3D "-Dghostscript=3Denabled,-Dghostscript=3D=
disabled,ghostscript,ghostscript"
> +PACKAGECONFIG[gudev] =3D "-Dgudev=3Denabled,-Dgudev=3Ddisabled,libgudev"
> +PACKAGECONFIG[heif] =3D "-Dheif=3Denabled,-Dheif=3Ddisabled,libheif"
> +PACKAGECONFIG[javascript] =3D "-Djavascript=3Denabled,-Djavascript=3Ddis=
abled,,gjs"
> +PACKAGECONFIG[jpeg2000] =3D "-Djpeg2000=3Denabled,-Djpeg2000=3Ddisabled,=
jasper"
> +PACKAGECONFIG[jpeg-xl] =3D "-Djpeg-xl=3Denabled,-Djpeg-xl=3Ddisabled,lib=
jxl"
> +PACKAGECONFIG[libunwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,lib=
unwind"
> +PACKAGECONFIG[libbacktrace] =3D "-Dlibbacktrace=3Dtrue,-Dlibbacktrace=3D=
false,libbacktrace"
> +PACKAGECONFIG[lua] =3D "-Dlua=3Dtrue,-Dlua=3Dfalse,,luajit lua-lgi"
> +PACKAGECONFIG[mng] =3D "-Dmng=3Denabled,-Dmng=3Ddisabled,libmng"
> +PACKAGECONFIG[openmp] =3D "-Dopenmp=3Denabled,-Dopenmp=3Ddisabled,gcc-ru=
ntime"
> +PACKAGECONFIG[vector-icons] =3D "-Dvector-icons=3Dtrue,-Dvector-icons=3D=
false,librsvg shared-mime-info"
> +PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,libwebp"
> +PACKAGECONFIG[xcursor] =3D "-Dxcursor=3Denabled,-Dxcursor=3Ddisabled,lib=
xcursor"
> +PACKAGECONFIG[x11] =3D "-Dxpm=3Denabled,-Dxpm=3Ddisabled,libxpm libxext =
libxfixes"
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
> +    ${@oe.utils.conditional('SITEINFO_BITS', '32', '', 'vector-icons', d=
)} \
> +    ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'heif',=
 '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcursor', '', d)=
} \
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
> +    sed -i -e "s|build_by_default: true|build_by_default: false|" ${S}/g=
imp-data/images/meson.build
> +}
> +
> +do_install:prepend() {
> +    sed -i -e "s|${B}||" ${B}/app/widgets/gimplanguagestore-data.h
> +    sed -i -e "s|${B}||" ${B}/plug-ins/file-bmp/huffman.h
> +}
> +
> +FILES:${PN} +=3D "${datadir}/metainfo"
> +
> +RDEPENDS:${PN} =3D "mypaint-brushes-1.0 glib-networking python3-pygobjec=
t"
> --
> 2.49.0
>

