Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D86DEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:03:53 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web10.5683.1687780023213215727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 04:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=IKBSSsZ9;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687780021;
	bh=Sb2Jpzq+RW3YGkYcMJmlRH7DjsjDXxrf7x5c/xec1NU=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=IKBSSsZ9V/euOssRk96xD5KjvjMUjpN3XXBv4qD7leMDT5x4rmqeew3onUtnO5Bz+
	 h8xZhTbBRbasdmghBVN80qfVBq6LUIm4cqSmPOJhws5Qlq/65oMYaLdZhrUmft44Sq
	 hNpzJ3WaBleqmVYi5rNOwmBKneaiyxgm912uNmQrl4kaoZOZYY4jfTEG/frvZ5egMq
	 3IrM4dKq/hlsLdmc3eW0ZmzQES4hKktx7VgxVrqdoIM9bPBjuJ+nDN0Tg4kfLMDakz
	 ltMHTqyVnFTyyPPJjN2Obi9uZinbiG7mIFjAAuaSMqHhtKBWLOb3N3pzWXp6Y1qR/n
	 2QjqvsZGPzZWQ==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH 4/5] python3-pyproject-api: Add initial recipe 1.5.1
Date: Mon, 26 Jun 2023 13:45:32 +0200
Message-ID: <20230626114533.221953-4-jasper@fancydomain.eu>
In-Reply-To: <20230626114533.221953-1-jasper@fancydomain.eu>
References: <20230626114533.221953-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 12:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103577

Dependency for python3-tox

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../python/python3-pyproject-api_1.5.1.bb     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyproject=
-api_1.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.=
5.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.5.1.=
bb
new file mode 100644
index 0000000000..1b458fa2df
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.5.1.bb
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: MIT
+# Copyright (C) 2023 iris-GmbH infrared & intelligent sensors
+
+SUMMARY =3D "pyproject-api aims to abstract away interaction with pyproj=
ect.toml style projects in a flexible way."
+HOMEPAGE =3D "https://pyproject-api.readthedocs.io"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11610a9d8fd95649cf8159be12b98=
cb7"
+
+SRC_URI[sha256sum] =3D "435f46547a9ff22cf4208ee274fca3e2869aeb062a4834ad=
fc99a4dd64af3cf9"
+
+PYPI_PACKAGE =3D "pyproject_api"
+
+BBCLASSEXTEND =3D "native nativesdk"
+inherit pypi python_hatchling
+
+DEPENDS +=3D "\
+    ${PYTHON_PN}-hatch-vcs-native \
+"
+
+RDEPENDS:${PN} +=3D "\
+    ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-tomli \
+"
--=20
2.41.0


