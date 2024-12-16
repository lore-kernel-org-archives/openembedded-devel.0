Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839DBE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 22:26:42 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.69142.1734388000161447692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 14:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout11.t-online.de (Postfix) with SMTP id 65B9315AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 23:26:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNJXv-1bthab0; Mon, 16 Dec 2024 23:26:35 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] packagegroup-meta-oe: adjust after libpeas update
Date: Mon, 16 Dec 2024 23:26:34 +0100
Message-ID: <20241216222637.84751-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734387995-D7FFC9C7-E9FD7530/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d587510-3c4c-4ca5-8aae-6472acd9f7ab
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 22:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114347

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index cffd2d687d..be8a044afc 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -444,7 +444,7 @@ RDEPENDS:packagegroup-meta-oe-gnome =3D "\
     gtkmm \
     gtkmm3 \
     libjcat \
-    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "libpeas", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "libpeas-1", "", d)} \
     pyxdg \
 "
=20
--=20
2.47.0


