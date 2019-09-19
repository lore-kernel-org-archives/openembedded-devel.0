Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E4F4A8FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 03:23:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,522,1559491200"; d="scan'208";a="75686605"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 11:23:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8CE864CE14E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 11:23:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Sep 2019 11:23:42 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Sep 2019 12:23:14 +0900
Message-ID: <20190919032314.48212-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 8CE864CE14E7.A23D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH 2/6] python-zipp: new recipe
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
X-List-Received-Date: Thu, 19 Sep 2019 03:23:39 -0000
Content-Type: text/plain

Add new recipe python-zipp as it is RDEPEND of python-importlib-metadata.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-zipp.inc    | 10 ++++++++++
 .../recipes-devtools/python/python-zipp_0.6.0.bb       |  2 ++
 .../recipes-devtools/python/python3-zipp_0.6.0.bb      |  2 ++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-zipp.inc
 create mode 100644 meta-python/recipes-devtools/python/python-zipp_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-zipp.inc b/meta-python/recipes-devtools/python/python-zipp.inc
new file mode 100644
index 000000000..ba18f7216
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-zipp.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Backport of pathlib-compatible object wrapper for zip files"
+HOMEPAGE = "https://github.com/jaraco/zipp"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
+
+SRC_URI[md5sum] = "d4451a749d8a7c3c392a9edd1864a937"
+SRC_URI[sha256sum] = "3718b1cbcd963c7d4c5511a8240812904164b7f381b647143a89d3b98f9bcd8e"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-more-itertools"
diff --git a/meta-python/recipes-devtools/python/python-zipp_0.6.0.bb b/meta-python/recipes-devtools/python/python-zipp_0.6.0.bb
new file mode 100644
index 000000000..85949a2a6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-zipp_0.6.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-zipp.inc
diff --git a/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb b/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
new file mode 100644
index 000000000..b78663fd6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-zipp.inc
-- 
2.17.1




