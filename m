Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE4DEB64DC
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 14:27:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.18963.1688826430223773862
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Jul 2023 07:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=gZBbMAnK;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 49288861A1;
	Sat,  8 Jul 2023 16:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1688826427;
	bh=LmQGer78LX24TT/SMj3HISIvPAwfuLvF6UOULCXRDOs=;
	h=From:To:Cc:Subject:Date:From;
	b=gZBbMAnKyPoI5d0hgvYVfUUAhqe4SWJeBUbf4VK6ZQ310k0Nvq+3yVXREazVk/TBO
	 7uc8CpX35wG5pl12Om0X3rY3NCoCLoW+cNzLIXzO1fiMkog/Vu0jAVlj/2p1RqthMh
	 B44qfGGK5seARfHAUVG/VZogHuP8INjlQyKjaz858MeoZHyHAqA97E0gNOBpLwY2vf
	 Gl/8Q07u8If6gwRCvnYxtGT3KCus17kf3q58H8PczvqvI/3DlriL+jDNLrwwX/GApk
	 MtGM/YkUAOb3y+5R4ZxIb/5byUrSCWvLZ33D36Xt29bqZaO5IEg1Ec5kmXXLCTIzWF
	 JKQnOV+mIfupA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jan Luebbe <jlu@pengutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] linux-serial-test: Update to latest git revision
Date: Sat,  8 Jul 2023 16:26:46 +0200
Message-Id: <20230708142646.39357-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jul 2023 14:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103717

Update the recipe to latest git revision to pull in latest fixes.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Jan Luebbe <jlu@pengutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git=
.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index 7f08a82d6..7abdcb252 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/MIT;md5=3D544799d0b=
492f119fa04641d1b8868ed"
 SRC_URI =3D "git://github.com/cbrake/linux-serial-test.git;protocol=3Dht=
tps;branch=3Dmaster"
=20
 PV =3D "0+git${SRCPV}"
-SRCREV =3D "cacd2790eae7bf4767d4243f5b31134698d3b20d"
+SRCREV =3D "2ee61484167eab846f7b7c565284d7c350d738d3"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.40.1


