Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17426CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:56:53 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.19471.1758898610631982070
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id DFC73F7DA
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 16:56:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.175]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v29rv-2UIuXJ0; Fri, 26 Sep 2025 16:56:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 3.9 -> 3.10
Date: Fri, 26 Sep 2025 16:56:09 +0200
Message-ID: <20250926145609.1243054-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1758898579-0F7FDA73-1A938813/0/0 CLEAN NORMAL
X-TOI-MSGID: a672160e-3ee4-4bc6-8573-8b2744a34c7f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119931

ver 3.10:
	Fix issue with handling neighbor report on BSS TM request.
	Fix issue with handling deauth and FT association failure.
	Fix issue with handling roaming and old frequencies.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.9.bb =3D> iwd_3.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.9.bb =3D> iwd_3.10.bb} (9=
5%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.9.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_3.10.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.9.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.10.bb
index 3a4cf33e4d..f52472adf8 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.9.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.10.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "https://www.kernel.org/pub/linux/network/wir=
eless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            file://iwd \=20
            "
-SRC_URI[sha256sum] =3D "0cd7dc9b32b9d6809a4a5e5d063b5c5fd279f5ad3a0bf03d=
7799da66df5cad45"
+SRC_URI[sha256sum] =3D "640bff22540e1714f71772a83123aff6f810b7eb9d7d6df1=
e10fb2695beb5115"
=20
 inherit autotools manpages pkgconfig python3native systemd update-rc.d
=20
--=20
2.51.0


