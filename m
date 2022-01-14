Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F072C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 16:12:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8954.1642176729843556247
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60E636D
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:12:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 097603F766
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:12:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-pyparted: port to setuptools
Date: Fri, 14 Jan 2022 16:12:07 +0000
Message-Id: <20220114161207.4013613-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 16:12:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94841

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python-pyparted/files/setuptools.patch    | 82 +++++++++++++++++++
 .../python3-pyparted_3.11.7.bb                |  4 +-
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-extended/python-pyparted/files/se=
tuptools.patch

diff --git a/meta-python/recipes-extended/python-pyparted/files/setuptool=
s.patch b/meta-python/recipes-extended/python-pyparted/files/setuptools.p=
atch
new file mode 100644
index 0000000000..51fe8c7c56
--- /dev/null
+++ b/meta-python/recipes-extended/python-pyparted/files/setuptools.patch
@@ -0,0 +1,82 @@
+Upstream-Status: Submitted [https://github.com/dcantrell/pyparted/pull/8=
5]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 3f5ca7eb6f57d8bcaa3b333497aba6e53d847450 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 14 Jan 2022 16:06:31 +0000
+Subject: [PATCH] setup.py: port to setuptools
+
+Python 3.10 has deprecated distutils[1], and it will be removed entirely
+in Python 3.12.
+
+As the setuptools API is identical, moving to setuptools is trivial by
+changing the import.
+
+Remove check_mod_version, a version specifier can be passed directly
+to pkg-config.
+
+Remove unused imports.
+
+[1] https://docs.python.org/3/whatsnew/3.10.html#distutils-deprecated
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ setup.py | 29 +++++++++--------------------
+ 1 file changed, 9 insertions(+), 20 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index da71d9c..1e9e367 100644
+--- a/setup.py
++++ b/setup.py
+@@ -25,12 +25,7 @@ import glob
+ import os
+ import platform
+ import sys
+-from distutils.ccompiler import new_compiler
+-from distutils.errors import CompileError
+-from distutils.errors import LinkError
+-from distutils.core import setup
+-from distutils.core import Extension
+-from distutils.version import LooseVersion
++from setuptools import setup, Extension
+=20
+ pyparted_version =3D '3.11.7'
+ python_version =3D sys.version_info
+@@ -45,19 +40,13 @@ if python_version < need_python_version:
+ # http://code.activestate.com/recipes/502261-python-distutils-pkg-confi=
g/
+ def pkgconfig(*packages, **kwargs):
+     flag_map =3D {'-I': 'include_dirs', '-L': 'library_dirs', '-l': 'li=
braries'}
+-    for token in subprocess.check_output(["pkg-config", "--libs", "--cf=
lags"] + list(packages)).decode('utf-8').split():
+-
+-        kwargs.setdefault(flag_map.get(token[:2]), []).append(token[2:]=
)
+-    return kwargs
+-
+-def check_mod_version(module, version):
+-    modversion =3D subprocess.check_output(["pkg-config", "--modversion=
", module]).decode('utf-8').split()[0]
+-    if not LooseVersion(modversion) >=3D LooseVersion(version):
+-        sys.stderr.write("*** Minimum required %s version: %s, found: %=
s\n" % (module, version, modversion,))
+-        sys.exit(1)
+-    return
+-
+-check_mod_version('libparted', need_libparted_version)
++    try:
++        for token in subprocess.check_output(["pkg-config", "--libs", "=
--cflags"] + list(packages),
++                                            universal_newlines=3DTrue).=
split():
++            kwargs.setdefault(flag_map.get(token[:2]), []).append(token=
[2:])
++        return kwargs
++    except subprocess.CalledProcessError as e:
++        sys.exit("Cannot find pkg-config dependencies:\n" + e.output)
+=20
+ # This list is in the format necessary for the define_macros parameter
+ # for an Extension() module definition.  See:
+@@ -77,6 +66,6 @@ setup(name=3D'pyparted',
+       ext_modules=3D[Extension('_ped',
+                              sorted(glob.glob(os.path.join('src', '*.c'=
))),
+                              define_macros=3Dfeatures,
+-                             **pkgconfig('libparted',
++                             **pkgconfig('libparted >=3D %s' % need_lib=
parted_version,
+                                          include_dirs=3D['include']))
+                   ])
+--=20
+2.25.1
+
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparte=
d_3.11.7.bb b/meta-python/recipes-extended/python-pyparted/python3-pypart=
ed_3.11.7.bb
index ef04024aaf..66cd27d447 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.=
7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.=
7.bb
@@ -9,10 +9,12 @@ LIC_FILES_CHKSUM =3D "\
     file://src/_pedmodule.c;beginline=3D10;endline=3D22;md5=3D9e53304db8=
12b80d0939e11bb69dcab2 \
 "
=20
+SRC_URI +=3D "file://setuptools.patch"
+
 SRC_URI[md5sum] =3D "69284f943982f54ded76960c92098a02"
 SRC_URI[sha256sum] =3D "61cde7b096bccd69ddc75c85b17f8baed45c3687d404706d=
91403a319453b903"
=20
-inherit pkgconfig pypi distutils3
+inherit pkgconfig pypi setuptools3
=20
 DEPENDS +=3D "parted"
=20
--=20
2.25.1


