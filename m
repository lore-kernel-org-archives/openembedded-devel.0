Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E50C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:23:49 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.51188.1699266228290870761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 02:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id 5E58D1CA37
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Nov 2023 11:23:46 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.73]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzwll-0ZPSTZ0; Mon, 6 Nov 2023 11:23:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] webp-pixbuf-loader: Upgrade 0.2.4 -> 0.2.5
Date: Mon,  6 Nov 2023 11:24:10 +0100
Message-ID: <20231106102411.58424-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699266225-1FFFCEA2-111248DE/0/0 CLEAN NORMAL
X-TOI-MSGID: 4953dcab-b6e2-40d3-9aea-acf2bba188dc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 10:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106407

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...{webp-pixbuf-loader_0.2.4.bb =3D> webp-pixbuf-loader_0.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/webp-pixbuf-loader/{webp-pixbuf-loader=
_0.2.4.bb =3D> webp-pixbuf-loader_0.2.5.bb} (91%)

diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-lo=
ader_0.2.4.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf=
-loader_0.2.5.bb
similarity index 91%
rename from meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loa=
der_0.2.4.bb
rename to meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loade=
r_0.2.5.bb
index 6f9156ded..e7cad39a3 100644
--- a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
2.4.bb
+++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
2.5.bb
@@ -15,7 +15,7 @@ EXTRA_OEMESON =3D "-Dupdate_cache=3Dtrue"
 SRC_URI =3D "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=3Dht=
tps;branch=3Dmainline"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "a35014104a226265e44fe30fcdb4df9305af3466"
+SRCREV =3D "481533dd0e2c014975d9dc786887a5475c3af073"
=20
 FILES:${PN} =3D " \
     ${datadir}/thumbnailers/webp-pixbuf.thumbnailer \
--=20
2.42.0


