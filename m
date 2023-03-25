Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B07C77B78
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.17402.1679731393926980716
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 4A52112DC3
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrn-0RoPhV0; Sat, 25 Mar 2023 09:03:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 13/32] gnome-font-viewer: update 43.0 -> 44.0
Date: Sat, 25 Mar 2023 09:02:37 +0100
Message-Id: <20230325080256.923752-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731391-85D6DC08-7AF79736/0/0 CLEAN NORMAL
X-TOI-MSGID: 880ba9e6-a736-4dfc-ae61-433bf0efe565
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101720

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-font-viewer_43.0.bb =3D> gnome-font-viewer_44.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_43.=
0.bb =3D> gnome-font-viewer_44.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer=
_43.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_4=
4.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_=
43.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44=
.0.bb
index 130c26924..ff5e1e2c8 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44.0.b=
b
@@ -16,7 +16,7 @@ inherit gnomebase gtk-icon-cache gettext features_check=
 mime-xdg
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "81c6bffb06d5332346e00eaecaec1bdcfd617c51=
dfd95bcd058d6c76c76dd2b9"
+SRC_URI[archive.sha256sum] =3D "a1511df30b228cc2ef1175dd9d2b93438ea912e2=
5913404b263cf3d457bb9f97"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.34.1


