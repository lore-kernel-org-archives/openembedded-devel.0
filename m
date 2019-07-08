Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BEEC671CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 05:25:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,465,1557158400"; d="scan'208";a="70918029"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jul 2019 13:24:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A17C04CDE89C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 13:25:02 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 8 Jul 2019 13:25:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 13:24:11 +0800
Message-ID: <20190708052411.28158-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: A17C04CDE89C.A92C4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-mako: upgrade 1.0.12 -> 1.0.13
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
X-List-Received-Date: Mon, 08 Jul 2019 05:25:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-mako_1.0.12.bb to python-mako_1.0.13.bb.

-Add python3-mako_1.0.13.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-mako.inc           | 4 ++--
 .../python/{python-mako_1.0.12.bb => python-mako_1.0.13.bb}   | 0
 meta-python/recipes-devtools/python/python3-mako_1.0.13.bb    | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-mako_1.0.12.bb => python-mako_1.0.13.bb} (100%)
 create mode 100644 meta-python/recipes-devtools/python/python3-mako_1.0.13.bb

diff --git a/meta-python/recipes-devtools/python/python-mako.inc b/meta-python/recipes-devtools/python/python-mako.inc
index dc27ada74..0b3fe1449 100644
--- a/meta-python/recipes-devtools/python/python-mako.inc
+++ b/meta-python/recipes-devtools/python/python-mako.inc
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "4a7aef27217a8e6c1a29447c9b1b00ab"
-SRC_URI[sha256sum] = "0cfa65de3a835e87eeca6ac856b3013aade55f49e32515f65d999f91a2324162"
+SRC_URI[md5sum] = "ad6c7dcb5d39c99f4fdf4fec892c5dee"
+SRC_URI[sha256sum] = "95ee720cc3453063788515d55bd7ce4a2a77b7b209e4ac70ec5c86091eb02541"
 
 RDEPENDS_${PN} = " \
     ${PYTHON_PN}-html \
diff --git a/meta-python/recipes-devtools/python/python-mako_1.0.12.bb b/meta-python/recipes-devtools/python/python-mako_1.0.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-mako_1.0.12.bb
rename to meta-python/recipes-devtools/python/python-mako_1.0.13.bb
diff --git a/meta-python/recipes-devtools/python/python3-mako_1.0.13.bb b/meta-python/recipes-devtools/python/python3-mako_1.0.13.bb
new file mode 100644
index 000000000..22ceeeb39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mako_1.0.13.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-mako.inc
-- 
2.20.1




