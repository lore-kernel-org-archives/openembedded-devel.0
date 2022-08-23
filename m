Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEA5C32789
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 17:51:37 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.1067.1661277087247032104
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout12.t-online.de (Postfix) with SMTP id CBBF19DEE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 19:51:23 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.34.135]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQY3c-4bJ4770; Tue, 23 Aug 2022 19:51:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] iwd: update to v1.29
Date: Tue, 23 Aug 2022 19:51:08 +0200
Message-Id: <20220823175108.18584-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1661277080-01452C5E-100DBC4F/0/0 CLEAN NORMAL
X-TOI-MSGID: eabd30b9-bd37-45d6-873b-8fa2580ae62b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 17:51:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98400

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb =3D> iwd_1.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb =3D> iwd_1.29.bb} (=
94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_1.29.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
index 40f35b15a..eada93b65 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "ee538c720ad15335ece81a52a4b8a11820236df9ed9a5a72=
a2e64d74c652f0b0"
+SRC_URI[sha256sum] =3D "71533fe3b8f6381f24832198ba11d00f04a361454770c173=
b3b66bc3cdf272bd"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.34.1


