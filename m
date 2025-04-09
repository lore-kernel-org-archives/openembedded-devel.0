Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA3EC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:16:12 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.4121.1744190170248394403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout11.t-online.de (Postfix) with SMTP id 52E44159F
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Apr 2025 11:16:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.12]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u2RXR-3wG6TZ0; Wed, 9 Apr 2025 11:16:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 3.3 -> 3.6
Date: Wed,  9 Apr 2025 11:15:58 +0200
Message-ID: <20250409091558.2179090-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1744190165-DFFE9A6A-ECA06B92/0/0 CLEAN NORMAL
X-TOI-MSGID: 67d4825e-463a-4dbc-ab15-62853705209f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 09:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116732

ver 3.6:
	Fix issue with handling blacklisting and roaming requests.
	Fix issue with handling CQM thresholds for FullMAC devices.
	Add support for PMKSA when using FullMAC devices.

ver 3.5:
	Add support for option to disable blacklist handling.
	Add support for option to disable SAE for broken drivers.

ver 3.4:
	Add support for the Test Anything Protocol.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.3.bb =3D> iwd_3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.3.bb =3D> iwd_3.6.bb} (95=
%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_3.6.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.6.bb
index 9d5b3658ae..33b288e1c4 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.6.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "https://www.kernel.org/pub/linux/network/wir=
eless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            file://iwd \=20
            "
-SRC_URI[sha256sum] =3D "8189e15e701112f871fb5f5e9351f007c9098754b4168ed4=
3cc5422a3adc0255"
+SRC_URI[sha256sum] =3D "cc5e02068d7407b9dac000429d667af32e9d91c7bff3183a=
241d8fdb0f75734b"
=20
 inherit autotools manpages pkgconfig python3native systemd update-rc.d
=20
--=20
2.49.0


