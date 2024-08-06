Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A62C52D73
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:39:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11998.1722962366828750492
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4297E1063
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 289773F766
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python 3/7] python3-py: add from openembedded-core
Date: Tue,  6 Aug 2024 17:39:14 +0100
Message-Id: <20240806163918.2186435-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163918.2186435-1-ross.burton@arm.com>
References: <20240806163918.2186435-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 16:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111588

This recipe is being removed from oe-core, so add to meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-py_1.11.0.bb   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-py_1.11.0=
.bb

diff --git a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb b/m=
eta-python/recipes-devtools/python/python3-py_1.11.0.bb
new file mode 100644
index 0000000000..31d5a377a7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Library with cross-python path, ini-parsing, io, code, log =
facilities"
+HOMEPAGE =3D "http://py.readthedocs.io/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6bb0320b04a0a503f12f69fea479=
de9"
+
+SRC_URI[sha256sum] =3D "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa=
41e558e6f4a98719"
+
+DEPENDS +=3D "python3-setuptools-scm-native"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+RDEPENDS:${PN} +=3D "python3-netclient"
--=20
2.34.1


