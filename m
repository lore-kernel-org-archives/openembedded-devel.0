Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3077F7A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 05:39:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,219,1569254400"; d="scan'208";a="77350366"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Oct 2019 13:39:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 636614CE1511
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 13:31:37 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 13:39:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Oct 2019 13:39:43 +0800
Message-ID: <20191023053943.26359-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 636614CE1511.A7773
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cffi: upgrade 1.13.0 -> 1.13.1
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
X-List-Received-Date: Wed, 23 Oct 2019 05:39:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cffi.inc                   | 4 ++--
 .../python/{python-cffi_1.13.0.bb => python-cffi_1.13.1.bb}           | 0
 .../python/{python3-cffi_1.13.0.bb => python3-cffi_1.13.1.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.13.0.bb => python-cffi_1.13.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.13.0.bb => python3-cffi_1.13.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 07baa2d..df4f7a4 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "2c90be6d3bfbf80ab732b28fd677051d"
-SRC_URI[sha256sum] = "8fe230f612c18af1df6f348d02d682fe2c28ca0a6c3856c99599cdacae7cf226"
+SRC_URI[md5sum] = "824ad9f228fbc6ce203c334e2ff4ab8f"
+SRC_URI[sha256sum] = "558b3afef987cf4b17abd849e7bedf64ee12b28175d564d05b628a0f9355599b"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.13.0.bb b/meta-python/recipes-devtools/python/python-cffi_1.13.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.13.0.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.13.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.13.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.13.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.13.0.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.13.1.bb
-- 
2.7.4




