Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6858660069
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 05:22:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,457,1559491200"; d="scan'208";a="74685722"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 13:22:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 407A24CE14E4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 13:22:49 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 13:22:54 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Sep 2019 13:22:08 +0800
Message-ID: <1567401728-113652-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 407A24CE14E4.A68A0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-cmd2: Add python3 version
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
X-List-Received-Date: Mon, 02 Sep 2019 05:22:51 -0000
Content-Type: text/plain

Providing a python3 version of python-cmd2.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-cmd2.inc       | 13 +++++++++++++
 .../recipes-devtools/python/python-cmd2_0.9.16.bb | 15 ++-------------
 .../python/python3-cmd2_0.9.16.bb                 |  9 +++++++++
 3 files changed, 24 insertions(+), 13 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-cmd2.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb

diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
new file mode 100644
index 000000000..1a0be778b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cmd2.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Extra features for standard library's cmd module"
+HOMEPAGE = "http://packages.python.org/cmd2/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
+
+SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
+SRC_URI[sha256sum] = "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
+
+inherit pypi
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
index 94db37a2d..17b6ae285 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
@@ -1,14 +1,5 @@
-SUMMARY = "Extra features for standard library's cmd module"
-HOMEPAGE = "http://packages.python.org/cmd2/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
-
-SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
-SRC_URI[sha256sum] = "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
-
-inherit pypi setuptools
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+inherit setuptools
+require python-cmd2.inc
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-doctest \
@@ -21,5 +12,3 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-textutils \
     "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
new file mode 100644
index 000000000..f5c5c7e1a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
@@ -0,0 +1,9 @@
+inherit setuptools3
+require python-cmd2.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-pyperclip \
+    ${PYTHON_PN}-colorama \
+    ${PYTHON_PN}-attrs \
+    ${PYTHON_PN}-wcwidth \
+    "
-- 
2.17.1




