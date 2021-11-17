Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3F2C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 09:56:21 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web11.5135.1637142980577714085
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=aOpBn0Yv;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id BBCA5E1CF6;
	Wed, 17 Nov 2021 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1637142977; bh=n3tJU37O0pW4szyP+/YRG6v1x0LWecxzNgn1v8NI4/E=;
	h=From:To:Cc:Subject:Date;
	b=aOpBn0YvFgScPdnzOPRVYkmJbambKgF0TptLQFyNo90nbKnuRDXtWdh/d9Hk26039
	 K0BBwrT3zp/BKuc3ckf1HWWKgjyAhzX1xblGWk6BiioHglj4yWUb5/LYS36XcOvwsi
	 jn1IxwunIhcGTJflK/GzDmkZ+ug6J1XIktL3bZopwO9EA6ipQH0gylGB2vZ3foIG19
	 eaTa968Q7k/t5AAtxl4pPIjXcK1qXiFd4QJxG60/UGWz1/DDW568JcaVPTs/rIZf/C
	 xDMCnLcThijgQaNbwlQIMTnTzbtMuNNcsvzdkZxUBG2fNjEvhLzLSKXrfIfvADGw/h
	 R5lkSGPlVA1cw==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
Subject: [meta-oe][PATCH v2] msgpack-cpp: fix msgpack-cpp is a header only
 library
Date: Wed, 17 Nov 2021 10:56:13 +0100
Message-Id: <20211117095613.1900569-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 09:56:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93995

From: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>

${PN} is empty so don't let the -dev package RDEPEND on it

Signed-off-by: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb b/meta=
-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
index ef066753d..25b199f57 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
@@ -19,4 +19,6 @@ S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
+RDEPENDS:${PN}-dev =3D ""
+
 BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.33.0


