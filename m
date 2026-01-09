Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2B2D16816
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 11:26:37 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8118.1767957987809544812
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 03:26:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id E563ADFB3;
	Fri,  9 Jan 2026 12:26:25 +0100 (CET)
Received: from [192.168.178.36] ([79.219.239.35]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1veAdL-26MHU80; Fri, 9 Jan 2026 12:26:23 +0100
Date: Fri, 09 Jan 2026 12:26:17 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] libcanberra: update 0.30 -> 0.30-19
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <T3HL8T.NDEG3HYW0XUJ@t-online.de>
In-Reply-To: <CAMKF1srLVnTP98whn8wKPvKiXjsUJYZS5=xKUHT9d1i2Ad2n6Q@mail.gmail.com>
References: <20260108115545.2793869-1-f_l_k@t-online.de>
	<CAMKF1srLVnTP98whn8wKPvKiXjsUJYZS5=xKUHT9d1i2Ad2n6Q@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-U7qtQh0to4GcytOlgQAn"
X-TOI-EXPURGATEID: 150726::1767957983-0BFFC925-E04255F7/0/0 CLEAN NORMAL
X-TOI-MSGID: e77c8531-70e7-4250-8c3c-77ce81b317b3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 11:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123294

--=-U7qtQh0to4GcytOlgQAn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Sorry. I have sent a fix for it

