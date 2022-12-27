Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6C2C46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:53:05 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.152493.1672123979741122553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 5593A190B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:52:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.104]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pA3pU-2m9AI70; Tue, 27 Dec 2022 07:52:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/4] nautilus: update 42.2 -> 43.1
Date: Tue, 27 Dec 2022 07:52:34 +0100
Message-Id: <20221227065235.95271-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227065235.95271-1-f_l_k@t-online.de>
References: <20221227065235.95271-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672123972-6B7FA9DD-3F8F0906/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b33b70c-ef0d-45aa-b289-204579eda070
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100282

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{nautilus_42.2.bb =3D> nautilus_43.1.bb}    | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_42.2.bb =3D> nautilus=
_43.1.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_43.1.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_43.1.bb
index ec16b6879..a567e5fe7 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_43.1.bb
@@ -7,22 +7,26 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673=
463ab874e80d47fae504"
 GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
-    fontconfig \
-    gtk+3 \
-    gnome-desktop \
-    gsettings-desktop-schemas \
+    appstream-glib-native \
+    desktop-file-utils-native \
+    glib-2.0 \
     gnome-autoar \
-    tracker \
+    gnome-desktop \
+    gtk4 \
+    libadwaita \
+    libcloudproviders \
     libhandy \
+    libportal \
+    libxml2 \
+    tracker \
 "
=20
-inherit gnomebase gsettings gobject-introspection gtk-doc gettext featur=
es_check mime-xdg
+inherit gnomebase gsettings gobject-introspection gtk-doc gettext featur=
es_check mime-xdg gtk-icon-cache
=20
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI +=3D " file://0001-Provide-parameter-prototype-for-functions-wit=
hout-pa.patch"
-SRC_URI[archive.sha256sum] =3D "99212d2eb75996f181728ad04a2e2d86f2577b06=
4e68a34c8b81a7037df4ccb2"
+SRC_URI[archive.sha256sum] =3D "0da1003c0cda08ac0546a4c143ed3a1697e36823=
c60fa73f4d2f4da7723bccaf"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
@@ -31,8 +35,8 @@ EXTRA_OEMESON +=3D " \
 "
=20
 PACKAGECONFIG =3D "extensions"
-PACKAGECONFIG[extensions] =3D "-Dextensions=3Dtrue,-Dextensions=3Dfalse,=
 gexiv2 gstreamer1.0-plugins-base"
-PACKAGECONFIG[libportal] =3D "-Dlibportal=3Dtrue,-Dlibportal=3Dfalse, li=
bportal"
+PACKAGECONFIG[extensions] =3D "-Dextensions=3Dtrue,-Dextensions=3Dfalse,=
 gexiv2 gstreamer1.0-plugins-base gdk-pixbuf"
+PACKAGECONFIG[packagekit] =3D "-Dpackagekit=3Dtrue,-Dpackagekit=3Dfalse,=
packagekit"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
@@ -43,4 +47,4 @@ FILES:${PN} +=3D " \
=20
 # mandatory - not checked during configuration:
 # | (org.gnome.Nautilus:863): GLib-GIO-ERROR **: 21:03:52.326: Settings =
schema 'org.freedesktop.Tracker.Miner.Files' is not installed
-RDEPENDS:${PN} +=3D "tracker-miners"
+RDEPENDS:${PN} +=3D "tracker-miners bubblewrap"
--=20
2.34.1


