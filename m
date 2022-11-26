Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39A9C47089
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:04:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.81053.1669503871072059054
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 98F52188EB
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 00:04:29 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4Dg-1zml0V0; Sun, 27 Nov 2022 00:04:24 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2 11/14] gnome-online-accounts: use gcr3
Date: Sun, 27 Nov 2022 00:03:48 +0100
Message-Id: <20221126230351.1431843-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126230351.1431843-1-f_l_k@t-online.de>
References: <20221126230351.1431843-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669503864-2488F98D-14DCE759/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ae09359-ba8f-4ae6-ab95-6fe0149163f9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99762

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-online-accounts/gnome-online-accounts_3.46.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.46.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.46.0.bb
index 0603a2d89..80cf4969c 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.46.0.bb
@@ -13,7 +13,7 @@ SRC_URI[archive.sha256sum] =3D "5e7859ce4858a6b99d3995e=
d70527d66e297bb90bbf75ec878
 PACKAGECONFIG_SOUP ?=3D "soup3"
 PACKAGECONFIG ?=3D "kerberos owncloud lastfm google windows_live ${PACKA=
GECONFIG_SOUP}"
=20
-PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5 =
gcr"
+PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5 =
gcr3"
 PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexchange=3Dfalse"
 PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse"
 PACKAGECONFIG[owncloud] =3D "-Downcloud=3Dtrue, -Downcloud=3Dfalse"
--=20
2.34.1


