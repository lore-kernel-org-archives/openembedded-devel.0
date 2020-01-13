Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D56427FCE3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:19:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,429,1571673600"; d="scan'208";a="81744382"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 21:19:09 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A23B04CE1CB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:10:04 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 21:19:11 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 21:19:13 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2020 09:09:37 -0800
Message-ID: <1578935381-39920-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A23B04CE1CB3.A3E6C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-astor: 0.8 -> 0.8.1
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
X-List-Received-Date: Mon, 13 Jan 2020 13:19:13 -0000
Content-Type: text/plain

f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch
Removed since it is included in 0.8.1.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...f3ff7ad8818475b6e107e63aa9a54252d2a9.patch | 103 ------------------
 ...n3-astor_0.8.bb => python3-astor_0.8.1.bb} |   6 +-
 2 files changed, 2 insertions(+), 107 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch
 rename meta-python/recipes-devtools/python/{python3-astor_0.8.bb => python3-astor_0.8.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch b/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch
deleted file mode 100644
index 6d71be992..000000000
--- a/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From f820f3ff7ad8818475b6e107e63aa9a54252d2a9 Mon Sep 17 00:00:00 2001
-From: Jonathan Ringer <jonringer117@gmail.com>
-Date: Thu, 17 Oct 2019 16:54:16 -0700
-Subject: [PATCH] Fix packaging for setuptools>=41.4
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- MANIFEST.in       |  1 +
- astor/VERSION     |  1 +
- astor/__init__.py |  5 ++++-
- setup.cfg         |  3 ++-
- setup.py          | 16 +---------------
- 5 files changed, 9 insertions(+), 17 deletions(-)
- create mode 100644 astor/VERSION
-
-diff --git a/MANIFEST.in b/MANIFEST.in
-index b12a6fe..81e72d5 100644
---- a/MANIFEST.in
-+++ b/MANIFEST.in
-@@ -1,3 +1,4 @@
- include README.rst AUTHORS LICENSE CHANGES
- include setuputils.py
-+include astor/VERSION
- recursive-include tests *.py
-diff --git a/astor/VERSION b/astor/VERSION
-new file mode 100644
-index 0000000..a3df0a6
---- /dev/null
-+++ b/astor/VERSION
-@@ -0,0 +1 @@
-+0.8.0
-diff --git a/astor/__init__.py b/astor/__init__.py
-index 3b02983..8dfcdb1 100644
---- a/astor/__init__.py
-+++ b/astor/__init__.py
-@@ -9,6 +9,7 @@ Copyright 2013 (c) Berker Peksag
- 
- """
- 
-+import os
- import warnings
- 
- from .code_gen import SourceGenerator, to_source  # NOQA
-@@ -19,7 +20,9 @@ from .op_util import get_op_symbol, get_op_precedence  # NOQA
- from .op_util import symbol_data  # NOQA
- from .tree_walk import TreeWalk  # NOQA
- 
--__version__ = '0.8.0'
-+ROOT = os.path.dirname(__file__)
-+with open(os.path.join(ROOT, 'VERSION')) as version_file:
-+    __version__ = version_file.read().strip
- 
- parse_file = code_to_ast.parse_file
- 
-diff --git a/setup.cfg b/setup.cfg
-index 1baf6fc..a43634f 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -2,6 +2,7 @@
- name = astor
- description = Read/rewrite/write Python ASTs
- long_description = file:README.rst
-+version = file: astor/VERSION
- author = Patrick Maupin
- author_email = pmaupin@gmail.com
- platforms = Independent
-@@ -40,7 +41,7 @@ test_suite = nose.collector
- [options.packages.find]
- exclude = tests
- 
--[wheel]
-+[bdist_wheel]
- universal = 1
- 
- [build-system]
-diff --git a/setup.py b/setup.py
-index 4a111b5..6068493 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,17 +1,3 @@
--import os
--import sys
--
- from setuptools import setup
--from setuptools.config import read_configuration
--
--from setuputils import find_version
--
--
--def here(*paths):
--    return os.path.join(os.path.dirname(__file__), *paths)
--
--config = read_configuration(here('setup.cfg'))
--config['metadata']['version'] = find_version(here('astor', '__init__.py'))
--config['options'].update(config['metadata'])
- 
--setup(**config['options'])
-+setup()
--- 
-2.21.0
-
diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-astor_0.8.bb
rename to meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
index 17cc540f0..125a0236e 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
@@ -4,10 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=561205fdabc3ec52cae2d30815b8ade7"
 
-SRC_URI = "git://github.com/berkerpeksag/astor.git \
-           file://f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch \
-          "
-SRCREV ?= "3a7607e31f0c17e747ded5cfe0b582d99f7caecf"
+SRC_URI = "git://github.com/berkerpeksag/astor.git "
+SRCREV ?= "c7553c79f9222e20783fe9bd8a553f932e918072"
 
 inherit setuptools3
 
-- 
2.17.1




