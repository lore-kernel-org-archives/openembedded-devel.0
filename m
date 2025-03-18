Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0F1C35FF8
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:51:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.5683.1742280657791616809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout10.t-online.de (Postfix) with SMTP id D969E12DD
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 07:50:55 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.59]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuQmt-1mJ5NK0; Tue, 18 Mar 2025 07:50:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gegl: update 0.4.54 -> 0.4.56
Date: Tue, 18 Mar 2025 07:51:37 +0100
Message-ID: <20250318065137.46684-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318065137.46684-1-f_l_k@t-online.de>
References: <20250318065137.46684-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742280655-CCFF7466-010A16C9/0/0 CLEAN NORMAL
X-TOI-MSGID: 9dcf101a-9912-443a-b275-b573e118c5be
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 06:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116040

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.54.bb =3D> gegl_0.4.56.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.54.bb =3D> gegl_0.4.56.bb}=
 (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.54.bb b/meta-gnome/rec=
ipes-gimp/gegl/gegl_0.4.56.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.54.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.56.bb
index a7f676ef05..bf6105f726 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.54.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.56.bb
@@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 SHPV =3D "${@gnome_verdir("${PV}")}"
=20
 SRC_URI =3D "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "35a342f08c6b4379adee2cb5748fc4e307cfdcf2417c0bb1=
7d6ca6543f238b1e"
+SRC_URI[sha256sum] =3D "a04a64b90f9b5ac9ae5643401c7d5eb3cb41f42c52ce9787=
089b5d2a2dd3cc5c"
=20
 PACKAGECONFIG ??=3D "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native =3D "librsvg"
--=20
2.48.1


