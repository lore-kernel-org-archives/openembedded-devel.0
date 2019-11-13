Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 67EE57F36B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:43:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,299,1569254400"; d="scan'208";a="78402285"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Nov 2019 16:43:44 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 93C6E4CE1BE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 16:35:33 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 13 Nov 2019 16:43:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Nov 2019 16:44:15 +0800
Message-ID: <20191113084415.17062-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 93C6E4CE1BE8.A9FCC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cffi: upgrade 1.13.1 -> 1.13.2
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
X-List-Received-Date: Wed, 13 Nov 2019 08:43:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cffi.inc           | 4 ++--
 .../python/{python-cffi_1.13.1.bb => python-cffi_1.13.2.bb}   | 0
 .../python/{python3-cffi_1.13.1.bb => python3-cffi_1.13.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.13.1.bb => python-cffi_1.13.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.13.1.bb => python3-cffi_1.13.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index df4f7a405..a2b0c3bb0 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "824ad9f228fbc6ce203c334e2ff4ab8f"
-SRC_URI[sha256sum] = "558b3afef987cf4b17abd849e7bedf64ee12b28175d564d05b628a0f9355599b"
+SRC_URI[md5sum] = "652203cf99faa254efff7fab23c2f3a2"
+SRC_URI[sha256sum] = "599a1e8ff057ac530c9ad1778293c665cb81a791421f46922d80a86473c13346"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.13.1.bb b/meta-python/recipes-devtools/python/python-cffi_1.13.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.13.1.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.13.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.13.1.bb b/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.13.1.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
-- 
2.20.1




