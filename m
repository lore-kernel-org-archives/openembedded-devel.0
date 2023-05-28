Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52287C7EE23
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 12:22:27 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.27747.1685276545197793028
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 May 2023 05:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 01E051574F
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 14:22:17 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.225.43]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q3FPc-1OgFqT0; Sun, 28 May 2023 14:22:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] iwd: update 2.4 -> 2.5
Date: Sun, 28 May 2023 14:22:07 +0200
Message-Id: <20230528122207.1705027-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685276536-0FFFBC77-BCCE64C8/0/0 CLEAN NORMAL
X-TOI-MSGID: 3569ad82-3dfb-4482-9b6e-75ecfed8a3f2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 12:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102888

ver 2.5:
	Fix issue with HT40+/- checks when creating chandef.
	Fix issue with handling support for FT-8021X-SHA384.
	Fix issue with handling secure bit check in handshake 1/4.
	Fix issue with allowing roaming before netconfig finishes.
	Fix issue with double free when disconnecting during FT.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.4.bb =3D> iwd_2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.4.bb =3D> iwd_2.5.bb} (94=
%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.4.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_2.5.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.4.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.5.bb
index e405ed77d..e1f21c3ba 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.4.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.5.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "3a9c5e7ade45162e5c78b3d7035a2f4a6e20ba6b5974097c=
35a8f615493012f9"
+SRC_URI[sha256sum] =3D "3441effed58297b63779e706c74884234acb874b07872f8b=
55e0da28729fda32"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.34.1


