Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9917FEE5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 03:24:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,522,1559491200"; d="scan'208";a="75686641"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 11:24:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0707E4CE03FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 11:24:20 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Sep 2019 11:24:24 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Sep 2019 12:23:56 +0900
Message-ID: <20190919032356.48423-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 0707E4CE03FD.A05AF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH 5/6] python-importlib-metadata: new recipe
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
X-List-Received-Date: Thu, 19 Sep 2019 03:24:23 -0000
Content-Type: text/plain

Add new recipe python-importlib-metadata as it is RDEPEND of python-pytest.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../python/python-importlib-metadata.inc             | 12 ++++++++++++
 .../python/python-importlib-metadata_0.23.bb         |  2 ++
 .../python/python3-importlib-metadata_0.23.bb        |  2 ++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-importlib-metadata.inc
 create mode 100644 meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb

diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata.inc b/meta-python/recipes-devtools/python/python-importlib-metadata.inc
new file mode 100644
index 000000000..9eb5da954
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-importlib-metadata.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Read metadata from Python packages"
+HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
+
+SRC_URI = "https://files.pythonhosted.org/packages/5d/44/636bcd15697791943e2dedda0dbe098d8530a38d113b202817133e0b06c0/importlib_metadata-0.23.tar.gz"
+S = "${WORKDIR}/importlib_metadata-${PV}"
+SRC_URI[md5sum] = "80d677d744995336c9c22d21a85ddeb8"
+SRC_URI[sha256sum] = "aa18d7378b00b40847790e7c27e11673d7fed219354109d0e7b9e5b25dc3ad26"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
new file mode 100644
index 000000000..5c213004c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-importlib-metadata.inc
diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
new file mode 100644
index 000000000..d71c45b5f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-importlib-metadata.inc
-- 
2.17.1




