Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558E1C47422
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 18:24:13 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.90784.1705343050087814900
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 10:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout04.t-online.de (Postfix) with SMTP id 7F0D7139A2
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 19:24:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.169.126]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rPRcx-2E8KDh0; Mon, 15 Jan 2024 19:24:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/4] eog: update 45.1 -> 45.2
Date: Mon, 15 Jan 2024 19:23:58 +0100
Message-ID: <20240115182402.126946-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1705343044-DF21A917-B91877B5/0/0 CLEAN NORMAL
X-TOI-MSGID: 2da81cd1-a911-4979-bbac-cca11782d5b5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 18:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108295

Eye of GNOME 45.2

Bug fixes and improvements:

 !158, data: Update appdata (Sabri =C3=9Cnal)

New and updated translations:

- J=C3=BCrgen Benvenuti [de]
- Jiri Gr=C3=B6nroos [fi]
- Daniel =C8=98erb=C4=83nescu, Florentina Mu=C8=99at [ro]
- Du=C5=A1an Kazik [sk]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/{eog_45.1.bb =3D> eog_45.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_45.1.bb =3D> eog_45.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_45.1.bb b/meta-gnome/recipe=
s-gnome/eog/eog_45.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_45.1.bb
rename to meta-gnome/recipes-gnome/eog/eog_45.2.bb
index 41ed940c0..f2295fdd5 100644
--- a/meta-gnome/recipes-gnome/eog/eog_45.1.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "c17f86704c722b36c01a168f1e51439be0bb279f=
2c6646f48b66e9d0f3a24cd2"
+SRC_URI[archive.sha256sum] =3D "d94cc39d82c80cee7281b82ace42c8225976ad5d=
0c3ef995c7e030f6bab2219c"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.43.0


