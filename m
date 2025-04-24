Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B99C369D9
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.4200.1745526863302045653
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id CE211133E
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H2-38CNSZ0; Thu, 24 Apr 2025 22:34:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 07/18] taisei: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:55 +0200
Message-ID: <20250424203406.2113462-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526860-297F9A5A-5722F664/0/0 CLEAN NORMAL
X-TOI-MSGID: 8f7e7f73-389a-4ec2-a645-f31b7d2e839f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117108

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/tai=
sei/taisei_1.4.2.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-gra=
phics/taisei/taisei_1.4.2.bb
index 5d368498dc..7c90db9314 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/tai=
sei_1.4.2.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/tai=
sei_1.4.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1a11ffd7e1bd=
d1d3156cecec60a2846f"
 DEPENDS =3D "\
     cglm \
     freetype \
-    libsdl2 \
+    virtual/libsdl2 \
     libwebp \
     opusfile \
     zstd \
--=20
2.49.0


