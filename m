Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D687DC5320E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:19:50 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.9229.1724318383756609576
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 22 Aug
 2024 17:19:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 22 Aug 2024 17:19:41 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
	<jaminlin1207@gmail.com>
Subject: [meta-oe][PATCH] drgn: add new recipe
Date: Thu, 22 Aug 2024 17:19:40 +0800
Message-ID: <20240822091940.1512585-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822091940.1512585-1-jamin_lin@aspeedtech.com>
References: <20240822091940.1512585-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 09:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111901

drgn is a debugger with an emphasis on programmability
drgn exposes the types and variables in a program
for easy, expressive scripting in Python.

Drgn depends on:
1. python3
2. elfutils
3. openmp
a. clang toolchain should use libomp(openmp)
   from meta-clang
b. gnu gcc toolchain should use libgomp(gcc-runtime)
   from openembedded-core

The build requires:
1. setuptools
2. automake
3. autoconf
4. libtool
5. pkgconf

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 .../drgn/python3-drgn_0.0.27.bb               | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb b/meta-oe/r=
ecipes-kernel/drgn/python3-drgn_0.0.27.bb
new file mode 100644
index 000000000..10d7c6ffd
--- /dev/null
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb
@@ -0,0 +1,80 @@
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
+DEPENDS:append:toolchain-clang:class-target =3D"\
+    openmp \
+    "
+
+OPENMP_LIB =3D "libgomp"
+OPENMP_LIB:toolchain-clang:class-target =3D "openmp"
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
+    ${OPENMP_LIB} \
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
+OPENMP_LIB_NAME =3D "gomp"
+OPENMP_LIB_NAME:toolchain-clang:class-target =3D "omp"
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
+    --enable-openmp=3D${OPENMP_LIB_NAME} \
+    "
+
+export PYTHON_CPPFLAGS =3D "-I${STAGING_INCDIR}/${PYTHON_DIR}"
+
+inherit python3native pkgconfig setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
+
--=20
2.25.1


