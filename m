Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E072B7ED17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 07:38:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,440,1559491200"; d="scan'208";a="74438709"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 15:38:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 749B24CE032B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:38:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 28 Aug 2019 15:38:43 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Aug 2019 16:38:27 +0900
Message-ID: <20190828073827.8930-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 749B24CE032B.A18A8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytest: upgrade 3.4.2 -> 5.1.1
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
X-List-Received-Date: Wed, 28 Aug 2019 07:38:45 -0000
Content-Type: text/plain

Refresh patch: 0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch

Remove patch: pytest_version_fix.patch since this is not used.

License update: Copyright year updated to 2019

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pytest.inc |  8 +--
 ...he-setup_requires-for-setuptools-scm.patch | 36 +++++++------
 .../python-pytest/pytest_version_fix.patch    | 51 -------------------
 ...pytest_3.4.2.bb => python-pytest_5.1.1.bb} |  0
 ...ytest_3.4.2.bb => python3-pytest_5.1.1.bb} |  0
 5 files changed, 24 insertions(+), 71 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch
 rename meta-python/recipes-devtools/python/{python-pytest_3.4.2.bb => python-pytest_5.1.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.4.2.bb => python3-pytest_5.1.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 4c32dfb04..49ef790f0 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -1,13 +1,13 @@
 SUMMARY = "Simple powerful teting with python"
 HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
 
-SRC_URI[md5sum] = "1b83a25d45fad893f430fc5031653c56"
-SRC_URI[sha256sum] = "117bad36c1a787e1a8a659df35de53ba05f9f3398fb9e4ac17e80ad5903eb8c5"
+SRC_URI[md5sum] = "662313b4f539f5b66d2fb77791458e82"
+SRC_URI[sha256sum] = "c3d5020755f70c82eceda3feaf556af9a341334414a8eca521a18f463bcead88"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
-                   file://pytest_version_fix.patch "
+                   "
 
 inherit update-alternatives
 
diff --git a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
index 06dfcdfc6..c29fb12de 100644
--- a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
+++ b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
@@ -1,7 +1,7 @@
-From 24a901fd17926e8e05be4ed2e01b0113a2e3a852 Mon Sep 17 00:00:00 2001
-From: Derek Straka <derek@asterius.io>
-Date: Tue, 19 Dec 2017 11:36:39 -0500
-Subject: [PATCH] [PATCH 1/1] setup.py: remove the setup_requires for
+From ff784f4803ab33f5e3389e40d038d52d1e211843 Mon Sep 17 00:00:00 2001
+From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
+Date: Wed, 28 Aug 2019 16:12:27 +0900
+Subject: [PATCH] [PATCH] setup.py: remove the setup_requires for
  setuptools-scm
 
 The setup_requires argument forces the download of the egg file for setuptools-scm
@@ -12,21 +12,25 @@ file and in the release tarball it is already correctly created
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Derek Straka <derek@asterius.io>
+
+Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
 ---
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 3eb38ef..1163202 100644
+index adbafb5..75fdd09 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -82,7 +82,6 @@ def main():
-         keywords="test unittest",
-         cmdclass={'test': PyTest},
-         # the following should be enabled for release
--        setup_requires=['setuptools-scm'],
-         python_requires='>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*',
-         install_requires=install_requires,
-         extras_require=extras_require,
+@@ -19,7 +19,7 @@ INSTALL_REQUIRES = [
+ def main():
+     setup(
+         use_scm_version={"write_to": "src/_pytest/_version.py"},
+-        setup_requires=["setuptools-scm", "setuptools>=40.0"],
++        setup_requires=["setuptools>=40.0"],
+         package_dir={"": "src"},
+         extras_require={
+             "testing": [
 -- 
-2.7.4
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch
deleted file mode 100644
index b373d93e8..000000000
--- a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Upstream-Status: Inappropriate (OE specific) 
-
-python-pytest: remove fetch during do_compile phase
-commit: c974fbf9ebf185552ab65301e07af44f36517abf 
-
-introduced an issue by making the version 0.0.0
-this fixes that
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: pytest-3.2.2/setup.py
-===================================================================
---- pytest-3.2.2.orig/setup.py
-+++ pytest-3.2.2/setup.py
-@@ -1,5 +1,6 @@
- import os
- import sys
-+import re
- import setuptools
- import pkg_resources
- from setuptools import setup, Command
-@@ -22,6 +23,18 @@ classifiers = [
- with open('README.rst') as fd:
-     long_description = fd.read()
- 
-+def read(*names, **kwargs):
-+    with open(os.path.join( *names), 'r') as fp:
-+        return fp.read()
-+
-+def find_version(*file_paths):
-+    version_file = read(*file_paths)
-+    version_match = re.search(r"^version = ['\']([^'\"]*)['\']",
-+                              version_file, re.M)
-+
-+    if version_match:
-+        return version_match.group(1)
-+    raise RuntimeError("Unable to find version string.")
- 
- def get_environment_marker_support_level():
-     """
-@@ -59,9 +72,7 @@ def main():
-         name='pytest',
-         description='pytest: simple powerful testing with Python',
-         long_description=long_description,
--        use_scm_version={
--            'write_to': '_pytest/_version.py',
--        },
-+	version=find_version("_pytest", "_version.py"),
-         url='http://pytest.org',
-         license='MIT license',
-         platforms=['unix', 'linux', 'osx', 'cygwin', 'win32'],
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb b/meta-python/recipes-devtools/python/python-pytest_5.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
rename to meta-python/recipes-devtools/python/python-pytest_5.1.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb b/meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb
-- 
2.17.1




