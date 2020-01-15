Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2507F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889298"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:31 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DAEAE4CE20ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:24 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:29 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:40 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:30 -0800
Message-ID: <1579093951-77460-15-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: DAEAE4CE20ED.A770A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-periphery: 2.0.0 -> 2.0.1
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:30 -0000
Content-Type: text/plain

-License-Update: Update PKG-INFO from 2.0.0 to 2.0.1.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-periphery.inc     | 2 +-
 .../recipes-devtools/python/python-periphery_2.0.0.bb        | 4 ----
 .../recipes-devtools/python/python-periphery_2.0.1.bb        | 5 +++++
 .../recipes-devtools/python/python3-periphery_2.0.0.bb       | 4 ----
 .../recipes-devtools/python/python3-periphery_2.0.1.bb       | 5 +++++
 5 files changed, 11 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-periphery_2.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-periphery_2.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-periphery_2.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python-periphery.inc b/meta-python/recipes-devtools/python/python-periphery.inc
index ea43e5fa7..719c63507 100644
--- a/meta-python/recipes-devtools/python/python-periphery.inc
+++ b/meta-python/recipes-devtools/python/python-periphery.inc
@@ -2,6 +2,6 @@ DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
 HOMEPAGE = "http://pythonhosted.org/python-periphery/"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=19f978bd6c8afe3fa9e408b71330512f"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b"
 
 PYPI_PACKAGE = "python-periphery"
diff --git a/meta-python/recipes-devtools/python/python-periphery_2.0.0.bb b/meta-python/recipes-devtools/python/python-periphery_2.0.0.bb
deleted file mode 100644
index 7069f3fdd..000000000
--- a/meta-python/recipes-devtools/python/python-periphery_2.0.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit pypi setuptools
-require python-periphery.inc
-
-SRC_URI[sha256sum] = "2df05528a7668db4fb3faaff516b34ed99e9009ed9610a4efe3ea6c0ea8a3aab"
diff --git a/meta-python/recipes-devtools/python/python-periphery_2.0.1.bb b/meta-python/recipes-devtools/python/python-periphery_2.0.1.bb
new file mode 100644
index 000000000..8d0240ae2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-periphery_2.0.1.bb
@@ -0,0 +1,5 @@
+inherit pypi setuptools
+require python-periphery.inc
+
+SRC_URI[md5sum] = "1d958f02575d4a19734ee2dd92336157"
+SRC_URI[sha256sum] = "5da4d5f40ff8974cf6c724587baa674d7e0593f07b6f6ee896104f11c1be18ec"
diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.0.0.bb b/meta-python/recipes-devtools/python/python3-periphery_2.0.0.bb
deleted file mode 100644
index d0c8bed26..000000000
--- a/meta-python/recipes-devtools/python/python3-periphery_2.0.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit pypi setuptools3
-require python-periphery.inc
-
-SRC_URI[sha256sum] = "2df05528a7668db4fb3faaff516b34ed99e9009ed9610a4efe3ea6c0ea8a3aab"
diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
new file mode 100644
index 000000000..e9944274b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
@@ -0,0 +1,5 @@
+inherit pypi setuptools3
+require python-periphery.inc
+
+SRC_URI[md5sum] = "1d958f02575d4a19734ee2dd92336157"
+SRC_URI[sha256sum] = "5da4d5f40ff8974cf6c724587baa674d7e0593f07b6f6ee896104f11c1be18ec"
-- 
2.17.1




