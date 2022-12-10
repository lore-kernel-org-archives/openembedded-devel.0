Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6EEC4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 05:22:10 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.9054.1670649724863490989
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 21:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id 64E0BEDA
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 06:22:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3sJB-1hOgEg0; Sat, 10 Dec 2022 06:21:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 6/6] gnome-text-editor: update 42.2 -> 43.1
Date: Sat, 10 Dec 2022 06:21:37 +0100
Message-Id: <20221210052137.303984-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221210052137.303984-1-f_l_k@t-online.de>
References: <20221210052137.303984-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670649718-E67DE07E-454AD6BD/0/0 CLEAN NORMAL
X-TOI-MSGID: fe55f498-581a-4a79-99c1-3b251abaca7b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 05:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100017

---
 .../{gnome-text-editor_42.2.bb =3D> gnome-text-editor_43.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_42.=
2.bb =3D> gnome-text-editor_43.1.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_42.2.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
3.1.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
42.2.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_43=
.1.bb
index 763384b7e..614893d47 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_43.1.b=
b
@@ -9,8 +9,8 @@ DEPENDS =3D " \
     libadwaita \
     gtk4 \
     gtksourceview5 \
+    editorconfig-core-c \
     enchant2 \
-    libpcre \
 "
=20
 GTKIC_VERSION =3D "4"
@@ -20,7 +20,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "e56d4a8cdcbce8a8f1c0881b45de799f8b25205e=
c0cbf2269e532025761cc5da"
+SRC_URI[archive.sha256sum] =3D "973a4b0deb68f9f91a54a4dd415b6afde9b5ae3e=
e684bc761471f94290f9f6cb"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.34.1


