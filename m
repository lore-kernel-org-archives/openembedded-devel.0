Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F3EE6FE51
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 07:47:36 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.3374.1725695252968728395
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 00:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id 5DA1263126
	for <openembedded-devel@lists.openembedded.org>; Sat,  7 Sep 2024 09:46:44 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.86]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1smq9c-1UoYU50; Sat, 7 Sep 2024 09:46:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 2.19 -> 2.20
Date: Sat,  7 Sep 2024 09:48:27 +0200
Message-ID: <20240907074827.11852-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1725695204-977FD85B-2431D655/0/0 CLEAN NORMAL
X-TOI-MSGID: c537cfc6-7a1f-492c-93b4-5534c042638d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 07:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112112

ver 2.20:
	Fix issue with PKEX timeout and number of frequencies used.
	Fix issue with handling logic for handshake failures.
	Fix issue with handling ConnectedAccessPoint signal.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.19.bb =3D> iwd_2.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.19.bb =3D> iwd_2.20.bb} (=
94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.19.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_2.20.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.19.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
index 87ba31667..ffdab0260 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.19.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "9d0b934e51580316919796aa0357590971fc0df244b273fa=
10e154c268374f91"
+SRC_URI[sha256sum] =3D "86827b97cb5b19ddecce36568c59378da2fae8cf37a0e2b9=
eacd1269f24c6f8e"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.46.0


