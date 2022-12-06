Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66BDC47090
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 19:36:25 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.928.1670355384054311109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 11:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id 26A9D4C60
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Dec 2022 20:36:03 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.136]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2djU-1Ur1vQ0; Tue, 6 Dec 2022 20:36:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH 4/4] libadwaita: remove deprecated sassc-native dependency
Date: Tue,  6 Dec 2022 20:35:47 +0100
Message-Id: <20221206193547.144679-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206193547.144679-1-f_l_k@t-online.de>
References: <20221206193547.144679-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670355360-793AD9DD-ED50AA10/0/0 CLEAN NORMAL
X-TOI-MSGID: cc49da3a-2e84-4966-a336-8dcbd4f3d7c1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 19:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99963

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb b/me=
ta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb
index 7a1f86a73..a518f251b 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
 GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
-    sassc-native \
     gtk4 \
 "
=20
--=20
2.34.1


