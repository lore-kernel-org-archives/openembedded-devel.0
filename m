Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10B1EB64DD
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:03:53 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web10.5684.1687780024252383693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 04:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=Q8VJvxVV;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687780021;
	bh=sOJdH2t8WdidG7EBkMwuimJZsjCI9fGFQBPRAs8ylY8=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=Q8VJvxVV1BvQ7B/0zBsOJxDfiM9kM9ImdgthkYbh88RP0UdfSEb4xbCLXI4+neshq
	 0J/LN9yo+L7wAg38a9PsOA/v4lROBwb8yautxlBPAOGCV9av3h/StoJ53a1WrhIPT2
	 8sUVO6qe9FqGUQtDg+AEONQQdb+LEyN/nZeimcq+kRKyjs8ItTRlWJJibTqjmBMFsa
	 hUjzds5iC3tp0/bZxhPk9eEB/9UM8ZuLQZJpVXnpqcOUGgcH5H7yAuZ7hXUaUELtq8
	 LOzgT4YhyeYyrqzyHwvMYR5/5Io6NJxwcKFSDqrsLa/+h9GpuffmvJBn+gE7bTnqRJ
	 U1F+LFXP1I2Mg==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH 3/5] python3-virtualenv: Add initial recipe 20.23.0
Date: Mon, 26 Jun 2023 13:45:31 +0200
Message-ID: <20230626114533.221953-3-jasper@fancydomain.eu>
In-Reply-To: <20230626114533.221953-1-jasper@fancydomain.eu>
References: <20230626114533.221953-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 12:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103578

Dependency for python3-tox

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../python/python3-virtualenv_20.23.0.bb      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualen=
v_20.23.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.23=
.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.23.0.bb
new file mode 100644
index 0000000000..38487488a9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.23.0.bb
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: MIT
+# Copyright (C) 2023 iris-GmbH infrared & intelligent sensors
+
+SUMMARY =3D "A tool for creating isolated virtual python environments."
+HOMEPAGE =3D "https://github.com/pypa/virtualenv"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ce089158cf60a8ab6abb452b6405=
538"
+
+SRC_URI[sha256sum] =3D "a85caa554ced0c0afbd0d638e7e2d7b5f92d23478d05d17a=
76daeac8f279f924"
+
+BBCLASSEXTEND =3D "native nativesdk"
+inherit pypi python_hatchling
+
+DEPENDS +=3D "\
+    ${PYTHON_PN}-hatch-vcs-native \
+"
+
+RDEPENDS:${PN} +=3D " \
+    ${PYTHON_PN}-distlib \
+    ${PYTHON_PN}-filelock \
+    ${PYTHON_PN}-platformdirs \
+"
--=20
2.41.0


