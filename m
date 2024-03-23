Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A1BC54E67
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:26 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.5241.1711183280372945127
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 3E3CC452E7
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwD-1MMRGb0; Sat, 23 Mar 2024 09:41:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 01/13] gtk4mm: add recipe
Date: Sat, 23 Mar 2024 09:41:26 +0100
Message-ID: <20240323084138.178281-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711183273-0CA7E850-FCFA4D5F/0/0 CLEAN NORMAL
X-TOI-MSGID: bfa2f6d2-59b6-4df4-9a52-3f16dc823730
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109534

the gtk4 variant of gtkmm is required for gnome-system-monitor

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb b/meta-oe/recipe=
s-gnome/gtk+/gtkmm4_4.14.0.bb
new file mode 100644
index 000000000..b0b51ed73
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "C++ bindings for the GTK+ toolkit V4"
+HOMEPAGE =3D "http://www.gtkmm.org/"
+SECTION =3D "libs"
+
+LICENSE =3D "LGPL-2.1-only & GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
+                    file://COPYING.tools;md5=3D751419260aa954499f7abaaba=
a882bbe"
+
+DEPENDS =3D "glib-2.0-native atkmm pangomm-2.48 glibmm gtk4 cairomm-1.16=
 gdk-pixbuf-native"
+
+BPN =3D "gtkmm"
+
+inherit gnomebase features_check
+
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+
+SRC_URI[archive.sha256sum] =3D "9350a0444b744ca3dc69586ebd1b6707520922b6=
d9f4f232103ce603a271ecda"
+
+EXTRA_OEMESON =3D "-Dbuild-demos=3Dfalse"
+
+FILES:${PN}-dev +=3D "${libdir}/*/include ${libdir}/*/proc/m4"
--=20
2.44.0


