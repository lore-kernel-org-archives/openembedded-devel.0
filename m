Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F24D232E9
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 07:15:16 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5487.1767942907587858520
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 23:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOKlFmew;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78e7ba9fc29so44462447b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 23:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767942907; x=1768547707; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eX1frRdMtWFbeRImMhz8vjFvAqukb+K1CHTTWL2iTqY=;
        b=AOKlFmew58qFtEij+s5Hy84XW/ysjeWQAsR6fvdv5VlDegwXaPjwLV84auFXShZotD
         pZ+QRz19/+ZOhLMiy1xP8hnoEp/3KlF1qgBQQLFrKl97KsWXVOS1DDWiJ55cwQhyRZAr
         nSlf7sera3OQSg2gXMv+wVBPuUFdaAjQwmDdhqeQlkFNhYp1zNRPQELIAuv21H6x5jxT
         zpGEi7JXCd2lR/2QxHw3uLqRM5w9tBlm5BQkYMEcoPD68WP3XrNwEYKxdw1djzKRZm9p
         cSFxKmfx6czmgy7ZVQTBbYpU1Ap7TU4NDlxC24HAMgUqrlk9mWDTlVbOi85sHsN81ca6
         lPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767942907; x=1768547707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eX1frRdMtWFbeRImMhz8vjFvAqukb+K1CHTTWL2iTqY=;
        b=uxgBKvfC3qqOlpZBCA7zodzC1PRVwSHdB37ofqYncrNcDmgsUgvKFG4XyOQq+J2PZO
         6Fdc9lP3tJ+UD865QRvJPfbgoUXPS2QOqw6fGYdszyokencOJBmq9NwqfkRbJDBxrhU6
         wx+/TlETSZSZ27e57Sdt9tJldW+MZbSvSz4HXkxHJPSBc4jd2TXmDxBfyEncPoinuWrN
         jdeQdBFoJ6265zrPA5AweCRRYRnrpSaygn+Cb2fdRtaT4b5hOVX+q+UirqbQxiB3BbcQ
         JsevaG7g+kXn2iS6SewPI9TnbyZ75jbJOobbjlzoN/IqNb1wWItzrrxYa4tirrf15isf
         eT/g==
X-Gm-Message-State: AOJu0YyHyHmiCxRPO/zEYhDR5Us4xaa90BZ8IQHIsZiTPtNfkBSHFoCO
	b+1Sqp35fkXGJdcWrDFx+4iSDj50gZyjHtBB+j0HvLX2Bu9J64NQeXZnflhcEDOKPRndEXZC73f
	+6qtzbKeeRUIKHjwE8VKpBP6hDxpZfrk=
X-Gm-Gg: AY/fxX58HEEYTSjFSK7SfjEhd8f48kDjCB0YVl+pyPuntkpdbCApPhPXYEeFYKNHFAX
	8B7mIdILdDlsHuDdQUI2nnyjvK1BrIOG9cOwsPYyPuGyKbJvqPLWrBjqVagfM/qW5FOchd2DkvG
	Bo0rydBTFMBVdFP2wv5lK6iGWxBToeM0UEz9biwsGsnDhDFjD52/mbfwoLDeQQEJAaM3Cb6dV+j
	BmtkoQjW+CKgiYx27Ypbfde1XnY1rBVksnV0bhTKc/uTq1I/U1xqqAjiWmqCpQjOhs/KSZTg8nP
	DsK6xL00Th9kyS2aj+e2Fbufi/qIpkJ5DU2RyJ7E0y6dcLK5GSP/dGWQdKK3mmJ07dBIALpUuAb
	q7Xnu7TsdeDTncj3u6f4rIHCOBJt5BFIYrto56Oz6U/QC3Q==
X-Google-Smtp-Source: AGHT+IFOXucJQMDraKBOI2b+H4E0TBry3PXXtEEg6zNz9nUXRAeJeBppEzvqg+T4fHF38rfZYhs+xKNNCEFNQmFFp50=
X-Received: by 2002:a05:690e:1481:b0:646:e350:6f88 with SMTP id
 956f58d0204a3-64716bd6e9amr6871172d50.26.1767942906420; Thu, 08 Jan 2026
 23:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20260108115545.2793869-1-f_l_k@t-online.de>
In-Reply-To: <20260108115545.2793869-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jan 2026 23:14:40 -0800
X-Gm-Features: AQt7F2p6wnCv2R9fWbleEIwsWXxbFfrGUoas8xMA9K4BqMLtlgQx16JEqb165jM
Message-ID: <CAMKF1srLVnTP98whn8wKPvKiXjsUJYZS5=xKUHT9d1i2Ad2n6Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libcanberra: update 0.30 -> 0.30-19
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eba3780647ef48bc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 07:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123276

--000000000000eba3780647ef48bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems to end with

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4882290/raw_inlin=
e