On Thu, Jan 8 2026 at 23:14:40 -08:00:00, Khem Raj via=20
lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>=20
wrote:
> This seems to end with
>=20
> <https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4882290/raw_in=
line>
>=20
> On Thu, Jan 8, 2026 at 3:56=E2=80=AFAM Markus Volk via=20
> lists.openembedded.org <http://lists.openembedded.org/>=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:t-online.de@lists.openembedded.org>> wrote:
>> Lennart Poettering stopped maintaining libcanberra over a decade ago=20
>> but it is still
>>  maintained by the debian gnome-team.
>>=20
>>  Most notable improvement is that building the=20
>> libcanberra-gtk3-module doesn't depend
>>  on gtk2 anymore and thus libcanberra isn't dependent on x11 to=20
>> build support for gtk3
>>=20
>>  - fetch source from salsa.debian.org <http://salsa.debian.org/>,=20
>> use git for it
>>  - remove outdated patches
>>  - dont build gtk+ module by default anymore
>>  - simplify packaging
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...d-gtk3-version-for-canberra_gtk_play.patch | 94=20
>> -------------------
>>   ...-all-GdkDisplays-are-GdkX11Displays-.patch | 65 -------------
>>   .../files/0001-remove-dropped-templates.patch | 65 -------------
>>   .../libcanberra/libcanberra_0.30-19.bb=20
>> <http://libcanberra_0.30-19.bb/>        | 47 ++++++++++
>>   .../libcanberra/libcanberra_0.30.bb <http://libcanberra_0.30.bb/> =20
>>          | 64 -------------
>>   5 files changed, 47 insertions(+), 288 deletions(-)
>>   delete mode 100644=20
>> meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-versio=
n-for-canberra_gtk_play.patch
>>   delete mode 100644=20
>> meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkD=
isplays-are-GdkX11Displays-.patch
>>   delete mode 100644=20
>> meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-templates.=
patch
>>   create mode 100644=20
>> meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb=20
>> <http://libcanberra_0.30-19.bb/>
>>   delete mode 100644=20
>> meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb=20
>> <http://libcanberra_0.30.bb/>
>>=20
>>  diff --git=20
>> a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-vers=
ion-for-canberra_gtk_play.patch=20
>> b/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-vers=
ion-for-canberra_gtk_play.patch
>>  deleted file mode 100644
>>  index 89f31f7946..0000000000
>>  ---=20
>> a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-vers=
ion-for-canberra_gtk_play.patch
>>  +++ /dev/null
>>  @@ -1,94 +0,0 @@
>>  -From 4a89ddffbb14d747adbe3365ace4db87de52ba39 Mon Sep 17 00:00:00=20
>> 2001
>>  -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D=20
>> <schnitzeltony@googlemail.com <mailto:schnitzeltony@googlemail.com>>
>>  -Date: Mon, 16 Sep 2013 16:08:28 +0200
>>  -Subject: [PATCH] build gtk- and gtk3-version for canberra_gtk_play
>>  -MIME-Version: 1.0
>>  -Content-Type: text/plain; charset=3DUTF-8
>>  -Content-Transfer-Encoding: 8bit
>>  -
>>  -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com=20
>> <mailto:schnitzeltony@googlemail.com>>
>>  ----
>>  -Upstream-Status: Pending
>>  -
>>  - src/Makefile.am |   25 +++++++++++++++----------
>>  - 1 files changed, 15 insertions(+), 10 deletions(-)
>>  -
>>  -diff --git a/src/Makefile.am b/src/Makefile.am
>>  -index 56ed96d..fc72e1f 100644
>>  ---- a/src/Makefile.am
>>  -+++ b/src/Makefile.am
>>  -@@ -319,9 +319,6 @@ endif
>>  -
>>  - if HAVE_GTK_ANY
>>  -
>>  --bin_PROGRAMS +=3D \
>>  --      canberra-gtk-play
>>  --
>>  - include_HEADERS +=3D \
>>  -       canberra-gtk.h
>>  -
>>  -@@ -329,6 +326,9 @@ endif
>>  -
>>  - if HAVE_GTK3
>>  -
>>  -+bin_PROGRAMS +=3D \
>>  -+      canberra-gtk3-play
>>  -+
>>  - lib_LTLIBRARIES +=3D \
>>  -       libcanberra-gtk3.la <http://libcanberra-gtk3.la/>
>>  -
>>  -@@ -367,6 +367,9 @@ endif
>>  -
>>  - if HAVE_GTK
>>  -
>>  -+bin_PROGRAMS +=3D \
>>  -+      canberra-gtk-play
>>  -+
>>  - lib_LTLIBRARIES +=3D \
>>  -       libcanberra-gtk.la <http://libcanberra-gtk.la/>
>>  -
>>  -@@ -399,14 +402,17 @@ endif
>>  -
>>  - if HAVE_GTK3
>>  -
>>  --canberra_gtk_play_LDADD =3D \
>>  -+canberra_gtk3_play_LDADD =3D \
>>  -       $(GTK3_LIBS) \
>>  -       libcanberra.la <http://libcanberra.la/> \
>>  -       libcanberra-gtk3.la <http://libcanberra-gtk3.la/>
>>  --canberra_gtk_play_CFLAGS =3D \
>>  -+canberra_gtk3_play_CFLAGS =3D \
>>  -       $(GTK3_CFLAGS)
>>  -
>>  --else
>>  -+canberra_gtk3_play_SOURCES =3D \
>>  -+      canberra-gtk-play.c
>>  -+
>>  -+endif
>>  - if HAVE_GTK
>>  -
>>  - canberra_gtk_play_LDADD =3D \
>>  -@@ -416,7 +422,9 @@ canberra_gtk_play_LDADD =3D \
>>  - canberra_gtk_play_CFLAGS =3D \
>>  -       $(GTK_CFLAGS)
>>  -
>>  --endif
>>  -+canberra_gtk_play_SOURCES =3D \
>>  -+      canberra-gtk-play.c
>>  -+
>>  - endif
>>  -
>>  - if HAVE_GTK_ANY
>>  -@@ -424,9 +432,6 @@ if HAVE_GTK_ANY
>>  - dist_gsdgtkmodules_DATA =3D \
>>  -       canberra-gtk-module.desktop
>>  -
>>  --canberra_gtk_play_SOURCES =3D \
>>  --      canberra-gtk-play.c
>>  --
>>  - EXTRA_DIST +=3D \
>>  -       libcanberra-login-sound.desktop.in=20
>> <http://libcanberra-login-sound.desktop.in/> \
>>  -       libcanberra-ready-sound.desktop.in=20
>> <http://libcanberra-ready-sound.desktop.in/> \
>>  ---
>>  -1.7.6.5
>>  -
>>  diff --git=20
>> a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-Gd=
kDisplays-are-GdkX11Displays-.patch=20
>> b/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-Gd=
kDisplays-are-GdkX11Displays-.patch
>>  deleted file mode 100644
>>  index 1e45441ff9..0000000000
>>  ---=20
>> a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-Gd=
kDisplays-are-GdkX11Displays-.patch
>>  +++ /dev/null
>>  @@ -1,65 +0,0 @@
>>  -From c0620e432650e81062c1967cc669829dbd29b310 Mon Sep 17 00:00:00=20
>> 2001
>>  -From: Michael Meeks <michael.meeks@suse.com=20
>> <mailto:michael.meeks@suse.com>>
>>  -Date: Fri, 9 Nov 2012 16:16:40 +0000
>>  -Subject: [PATCH] gtk: Don't assume all GdkDisplays are=20
>> GdkX11Displays:
>>  - broadway/wayland
>>  -
>>  ----
>>  -Upstream-Status: Pending
>>  -
>>  - src/canberra-gtk-module.c | 15 +++++++++++++++
>>  - src/canberra-gtk.c        |  5 +++++
>>  - 2 files changed, 20 insertions(+)
>>  -
>>  ---- a/src/canberra-gtk-module.c
>>  -+++ b/src/canberra-gtk-module.c
>>  -@@ -307,6 +307,11 @@ static gint window_get_desktop(GdkDispla
>>  -         guchar *data =3D NULL;
>>  -         gint ret =3D -1;
>>  -
>>  -+#ifdef GDK_IS_X11_DISPLAY
>>  -+        if (!GDK_IS_X11_DISPLAY(d))
>>  -+                return 0;
>>  -+#endif
>>  -+
>>  -         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d),=20
>> GDK_WINDOW_XID(w),
>>  -                               =20
>> gdk_x11_get_xatom_by_name_for_display(d, "_NET_WM_DESKTOP"),
>>  -                                0, G_MAXLONG, False, XA_CARDINAL,=20
>> &type_return,
>>  -@@ -335,6 +340,11 @@ static gint display_get_desktop(GdkDispl
>>  -         guchar *data =3D NULL;
>>  -         gint ret =3D -1;
>>  -
>>  -+#ifdef GDK_IS_X11_DISPLAY
>>  -+        if (!GDK_IS_X11_DISPLAY(d))
>>  -+                return 0;
>>  -+#endif
>>  -+
>>  -         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d),=20
>> DefaultRootWindow(GDK_DISPLAY_XDISPLAY(d)),
>>  -                               =20
>> gdk_x11_get_xatom_by_name_for_display(d, "_NET_CURRENT_DESKTOP"),
>>  -                                0, G_MAXLONG, False, XA_CARDINAL,=20
>> &type_return,
>>  -@@ -365,6 +375,11 @@ static gboolean window_is_xembed(GdkDisp
>>  -         gboolean ret =3D FALSE;
>>  -         Atom xembed;
>>  -
>>  -+#ifdef GDK_IS_X11_DISPLAY
>>  -+        if (!GDK_IS_X11_DISPLAY(d))
>>  -+                return FALSE;
>>  -+#endif
>>  -+
>>  -         /* Gnome Panel applets are XEMBED windows. We need to=20
>> make sure we
>>  -          * ignore them */
>>  -
>>  ---- a/src/canberra-gtk.c
>>  -+++ b/src/canberra-gtk.c
>>  -@@ -185,6 +185,11 @@ static gint window_get_desktop(GdkDispla
>>  -         guchar *data =3D NULL;
>>  -         gint ret =3D -1;
>>  -
>>  -+#ifdef GDK_IS_X11_DISPLAY
>>  -+        if (!GDK_IS_X11_DISPLAY(d))
>>  -+                return 0;
>>  -+#endif
>>  -+
>>  -         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d),=20
>> GDK_WINDOW_XID(w),
>>  -                               =20
>> gdk_x11_get_xatom_by_name_for_display(d, "_NET_WM_DESKTOP"),
>>  -                                0, G_MAXLONG, False, XA_CARDINAL,=20
>> &type_return,
>>  diff --git=20
>> a/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-template=
s.patch=20
>> b/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-template=
s.patch
>>  deleted file mode 100644
>>  index 57f5486084..0000000000
>>  ---=20
>> a/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-template=
s.patch
>>  +++ /dev/null
>>  @@ -1,65 +0,0 @@
>>  -From dfd3ef4caac300f517f8eeb378f0b0f9ba6a9b06 Mon Sep 17 00:00:00=20
>> 2001
>>  -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
>>  -Date: Tue, 15 Aug 2023 15:41:03 +0200
>>  -Subject: [PATCH] remove dropped gtkdoc templates
>>  -
>>  -Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  -
>>  -Upstream-Status: Pending
>>  ----
>>  ---- a/gtkdoc/gtk-doc.make      2011-08-25 23:20:22.000000000 +0200
>>  -+++ b/gtkdoc/gtk-doc.make      2023-08-15 18:08:02.430729073 +0200
>>  -@@ -33,9 +33,9 @@
>>  -       $(HTML_IMAGES)                  \
>>  -       $(SETUP_FILES)
>>  -
>>  --DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp tmpl-build.stamp=20
>> sgml-build.stamp \
>>  -+DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp sgml-build.stamp \
>>  -       html-build.stamp pdf-build.stamp \
>>  --      tmpl.stamp sgml.stamp html.stamp pdf.stamp
>>  -+      sgml.stamp html.stamp pdf.stamp
>>  -
>>  - SCANOBJ_FILES =3D                \
>>  -       $(DOC_MODULE).args       \
>>  -@@ -120,27 +120,12 @@
>>  - $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES)=20
>> $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt:=20
>> scan-build.stamp
>>  -       @true
>>  -
>>  --#### templates ####
>>  --
>>  --tmpl-build.stamp: setup-build.stamp $(DOC_MODULE)-decl.txt=20
>> $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt=20
>> $(DOC_MODULE)-overrides.txt
>>  --      @echo '  DOC   Rebuilding template files'
>>  --      @gtkdoc-mktmpl --module=3D$(DOC_MODULE) $(MKTMPL_OPTIONS)
>>  --      @if test "$(abs_srcdir)" !=3D "$(abs_builddir)" ; then \
>>  --        if test -w $(abs_srcdir) ; then \
>>  --          cp -rp $(abs_builddir)/tmpl $(abs_srcdir)/; \
>>  --        fi \
>>  --      fi
>>  --      @touch tmpl-build.stamp
>>  --
>>  --tmpl.stamp: tmpl-build.stamp
>>  --      @true
>>  --
>>  - $(srcdir)/tmpl/*.sgml:
>>  -       @true
>>  -
>>  - #### xml ####
>>  -
>>  --sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt=20
>> $(srcdir)/tmpl/*.sgml $(expand_content_files)
>>  -+sgml-build.stamp: $(DOC_MODULE)-sections.txt=20
>> $(srcdir)/tmpl/*.sgml $(expand_content_files)
>>  -       @echo '  DOC   Building XML'
>>  -       @-chmod -R u+w $(srcdir)
>>  -       @_source_dir=3D'' ; \
>>  - --- a/gtkdoc/Makefile.am      2009-01-21 21:52:46.000000000 +0100
>>  -+++ b/gtkdoc/Makefile.am       2023-08-15 17:41:59.002498772 +0200
>>  -@@ -31,10 +31,6 @@
>>  - # e.g. MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml
>>  - MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml
>>  -
>>  --# Extra options to supply to gtkdoc-mktmpl
>>  --# e.g. MKTMPL_OPTIONS=3D--only-section-tmpl
>>  --MKTMPL_OPTIONS=3D
>>  --
>>  - # Extra options to supply to gtkdoc-fixref. Not normally needed.
>>  - # e.g. FIXXREF_OPTIONS=3D--extra-dir=3D../gdk-pixbuf/html=20
>> --extra-dir=3D../gdk/html
>>  - FIXXREF_OPTIONS=3D
>>  diff --git=20
>> a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb=20
>> <http://libcanberra_0.30-19.bb/>=20
>> b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb=20
>> <http://libcanberra_0.30-19.bb/>
>>  new file mode 100644
>>  index 0000000000..b7eb50e463
>>  --- /dev/null
>>  +++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb=20
>> <http://libcanberra_0.30-19.bb/>
>>  @@ -0,0 +1,47 @@
>>  +SUMMARY =3D "Implementation of XDG Sound Theme and Name=20
>> Specifications"
>>  +DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound=20
>> Theme and Name Specifications, for generating event sounds on free=20
>> desktops."
>>  +LICENSE =3D "LGPL-2.1-or-later"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>>  +                   =20
>> file://src/canberra.h;beginline=3D7;endline=3D24;md5=3Dc616c687cf8da540a=
14f917e0d23ab03"
>>  +
>>  +DEPENDS =3D "libtool libvorbis"
>>  +
>>  +inherit autotools gtk-doc
>>  +
>>  +SRC_URI =3D " \
>>  +   =20
>> git://salsa.debian.org/gnome-team/libcanberra;protocol=3Dhttps;branch=3D=
debian/latest;tag=3Ddebian/${PV}=20
>> <http://salsa.debian.org/gnome-team/libcanberra;protocol=3Dhttps;branch=
=3Ddebian/latest;tag=3Ddebian/$%7BPV%7D>=20
>> \
>>  +   =20
>> file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch \
>>  +"
>>  +SRCREV =3D "d1ed1ac0c9950ed3908c04abb7c4a6de5c51ed94"
>>  +
>>  +EXTRA_OECONF =3D "\
>>  +    --enable-null \
>>  +    --disable-oss \
>>  +    --disable-tdb \
>>  +    --disable-lynx \
>>  +"
>>  +
>>  +PACKAGECONFIG ??=3D " \
>>  +       ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio',=20
>> d)} \
>>  +       ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland',=20
>> 'gtk3 gstreamer', '', d)} \
>>  +"
>>  +PACKAGECONFIG[alsa] =3D "--enable-alsa, --disable-alsa, alsa-lib"
>>  +PACKAGECONFIG[pulseaudio] =3D "--enable-pulse, --disable-pulse,=20
>> pulseaudio"
>>  +PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer,=20
>> --disable-gstreamer, gstreamer1.0"
>>  +PACKAGECONFIG[gtk] =3D "--enable-gtk, --disable-gtk, gtk+"
>>  +PACKAGECONFIG[gtk3] =3D "--enable-gtk3, --disable-gtk3, gtk+3"
>>  +
>>  +FILES:${PN} +=3D " \
>>  +       ${systemd_system_unitdir} \
>>  +       ${libdir}/gtk-2.0 \
>>  +       ${libdir}/gtk-3.0 \
>>  +       ${libdir}/gnome-settings-daemon-3.0 \
>>  +       ${libdir}/libcanberra-0.30 \
>>  +       ${datadir}/gdm \
>>  +       ${datadir}/gnome \
>>  +"
>>  +FILES:${PN}-dev +=3D "${datadir}/vala"
>>  +
>>  +# libcanberra-gtk3-module.so ships a symlink to=20
>> libcanberra-gtk-module.so
>>  +INSANE_SKIP:${PN} =3D "dev-so"
>>  +
>>  diff --git=20
>> a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb=20
>> <http://libcanberra_0.30.bb/>=20
>> b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb=20
>> <http://libcanberra_0.30.bb/>
>>  deleted file mode 100644
>>  index 7eac53ae90..0000000000
>>  --- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb=20
>> <http://libcanberra_0.30.bb/>
>>  +++ /dev/null
>>  @@ -1,64 +0,0 @@
>>  -SUMMARY =3D "Implementation of XDG Sound Theme and Name=20
>> Specifications"
>>  -DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound=20
>> Theme and Name Specifications, for generating event sounds on free=20
>> desktops."
>>  -LICENSE =3D "LGPL-2.1-or-later"
>>  -LIC_FILES_CHKSUM =3D=20
>> "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>>  -                   =20
>> file://src/canberra.h;beginline=3D7;endline=3D24;md5=3Dc616c687cf8da540a=
14f917e0d23ab03"
>>  -
>>  -DEPENDS =3D "libtool libvorbis"
>>  -
>>  -inherit autotools gtk-doc
>>  -
>>  -SRC_URI =3D " \
>>  -    http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz=20
>> <http://0pointer.de/lennart/projects/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar=
.xz>=20
>> \
>>  -   =20
>> file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch \
>>  -   =20
>> file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch=20
>> \
>>  -    file://0001-remove-dropped-templates.patch \
>>  -   =20
>> file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch \
>>  -"
>>  -SRC_URI[sha256sum] =3D=20
>> "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72"
>>  -
>>  -EXTRA_OECONF =3D "\
>>  -    --enable-null \
>>  -    --disable-oss \
>>  -    --disable-tdb \
>>  -    --disable-lynx \
>>  -"
>>  -
>>  -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa=20
>> pulseaudio', d)} \
>>  -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11',=20
>> 'gtk gtk3', '', d)} \
>>  -"
>>  -PACKAGECONFIG[alsa] =3D "--enable-alsa, --disable-alsa, alsa-lib"
>>  -PACKAGECONFIG[pulseaudio] =3D "--enable-pulse, --disable-pulse,=20
>> pulseaudio"
>>  -PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer,=20
>> --disable-gstreamer, gstreamer1.0"
>>  -PACKAGECONFIG[gtk] =3D "--enable-gtk, --disable-gtk, gtk+"
>>  -PACKAGECONFIG[gtk3] =3D "--enable-gtk3, --disable-gtk3, gtk+3"
>>  -
>>  -python populate_packages:prepend() {
>>  -    plugindir =3D d.expand('${libdir}/${BPN}-${PV}/')
>>  -    do_split_packages(d, plugindir, r'^libcanberra-(.*)\.so$',=20
>> 'libcanberra-%s', '%s support library', extra_depends=3D'' )
>>  -    do_split_packages(d, plugindir, r'^libcanberra-(.*)\.la$',=20
>> 'libcanberra-%s', '%s support library', extra_depends=3D'' )
>>  -}
>>  -
>>  -PACKAGES =3D+ "${PN}-gnome ${PN}-gtk2 ${PN}-gtk3 ${PN}-systemd"
>>  -PACKAGES_DYNAMIC +=3D "^libcanberra-.*"
>>  -
>>  -FILES:${PN} =3D "${bindir}/ ${libdir}/${BPN}.so.*"
>>  -
>>  -FILES:${PN}-dev +=3D "${datadir}/vala/vapi ${libdir}/*/modules/*.la=20
>> ${libdir}/*/*.la"
>>  -
>>  -FILES:${PN}-dbg +=3D "${libdir}/${BPN}-${PV}/.debug=20
>> ${libdir}/gtk-*/modules/.debug"
>>  -
>>  -FILES:${PN}-gtk2 =3D "${libdir}/${BPN}-gtk.so.* \
>>  -                    ${libdir}/gtk-2.0/modules/*.so \
>>  -                    ${bindir}/canberra-gtk-play"
>>  -
>>  -# -gtk3 ships a symlink to a .so
>>  -INSANE_SKIP:${PN}-gtk3 =3D "dev-so"
>>  -FILES:${PN}-gtk3 =3D "${libdir}/${BPN}-gtk3.so.* \
>>  -                    ${libdir}/gtk-3.0/modules/*.so \
>>  -                    ${bindir}/canberra-gtk3-play"
>>  -
>>  -FILES:${PN}-gnome =3D "${libdir}/gnome-settings-daemon-3.0/ \
>>  -                     ${datadir}/gdm/ ${datadir}/gnome/"
>>  -
>>  -FILES:${PN}-systemd =3D "${systemd_unitdir}/system/*.service"
>>  --
>>  2.52.0
>>=20
>>=20
>>=20
>>=20


