Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31C1C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 15:07:48 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.49101.1669388858825940224
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 07:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id D63E42753
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 16:07:36 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.139]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oyaIi-0AK9r70; Fri, 25 Nov 2022 16:07:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] iwd: upgrade 1.30 -> 2.0
Date: Fri, 25 Nov 2022 16:07:22 +0100
Message-Id: <20221125150722.3026-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669388856-2D8B7EA1-1E5FC597/0/0 CLEAN NORMAL
X-TOI-MSGID: 27c515a6-b250-4c4d-8a5a-2d0a156d217a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 15:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99733

ver 2.0:
	Fix issue with handling P2P and limiting ciphers to CCMP.
	Fix issue with scanning before forced roaming action.
	Fix issue with provided scan frequencies from RRM.
	Fix issue with handling Michael MIC failure message.
	Fix issue with handling timestamp size in MPDU frames.
	Fix issue with handling enablement of OCVC for FT AKMs.
	Fix issue with handling FT work as highest priority.
	Fix issue with handling roaming events and Multi-BSS.
	Add support for utilizing roaming candidates list.
	Add support for utilizing TLS session caching.
	Add support for ciphers with 256 bits key size.
	Add support for Access Point mode with legacy TKIP.
	Add support for MAC address changes while powered.
	Add support for IPv4 and IPv6 network configuration.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.30.bb =3D> iwd_2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.30.bb =3D> iwd_2.0.bb} (9=
4%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.30.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_2.0.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.30.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.0.bb
index 1f0bcd4f8..8ec211bd6 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.30.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.0.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "9fd13512dc27d83efb8d341f7df98f5488f70131686021fc=
d0d93fc97af013b8"
+SRC_URI[sha256sum] =3D "5a0bfbc567092476d60a8f9700f68a273e39fd46e7177ce2=
d69bbc74255a930c"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.34.1


