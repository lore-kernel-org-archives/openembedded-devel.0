Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C808C83F22
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 11:18:53 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.6470.1752146329962044597
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 04:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 34AC5E3F6
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 13:18:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.234.74]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uZpIX-1ONYWI0; Thu, 10 Jul 2025 13:18:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] freeglut: allow to build with cmake 4
Date: Thu, 10 Jul 2025 13:18:25 +0200
Message-ID: <20250710111827.2550131-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710111827.2550131-1-f_l_k@t-online.de>
References: <20250710111827.2550131-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1752146321-5E7F250C-2AAFFC3D/0/0 CLEAN NORMAL
X-TOI-MSGID: 3d39213c-dc3d-47a6-8543-e659974225dc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 11:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118410

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-o=
e/recipes-graphics/freeglut/freeglut_3.4.0.bb
index 2cd00b0349..069f0f43f6 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "3c0bcb915d9b180a97edaebd011b7a1de=
54583a838644dcd42bb0ea0c6
=20
 inherit cmake features_check pkgconfig
=20
+EXTRA_OECMAKE =3D "-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5"
+
 # depends on virtual/libgl and libxi
 REQUIRED_DISTRO_FEATURES =3D "opengl x11"
=20
--=20
2.49.0


