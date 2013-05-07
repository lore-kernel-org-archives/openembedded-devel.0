Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihai.prica@intel.com>) id 1UZflG-0002tv-RD
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 May 2013 13:08:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 May 2013 03:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="298792866"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by azsmga001.ch.intel.com with ESMTP; 07 May 2013 03:50:25 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2013 13:50:19 +0300
Message-Id: <1367923819-5612-3-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1367923819-5612-1-git-send-email-mihai.prica@intel.com>
References: <1367923819-5612-1-git-send-email-mihai.prica@intel.com>
Subject: [meta-oe][PATCH 3/3] mysql-python: Added recipe for mysql-python
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 11:09:05 -0000

This package provides an interface to MySQL for Python.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../mysql/mysql-python/remove-distribute.patch     |   17 +++++++++++++++++
 .../recipes-support/mysql/mysql-python_1.2.4.bb    |   18 ++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mysql-python/remove-distribute.patch
 create mode 100644 meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb

diff --git a/meta-oe/recipes-support/mysql/mysql-python/remove-distribute.patch b/meta-oe/recipes-support/mysql/mysql-python/remove-distribute.patch
new file mode 100644
index 0000000..0ce750d
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mysql-python/remove-distribute.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Innapropriate
+
+Index: MySQL-python-1.2.4/setup.py
+===================================================================
+--- MySQL-python-1.2.4.orig/setup.py
++++ MySQL-python-1.2.4/setup.py
+@@ -3,8 +3,8 @@
+ import os
+ import sys
+ 
+-from distribute_setup import use_setuptools
+-use_setuptools()
++#from distribute_setup import use_setuptools
++#use_setuptools()
+ from setuptools import setup, Extension
+ 
+ if not hasattr(sys, "hexversion") or sys.hexversion < 0x02040000:
diff --git a/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb b/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
new file mode 100644
index 0000000..37ad21c
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Python interface to MySQL"
+HOMEPAGE = "https://github.com/farcepest/MySQLdb1"
+SECTION = "devel/python"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PR = "r0"
+SRCNAME = "MySQL-python"
+
+SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip \
+           file://remove-distribute.patch"
+
+SRC_URI[md5sum] = "ddf2386daf10a97af115ffad2ed4a9a0"
+SRC_URI[sha256sum] = "e405f9d6be33923d428acaa4db4f4470427f1d15ea0d2d82a933449ace26bbd9"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
1.7.9.5



