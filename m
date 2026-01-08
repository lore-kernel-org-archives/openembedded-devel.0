Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C0AD185E8
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 11:56:11 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4849.1767873367228806713
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 03:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout09.t-online.de (Postfix) with SMTP id BF676384EA
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Jan 2026 12:56:04 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.196]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vdocM-11xWID0; Thu, 8 Jan 2026 12:55:54 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcanberra: update 0.30 -> 0.30-19
Date: Thu,  8 Jan 2026 12:55:41 +0100
Message-ID: <20260108115545.2793869-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1767873355-67FFCAF5-6B593DA1/0/0 CLEAN NORMAL
X-TOI-MSGID: 854b5449-ec95-4e91-bf04-a3df30de9afb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 11:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123270

Lennart Poettering stopped maintaining libcanberra over a decade ago but =
it is still
maintained by the debian gnome-team.

Most notable improvement is that building the libcanberra-gtk3-module doe=
sn't depend
on gtk2 anymore and thus libcanberra isn't dependent on x11 to build supp=
ort for gtk3

- fetch source from salsa.debian.org, use git for it
- remove outdated patches
- dont build gtk+ module by default anymore
- simplify packaging

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...d-gtk3-version-for-canberra_gtk_play.patch | 94 -------------------
 ...-all-GdkDisplays-are-GdkX11Displays-.patch | 65 -------------
 .../files/0001-remove-dropped-templates.patch | 65 -------------
 .../libcanberra/libcanberra_0.30-19.bb        | 47 ++++++++++
 .../libcanberra/libcanberra_0.30.bb           | 64 -------------
 5 files changed, 47 insertions(+), 288 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libcanberra/files/0001-build-=
gtk-and-gtk3-version-for-canberra_gtk_play.patch
 delete mode 100644 meta-oe/recipes-support/libcanberra/files/0001-gtk-Do=
n-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch
 delete mode 100644 meta-oe/recipes-support/libcanberra/files/0001-remove=
-dropped-templates.patch
 create mode 100644 meta-oe/recipes-support/libcanberra/libcanberra_0.30-=
19.bb
 delete mode 100644 meta-oe/recipes-support/libcanberra/libcanberra_0.30.=
bb