On Thu, Jan 8, 2026 at 3:56=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Lennart Poettering stopped maintaining libcanberra over a decade ago but
> it is still
> maintained by the debian gnome-team.
>
> Most notable improvement is that building the libcanberra-gtk3-module
> doesn't depend
> on gtk2 anymore and thus libcanberra isn't dependent on x11 to build
> support for gtk3
>
> - fetch source from salsa.debian.org, use git for it
> - remove outdated patches
> - dont build gtk+ module by default anymore
> - simplify packaging
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...d-gtk3-version-for-canberra_gtk_play.patch | 94 -------------------
>  ...-all-GdkDisplays-are-GdkX11Displays-.patch | 65 -------------
>  .../files/0001-remove-dropped-templates.patch | 65 -------------
>  .../libcanberra/libcanberra_0.30-19.bb        | 47 ++++++++++
>  .../libcanberra/libcanberra_0.30.bb           | 64 -------------
>  5 files changed, 47 insertions(+), 288 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version=
-for-canberra_gtk_play.patch
>  delete mode 100644
> meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkDi=
splays-are-GdkX11Displays-.patch
>  delete mode 100644
> meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-templates.p=
atch
>  create mode 100644 meta-oe/recipes-support/libcanberra/
> libcanberra_0.30-19.bb
>  delete mode 100644 meta-oe/recipes-support/libcanberra/
> libcanberra_0.30.bb
>
> diff --git
> a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-versi=
on-for-canberra_gtk_play.patch
> b/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-versi=
on-for-canberra_gtk_play.patch
> deleted file mode 100644
> index 89f31f7946..0000000000
> ---
> a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-versi=
on-for-canberra_gtk_play.patch
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -From 4a89ddffbb14d747adbe3365ace4db87de52ba39 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Mon, 16 Sep 2013 16:08:28 +0200
> -Subject: [PATCH] build gtk- and gtk3-version for canberra_gtk_play
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> -Upstream-Status: Pending
> -
> - src/Makefile.am |   25 +++++++++++++++----------
> - 1 files changed, 15 insertions(+), 10 deletions(-)
> -
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index 56ed96d..fc72e1f 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -319,9 +319,6 @@ endif
> -
> - if HAVE_GTK_ANY
> -
> --bin_PROGRAMS +=3D \
> --      canberra-gtk-play
> --
> - include_HEADERS +=3D \
> -       canberra-gtk.h
> -
> -@@ -329,6 +326,9 @@ endif
> -
> - if HAVE_GTK3
> -
> -+bin_PROGRAMS +=3D \
> -+      canberra-gtk3-play
> -+
> - lib_LTLIBRARIES +=3D \
> -       libcanberra-gtk3.la
> -
> -@@ -367,6 +367,9 @@ endif
> -
> - if HAVE_GTK
> -
> -+bin_PROGRAMS +=3D \
> -+      canberra-gtk-play
> -+
> - lib_LTLIBRARIES +=3D \
> -       libcanberra-gtk.la
> -
> -@@ -399,14 +402,17 @@ endif
> -
> - if HAVE_GTK3
> -
> --canberra_gtk_play_LDADD =3D \
> -+canberra_gtk3_play_LDADD =3D \
> -       $(GTK3_LIBS) \
> -       libcanberra.la \
> -       libcanberra-gtk3.la
> --canberra_gtk_play_CFLAGS =3D \
> -+canberra_gtk3_play_CFLAGS =3D \
> -       $(GTK3_CFLAGS)
> -
> --else
> -+canberra_gtk3_play_SOURCES =3D \
> -+      canberra-gtk-play.c
> -+
> -+endif
> - if HAVE_GTK
> -
> - canberra_gtk_play_LDADD =3D \
> -@@ -416,7 +422,9 @@ canberra_gtk_play_LDADD =3D \
> - canberra_gtk_play_CFLAGS =3D \
> -       $(GTK_CFLAGS)
> -
> --endif
> -+canberra_gtk_play_SOURCES =3D \
> -+      canberra-gtk-play.c
> -+
> - endif
> -
> - if HAVE_GTK_ANY
> -@@ -424,9 +432,6 @@ if HAVE_GTK_ANY
> - dist_gsdgtkmodules_DATA =3D \
> -       canberra-gtk-module.desktop
> -
> --canberra_gtk_play_SOURCES =3D \
> --      canberra-gtk-play.c
> --
> - EXTRA_DIST +=3D \
> -       libcanberra-login-sound.desktop.in \
> -       libcanberra-ready-sound.desktop.in \
> ---
> -1.7.6.5
> -
> diff --git
> a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-Gdk=
Displays-are-GdkX11Displays-.patch
> b/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-Gdk=
Displays-are-GdkX11Displays-.patch
> deleted file mode 100644
> index 1e45441ff9..0000000000
> ---
> a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-Gdk=
Displays-are-GdkX11Displays-.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From c0620e432650e81062c1967cc669829dbd29b310 Mon Sep 17 00:00:00 2001
> -From: Michael Meeks <michael.meeks@suse.com>
> -Date: Fri, 9 Nov 2012 16:16:40 +0000
> -Subject: [PATCH] gtk: Don't assume all GdkDisplays are GdkX11Displays:
> - broadway/wayland
> -
> ----
> -Upstream-Status: Pending
> -
> - src/canberra-gtk-module.c | 15 +++++++++++++++
> - src/canberra-gtk.c        |  5 +++++
> - 2 files changed, 20 insertions(+)
> -
> ---- a/src/canberra-gtk-module.c
> -+++ b/src/canberra-gtk-module.c
> -@@ -307,6 +307,11 @@ static gint window_get_desktop(GdkDispla
> -         guchar *data =3D NULL;
> -         gint ret =3D -1;
> -
> -+#ifdef GDK_IS_X11_DISPLAY
> -+        if (!GDK_IS_X11_DISPLAY(d))
> -+                return 0;
> -+#endif
> -+
> -         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d),
> GDK_WINDOW_XID(w),
> -                                gdk_x11_get_xatom_by_name_for_display(d,
> "_NET_WM_DESKTOP"),
> -                                0, G_MAXLONG, False, XA_CARDINAL,
> &type_return,
> -@@ -335,6 +340,11 @@ static gint display_get_desktop(GdkDispl
> -         guchar *data =3D NULL;
> -         gint ret =3D -1;
> -
> -+#ifdef GDK_IS_X11_DISPLAY
> -+        if (!GDK_IS_X11_DISPLAY(d))
> -+                return 0;
> -+#endif
> -+
> -         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d),
> DefaultRootWindow(GDK_DISPLAY_XDISPLAY(d)),
> -                                gdk_x11_get_xatom_by_name_for_display(d,
> "_NET_CURRENT_DESKTOP"),
> -                                0, G_MAXLONG, False, XA_CARDINAL,
> &type_return,
> -@@ -365,6 +375,11 @@ static gboolean window_is_xembed(GdkDisp
> -         gboolean ret =3D FALSE;
> -         Atom xembed;
> -
> -+#ifdef GDK_IS_X11_DISPLAY
> -+        if (!GDK_IS_X11_DISPLAY(d))
> -+                return FALSE;
> -+#endif
> -+
> -         /* Gnome Panel applets are XEMBED windows. We need to make sure
> we
> -          * ignore them */
> -
> ---- a/src/canberra-gtk.c
> -+++ b/src/canberra-gtk.c
> -@@ -185,6 +185,11 @@ static gint window_get_desktop(GdkDispla
> -         guchar *data =3D NULL;
> -         gint ret =3D -1;
> -
> -+#ifdef GDK_IS_X11_DISPLAY
> -+        if (!GDK_IS_X11_DISPLAY(d))
> -+                return 0;
> -+#endif
> -+
> -         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d),
> GDK_WINDOW_XID(w),
> -                                gdk_x11_get_xatom_by_name_for_display(d,
> "_NET_WM_DESKTOP"),
> -                                0, G_MAXLONG, False, XA_CARDINAL,
> &type_return,
> diff --git
> a/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-templates=
.patch
> b/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-templates=
.patch
> deleted file mode 100644
> index 57f5486084..0000000000
> ---
> a/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-templates=
.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From dfd3ef4caac300f517f8eeb378f0b0f9ba6a9b06 Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Tue, 15 Aug 2023 15:41:03 +0200
> -Subject: [PATCH] remove dropped gtkdoc templates
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> -
> -Upstream-Status: Pending
> ----
> ---- a/gtkdoc/gtk-doc.make      2011-08-25 23:20:22.000000000 +0200
> -+++ b/gtkdoc/gtk-doc.make      2023-08-15 18:08:02.430729073 +0200
> -@@ -33,9 +33,9 @@
> -       $(HTML_IMAGES)                  \
> -       $(SETUP_FILES)
> -
> --DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp tmpl-build.stamp
> sgml-build.stamp \
> -+DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp sgml-build.stamp \
> -       html-build.stamp pdf-build.stamp \
> --      tmpl.stamp sgml.stamp html.stamp pdf.stamp
> -+      sgml.stamp html.stamp pdf.stamp
> -
> - SCANOBJ_FILES =3D                \
> -       $(DOC_MODULE).args       \
> -@@ -120,27 +120,12 @@
> - $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt
> $(DOC_MODULE)-overrides.txt: scan-build.stamp
> -       @true
> -
> --#### templates ####
> --
> --tmpl-build.stamp: setup-build.stamp $(DOC_MODULE)-decl.txt
> $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
> --      @echo '  DOC   Rebuilding template files'
> --      @gtkdoc-mktmpl --module=3D$(DOC_MODULE) $(MKTMPL_OPTIONS)
> --      @if test "$(abs_srcdir)" !=3D "$(abs_builddir)" ; then \
> --        if test -w $(abs_srcdir) ; then \
> --          cp -rp $(abs_builddir)/tmpl $(abs_srcdir)/; \
> --        fi \
> --      fi
> --      @touch tmpl-build.stamp
> --
> --tmpl.stamp: tmpl-build.stamp
> --      @true
> --
> - $(srcdir)/tmpl/*.sgml:
> -       @true
> -
> - #### xml ####
> -
> --sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt
> $(srcdir)/tmpl/*.sgml $(expand_content_files)
> -+sgml-build.stamp: $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml
> $(expand_content_files)
> -       @echo '  DOC   Building XML'
> -       @-chmod -R u+w $(srcdir)
> -       @_source_dir=3D'' ; \
> - --- a/gtkdoc/Makefile.am      2009-01-21 21:52:46.000000000 +0100
> -+++ b/gtkdoc/Makefile.am       2023-08-15 17:41:59.002498772 +0200
> -@@ -31,10 +31,6 @@
> - # e.g. MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml
> - MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml
> -
> --# Extra options to supply to gtkdoc-mktmpl
> --# e.g. MKTMPL_OPTIONS=3D--only-section-tmpl
> --MKTMPL_OPTIONS=3D
> --
> - # Extra options to supply to gtkdoc-fixref. Not normally needed.
> - # e.g. FIXXREF_OPTIONS=3D--extra-dir=3D../gdk-pixbuf/html
> --extra-dir=3D../gdk/html
> - FIXXREF_OPTIONS=3D
> diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
> b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
> new file mode 100644
> index 0000000000..b7eb50e463
> --- /dev/null
> +++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
> @@ -0,0 +1,47 @@
> +SUMMARY =3D "Implementation of XDG Sound Theme and Name Specifications"
> +DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound Theme
> and Name Specifications, for generating event sounds on free desktops."
> +LICENSE =3D "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1=
 \
> +
> file://src/canberra.h;beginline=3D7;endline=3D24;md5=3Dc616c687cf8da540a1=
4f917e0d23ab03"
> +
> +DEPENDS =3D "libtool libvorbis"
> +
> +inherit autotools gtk-doc
> +
> +SRC_URI =3D " \
> +    git://
> salsa.debian.org/gnome-team/libcanberra;protocol=3Dhttps;branch=3Ddebian/=
latest;tag=3Ddebian/${PV}
> <http://salsa.debian.org/gnome-team/libcanberra;protocol=3Dhttps;branch=
=3Ddebian/latest;tag=3Ddebian/$%7BPV%7D>
> \
> +    file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch \
> +"
> +SRCREV =3D "d1ed1ac0c9950ed3908c04abb7c4a6de5c51ed94"
> +
> +EXTRA_OECONF =3D "\
> +    --enable-null \
> +    --disable-oss \
> +    --disable-tdb \
> +    --disable-lynx \
> +"
> +
> +PACKAGECONFIG ??=3D " \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
> +       ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk3
> gstreamer', '', d)} \
> +"
> +PACKAGECONFIG[alsa] =3D "--enable-alsa, --disable-alsa, alsa-lib"
> +PACKAGECONFIG[pulseaudio] =3D "--enable-pulse, --disable-pulse, pulseaud=
io"
> +PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer, --disable-gstreamer,
> gstreamer1.0"
> +PACKAGECONFIG[gtk] =3D "--enable-gtk, --disable-gtk, gtk+"
> +PACKAGECONFIG[gtk3] =3D "--enable-gtk3, --disable-gtk3, gtk+3"
> +
> +FILES:${PN} +=3D " \
> +       ${systemd_system_unitdir} \
> +       ${libdir}/gtk-2.0 \
> +       ${libdir}/gtk-3.0 \
> +       ${libdir}/gnome-settings-daemon-3.0 \
> +       ${libdir}/libcanberra-0.30 \
> +       ${datadir}/gdm \
> +       ${datadir}/gnome \
> +"
> +FILES:${PN}-dev +=3D "${datadir}/vala"
> +
> +# libcanberra-gtk3-module.so ships a symlink to libcanberra-gtk-module.s=
o
> +INSANE_SKIP:${PN} =3D "dev-so"
> +
> diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
> b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
> deleted file mode 100644
> index 7eac53ae90..0000000000
> --- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -SUMMARY =3D "Implementation of XDG Sound Theme and Name Specifications"
> -DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound Theme
> and Name Specifications, for generating event sounds on free desktops."
> -LICENSE =3D "LGPL-2.1-or-later"
> -LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1=
 \
> -
> file://src/canberra.h;beginline=3D7;endline=3D24;md5=3Dc616c687cf8da540a1=
4f917e0d23ab03"
> -
> -DEPENDS =3D "libtool libvorbis"
> -
> -inherit autotools gtk-doc
> -
> -SRC_URI =3D " \
> -    http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz \
> -    file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch \
> -
> file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch \
> -    file://0001-remove-dropped-templates.patch \
> -    file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch \
> -"
> -SRC_URI[sha256sum] =3D
> "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72"
> -
> -EXTRA_OECONF =3D "\
> -    --enable-null \
> -    --disable-oss \
> -    --disable-tdb \
> -    --disable-lynx \
> -"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa
> pulseaudio', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk
> gtk3', '', d)} \
> -"
> -PACKAGECONFIG[alsa] =3D "--enable-alsa, --disable-alsa, alsa-lib"
> -PACKAGECONFIG[pulseaudio] =3D "--enable-pulse, --disable-pulse, pulseaud=
io"
> -PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer, --disable-gstreamer,
> gstreamer1.0"
> -PACKAGECONFIG[gtk] =3D "--enable-gtk, --disable-gtk, gtk+"
> -PACKAGECONFIG[gtk3] =3D "--enable-gtk3, --disable-gtk3, gtk+3"
> -
> -python populate_packages:prepend() {
> -    plugindir =3D d.expand('${libdir}/${BPN}-${PV}/')
> -    do_split_packages(d, plugindir, r'^libcanberra-(.*)\.so$',
> 'libcanberra-%s', '%s support library', extra_depends=3D'' )
> -    do_split_packages(d, plugindir, r'^libcanberra-(.*)\.la$',
> 'libcanberra-%s', '%s support library', extra_depends=3D'' )
> -}
> -
> -PACKAGES =3D+ "${PN}-gnome ${PN}-gtk2 ${PN}-gtk3 ${PN}-systemd"
> -PACKAGES_DYNAMIC +=3D "^libcanberra-.*"
> -
> -FILES:${PN} =3D "${bindir}/ ${libdir}/${BPN}.so.*"
> -
> -FILES:${PN}-dev +=3D "${datadir}/vala/vapi ${libdir}/*/modules/*.la
> ${libdir}/*/*.la"
> -
> -FILES:${PN}-dbg +=3D "${libdir}/${BPN}-${PV}/.debug
> ${libdir}/gtk-*/modules/.debug"
> -
> -FILES:${PN}-gtk2 =3D "${libdir}/${BPN}-gtk.so.* \
> -                    ${libdir}/gtk-2.0/modules/*.so \
> -                    ${bindir}/canberra-gtk-play"
> -
> -# -gtk3 ships a symlink to a .so
> -INSANE_SKIP:${PN}-gtk3 =3D "dev-so"
> -FILES:${PN}-gtk3 =3D "${libdir}/${BPN}-gtk3.so.* \
> -                    ${libdir}/gtk-3.0/modules/*.so \
> -                    ${bindir}/canberra-gtk3-play"
> -
> -FILES:${PN}-gnome =3D "${libdir}/gnome-settings-daemon-3.0/ \
> -                     ${datadir}/gdm/ ${datadir}/gnome/"
> -
> -FILES:${PN}-systemd =3D "${systemd_unitdir}/system/*.service"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123270):
> https://lists.openembedded.org/g/openembedded-devel/message/123270
> Mute This Topic: https://lists.openembedded.org/mt/117150885/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000eba3780647ef48bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to end with<div><br></div><div><a href=3D"https=
://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4882290/raw_inline">ht=
tps://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4882290/raw_inline<=
/a></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Jan 8, 2026 at 3:56=E2=80=AFAM Marku=
s Volk via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-on=
line.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Lennart Poettering stopped maintaining libcan=
berra over a decade ago but it is still<br>
maintained by the debian gnome-team.<br>
<br>
Most notable improvement is that building the libcanberra-gtk3-module doesn=
&#39;t depend<br>
on gtk2 anymore and thus libcanberra isn&#39;t dependent on x11 to build su=
pport for gtk3<br>
<br>
- fetch source from <a href=3D"http://salsa.debian.org" rel=3D"noreferrer" =
target=3D"_blank">salsa.debian.org</a>, use git for it<br>
- remove outdated patches<br>
- dont build gtk+ module by default anymore<br>
- simplify packaging<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...d-gtk3-version-for-canberra_gtk_play.patch | 94 ------------------=
-<br>
=C2=A0...-all-GdkDisplays-are-GdkX11Displays-.patch | 65 -------------<br>
=C2=A0.../files/0001-remove-dropped-templates.patch | 65 -------------<br>
=C2=A0.../libcanberra/<a href=3D"http://libcanberra_0.30-19.bb" rel=3D"nore=
ferrer" target=3D"_blank">libcanberra_0.30-19.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 47 ++++++++++<br>
=C2=A0.../libcanberra/<a href=3D"http://libcanberra_0.30.bb" rel=3D"norefer=
rer" target=3D"_blank">libcanberra_0.30.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 64 -------------<br>
=C2=A05 files changed, 47 insertions(+), 288 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/libcanberra/files/0001-bui=
ld-gtk-and-gtk3-version-for-canberra_gtk_play.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/libcanberra/files/0001-gtk=
-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/libcanberra/files/0001-rem=
ove-dropped-templates.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libcanberra/<a href=3D"htt=
p://libcanberra_0.30-19.bb" rel=3D"noreferrer" target=3D"_blank">libcanberr=
a_0.30-19.bb</a><br>
=C2=A0delete mode 100644 meta-oe/recipes-support/libcanberra/<a href=3D"htt=
p://libcanberra_0.30.bb" rel=3D"noreferrer" target=3D"_blank">libcanberra_0=
.30.bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-g=
tk3-version-for-canberra_gtk_play.patch b/meta-oe/recipes-support/libcanber=
ra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch<br>
deleted file mode 100644<br>
index 89f31f7946..0000000000<br>
--- a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-ver=
sion-for-canberra_gtk_play.patch<br>
+++ /dev/null<br>
@@ -1,94 +0,0 @@<br>
-From 4a89ddffbb14d747adbe3365ace4db87de52ba39 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:sc=
hnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com<=
/a>&gt;<br>
-Date: Mon, 16 Sep 2013 16:08:28 +0200<br>
-Subject: [PATCH] build gtk- and gtk3-version for canberra_gtk_play<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- src/Makefile.am |=C2=A0 =C2=A025 +++++++++++++++----------<br>
- 1 files changed, 15 insertions(+), 10 deletions(-)<br>
-<br>
-diff --git a/src/Makefile.am b/src/Makefile.am<br>
-index 56ed96d..fc72e1f 100644<br>
---- a/src/Makefile.am<br>
-+++ b/src/Makefile.am<br>
-@@ -319,9 +319,6 @@ endif<br>
- <br>
- if HAVE_GTK_ANY<br>
- <br>
--bin_PROGRAMS +=3D \<br>
--=C2=A0 =C2=A0 =C2=A0 canberra-gtk-play<br>
--<br>
- include_HEADERS +=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0canberra-gtk.h<br>
- <br>
-@@ -329,6 +326,9 @@ endif<br>
- <br>
- if HAVE_GTK3<br>
- <br>
-+bin_PROGRAMS +=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 canberra-gtk3-play<br>
-+<br>
- lib_LTLIBRARIES +=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libcanberra-gtk3.la" rel=3D"n=
oreferrer" target=3D"_blank">libcanberra-gtk3.la</a><br>
- <br>
-@@ -367,6 +367,9 @@ endif<br>
- <br>
- if HAVE_GTK<br>
- <br>
-+bin_PROGRAMS +=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 canberra-gtk-play<br>
-+<br>
- lib_LTLIBRARIES +=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libcanberra-gtk.la" rel=3D"no=
referrer" target=3D"_blank">libcanberra-gtk.la</a><br>
- <br>
-@@ -399,14 +402,17 @@ endif<br>
- <br>
- if HAVE_GTK3<br>
- <br>
--canberra_gtk_play_LDADD =3D \<br>
-+canberra_gtk3_play_LDADD =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(GTK3_LIBS) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libcanberra.la" rel=3D"norefe=
rrer" target=3D"_blank">libcanberra.la</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libcanberra-gtk3.la" rel=3D"n=
oreferrer" target=3D"_blank">libcanberra-gtk3.la</a><br>
--canberra_gtk_play_CFLAGS =3D \<br>
-+canberra_gtk3_play_CFLAGS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(GTK3_CFLAGS)<br>
- <br>
--else<br>
-+canberra_gtk3_play_SOURCES =3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 canberra-gtk-play.c<br>
-+<br>
-+endif<br>
- if HAVE_GTK<br>
- <br>
- canberra_gtk_play_LDADD =3D \<br>
-@@ -416,7 +422,9 @@ canberra_gtk_play_LDADD =3D \<br>
- canberra_gtk_play_CFLAGS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(GTK_CFLAGS)<br>
- <br>
--endif<br>
-+canberra_gtk_play_SOURCES =3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 canberra-gtk-play.c<br>
-+<br>
- endif<br>
- <br>
- if HAVE_GTK_ANY<br>
-@@ -424,9 +432,6 @@ if HAVE_GTK_ANY<br>
- dist_gsdgtkmodules_DATA =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0canberra-gtk-module.desktop<br>
- <br>
--canberra_gtk_play_SOURCES =3D \<br>
--=C2=A0 =C2=A0 =C2=A0 canberra-gtk-play.c<br>
--<br>
- EXTRA_DIST +=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libcanberra-login-sound.deskt=
op.in" rel=3D"noreferrer" target=3D"_blank">libcanberra-login-sound.desktop=
.in</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libcanberra-ready-sound.deskt=
op.in" rel=3D"noreferrer" target=3D"_blank">libcanberra-ready-sound.desktop=
.in</a> \<br>
--- <br>
-1.7.6.5<br>
-<br>
diff --git a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assum=
e-all-GdkDisplays-are-GdkX11Displays-.patch b/meta-oe/recipes-support/libca=
nberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patc=
h<br>
deleted file mode 100644<br>
index 1e45441ff9..0000000000<br>
--- a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-G=
dkDisplays-are-GdkX11Displays-.patch<br>
+++ /dev/null<br>
@@ -1,65 +0,0 @@<br>
-From c0620e432650e81062c1967cc669829dbd29b310 Mon Sep 17 00:00:00 2001<br>
-From: Michael Meeks &lt;<a href=3D"mailto:michael.meeks@suse.com" target=
=3D"_blank">michael.meeks@suse.com</a>&gt;<br>
-Date: Fri, 9 Nov 2012 16:16:40 +0000<br>
-Subject: [PATCH] gtk: Don&#39;t assume all GdkDisplays are GdkX11Displays:=
<br>
- broadway/wayland<br>
-<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- src/canberra-gtk-module.c | 15 +++++++++++++++<br>
- src/canberra-gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
- 2 files changed, 20 insertions(+)<br>
-<br>
---- a/src/canberra-gtk-module.c<br>
-+++ b/src/canberra-gtk-module.c<br>
-@@ -307,6 +307,11 @@ static gint window_get_desktop(GdkDispla<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guchar *data =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gint ret =3D -1;<br>
- <br>
-+#ifdef GDK_IS_X11_DISPLAY<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!GDK_IS_X11_DISPLAY(d))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+#endif<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (XGetWindowProperty(GDK_DISPLAY_XDISP=
LAY(d), GDK_WINDOW_XID(w),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk_x11_get_xatom_by_name_for_displa=
y(d, &quot;_NET_WM_DESKTOP&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, G_MAXLONG, False, XA_CARDINAL, &a=
mp;type_return,<br>
-@@ -335,6 +340,11 @@ static gint display_get_desktop(GdkDispl<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guchar *data =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gint ret =3D -1;<br>
- <br>
-+#ifdef GDK_IS_X11_DISPLAY<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!GDK_IS_X11_DISPLAY(d))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+#endif<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (XGetWindowProperty(GDK_DISPLAY_XDISP=
LAY(d), DefaultRootWindow(GDK_DISPLAY_XDISPLAY(d)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk_x11_get_xatom_by_name_for_displa=
y(d, &quot;_NET_CURRENT_DESKTOP&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, G_MAXLONG, False, XA_CARDINAL, &a=
mp;type_return,<br>
-@@ -365,6 +375,11 @@ static gboolean window_is_xembed(GdkDisp<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gboolean ret =3D FALSE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Atom xembed;<br>
- <br>
-+#ifdef GDK_IS_X11_DISPLAY<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!GDK_IS_X11_DISPLAY(d))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+#endif<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Gnome Panel applets are XEMBED window=
s. We need to make sure we<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ignore them */<br>
- <br>
---- a/src/canberra-gtk.c<br>
-+++ b/src/canberra-gtk.c<br>
-@@ -185,6 +185,11 @@ static gint window_get_desktop(GdkDispla<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guchar *data =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gint ret =3D -1;<br>
- <br>
-+#ifdef GDK_IS_X11_DISPLAY<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!GDK_IS_X11_DISPLAY(d))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+#endif<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (XGetWindowProperty(GDK_DISPLAY_XDISP=
LAY(d), GDK_WINDOW_XID(w),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk_x11_get_xatom_by_name_for_displa=
y(d, &quot;_NET_WM_DESKTOP&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, G_MAXLONG, False, XA_CARDINAL, &a=
mp;type_return,<br>
diff --git a/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-=
templates.patch b/meta-oe/recipes-support/libcanberra/files/0001-remove-dro=
pped-templates.patch<br>
deleted file mode 100644<br>
index 57f5486084..0000000000<br>
--- a/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-templat=
es.patch<br>
+++ /dev/null<br>
@@ -1,65 +0,0 @@<br>
-From dfd3ef4caac300f517f8eeb378f0b0f9ba6a9b06 Mon Sep 17 00:00:00 2001<br>
-From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
-Date: Tue, 15 Aug 2023 15:41:03 +0200<br>
-Subject: [PATCH] remove dropped gtkdoc templates<br>
-<br>
-Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
-<br>
-Upstream-Status: Pending<br>
----<br>
---- a/gtkdoc/gtk-doc.make=C2=A0 =C2=A0 =C2=A0 2011-08-25 23:20:22.00000000=
0 +0200<br>
-+++ b/gtkdoc/gtk-doc.make=C2=A0 =C2=A0 =C2=A0 2023-08-15 18:08:02.43072907=
3 +0200<br>
-@@ -33,9 +33,9 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(HTML_IMAGES)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SETUP_FILES)<br>
- <br>
--DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp tmpl-build.stamp sgml-bui=
ld.stamp \<br>
-+DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp sgml-build.stamp \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0html-build.stamp pdf-build.stamp \<br>
--=C2=A0 =C2=A0 =C2=A0 tmpl.stamp sgml.stamp html.stamp pdf.stamp<br>
-+=C2=A0 =C2=A0 =C2=A0 sgml.stamp html.stamp pdf.stamp<br>
- <br>
- SCANOBJ_FILES =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(DOC_MODULE).args=C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
-@@ -120,27 +120,12 @@<br>
- $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_=
MODULE)-overrides.txt: scan-build.stamp<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@true<br>
- <br>
--#### templates ####<br>
--<br>
--tmpl-build.stamp: setup-build.stamp $(DOC_MODULE)-decl.txt $(SCANOBJ_FILE=
S) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt<br>
--=C2=A0 =C2=A0 =C2=A0 @echo &#39;=C2=A0 DOC=C2=A0 =C2=A0Rebuilding templat=
e files&#39;<br>
--=C2=A0 =C2=A0 =C2=A0 @gtkdoc-mktmpl --module=3D$(DOC_MODULE) $(MKTMPL_OPT=
IONS)<br>
--=C2=A0 =C2=A0 =C2=A0 @if test &quot;$(abs_srcdir)&quot; !=3D &quot;$(abs_=
builddir)&quot; ; then \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -w $(abs_srcdir) ; then \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -rp $(abs_builddir)/tmpl $(abs_srcd=
ir)/; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi \<br>
--=C2=A0 =C2=A0 =C2=A0 fi<br>
--=C2=A0 =C2=A0 =C2=A0 @touch tmpl-build.stamp<br>
--<br>
--tmpl.stamp: tmpl-build.stamp<br>
--=C2=A0 =C2=A0 =C2=A0 @true<br>
--<br>
- $(srcdir)/tmpl/*.sgml:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@true<br>
- <br>
- #### xml ####<br>
- <br>
--sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.=
sgml $(expand_content_files)<br>
-+sgml-build.stamp: $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expa=
nd_content_files)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &#39;=C2=A0 DOC=C2=A0 =C2=A0Building XML&=
#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@-chmod -R u+w $(srcdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@_source_dir=3D&#39;&#39; ; \<br>
- --- a/gtkdoc/Makefile.am=C2=A0 =C2=A0 =C2=A0 2009-01-21 21:52:46.00000000=
0 +0100<br>
-+++ b/gtkdoc/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A02023-08-15 17:41:59.002=
498772 +0200<br>
-@@ -31,10 +31,6 @@<br>
- # e.g. MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml<br>
- MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml<br>
- <br>
--# Extra options to supply to gtkdoc-mktmpl<br>
--# e.g. MKTMPL_OPTIONS=3D--only-section-tmpl<br>
--MKTMPL_OPTIONS=3D<br>
--<br>
- # Extra options to supply to gtkdoc-fixref. Not normally needed.<br>
- # e.g. FIXXREF_OPTIONS=3D--extra-dir=3D../gdk-pixbuf/html --extra-dir=3D.=
./gdk/html<br>
- FIXXREF_OPTIONS=3D<br>
diff --git a/meta-oe/recipes-support/libcanberra/<a href=3D"http://libcanbe=
rra_0.30-19.bb" rel=3D"noreferrer" target=3D"_blank">libcanberra_0.30-19.bb=
</a> b/meta-oe/recipes-support/libcanberra/<a href=3D"http://libcanberra_0.=
30-19.bb" rel=3D"noreferrer" target=3D"_blank">libcanberra_0.30-19.bb</a><b=
r>
new file mode 100644<br>
index 0000000000..b7eb50e463<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libcanberra/<a href=3D"http://libcanberra_0.3=
0-19.bb" rel=3D"noreferrer" target=3D"_blank">libcanberra_0.30-19.bb</a><br=
>
@@ -0,0 +1,47 @@<br>
+SUMMARY =3D &quot;Implementation of XDG Sound Theme and Name Specification=
s&quot;<br>
+DESCRIPTION =3D &quot;Libcanberra is an implementation of the XDG Sound Th=
eme and Name Specifications, for generating event sounds on free desktops.&=
quot;<br>
+LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/canberra.h;beginline=3D7;endline=3D24;md5=3Dc616c687cf8da540a14f917e=
0d23ab03&quot;<br>
+<br>
+DEPENDS =3D &quot;libtool libvorbis&quot;<br>
+<br>
+inherit autotools gtk-doc<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/gnome-team/libcanbe=
rra;protocol=3Dhttps;branch=3Ddebian/latest;tag=3Ddebian/$%7BPV%7D" rel=3D"=
noreferrer" target=3D"_blank">salsa.debian.org/gnome-team/libcanberra;proto=
col=3Dhttps;branch=3Ddebian/latest;tag=3Ddebian/${PV}</a> \<br>
+=C2=A0 =C2=A0 file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.=
patch \<br>
+&quot;<br>
+SRCREV =3D &quot;d1ed1ac0c9950ed3908c04abb7c4a6de5c51ed94&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot;\<br>
+=C2=A0 =C2=A0 --enable-null \<br>
+=C2=A0 =C2=A0 --disable-oss \<br>
+=C2=A0 =C2=A0 --disable-tdb \<br>
+=C2=A0 =C2=A0 --disable-lynx \<br>
+&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;alsa pulseaudio&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#=
39;, &#39;x11 wayland&#39;, &#39;gtk3 gstreamer&#39;, &#39;&#39;, d)} \<br>
+&quot;<br>
+PACKAGECONFIG[alsa] =3D &quot;--enable-alsa, --disable-alsa, alsa-lib&quot=
;<br>
+PACKAGECONFIG[pulseaudio] =3D &quot;--enable-pulse, --disable-pulse, pulse=
audio&quot;<br>
+PACKAGECONFIG[gstreamer] =3D &quot;--enable-gstreamer, --disable-gstreamer=
, gstreamer1.0&quot;<br>
+PACKAGECONFIG[gtk] =3D &quot;--enable-gtk, --disable-gtk, gtk+&quot;<br>
+PACKAGECONFIG[gtk3] =3D &quot;--enable-gtk3, --disable-gtk3, gtk+3&quot;<b=
r>
+<br>
+FILES:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_system_unitdir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gtk-2.0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gtk-3.0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gnome-settings-daemon-3.0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libcanberra-0.30 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/gdm \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/gnome \<br>
+&quot;<br>
+FILES:${PN}-dev +=3D &quot;${datadir}/vala&quot;<br>
+<br>
+# libcanberra-gtk3-module.so ships a symlink to libcanberra-gtk-module.so<=
br>
+INSANE_SKIP:${PN} =3D &quot;dev-so&quot;<br>
+<br>
diff --git a/meta-oe/recipes-support/libcanberra/<a href=3D"http://libcanbe=
rra_0.30.bb" rel=3D"noreferrer" target=3D"_blank">libcanberra_0.30.bb</a> b=
/meta-oe/recipes-support/libcanberra/<a href=3D"http://libcanberra_0.30.bb"=
 rel=3D"noreferrer" target=3D"_blank">libcanberra_0.30.bb</a><br>
deleted file mode 100644<br>
index 7eac53ae90..0000000000<br>
--- a/meta-oe/recipes-support/libcanberra/<a href=3D"http://libcanberra_0.3=
0.bb" rel=3D"noreferrer" target=3D"_blank">libcanberra_0.30.bb</a><br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-SUMMARY =3D &quot;Implementation of XDG Sound Theme and Name Specification=
s&quot;<br>
-DESCRIPTION =3D &quot;Libcanberra is an implementation of the XDG Sound Th=
eme and Name Specifications, for generating event sounds on free desktops.&=
quot;<br>
-LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/canberra.h;beginline=3D7;endline=3D24;md5=3Dc616c687cf8da540a14f917e=
0d23ab03&quot;<br>
-<br>
-DEPENDS =3D &quot;libtool libvorbis&quot;<br>
-<br>
-inherit autotools gtk-doc<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 <a href=3D"http://0pointer.de/lennart/projects/$%7BBPN%7D/$%=
7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://0poi=
nter.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz</a> \<br>
-=C2=A0 =C2=A0 file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play=
.patch \<br>
-=C2=A0 =C2=A0 file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displ=
ays-.patch \<br>
-=C2=A0 =C2=A0 file://0001-remove-dropped-templates.patch \<br>
-=C2=A0 =C2=A0 file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.=
patch \<br>
-&quot;<br>
-SRC_URI[sha256sum] =3D &quot;c2b671e67e0c288a69fc33dc1b6f1b534d07882c2acee=
d37004bf48c601afa72&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot;\<br>
-=C2=A0 =C2=A0 --enable-null \<br>
-=C2=A0 =C2=A0 --disable-oss \<br>
-=C2=A0 =C2=A0 --disable-tdb \<br>
-=C2=A0 =C2=A0 --disable-lynx \<br>
-&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;alsa pulseaudio&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;gtk gtk3&#39=
;, &#39;&#39;, d)} \<br>
-&quot;<br>
-PACKAGECONFIG[alsa] =3D &quot;--enable-alsa, --disable-alsa, alsa-lib&quot=
;<br>
-PACKAGECONFIG[pulseaudio] =3D &quot;--enable-pulse, --disable-pulse, pulse=
audio&quot;<br>
-PACKAGECONFIG[gstreamer] =3D &quot;--enable-gstreamer, --disable-gstreamer=
, gstreamer1.0&quot;<br>
-PACKAGECONFIG[gtk] =3D &quot;--enable-gtk, --disable-gtk, gtk+&quot;<br>
-PACKAGECONFIG[gtk3] =3D &quot;--enable-gtk3, --disable-gtk3, gtk+3&quot;<b=
r>
-<br>
-python populate_packages:prepend() {<br>
-=C2=A0 =C2=A0 plugindir =3D d.expand(&#39;${libdir}/${BPN}-${PV}/&#39;)<br=
>
-=C2=A0 =C2=A0 do_split_packages(d, plugindir, r&#39;^libcanberra-(.*)\.so$=
&#39;, &#39;libcanberra-%s&#39;, &#39;%s support library&#39;, extra_depend=
s=3D&#39;&#39; )<br>
-=C2=A0 =C2=A0 do_split_packages(d, plugindir, r&#39;^libcanberra-(.*)\.la$=
&#39;, &#39;libcanberra-%s&#39;, &#39;%s support library&#39;, extra_depend=
s=3D&#39;&#39; )<br>
-}<br>
-<br>
-PACKAGES =3D+ &quot;${PN}-gnome ${PN}-gtk2 ${PN}-gtk3 ${PN}-systemd&quot;<=
br>
-PACKAGES_DYNAMIC +=3D &quot;^libcanberra-.*&quot;<br>
-<br>
-FILES:${PN} =3D &quot;${bindir}/ ${libdir}/${BPN}.so.*&quot;<br>
-<br>
-FILES:${PN}-dev +=3D &quot;${datadir}/vala/vapi ${libdir}/*/modules/*.la $=
{libdir}/*/*.la&quot;<br>
-<br>
-FILES:${PN}-dbg +=3D &quot;${libdir}/${BPN}-${PV}/.debug ${libdir}/gtk-*/m=
odules/.debug&quot;<br>
-<br>
-FILES:${PN}-gtk2 =3D &quot;${libdir}/${BPN}-gtk.so.* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/gtk-2.0/modules/*.so \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bi=
ndir}/canberra-gtk-play&quot;<br>
-<br>
-# -gtk3 ships a symlink to a .so<br>
-INSANE_SKIP:${PN}-gtk3 =3D &quot;dev-so&quot;<br>
-FILES:${PN}-gtk3 =3D &quot;${libdir}/${BPN}-gtk3.so.* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/gtk-3.0/modules/*.so \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bi=
ndir}/canberra-gtk3-play&quot;<br>
-<br>
-FILES:${PN}-gnome =3D &quot;${libdir}/gnome-settings-daemon-3.0/ \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${datadir}/gdm/ ${datadir}/gnome/&quot;<br>
-<br>
-FILES:${PN}-systemd =3D &quot;${systemd_unitdir}/system/*.service&quot;<br=
>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123270): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123270" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123270</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117150885/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117150885/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000eba3780647ef48bc--

