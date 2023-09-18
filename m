Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE740CD3420
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.4033.1695073931514857758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id E9B493482D
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA0-3qxV290; Mon, 18 Sep 2023 23:52:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 09/18] eog: upgrade 44.3 -> 45.0
Date: Mon, 18 Sep 2023 23:51:44 +0200
Message-ID: <20230918215156.1920452-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073925-44FF45E3-980A4D5C/0/0 CLEAN NORMAL
X-TOI-MSGID: 5dc07148-133e-4dea-b703-1a83d3a5ed04
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104935

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/{eog_44.3.bb =3D> eog_45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_44.3.bb =3D> eog_45.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_44.3.bb b/meta-gnome/recipe=
s-gnome/eog/eog_45.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_44.3.bb
rename to meta-gnome/recipes-gnome/eog/eog_45.0.bb
index 06203fbbe..eb3d07ce1 100644
--- a/meta-gnome/recipes-gnome/eog/eog_44.3.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.0.bb
@@ -22,7 +22,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "d6b2d70f4b432ff8cf494c8f9029b2621d08e781=
7938317d64063ae6c4da9d8c"
+SRC_URI[archive.sha256sum] =3D "05cb2c9a66ba15870f47358cd4c1ce670f17e4c8=
b22e050d627d728ff88b57ba"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.41.0


