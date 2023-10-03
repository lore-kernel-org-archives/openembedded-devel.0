Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56600E8FDB7
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 20:58:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.2054.1696366690998114709
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 13:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=zAj6QE+i;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2B00286538;
	Tue,  3 Oct 2023 22:58:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696366688;
	bh=Rs15DV4TWDvZKPEUfZtMLuyuf8DJkK6S89WtsgF/vWc=;
	h=From:To:Cc:Subject:Date:From;
	b=zAj6QE+iS7z5ZuxkoVbYSw9fLc2ScfaNo04Y2O+k8sQvhG5XjyLWP4P/xBZ2wVPof
	 AZnBs7RHsK4GrJ1tuCrSiDt5M8OSyYZVWoS/U5dd2xipPwJ6ujdWFGBXQtidedGP2T
	 R4v3NXBPlmwl2Oiq7c7vP0KL9nLA/IEGYJQi4VDkmrJLldHRcQeo2N+kOH5x/jTe/m
	 cS7zNAkCA+cSZdsh/xxXZQ+0in/4m1SpPj61Wj5T24z9hbvZbFpEosnYeWmFdU3w79
	 HzHY6j6yEWBefzUWcq60ECOWjHcwCfcVFvAL3jSA4CsKJULY9lENpjBNYZBHydiHhw
	 g3Rafh8iYT8SA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] faad2: Upgrade 2.10.0 -> 2.10.1
Date: Tue,  3 Oct 2023 22:57:47 +0200
Message-Id: <20231003205747.84389-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 20:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105328

Update faad2 to latest 2.10.1 release. Use SRCREV matching tag 2.10.1 .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 .../faad2/{faad2_2.10.0.bb =3D> faad2_2.10.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/faad2/{faad2_2.10.0.bb =3D> faad2_2.10=
.1.bb} (88%)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb b/meta-oe/r=
ecipes-multimedia/faad2/faad2_2.10.1.bb
similarity index 88%
rename from meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb
rename to meta-oe/recipes-multimedia/faad2/faad2_2.10.1.bb
index 1b4236073..5d54dcfe1 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.10.1.bb
@@ -10,7 +10,7 @@ LICENSE_FLAGS =3D "commercial"
 PV .=3D "+git${SRCPV}"
=20
 SRC_URI =3D "git://github.com/knik0/faad2.git;branch=3Dmaster;protocol=3D=
https"
-SRCREV =3D "df42c6fc018552519d140e3d8ffe7046ed48b0cf"
+SRCREV =3D "3918dee56063500d0aa23d6c3c94b211ac471a8c"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.40.1


