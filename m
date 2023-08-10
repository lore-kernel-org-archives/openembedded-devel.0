Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC58C001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 12:48:06 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.web11.16179.1691671680460200593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 05:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fris.de header.s=dkim header.b=MbfA4Xu/;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD52BBFAB3;
	Thu, 10 Aug 2023 14:47:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1691671676; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=af6VqxdRbYJ+idhle465vaIWOlXOnNh41dkoUdSBVns=;
	b=MbfA4Xu/c1pjV0aEqyzW0Xc+Kf+23zZ3R23q8N3O0PFO8JH8kajg30JAyysvEdJnM7Oh1t
	AmG03METvwk3RomfVL98wJWfjBMJSYQZU/edyMxopTdnqmYiP3Y/FPolFiZkkhE3+4hhsA
	dB2K4zQiMHGu2eG8y7/oRkH6w+DH5pc4pH6an7lcRrApg7jGjXAiGK2YR0GEwcJw5Tm3qb
	rS8EEZVX3BzuphKfGBwn58jdEEHADc4tcPVKmG04ob4H0ehXsrQP2Q9MIXygSdpxX/oRtd
	8YcUuysUzAc9PvcjQr5S8XivskBc0JAgxxljuuVKQOAL9P3tmoTknLP/X/0AYg==
From: Frieder Schrempf <frieder@fris.de>
To: openembedded-devel@lists.openembedded.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [kirkstone][meta-python][PATCH] python3-can: Add missing runtime dependencies
Date: Thu, 10 Aug 2023 14:47:30 +0200
Message-ID: <20230810124730.238812-1-frieder@fris.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 12:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104314

From: Frieder Schrempf <frieder.schrempf@kontron.de>

According to the setup.py of v4.0.0 [1] the following runtime
dependencies are currently missing. Add them.

* packaging
* setuptools
* typing_extensions

While at it, also reorder the list alphabetically.

[1] https://github.com/hardbyte/python-can/blob/4.0.0/setup.py

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 meta-python/recipes-devtools/python/python3-can_4.0.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.0.0.bb b/m=
eta-python/recipes-devtools/python/python3-can_4.0.0.bb
index 2cd2e624b..79aa3e19e 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.0.0.bb
@@ -11,16 +11,19 @@ inherit pypi setuptools3
=20
 RDEPENDS:${PN}:class-target +=3D "\
     ${PYTHON_PN}-aenum \
-    ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-pkg-resources \
+    ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-sqlite3 \
+    ${PYTHON_PN}-typing-extensions \
     ${PYTHON_PN}-wrapt \
-    ${PYTHON_PN}-pkg-resources \
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.41.0


