Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B10C97D3B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 08:50:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,489,1559491200"; d="scan'208";a="75223894"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Sep 2019 16:50:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 89F404CE032E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 16:49:56 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 10 Sep 2019 16:50:14 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2019 17:49:51 +0900
Message-ID: <20190910084951.40869-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 89F404CE032E.AFBCA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH 1/2] python-atomicwrites: new recipe
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
X-List-Received-Date: Tue, 10 Sep 2019 08:50:22 -0000
Content-Type: text/plain

Add new recipe python-atomicwrites as it is RDEPEND of python-pytest.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-atomicwrites.inc        | 7 +++++++
 .../recipes-devtools/python/python-atomicwrites_1.3.0.bb   | 2 ++
 .../recipes-devtools/python/python3-atomicwrites_1.3.0.bb  | 2 ++
 3 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-atomicwrites.inc
 create mode 100644 meta-python/recipes-devtools/python/python-atomicwrites_1.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python-atomicwrites.inc b/meta-python/recipes-devtools/python/python-atomicwrites.inc
new file mode 100644
index 000000000..773e9dd77
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-atomicwrites.inc
@@ -0,0 +1,7 @@
+DESCRIPTION = "Powerful Python library for atomic file writes"
+HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
+
+SRC_URI[md5sum] = "ce11f780a4ce0fce8a55d64494a88178"
+SRC_URI[sha256sum] = "75a9445bac02d8d058d5e1fe689654ba5a6556a1dfd8ce6ec55a0ed79866cfa6"
diff --git a/meta-python/recipes-devtools/python/python-atomicwrites_1.3.0.bb b/meta-python/recipes-devtools/python/python-atomicwrites_1.3.0.bb
new file mode 100644
index 000000000..c7b41d603
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-atomicwrites_1.3.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-atomicwrites.inc
diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
new file mode 100644
index 000000000..9f306e60d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-atomicwrites.inc
-- 
2.17.1




