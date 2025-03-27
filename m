Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AB3C36008
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 01:51:54 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.40530.1743040312353879092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 18:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 7E0B4259
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 02:51:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.104]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1txcPN-0mQo4I0; Thu, 27 Mar 2025 02:51:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gegl: update 0.4.56 -> 0.4.58
Date: Thu, 27 Mar 2025 02:52:33 +0100
Message-ID: <20250327015233.77104-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327015233.77104-1-f_l_k@t-online.de>
References: <20250327015233.77104-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743040309-937FD903-579AEF8A/0/0 CLEAN NORMAL
X-TOI-MSGID: bc1b56c1-fcb8-4bf5-8023-5e4506afbd67
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 01:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116305

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.56.bb =3D> gegl_0.4.58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.56.bb =3D> gegl_0.4.58.bb}=
 (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.56.bb b/meta-gnome/rec=
ipes-gimp/gegl/gegl_0.4.58.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.56.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.58.bb
index bf6105f726..380d04603e 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.56.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.58.bb
@@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 SHPV =3D "${@gnome_verdir("${PV}")}"
=20
 SRC_URI =3D "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "a04a64b90f9b5ac9ae5643401c7d5eb3cb41f42c52ce9787=
089b5d2a2dd3cc5c"
+SRC_URI[sha256sum] =3D "d5678bbd5fe535941b82f965b97fcc9385ce936f70c982bd=
565a53d5519d1bff"
=20
 PACKAGECONFIG ??=3D "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native =3D "librsvg"
--=20
2.49.0


