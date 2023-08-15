Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944C2C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 17:01:53 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.139707.1692118908425158610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 10:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 862DA4EC67
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 19:01:13 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.225.50]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qVxPq-1R9yBV0; Tue, 15 Aug 2023 19:01:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gtksourceview5: fix api-documentation build
Date: Tue, 15 Aug 2023 19:01:04 +0200
Message-ID: <20230815170104.2760003-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692118871-9A68B904-6554886D/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b6540ca-85c7-435b-b2ed-9f914bf4b098
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 17:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104363

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.bb
index 99826c5944..4eaecbf086 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.bb
@@ -21,7 +21,7 @@ S =3D "${WORKDIR}/${PNAME}-${PV}"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase lib_package gettext features_check gtk-doc gtk-icon-ca=
che gobject-introspection vala
+inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-=
cache gobject-introspection vala
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
--=20
2.41.0


