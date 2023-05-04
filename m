Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6047AC77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 15:22:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52697.1683213776038666182
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 08:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8C181FB;
	Thu,  4 May 2023 08:23:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 265413F5A1;
	Thu,  4 May 2023 08:22:55 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] python3-ninja: simplify recipe
Date: Thu,  4 May 2023 16:22:53 +0100
Message-Id: <20230504152253.3105561-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 15:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102311

From: Ross Burton <ross.burton@arm.com>

Delete more code from __init__.py as we'll never be running from inside
a build tree.

Replace the use of skbuild.setup() with setuptools.setup(): the same
Python module is built and the only value-add is the potential build of
ninja, which we don't want and delete anyway.

This means we can remove most of the DEPENDS and RDEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-ninja/no-scikit-build.patch       | 31 +++++++++++++++
 .../python3-ninja/run-ninja-from-path.patch   | 39 +++++++++++++++++--
 .../python/python3-ninja_1.11.1.bb            | 20 ++--------
 3 files changed, 70 insertions(+), 20 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-ninja/no-=
scikit-build.patch

diff --git a/meta-python/recipes-devtools/python/python3-ninja/no-scikit-=
build.patch b/meta-python/recipes-devtools/python/python3-ninja/no-scikit=
-build.patch
new file mode 100644
index 0000000000..276fb50172
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.p=
atch
@@ -0,0 +1,31 @@
+We don't need to build ninja so there's no need to use scikit-build,
+as we just need the python module with it's one ninja() function.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/pyproject.toml b/pyproject.toml
+index b895c20..577b642 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,7 +1,6 @@
+ [build-system]
+ requires =3D [
+     "setuptools>=3D42",
+-    "scikit-build>=3D0.12",
+ ]
+ build-backend =3D "setuptools.build_meta"
+=20
+diff --git a/setup.py b/setup.py
+index dbe1fbc..3259754 100755
+--- a/setup.py
++++ b/setup.py
+@@ -5,7 +5,7 @@ import os
+ import sys
+ from distutils.text_file import TextFile
+=20
+-from skbuild import setup
++from setuptools import setup
+=20
+ # Add current folder to path
+ # This is required to import versioneer in an isolated pip build
diff --git a/meta-python/recipes-devtools/python/python3-ninja/run-ninja-=
from-path.patch b/meta-python/recipes-devtools/python/python3-ninja/run-n=
inja-from-path.patch
index 26bd037373..0068efcc3a 100644
--- a/meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-pa=
th.patch
+++ b/meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-pa=
th.patch
@@ -1,7 +1,40 @@
---- ninja-1.11.1/src/ninja/__init__.py.old	2022-11-05 09:49:23.000000000=
 +0100
-+++ ninja-1.11.1/src/ninja/__init__.py	2023-03-10 09:45:13.452082888 +01=
00
-@@ -44,7 +44,7 @@
+There's no need to hunt around source or install trees when we're just r=
unning ninja
+from PATH.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/src/ninja/__init__.py b/src/ninja/__init__.py
+index f83767e..31bb926 100644
+--- a/src/ninja/__init__.py
++++ b/src/ninja/__init__.py
+@@ -19,32 +19,9 @@ except ImportError:
+             os.path.dirname(__file__), '../../Ninja-src/misc')))
+     from ninja_syntax import Writer, escape, expand  # noqa: F401
 =20
+-DATA =3D os.path.join(os.path.dirname(__file__), 'data')
+-
+-# Support running tests from the source tree
+-if not os.path.exists(DATA):
+-    from skbuild.constants import CMAKE_INSTALL_DIR as SKBUILD_CMAKE_IN=
STALL_DIR
+-    from skbuild.constants import set_skbuild_plat_name
+-
+-    if platform.system().lower() =3D=3D "darwin":
+-        # Since building the project specifying --plat-name or CMAKE_OS=
X_* variables
+-        # leads to different SKBUILD_DIR, the code below attempt to gue=
ss the most
+-        # likely plat-name.
+-        _skbuild_dirs =3D os.listdir(os.path.join(os.path.dirname(__fil=
e__), '..', '..', '_skbuild'))
+-        if _skbuild_dirs:
+-            _likely_plat_name =3D '-'.join(_skbuild_dirs[0].split('-')[=
:3])
+-            set_skbuild_plat_name(_likely_plat_name)
+-
+-    _data =3D os.path.abspath(os.path.join(
+-        os.path.dirname(__file__), '..', '..', SKBUILD_CMAKE_INSTALL_DI=
R(), 'src/ninja/data'))
+-    if os.path.exists(_data):
+-        DATA =3D _data
+-
+-BIN_DIR =3D os.path.join(DATA, 'bin')
+-
 =20
  def _program(name, args):
 -    return subprocess.call([os.path.join(BIN_DIR, name)] + args, close_=
fds=3DFalse)
diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb =
b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
index 635fd076a5..47a70aa38a 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
@@ -2,33 +2,19 @@ SUMMARY =3D "Ninja is a small build system with a focus=
 on speed"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE_Apache_20;md5=3D19cbd64715b51267a47=
bf3750cc6a8a5"
=20
-DEPENDS =3D "ninja-native cmake-native python3-scikit-build-native"
-
 PYPI_PACKAGE =3D "ninja"
 PYPI_ARCHIVE_NAME_PREFIX =3D "pypi-"
=20
 inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] =3D "c833a47d39b2d1eee3f9ca886fa1581efd5be6068b82734a=
c229961ee8748f90"
=20
-SRC_URI +=3D " \
-	file://CMakeLists.txt \
-	file://run-ninja-from-path.patch \
-"
-
-addtask do_patchbuild after do_patch before do_configure
-
-do_patchbuild () {
-	rm -f ${S}/CMakeLists.txt
-	cp ${WORKDIR}/CMakeLists.txt ${S}/
-}
+SRC_URI +=3D "file://no-scikit-build.patch \
+            file://run-ninja-from-path.patch"
=20
 do_install:append () {
 	rm -rf ${D}${bindir}
 }
=20
-RDEPENDS:${PN} =3D " \
-	ninja \
-	python3-scikit-build \
-"
+RDEPENDS:${PN} =3D "ninja"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


