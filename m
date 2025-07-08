Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2761FC8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 13:30:04 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.18989.1751981403227188501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 06:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout04.t-online.de (Postfix) with SMTP id 019F7E563
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Jul 2025 15:30:01 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.68]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uZ8OV-2fMRSk0; Tue, 8 Jul 2025 15:29:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][PATCH 2/2] iwd: update 3.8 -> 3.9
Date: Tue,  8 Jul 2025 15:29:53 +0200
Message-ID: <20250708132953.198453-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708132953.198453-1-f_l_k@t-online.de>
References: <20250708132953.198453-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1751981399-2926A5F1-698A5152/0/0 CLEAN NORMAL
X-TOI-MSGID: 6bcceb19-c6e9-4a3a-bc1a-5ced62435dd1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 13:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118312

ver 3.9:
	Fix issue with Access Point mode and frequency unlocking.
	Fix issue with network configuration and BSS retry logic.
	Fix issue with handling busy notification from Access Point.
	Fix issue with handling P-192, P-224 and P-521 for SAE.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.8.bb =3D> iwd_3.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.8.bb =3D> iwd_3.9.bb} (95=
%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.8.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_3.9.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.8.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.9.bb
index 80e36054bd..3a4cf33e4d 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.8.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.9.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "https://www.kernel.org/pub/linux/network/wir=
eless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            file://iwd \=20
            "
-SRC_URI[sha256sum] =3D "c556a5a5376270af68940e04e26765026fbbbe4941668317=
c274c91042611cdf"
+SRC_URI[sha256sum] =3D "0cd7dc9b32b9d6809a4a5e5d063b5c5fd279f5ad3a0bf03d=
7799da66df5cad45"
=20
 inherit autotools manpages pkgconfig python3native systemd update-rc.d
=20
--=20
2.49.0


