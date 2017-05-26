Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 775257822F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 07:37:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4Q7bblH030644
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 26 May 2017 00:37:37 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 26 May 2017 00:37:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 May 2017 03:37:30 -0400
Message-ID: <984d28cf4309eba71fe7950d3b709f8d9e579b93.1495783956.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1495783956.git.hongxu.jia@windriver.com>
References: <cover.1495783956.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/4] python3-pyparted: add a python3 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 May 2017 07:37:38 -0000
Content-Type: text/plain

- Split to a common python-pyparted.inc for python2 and python3

- Tweak 0001-fix-version-float-check.patch for python3 to fix
  do_compile errror
----
| ERROR: python3 setup.py build_ext execution failed.
| Traceback (most recent call last):
|   File "setup.py", line 62, in <module>
|     check_mod_version('libparted', need_libparted_version)
|   File "setup.py", line 55, in check_mod_version
|     match = re.search('([0-9]+\.[0-9]+)', modversion)
|   File "work/core2-64-wrs-linux/python3-pyparted/3.10.7+gitAU
TOINC+69c4a478e4-r0/recipe-sysroot-native/usr/lib/python3.5/re.py",
line 173, in search
|     return _compile(pattern, flags).search(string)
| TypeError: cannot use a string pattern on a bytes-like object
----

The reason is the return of subprocess.check_output is byte in python3,
but string in python2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python-pyparted/python-pyparted.inc            | 21 +++++++++++++++++
 .../python-pyparted/python-pyparted_3.10.7.bb      | 23 ++++---------------
 .../0001-fix-version-float-check.patch             | 26 ++++++++++++++++++++++
 .../python-pyparted/python3-pyparted_3.10.7.bb     | 12 ++++++++++
 4 files changed, 63 insertions(+), 19 deletions(-)
 create mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted.inc
 create mode 100644 meta-python/recipes-extended/python-pyparted/python3-pyparted/0001-fix-version-float-check.patch
 create mode 100644 meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
new file mode 100644
index 0000000..65f8ca1
--- /dev/null
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
+an interface to libparted, the GNU parted library for disk partitioning and \
+filesystem manipulation."
+SUMMARY = "Python bindings for libparted"
+HOMEPAGE = "https://github.com/rhinstaller/pyparted"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+    file://src/_pedmodule.c;startline=10;endline=22;md5=ebcb25dde1ac9c46e986dec79b404e7e \
+"
+DEPENDS += "parted"
+
+# upstream only publishes releases in github archives which are discouraged
+SRCREV = "69c4a478e43d3eff6ae3a0116fa38da06776d5f5"
+SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https \
+           file://0001-fix-version-float-check.patch \
+"
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} += "parted (>= 2.3)"
+RDEPENDS_${PN}_class-native = ""
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
index 8335d08..8a15a89 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
@@ -1,27 +1,12 @@
-DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
-an interface to libparted, the GNU parted library for disk partitioning and \
-filesystem manipulation."
-SUMMARY = "Python bindings for libparted"
-HOMEPAGE = "https://github.com/rhinstaller/pyparted"
-LICENSE = "GPL-2.0+"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-    file://src/_pedmodule.c;startline=10;endline=22;md5=ebcb25dde1ac9c46e986dec79b404e7e \
-"
-DEPENDS += "parted python-re"
+require python-pyparted.inc
 
-PV = "3.10.7+git${SRCPV}"
+DEPENDS += "python-re"
 
-# upstream only publishes releases in github archives which are discouraged
-SRCREV = "69c4a478e43d3eff6ae3a0116fa38da06776d5f5"
-SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https \
-           file://0001-fix-version-float-check.patch \
-"
-S = "${WORKDIR}/git"
+PV = "3.10.7+git${SRCPV}"
 
 inherit distutils
 
-RDEPENDS_${PN} += "python-stringold python-codecs python-math parted (>= 2.3)"
+RDEPENDS_${PN} += "python-stringold python-codecs python-math"
 RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted/0001-fix-version-float-check.patch b/meta-python/recipes-extended/python-pyparted/python3-pyparted/0001-fix-version-float-check.patch
new file mode 100644
index 0000000..14fb0bb
--- /dev/null
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted/0001-fix-version-float-check.patch
@@ -0,0 +1,26 @@
+check_mod_version breaks if module version is of x.y.z form
+use a regex to help cast x.y.z version to a float
+
+Upstream-Status: Pending
+
+Index: git/setup.py
+===================================================================
+--- git.orig/setup.py
++++ git/setup.py
+@@ -25,6 +25,7 @@ import glob
+ import os
+ import platform
+ import sys
++import re
+ from distutils.ccompiler import new_compiler
+ from distutils.errors import CompileError
+ from distutils.errors import LinkError
+@@ -51,6 +52,8 @@ def pkgconfig(*packages, **kwargs):
+ 
+ def check_mod_version(module, version):
+     modversion = subprocess.check_output(["pkg-config", "--modversion", module])
++    match = re.search(b'([0-9]+\.[0-9]+)', modversion)
++    modversion = match.group(0)
+     if not float(modversion) >= float(version):
+         sys.stderr.write("*** Minimum required %s version: %s, found: %s\n" % (module, version, modversion,))
+         sys.exit(1)
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
new file mode 100644
index 0000000..ff72c2a
--- /dev/null
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
@@ -0,0 +1,12 @@
+require python-pyparted.inc
+
+DEPENDS += "python3-re"
+
+PV = "3.10.7+git${SRCPV}"
+
+inherit distutils3
+
+RDEPENDS_${PN} += "python3-stringold python3-codecs python3-math"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


