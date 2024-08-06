Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031A1C52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:39:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12000.1722962368726975336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB5551063
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D18C93F766
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python 6/7] python3-toml: add from openembedded-core
Date: Tue,  6 Aug 2024 17:39:17 +0100
Message-Id: <20240806163918.2186435-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163918.2186435-1-ross.burton@arm.com>
References: <20240806163918.2186435-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 16:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111591

This recipe is being removed from oe-core, so add to meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-toml_0.10.2.bb                 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-toml_0.10=
.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb b=
/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
new file mode 100644
index 0000000000..649464b961
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Python Library for Tom's Obvious, Minimal Language"
+HOMEPAGE =3D "https://github.com/uiri/toml"
+LICENSE =3D "MIT"
+SECTION =3D "devel/python"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D16c77b2b1050d2f03cb9c2ed0edaf=
4f0"
+
+SRC_URI[sha256sum] =3D "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200=
bded2f839ccbe68f"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+RDEPENDS:${PN} +=3D " \
+    python3-misc \
+"
--=20
2.34.1


