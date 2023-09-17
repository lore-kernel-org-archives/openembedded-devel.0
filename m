Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E63FCD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 19:10:15 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.35980.1694977811339079360
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 12:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id B0BBD19F44
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 21:10:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.208]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhx9c-2zEufJ0; Sun, 17 Sep 2023 21:10:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] tecla: add recipe
Date: Sun, 17 Sep 2023 21:09:53 +0200
Message-ID: <20230917190953.2355067-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694977801-73FFC980-45DFCDAA/0/0 CLEAN NORMAL
X-TOI-MSGID: 657e5087-983a-4975-9fd1-cde54345a13c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 19:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104917

Tecla is a keyboard layout viewer that uses GTK/Libadwaita for UI,
and libxkbcommon to deal with keyboard maps.

It is a required dependency for gnome-control-center-45

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/tecla/tecla_45.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/tecla/tecla_45.0.bb

diff --git a/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb b/meta-gnome/re=
cipes-gnome/tecla/tecla_45.0.bb
new file mode 100644
index 000000000..c047e29b7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Tecla is a keyboard layout viewer that uses GTK/Libadwaita =
for UI, and libxkbcommon to deal with keyboard maps."
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D75859989545e37968a99b631ef427=
22e"
+
+DEPENDS =3D " \
+    libxkbcommon \
+    libadwaita \
+    wayland \
+    gtk4 \
+"
+
+REQUIRED_DISTRO_FEATURES =3D "wayland"
+GNOMEBASEBUILDCLASS =3D "meson"
+
+inherit gnomebase pkgconfig  features_check
+
+SRC_URI[archive.sha256sum] =3D "5c02bb4019b1cffb5663da6107503eff853836a8=
783dd4705dd04a49f7adc25b"
--=20
2.41.0


