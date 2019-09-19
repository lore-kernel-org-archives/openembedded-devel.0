Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 45E1C8FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 03:23:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,522,1559491200"; d="scan'208";a="75686620"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 11:23:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 961D44CE14ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 11:23:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Sep 2019 11:23:55 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Sep 2019 12:23:27 +0900
Message-ID: <20190919032327.48282-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 961D44CE14ED.A09F8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH 3/6] python-pathlib2: new recipe
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
X-List-Received-Date: Thu, 19 Sep 2019 03:23:52 -0000
Content-Type: text/plain

Add new recipe python-pathlib2 as it is RDEPEND of python-pytest.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pathlib2.inc  | 9 +++++++++
 .../recipes-devtools/python/python-pathlib2_2.3.4.bb     | 2 ++
 .../recipes-devtools/python/python3-pathlib2_2.3.4.bb    | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pathlib2.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pathlib2_2.3.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pathlib2_2.3.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pathlib2.inc b/meta-python/recipes-devtools/python/python-pathlib2.inc
new file mode 100644
index 000000000..c25e5a080
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pathlib2.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Object-oriented filesystem paths"
+HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
+
+SRC_URI[md5sum] = "96da6398b3ea944417b84ccb25b171aa"
+SRC_URI[sha256sum] = "446014523bb9be5c28128c4d2a10ad6bb60769e78bd85658fe44a450674e0ef8"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-six"
diff --git a/meta-python/recipes-devtools/python/python-pathlib2_2.3.4.bb b/meta-python/recipes-devtools/python/python-pathlib2_2.3.4.bb
new file mode 100644
index 000000000..e4bf78913
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pathlib2_2.3.4.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-pathlib2.inc
diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.4.bb b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.4.bb
new file mode 100644
index 000000000..66f71e57a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.4.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pathlib2.inc
-- 
2.17.1




