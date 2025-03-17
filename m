Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E896C28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:13:50 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.53626.1742220823302294235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 07:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id 6083AF36
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 15:13:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.174]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuBDn-4dgSKP0; Mon, 17 Mar 2025 15:13:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl2-compat: add x11 and opengl to REQUIRED_DISTRO_FEATURES
Date: Mon, 17 Mar 2025 15:14:14 +0100
Message-ID: <20250317141414.1442963-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742220819-2BFFD447-362C7867/0/0 CLEAN NORMAL
X-TOI-MSGID: e7194b37-b674-4976-a5c9-18640f4d2727
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 14:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116028

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
index 5052c85b3d..de47f174b1 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
@@ -16,6 +16,8 @@ S =3D "${WORKDIR}/sdl2-compat-${PV}"
=20
 DEPENDS +=3D "libsdl3"
=20
-inherit cmake pkgconfig upstream-version-is-even
+inherit cmake pkgconfig upstream-version-is-even features_check
+
+REQUIRED_DISTRO_FEATURES =3D "opengl x11"
=20
 FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.48.1


