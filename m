Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 33F0879B57
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 04:38:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,267,1571673600"; d="scan'208";a="79419725"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 12:38:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A73994CE6F87
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 12:29:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 12:38:24 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2019 03:07:19 -0800
Message-ID: <1575284842-97439-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575284842-97439-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575284842-97439-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A73994CE6F87.A81DF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH v2] python-pluggy: upgrade 0.13.0 -> 0.13.1
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
X-List-Received-Date: Mon, 02 Dec 2019 04:38:17 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pluggy.inc                 | 4 ++--
 .../python/{python-pluggy_0.13.0.bb => python-pluggy_0.13.1.bb}       | 0
 .../python/{python3-pluggy_0.13.0.bb => python3-pluggy_0.13.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pluggy_0.13.0.bb => python-pluggy_0.13.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pluggy_0.13.0.bb => python3-pluggy_0.13.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pluggy.inc b/meta-python/recipes-devtools/python/python-pluggy.inc
index 1931532..7585984 100644
--- a/meta-python/recipes-devtools/python/python-pluggy.inc
+++ b/meta-python/recipes-devtools/python/python-pluggy.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[md5sum] = "4b8384b69cddbc2e104fdd3ff5631788"
-SRC_URI[sha256sum] = "fa5fa1622fa6dd5c030e9cad086fa19ef6a0cf6d7a2d12318e10cb49d6d68f34"
+SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
+SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
diff --git a/meta-python/recipes-devtools/python/python-pluggy_0.13.0.bb b/meta-python/recipes-devtools/python/python-pluggy_0.13.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pluggy_0.13.0.bb
rename to meta-python/recipes-devtools/python/python-pluggy_0.13.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.13.0.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pluggy_0.13.0.bb
rename to meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
-- 
2.7.4




