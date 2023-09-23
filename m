Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96233CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 01:28:50 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.13283.1695432522862732637
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 18:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id 3DD1E12AC6
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 03:28:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.192]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjrRp-1Csnkg0; Sat, 23 Sep 2023 03:28:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gedit: Upgrade 44.2 -> 46.1
Date: Sat, 23 Sep 2023 03:28:30 +0200
Message-ID: <20230923012830.3338338-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230923012830.3338338-1-f_l_k@t-online.de>
References: <20230923012830.3338338-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695432521-D0FE3FD5-D313B1C7/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d071d79-d259-4b66-b59a-d85a1f689c1a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 01:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105088

- add recipes for libedit-amtk and libgedit-gtksourceview
- update dependencies
- fix reproducibility issue

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gedit/{gedit_44.2.bb =3D> gedit_46.1.bb}    | 13 ++++++++++---
 .../gedit/libgedit-amtk_5.8.0.bb              | 17 +++++++++++++++++
 .../gedit/libgedit-gtksourceview_299.0.4.bb   | 19 +++++++++++++++++++
 3 files changed, 46 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_44.2.bb =3D> gedit_46.1.bb}=
 (67%)
 create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview=
_299.0.4.bb

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.1.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
index 34c782297..0538221f4 100644
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
+    sed -i -e 's|${S}/src|/usr/src/debug/${PN}/${PV}-${PR}/src|g' ${B}/p=
lugins/filebrowser/gedit-file-browser-enum-types.c
+}
+
 GIR_MESON_OPTION =3D ""
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb b/meta=
-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
new file mode 100644
index 000000000..59ae16948
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "libgedit-amtk - Actions, Menus and Toolbars Kit for GTK app=
lications"
+SECTION =3D "gnome"
+LICENSE =3D "LGPL-3.0-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSES;md5=3D75859989545e37968a99b631ef42=
722e"
+
+DEPENDS =3D "amtk"
+
+inherit meson pkgconfig gobject-introspection gtk-doc
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
index 000000000..9a68bbda2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "Gedit Technology - Source code editing widget"
+SECTION =3D "gnome"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef427=
22e"
+
+DEPENDS =3D "glib-2.0 gtk+3 libxml2"
+
+inherit meson pkgconfig gobject-introspection gtk-doc
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
+FILES:${PN} +=3D "${datadir}"
--=20
2.42.0


