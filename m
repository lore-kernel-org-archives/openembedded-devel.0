Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76E2C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:47:45 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.5474.1718099255878842056
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id B2ECE2910C
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 11:47:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.218]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGy6D-0tuhZh0; Tue, 11 Jun 2024 11:47:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 2.16 -> 2.18
Date: Tue, 11 Jun 2024 11:48:19 +0200
Message-ID: <20240611094819.1569-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1718099249-627FA3C7-15DBDF12/0/0 CLEAN NORMAL
X-TOI-MSGID: 48ff8eb6-30df-4607-b5c4-bc6487afcab5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 09:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110826

ver 2.18:
	Fix issue with handling BSS with invalid HE capabilities.
	Fix issue with neighbor reports with invalid country codes.
	Fix issue with EAP-TTLS Start packets with L flag set.
	Add support for enabling SAE for AP mode operation.

ver 2.17:
	Fix issue with handling deauthenticate on disconnect.
	Fix issue with handling of rate estimation errors.
	Fix issue with handling EAPOL frame listeners.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.16.bb =3D> iwd_2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.16.bb =3D> iwd_2.18.bb} (=
94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.16.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_2.18.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.16.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.18.bb
index a6bb7085e..4d993031d 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.16.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.18.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "c1a82032e994861e794cf3b5a16d07ae1aa03a6674f716c7=
3408ffeae2a233ba"
+SRC_URI[sha256sum] =3D "100d029171d161411f6cd8e1f95708e3a4351fb19e6847ba=
04819377b5fed13e"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.45.1


