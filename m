Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AB3C98315
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:59:50 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1570.1790229583844866554
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=GArWAGL2;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 9B7F31C4CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 07:59:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.151]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9cUe-4OuUPy0; Thu, 24 Sep 2026 07:59:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] crucible: drop the require of the generated files
Date: Thu, 24 Sep 2026 07:59:25 +0200
Message-ID: <20260924055926.7886-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924055926.7886-1-f_l_k@t-online.de>
References: <20260924055926.7886-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790229580-69FF8986-A098B437/0/0 CLEAN NORMAL
X-TOI-MSGID: 4a89e8fe-1182-4a6b-afa4-872f03b06e4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790229581; i=f_l_k@t-online.de;
	bh=NGmXGAo147KgQcCsc8PpDgDozzKWaj7nvXD17uFSqus=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GArWAGL2wWqycb3ztTNWg2haDdLc3L0285nQkfIMzHvbWjuQgHrWCEglI2Trk0S2e
	 9EUz2L28wjQjU9RNEvM60MJMLnsWodNgV0KkFqz9PA7MV+eOESDUXCB2To8ytXVfyD
	 ZOYpdfysOExZK6IUTArp6oZwlMzaS9rcVzalEqpVZeylp5RFGecKWCJ5NPuMdhHDhU
	 nhIlbNYJVenw5VDwXAMcsHqfyGDE4eZaQ4ov0dGuN0F4YuDT4uPZURXiaJ4VKDxA83
	 Vxj3Fdn+GJTFXhS15kOTGCZqdi7Ptk7un6l4V5jhKLfhLq4lo0SLn0AAvZ+L/HKIPV
	 Nx49NILW4L2nQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 05:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130276

go-mod-update-modules includes the -licenses.inc and -go-mods.inc files
itself now, requiring them again includes them twice.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/crucible/crucible_2025.05.28.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb b/me=
ta-oe/recipes-support/crucible/crucible_2025.05.28.bb
index 4bff47eb68..83aa16f0c2 100644
--- a/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
@@ -2,14 +2,11 @@ SUMMARY =3D "Utility that provides userspace support fo=
r reading and writing to th
=20
 LICENSE =3D "BSD-3-Clause AND ${GO_MOD_LICENSES}"
 LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D201414b66102=
03caed355323b1ab3116"
-require ${BPN}-licenses.inc
=20
 SRC_URI =3D "git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;des=
tsuffix=3D${GO_SRCURI_DESTSUFFIX}"
-require ${BPN}-go-mods.inc
=20
 SRCREV =3D "9f6ece1a689bca0abbeae230fa05a749fd8086ec"
=20
-
 GO_IMPORT =3D "github.com/usbarmory/crucible"
 GO_INSTALL =3D "\
     ${GO_IMPORT}/cmd/crucible \
--=20
2.55.0