--=-U7qtQh0to4GcytOlgQAn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Sorry. I have sent a fix for it</d=
iv></div><div id=3D"geary-quote" dir=3D"auto"><br>On Thu, Jan 8 2026 at 23:=
14:40 -08:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=3Dgmail.c=
om@lists.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div dir=
=3D"ltr">This seems to end with<div><br></div><div><a href=3D"https://autob=
uilder.yoctoproject.org/valkyrie/api/v2/logs/4882290/raw_inline">https://au=
tobuilder.yoctoproject.org/valkyrie/api/v2/logs/4882290/raw_inline</a></div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Jan 8, 2026 at 3:56=E2=80=AFAM Markus Volk v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Lennart Poettering stopped maintaining libcanberra ov=
er a decade ago but it is still<br>
maintained by the debian gnome-team.<br>
<br>
Most notable improvement is that building the libcanberra-gtk3-module doesn=
't depend<br>
on gtk2 anymore and thus libcanberra isn't dependent on x11 to build suppor=
t for gtk3<br>
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
&nbsp;...d-gtk3-version-for-canberra_gtk_play.patch | 94 ------------------=
-<br>
&nbsp;...-all-GdkDisplays-are-GdkX11Displays-.patch | 65 -------------<br>
&nbsp;.../files/0001-remove-dropped-templates.patch | 65 -------------<br>
&nbsp;.../libcanberra/<a href=3D"http://libcanberra_0.30-19.bb" rel=3D"nore=
ferrer" target=3D"_blank">libcanberra_0.30-19.bb</a>&nbsp; &nbsp; &nbsp; &n=
bsp; | 47 ++++++++++<br>
&nbsp;.../libcanberra/<a href=3D"http://libcanberra_0.30.bb" rel=3D"norefer=
rer" target=3D"_blank">libcanberra_0.30.bb</a>&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| 64 -------------<br>
&nbsp;5 files changed, 47 insertions(+), 288 deletions(-)<br>
&nbsp;delete mode 100644 meta-oe/recipes-support/libcanberra/files/0001-bui=
ld-gtk-and-gtk3-version-for-canberra_gtk_play.patch<br>
&nbsp;delete mode 100644 meta-oe/recipes-support/libcanberra/files/0001-gtk=
-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch<br>
&nbsp;delete mode 100644 meta-oe/recipes-support/libcanberra/files/0001-rem=
ove-dropped-templates.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/libcanberra/<a href=3D"htt=
p://libcanberra_0.30-19.bb" rel=3D"noreferrer" target=3D"_blank">libcanberr=
a_0.30-19.bb</a><br>
&nbsp;delete mode 100644 meta-oe/recipes-support/libcanberra/<a href=3D"htt=
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
- src/Makefile.am |&nbsp; &nbsp;25 +++++++++++++++----------<br>
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
--&nbsp; &nbsp; &nbsp; canberra-gtk-play<br>
--<br>
- include_HEADERS +=3D \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;canberra-gtk.h<br>
- <br>
-@@ -329,6 +326,9 @@ endif<br>
- <br>
- if HAVE_GTK3<br>
- <br>
-+bin_PROGRAMS +=3D \<br>
-+&nbsp; &nbsp; &nbsp; canberra-gtk3-play<br>
-+<br>
- lib_LTLIBRARIES +=3D \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://libcanberra-gtk3.la" rel=3D"n=
oreferrer" target=3D"_blank">libcanberra-gtk3.la</a><br>
- <br>
-@@ -367,6 +367,9 @@ endif<br>
- <br>
- if HAVE_GTK<br>
- <br>
-+bin_PROGRAMS +=3D \<br>
-+&nbsp; &nbsp; &nbsp; canberra-gtk-play<br>
-+<br>
- lib_LTLIBRARIES +=3D \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://libcanberra-gtk.la" rel=3D"no=
referrer" target=3D"_blank">libcanberra-gtk.la</a><br>
- <br>
-@@ -399,14 +402,17 @@ endif<br>
- <br>
- if HAVE_GTK3<br>
- <br>
--canberra_gtk_play_LDADD =3D \<br>
-+canberra_gtk3_play_LDADD =3D \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;$(GTK3_LIBS) \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://libcanberra.la" rel=3D"norefe=
rrer" target=3D"_blank">libcanberra.la</a> \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://libcanberra-gtk3.la" rel=3D"n=
oreferrer" target=3D"_blank">libcanberra-gtk3.la</a><br>
--canberra_gtk_play_CFLAGS =3D \<br>
-+canberra_gtk3_play_CFLAGS =3D \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;$(GTK3_CFLAGS)<br>
- <br>
--else<br>
-+canberra_gtk3_play_SOURCES =3D \<br>
-+&nbsp; &nbsp; &nbsp; canberra-gtk-play.c<br>
-+<br>
-+endif<br>
- if HAVE_GTK<br>
- <br>
- canberra_gtk_play_LDADD =3D \<br>
-@@ -416,7 +422,9 @@ canberra_gtk_play_LDADD =3D \<br>
- canberra_gtk_play_CFLAGS =3D \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;$(GTK_CFLAGS)<br>
- <br>
--endif<br>
-+canberra_gtk_play_SOURCES =3D \<br>
-+&nbsp; &nbsp; &nbsp; canberra-gtk-play.c<br>
-+<br>
- endif<br>
- <br>
- if HAVE_GTK_ANY<br>
-@@ -424,9 +432,6 @@ if HAVE_GTK_ANY<br>
- dist_gsdgtkmodules_DATA =3D \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;canberra-gtk-module.desktop<br>
- <br>
--canberra_gtk_play_SOURCES =3D \<br>
--&nbsp; &nbsp; &nbsp; canberra-gtk-play.c<br>
--<br>
- EXTRA_DIST +=3D \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://libcanberra-login-sound.deskt=
op.in" rel=3D"noreferrer" target=3D"_blank">libcanberra-login-sound.desktop=
.in</a> \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://libcanberra-ready-sound.deskt=
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
-Subject: [PATCH] gtk: Don't assume all GdkDisplays are GdkX11Displays:<br>
- broadway/wayland<br>
-<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- src/canberra-gtk-module.c | 15 +++++++++++++++<br>
- src/canberra-gtk.c&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 5 +++++<br>
- 2 files changed, 20 insertions(+)<br>
-<br>
---- a/src/canberra-gtk-module.c<br>
-+++ b/src/canberra-gtk-module.c<br>
-@@ -307,6 +307,11 @@ static gint window_get_desktop(GdkDispla<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;guchar *data =3D NULL;<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gint ret =3D -1;<br>
- <br>
-+#ifdef GDK_IS_X11_DISPLAY<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; if (!GDK_IS_X11_DISPLAY(d))<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
-+#endif<br>
-+<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (XGetWindowProperty(GDK_DISPLAY_XDISP=
LAY(d), GDK_WINDOW_XID(w),<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gdk_x11_get_xatom_by_name_for_display=
(d, "_NET_WM_DESKTOP"),<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0, G_MAXLONG, False, XA_CARDINAL, &am=
p;type_return,<br>
-@@ -335,6 +340,11 @@ static gint display_get_desktop(GdkDispl<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;guchar *data =3D NULL;<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gint ret =3D -1;<br>
- <br>
-+#ifdef GDK_IS_X11_DISPLAY<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; if (!GDK_IS_X11_DISPLAY(d))<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
-+#endif<br>
-+<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (XGetWindowProperty(GDK_DISPLAY_XDISP=
LAY(d), DefaultRootWindow(GDK_DISPLAY_XDISPLAY(d)),<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gdk_x11_get_xatom_by_name_for_display=
(d, "_NET_CURRENT_DESKTOP"),<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0, G_MAXLONG, False, XA_CARDINAL, &am=
p;type_return,<br>
-@@ -365,6 +375,11 @@ static gboolean window_is_xembed(GdkDisp<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gboolean ret =3D FALSE;<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Atom xembed;<br>
- <br>
-+#ifdef GDK_IS_X11_DISPLAY<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; if (!GDK_IS_X11_DISPLAY(d))<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return FALSE;<br>
-+#endif<br>
-+<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Gnome Panel applets are XEMBED window=
s. We need to make sure we<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * ignore them */<br>
- <br>
---- a/src/canberra-gtk.c<br>
-+++ b/src/canberra-gtk.c<br>
-@@ -185,6 +185,11 @@ static gint window_get_desktop(GdkDispla<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;guchar *data =3D NULL;<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gint ret =3D -1;<br>
- <br>
-+#ifdef GDK_IS_X11_DISPLAY<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; if (!GDK_IS_X11_DISPLAY(d))<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
-+#endif<br>
-+<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (XGetWindowProperty(GDK_DISPLAY_XDISP=
LAY(d), GDK_WINDOW_XID(w),<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gdk_x11_get_xatom_by_name_for_display=
(d, "_NET_WM_DESKTOP"),<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0, G_MAXLONG, False, XA_CARDINAL, &am=
p;type_return,<br>
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
---- a/gtkdoc/gtk-doc.make&nbsp; &nbsp; &nbsp; 2011-08-25 23:20:22.00000000=
0 +0200<br>
-+++ b/gtkdoc/gtk-doc.make&nbsp; &nbsp; &nbsp; 2023-08-15 18:08:02.43072907=
3 +0200<br>
-@@ -33,9 +33,9 @@<br>
-&nbsp; &nbsp; &nbsp; &nbsp;$(HTML_IMAGES)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;$(SETUP_FILES)<br>
- <br>
--DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp tmpl-build.stamp sgml-bui=
ld.stamp \<br>
-+DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp sgml-build.stamp \<br>
-&nbsp; &nbsp; &nbsp; &nbsp;html-build.stamp pdf-build.stamp \<br>
--&nbsp; &nbsp; &nbsp; tmpl.stamp sgml.stamp html.stamp pdf.stamp<br>
-+&nbsp; &nbsp; &nbsp; sgml.stamp html.stamp pdf.stamp<br>
- <br>
- SCANOBJ_FILES =3D&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
\<br>
-&nbsp; &nbsp; &nbsp; &nbsp;$(DOC_MODULE).args&nbsp; &nbsp; &nbsp; &nbsp;\<=
br>
-@@ -120,27 +120,12 @@<br>
- $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_=
MODULE)-overrides.txt: scan-build.stamp<br>
-&nbsp; &nbsp; &nbsp; &nbsp;@true<br>
- <br>
--#### templates ####<br>
--<br>
--tmpl-build.stamp: setup-build.stamp $(DOC_MODULE)-decl.txt $(SCANOBJ_FILE=
S) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt<br>
--&nbsp; &nbsp; &nbsp; @echo '&nbsp; DOC&nbsp; &nbsp;Rebuilding template fi=
les'<br>
--&nbsp; &nbsp; &nbsp; @gtkdoc-mktmpl --module=3D$(DOC_MODULE) $(MKTMPL_OPT=
IONS)<br>
--&nbsp; &nbsp; &nbsp; @if test "$(abs_srcdir)" !=3D "$(abs_builddir)" ; th=
en \<br>
--&nbsp; &nbsp; &nbsp; &nbsp; if test -w $(abs_srcdir) ; then \<br>
--&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cp -rp $(abs_builddir)/tmpl $(abs_srcd=
ir)/; \<br>
--&nbsp; &nbsp; &nbsp; &nbsp; fi \<br>
--&nbsp; &nbsp; &nbsp; fi<br>
--&nbsp; &nbsp; &nbsp; @touch tmpl-build.stamp<br>
--<br>
--tmpl.stamp: tmpl-build.stamp<br>
--&nbsp; &nbsp; &nbsp; @true<br>
--<br>
- $(srcdir)/tmpl/*.sgml:<br>
-&nbsp; &nbsp; &nbsp; &nbsp;@true<br>
- <br>
- #### xml ####<br>
- <br>
--sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.=
sgml $(expand_content_files)<br>
-+sgml-build.stamp: $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expa=
nd_content_files)<br>
-&nbsp; &nbsp; &nbsp; &nbsp;@echo '&nbsp; DOC&nbsp; &nbsp;Building XML'<br>
-&nbsp; &nbsp; &nbsp; &nbsp;@-chmod -R u+w $(srcdir)<br>
-&nbsp; &nbsp; &nbsp; &nbsp;@_source_dir=3D'' ; \<br>
- --- a/gtkdoc/Makefile.am&nbsp; &nbsp; &nbsp; 2009-01-21 21:52:46.00000000=
0 +0100<br>
-+++ b/gtkdoc/Makefile.am&nbsp; &nbsp; &nbsp; &nbsp;2023-08-15 17:41:59.002=
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
+SUMMARY =3D "Implementation of XDG Sound Theme and Name Specifications"<br=
>
+DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound Theme a=
nd Name Specifications, for generating event sounds on free desktops."<br>
+LICENSE =3D "LGPL-2.1-or-later"<br>
+LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file=
://src/canberra.h;beginline=3D7;endline=3D24;md5=3Dc616c687cf8da540a14f917e=
0d23ab03"<br>
+<br>
+DEPENDS =3D "libtool libvorbis"<br>
+<br>
+inherit autotools gtk-doc<br>
+<br>
+SRC_URI =3D " \<br>
+&nbsp; &nbsp; git://<a href=3D"http://salsa.debian.org/gnome-team/libcanbe=
rra;protocol=3Dhttps;branch=3Ddebian/latest;tag=3Ddebian/$%7BPV%7D" rel=3D"=
noreferrer" target=3D"_blank">salsa.debian.org/gnome-team/libcanberra;proto=
col=3Dhttps;branch=3Ddebian/latest;tag=3Ddebian/${PV}</a> \<br>
+&nbsp; &nbsp; file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.=
patch \<br>
+"<br>
+SRCREV =3D "d1ed1ac0c9950ed3908c04abb7c4a6de5c51ed94"<br>
+<br>
+EXTRA_OECONF =3D "\<br>
+&nbsp; &nbsp; --enable-null \<br>
+&nbsp; &nbsp; --disable-oss \<br>
+&nbsp; &nbsp; --disable-tdb \<br>
+&nbsp; &nbsp; --disable-lynx \<br>
+"<br>
+<br>
+PACKAGECONFIG ??=3D " \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${@bb.utils.filter('DISTRO_FEATURES', 'alsa pul=
seaudio', d)} \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${@bb.utils.contains_any('DISTRO_FEATURES', 'x1=
1 wayland', 'gtk3 gstreamer', '', d)} \<br>
+"<br>
+PACKAGECONFIG[alsa] =3D "--enable-alsa, --disable-alsa, alsa-lib"<br>
+PACKAGECONFIG[pulseaudio] =3D "--enable-pulse, --disable-pulse, pulseaudio=
"<br>
+PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer, --disable-gstreamer, gst=
reamer1.0"<br>
+PACKAGECONFIG[gtk] =3D "--enable-gtk, --disable-gtk, gtk+"<br>
+PACKAGECONFIG[gtk3] =3D "--enable-gtk3, --disable-gtk3, gtk+3"<br>
+<br>
+FILES:${PN} +=3D " \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${systemd_system_unitdir} \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${libdir}/gtk-2.0 \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${libdir}/gtk-3.0 \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${libdir}/gnome-settings-daemon-3.0 \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${libdir}/libcanberra-0.30 \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${datadir}/gdm \<br>
+&nbsp; &nbsp; &nbsp; &nbsp;${datadir}/gnome \<br>
+"<br>
+FILES:${PN}-dev +=3D "${datadir}/vala"<br>
+<br>
+# libcanberra-gtk3-module.so ships a symlink to libcanberra-gtk-module.so<=
br>
+INSANE_SKIP:${PN} =3D "dev-so"<br>
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
-SUMMARY =3D "Implementation of XDG Sound Theme and Name Specifications"<br=
>
-DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound Theme a=
nd Name Specifications, for generating event sounds on free desktops."<br>
-LICENSE =3D "LGPL-2.1-or-later"<br>
-LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \=
<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file=
://src/canberra.h;beginline=3D7;endline=3D24;md5=3Dc616c687cf8da540a14f917e=
0d23ab03"<br>
-<br>
-DEPENDS =3D "libtool libvorbis"<br>
-<br>
-inherit autotools gtk-doc<br>
-<br>
-SRC_URI =3D " \<br>
-&nbsp; &nbsp; <a href=3D"http://0pointer.de/lennart/projects/$%7BBPN%7D/$%=
7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://0poi=
nter.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz</a> \<br>
-&nbsp; &nbsp; file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play=
.patch \<br>
-&nbsp; &nbsp; file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displ=
ays-.patch \<br>
-&nbsp; &nbsp; file://0001-remove-dropped-templates.patch \<br>
-&nbsp; &nbsp; file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.=
patch \<br>
-"<br>
-SRC_URI[sha256sum] =3D "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed3700=
4bf48c601afa72"<br>
-<br>
-EXTRA_OECONF =3D "\<br>
-&nbsp; &nbsp; --enable-null \<br>
-&nbsp; &nbsp; --disable-oss \<br>
-&nbsp; &nbsp; --disable-tdb \<br>
-&nbsp; &nbsp; --disable-lynx \<br>
-"<br>
-<br>
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudi=
o', d)} \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${@bb=
.utils.contains('DISTRO_FEATURES', 'x11', 'gtk gtk3', '', d)} \<br>
-"<br>
-PACKAGECONFIG[alsa] =3D "--enable-alsa, --disable-alsa, alsa-lib"<br>
-PACKAGECONFIG[pulseaudio] =3D "--enable-pulse, --disable-pulse, pulseaudio=
"<br>
-PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer, --disable-gstreamer, gst=
reamer1.0"<br>
-PACKAGECONFIG[gtk] =3D "--enable-gtk, --disable-gtk, gtk+"<br>
-PACKAGECONFIG[gtk3] =3D "--enable-gtk3, --disable-gtk3, gtk+3"<br>
-<br>
-python populate_packages:prepend() {<br>
-&nbsp; &nbsp; plugindir =3D d.expand('${libdir}/${BPN}-${PV}/')<br>
-&nbsp; &nbsp; do_split_packages(d, plugindir, r'^libcanberra-(.*)\.so$', '=
libcanberra-%s', '%s support library', extra_depends=3D'' )<br>
-&nbsp; &nbsp; do_split_packages(d, plugindir, r'^libcanberra-(.*)\.la$', '=
libcanberra-%s', '%s support library', extra_depends=3D'' )<br>
-}<br>
-<br>
-PACKAGES =3D+ "${PN}-gnome ${PN}-gtk2 ${PN}-gtk3 ${PN}-systemd"<br>
-PACKAGES_DYNAMIC +=3D "^libcanberra-.*"<br>
-<br>
-FILES:${PN} =3D "${bindir}/ ${libdir}/${BPN}.so.*"<br>
-<br>
-FILES:${PN}-dev +=3D "${datadir}/vala/vapi ${libdir}/*/modules/*.la ${libd=
ir}/*/*.la"<br>
-<br>
-FILES:${PN}-dbg +=3D "${libdir}/${BPN}-${PV}/.debug ${libdir}/gtk-*/module=
s/.debug"<br>
-<br>
-FILES:${PN}-gtk2 =3D "${libdir}/${BPN}-gtk.so.* \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${li=
bdir}/gtk-2.0/modules/*.so \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${bi=
ndir}/canberra-gtk-play"<br>
-<br>
-# -gtk3 ships a symlink to a .so<br>
-INSANE_SKIP:${PN}-gtk3 =3D "dev-so"<br>
-FILES:${PN}-gtk3 =3D "${libdir}/${BPN}-gtk3.so.* \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${li=
bdir}/gtk-3.0/modules/*.so \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${bi=
ndir}/canberra-gtk3-play"<br>
-<br>
-FILES:${PN}-gnome =3D "${libdir}/gnome-settings-daemon-3.0/ \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;${datadir}/gdm/ ${datadir}/gnome/"<br>
-<br>
-FILES:${PN}-systemd =3D "${systemd_unitdir}/system/*.service"<br>
-- <br>
2.52.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>
--=-U7qtQh0to4GcytOlgQAn--


