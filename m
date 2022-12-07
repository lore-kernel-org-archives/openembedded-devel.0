Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1D4C4708E
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 17:40:22 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.22358.1670434816485221531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 09:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout12.t-online.de (Postfix) with SMTP id 39AF82FCC
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Dec 2022 18:40:14 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.147]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2yOy-3MBOfB0; Wed, 7 Dec 2022 18:40:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-shell: remove deprecated sassc-native dependency
Date: Wed,  7 Dec 2022 18:40:04 +0100
Message-Id: <20221207174004.207656-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670434812-EE7EE7E2-01385F6E/0/0 CLEAN NORMAL
X-TOI-MSGID: b966891b-23ea-4e10-96c2-21c45341ad83
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 17:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99978

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
index 6adbb0a29..980a7b583 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
@@ -6,7 +6,6 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     libxml2-native \
-    sassc-native \
     gtk4 \
     mutter \
     evolution-data-server \
--=20
2.34.1


