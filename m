Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D28A47FCE1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 07:41:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAQ7fldi029505
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 23:41:47 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 25 Nov 2019 23:41:47 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Nov 2019 15:41:46 +0800
Message-ID: <20191126074146.7184-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-python][PATCH V2] python3-pid: upgrade to 2.2.5
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
X-List-Received-Date: Tue, 26 Nov 2019 07:41:47 -0000
Content-Type: text/plain

0001-remove-requirement-of-nose.patch is removed as new version
has also removed such dependency.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-remove-requirement-of-nose.patch     | 29 -------------------
 ...hon3-pid_2.2.0.bb => python3-pid_2.2.5.bb} |  8 ++---
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pid/0001-remove-requirement-of-nose.patch
 rename meta-python/recipes-devtools/python/{python3-pid_2.2.0.bb => python3-pid_2.2.5.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-pid/0001-remove-requirement-of-nose.patch b/meta-python/recipes-devtools/python/python3-pid/0001-remove-requirement-of-nose.patch
deleted file mode 100644
index 3beef0700..000000000
--- a/meta-python/recipes-devtools/python/python3-pid/0001-remove-requirement-of-nose.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 04d04a8fa1ef3d8dbdaebbaac9ae936e1c8234c1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 28 Jun 2017 21:17:43 -0400
-Subject: [PATCH] remove requirement of nose
-
-The nose extends unittest to make testing easier.
-Do not need the test suite, so remove requirement of nose.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- setup.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 3f7c7cb..c42a546 100644
---- a/setup.py
-+++ b/setup.py
-@@ -53,6 +53,4 @@ setup(
-     keywords='pid pidfile context manager decorator',
-     packages=["pid"],
-     install_requires=[],
--    test_suite='nose.collector',
--    setup_requires=['nose>=1.0'],
- )
--- 
-2.8.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pid_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-pid_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
index e43831989..b8dd0d747 100644
--- a/meta-python/recipes-devtools/python/python3-pid_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
@@ -4,11 +4,7 @@ HOMEPAGE = "https://github.com/trbs/pid/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=83d53cbd3105063f20305bc313464e29"
 
-SRC_URI[md5sum] = "04d30308013d16aa882b3806feda8ab2"
-SRC_URI[sha256sum] = "d8bb2ceec21a4ae84be6e9d320db1f56934b30e676e31c6f098ca7218b3d67d4"
+SRC_URI[md5sum] = "ad352ee1dc28b9746a15451c0c53e9d7"
+SRC_URI[sha256sum] = "96eb7dba326b88f5164bc1afdc986c7793e0d32d7f62366256a3903c7b0614ef"
 
 inherit pypi setuptools3
-
-SRC_URI += " \
-    file://0001-remove-requirement-of-nose.patch \
-"
-- 
2.17.1


