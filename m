Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AA5377F4CE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 06:00:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74278709"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 14:00:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 271874CE0435
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 13:59:53 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 14:00:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Aug 2019 13:59:24 +0800
Message-ID: <20190826055924.29295-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 271874CE0435.A779B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyyaml: upgrade 3.13 -> 5.1.2
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
X-List-Received-Date: Mon, 26 Aug 2019 06:00:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyyaml.inc               | 6 +++---
 .../python/{python-pyyaml_3.13.bb => python-pyyaml_5.1.2.bb}        | 0
 .../python/{python3-pyyaml_3.13.bb => python3-pyyaml_5.1.2.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyyaml_3.13.bb => python-pyyaml_5.1.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyyaml_3.13.bb => python3-pyyaml_5.1.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml.inc b/meta-python/recipes-devtools/python/python-pyyaml.inc
index afce543..e9ae85e 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml.inc
+++ b/meta-python/recipes-devtools/python/python-pyyaml.inc
@@ -2,14 +2,14 @@ SUMMARY = "Python support for YAML"
 HOMEPAGE = "http://www.pyyaml.org"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5591701d32590f9fa94f3bfee820b634"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
 DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
 
 PYPI_PACKAGE = "PyYAML"
 inherit pypi
 
-SRC_URI[md5sum] = "b78b96636d68ac581c0e2f38158c224f"
-SRC_URI[sha256sum] = "3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf"
+SRC_URI[md5sum] = "20f87ab421b0271dbf371dc5c1cddb5c"
+SRC_URI[sha256sum] = "01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pyyaml_3.13.bb b/meta-python/recipes-devtools/python/python-pyyaml_5.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyyaml_3.13.bb
rename to meta-python/recipes-devtools/python/python-pyyaml_5.1.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_3.13.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyyaml_3.13.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml_5.1.2.bb
-- 
2.7.4




