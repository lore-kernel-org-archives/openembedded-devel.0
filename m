Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8292890097
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 03:23:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,522,1559491200"; d="scan'208";a="75686592"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 11:23:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8791C4CE14EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 11:23:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Sep 2019 11:23:29 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Sep 2019 12:23:01 +0900
Message-ID: <20190919032301.48142-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 8791C4CE14EB.A10EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH 1/6] python-more-itertools: new recipe
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
X-List-Received-Date: Thu, 19 Sep 2019 03:23:33 -0000
Content-Type: text/plain

Add new recipe python-more-itertools as it is RDEPEND of python-zipp and python-pytest.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-more-itertools.inc    | 9 +++++++++
 .../python/python-more-itertools_7.2.0.bb                | 2 ++
 .../python/python3-more-itertools_7.2.0.bb               | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-more-itertools.inc
 create mode 100644 meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
new file mode 100644
index 000000000..41c334e8d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-more-itertools.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "More routines for operating on iterables, beyond itertools"
+HOMEPAGE = "https://github.com/erikrose/more-itertools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
+
+SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
+SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
+
+inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
new file mode 100644
index 000000000..0702aad4e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-more-itertools.inc
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
new file mode 100644
index 000000000..28ddf88fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-more-itertools.inc
-- 
2.17.1




