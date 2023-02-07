Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96D5C636D3
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 17:18:22 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.89450.1675790301000984186
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 09:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id 622779ED7
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 18:18:18 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.4]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pPRbi-0ylo810; Tue, 7 Feb 2023 18:18:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] iwd: update 2.0 -> 2.3
Date: Tue,  7 Feb 2023 18:17:54 +0100
Message-Id: <20230207171755.159316-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675790294-B2834007-C565D796/0/0 CLEAN NORMAL
X-TOI-MSGID: 73c10707-81a0-4cba-9684-342c295cfa9a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 17:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100964

ver 2.3:
	Fix issue with length calculation for WMM IE.
	Fix issue with channel number allocation off-by-one.
	Fix issue with cached session when TLS phase2 fails.
	Add support for FastReauthentication setting for EAP-TLS.

ver 2.2:
	Fix issue with handling FT and multiple roaming scans.
	Fix issue with handling multiple wiphy registrations.
	Fix issue with with EAP-PEAP session resumption.
	Add support for using PTK rekeying in AP mode.
	Add support for setting country IE in AP mode.
	Add support for setting WMM parameter IE in AP mode.

ver 2.1:
	Fix issue with handling FT-over-DS action.
	Fix issue with handling scan and 6 GHz support check.
	Fix issue with handling when periodic scans get aborted.
	Add support for using 5 GHz frequencies in AP mode.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.0.bb =3D> iwd_2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.0.bb =3D> iwd_2.3.bb} (94=
%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.0.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_2.3.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.0.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.3.bb
index 8ec211bd6..46e377de3 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.0.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.3.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "5a0bfbc567092476d60a8f9700f68a273e39fd46e7177ce2=
d69bbc74255a930c"
+SRC_URI[sha256sum] =3D "b0506d797a8bfb88f3c3eeea5e49dcf4ee8e6cef118f57c1=
18e587eeb377ac64"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.34.1


