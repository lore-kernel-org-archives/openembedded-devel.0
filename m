Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA142C10F1B
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 01:52:49 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.8601.1670723559653625516
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 17:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id 836CBB5AF;
	Sun, 11 Dec 2022 02:52:37 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.99]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p4BW5-00DCLa0; Sun, 11 Dec 2022 02:52:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCHv2 2/2] gnome-text-editor: update 42.2 -> 43.1
Date: Sun, 11 Dec 2022 02:52:15 +0100
Message-Id: <20221211015215.3743566-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211015215.3743566-1-f_l_k@t-online.de>
References: <20221211015215.3743566-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670723555-EFFE97E2-BD04A523/0/0 CLEAN NORMAL
X-TOI-MSGID: c2beb895-1263-4c28-86a3-d8a996cfb8ad
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Dec 2022 01:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100031

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{gnome-text-editor_42.2.bb =3D> gnome-text-editor_43.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_42.=
2.bb =3D> gnome-text-editor_43.1.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_42.2.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
3.1.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
42.2.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_43=
.1.bb
index 763384b7e..a2ac710a0 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_43.1.b=
b
@@ -9,18 +9,17 @@ DEPENDS =3D " \
     libadwaita \
     gtk4 \
     gtksourceview5 \
+    editorconfig-core-c \
     enchant2 \
-    libpcre \
 "
=20
 GTKIC_VERSION =3D "4"
=20
 inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_ch=
eck
=20
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
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


