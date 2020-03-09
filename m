Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF126028D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2020 06:04:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02964Ouj028276
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Mar 2020 23:04:45 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.487.0; Sun, 8 Mar 2020 23:04:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Mar 2020 14:04:28 +0800
Message-ID: <1583733868-37088-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-sqlparse: change shebang to python3
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
X-List-Received-Date: Mon, 09 Mar 2020 06:04:55 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

we have offcially dropped python2, so it is possible
that our code run on python3 only host, so change
shebang to python3 to avoid error like:
python: command not found

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-devtools/python/python-sqlparse.inc    |  2 +
 .../0001-sqlparse-change-shebang-to-python3.patch  | 51 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch

diff --git a/meta-python/recipes-devtools/python/python-sqlparse.inc b/meta-python/recipes-devtools/python/python-sqlparse.inc
index f71f815..14e683d 100644
--- a/meta-python/recipes-devtools/python/python-sqlparse.inc
+++ b/meta-python/recipes-devtools/python/python-sqlparse.inc
@@ -4,6 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
+SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch"
+
 SRC_URI[md5sum] = "2ce34181d6b7b234c9f3c0ecd1ffb93e"
 SRC_URI[sha256sum] = "7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873"
 
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
new file mode 100644
index 0000000..ad6c50f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
@@ -0,0 +1,51 @@
+From 10c9d3341d64d697f678a64ae707f6bda21565bb Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 9 Mar 2020 13:10:37 +0800
+Subject: [PATCH] sqlparse: change shebang to python3
+
+Upstream-Status: Pending
+
+Don't send upstream since upstream still support python2,
+we can only make this change after python2 is offcially
+dropped.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ setup.py             | 2 +-
+ sqlparse/__main__.py | 2 +-
+ sqlparse/cli.py      | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 345d0ce..ce3abc3 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ #
+ # Copyright (C) 2009-2018 the sqlparse authors and contributors
+diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
+index 867d75d..dd0c074 100644
+--- a/sqlparse/__main__.py
++++ b/sqlparse/__main__.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ #
+ # Copyright (C) 2009-2018 the sqlparse authors and contributors
+diff --git a/sqlparse/cli.py b/sqlparse/cli.py
+index 25555a5..8bf050a 100755
+--- a/sqlparse/cli.py
++++ b/sqlparse/cli.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ #
+ # Copyright (C) 2009-2018 the sqlparse authors and contributors
+-- 
+2.7.4
+
-- 
2.7.4


