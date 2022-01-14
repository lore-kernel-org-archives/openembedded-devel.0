Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40262C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 11:52:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6113.1642161170465795334
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D575ED1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:52:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8B933F5A1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:52:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] cxxtest: move to setuptools
Date: Fri, 14 Jan 2022 11:52:44 +0000
Message-Id: <20220114115246.3985850-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 11:52:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94827

setup.py has always supported setuptools, so change the inherit now that
distutils is deprecated.

Leave S as the top of the source tree, and set SETUPUTILS_SETUP_PATH
to find the setup.py.

Fix the hashbang in cxxtestgen, which was still pointing at python not
python3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb b/meta-oe/recipe=
s-test/cxxtest/cxxtest_4.4.bb
index b760690652..65b54ed548 100644
--- a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
+++ b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
@@ -2,21 +2,22 @@ DESCRIPTION =3D "CxxTest is a unit testing framework fo=
r C++ that is similar in sp
 HOMEPAGE =3D "http://cxxtest.com/"
 SECTION =3D "devel"
 LICENSE =3D "LGPL-2.0"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/cxxtest-${PV}/COPYING;md5=3De6a6=
00fd5e1d9cbde2d983680233ad02"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De6a600fd5e1d9cbde2d983680233a=
d02"
=20
-SRC_URI =3D "http://downloads.sourceforge.net/project/cxxtest/cxxtest/${=
PV}/cxxtest-${PV}.tar.gz"
+SRC_URI =3D "http://downloads.sourceforge.net/project/cxxtest/cxxtest/${=
PV}/${BP}.tar.gz"
 SRC_URI[md5sum] =3D "c3cc3355e2ac64e34c215f28e44cfcec"
 SRC_URI[sha256sum] =3D "1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b=
007dc7f4895cf7d8"
=20
-S =3D "${WORKDIR}/cxxtest-${PV}/python"
+inherit setuptools3
=20
-inherit distutils3
+SETUPTOOLS_SETUP_PATH =3D "${S}/python"
=20
 do_install:append() {
     install -d ${D}${includedir}
-    cp -a ../cxxtest ${D}${includedir}
+    cp -a ${S}/cxxtest/ ${D}${includedir}
+    # Fix the interpretter as otherwise this points to the build host py=
thon
     sed '1c\
-#!/usr/bin/env python' -i ${D}${bindir}/cxxtestgen
+#!/usr/bin/env python3' -i ${D}${bindir}/cxxtestgen
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


