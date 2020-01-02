Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA797F9B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 08:33:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,386,1571673600"; d="scan'208";a="81234304"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 16:33:05 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 5E97249E9315
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 16:24:11 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 16:33:04 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 16:33:02 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 16:34:21 +0800
Message-ID: <20200102083421.385-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 5E97249E9315.A7BED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-backports-functools-lru-cache: Add python3 version
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
X-List-Received-Date: Thu, 02 Jan 2020 08:33:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-backports-functools-lru-cache.inc  | 19 +++++++++++++++++
 ...ython-backports-functools-lru-cache_1.5.bb | 21 ++-----------------
 ...thon3-backports-functools-lru-cache_1.5.bb |  2 ++
 3 files changed, 23 insertions(+), 19 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-backports-functools-lru-cache.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb

diff --git a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache.inc b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache.inc
new file mode 100644
index 000000000..bce44a28b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache.inc
@@ -0,0 +1,19 @@
+SUMMARY = "Backport of functools.lru_cache from Python 3.3"
+HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=57;endline=57;md5=98fc3658e5970d26f6b2109808c766be"
+
+PYPI_PACKAGE = "backports.functools_lru_cache"
+
+SRC_URI[md5sum] = "20f53f54cd3f04b3346ce75a54959754"
+SRC_URI[sha256sum] = "9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-threading \
+    "
diff --git a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
index 825444ff3..5e0f2f1e8 100644
--- a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
+++ b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
@@ -1,19 +1,2 @@
-SUMMARY = "Backport of functools.lru_cache from Python 3.3"
-HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=57;endline=57;md5=98fc3658e5970d26f6b2109808c766be"
-
-PYPI_PACKAGE = "backports.functools_lru_cache"
-
-SRC_URI[md5sum] = "20f53f54cd3f04b3346ce75a54959754"
-SRC_URI[sha256sum] = "9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a"
-
-DEPENDS += "python-setuptools-scm-native"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-threading \
-    "
+require python-backports-functools-lru-cache.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb
new file mode 100644
index 000000000..91fcc41fc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb
@@ -0,0 +1,2 @@
+require python-backports-functools-lru-cache.inc
+inherit setuptools3
-- 
2.20.1




