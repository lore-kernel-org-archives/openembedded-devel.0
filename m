Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47BBC6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 11:14:17 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.76211.1682421252772206268
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Apr 2023 04:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout03.t-online.de (Postfix) with SMTP id 71D5A3E7F4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Apr 2023 13:14:10 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.37.27]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1prGcb-2fqxtJ0; Tue, 25 Apr 2023 13:14:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] webp-pixbuf-loader: update 0.2.0 -> 0.2.4
Date: Tue, 25 Apr 2023 13:13:58 +0200
Message-Id: <20230425111358.5499-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682421249-E0F43C25-85FECF4D/0/0 CLEAN NORMAL
X-TOI-MSGID: 8ecd4753-3f00-4100-8ec9-2cbd0de03c76
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Apr 2023 11:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102186

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...{webp-pixbuf-loader_0.2.0.bb =3D> webp-pixbuf-loader_0.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/webp-pixbuf-loader/{webp-pixbuf-loader=
_0.2.0.bb =3D> webp-pixbuf-loader_0.2.4.bb} (91%)

diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-lo=
ader_0.2.0.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf=
-loader_0.2.4.bb
similarity index 91%
rename from meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loa=
der_0.2.0.bb
rename to meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loade=
r_0.2.4.bb
index acd4acd92..71c5244f1 100644
--- a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
2.0.bb
+++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
2.4.bb
@@ -15,7 +15,7 @@ EXTRA_OEMESON =3D "-Dupdate_cache=3Dtrue"
 SRC_URI =3D "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=3Dht=
tps;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "eaa4ea02fd9d8ea8e0f4aac00dc6fa5b0eddd700"
+SRCREV =3D "a35014104a226265e44fe30fcdb4df9305af3466"
=20
 FILES:${PN} =3D " \
     ${datadir}/thumbnailers/webp-pixbuf.thumbnailer \
--=20
2.34.1


