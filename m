Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9781C46467
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 06:57:15 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.143161.1669705032009884148
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 22:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id E365DE954
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 07:57:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.163]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozuYA-3ii2440; Tue, 29 Nov 2022 07:57:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 4/7] gthumb: build with libsoup-3
Date: Tue, 29 Nov 2022 07:56:40 +0100
Message-Id: <20221129065643.82373-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129065643.82373-1-f_l_k@t-online.de>
References: <20221129065643.82373-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669705022-0A697417-86B05085/0/0 CLEAN NORMAL
X-TOI-MSGID: 0e478460-c149-4535-af85-ec3f9d63ef3f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 06:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99840

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb b/meta-gnom=
e/recipes-gnome/gthumb/gthumb_3.12.2.bb
index 0c5b71f5b..92152aca6 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
@@ -19,7 +19,7 @@ DEPENDS =3D " \
     lcms \
     libraw \
     librsvg \
-    libsoup-2.4 \
+    libsoup \
     json-glib \
     libsecret \
 "
--=20
2.34.1


