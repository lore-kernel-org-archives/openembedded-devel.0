Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE396762A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 07:15:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8A7F4Vq024145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 00:15:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 10 Sep 2015 00:15:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Sep 2015 15:09:38 +0800
Message-ID: <1441868978-19693-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mysql-python: upgrade to 1.2.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 07:15:07 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

remove the remove-distribute.patch, v1.2.5 has a similar fix

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../mysql/mysql-python/remove-distribute.patch          | 17 -----------------
 .../{mysql-python_1.2.4.bb => mysql-python_1.2.5.bb}    |  8 +++-----
 2 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mysql/mysql-python/remove-distribute.patch
 rename meta-oe/recipes-support/mysql/{mysql-python_1.2.4.bb => mysql-python_1.2.5.bb} (64%)

diff --git a/meta-oe/recipes-support/mysql/mysql-python/remove-distribute.patch b/meta-oe/recipes-support/mysql/mysql-python/remove-distribute.patch
deleted file mode 100644
index 0ce750d..0000000
--- a/meta-oe/recipes-support/mysql/mysql-python/remove-distribute.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Innapropriate
-
-Index: MySQL-python-1.2.4/setup.py
-===================================================================
---- MySQL-python-1.2.4.orig/setup.py
-+++ MySQL-python-1.2.4/setup.py
-@@ -3,8 +3,8 @@
- import os
- import sys
- 
--from distribute_setup import use_setuptools
--use_setuptools()
-+#from distribute_setup import use_setuptools
-+#use_setuptools()
- from setuptools import setup, Extension
- 
- if not hasattr(sys, "hexversion") or sys.hexversion < 0x02040000:
diff --git a/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb b/meta-oe/recipes-support/mysql/mysql-python_1.2.5.bb
similarity index 64%
rename from meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
rename to meta-oe/recipes-support/mysql/mysql-python_1.2.5.bb
index 6fc974e..ac0df4f 100644
--- a/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
+++ b/meta-oe/recipes-support/mysql/mysql-python_1.2.5.bb
@@ -8,11 +8,9 @@ DEPENDS = "mysql5"
 
 SRCNAME = "MySQL-python"
 
-SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip \
-           file://remove-distribute.patch"
-
-SRC_URI[md5sum] = "ddf2386daf10a97af115ffad2ed4a9a0"
-SRC_URI[sha256sum] = "e405f9d6be33923d428acaa4db4f4470427f1d15ea0d2d82a933449ace26bbd9"
+SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip"
+SRC_URI[md5sum] = "654f75b302db6ed8dc5a898c625e030c"
+SRC_URI[sha256sum] = "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e140c74"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


