Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9FCCE7A8A
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 07:02:19 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.35630.1695538933487127863
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 00:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id 7661C4CBE
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 09:02:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.4]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qkJ82-2FMlof0; Sun, 24 Sep 2023 09:02:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv4] gedit: Upgrade 44.2 -> 46.1
Date: Sun, 24 Sep 2023 09:01:59 +0200
Message-ID: <20230924070159.3720001-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695538926-650B27A2-10D4276F/0/0 CLEAN NORMAL
X-TOI-MSGID: 447356c9-140d-49e7-a534-8a9c3669ca17
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 07:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105104

- add recipes for libedit-amtk and libgedit-gtksourceview
- drop deprecated amtk recipe
- update dependencies
- fix reproducibility issue

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb   | 22 -----------------
 .../gedit/{gedit_44.2.bb =3D> gedit_46.1.bb}    | 13 +++++++---
 .../gedit/libgedit-amtk_5.8.0.bb              | 17 +++++++++++++
 .../gedit/libgedit-gtksourceview_299.0.4.bb   | 24 +++++++++++++++++++
 4 files changed, 51 insertions(+), 25 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
 rename meta-gnome/recipes-gnome/gedit/{gedit_44.2.bb =3D> gedit_46.1.bb}=
 (69%)
 create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview=
_299.0.4.bb

diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb b/meta-gnome/rec=
ipes-gnome/amtk/amtk_5.6.1.bb
deleted file mode 100644
index fbc8f3845..000000000
--- a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY =3D "Actions, Menus and Toolbars Kit"
-LICENSE =3D "LGPL-3.0-or-later"
-LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-3.0-or-later.txt;md5=3Dc51d3e=
ef3be114124d11349ca0d7e117"
-
-DEPENDS =3D " \
-    glib-2.0-native \
-    gtk+3 \
-    gtk-doc-native \
-    libxslt-native \
-    docbook-xsl-stylesheets-native \
-    python3-pygments-native \
-"
-
-GNOMEBASEBUILDCLASS =3D "meson"
-
-GIR_MESON_OPTION =3D ""
-
-inherit gnomebase gettext features_check gobject-introspection
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-SRC_URI[archive.sha256sum] =3D "d50115b85c872aac296934b5ee726a3fa156c6f5=
ad96d27e0edd0aa5ad173228"
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.1.bb
similarity index 69%
rename from meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
index 34c782297..01d7a072a 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
@@ -6,27 +6,34 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e=
37968a99b631ef42722e"
 GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
+    appstream-glib-native \
+    desktop-file-utils-native \
+    libgedit-amtk \
+    libgedit-gtksourceview \
     gdk-pixbuf-native \
     gtk+3 \
     gsettings-desktop-schemas \
     libpeas \
     libsoup \
     gspell \
-    gtksourceview4 \
     tepl \
 "
=20
-inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk=
-doc vala gettext features_check mime-xdg python3targetconfig
+inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk=
-doc vala gettext features_check mime-xdg gtk-icon-cache python3targetcon=
fig
=20
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "3bbb1b3775d4c277daf54aaab44b0eb83a4eb1f0=
9f0391800041c9e56893ec11"
+SRC_URI[archive.sha256sum] =3D "a1a6e37f041765dff7227a1f5578b6f49faaf016=
b1e17e869caf5bfb94c6aa4e"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
+do_install:prepend() {
+    sed -i -e 's|${B}||g' ${B}/plugins/filebrowser/gedit-file-browser-en=
um-types.c
+}
+
 GIR_MESON_OPTION =3D ""
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb b/meta=
-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
new file mode 100644
index 000000000..11da836ff
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "libgedit-amtk - Actions, Menus and Toolbars Kit for GTK app=
lications"
+SECTION =3D "gnome"
+LICENSE =3D "LGPL-3.0-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-3.0-or-later.txt;md5=3Dc51d3e=
ef3be114124d11349ca0d7e117"
+
+DEPENDS =3D "glib-2.0 gtk+3"
+
+inherit meson pkgconfig gobject-introspection features_check gtk-doc
+
+SRC_URI =3D "git://github.com/gedit-technology/libgedit-amtk.git;protoco=
l=3Dhttps;branch=3Dmain"
+S =3D "${WORKDIR}/git"
+SRCREV =3D "f6fbfd1c57de3d97cab2056a5c3088b0da49e8a4"
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+GIR_MESON_OPTION =3D "gobject_introspection"
+GTKDOC_MESON_OPTION =3D "gtk_doc"
diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.=
4.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
new file mode 100644
index 000000000..3a655f650
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "Gedit Technology - Source code editing widget"
+SECTION =3D "gnome"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
+
+DEPENDS =3D "glib-2.0 gtk+3 libxml2"
+
+inherit meson pkgconfig gobject-introspection features_check gtk-doc
+
+SRC_URI =3D "git://github.com/gedit-technology/libgedit-gtksourceview.gi=
t;protocol=3Dhttps;branch=3Dmain"
+S =3D "${WORKDIR}/git"
+SRCREV =3D "7062264d635f6efe04d88217a893a97ff385b873"
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+GIR_MESON_OPTION =3D "gobject_introspection"
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+
+do_install:prepend() {
+    sed -i -e 's|${B}||g' ${B}/gtksourceview/gtksource-enumtypes.c
+    sed -i -e 's|${B}||g' ${B}/gtksourceview/gtksource-enumtypes.h
+}
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.42.0


