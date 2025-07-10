Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2B8C83F1D
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 11:18:53 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.6469.1752146329604903849
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 04:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 348D91BFD0
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 13:18:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.234.74]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uZpIX-1ONYWH0; Thu, 10 Jul 2025 13:18:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] glm: allow to build wih cmake 4
Date: Thu, 10 Jul 2025 13:18:24 +0200
Message-ID: <20250710111827.2550131-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1752146321-4A7FA50C-1BA20854/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e66e71a-fbc2-4a37-b126-8c48cc14fcd8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 11:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118409

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipe=
s-graphics/glm/glm_0.9.9.8.bb
index e6fd0edd21..f18ae346a5 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -23,6 +23,8 @@ PV .=3D "+0.9.9.9+git"
=20
 inherit cmake
=20
+EXTRA_OECMAKE =3D "-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5"
+
 do_install() {
     install -d ${D}${includedir} ${D}${docdir}/glm ${D}${libdir}/pkgconf=
ig ${D}${libdir}/cmake/glm
     cp -R --no-dereference --preserve=3Dmode,links ${S}/glm ${D}${includ=
edir}
--=20
2.49.0


