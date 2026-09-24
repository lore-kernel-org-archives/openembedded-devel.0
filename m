Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94548C98313
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:59:49 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1604.1790229583882307550
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ZYjimnX5;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id 9B707E1EC
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 07:59:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.151]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9cUe-4OuUPz0; Thu, 24 Sep 2026 07:59:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] tailscale: drop the require of the generated files
Date: Thu, 24 Sep 2026 07:59:26 +0200
Message-ID: <20260924055926.7886-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924055926.7886-1-f_l_k@t-online.de>
References: <20260924055926.7886-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790229580-8AFFA986-FE1E9D42/0/0 CLEAN NORMAL
X-TOI-MSGID: 0130bfbf-1738-421f-b02e-fc62d278c22d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790229581; i=f_l_k@t-online.de;
	bh=RjQntLgEpJxgpMIZrN6Vyqwn/oYF7wH5Diy0Zi9r6Y4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZYjimnX5gjt9zXpArfKaWeIiCkIipkwrK75X5m1FUT5qM7B6Q3HGBsnEIEphxMJlG
	 MxmnZ+abNYmOED7fO/7wClia3FdpcWdneKT3zwea6i8UjCggqTUsINkbWCxOsP/TJ4
	 1fyfHTUG+zgLDVeV0zw2Y10AzoBnOOIsgPVlbHtJb1/ni9lb5Px+r+LOmnureebZSO
	 iO7zz1+8HBDPvmAV79URn5hPpeo+2qKFtzHOdIZpAVlJfnYzhqyOPR92LczxqDj90n
	 qw0Z+S+FkH8vi/J2r2eqWGHiDUpWzgVB9fmagyyXx8XPd6VC/31KL4Ot2ZNL0buisu
	 SS9WDSNhGNn5g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 05:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130278

go-mod-update-modules includes the -licenses.inc and -go-mods.inc files
itself now, requiring them again includes them twice.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-connectivity/tailscale/tailscale_1.102.3.bb         | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale_1.1=
02.3.bb b/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.=
3.bb
index a8b47a8ed2..ac70e6fada 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
@@ -5,7 +5,6 @@ SECTION =3D "networking"
=20
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Dcadeae10a885=
6ddfdb129866b75b33e3"
-require ${BPN}-licenses.inc
=20
 MAJOR_MINOR =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://github.com/tailscale/tailscale.git;protocol=3Dhttps;b=
ranch=3Drelease-branch/${MAJOR_MINOR};destsuffix=3D${GO_SRCURI_DESTSUFFIX=
} \
@@ -14,7 +13,6 @@ SRC_URI =3D "git://github.com/tailscale/tailscale.git;p=
rotocol=3Dhttps;branch=3Dreleas
            "
 SRCREV =3D "53a0d659afa51835dd7a9283873cca44261454f8"
 SRCREV_SHORT =3D "${@d.getVar('SRCREV')[:8]}"
-require ${BPN}-go-mods.inc
=20
 GO_IMPORT =3D "tailscale.com"
 GO_INSTALL =3D "${GO_IMPORT}/cmd/tailscaled"
--=20
2.55.0


