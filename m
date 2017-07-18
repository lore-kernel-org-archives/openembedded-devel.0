Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3C577F90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6I69WOI018851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 17 Jul 2017 23:09:32 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:11 -0400
Message-ID: <ba342578adfeefd886664136f09464871e9a3190.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500357921.git.hongxu.jia@windriver.com>
References: <cover.1500357921.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] python3-pid: add recipe 2.1.1
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:31 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-remove-requirement-of-nose.patch          | 29 ++++++++++++++++++++++
 .../recipes-devtools/python/python3-pid_2.1.1.bb   | 14 +++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pid/0001-remove-requirement-of-nose.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pid_2.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pid/0001-remove-requirement-of-nose.patch b/meta-python/recipes-devtools/python/python3-pid/0001-remove-requirement-of-nose.patch
new file mode 100644
index 0000000..3beef07
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pid/0001-remove-requirement-of-nose.patch
@@ -0,0 +1,29 @@
+From 04d04a8fa1ef3d8dbdaebbaac9ae936e1c8234c1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 28 Jun 2017 21:17:43 -0400
+Subject: [PATCH] remove requirement of nose
+
+The nose extends unittest to make testing easier.
+Do not need the test suite, so remove requirement of nose.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setup.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 3f7c7cb..c42a546 100644
+--- a/setup.py
++++ b/setup.py
+@@ -53,6 +53,4 @@ setup(
+     keywords='pid pidfile context manager decorator',
+     packages=["pid"],
+     install_requires=[],
+-    test_suite='nose.collector',
+-    setup_requires=['nose>=1.0'],
+ )
+-- 
+2.8.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pid_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pid_2.1.1.bb
new file mode 100644
index 0000000..c88d9a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pid_2.1.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Pidfile featuring stale detection and file-locking, can also \
+be used as context-manager or decorator"
+HOMEPAGE = "https://github.com/trbs/pid/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=83d53cbd3105063f20305bc313464e29"
+
+SRC_URI[md5sum] = "9634b1e3d545544a9d496e25e4530d14"
+SRC_URI[sha256sum] = "b443169d3dc21397695b4a82016fadb4cfdb0ed8b2ddb4aaa428e1701bb34e1f"
+
+inherit pypi setuptools3
+
+SRC_URI += " \
+    file://0001-remove-requirement-of-nose.patch \
+"
-- 
2.8.1


