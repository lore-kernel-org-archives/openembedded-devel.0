Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24B8C001B1
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:03:53 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web11.5790.1687780023348773636
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 04:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=sUBsJIi7;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687780021;
	bh=q51D+Wkrctl3O1m5WMYnCet3DP/0mjyFFanGTdjMa4U=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=sUBsJIi709YBnTAqO6NOEjF+Jkq9XMVDYLKWBnSHe15Yxqqljo6eTVmJY6I32wrWl
	 7yQNP+p66O70cgUjuBjyt5/iZkX1Dm/hEXYwA0kOeQvPFtG76aFeHcWmZr1VXW55Pu
	 UC0LheUfKKXc7okze7tmWEFOAP9dbpO2bBpT4tYdPh0PDEwYXUkPBs4Ffp7dxy1mpS
	 WgDHOyzFKqaYDuBWOxP24Mh0qrb/82WyKVSWNW0NdMqbNyxK3bD6BshQrDUAuow1jv
	 eayXOmuSPiaITbWm+rr7uh/lz2Ocl7Tz1mZD3men/bSexD5qpp/JpOPsfOcjUg3r+5
	 1TyrqNGeXuvHA==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH 5/5] python3-tox: Add initial recipe 4.6.0
Date: Mon, 26 Jun 2023 13:45:33 +0200
Message-ID: <20230626114533.221953-5-jasper@fancydomain.eu>
In-Reply-To: <20230626114533.221953-1-jasper@fancydomain.eu>
References: <20230626114533.221953-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 12:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103580

From the project description:

Tox aims to automate and standardize testing in Python. It is part of a l=
arger
vision of easing the packaging, testing and release process of Python sof=
tware
(alongside pytest and devpi).

tox is a generic virtual environment management and test command line too=
l you
can use for:

- checking your package builds and installs correctly under different
environments (such as different Python implementations, versions or
installation dependencies),
- running your tests in each of the environments with the test tool of ch=
oice,
- acting as a frontend to continuous integration servers, greatly reducin=
g
boilerplate and merging CI and shell-based testing.

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../python/python3-tox_4.6.0.bb               | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tox_4.6.0=
.bb

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.6.0.bb b/m=
eta-python/recipes-devtools/python/python3-tox_4.6.0.bb
new file mode 100644
index 0000000000..e83587528c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tox_4.6.0.bb
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: MIT
+# Copyright (C) 2023 iris-GmbH infrared & intelligent sensors
+
+SUMMARY =3D "Automate and standardize testing in Python. It is part of a=
 larger vision of easing the packaging, testing and release process of Py=
thon software (alongside pytest and devpi)."
+HOMEPAGE =3D "http://tox.readthedocs.org/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11610a9d8fd95649cf8159be12b98=
cb7"
+
+SRC_URI[sha256sum] =3D "954f1f647f67f481d239a193288983242a6152b67503c4a5=
6b19a4aafaa29736"
+
+BBCLASSEXTEND =3D "native nativesdk"
+inherit pypi python_hatchling
+
+DEPENDS +=3D "\
+    ${PYTHON_PN}-hatch-vcs-native \
+"
+
+RDEPENDS:${PN} +=3D "\
+    ${PYTHON_PN}-cachetools \
+    ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-colorama \
+    ${PYTHON_PN}-filelock \
+    ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-platformdirs \
+    ${PYTHON_PN}-pluggy \
+    ${PYTHON_PN}-pyproject-api \
+    ${PYTHON_PN}-tomli \
+    ${PYTHON_PN}-virtualenv \
+"
+
+# Install all built-in python3 modules, as the software tested with tox =
might
+# depend on it. Tox will attempt to install all required dependencies
+# in a virtualenv using pip, but this obviously does not include the bui=
lt-in modules.
+RDEPENDS:${PN} +=3D "${PYTHON_PN}-modules"
--=20
2.41.0


