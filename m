Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA1B47FBE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 08:52:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0028qipT018773
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 2 Jan 2020 00:52:44 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 2 Jan 2020 00:52:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 2 Jan 2020 00:52:43 -0800
Message-ID: <20200102085243.341-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-astor: fix VERSION file not found
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
X-List-Received-Date: Thu, 02 Jan 2020 08:52:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

...
import astor
  File "/usr/lib/python3.7/site-packages/astor/__init__.py", line 24, in <module>
    with open(os.path.join(ROOT, 'VERSION')) as version_file:
FileNotFoundError: [Errno 2] No such file or directory: '/usr/lib/python3.7/site-packages/astor/VERSION'
...

Place the value in a simple VERSION text file and have both setup.py and the
project code read it. With this approach you must make sure that the VERSION
file is included in all your source and binary distributions (e.g. add include
VERSION to your MANIFEST.in). [1]

[1] https://packaging.python.org/guides/single-sourcing-package-version/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...f3ff7ad8818475b6e107e63aa9a54252d2a9.patch | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch b/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch
index 823699339..6d71be992 100644
--- a/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch
+++ b/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch
@@ -3,14 +3,27 @@ From: Jonathan Ringer <jonringer117@gmail.com>
 Date: Thu, 17 Oct 2019 16:54:16 -0700
 Subject: [PATCH] Fix packaging for setuptools>=41.4
 
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
+ MANIFEST.in       |  1 +
  astor/VERSION     |  1 +
  astor/__init__.py |  5 ++++-
  setup.cfg         |  3 ++-
  setup.py          | 16 +---------------
- 4 files changed, 8 insertions(+), 17 deletions(-)
+ 5 files changed, 9 insertions(+), 17 deletions(-)
  create mode 100644 astor/VERSION
 
+diff --git a/MANIFEST.in b/MANIFEST.in
+index b12a6fe..81e72d5 100644
+--- a/MANIFEST.in
++++ b/MANIFEST.in
+@@ -1,3 +1,4 @@
+ include README.rst AUTHORS LICENSE CHANGES
+ include setuputils.py
++include astor/VERSION
+ recursive-include tests *.py
 diff --git a/astor/VERSION b/astor/VERSION
 new file mode 100644
 index 0000000..a3df0a6
@@ -22,7 +35,7 @@ diff --git a/astor/__init__.py b/astor/__init__.py
 index 3b02983..8dfcdb1 100644
 --- a/astor/__init__.py
 +++ b/astor/__init__.py
-@@ -9,6 +9,7 @@
+@@ -9,6 +9,7 @@ Copyright 2013 (c) Berker Peksag
  
  """
  
@@ -30,7 +43,7 @@ index 3b02983..8dfcdb1 100644
  import warnings
  
  from .code_gen import SourceGenerator, to_source  # NOQA
-@@ -19,7 +20,9 @@
+@@ -19,7 +20,9 @@ from .op_util import get_op_symbol, get_op_precedence  # NOQA
  from .op_util import symbol_data  # NOQA
  from .tree_walk import TreeWalk  # NOQA
  
@@ -85,3 +98,6 @@ index 4a111b5..6068493 100644
  
 -setup(**config['options'])
 +setup()
+-- 
+2.21.0
+
-- 
2.21.0


