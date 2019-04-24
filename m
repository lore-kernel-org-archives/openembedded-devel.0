Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2605D7D430
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:57:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,388,1549900800"; d="scan'208";a="60369927"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2019 15:57:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 305B94BAD913
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 15:57:37 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 15:57:39 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Apr 2019 15:58:26 +0800
Message-ID: <20190424075826.14019-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 305B94BAD913.A97FA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cffi: upgrade 1.12.2 -> 1.12.3
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
X-List-Received-Date: Wed, 24 Apr 2019 07:57:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-cffi_1.12.2.bb to python-cffi_1.12.3.bb.

-Upgrade from python3-cffi_1.12.2.bb to python3-cffi_1.12.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cffi.inc           | 4 ++--
 .../python/{python-cffi_1.12.2.bb => python-cffi_1.12.3.bb}   | 0
 .../python/{python3-cffi_1.12.2.bb => python3-cffi_1.12.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.12.2.bb => python-cffi_1.12.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.12.2.bb => python3-cffi_1.12.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 069aba008..d86306bac 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "4d7dcb6c7c738c15d2ece9bd4c5f86da"
-SRC_URI[sha256sum] = "e113878a446c6228669144ae8a56e268c91b7f1fafae927adc4879d9849e0ea7"
+SRC_URI[md5sum] = "35ad1f9e1003cac9404c1493eb10d7f5"
+SRC_URI[sha256sum] = "041c81822e9f84b1d9c401182e174996f0bae9991f33725d059b771744290774"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.12.2.bb b/meta-python/recipes-devtools/python/python-cffi_1.12.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.12.2.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.12.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.12.2.bb b/meta-python/recipes-devtools/python/python3-cffi_1.12.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.12.2.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.12.3.bb
-- 
2.20.1




