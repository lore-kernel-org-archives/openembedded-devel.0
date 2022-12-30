Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B17BC53210
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 10:59:02 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.16055.1672397939696354540
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 02:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id 7E6D5FED9
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 11:58:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.94]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pBD6F-4cGBd30; Fri, 30 Dec 2022 11:58:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/5] libwnck3: update 40.1 -> 43.0
Date: Fri, 30 Dec 2022 11:58:40 +0100
Message-Id: <20221230105844.428064-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672397935-3B7ED81E-EC3AF9B2/0/0 CLEAN NORMAL
X-TOI-MSGID: 71da6271-925d-426b-9fef-c9697a5f694f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 10:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100308

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libwnck/{libwnck3_40.1.bb =3D> libwnck3_43.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_40.1.bb =3D> libwnck3_=
43.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb b/meta-gno=
me/recipes-gnome/libwnck/libwnck3_43.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
index a6c82b2cb..5b4de3290 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2"
 BPN =3D "libwnck"
=20
 SECTION =3D "x11/libs"
-DEPENDS =3D "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native=
"
+DEPENDS =3D "cairo glib-2.0 gtk+3"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] =3D "-Dstartup_notification=3Denabled,-Dstartup_notif=
ication=3Ddisabled,startup-notification libxres"
@@ -20,7 +20,7 @@ inherit gnomebase gobject-introspection gtk-doc gettext=
 features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "03134fa114ef3fbe34075aa83678f58aa2debe9f=
cef4ea23c0779e28601d6611"
+SRC_URI[archive.sha256sum] =3D "905bcdb85847d6b8f8861e56b30cd6dc61eae67e=
cef4cd994a9f925a26a2c1fe"
=20
 # gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.
--=20
2.34.1


