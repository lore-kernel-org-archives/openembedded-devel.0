Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 57D456C44B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 06:23:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,483,1559491200"; d="scan'208";a="75153479"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2019 14:23:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 52D354CE14E4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 14:23:09 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019 14:23:20 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Sep 2019 14:21:57 +0800
Message-ID: <1568010117-113514-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 52D354CE14E4.A6AA3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-prettytable: Add python3 version
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
X-List-Received-Date: Mon, 09 Sep 2019 06:23:15 -0000
Content-Type: text/plain

Providing a python3 version of python-prettytable.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-prettytable.inc             | 25 ++++++++++++++++++
 .../python/python-prettytable_0.7.2.bb        | 26 +------------------
 .../python/python3-prettytable_0.7.2.bb       |  3 +++
 3 files changed, 29 insertions(+), 25 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-prettytable.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb

diff --git a/meta-python/recipes-devtools/python/python-prettytable.inc b/meta-python/recipes-devtools/python/python-prettytable.inc
new file mode 100644
index 000000000..6004ecd33
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-prettytable.inc
@@ -0,0 +1,25 @@
+SUMMARY = "Python library for displaying tabular data in a ASCII table format"
+HOMEPAGE = "http://code.google.com/p/prettytable"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
+
+SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
+SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
+
+SRCNAME = "prettytable"
+
+SRC_URI = "https://pypi.python.org/packages/source/P/PrettyTable/${SRCNAME}-${PV}.zip"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+do_install_append() {
+    perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
+    for f in $perm_files; do
+        chmod 644 "${f}"
+    done
+}
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
+UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
index 406555ac3..69ff25927 100644
--- a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -1,27 +1,3 @@
-SUMMARY = "Python library for displaying tabular data in a ASCII table format"
-HOMEPAGE = "http://code.google.com/p/prettytable"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
-
-SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
-SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
-
-SRCNAME = "prettytable"
-
-SRC_URI = "https://pypi.python.org/packages/source/P/PrettyTable/${SRCNAME}-${PV}.zip"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 inherit setuptools
+require python-prettytable.inc
 
-do_install_append() {
-    perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
-    for f in $perm_files; do
-        chmod 644 "${f}"
-    done
-}
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
-UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
new file mode 100644
index 000000000..5445f1019
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-prettytable.inc
+
-- 
2.17.1




