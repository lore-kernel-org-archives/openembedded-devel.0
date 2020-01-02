Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 632337F9AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 06:06:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81230533"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 14:06:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 015DE49E9303
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:57:09 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 14:06:02 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 14:06:02 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 14:07:19 +0800
Message-ID: <20200102060719.21646-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 015DE49E9303.AF20C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-py: upgrade 1.8.0 -> 1.8.1
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
X-List-Received-Date: Thu, 02 Jan 2020 06:06:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-py.inc             | 4 ++--
 .../python/{python-py_1.8.0.bb => python-py_1.8.1.bb}         | 0
 .../python/{python3-py_1.8.0.bb => python3-py_1.8.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.8.0.bb => python-py_1.8.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-py_1.8.0.bb => python3-py_1.8.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index b6e0409bd..2b48abe8e 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://py.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "d9e30436ce7e79f30847f9b30b62e149"
-SRC_URI[sha256sum] = "dc639b046a6e2cff5bbe40194ad65936d6ba360b52b3c3fe1d08a82dd50b5e53"
+SRC_URI[md5sum] = "42c67de84b07ac9cc867b8b70843a45b"
+SRC_URI[sha256sum] = "5e27081401262157467ad6e7f851b7aa402c5852dbcb3dae06768434de5752aa"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.8.0.bb b/meta-python/recipes-devtools/python/python-py_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-py_1.8.0.bb
rename to meta-python/recipes-devtools/python/python-py_1.8.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-py_1.8.0.bb b/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-py_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-py_1.8.1.bb
-- 
2.20.1