diff --git a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and=
-gtk3-version-for-canberra_gtk_play.patch b/meta-oe/recipes-support/libca=
nberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch
deleted file mode 100644
index 89f31f7946..0000000000
--- a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-v=
ersion-for-canberra_gtk_play.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 4a89ddffbb14d747adbe3365ace4db87de52ba39 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Mon, 16 Sep 2013 16:08:28 +0200
-Subject: [PATCH] build gtk- and gtk3-version for canberra_gtk_play
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
----
-Upstream-Status: Pending
-
- src/Makefile.am |   25 +++++++++++++++----------
- 1 files changed, 15 insertions(+), 10 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 56ed96d..fc72e1f 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -319,9 +319,6 @@ endif
-=20
- if HAVE_GTK_ANY
-=20
--bin_PROGRAMS +=3D \
--	canberra-gtk-play
--
- include_HEADERS +=3D \
- 	canberra-gtk.h
-=20
-@@ -329,6 +326,9 @@ endif
-=20
- if HAVE_GTK3
-=20
-+bin_PROGRAMS +=3D \
-+	canberra-gtk3-play
-+
- lib_LTLIBRARIES +=3D \
- 	libcanberra-gtk3.la
-=20
-@@ -367,6 +367,9 @@ endif
-=20
- if HAVE_GTK
-=20
-+bin_PROGRAMS +=3D \
-+	canberra-gtk-play
-+
- lib_LTLIBRARIES +=3D \
- 	libcanberra-gtk.la
-=20
-@@ -399,14 +402,17 @@ endif
-=20
- if HAVE_GTK3
-=20
--canberra_gtk_play_LDADD =3D \
-+canberra_gtk3_play_LDADD =3D \
- 	$(GTK3_LIBS) \
- 	libcanberra.la \
- 	libcanberra-gtk3.la
--canberra_gtk_play_CFLAGS =3D \
-+canberra_gtk3_play_CFLAGS =3D \
- 	$(GTK3_CFLAGS)
-=20
--else
-+canberra_gtk3_play_SOURCES =3D \
-+	canberra-gtk-play.c
-+
-+endif
- if HAVE_GTK
-=20
- canberra_gtk_play_LDADD =3D \
-@@ -416,7 +422,9 @@ canberra_gtk_play_LDADD =3D \
- canberra_gtk_play_CFLAGS =3D \
- 	$(GTK_CFLAGS)
-=20
--endif
-+canberra_gtk_play_SOURCES =3D \
-+	canberra-gtk-play.c
-+
- endif
-=20
- if HAVE_GTK_ANY
-@@ -424,9 +432,6 @@ if HAVE_GTK_ANY
- dist_gsdgtkmodules_DATA =3D \
- 	canberra-gtk-module.desktop
-=20
--canberra_gtk_play_SOURCES =3D \
--	canberra-gtk-play.c
--
- EXTRA_DIST +=3D \
- 	libcanberra-login-sound.desktop.in \
- 	libcanberra-ready-sound.desktop.in \
---=20
-1.7.6.5
-
diff --git a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-ass=
ume-all-GdkDisplays-are-GdkX11Displays-.patch b/meta-oe/recipes-support/l=
ibcanberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays=
-.patch
deleted file mode 100644
index 1e45441ff9..0000000000
--- a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all=
-GdkDisplays-are-GdkX11Displays-.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c0620e432650e81062c1967cc669829dbd29b310 Mon Sep 17 00:00:00 2001
-From: Michael Meeks <michael.meeks@suse.com>
-Date: Fri, 9 Nov 2012 16:16:40 +0000
-Subject: [PATCH] gtk: Don't assume all GdkDisplays are GdkX11Displays:
- broadway/wayland
-
----
-Upstream-Status: Pending
-
- src/canberra-gtk-module.c | 15 +++++++++++++++
- src/canberra-gtk.c        |  5 +++++
- 2 files changed, 20 insertions(+)
-
---- a/src/canberra-gtk-module.c
-+++ b/src/canberra-gtk-module.c
-@@ -307,6 +307,11 @@ static gint window_get_desktop(GdkDispla
-         guchar *data =3D NULL;
-         gint ret =3D -1;
-=20
-+#ifdef GDK_IS_X11_DISPLAY
-+        if (!GDK_IS_X11_DISPLAY(d))
-+                return 0;
-+#endif
-+
-         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d), GDK_WINDOW_XID(=
w),
-                                gdk_x11_get_xatom_by_name_for_display(d,=
 "_NET_WM_DESKTOP"),
-                                0, G_MAXLONG, False, XA_CARDINAL, &type_=
return,
-@@ -335,6 +340,11 @@ static gint display_get_desktop(GdkDispl
-         guchar *data =3D NULL;
-         gint ret =3D -1;
-=20
-+#ifdef GDK_IS_X11_DISPLAY
-+        if (!GDK_IS_X11_DISPLAY(d))
-+                return 0;
-+#endif
-+
-         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d), DefaultRootWind=
ow(GDK_DISPLAY_XDISPLAY(d)),
-                                gdk_x11_get_xatom_by_name_for_display(d,=
 "_NET_CURRENT_DESKTOP"),
