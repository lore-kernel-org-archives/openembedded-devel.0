Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41192C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 11:49:28 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.7229.1711194567076320681
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 04:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id 24BF626269
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 12:49:25 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnzsH-2GG2e90; Sat, 23 Mar 2024 12:49:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-control-center: use gcr4 variant
Date: Sat, 23 Mar 2024 12:49:47 +0100
Message-ID: <20240323114947.1975-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711194561-05983954-4113376A/0/0 CLEAN NORMAL
X-TOI-MSGID: 0c0fbfee-9863-43f9-945d-1a6bdf936656
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 11:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109550

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center/gnome-control-center_46.0.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.0.bb
index 53643c680..a691b8d3f 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.bb
@@ -8,7 +8,7 @@ GTKIC_VERSION =3D "4"
 DEPENDS =3D " \
     accountsservice \
     colord-gtk \
-    gcr3 \
+    gcr \
     gdk-pixbuf \
     glib-2.0 \
     gnome-bluetooth \
--=20
2.44.0


