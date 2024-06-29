Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CB9C27C4F
	for <webhook@archiver.kernel.org>; Sat, 29 Jun 2024 05:45:08 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.986.1719639903393225217
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 22:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id BED414DB1C
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 07:45:00 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.233.181]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sNQtM-38TQUT0; Sat, 29 Jun 2024 07:44:56 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] flatpak: add PACKAGECONFIG for dconf
Date: Sat, 29 Jun 2024 07:45:57 +0200
Message-ID: <20240629054557.8120-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1719639897-0FFFCDFC-2D08B973/0/0 CLEAN NORMAL
X-TOI-MSGID: 83a2ef90-7d40-4e2d-bdfd-2c03b1ec771f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 05:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111156

Disable by default to avoid a requirement for meta-gnome

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.8.bb
index 8351e7d65..eac8aa30a 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
@@ -19,7 +19,6 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 DEPENDS =3D " \
     appstream \
     bison-native \
-    dconf \
     fuse3 \
     gdk-pixbuf \
     glib-2.0 \
@@ -49,6 +48,7 @@ GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
 GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
 PACKAGECONFIG[curl] =3D "-Dhttp_backend=3Dcurl,,curl"
+PACKAGECONFIG[dconf] =3D "-Ddconf=3Denabled,-Ddconf=3Ddisabled,dconf"
 PACKAGECONFIG[docbook_docs] =3D "-Ddocbook_docs=3Denabled,-Ddocbook_docs=
=3Ddisabled,xmlto-native"
 PACKAGECONFIG[man] =3D "-Dman=3Denabled,-Dman=3Ddisabled,libxslt-native"
 PACKAGECONFIG[soup] =3D "-Dhttp_backend=3Dsoup,,libsoup-2.4"
--=20
2.45.1


