Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BC0C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 06:39:08 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.36311.1708324739071667343
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Feb 2024 22:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout07.t-online.de (Postfix) with SMTP id 4F39D19EC
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 07:38:57 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.44]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rbxIm-1AfaLZ0; Mon, 19 Feb 2024 07:38:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 2.13 -> 2.14
Date: Mon, 19 Feb 2024 07:39:12 +0100
Message-ID: <20240219063912.16171-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1708324736-05983954-A15261A8/0/0 CLEAN NORMAL
X-TOI-MSGID: ef9571de-c1be-4615-a145-311d4ffa557a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 06:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108842

ver 2.14:
	Fix issue with accepting PTK 4/4 after receiving PTK 2/4.
	Fix issue with frequency limit for quick scans.
	Fix issue with limiting DHCPv4 attempts.
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.13.bb =3D> iwd_2.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.13.bb =3D> iwd_2.14.bb} (=
94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.13.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_2.14.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.13.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.14.bb
index 687dc41c6..f190ef198 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.13.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.14.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "5c58d0cc7c2c81540a515a7487330468c61615d23031af47=
be15f694fbfbc8b3"
+SRC_URI[sha256sum] =3D "830184db5d3885ac68701cd8bb1c04d0bd8c8d3ab1c82b89=
3b5e2bdf23329f28"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.43.0


