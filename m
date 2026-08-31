Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E167C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:45:58 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25990.1788169556574938730
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=q2EVJSy6;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id D1410DF45
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 11:45:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.229.39]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x0yaA-2DwmAK0; Mon, 31 Aug 2026 11:45:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] glaze: fix install paths
Date: Mon, 31 Aug 2026 11:45:24 +0200
Message-ID: <20260831094524.2198830-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788169538-C6FFA933-756FD09D/0/0 CLEAN NORMAL
X-TOI-MSGID: 15902bfc-0da9-4f1e-98de-823cec691fa9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788169538; i=f_l_k@t-online.de;
	bh=iZNMI16gtELjadN1M7K1NX4msXXfPrEeU4H2fPTQW2E=;
	h=From:To:Subject:Date;
	b=q2EVJSy6nrfl/zxXj3x9HLri70PyGO1+v5EmzbTMbAZHVptM1HCxiZoA4C8n9iJa3
	 O+0Psfn11bPmyYThcDwtMJ+0eBzQzmgliZ1d1vx/WG8smU0HtSjjy1wRmUm3dW/tBI
	 pd0rx7pX+NOmlvmLI0AAAG3KFPlkr51Ciei3gqbQ7dEbtdpzuwNKeXHyAZAmYHtaCr
	 u0XkTWZATwDLJLl7ffNr/9p7IEjKO78GPhQXSybT9vA2x4dU4GreVGGoIBsEd6dIsF
	 QgmMAQnJTW3qp849wl04Rywnk5PSg3i2Q490t3C4QgOAk89u67sqdLGmCLt1xqA3S1
	 vxj1k0Q1vqyfw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 09:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129610

This commit moves the cmake files from /usr/share/glaze to
/usr/lib/cmake/glaze so that other cmake project would be able
to find the headers.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/glaze/glaze_8.1.0.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/glaze/glaze_8.1.0.bb b/meta-oe/recip=
es-support/glaze/glaze_8.1.0.bb
index 2d592e0acc..405f575339 100644
--- a/meta-oe/recipes-support/glaze/glaze_8.1.0.bb
+++ b/meta-oe/recipes-support/glaze/glaze_8.1.0.bb
@@ -9,9 +9,14 @@ SRCREV =3D "07e5ef2e2d4c53fdfd8603a61be37053b5a27bc5"
=20
 inherit cmake
=20
-EXTRA_OECMAKE =3D "-Dglaze_BUILD_EXAMPLES=3DOFF -DBUILD_TESTING=3DOFF -D=
glaze_ENABLE_FUZZING=3DOFF -Dglaze_DEVELOPER_MODE=3DOFF"
-
-FILES:${PN}-dev +=3D "${datadir}/${BPN}/*.cmake"
+EXTRA_OECMAKE =3D " \
+    -Dglaze_BUILD_EXAMPLES=3DOFF \
+    -DBUILD_TESTING=3DOFF \
+    -Dglaze_ENABLE_FUZZING=3DOFF \
+    -DCMAKE_BUILD_TYPE=3DRelease \
+    -DCMAKE_INSTALL_PREFIX=3D${prefix} \
+    -DDESTDIR=3D${D} \
+"
=20
 # Glaze is a header-only C++ library, so the main package will be empty.
 ALLOW_EMPTY:${PN} =3D "1"
--=20
2.55.0


