Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72145C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 20:39:34 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web12.3120.1642019972221764120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 12:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@huawei.com header.s=first
 header.b=Gty/qDF7;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: esben@geanix.com)
Received: from localhost (87-49-147-180-mobile.dk.customer.tdc.net
 [87.49.147.180])
	by first.geanix.com (Postfix) with ESMTPSA id 25D835228F2;
	Wed, 12 Jan 2022 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=huawei.com; s=first;
	t=1642019967; bh=gp3OkPPLq5nrHp2w7WNwkVEcWx10kWkowo30FAZIxSk=;
	h=From:To:Cc:Subject:Date;
	b=Gty/qDF7fEwoSR4qHtwKnqSEjrnHG6161aHZ77ogPDwHWS/PRdqPbze4R2RK4LN+Q
	 n0ZrpgiT61soI+ouYDhQ2BUdJQFchqWGBj2WgUuF0FANdNX3dum3trJpkMOfPjEMhy
	 WuLRRc8u98GtSb5SyNEO1xx5yI1fQbl/7Xr7mVxLq9wGmLFr4Xs+RfyBCVtH48FJab
	 Wjmpvd90NmWLoah9HMhf9sg+jyPGd0vTzCnrXSezD+YZLstAAEZjxg3KAIgd80UYrx
	 YsFI9GAJdmc+57XTTTrzLF88iE5nffatQhogPb1chjC9P+bGBChN0D/68kTjpVmTCO
	 J2a9GliazbRyQ==
From: esben.haabendal@huawei.com
To: openembedded-devel@lists.openembedded.org,
	esben@geanix.com
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] python3-prompt-toolkit1: Add latest 1.0 version
Date: Wed, 12 Jan 2022 21:39:26 +0100
Message-Id: 
 <0e2f97993408ba72440a4fa2677b17719a2b141d.1642019865.git.esben.haabendal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 20:39:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94797

From: Esben Haabendal <esben.haabendal@huawei.com>

Old major version with different API (than 3.0) for use by recipes that i=
s
still relying on that.

Signed-off-by: Esben Haabendal <esben.haabendal@huawei.com>
---
 .../python/python3-prompt-toolkit1_1.0.15.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-prompt-to=
olkit1_1.0.15.bb

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit1_=
1.0.15.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit1_1=
.0.15.bb
new file mode 100644
index 000000000000..a7a9bcf8c269
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit1_1.0.15.=
bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Library for building powerful interactive command lines in =
Python (version 1.0)"
+HOMEPAGE =3D "https://python-prompt-toolkit.readthedocs.io/"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db2cde7da89f0c1f3e49bf968d00d5=
54f"
+
+SRC_URI[sha256sum] =3D "858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8b=
bc5cd2e66d816917"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE =3D "prompt_toolkit"
+
+RDEPENDS:${PN} +=3D " \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-wcwidth \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


