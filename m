Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A486C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 17:05:13 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.139851.1692119112171116096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 10:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id E5C411914B
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 19:04:48 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.225.50]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qVxTK-2bhrA90; Tue, 15 Aug 2023 19:04:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] libpeas: fix api-documentation build
Date: Tue, 15 Aug 2023 19:04:39 +0200
Message-ID: <20230815170439.2791751-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692119086-B3FFD2DD-17E38B25/0/0 CLEAN NORMAL
X-TOI-MSGID: 90f5dd90-faee-4e46-9383-556cca1ace84
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 17:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104364

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/re=
cipes-gnome/libpeas/libpeas_1.36.0.bb
index a32ea9b550..9920603428 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "gtk+3"
 GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
-inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_=
check
+inherit gnomebase gobject-introspection gi-docgen gtk-icon-cache feature=
s_check
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 # FIXME: When upgrading to libpeas 2, g-i is no longer needed.
--=20
2.41.0