-                                0, G_MAXLONG, False, XA_CARDINAL, &type_=
return,
-@@ -365,6 +375,11 @@ static gboolean window_is_xembed(GdkDisp
-         gboolean ret =3D FALSE;
-         Atom xembed;
-=20
-+#ifdef GDK_IS_X11_DISPLAY
-+        if (!GDK_IS_X11_DISPLAY(d))
-+                return FALSE;
-+#endif
-+
-         /* Gnome Panel applets are XEMBED windows. We need to make sure=
 we
-          * ignore them */
-=20
---- a/src/canberra-gtk.c
-+++ b/src/canberra-gtk.c
-@@ -185,6 +185,11 @@ static gint window_get_desktop(GdkDispla
-         guchar *data =3D NULL;
-         gint ret =3D -1;
-=20
-+#ifdef GDK_IS_X11_DISPLAY
-+        if (!GDK_IS_X11_DISPLAY(d))
-+                return 0;
-+#endif
-+
-         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d), GDK_WINDOW_XID(=
w),
-                                gdk_x11_get_xatom_by_name_for_display(d,=
 "_NET_WM_DESKTOP"),
-                                0, G_MAXLONG, False, XA_CARDINAL, &type_=
return,
diff --git a/meta-oe/recipes-support/libcanberra/files/0001-remove-droppe=
d-templates.patch b/meta-oe/recipes-support/libcanberra/files/0001-remove=
-dropped-templates.patch
deleted file mode 100644
index 57f5486084..0000000000
--- a/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-templ=
ates.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From dfd3ef4caac300f517f8eeb378f0b0f9ba6a9b06 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Tue, 15 Aug 2023 15:41:03 +0200
-Subject: [PATCH] remove dropped gtkdoc templates
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Pending
----
---- a/gtkdoc/gtk-doc.make	2011-08-25 23:20:22.000000000 +0200
-+++ b/gtkdoc/gtk-doc.make	2023-08-15 18:08:02.430729073 +0200
-@@ -33,9 +33,9 @@
- 	$(HTML_IMAGES)			\
- 	$(SETUP_FILES)
-=20
--DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp tmpl-build.stamp sgml-b=
uild.stamp \
-+DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp sgml-build.stamp \
- 	html-build.stamp pdf-build.stamp \
--	tmpl.stamp sgml.stamp html.stamp pdf.stamp
-+	sgml.stamp html.stamp pdf.stamp
-=20
- SCANOBJ_FILES =3D 		 \
- 	$(DOC_MODULE).args 	 \
-@@ -120,27 +120,12 @@
- $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DO=
C_MODULE)-overrides.txt: scan-build.stamp
- 	@true
-=20
--#### templates ####
--
--tmpl-build.stamp: setup-build.stamp $(DOC_MODULE)-decl.txt $(SCANOBJ_FI=
LES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
--	@echo '  DOC   Rebuilding template files'
--	@gtkdoc-mktmpl --module=3D$(DOC_MODULE) $(MKTMPL_OPTIONS)
--	@if test "$(abs_srcdir)" !=3D "$(abs_builddir)" ; then \
--	  if test -w $(abs_srcdir) ; then \
--	    cp -rp $(abs_builddir)/tmpl $(abs_srcdir)/; \
--	  fi \
--	fi
--	@touch tmpl-build.stamp
--
--tmpl.stamp: tmpl-build.stamp
--	@true
--
- $(srcdir)/tmpl/*.sgml:
- 	@true
-=20
- #### xml ####
-=20
--sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/=
*.sgml $(expand_content_files)
-+sgml-build.stamp: $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(ex=
pand_content_files)
- 	@echo '  DOC   Building XML'
- 	@-chmod -R u+w $(srcdir)
- 	@_source_dir=3D'' ; \
- --- a/gtkdoc/Makefile.am	2009-01-21 21:52:46.000000000 +0100
-+++ b/gtkdoc/Makefile.am	2023-08-15 17:41:59.002498772 +0200
-@@ -31,10 +31,6 @@
- # e.g. MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml
- MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml
-=20
--# Extra options to supply to gtkdoc-mktmpl
--# e.g. MKTMPL_OPTIONS=3D--only-section-tmpl
--MKTMPL_OPTIONS=3D
--
- # Extra options to supply to gtkdoc-fixref. Not normally needed.
- # e.g. FIXXREF_OPTIONS=3D--extra-dir=3D../gdk-pixbuf/html --extra-dir=3D=
../gdk/html
- FIXXREF_OPTIONS=3D
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb b=
/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
new file mode 100644
index 0000000000..b7eb50e463
--- /dev/null
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
@@ -0,0 +1,47 @@
+SUMMARY =3D "Implementation of XDG Sound Theme and Name Specifications"
+DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound Theme=
 and Name Specifications, for generating event sounds on free desktops."
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1=
 \
+                    file://src/canberra.h;beginline=3D7;endline=3D24;md5=
=3Dc616c687cf8da540a14f917e0d23ab03"
+
+DEPENDS =3D "libtool libvorbis"
+
+inherit autotools gtk-doc
+
+SRC_URI =3D " \
+    git://salsa.debian.org/gnome-team/libcanberra;protocol=3Dhttps;branc=
h=3Ddebian/latest;tag=3Ddebian/${PV} \
+    file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch \
+"
+SRCREV =3D "d1ed1ac0c9950ed3908c04abb7c4a6de5c51ed94"
+
+EXTRA_OECONF =3D "\
+    --enable-null \
+    --disable-oss \
+    --disable-tdb \
+    --disable-lynx \
+"
+
+PACKAGECONFIG ??=3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
+	${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk3 gstrea=
mer', '', d)} \
+"
+PACKAGECONFIG[alsa] =3D "--enable-alsa, --disable-alsa, alsa-lib"
+PACKAGECONFIG[pulseaudio] =3D "--enable-pulse, --disable-pulse, pulseaud=
io"
+PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer, --disable-gstreamer, g=
streamer1.0"
+PACKAGECONFIG[gtk] =3D "--enable-gtk, --disable-gtk, gtk+"
+PACKAGECONFIG[gtk3] =3D "--enable-gtk3, --disable-gtk3, gtk+3"
+
+FILES:${PN} +=3D " \
+	${systemd_system_unitdir} \
+	${libdir}/gtk-2.0 \
+	${libdir}/gtk-3.0 \
+	${libdir}/gnome-settings-daemon-3.0 \
+	${libdir}/libcanberra-0.30 \
+	${datadir}/gdm \
+	${datadir}/gnome \
+"
+FILES:${PN}-dev +=3D "${datadir}/vala"
+
+# libcanberra-gtk3-module.so ships a symlink to libcanberra-gtk-module.s=
o
+INSANE_SKIP:${PN} =3D "dev-so"
+
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb b/me=
ta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
deleted file mode 100644
index 7eac53ae90..0000000000
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-SUMMARY =3D "Implementation of XDG Sound Theme and Name Specifications"
-DESCRIPTION =3D "Libcanberra is an implementation of the XDG Sound Theme=
 and Name Specifications, for generating event sounds on free desktops."
-LICENSE =3D "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1=
 \
-                    file://src/canberra.h;beginline=3D7;endline=3D24;md5=
=3Dc616c687cf8da540a14f917e0d23ab03"
-
-DEPENDS =3D "libtool libvorbis"
-
-inherit autotools gtk-doc
-
-SRC_URI =3D " \
-    http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz \
-    file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch \
-    file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.pat=
ch \
-    file://0001-remove-dropped-templates.patch \
-    file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch \
-"
-SRC_URI[sha256sum] =3D "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37=
004bf48c601afa72"
-
-EXTRA_OECONF =3D "\
-    --enable-null \
-    --disable-oss \
-    --disable-tdb \
-    --disable-lynx \
-"
-
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseau=
dio', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk g=
tk3', '', d)} \
-"
-PACKAGECONFIG[alsa] =3D "--enable-alsa, --disable-alsa, alsa-lib"
-PACKAGECONFIG[pulseaudio] =3D "--enable-pulse, --disable-pulse, pulseaud=
io"
-PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer, --disable-gstreamer, g=
streamer1.0"
-PACKAGECONFIG[gtk] =3D "--enable-gtk, --disable-gtk, gtk+"
-PACKAGECONFIG[gtk3] =3D "--enable-gtk3, --disable-gtk3, gtk+3"
-
-python populate_packages:prepend() {
-    plugindir =3D d.expand('${libdir}/${BPN}-${PV}/')
-    do_split_packages(d, plugindir, r'^libcanberra-(.*)\.so$', 'libcanbe=
rra-%s', '%s support library', extra_depends=3D'' )
-    do_split_packages(d, plugindir, r'^libcanberra-(.*)\.la$', 'libcanbe=
rra-%s', '%s support library', extra_depends=3D'' )
-}
-
-PACKAGES =3D+ "${PN}-gnome ${PN}-gtk2 ${PN}-gtk3 ${PN}-systemd"
-PACKAGES_DYNAMIC +=3D "^libcanberra-.*"
-
-FILES:${PN} =3D "${bindir}/ ${libdir}/${BPN}.so.*"
-
-FILES:${PN}-dev +=3D "${datadir}/vala/vapi ${libdir}/*/modules/*.la ${li=
bdir}/*/*.la"
-
-FILES:${PN}-dbg +=3D "${libdir}/${BPN}-${PV}/.debug ${libdir}/gtk-*/modu=
les/.debug"
-
-FILES:${PN}-gtk2 =3D "${libdir}/${BPN}-gtk.so.* \
-                    ${libdir}/gtk-2.0/modules/*.so \
-                    ${bindir}/canberra-gtk-play"
-
-# -gtk3 ships a symlink to a .so
-INSANE_SKIP:${PN}-gtk3 =3D "dev-so"
-FILES:${PN}-gtk3 =3D "${libdir}/${BPN}-gtk3.so.* \
-                    ${libdir}/gtk-3.0/modules/*.so \
-                    ${bindir}/canberra-gtk3-play"
-
-FILES:${PN}-gnome =3D "${libdir}/gnome-settings-daemon-3.0/ \
-                     ${datadir}/gdm/ ${datadir}/gnome/"
-
-FILES:${PN}-systemd =3D "${systemd_unitdir}/system/*.service"
--=20
2.52.0


