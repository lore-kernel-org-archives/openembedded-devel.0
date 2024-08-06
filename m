Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C7FC52D7D
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:39:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11942.1722962369038684365
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83DBFFEC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A2613F766
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python 7/7] python3-tomli: add from openembedded-core
Date: Tue,  6 Aug 2024 17:39:18 +0100
Message-Id: <20240806163918.2186435-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163918.2186435-1-ross.burton@arm.com>
References: <20240806163918.2186435-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 16:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111592

This recipe is being removed from oe-core, so add to meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-tomli_2.0.1.bb              | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tomli_2.0=
.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-tomli_2.0.1.bb b=
/meta-python/recipes-devtools/python/python3-tomli_2.0.1.bb
new file mode 100644
index 0000000000..9401ed897f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tomli_2.0.1.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "A lil' TOML parser"
+DESCRIPTION =3D "Tomli is a Python library for parsing TOML. Tomli is fu=
lly \
+compatible with TOML v1.0.0."
+HOMEPAGE =3D "https://github.com/hukkin/tomli"
+BUGTRACKER =3D "https://github.com/hukkin/tomli/issues"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daaaaf0879d17df0110d1aa8c8c9f4=
6f5"
+
+inherit pypi python_flit_core
+
+SRC_URI[sha256sum] =3D "de526c12914f0c550d15924c62d72abc48d6fe7364aa8732=
8337a31007fe8a4f"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+RDEPENDS:${PN} +=3D " \
+    python3-datetime \
+    python3-stringold \
+"
--=20
2.34.1


