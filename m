Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745D3C3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 06:33:13 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.25507.1747549990530177948
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 May 2025 23:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id CEBF4F93
	for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 08:33:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.15]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uGXa7-0kxVpa0; Sun, 18 May 2025 08:33:07 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] gegl: update 0.4.58 -> 0.4.62
Date: Sun, 18 May 2025 08:32:59 +0200
Message-ID: <20250518063300.58623-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518063300.58623-1-f_l_k@t-online.de>
References: <20250518063300.58623-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747549987-7F7FC55F-F0DB07C5/0/0 CLEAN NORMAL
X-TOI-MSGID: 1dcad79b-a33b-49c0-893d-ee166a8c4998
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 06:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117448

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.58.bb =3D> gegl_0.4.62.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.58.bb =3D> gegl_0.4.62.bb}=
 (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.58.bb b/meta-gnome/rec=
ipes-gimp/gegl/gegl_0.4.62.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.58.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.62.bb
index 290d51add9..9dd9e31131 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.58.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.62.bb
@@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 SHPV =3D "${@gnome_verdir("${PV}")}"
=20
 SRC_URI =3D "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "d5678bbd5fe535941b82f965b97fcc9385ce936f70c982bd=
565a53d5519d1bff"
+SRC_URI[sha256sum] =3D "5887576371ebf1d9e90797d10e4b9a7f1658228d4827583e=
79e1db3d94505c6c"
=20
 PACKAGECONFIG ??=3D "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native =3D "librsvg"
--=20
2.49.0


