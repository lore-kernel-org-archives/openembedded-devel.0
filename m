Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D7AC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 10:08:29 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.39883.1737540504859310585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 02:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 7D9114DF
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 11:08:22 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.54]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1taXen-0IYng10; Wed, 22 Jan 2025 11:08:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 3.2 -> 3.3
Date: Wed, 22 Jan 2025 11:08:45 +0100
Message-ID: <20250122100845.405443-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1737540501-567FB959-91ED68E0/0/0 CLEAN NORMAL
X-TOI-MSGID: a8240816-12b6-499e-a6d4-c63575873ff4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 10:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115014

ver 3.3:
	Fix issue with handling External Authentication.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.2.bb =3D> iwd_3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.2.bb =3D> iwd_3.3.bb} (94=
%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.2.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_3.3.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.2.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
index e5d838d25f..84b1795995 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.2.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "dbus"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "21f5a8e29a41ff301045f36eed97a4e540262adfdc003db8=
47fe0c7dce874e15"
+SRC_URI[sha256sum] =3D "8189e15e701112f871fb5f5e9351f007c9098754b4168ed4=
3cc5422a3adc0255"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.47.1


