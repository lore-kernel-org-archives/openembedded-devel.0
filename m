Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85509C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:28:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7858.1642170483187736495
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 529C6ED1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:28:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0A9E3F774
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:28:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-dbussy: port to setuptools
Date: Fri, 14 Jan 2022 14:27:59 +0000
Message-Id: <20220114142759.4002513-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 14:28:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94839

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-dbussy/setuptools.patch    | 56 +++++++++++++++++++
 .../python/python3-dbussy_1.3.bb              |  6 +-
 2 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-dbussy/se=
tuptools.patch

diff --git a/meta-python/recipes-devtools/python/python3-dbussy/setuptool=
s.patch b/meta-python/recipes-devtools/python/python3-dbussy/setuptools.p=
atch
new file mode 100644
index 0000000000..870345058a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dbussy/setuptools.patch
@@ -0,0 +1,56 @@
+Port setup.py to setuptools.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/setup.py b/setup.py
+index 4b9411e..da7ee7e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -8,33 +8,9 @@
+ # Written by Lawrence D'Oliveiro <ldo@geek-central.gen.nz>.
+ #-
+=20
+-import sys
+-import distutils.core
+-from distutils.command.build import \
+-    build as std_build
++import setuptools
+=20
+-class my_build(std_build) :
+-    "customization of build to perform additional validation."
+-
+-    def run(self) :
+-        try :
+-            exec \
+-              (
+-                "async def dummy() :\n"
+-                "    pass\n"
+-                "#end dummy\n"
+-              )
+-        except SyntaxError :
+-            sys.stderr.write("This module requires Python 3.5 or later.=
\n")
+-            sys.exit(-1)
+-        #end try
+-        super().run()
+-    #end run
+-
+-#end my_build
+-
+-distutils.core.setup \
+-  (
++setuptools.setup(
+     name =3D "DBussy",
+     version =3D "1.3",
+     description =3D "language bindings for libdbus, for Python 3.5 or l=
ater",
+@@ -43,9 +19,5 @@ distutils.core.setup \
+     author_email =3D "ldo@geek-central.gen.nz",
+     url =3D "https://github.com/ldo/dbussy",
+     license =3D "LGPL v2.1+",
+     py_modules =3D ["dbussy", "ravel"],
+-    cmdclass =3D
+-        {
+-            "build" : my_build,
+-        },
+-  )
++)
diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb b/=
meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
index 061893df3e..0cf9dc8a7d 100644
--- a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
@@ -3,13 +3,14 @@ HOMEPAGE =3D "https://github.com/ldo/dbussy"
 LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742476=
9c7"
=20
-SRC_URI =3D "git://github.com/ldo/dbussy.git;branch=3Dmaster;protocol=3D=
https"
+SRC_URI =3D "git://github.com/ldo/dbussy.git;branch=3Dmaster;protocol=3D=
https \
+           file://setuptools.patch"
=20
 SRCREV =3D "37ede4242b48def73ada46c2747a4c5cae6abf45"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit distutils3
+inherit setuptools3
=20
 RDEPENDS:${PN} +=3D "\
     python3-asyncio \
@@ -19,4 +20,3 @@ RDEPENDS:${PN} +=3D "\
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
--=20
2.25.1


