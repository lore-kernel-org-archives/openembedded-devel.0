Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B098CCA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:18 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.34376.1756974135377878140
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 01:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id E14D4EA7D
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Sep 2025 10:22:10 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.163.17]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uu5EM-3FNIaf0; Thu, 4 Sep 2025 10:22:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][RFC][PATCH 1/2] gtkmm: update 4.14.0 -> 4.19.1
Date: Thu,  4 Sep 2025 10:21:54 +0200
Message-ID: <20250904082155.1889717-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1756974126-E27FB977-94AFB109/0/0 CLEAN NORMAL
X-TOI-MSGID: af6d38b6-2666-4d64-b4e1-18aa930e2a33
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 08:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119273

update is required for gtk 4.20.0

- LIC_FILES_CHECKSUM changed but LICENSE is still valid

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gtk+/{gtkmm4_4.14.0.bb =3D> gtkmm4_4.19.1.bb}           | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm4_4.14.0.bb =3D> gtkmm4_4.19.1.b=
b} (62%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb b/meta-oe/recipe=
s-gnome/gtk+/gtkmm4_4.19.1.bb
similarity index 62%
rename from meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm4_4.19.1.bb
index d3a01e444c..96fd986551 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.19.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE =3D "http://www.gtkmm.org/"
 SECTION =3D "libs"
=20
 LICENSE =3D "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
-                    file://COPYING.tools;md5=3D751419260aa954499f7abaaba=
a882bbe"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21 \
+                    file://COPYING.tools;md5=3D570a9b3749dd0463a1778803b=
12a6dce"
=20
 DEPENDS =3D "glib-2.0-native atkmm pangomm-2.48 glibmm gtk4 cairomm-1.16=
 gdk-pixbuf-native"
=20
@@ -14,8 +14,10 @@ inherit gnomebase features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl x11"
=20
-SRC_URI[archive.sha256sum] =3D "9350a0444b744ca3dc69586ebd1b6707520922b6=
d9f4f232103ce603a271ecda"
+SRC_URI[archive.sha256sum] =3D "2b443ddfbf0cf28c4bece447a5bba62028c49df4=
5ccb1b3f438a3a3e0bca31aa"
=20
 EXTRA_OEMESON =3D "-Dbuild-demos=3Dfalse"
=20
 FILES:${PN}-dev +=3D "${libdir}/*/include ${libdir}/*/proc/m4"
+
+
--=20
2.50.1


