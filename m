Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5923BEF48C5
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 14:44:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6958.1771080249945237522
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Feb 2026 06:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id E75951C18C
	for <openembedded-devel@lists.openembedded.org>; Sat, 14 Feb 2026 15:44:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.49]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vrGsJ-2iQjJ30; Sat, 14 Feb 2026 15:43:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 3.10 -> 3.11
Date: Sat, 14 Feb 2026 15:43:53 +0100
Message-ID: <20260214144353.398923-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1771080239-E4FC7FB0-61981962/0/0 CLEAN NORMAL
X-TOI-MSGID: 2a178737-6cae-42f4-b127-1f2b1fc3269d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Feb 2026 14:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124401

ver 3.11:
	Fix issue with interface registration before acquiring name.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.10.bb =3D> iwd_3.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.10.bb =3D> iwd_3.11.bb} (=
95%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.10.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_3.11.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.10.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.11.bb
index f52472adf8..c4956fb22c 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.10.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.11.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "https://www.kernel.org/pub/linux/network/wir=
eless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            file://iwd \=20
            "
-SRC_URI[sha256sum] =3D "640bff22540e1714f71772a83123aff6f810b7eb9d7d6df1=
e10fb2695beb5115"
+SRC_URI[sha256sum] =3D "85730e79de05978e26e44b958fd11e2ebb45424ca181f8db=
7a8daf25fc2226ea"
=20
 inherit autotools manpages pkgconfig python3native systemd update-rc.d
=20
--=20
2.52.0


