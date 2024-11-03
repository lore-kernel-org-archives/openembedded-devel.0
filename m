Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98019E6B252
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 10:32:55 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.33575.1730629967723585185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 02:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout07.t-online.de (Postfix) with SMTP id A38D7178
	for <openembedded-devel@lists.openembedded.org>; Sun,  3 Nov 2024 11:32:45 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.125]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t7XuX-4Dq8LR0; Sun, 3 Nov 2024 11:32:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 2.20 -> 3.0
Date: Sun,  3 Nov 2024 11:34:59 +0100
Message-ID: <20241103103459.1863-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1730629965-2D7F84D7-A8149232/0/0 CLEAN NORMAL
X-TOI-MSGID: c3c7727d-7287-413a-b7fb-00a37b560854
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 10:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113393

ver 3.0:
	Fix issue with handling alpha2 code for United Kingdom.
	Fix issue with handling empty TX/RX bitrate attributes.
	Fix issue with handling RSSI polling fallback workaround.
	Fix issue with handling harmless cloned information elements.
	Add experimental support for External Authentication feature.
ver 2.22:
	Fix issue with handling the Affinities property.
	Fix issue with handling ConnectedAccessPoint signal when roaming.
ver 2.21:
	Fix issue with pending scan requests after regdom update.
	Fix issue with handling the rearming of the roaming timeout.
	Fix issue with survey request and externally triggered scans.
	Fix issue with RSSI fallback when setting CQM threshold fails.
	Fix issue with FT-over-Air without offchannel support.
	Add support for per station Affinities property.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.20.bb =3D> iwd_3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.20.bb =3D> iwd_3.0.bb} (9=
4%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_3.0.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.0.bb
index 16d900ddc..a1293d6dc 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.0.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "dbus"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "86827b97cb5b19ddecce36568c59378da2fae8cf37a0e2b9=
eacd1269f24c6f8e"
+SRC_URI[sha256sum] =3D "bd167ab368b6ba302b6c948a4f41f02d233a12e20d5094b1=
c0393325309f8a60"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.47.0


