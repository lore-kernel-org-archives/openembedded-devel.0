Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C528E7DAF9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 02:47:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,339,1549900800"; d="scan'208";a="59088673"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Apr 2019 10:47:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E679A4CD7BAF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 10:47:46 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 12 Apr 2019 10:47:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Apr 2019 10:48:31 +0800
Message-ID: <20190412024831.23191-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: E679A4CD7BAF.ABB59
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCHv2] python-cffi: upgrade 1.11.5 -> 1.12.2
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
X-List-Received-Date: Fri, 12 Apr 2019 02:47:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-cffi_1.11.5.bb to python-cffi_1.12.2.bb.

-Upgrade from python3-cffi_1.11.5.bb to python3-cffi_1.12.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cffi.inc           | 4 ++--
 .../python/{python-cffi_1.11.5.bb => python-cffi_1.12.2.bb}   | 0
 .../python/{python3-cffi_1.11.5.bb => python3-cffi_1.12.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.11.5.bb => python-cffi_1.12.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.11.5.bb => python3-cffi_1.12.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index e6071eeca..069aba008 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "ac8492f4ad952360737413e82d661908"
-SRC_URI[sha256sum] = "e90f17980e6ab0f3c2f3730e56d1fe9bcba1891eeea58966e89d352492cc74f4"
+SRC_URI[md5sum] = "4d7dcb6c7c738c15d2ece9bd4c5f86da"
+SRC_URI[sha256sum] = "e113878a446c6228669144ae8a56e268c91b7f1fafae927adc4879d9849e0ea7"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.11.5.bb b/meta-python/recipes-devtools/python/python-cffi_1.12.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.11.5.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.12.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.11.5.bb b/meta-python/recipes-devtools/python/python3-cffi_1.12.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.11.5.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.12.2.bb
-- 
2.20.1




