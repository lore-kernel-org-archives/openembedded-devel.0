Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F217EB64DA
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:03:53 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web10.5680.1687780019229276364
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 04:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=WOC1tTiX;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687780015;
	bh=LXUDjE6eMq6q1+zPziWydWNMkCG0888C0zXZTxZr620=;
	h=From:To:Cc:Subject;
	b=WOC1tTiXduijlosmYRzygHLRnbquv8sdSu7Ba4DEmj0uF/9W+YWdHCjd7fbjW91xV
	 6FdrGW06zS/7vHuKoc2eQtthTMMDohpjUNIO6tzq1P2YkfMCM+0GECRBMwLaLBaQQF
	 ymz7VEaxJFKPDkrNlK9GShxzgJnGF4s7X9Ki5TIN+NVRNJ3NfzbDHdTeXHYl0mnbFz
	 firegHQqCB7JDhF1pkZll5fwrZxQwCK/12Hmp7SNuuLJXy9G4G12tF/F3dUDdUUD0y
	 MFY/APg4w3YNFOgWRXXXyKI3PuXvASkY8i9HzIXDBmESbrAx1C0owe3qRaL7xLp14f
	 aUR9uju6io/+A==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH 1/5] python3-distlib: Add initial recipe 0.3.6
Date: Mon, 26 Jun 2023 13:45:29 +0200
Message-ID: <20230626114533.221953-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 12:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103576

Dependency for python3-virtualenv

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../recipes-devtools/python/python3-distlib_0.3.6.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-distlib_0=
.3.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb=
 b/meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb
new file mode 100644
index 0000000000..ffffece56a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: MIT
+# Copyright (C) 2023 iris-GmbH infrared & intelligent sensors
+
+SUMMARY =3D "A library which implements low-level functions that relate =
to packaging and distribution of Python software."
+HOMEPAGE =3D "https://github.com/pypa/distlib"
+LICENSE =3D "PSF-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df6a11430d5cd6e2cd3832ee94=
f22ddfc"
+
+SRC_URI[sha256sum] =3D "14bad2d9b04d3a36127ac97f30b12a19268f211063d8f8ee=
4f47108896e11b46"
+
+BBCLASSEXTEND =3D "native nativesdk"
+inherit pypi python_setuptools_build_meta
--=20
2.41.0


