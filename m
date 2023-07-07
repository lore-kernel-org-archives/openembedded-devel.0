Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E602EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 15:01:40 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.14470.1688742090564806269
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jul 2023 08:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout10.t-online.de (Postfix) with SMTP id 7426B3DC11
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 17:01:14 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.160.21]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qHmxO-125Ui90; Fri, 7 Jul 2023 17:01:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] eog: upgrade 44.2 -> 44.3
Date: Fri,  7 Jul 2023 17:01:04 +0200
Message-Id: <20230707150105.11070-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1688742074-F5FEF704-BBCC5B9B/0/0 CLEAN NORMAL
X-TOI-MSGID: a65b9b92-74b3-4ec0-99f0-f1b6ead8cda6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 15:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103714

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/{eog_44.2.bb =3D> eog_44.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_44.2.bb =3D> eog_44.3.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_44.2.bb b/meta-gnome/recipe=
s-gnome/eog/eog_44.3.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_44.2.bb
rename to meta-gnome/recipes-gnome/eog/eog_44.3.bb
index 110e73fd43..06203fbbe0 100644
--- a/meta-gnome/recipes-gnome/eog/eog_44.2.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_44.3.bb
@@ -22,7 +22,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "468f539f6b67ee46188170f244480cc311dd1efe=
4786fe1554bffe26a65c72c4"
+SRC_URI[archive.sha256sum] =3D "d6b2d70f4b432ff8cf494c8f9029b2621d08e781=
7938317d64063ae6c4da9d8c"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.34.1


