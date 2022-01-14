Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D1AC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 16:55:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9837.1642179343071826190
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 965156D
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:55:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D7303F766
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:55:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] sanlock: port to setuptools
Date: Fri, 14 Jan 2022 16:55:39 +0000
Message-Id: <20220114165539.4018978-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 16:55:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94844

Port setup.py to setuptools as distutils is now deprecated.

Also, set S to the top of the git repo and use SETUPTOOLS_SETUP_PATH
to run the correct script, which means paths outside of the Python
module are neater.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../sanlock/sanlock/setuptools.patch          | 18 ++++++++++++++++++
 .../recipes-extended/sanlock/sanlock_3.8.4.bb | 19 ++++++++++---------
 2 files changed, 28 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/setuptools.p=
atch

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch b/=
meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
new file mode 100644
index 0000000000..bc2c68c1c5
--- /dev/null
+++ b/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
@@ -0,0 +1,18 @@
+Switch to setuptools as distutils is deprecated.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/python/setup.py b/python/setup.py
+index b3bfaf1..dfbaf21 100644
+--- a/python/setup.py
++++ b/python/setup.py
+@@ -4,7 +4,7 @@
+ # modify, copy, or redistribute it subject to the terms and conditions
+ # of the GNU General Public License v.2.
+=20
+-from distutils.core import setup, Extension
++from setuptools import setup, Extension
+=20
+ sanlocklib =3D ['sanlock']
+ sanlock =3D Extension(name=3D'sanlock',
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb b/meta-oe/=
recipes-extended/sanlock/sanlock_3.8.4.bb
index 8a9702d869..3c08c4e003 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
@@ -9,31 +9,32 @@ HOMEPAGE =3D "https://pagure.io/sanlock"
 SECTION =3D "utils"
=20
 LICENSE =3D "LGPLv2+ & GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM =3D "file://../README.license;md5=3D60487bf0bf429d6b5aa=
72b6d37a0eb22"
+LIC_FILES_CHKSUM =3D "file://README.license;md5=3D60487bf0bf429d6b5aa72b=
6d37a0eb22"
=20
 PV .=3D "+git${SRCPV}"
=20
 SRC_URI =3D "git://pagure.io/sanlock.git;protocol=3Dhttp;branch=3Dmaster=
 \
-           file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-pre=
ser.patch;patchdir=3D../ \
+           file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-pre=
ser.patch \
+           file://setuptools.patch \
           "
 SRCREV =3D "a181e951376d49a82eef17920c8ebedec80b4823"
=20
-S =3D "${WORKDIR}/git/python"
+S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "libaio util-linux"
=20
-inherit distutils3 useradd
+inherit setuptools3 useradd
=20
-do_configure[noexec] =3D "1"
+SETUPTOOLS_SETUP_PATH =3D "${S}/python"
=20
 do_compile:prepend () {
-    oe_runmake -C ${S}/../wdmd CMD_LDFLAGS=3D"${LDFLAGS}" LIB_LDFLAGS=3D=
"${LDFLAGS}"
-    oe_runmake -C ${S}/../src CMD_LDFLAGS=3D"${LDFLAGS}" LIB_ENTIRE_LDFL=
AGS=3D"${LDFLAGS}" LIB_CLIENT_LDFLAGS=3D"${LDFLAGS}"
+    oe_runmake -C ${S}/wdmd CMD_LDFLAGS=3D"${LDFLAGS}" LIB_LDFLAGS=3D"${=
LDFLAGS}"
+    oe_runmake -C ${S}/src CMD_LDFLAGS=3D"${LDFLAGS}" LIB_ENTIRE_LDFLAGS=
=3D"${LDFLAGS}" LIB_CLIENT_LDFLAGS=3D"${LDFLAGS}"
 }
=20
 do_install:prepend () {
-    oe_runmake -C ${S}/../wdmd DESTDIR=3D${D} LIBDIR=3D${libdir} install
-    oe_runmake -C ${S}/../src DESTDIR=3D${D} LIBDIR=3D${libdir} install
+    oe_runmake -C ${S}/wdmd DESTDIR=3D${D} LIBDIR=3D${libdir} install
+    oe_runmake -C ${S}/src DESTDIR=3D${D} LIBDIR=3D${libdir} install
 }
=20
 SANLOCKGROUP ?=3D "sanlock"
--=20
2.25.1


