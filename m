Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6E4C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 05:40:57 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.11991.1724132446827711496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 22:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Aug
 2024 13:40:44 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 20 Aug 2024 13:40:44 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
	<jaminlin1207@gmail.com>
Subject: [meta-oe][PATCH] meta-oe:drgn: add new recipe
Date: Tue, 20 Aug 2024 13:40:44 +0800
Message-ID: <20240820054044.1538795-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820054044.1538795-1-jamin_lin@aspeedtech.com>
References: <20240820054044.1538795-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 05:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111862

drgn is a debugger with an emphasis on programmability
drgn exposes the types and variables in a program
for easy, expressive scripting in Python.

Drgn depends on:
1. python3
2. elfutils

The build requires:
1. setuptools
2. automake
3. autoconf
4. libtool
5. pkgconf

Reference:
https://drgn.readthedocs.io/en/latest/installation.html

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 .../drgn/python3-drgn_0.0.27.bb               | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb b/meta-oe/r=
ecipes-kernel/drgn/python3-drgn_0.0.27.bb
new file mode 100644
index 000000000..5c0dbe963
--- /dev/null
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb
@@ -0,0 +1,69 @@
+SUMMARY =3D "drgn (pronounced dragon) is a debugger with an emphasis on  \
+programmability. drgn exposes the types and variables in a program for eas=
y, \
+expressive scripting in Python."
+HOMEPAGE =3D "https://github.com/osandov/drgn"
+LICENSE =3D " LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c83d30e99508d6b790eacdd3abab84=
6"
+
+SRC_URI =3D "git://github.com/osandov/drgn.git;protocol=3Dhttps;branch=3Dm=
ain"
+SRCREV =3D "a8dfc9e31f551d4b3c3d4307fa19ab6b3bfafb1c"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D "\
+    autoconf-native \
+    automake-native \
+    libtool-native \
+    elfutils \
+    "
+
+RDEPENDS:${PN} =3D "\
+    python3-crypt \
+    python3-io \
+    python3-logging \
+    python3-math \
+    python3-pickle \
+    python3-stringold \
+    python3-compression \
+    "
+
+RDEPENDS:${PN}:append:class-target =3D "\
+    libdw \
+    libelf \
+    libgomp \
+    "
+
+RDEPENDS:${PN}:append:class-native =3D "\
+    elfutils-native \
+    "
+
+RDEPENDS:${PN}:append:class-nativesdk =3D "\
+    nativesdk-elfutils \
+    "
+
+export CONFIGURE_FLAGS =3D "\
+    --build=3D${BUILD_SYS}, \
+    --host=3D${HOST_SYS}, \
+    --target=3D${TARGET_SYS}, \
+    --prefix=3D${prefix}, \
+    --exec_prefix=3D${exec_prefix}, \
+    --bindir=3D${bindir}, \
+    --sbindir=3D${sbindir}, \
+    --libexecdir=3D${libexecdir}, \
+    --datadir=3D${datadir}, \
+    --sysconfdir=3D${sysconfdir}, \
+    --sharedstatedir=3D${sharedstatedir}, \
+    --localstatedir=3D${localstatedir}, \
+    --libdir=3D${libdir}, \
+    --includedir=3D${includedir}, \
+    --oldincludedir=3D${includedir}, \
+    --infodir=3D${infodir}, \
+    --mandir=3D${mandir}, \
+    --with-libtool-sysroot=3D${STAGING_DIR_HOST} \
+    "
+
+export PYTHON_CPPFLAGS =3D "-I${STAGING_INCDIR}/${PYTHON_DIR}"
+
+inherit python3native pkgconfig setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


