Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8DF6FF72
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:13:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2188279"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 18:13:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BA8FC401E4CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:12:53 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 18:16:25 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jan 2016 13:12:35 +0300
Message-ID: <1451902358-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: BA8FC401E4CA.A1D4E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][jethro][PATCH 1/4] python-enum34: Error Fix for recipes depend on python-enum34
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
X-List-Received-Date: Mon, 04 Jan 2016 10:13:06 -0000
Content-Type: text/plain

If you bitbake recipes which depends on python-enum34 such as
python-cryptography. And also your network is not very well.
Error will occur as following:
   Download error on https://pypi.python.org/simple/enum34/:
   [Errno -5] No address associated with hostname -- Some packages may not be found!
    Couldn't find index page for 'enum34' (maybe misspelled?)
    No local packages or download links found for enum34
So add do_compile_append() to fix it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python-enum34/0001-setup.py-Bug-Fix.patch      | 31 ++++++++++++++++++++++
 .../recipes-devtools/python/python-enum34_1.0.4.bb | 11 ++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-enum34/0001-setup.py-Bug-Fix.patch

diff --git a/meta-python/recipes-devtools/python/python-enum34/0001-setup.py-Bug-Fix.patch b/meta-python/recipes-devtools/python/python-enum34/0001-setup.py-Bug-Fix.patch
new file mode 100644
index 0000000..2cffee7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-enum34/0001-setup.py-Bug-Fix.patch
@@ -0,0 +1,31 @@
+From bfb7ac12ea7b6e821487fdf86a11c95cfbaf9a57 Mon Sep 17 00:00:00 2001
+From: Li Xin <lixin.fnst@cn.fujitsu.com>
+Date: Thu, 17 Dec 2015 17:20:29 +0900
+Subject: [PATCH] setup.py: Bug Fix
+
+|   warnings.warn(msg)
+| usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
+|    or: setup.py --help [cmd1 cmd2 ...]
+|    or: setup.py --help-commands
+|    or: setup.py cmd --help
+|
+| error: invalid command 'bdist_egg'
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ setup.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setup.py b/setup.py
+index ecb4944..88d78c0 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,4 +1,5 @@
+ import os
++import setuptools
+ import sys
+ from distutils.core import setup
+ 
+-- 
+1.8.4.2
+
diff --git a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
index 2ef5df1..1512845 100644
--- a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
@@ -6,3 +6,14 @@ SRC_URI[md5sum] = "ac80f432ac9373e7d162834b264034b6"
 SRC_URI[sha256sum] = "d3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447"
 
 inherit pypi
+
+SRC_URI += "file://0001-setup.py-Bug-Fix.patch"
+
+do_compile_append() {
+    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
+    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
+}
+
+do_install_append() {
+    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
+}
-- 
1.8.4.2




