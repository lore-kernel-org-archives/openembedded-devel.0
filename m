Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3903C41513
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 08:49:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21327.1719391783705651139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 01:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA84C339
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 01:50:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 931FF3F6A8
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 01:49:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libabigail: add recipe for the ABI Generic Analysis and Instrumentation Library
Date: Wed, 26 Jun 2024 09:49:16 +0100
Message-Id: <20240626084916.2791454-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 08:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111085

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/libabigail/libabigail_2.5.bb  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb

diff --git a/meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb b/meta=
-oe/recipes-devtools/libabigail/libabigail_2.5.bb
new file mode 100644
index 0000000000..26161c43b8
--- /dev/null
+++ b/meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "The ABI Generic Analysis and Instrumentation Library"
+HOMEPAGE =3D "https://sourceware.org/libabigail/"
+
+LICENSE =3D "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D0bcd48c3bdfef0c9d9fd17726=
e4b7dab"
+
+SRC_URI =3D "http://mirrors.kernel.org/sourceware/${BPN}/${BP}.tar.xz"
+SRC_URI[sha256sum] =3D "7cfc4e9b00ae38d87fb0c63beabb32b9cbf9ce410e52ceeb=
5ad5b3c5beb111f3"
+
+DEPENDS =3D "elfutils libxml2"
+
+inherit autotools pkgconfig lib_package
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


