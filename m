Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99A4C47DA9
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 10:41:35 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.11591.1706524894560385537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jan 2024 02:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id 0050936C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 11:41:31 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.43.245]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rUP4x-1QYZX70; Mon, 29 Jan 2024 11:41:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: update 2.8 -> 2.13
Date: Mon, 29 Jan 2024 11:41:31 +0100
Message-ID: <20240129104131.1784413-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1706524887-2F7FDC95-19A361AC/0/0 CLEAN NORMAL
X-TOI-MSGID: 00c7d80f-fd12-46ad-81be-68b4d3761732
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 10:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108484

ver 2.13:
	Fix issue with handling netconfig and roaming conditions.
	Fix issue with logging requirement for CMD_EXTERNAL_AUTH.
	Fix issue with using OpenSSL 3.2 installations.
ver 2.12:
	Fix issue with DPP extra settings not being used.
	Fix issue with DPP and PRF+ handling on AARCH64.
	Add support for SAE password identifiers.
ver 2.11:
	Fix issue with handling iovecs with multiple IEs.
	Fix issue with handling SAE password identifiers.
	Fix issue with handling agent release method call.
ver 2.10:
	Fix issue with buffer overflow for 32 byte SSIDs.
	Fix issue with deauthentication before FT work completes.
	Fix issue with power save disabling procedure.
ver 2.9:
	Fix issue with handling certain FT failures.
	Fix issue with handling user-disabled bands.
	Fix issue with handling roam on beacon loss event.
	Add support for PKEX configurator.
	Add support for PKEX enrollee.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.8.bb =3D> iwd_2.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.8.bb =3D> iwd_2.13.bb} (9=
4%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_2.13.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.13.bb
index ee310d295..687dc41c6 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.13.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ell"
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
            "
-SRC_URI[sha256sum] =3D "a90e621f45b9c2f9021beea0fa6477ee0334fcd2ee34beaa=
b42e31ea0fd3be29"
+SRC_URI[sha256sum] =3D "5c58d0cc7c2c81540a515a7487330468c61615d23031af47=
be15f694fbfbc8b3"
=20
 inherit autotools manpages pkgconfig python3native systemd
=20
--=20
2.43.0


