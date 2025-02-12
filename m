Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DB0C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 04:52:23 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.8193.1739335935155415510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 20:52:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id B81CD41F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 05:52:12 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.47]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ti4jH-4b7W3l0; Wed, 12 Feb 2025 05:52:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gegl: update 0.4.52 -> 0.4.54
Date: Wed, 12 Feb 2025 05:52:38 +0100
Message-ID: <20250212045238.56929-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1739335927-84FF6968-D38ACE9B/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a1afb61-7160-4f3c-9c10-720542dacffd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 04:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115435

This update is required for gimp-3.0.0-RC3

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.52.bb =3D> gegl_0.4.54.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.52.bb =3D> gegl_0.4.54.bb}=
 (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb b/meta-gnome/rec=
ipes-gimp/gegl/gegl_0.4.54.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.54.bb
index 2717b3fa8f..a7f676ef05 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.54.bb
@@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 SHPV =3D "${@gnome_verdir("${PV}")}"
=20
 SRC_URI =3D "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "ca212a0fc3e0448c5058c51ca6a0d30fdfb02971f21f2882=
0da2b4901396000a"
+SRC_URI[sha256sum] =3D "35a342f08c6b4379adee2cb5748fc4e307cfdcf2417c0bb1=
7d6ca6543f238b1e"
=20
 PACKAGECONFIG ??=3D "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native =3D "librsvg"
--=20
2.48.1


