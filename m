Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610F7E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 22:26:52 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.68989.1734387999911425915
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 14:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout06.t-online.de (Postfix) with SMTP id 6799877B
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 23:26:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNJXw-1bthac0; Mon, 16 Dec 2024 23:26:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] geary: build with libpeas-1
Date: Mon, 16 Dec 2024 23:26:35 +0100
Message-ID: <20241216222637.84751-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216222637.84751-1-f_l_k@t-online.de>
References: <20241216222637.84751-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734387996-C9FF89C7-723FCEC0/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c0323f5-590b-4f01-b838-b98cb6c87195
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 22:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114344

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-connectivity/geary/geary_46.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_46.0.bb
index 7474ee0bab..81aa923c03 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
@@ -22,7 +22,7 @@ DEPENDS =3D " \
     json-glib \
     libhandy \
     libical \
-    libpeas \
+    libpeas-1 \
     libsecret \
     libsoup \
     libstemmer \
--=20
2.47.0


