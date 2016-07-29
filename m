Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C56160853
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 09:03:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6T93G6v029902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 02:03:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 29 Jul 2016 02:03:15 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jul 2016 17:00:08 +0800
Message-ID: <1469782808-25456-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-mccabe: Remove unnecessary setup_requires pytest-runner
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
X-List-Received-Date: Fri, 29 Jul 2016 09:03:16 -0000
Content-Type: text/plain

* Remove setup_requires pytest-runner as the
  setup_requires pytest-runner actually is not
  used for pytest which only in do_compile phase
  via setup.py build

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...be-remove-unnecessary-setup_requires-pyte.patch | 33 ++++++++++++++++++++++
 .../recipes-devtools/python/python-mccabe_0.4.0.bb |  7 +++--
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-mccabe/0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch

diff --git a/meta-python/recipes-devtools/python/python-mccabe/0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch b/meta-python/recipes-devtools/python/python-mccabe/0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch
new file mode 100644
index 0000000..941bed3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-mccabe/0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch
@@ -0,0 +1,33 @@
+From 3484bdfa7adbaebcf8bb8e7d4820f64b12717932 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 29 Jul 2016 15:37:18 +0800
+Subject: [PATCH] python-mccabe: remove unnecessary setup_requires
+ pytest-runner
+
+* Remove setup_requires pytest-runner as the
+  setup_requires pytest-runner actually is not
+  used for pytest which only in do_compile phase
+  via setup.py build
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index e59903d..bf2aaba 100644
+--- a/setup.py
++++ b/setup.py
+@@ -33,7 +33,6 @@ setup(
+     license='Expat license',
+     py_modules=['mccabe'],
+     zip_safe=False,
+-    setup_requires=['pytest-runner'],
+     tests_require=['pytest'],
+     entry_points={
+         'flake8.extension': [
+-- 
+2.8.1
+
diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
index ba966eb..a86d158 100644
--- a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
@@ -3,14 +3,15 @@ HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=f8b50fba1711ecac6bcdb6324f85a66d"
 
+SRC_URI += " \
+           file://0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch \
+"
+
 SRC_URI[md5sum] = "8c425db05f310adcd4bb174b991f26f5"
 SRC_URI[sha256sum] = "9a2b12ebd876e77c72e41ebf401cc2e7c5b566649d50105ca49822688642207b"
 
 inherit pypi setuptools
 
-DEPENDS += " \
-    python-pytest-runner"
-
 RDEPENDS_${PN} += " \
     python-prettytable \
     python-cmd2 \
-- 
2.8.1


