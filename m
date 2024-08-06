Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A28C52D71
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:39:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11938.1722962365732061010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E9BFFEC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C3DE3F766
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python 1/7] python3-importlib-metadata: add from openembedded-core
Date: Tue,  6 Aug 2024 17:39:12 +0100
Message-Id: <20240806163918.2186435-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 16:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111586

This recipe is being removed from oe-core, so add to meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-importlib-metadata_8.2.0.bb       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-importlib=
-metadata_8.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metada=
ta_8.2.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metad=
ata_8.2.0.bb
new file mode 100644
index 0000000000..3e1c7a7d6b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.2.=
0.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "Read metadata from Python packages"
+HOMEPAGE =3D "https://pypi.org/project/importlib-metadata/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE =3D "importlib_metadata"
+UPSTREAM_CHECK_REGEX =3D "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
+
+SRC_URI[sha256sum] =3D "72e8d4399996132204f9a16dcc751af254a48f8d1b20b9ff=
0f98d4a8f901e73d"
+
+S =3D "${WORKDIR}/importlib_metadata-${PV}"
+
+DEPENDS +=3D "python3-setuptools-scm-native"
+RDEPENDS:${PN} +=3D "python3-zipp"
+RDEPENDS:${PN}:append:class-target =3D " python3-misc"
+RDEPENDS:${PN}:append:class-nativesdk =3D " python3-misc"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


