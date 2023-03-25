Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E05C7EE22
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.17464.1679731399688605546
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 531691E820
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrq-0RoPhj0; Sat, 25 Mar 2023 09:03:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 27/32] zenity: update 3.43.0 -> 3.44.0
Date: Sat, 25 Mar 2023 09:02:51 +0100
Message-Id: <20230325080256.923752-27-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731394-8656CC08-C5296D0D/0/0 CLEAN NORMAL
X-TOI-MSGID: d2737e20-b222-4bc7-94cc-906423acdf33
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101741

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../zenity/{zenity_3.43.0.bb =3D> zenity_3.44.0.bb}   | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.43.0.bb =3D> zenity_3.4=
4.0.bb} (62%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.43.0.bb b/meta-gnom=
e/recipes-gnome/zenity/zenity_3.44.0.bb
similarity index 62%
rename from meta-gnome/recipes-gnome/zenity/zenity_3.43.0.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
index 195e139e5..72d93df42 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.43.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
@@ -5,21 +5,24 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase pkgconfig itstool gnome-help features_check gettext
+inherit gnomebase pkgconfig itstool gtk-icon-cache features_check gettex=
t
=20
 DEPENDS =3D " \
-    yelp-tools-native \
+    desktop-file-utils-native \
+    hicolor-icon-theme \
     gtk+3 \
+    gtk+3-native \
 "
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI[archive.sha256sum] =3D "b0d7ca1e0c1868fa18f05c210260d8a7be1f08ee=
13b7f5cfdbab9b61fa16f833"
+SRC_URI[archive.sha256sum] =3D "c15582301ed90b9d42ce521dbccf99a989f22f12=
041bdd5279c6636da99ebf65"
 SRC_URI +=3D "file://0001-Harcode-shebang-to-avoid-pointing-to-build-sys=
tem-s-.patch"
=20
-PACKAGECONFIG[libnotify] =3D "-Dlibnotify=3Dtrue,-Dlibnotify=3Dfalse,lib=
notify"
-PACKAGECONFIG[webkitgtk] =3D "-Dwebkitgtk=3Dtrue,-Dwebkitgtk=3Dfalse,web=
kitgtk"
+PACKAGECONFIG ?=3D "webkitgtk"
+PACKAGECONFIG[webkitgtk] =3D "-Dwebkitgtk=3Dtrue,-Dwebkitgtk=3Dfalse,web=
kitgtk-4"
=20
 PACKAGES =3D+ "${PN}-gdialog"
 FILES:${PN}-gdialog =3D "${bindir}/gdialog"
+FILES:${PN}-doc =3D "${datadir}/man ${datadir}/help"
 RDEPENDS:${PN}-gdialog +=3D "perl"
--=20
2.34.1


