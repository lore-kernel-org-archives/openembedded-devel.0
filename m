Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B24C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:47:50 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web12.113.1665679669493828640
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id BA99B11FC4
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 18:47:47 +0200 (CEST)
Received: from flk-MS-7C91.. ([79.219.227.72]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oj1N5-4KpENF0; Thu, 13 Oct 2022 18:47:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] gtkmm3: upgrade 3.24.5 -> 3.24.7
Date: Thu, 13 Oct 2022 18:47:39 +0200
Message-Id: <20221013164739.6630-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1665679667-C8C8BB6F-7638D751/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ae4a285-7eb2-4de3-aa8a-4de92660b267
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 16:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99163

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gtk+/{gtkmm3_3.24.5.bb =3D> gtkmm3_3.24.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm3_3.24.5.bb =3D> gtkmm3_3.24.7.b=
b} (86%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb b/meta-oe/recipe=
s-gnome/gtk+/gtkmm3_3.24.7.bb
similarity index 86%
rename from meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
index 0546814d8..28d2bb138 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
@@ -16,7 +16,7 @@ inherit gnomebase features_check
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI[archive.sha256sum] =3D "856333de86689f6a81c123f2db15d85db9addc43=
8bc3574c36f15736aeae22e6"
+SRC_URI[archive.sha256sum] =3D "1d7a35af9c5ceccacb244ee3c2deb9b245720d85=
10ac5c7e6f4b6f9947e6789c"
=20
 EXTRA_OEMESON =3D "-Dbuild-demos=3Dfalse"
=20
--=20
2.34.1


