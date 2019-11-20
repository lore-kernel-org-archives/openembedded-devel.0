Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 81A517F771
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 06:58:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,220,1571673600"; d="scan'208";a="78781227"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 14:58:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 193604CE1672
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 14:50:27 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 14:58:43 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 14:59:16 +0800
Message-ID: <20191120065916.16065-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 193604CE1672.A3D16
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-xlrd: upgrade 1.1.0 -> 1.2.0
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
X-List-Received-Date: Wed, 20 Nov 2019 06:58:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-xlrd.inc         | 6 +++---
 .../python/{python-xlrd_1.1.0.bb => python-xlrd_1.2.0.bb}   | 0
 .../python/{python3-xlrd_1.1.0.bb => python3-xlrd_1.2.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-xlrd_1.1.0.bb => python-xlrd_1.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-xlrd_1.1.0.bb => python3-xlrd_1.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-xlrd.inc b/meta-python/recipes-devtools/python/python-xlrd.inc
index 1478a474b..f87d2ab7c 100644
--- a/meta-python/recipes-devtools/python/python-xlrd.inc
+++ b/meta-python/recipes-devtools/python/python-xlrd.inc
@@ -4,10 +4,10 @@ DESCRIPTION = "Extract data from Excel spreadsheets (.xls and .xlsx,\
 Strong support for Excel dates. Unicode-aware."
 HOMEPAGE = "http://www.python-excel.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=08bd814936237b6e1355e6370b24b2c1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5f4244d51fcc1e7cc2d43e96891b2f80"
 
-SRC_URI[md5sum] = "b85c9916ac755cad489a9005f5a0d390"
-SRC_URI[sha256sum] = "8a21885513e6d915fe33a8ee5fdfa675433b61405ba13e2a69e62ee36828d7e2"
+SRC_URI[md5sum] = "e5d5b96924d791b22898b622eb3e918e"
+SRC_URI[sha256sum] = "546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
 
diff --git a/meta-python/recipes-devtools/python/python-xlrd_1.1.0.bb b/meta-python/recipes-devtools/python/python-xlrd_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-xlrd_1.1.0.bb
rename to meta-python/recipes-devtools/python/python-xlrd_1.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_1.1.0.bb b/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-xlrd_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
-- 
2.20.1




