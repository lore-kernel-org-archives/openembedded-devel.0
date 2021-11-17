Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D197C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 08:10:07 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web11.4368.1637136605266661686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 00:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=E7uE37Hv;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id B10BEE1BEE;
	Wed, 17 Nov 2021 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1637136601; bh=YXZOWKGs16YLSrmGktr0UrolPBmYKEOyPqquTwlBTzk=;
	h=From:To:Cc:Subject:Date;
	b=E7uE37Hv4lQoN6UWpqajhxTtSzEIISrZ2JX2VNhQymO0HRb543TJVO6sPm/255ngc
	 Sa3Hcn6ACwTWJWsBvrgZJLCVV/RezWLriWRJ1ivOGlCATKP9f9Emel543En25nRQni
	 LM3ki+4EasSDr1JVibJJ6InJSPOdUgSYxwmZnt2fW9KzY/G3YGbfsPfxCJwYeZ+1M9
	 bX1Y8UzptLGHfPUnLuMC2od3i/JH2nusRDqRX2xGUq16NYaCB8QY99Z4Figl92XKZi
	 Zxcb2syVpwdWnwDPr6sU/CVRZ3yo78wySe6m148t9hREcjQ5TjIVJaIVXZKPKmKjwf
	 5hpfLYHeNa+KQ==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: alex@linutronix.de,
	Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
Subject: [PATCH] msgpack-cpp: fix msgpack-cpp is a header only library
Date: Wed, 17 Nov 2021 09:09:55 +0100
Message-Id: <20211117080956.1887223-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 08:10:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93989

From: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>

${PN} is empty so don't let the -dev package RDEPEND on it

Signed-off-by: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb b/meta=
-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
index ef066753d..dc8f13c26 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
@@ -19,4 +19,8 @@ S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
+ALLOW_EMPTY:${PN} =3D "1"
+
+RDEPENDS:${PN}-dev =3D ""
+
 BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.33.0


