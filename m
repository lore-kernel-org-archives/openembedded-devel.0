Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE8EE77188
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 07:04:06 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.25897.1735369436247722665
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 23:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout05.t-online.de (Postfix) with SMTP id 6C0CB9BB
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Dec 2024 08:03:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.40]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tRQrZ-0q57Jp0; Sat, 28 Dec 2024 08:03:53 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gegl: update 0.4.50 -> 0.4.52
Date: Sat, 28 Dec 2024 08:04:06 +0100
Message-ID: <20241228070406.39448-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1735369433-BD7F99C7-FD21C8D6/0/0 CLEAN NORMAL
X-TOI-MSGID: 04865a18-310c-403b-81b2-c2fd42e79fd0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Dec 2024 07:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114575

required for gimp-3.0.0-RC2 release

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.50.bb =3D> gegl_0.4.52.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.50.bb =3D> gegl_0.4.52.bb}=
 (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.50.bb b/meta-gnome/rec=
ipes-gimp/gegl/gegl_0.4.52.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.50.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb
index 665e8ae1ba..b993386e38 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.50.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb
@@ -26,7 +26,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 SHPV =3D "${@gnome_verdir("${PV}")}"
=20
 SRC_URI =3D "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "6084969b06ee86ca71142133773f27e13f02e5a6a22c2cfc=
e452ecaaddb790c1"
+SRC_URI[sha256sum] =3D "ca212a0fc3e0448c5058c51ca6a0d30fdfb02971f21f2882=
0da2b4901396000a"
=20
 PACKAGECONFIG ??=3D "gexiv2 jpeg libpng libraw librsvg pango poppler sdl=
2"
 PACKAGECONFIG:class-native =3D "libpng librsvg"
--=20
2.47.1


