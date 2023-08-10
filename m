Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E0CC001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 13:35:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.17214.1691674518764651542
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 06:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=EcH9b4eY;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4088586862;
	Thu, 10 Aug 2023 15:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1691674516;
	bh=x8VGKWBzmNVIGkSuqtkzNsp4fJ6VJj3UGqEoZiGvgaI=;
	h=From:To:Cc:Subject:Date:From;
	b=EcH9b4eY+SVj0C85gj1CquqD1G1oPPP/0/tXaqsXicDvuNUazFjzy/84u3JLVXGWe
	 4IJSq7mcWzNsCBL7AmwKUwktpT4TEATXHaLjoidGMukC+I5BQlY+stu9GDOzeY5P9m
	 xQ4Yz1PqqrlIVcMRM/TRsFockwFvGvOVnPuDRKHTff3UvqVv0oMAHZON5CK4Wt0clu
	 pOiEV3vQ/xy3HbM3ljKOPdaxv+ujzx0LzpHh5JJR3IJseSjuqiMjadMiDRH0kI2EnB
	 SPZx88eGkq1vZLZB/553Wzj5owwuGsDqikjTn2Zc70U3s6DqtKT5b+UXU0bNH3/Y9m
	 ces70n4LHFcCw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christian Eggers <ceggers@arri.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Siegumfeldt <mns@gomspace.com>,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] libiio: Use tagged v0.25
Date: Thu, 10 Aug 2023 15:35:01 +0200
Message-Id: <20230810133502.9821-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 13:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104317

Use the actual tagged libiio v0.25 , not some random older version.

Fixes: 6be235b5c ("libiio: update to version 0.25")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Siegumfeldt <mns@gomspace.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recip=
es-support/libiio/libiio_git.bb
index ecbd2c864..dd6fd1c12 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,7 +4,7 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376cea0ce68d2d2da0a=
1b3a72c"
=20
-SRCREV =3D "eee8cba6f42177a094ebe16759606a719676fda7"
+SRCREV =3D "b6028fdeef888ab45f7c1dd6e4ed9480ae4b55e3"
 PV =3D "0.25"
=20
 SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhtt=
ps;branch=3Dmaster"
--=20
2.40.1


