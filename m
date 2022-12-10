Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D63C4167B
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 10:05:41 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.11911.1670666741080621251
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 02:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 79AFD1CDAE
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 11:05:38 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3wje-1e6dwg0; Sat, 10 Dec 2022 11:05:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/2] gnome-photos: add missing runtime dependency on tracker-miners
Date: Sat, 10 Dec 2022 11:05:21 +0100
Message-Id: <20221210100521.3720-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221210100521.3720-1-f_l_k@t-online.de>
References: <20221210100521.3720-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670666734-D924D9D3-80F0A4D7/0/0 CLEAN NORMAL
X-TOI-MSGID: 529f3d99-cefc-4d48-8bd6-c2127303d061
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 10:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100028

This fixes runtime for gnome-photos

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb b=
/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
index d9f71806c..620e76e9a 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
@@ -22,6 +22,8 @@ DEPENDS =3D " \
     libportal \
 "
=20
+RDEPENDS:${PN} =3D "tracker-miners"
+
 GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gettext gnome-help features_check
--=20
2.34.1


