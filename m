Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5690C83F34
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 17:07:24 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.19174.1753204043172137015
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 10:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout04.t-online.de (Postfix) with SMTP id 8BFCEE78A
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 19:07:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.113]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ueGSR-3Lqlzm0; Tue, 22 Jul 2025 19:07:15 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] nautilus: update 48.2 -> 48.3
Date: Tue, 22 Jul 2025 19:07:08 +0200
Message-ID: <20250722170708.234676-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722170708.234676-1-f_l_k@t-online.de>
References: <20250722170708.234676-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1753204035-DFFF9437-B195FD27/0/0 CLEAN NORMAL
X-TOI-MSGID: a2bad635-b4f8-4151-a90b-3969f0c5fafb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 17:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118699

Major Changes in 48.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements:
- Support more video/audio types in search filter (Corey Berla, Rodrigo M=
ichelassi)

* Bugfixes:
- Inhibit logout during file operations (Ignacy Kuchci=C5=84ski)
- Allow opening current diretroy in multiple-dir mode (Michael Terry)
- Prevent crash in location entry completions (Luk=C3=A1=C5=A1 Tyrychtr)
- Fix focusing window from other apps via DBus (Sebastian Keller)
- Correctly close wait dialogs (Luk=C3=A1=C5=A1 Tyrychtr)
- Prevent file chooser crash on opening an empty location (Nelson Ben)
- Use existing replacement for icon removed from theme (Peter Eisenmann)
- Fix file leaking in directory (Corey Berla)

* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nautilus/{nautilus_48.2.bb =3D> nautilus_48.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_48.2.bb =3D> nautilus=
_48.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_48.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_48.3.bb
index f867cd14d1..790fb71a63 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_48.3.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "a030f6163f8a68064fae5a9e89e37f19cbb293de=
2e12a19dd5e210956d0df4b5"
+SRC_URI[archive.sha256sum] =3D "21a2aea005160db083c7a1d4d2c0989b845cc722=
c04ef9ebb60125a7ec5b393d"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
--=20
2.50.1


