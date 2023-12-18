Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED80C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 23:20:14 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.5399.1702941611470960836
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 15:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=v4qfHi4g;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5F3C187525;
	Tue, 19 Dec 2023 00:20:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1702941609;
	bh=FhVixvd2YZVcG9OpM3n8yUV7qCOxo5iVOFA+4eMGciM=;
	h=From:To:Cc:Subject:Date:From;
	b=v4qfHi4gHRpfG2Qba3PQ3MBAsnmvgttGC7bzXBV2Ckdb+LurVCBnTTBsqyP1k/rr8
	 GNEMl/1XQlFUHfSmKuqBEgbA6sXtNX2WklfLlQ+GxhFe1BRLpV4+GK+TdAtf/mzOH5
	 jz/DOaPnENBSchT8aWE5SPElNNxel0EO98nagC8F/a3oeM4DT+lz2+AowGZc23gOPl
	 TBPW8dAl7VMcOn/RTvK3kewbzhXcF9xTP5PUmcjIgX2J556LCKS7tdSjXvAF3S0g9u
	 WQV4WstnaR/YRQNrmGQoY5viB1CXpNdNdU/9WkYcHYkZP5jFDxOtVcMXksLkpi7bXf
	 XRAUYVXEtUdeA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] faad2: Upgrade 2.10.0 -> 2.11.1
Date: Tue, 19 Dec 2023 00:19:01 +0100
Message-ID: <20231218231939.124196-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 23:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107550

Update faad2 to latest 2.11.1 release. Use SRCREV matching tag 2.11.1 .

Switch to cmake .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 .../faad2/{faad2_2.10.0.bb =3D> faad2_2.11.1.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/faad2/{faad2_2.10.0.bb =3D> faad2_2.11=
.1.bb} (82%)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb b/meta-oe/r=
ecipes-multimedia/faad2/faad2_2.11.1.bb
similarity index 82%
rename from meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb
rename to meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
index 1b4236073..76e8f72c4 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
@@ -10,8 +10,8 @@ LICENSE_FLAGS =3D "commercial"
 PV .=3D "+git${SRCPV}"
=20
 SRC_URI =3D "git://github.com/knik0/faad2.git;branch=3Dmaster;protocol=3D=
https"
-SRCREV =3D "df42c6fc018552519d140e3d8ffe7046ed48b0cf"
+SRCREV =3D "216f00e8ddba6f2c64caf481a04f1ddd78b93e78"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools lib_package
+inherit cmake
--=20
2.43.0


