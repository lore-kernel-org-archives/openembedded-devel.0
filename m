Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E7CF37F459
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 07:33:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,356,1559491200"; d="scan'208";a="73134267"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 15:33:19 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A98884CDFCDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 15:33:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 15:33:27 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Aug 2019 00:33:05 +0800
Message-ID: <1565195585-37801-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: A98884CDFCDA.AB87C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pbr: Add python3 version
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
X-List-Received-Date: Wed, 07 Aug 2019 07:33:30 -0000
Content-Type: text/plain

Providing a python3 version of python-pbr.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pbr.inc  | 12 ++++++++++++
 .../recipes-devtools/python/python-pbr_5.4.2.bb     | 13 +------------
 .../recipes-devtools/python/python3-pbr_5.4.2.bb    |  2 ++
 3 files changed, 15 insertions(+), 12 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pbr.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pbr_5.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python-pbr.inc b/meta-python/recipes-devtools/python/python-pbr.inc
new file mode 100644
index 000000000..6c5d4b1cc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pbr.inc
@@ -0,0 +1,12 @@
+# The inc file is in oe-core
+require recipes-devtools/python/python-pbr.inc
+
+SRC_URI[md5sum] = "ea90e1118a0132da752d45e68d10b2b8"
+SRC_URI[sha256sum] = "9b321c204a88d8ab5082699469f52cc94c5da45c51f114113d01b3d993c24cdf"
+
+do_install_append() {
+        if [ -f ${D}${bindir}/pbr ]; then
+                mv ${D}${bindir}/pbr ${D}${bindir}/pbr-2
+        fi
+}
+
diff --git a/meta-python/recipes-devtools/python/python-pbr_5.4.2.bb b/meta-python/recipes-devtools/python/python-pbr_5.4.2.bb
index 1023b2031..8f7f924da 100644
--- a/meta-python/recipes-devtools/python/python-pbr_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_5.4.2.bb
@@ -1,13 +1,2 @@
 inherit setuptools
-# The inc file is in oe-core
-require recipes-devtools/python/python-pbr.inc
-
-SRC_URI[md5sum] = "ea90e1118a0132da752d45e68d10b2b8"
-SRC_URI[sha256sum] = "9b321c204a88d8ab5082699469f52cc94c5da45c51f114113d01b3d993c24cdf"
-
-do_install_append() {
-        if [ -f ${D}${bindir}/pbr ]; then
-                mv ${D}${bindir}/pbr ${D}${bindir}/pbr-2
-        fi
-}
-
+require python-pbr.inc
diff --git a/meta-python/recipes-devtools/python/python3-pbr_5.4.2.bb b/meta-python/recipes-devtools/python/python3-pbr_5.4.2.bb
new file mode 100644
index 000000000..97e7361b1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pbr_5.4.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pbr.inc
-- 
2.17.1




