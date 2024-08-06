Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46463C52D7E
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:39:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11997.1722962366501969029
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD61FFEC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9062D3F766
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python 2/7] python3-pathlib2: add from openembedded-core
Date: Tue,  6 Aug 2024 17:39:13 +0100
Message-Id: <20240806163918.2186435-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163918.2186435-1-ross.burton@arm.com>
References: <20240806163918.2186435-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 16:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111587

This recipe is being removed from oe-core, so add to meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-pathlib2_2.3.7.bb                 | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pathlib2_=
2.3.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.7.b=
b b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.7.bb
new file mode 100644
index 0000000000..d4de40893a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.7.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Object-oriented filesystem paths"
+HOMEPAGE =3D "https://github.com/mcmtroffaes/pathlib2"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D2dc08586cce3ab91bfa091b65=
5c0e440"
+
+SRC_URI[sha256sum] =3D "7a4329d67beff9a712e1d3ae147e4e3e108b0bfd284ffdea=
03a635126c76b3c0"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} +=3D "python3-six python3-ctypes"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


