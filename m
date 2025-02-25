Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2821C021BE
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 01:01:32 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.1103.1740445286915345164
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 17:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id 1D79916CF
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 02:01:25 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.213]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmjK5-3RwbC60; Tue, 25 Feb 2025 02:01:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] libei: update 1.3.0 -> 1.4.0
Date: Tue, 25 Feb 2025 02:01:14 +0100
Message-ID: <20250225010115.31203-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225010115.31203-1-f_l_k@t-online.de>
References: <20250225010115.31203-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740445281-D1FF9479-23595427/0/0 CLEAN NORMAL
X-TOI-MSGID: fe74c7e4-4803-41e8-b456-37668c4fde93
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 01:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115554

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-graphics/wayland/{libei_1.3.0.bb =3D> libei_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/wayland/{libei_1.3.0.bb =3D> libei_1.4.0=
.bb} (92%)

diff --git a/meta-oe/recipes-graphics/wayland/libei_1.3.0.bb b/meta-oe/re=
cipes-graphics/wayland/libei_1.4.0.bb
similarity index 92%
rename from meta-oe/recipes-graphics/wayland/libei_1.3.0.bb
rename to meta-oe/recipes-graphics/wayland/libei_1.4.0.bb
index ee3ee01c7d..40e8015116 100644
--- a/meta-oe/recipes-graphics/wayland/libei_1.3.0.bb
+++ b/meta-oe/recipes-graphics/wayland/libei_1.4.0.bb
@@ -17,7 +17,7 @@ DEPENDS =3D " \
 SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libei.git;protocol=3D=
https;branch=3Dmain"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "997b7c0f37faea4f8bae59613c8f27370925d5b0"
+SRCREV =3D "5d6d8e6590df210b75559a889baa9459c68d9366"
=20
 inherit meson pkgconfig
=20
--=20
2.48.1


