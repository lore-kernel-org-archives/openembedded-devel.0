Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE9FC10F1B
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 01:56:09 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.8638.1670723767291391435
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 17:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 94282287FA
	for <openembedded-devel@lists.openembedded.org>; Sun, 11 Dec 2022 02:56:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.99]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p4BZI-0Tnseo0; Sun, 11 Dec 2022 02:55:53 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] remmina: build with libsoup-3.0
Date: Sun, 11 Dec 2022 02:55:33 +0100
Message-Id: <20221211015533.3748098-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211015533.3748098-1-f_l_k@t-online.de>
References: <20221211015533.3748098-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670723754-5A7EF991-9A7AEFC9/0/0 CLEAN NORMAL
X-TOI-MSGID: 577782a4-728d-4197-bd32-003975cd5ede
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Dec 2022 01:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100033

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/remmina/remmina_1.4.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.28.bb b/meta-oe/=
recipes-support/remmina/remmina_1.4.28.bb
index aacba787a..2b49cb5b7 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.28.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.28.bb
@@ -16,7 +16,7 @@ DEPENDS =3D " \
     libssh \
     vte \
     json-glib \
-    libsoup-2.4 \
+    libsoup-3.0 \
     libvncserver \
     libsecret \
     libxkbfile \
--=20
2.34.1


