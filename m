Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DABCC46467
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:04:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.81071.1669503871512527620
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id D8A4277E1
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 00:04:29 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4Dh-1zml0W0; Sun, 27 Nov 2022 00:04:25 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2 12/14] gnome-keyring: use gcr3
Date: Sun, 27 Nov 2022 00:03:49 +0100
Message-Id: <20221126230351.1431843-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126230351.1431843-1-f_l_k@t-online.de>
References: <20221126230351.1431843-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669503865-15FEC98D-FF1DF4D8/0/0 CLEAN NORMAL
X-TOI-MSGID: 987c24be-aa61-4be1-9e96-9c9787c8bd83
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99764

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb=
 b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
index 5937e7442..241a94cd7 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
 DEPENDS =3D " \
     glib-2.0-native \
     gtk+3 \
-    gcr \
+    gcr3 \
     libgcrypt \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
 "
--=20
2.34.1


