Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0123E7716A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 10:30:31 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.33858.1734258627109169033
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Dec 2024 02:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout12.t-online.de (Postfix) with SMTP id 1EA9165D
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 11:30:24 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.43]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tMltH-2sVDNJ0; Sun, 15 Dec 2024 11:30:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 3.0 -> 3.2
Date: Sun, 15 Dec 2024 11:30:26 +0100
Message-ID: <20241215103026.1423873-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734258623-02FFA99A-91644A34/0/0 CLEAN NORMAL
X-TOI-MSGID: 28700f38-fd58-4c7a-a5e9-2a31f7c720f3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 10:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114316

ver 3.2:
	Fix issue with GCC 15 and -std=3Dc23 build errors.
	Add support for using PMKSA over SAE if available.
	Add support for HighUtilization/StationCount thresholds.
	Add support for disabling Multicast RX option.

ver 3.1:
	Fix issue with handling OWE transition BSS selection.
	Fix issue with handling oper class 136 starting frequency.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.0.bb =3D> iwd_3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.0.bb =3D> iwd_3.2.bb} (94=
%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.0.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_3.2.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.0.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.2.bb
index a1293d6dca..e5d838d25f 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.0.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.2.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "dbus"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "bd167ab368b6ba302b6c948a4f41f02d233a12e20d5094b1=
c0393325309f8a60"
+SRC_URI[sha256sum] =3D "21f5a8e29a41ff301045f36eed97a4e540262adfdc003db8=
47fe0c7dce874e15"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.47.1


