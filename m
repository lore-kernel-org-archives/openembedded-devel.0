Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759C7E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:38:15 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.2108.1733942288373200294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout08.t-online.de (Postfix) with SMTP id BC174204
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 19:38:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.231]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tLRb2-3NLRTd0; Wed, 11 Dec 2024 19:38:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] nautilus: update 47.0 -> 47.1
Date: Wed, 11 Dec 2024 19:38:09 +0100
Message-ID: <20241211183809.15553-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733942284-7BFFC9EF-EE6E92CD/0/0 CLEAN NORMAL
X-TOI-MSGID: 1806e5bb-8718-4abd-b684-42dab5807b7e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 18:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114281

Major changes in 47.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements:
 - Speed up thumbnail loading (Khalid Abu Shawarib)
* Bugfixes:
 - Do not force reload when error is present to avoid showing auth dialog=
 (Gary Li)
 - Open folder in correct window during a DnD hover (Khalid Abu Shawarib)
 - Show username in file properties if name is an empty string (Khalid Ab=
u Shawarib)
 - Various a11y fixes (Khalid Abu Shawarib)
 - Fix number placement when making new name for directory (Khalid Abu Sh=
awarib)
 - Various pathbar fixes (Corey Berla, Khalid Abu Shawarib)
 - Show alert dialog when a symlink is broken (Automeris naranja)
 - Fix crashes when opening (Khalid Abu Shawarib)
 - Various sidebar fixes (Khalid Abu Shawarib, sid)
 - Fix ctrl + scroll to zoom in and out of view (Corey Berla)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nautilus/{nautilus_47.0.bb =3D> nautilus_47.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_47.0.bb =3D> nautilus=
_47.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_47.0.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_47.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_47.0.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_47.1.bb
index b8df8419bd..4baa8c2944 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_47.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_47.1.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "334264cdd9edbfd95ee7bcaafe442ebed31acca3=
f2d9b90f3eda30eacfd0387a"
+SRC_URI[archive.sha256sum] =3D "15450ebc7aa61ed2fae63130af9ebbbae14ce706=
a547f594c66bb8cca724d74c"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
--=20
2.47.0


