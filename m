Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEDDCD1282
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:27 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5313.1711183280495039044
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 43094452EA
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwD-1MMRGe0; Sat, 23 Mar 2024 09:41:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 04/13] eog: update 45.2 -> 45.3
Date: Sat, 23 Mar 2024 09:41:29 +0100
Message-ID: <20240323084138.178281-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1711183273-0CA7E850-B992A5D6/0/0 CLEAN NORMAL
X-TOI-MSGID: 84c1b52a-2383-4ecd-9416-f5ad3d619141
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109535

Version 45.3
------------

New and updated translations:

- Daniel Mustieles [es]
- Sveinn =C3=AD Felli [is]
- Aurimas =C4=8Cernius [lt]
- R=C5=ABdolfs Mazurs [lv]
- Martin Srebotnjak [sl]
- Cheng-Chia Tseng [zh_TW]

New and updated manual translations

- Juliano de Souza Camargo [pt_BR]
- Sabri =C3=9Cnal [tr]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/{eog_45.2.bb =3D> eog_45.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_45.2.bb =3D> eog_45.3.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_45.2.bb b/meta-gnome/recipe=
s-gnome/eog/eog_45.3.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_45.2.bb
rename to meta-gnome/recipes-gnome/eog/eog_45.3.bb
index f2295fdd5..00fe26669 100644
--- a/meta-gnome/recipes-gnome/eog/eog_45.2.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.3.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "d94cc39d82c80cee7281b82ace42c8225976ad5d=
0c3ef995c7e030f6bab2219c"
+SRC_URI[archive.sha256sum] =3D "8650f662d4921d83a7904f6bb9ca245baf735f71=
7b47fac5b37f0d90e5e891a8"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.44.0


