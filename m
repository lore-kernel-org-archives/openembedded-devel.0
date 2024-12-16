Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C400E77183
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 22:26:42 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.69141.1734388000030922194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 14:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout11.t-online.de (Postfix) with SMTP id 6959C15C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 23:26:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNJXw-1bthae0; Mon, 16 Dec 2024 23:26:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] gedit: build with libpeas-1
Date: Mon, 16 Dec 2024 23:26:37 +0100
Message-ID: <20241216222637.84751-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216222637.84751-1-f_l_k@t-online.de>
References: <20241216222637.84751-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734387996-8EFFA9C7-62EBBF74/0/0 CLEAN NORMAL
X-TOI-MSGID: 7fb09f22-0f42-489d-be02-65233fa2ab9a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 22:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114345

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gedit/gedit_46.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.2.bb
index 6cdc33c1cc..91b2221d7a 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
@@ -12,7 +12,7 @@ DEPENDS =3D " \
     gdk-pixbuf-native \
     gtk+3 \
     gsettings-desktop-schemas \
-    libpeas \
+    libpeas-1 \
     libsoup \
     gspell \
     tepl \
--=20
2.47.0


