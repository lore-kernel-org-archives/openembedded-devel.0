Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251D0C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 21:18:29 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.5752.1724188703311699600
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 14:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id C1AE84ED0B
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 23:18:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.231.159]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sgWFA-2Lg4Pa0; Tue, 20 Aug 2024 23:18:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] iwd: update 2.18 -> 2.19
Date: Tue, 20 Aug 2024 23:19:41 +0200
Message-ID: <20240820211941.46814-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820211941.46814-1-f_l_k@t-online.de>
References: <20240820211941.46814-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1724188700-71FF89D9-F34DCFBB/0/0 CLEAN NORMAL
X-TOI-MSGID: cfaef4c5-5ac3-4fc8-8343-6b5c4fbc3773
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 21:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111870

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.18.bb =3D> iwd_2.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.18.bb =3D> iwd_2.19.bb} (=
94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.18.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_2.19.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.18.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.19.bb
index 4d993031d..87ba31667 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.18.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.19.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "100d029171d161411f6cd8e1f95708e3a4351fb19e6847ba=
04819377b5fed13e"
+SRC_URI[sha256sum] =3D "9d0b934e51580316919796aa0357590971fc0df244b273fa=
10e154c268374f91"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.45.2


