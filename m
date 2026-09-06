Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005D2C79FA1
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10849.1788687444200757013
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=oGt3hSeQ;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout02.t-online.de (Postfix) with SMTP id 8B36AE289
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JO-22AhJn0; Sun, 6 Sep 2026 11:37:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 08/15] gimp: depend on gexiv2-0.14
Date: Sun,  6 Sep 2026 11:37:06 +0200
Message-ID: <20260906093713.797648-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687439-A6FFA956-D7F8D1B1/0/0 CLEAN NORMAL
X-TOI-MSGID: 77b53ec5-2f35-4ee9-b231-4eb5e45c9b84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=MavA8Oip/JmDtShSq/GA74Ty1V+4oIArtzKWLRcdOCs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oGt3hSeQdNY14F156VbY3YaDWYWtS0cnDakyw9c/V4zxrW2GNfU7t6aSSwbXqDD1g
	 mdYN1HizEhv9MzmTezck5AvjAQfS/eYbBN08KnHN3timyDff/DD6KF4/BzzQPztiAc
	 tctR/AS2hQhIcWVrBGM22/WuUlZqsCmbuNtHb/iQojuBZ6BuXiw+2CoykYDw09+xxo
	 JCI76IYbnDBxXXSYcZoOMYnDJV9xe1okym4EIE/AaoHUObx4n9WwPXfa//OiCZ0WeC
	 JmATyL1pKTh8k9coU2YuruktQOAVIoDaX6gmNvTeIZUFH1JoctdJQ0ve6O7vKI/KC8
	 0+IHUPO3204xA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129790

GIMP requires gexiv2 >=3D 0.14 and < 0.15, also on its master branch.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.2.4.bb
index 82c68346eb..cfb0c3a67f 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb
@@ -15,7 +15,7 @@ DEPENDS =3D " \
     freetype \
     gdk-pixbuf-native \
     gegl \
-    gexiv2 \
+    gexiv2-0.14 \
     glib-2.0 \
     glib-2.0-native \
     gtk+3 \
--=20
2.55.0


