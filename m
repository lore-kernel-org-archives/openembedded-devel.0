Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EEAC88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:21:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19782.1789467694952424062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Xrb21Oam;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id 74C0B1C2C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 12:21:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6QI6-35axkX0; Tue, 15 Sep 2026 12:21:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-gnome][PATCH 2/5] glibmm-2.68: upgrade 2.88.1 -> 2.90.0
Date: Tue, 15 Sep 2026 12:21:20 +0200
Message-ID: <20260915102123.5530-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915102123.5530-1-f_l_k@t-online.de>
References: <20260915102123.5530-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789467690-7BFFC9C6-333CA2FA/0/0 CLEAN NORMAL
X-TOI-MSGID: 36627304-53a8-4aa5-b4e6-96fd76f86f4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789467692; i=f_l_k@t-online.de;
	bh=/qR+ydkYubTjUwRW4rTo3B8T/hz43C2DKu3kYd5df9Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Xrb21OamH3VuYAUXGhovDJAHYDNuP7zV75INa2fhg0vcDTRXP/JLby+MsuVR2EjpR
	 zDiEXHmbUsQmBrN56S3mYaYgdhkjykdzDiGcB4Up0qQ7xJm4gEaxHLb607+OAAkLwh
	 Ft0lTVdp1mAfP9ArXkgYjWJOyQ6Tb5vN4qxr02//0yaPD2dpI0G3MrbW3mStRHMxd1
	 jrtSo3u+1bxovrWmTitSL+oMK6MwEt8cYF3LJiV74E5zZr0wG2T+8GCVsfWzxaObJh
	 1EtaoPA+m8J96Vwe11fx9s0rSfHAAjeTlG2usFiSCr7LLbbcD1MPudYvIqzQTS/MoU
	 iqtqFP9fAnaNg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 10:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130070

Same conflict as in the 2.66 series; 2.90.0 carries the fix. The API
version stays 2.68, so the pkg-config names are unchanged.

Depends on the glib-2.0 2.90.0 upgrade in oe-core.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../glib-2.0/{glibmm-2.68_2.88.1.bb =3D> glibmm-2.68_2.90.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.88.1.bb =3D> glibmm-=
2.68_2.90.0.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.1.bb b/meta-o=
e/recipes-core/glib-2.0/glibmm-2.68_2.90.0.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.1.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.90.0.bb
index cfabce5b5e..f3d749a092 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.90.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase
=20
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
=20
-SRC_URI[archive.sha256sum] =3D "c139f962b1575c8827cd39d1ac21b7a367be3bda=
1409c0c7e21a29090f371506"
+SRC_URI[archive.sha256sum] =3D "e2efa45643f16b9fea2d6299f2f403d672eaeacd=
df0ff7f8094e1af9b0f5980b"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
--=20
2.55.0


