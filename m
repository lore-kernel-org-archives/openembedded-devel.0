Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258F2C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 00:41:09 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.79596.1677458462681434102
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Feb 2023 16:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout12.t-online.de (Postfix) with SMTP id 47B9D16C80
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 01:41:00 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.16]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pWRZU-0ctJrt0; Mon, 27 Feb 2023 01:40:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] webp-pixbuf-loader: update 0.0.7 -> 0.2.0
Date: Mon, 27 Feb 2023 01:40:44 +0100
Message-Id: <20230227004044.8242-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1677458452-716BF7D8-9C13E33D/0/0 CLEAN NORMAL
X-TOI-MSGID: 7fbdc711-bf4a-443a-be92-8112b364e3e1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 00:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101259

- fix license information

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...{webp-pixbuf-loader_0.7.bb =3D> webp-pixbuf-loader_0.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-support/webp-pixbuf-loader/{webp-pixbuf-loader=
_0.7.bb =3D> webp-pixbuf-loader_0.2.0.bb} (86%)

diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-lo=
ader_0.7.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-l=
oader_0.2.0.bb
similarity index 86%
rename from meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loa=
der_0.7.bb
rename to meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loade=
r_0.2.0.bb
index 17a343674..acd4acd92 100644
--- a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
7.bb
+++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
2.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "WebP GDK Pixbuf Loader library"
 HOMEPAGE =3D "https://github.com/aruiz/webp-pixbuf-loader"
-LICENSE =3D "LGPL-2.1-or-later"
+LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL-2;md5=3D0d90e6d44bcf69014bfae6=
49c75aa6ca"
=20
 DEPENDS =3D " \
@@ -15,7 +15,7 @@ EXTRA_OEMESON =3D "-Dupdate_cache=3Dtrue"
 SRC_URI =3D "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=3Dht=
tps;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "f91f79c05ff90b41774eda613dc10a2a0d996bc8"
+SRCREV =3D "eaa4ea02fd9d8ea8e0f4aac00dc6fa5b0eddd700"
=20
 FILES:${PN} =3D " \
     ${datadir}/thumbnailers/webp-pixbuf.thumbnailer \
--=20
2.34.1


