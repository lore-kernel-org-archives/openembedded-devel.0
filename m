Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3935F7E719
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 03:53:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67022621"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 11:53:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id DEC494CDD461
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:53:24 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 11:53:21 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jun 2019 11:54:38 +0800
Message-ID: <20190612035438.23728-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: DEC494CDD461.A7EBD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cython: upgrade 0.29.7 -> 0.29.10
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
X-List-Received-Date: Wed, 12 Jun 2019 03:53:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-cython_0.29.7.bb to python-cython_0.29.10.bb.

-Upgrade from python3-cython_0.29.7.bb to python3-cython_0.29.10.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cython.inc         | 4 ++--
 .../{python-cython_0.29.7.bb => python-cython_0.29.10.bb}     | 0
 .../{python3-cython_0.29.7.bb => python3-cython_0.29.10.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.29.7.bb => python-cython_0.29.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.29.7.bb => python3-cython_0.29.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 8ccbe0a87..10cfef58b 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "24f6a7e0e6691fbecf5880f38cdf880e"
-SRC_URI[sha256sum] = "55d081162191b7c11c7bfcb7c68e913827dfd5de6ecdbab1b99dab190586c1e8"
+SRC_URI[md5sum] = "08939b99869f59007387aea0d1a86341"
+SRC_URI[sha256sum] = "26229570d6787ff3caa932fe9d802960f51a89239b990d275ae845405ce43857"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.29.7.bb b/meta-python/recipes-devtools/python/python-cython_0.29.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.29.7.bb
rename to meta-python/recipes-devtools/python/python-cython_0.29.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.29.7.bb b/meta-python/recipes-devtools/python/python3-cython_0.29.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.29.7.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.29.10.bb
-- 
2.20.1




