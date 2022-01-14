Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB3AC4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 11:52:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6115.1642161170963899451
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4598101E
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:52:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D4913F5A1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:52:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] iotop: move to the C port of iotop
Date: Fri, 14 Jan 2022 11:52:45 +0000
Message-Id: <20220114115246.3985850-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114115246.3985850-1-ross.burton@arm.com>
References: <20220114115246.3985850-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 11:52:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94828

The Python iotop implentation hasn't had a release since 2013[1], and
there is a C port which is actively maintained and will have a lower
impact on the system being monitored.

[1] https://repo.or.cz/iotop.git/tag/10c60fedf5051421f4e62b89e2e51e7cc669=
ce34

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/iotop/iotop_0.6.bb  | 29 --------------------
 meta-oe/recipes-extended/iotop/iotop_1.20.bb | 17 ++++++++++++
 2 files changed, 17 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/iotop/iotop_0.6.bb
 create mode 100644 meta-oe/recipes-extended/iotop/iotop_1.20.bb

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.6.bb b/meta-oe/recipe=
s-extended/iotop/iotop_0.6.bb
deleted file mode 100644
index 97958dd4a2..0000000000
--- a/meta-oe/recipes-extended/iotop/iotop_0.6.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY =3D "Simple top-like I/O monitor"
-DESCRIPTION =3D "iotop does for I/O usage what top(1) does for CPU usage=
. \
-    It watches I/O usage information output by the Linux kernel and disp=
lays \
-    a table of current I/O usage by processes on the system."
-HOMEPAGE =3D "http://guichaz.free.fr/iotop/"
-
-LICENSE =3D "GPLv2+"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396febcb659c36b4953313=
5d4"
-
-PV .=3D "+git${SRCPV}"
-
-SRCREV =3D "1bfb3bc70febb1ffb95146b6dcd65257228099a3"
-SRC_URI =3D "git://repo.or.cz/iotop.git;branch=3Dmaster"
-
-S =3D "${WORKDIR}/git"
-
-UPSTREAM_CHECK_URI =3D "http://repo.or.cz/iotop.git/tags"
-UPSTREAM_CHECK_REGEX =3D "iotop-(?P<pver>\d+(\.\d+)+)"
-
-inherit distutils3
-
-do_install:append() {
-    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.pyo || true
-    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true
-}
-
-RDEPENDS:${PN} =3D "python3-curses \
-                  python3-codecs python3-ctypes python3-pprint \
-                  python3-shell python3-core"
diff --git a/meta-oe/recipes-extended/iotop/iotop_1.20.bb b/meta-oe/recip=
es-extended/iotop/iotop_1.20.bb
new file mode 100644
index 0000000000..17c567095b
--- /dev/null
+++ b/meta-oe/recipes-extended/iotop/iotop_1.20.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "A top utility for I/O"
+LICENSE =3D "GPLv2+"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D48e7be78bd2671d08c9c3bad71f1c=
faa"
+
+DEPENDS =3D "ncurses"
+
+SRC_URI =3D "https://github.com/Tomas-M/iotop/releases/download/v1.20/io=
top-1.20.tar.xz"
+SRC_URI[sha256sum] =3D "e0227dd4b71ce3ffe50225b85cf9abb38a99c1d2dff69e3f=
1db7d059d7490d51"
+UPSTREAM_CHECK_URI =3D "https://github.com/Tomas-M/iotop/releases"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE =3D "V=3D1 STRIP=3Dtrue"
+
+do_install() {
+    oe_runmake install DESTDIR=3D${D}
+}
--=20
2.25.1


