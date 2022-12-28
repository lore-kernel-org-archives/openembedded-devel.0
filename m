Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15FDC4708D
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 16:33:45 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.185305.1672245215896176562
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Dec 2022 08:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout07.t-online.de (Postfix) with SMTP id 7B85921168
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Dec 2022 17:33:33 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.156]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAZMz-39ZtfV0; Wed, 28 Dec 2022 17:33:33 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] file-roller: update 3.42.0 -> 43.0
Date: Wed, 28 Dec 2022 17:33:22 +0100
Message-Id: <20221228163322.45272-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672245213-C0B261D1-C21316E9/0/0 CLEAN NORMAL
X-TOI-MSGID: 79ab3150-d70c-4f9e-81f8-bbc0cc821662
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Dec 2022 16:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100293

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...{file-roller_3.42.0.bb =3D> file-roller_43.0.bb} | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.42.0.bb =3D> =
file-roller_43.0.bb} (58%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.42.0.bb b=
/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
similarity index 58%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.42.0.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
index f77400564..603d4232e 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.42.0.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
@@ -5,21 +5,26 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf3365=
9b29e73d4adb9f9f6552"
 GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
+    desktop-file-utils-native \
     glib-2.0-native \
+    glib-2.0 \
+    json-glib \
     gtk+3 \
     libarchive \
-    libnotify \
     libhandy \
+    libportal \
 "
=20
-inherit gnomebase gsettings itstool gnome-help gettext upstream-version-=
is-even mime-xdg
+inherit gnomebase gsettings itstool gobject-introspection gnome-help get=
text upstream-version-is-even mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "1c438e6d53ec10ff4f2eb5b22d7bbf28a7c2a849=
57ab64a751c1cdf3c52302c7"
+EXTRA_OEMESON +=3D "-Dintrospection=3Denabled"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'pac=
kagekit', '', d)}"
+SRC_URI[archive.sha256sum] =3D "298729fdbdb9da8132c0bbc60907517d65685b05=
618ae05167335e6484f573a1"
+
+PACKAGECONFIG ??=3D ""
=20
 PACKAGECONFIG[nautilus] =3D "-Dnautilus-actions=3Denabled,-Dnautilus-act=
ions=3Ddisabled,nautilus"
-PACKAGECONFIG[packagekit] =3D "-Dpackagekit=3Dtrue,-Dpackagekit=3Dfalse,=
"
+PACKAGECONFIG[packagekit] =3D "-Dpackagekit=3Dtrue,-Dpackagekit=3Dfalse,=
,packagekit"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.34.1


