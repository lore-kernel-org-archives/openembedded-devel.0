Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6097F625
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 06:14:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,306,1566835200"; d="scan'208";a="77089240"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Oct 2019 14:14:15 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EB4A14CE14E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:13:49 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 17 Oct 2019 14:14:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Oct 2019 14:14:21 +0800
Message-ID: <20191017061421.1917-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: EB4A14CE14E3.AAEBE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cffi: upgrade 1.12.3 -> 1.13.0
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
X-List-Received-Date: Thu, 17 Oct 2019 06:14:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cffi.inc                   | 4 ++--
 .../python/{python-cffi_1.12.3.bb => python-cffi_1.13.0.bb}           | 0
 .../python/{python3-cffi_1.12.3.bb => python3-cffi_1.13.0.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.12.3.bb => python-cffi_1.13.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.12.3.bb => python3-cffi_1.13.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 818d238..07baa2d 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "35ad1f9e1003cac9404c1493eb10d7f5"
-SRC_URI[sha256sum] = "041c81822e9f84b1d9c401182e174996f0bae9991f33725d059b771744290774"
+SRC_URI[md5sum] = "2c90be6d3bfbf80ab732b28fd677051d"
+SRC_URI[sha256sum] = "8fe230f612c18af1df6f348d02d682fe2c28ca0a6c3856c99599cdacae7cf226"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.12.3.bb b/meta-python/recipes-devtools/python/python-cffi_1.13.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.12.3.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.13.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.12.3.bb b/meta-python/recipes-devtools/python/python3-cffi_1.13.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.12.3.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.13.0.bb
-- 
2.7.4




