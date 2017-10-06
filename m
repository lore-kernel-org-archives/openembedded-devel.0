Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id E82C678242
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Oct 2017 16:10:14 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id b11so10149527pgn.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Oct 2017 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Q0MNMf3gO0L8PKzRMW8DLyZWk5tuZzCz/TxNEVjRLVs=;
	b=JJxOf9sp39920zMKfCtkfV2Vcm10BhJ/2pTxOiqd5EgYeXLbQBF3hM5f0bxx3tXozV
	iQ1yLvH1bSO7Ylp95zbUnAVQ6YiVQ/ozj4mtxufwuLKKFkloW1kD5JLWu4k9IgIesYt6
	k7jZzqaZW4X9gUlAHlhIcqx98z6sEDuqfS9e2R/SFm2GYMB3hFwulh3hwokCODS4EHMu
	DfNXRONF8rHGpE4hbWG+bL/yIBO/Ko4tZrGLxrUQus+kowIBm8fib50HoJ/OONPFRTb+
	4lWKtu2xIfgCwzeIeIu53glvk1mVUdWj4Idq+bFRJAZbjGIqvJR4Dxir6NxXH68aQ2r8
	UmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q0MNMf3gO0L8PKzRMW8DLyZWk5tuZzCz/TxNEVjRLVs=;
	b=P96P3J0D6lfo5rb/xaQRkJzPhGHhiaiFgiddWvgSzkbxsGVGVI/XZtfTD9ovT2LMbg
	Ffwho2O4JEPz0fdhAn9kCfYW6gqDHeFejgXC1b9eElEwmCBQARMQ47F4sxr4eohszu4Z
	qONLW0YnlfumM8ljVI78yRDJd7itkS0BFyK+wVqxXIGdNBPKz5F9M7jRUND9bxfpwEG3
	drFrB45akbclv12vIAbB0EylePDY3utlRsXn77QtSpxjPka9SaFmcZOrDLBFmFNt58ns
	+8p+vmQD1e+8aUPTItKFdS00jCeQcD0OJ3Dq0JWsPnzYcZghCKhw1/pTBalHSN1jBIwM
	YLQg==
X-Gm-Message-State: AMCzsaUkvW77Jgv9VRSVWdu1tfqbGbY3qR4R35cMMTxaSmiPVCc5Zyd1
	SAm+0lqjGYwU799QPxYFTxJbag==
X-Google-Smtp-Source: AOwi7QCzsfvbxzTJzGW+/A7HC/l04wwPGuNlm+dKO9RnYptUqDd9SwmR+qp7DxkNCHbro54YGlevoQ==
X-Received: by 10.84.234.140 with SMTP id n12mr2429031plk.209.1507306215897;
	Fri, 06 Oct 2017 09:10:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:2592:db33:fab5:1bd8])
	by smtp.gmail.com with ESMTPSA id 5sm4042404pfe.128.2017.10.06.09.10.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Oct 2017 09:10:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri,  6 Oct 2017 09:10:13 -0700
Message-Id: <1507306214-16106-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-pytest: fix egg version of package
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
X-List-Received-Date: Fri, 06 Oct 2017 16:10:15 -0000

commit "python-pytest: remove fetch during do_compile phase"
removed the ability of the package to version it self correctly. The version ended up as
0.0.0 which causes runtime version checking.

This fixed that issues.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python-pytest.inc      |  3 +-
 .../python/python-pytest/pytest_version_fix.patch  | 51 ++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index ae1d81d..6140250 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 SRC_URI[md5sum] = "401c005bd57f71e63ba015ab086fe67d"
 SRC_URI[sha256sum] = "f46e49e0340a532764991c498244a60e3a37d7424a532b3ff1a6a7653f1a403a"
 
-SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch"
+SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
+                   file://pytest_version_fix.patch "
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-argparse \
diff --git a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch
new file mode 100644
index 0000000..908f862
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.patch
@@ -0,0 +1,51 @@
+Upstream-Status: Inappropriate (OE specific) 
+
+python-pytest: remove fetch during do_compile phase
+commit: c974fbf9ebf185552ab65301e07af44f36517abf 
+
+introduced an issue by making the version 0.0.0
+this fixes that
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: pytest-3.2.2/setup.py
+===================================================================
+--- pytest-3.2.2.orig/setup.py
++++ pytest-3.2.2/setup.py
+@@ -1,5 +1,6 @@
+ import os
+ import sys
++import re
+ import setuptools
+ import pkg_resources
+ from setuptools import setup, Command
+@@ -22,6 +23,18 @@ classifiers = [
+ with open('README.rst') as fd:
+     long_description = fd.read()
+ 
++def read(*names, **kwargs):
++    with open(os.path.join( *names), 'r') as fp:
++        return fp.read()
++
++def find_version(*file_paths):
++    version_file = read(*file_paths)
++    version_match = re.search(r"^version = ['\']([^'\"]*)['\']",
++                              version_file, re.M)
++
++    if version_match:
++        return version_match.group(1)
++    raise RuntimeError("Unable to find version string.")
+ 
+ def has_environment_marker_support():
+     """
+@@ -59,9 +72,7 @@ def main():
+         name='pytest',
+         description='pytest: simple powerful testing with Python',
+         long_description=long_description,
+-        use_scm_version={
+-            'write_to': '_pytest/_version.py',
+-        },
++	version=find_version("_pytest", "_version.py"),
+         url='http://pytest.org',
+         license='MIT license',
+         platforms=['unix', 'linux', 'osx', 'cygwin', 'win32'],
-- 
2.7.4


