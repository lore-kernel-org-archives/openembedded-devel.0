Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 559378FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 03:24:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,522,1559491200"; d="scan'208";a="75686626"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 11:24:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 59FE84CE14EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 11:24:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Sep 2019 11:24:09 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Sep 2019 12:23:41 +0900
Message-ID: <20190919032341.48353-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 59FE84CE14EC.A3A13
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH 4/6] python-packaging: new recipe
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
X-List-Received-Date: Thu, 19 Sep 2019 03:24:04 -0000
Content-Type: text/plain

Add new recipe python-packaging as it is RDEPEND of python-pytest.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-packaging.inc       | 10 ++++++++++
 .../recipes-devtools/python/python-packaging_19.2.bb   |  2 ++
 .../recipes-devtools/python/python3-packaging_19.2.bb  |  2 ++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-packaging.inc
 create mode 100644 meta-python/recipes-devtools/python/python-packaging_19.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-packaging_19.2.bb

diff --git a/meta-python/recipes-devtools/python/python-packaging.inc b/meta-python/recipes-devtools/python/python-packaging.inc
new file mode 100644
index 000000000..c32caaa40
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-packaging.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Core utilities for Python packages"
+HOMEPAGE = "https://github.com/pypa/packaging"
+LICENSE = "Apache-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
+
+SRC_URI[md5sum] = "867ce70984dc7b89bbbc3cac2a72b171"
+SRC_URI[sha256sum] = "28b924174df7a2fa32c1953825ff29c61e2f5e082343165438812f00d3a7fc47"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
diff --git a/meta-python/recipes-devtools/python/python-packaging_19.2.bb b/meta-python/recipes-devtools/python/python-packaging_19.2.bb
new file mode 100644
index 000000000..55d0746bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-packaging_19.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-packaging.inc
diff --git a/meta-python/recipes-devtools/python/python3-packaging_19.2.bb b/meta-python/recipes-devtools/python/python3-packaging_19.2.bb
new file mode 100644
index 000000000..aa20fb26f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-packaging_19.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-packaging.inc
-- 
2.17.1




