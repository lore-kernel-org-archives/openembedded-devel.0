Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247D4CF9C69
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 16:05:45 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.12064.1726934740640661623
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 09:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id 1E660D61B
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 18:04:56 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.251]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ss2bP-3CJYqP0; Sat, 21 Sep 2024 18:04:56 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gnome-photos: switch from tracker to tinysparql
Date: Sat, 21 Sep 2024 18:06:44 +0200
Message-ID: <20240921160644.2223-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726934696-42FFB445-F49F506B/0/0 CLEAN NORMAL
X-TOI-MSGID: c10faf43-1f7c-495e-835f-ff1ca5112ebe
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 16:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112433

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb b=
/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
index 4b05e52ca..883f192db 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
@@ -17,12 +17,12 @@ DEPENDS =3D " \
     gnome-online-accounts \
     gsettings-desktop-schemas \
     libdazzle \
-    tracker \
+    tinysparql \
     libhandy \
     libportal \
 "
=20
-RDEPENDS:${PN} =3D "tracker-miners"
+RDEPENDS:${PN} =3D "localsearch"
=20
=20
 inherit gnomebase gettext gnome-help features_check
--=20
2.46.0


