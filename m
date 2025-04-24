Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668FFC3ABA5
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.4196.1745526862773866224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id C3D86AD4
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H1-38CNST0; Thu, 24 Apr 2025 22:34:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 01/18] gegl: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:49 +0200
Message-ID: <20250424203406.2113462-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526859-1D7F9A5A-261EA8F1/0/0 CLEAN NORMAL
X-TOI-MSGID: d8c68ac2-6c27-4511-9c45-ebb2d6d954a7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117105

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gegl/gegl_0.4.58.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.58.bb b/meta-gnome/rec=
ipes-gimp/gegl/gegl_0.4.58.bb
index 380d04603e..290d51add9 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.58.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.58.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG[librsvg] =3D "-Dlibrsvg=3Denabled,-Dlibrs=
vg=3Ddisabled,librsvg"
 PACKAGECONFIG[pango] =3D "-Dpango=3Denabled -Dpangocairo=3Denabled,-Dpan=
go=3Ddisabled -Dpangocairo=3Ddisabled,pango"
 PACKAGECONFIG[poppler] =3D "-Dpoppler=3Denabled,-Dpoppler=3Ddisabled,pop=
pler"
 PACKAGECONFIG[sdl] =3D "-Dsdl1=3Denabled,-Dsdl1=3Ddisabled,libsdl"
-PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,libsdl2"
+PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/libs=
dl2"
 PACKAGECONFIG[tiff] =3D "-Dlibtiff=3Denabled,-Dlibtiff=3Ddisabled,tiff"
 PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,libwebp"
=20
--=20
2.49.0


