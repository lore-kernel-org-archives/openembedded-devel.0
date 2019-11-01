Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4737F7AB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 03:32:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,253,1569254400"; d="scan'208";a="77775864"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 11:32:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 694784CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 11:24:53 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 11:32:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 11:33:10 +0800
Message-ID: <20191101033310.22950-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 694784CE1508.A8139
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-periphery: upgrade 1.1.1 -> 2.0.0
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
X-List-Received-Date: Fri, 01 Nov 2019 03:32:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Upgrade file PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-periphery.inc      | 4 ++--
 meta-python/recipes-devtools/python/python-periphery_1.1.1.bb | 4 ----
 meta-python/recipes-devtools/python/python-periphery_2.0.0.bb | 4 ++++
 .../recipes-devtools/python/python3-periphery_1.1.1.bb        | 4 ----
 .../recipes-devtools/python/python3-periphery_2.0.0.bb        | 4 ++++
 5 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-periphery_1.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-periphery_2.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-periphery_1.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-periphery_2.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python-periphery.inc b/meta-python/recipes-devtools/python/python-periphery.inc
index 539c3579c..ea43e5fa7 100644
--- a/meta-python/recipes-devtools/python/python-periphery.inc
+++ b/meta-python/recipes-devtools/python/python-periphery.inc
@@ -2,6 +2,6 @@ DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
 HOMEPAGE = "http://pythonhosted.org/python-periphery/"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=063846af82b555d48822cf43dc6db6af"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=19f978bd6c8afe3fa9e408b71330512f"
 
-PYPI_PACKAGE = "python-periphery"
\ No newline at end of file
+PYPI_PACKAGE = "python-periphery"
diff --git a/meta-python/recipes-devtools/python/python-periphery_1.1.1.bb b/meta-python/recipes-devtools/python/python-periphery_1.1.1.bb
deleted file mode 100644
index 6ae7fed81..000000000
--- a/meta-python/recipes-devtools/python/python-periphery_1.1.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit pypi setuptools
-require python-periphery.inc
-
-SRC_URI[sha256sum] = "fe8f351934edce72cd919b4eb070878ebff551db5e21aea61e0f446101f0a79f"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-periphery_2.0.0.bb b/meta-python/recipes-devtools/python/python-periphery_2.0.0.bb
new file mode 100644
index 000000000..7069f3fdd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-periphery_2.0.0.bb
@@ -0,0 +1,4 @@
+inherit pypi setuptools
+require python-periphery.inc
+
+SRC_URI[sha256sum] = "2df05528a7668db4fb3faaff516b34ed99e9009ed9610a4efe3ea6c0ea8a3aab"
diff --git a/meta-python/recipes-devtools/python/python3-periphery_1.1.1.bb b/meta-python/recipes-devtools/python/python3-periphery_1.1.1.bb
deleted file mode 100644
index ba9a95dbf..000000000
--- a/meta-python/recipes-devtools/python/python3-periphery_1.1.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit pypi setuptools3
-require python-periphery.inc
-
-SRC_URI[sha256sum] = "fe8f351934edce72cd919b4eb070878ebff551db5e21aea61e0f446101f0a79f"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.0.0.bb b/meta-python/recipes-devtools/python/python3-periphery_2.0.0.bb
new file mode 100644
index 000000000..d0c8bed26
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.0.0.bb
@@ -0,0 +1,4 @@
+inherit pypi setuptools3
+require python-periphery.inc
+
+SRC_URI[sha256sum] = "2df05528a7668db4fb3faaff516b34ed99e9009ed9610a4efe3ea6c0ea8a3aab"
-- 
2.20.1




