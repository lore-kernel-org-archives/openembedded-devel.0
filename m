Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC22C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 20:30:04 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.8828.1747859401872131468
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 13:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout12.t-online.de (Postfix) with SMTP id D88CA12BA
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 22:29:59 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.59]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uHq4c-2QUhWb0; Wed, 21 May 2025 22:29:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 3.6 -> 3.8
Date: Wed, 21 May 2025 22:29:46 +0200
Message-ID: <20250521202946.2158964-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747859398-86FFB54B-A618798E/0/0 CLEAN NORMAL
X-TOI-MSGID: bceb29bb-0463-4a7f-a710-7d5c99fa49e6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 20:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117577

ver 3.8:
	Fix issue with handling unit tests and missing kernel features.
ver 3.7:
	Fix issue with handling length of EncryptedSecurity.
	Fix issue with handling empty affinities lists.
	Fix issue with handling survey scanning results.
	Fix issue with handling duplicate values in DPP URI.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.6.bb =3D> iwd_3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.6.bb =3D> iwd_3.8.bb} (95=
%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.6.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_3.8.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.6.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.8.bb
index eb464d486d..80e36054bd 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.6.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.8.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "https://www.kernel.org/pub/linux/network/wir=
eless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            file://iwd \=20
            "
-SRC_URI[sha256sum] =3D "cc5e02068d7407b9dac000429d667af32e9d91c7bff3183a=
241d8fdb0f75734b"
+SRC_URI[sha256sum] =3D "c556a5a5376270af68940e04e26765026fbbbe4941668317=
c274c91042611cdf"
=20
 inherit autotools manpages pkgconfig python3native systemd update-rc.d
=20
--=20
2.49.0


