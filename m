Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE2BC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 05:26:47 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.37561.1681104398058109823
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Apr 2023 22:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id 9B1661B2AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 07:26:35 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.40.74]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1plk2y-0A7mef0; Mon, 10 Apr 2023 07:26:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] iwd: update 2.3 -> 2.4
Date: Mon, 10 Apr 2023 07:26:19 +0200
Message-Id: <20230410052619.3181352-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1681104392-7B06AC36-8D53DD48/0/0 CLEAN NORMAL
X-TOI-MSGID: c80758fb-8d83-44b3-a9a9-12e6bec7d76f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 05:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102001

ver 0.56:
	Add support for TLS session resume interfaces.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.3.bb =3D> iwd_2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.3.bb =3D> iwd_2.4.bb} (94=
%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.3.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_2.4.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.3.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.4.bb
index 46e377de3..e405ed77d 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.3.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.4.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "b0506d797a8bfb88f3c3eeea5e49dcf4ee8e6cef118f57c1=
18e587eeb377ac64"
+SRC_URI[sha256sum] =3D "3a9c5e7ade45162e5c78b3d7035a2f4a6e20ba6b5974097c=
35a8f615493012f9"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.34.1


