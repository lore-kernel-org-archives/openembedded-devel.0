Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 187547F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889299"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E130A4CE20E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:22 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:28 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:38 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:29 -0800
Message-ID: <1579093951-77460-14-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: E130A4CE20E1.A1E6A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-packaging: 19.2 -> 20.0
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:31 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-packaging.inc      | 4 ++--
 .../{python-packaging_19.2.bb => python-packaging_20.0.bb}    | 0
 .../{python3-packaging_19.2.bb => python3-packaging_20.0.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-packaging_19.2.bb => python-packaging_20.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-packaging_19.2.bb => python3-packaging_20.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-packaging.inc b/meta-python/recipes-devtools/python/python-packaging.inc
index c32caaa40..7cedadf69 100644
--- a/meta-python/recipes-devtools/python/python-packaging.inc
+++ b/meta-python/recipes-devtools/python/python-packaging.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[md5sum] = "867ce70984dc7b89bbbc3cac2a72b171"
-SRC_URI[sha256sum] = "28b924174df7a2fa32c1953825ff29c61e2f5e082343165438812f00d3a7fc47"
+SRC_URI[md5sum] = "93d6ccbdfcb5b7697b6ecea53ecc294b"
+SRC_URI[sha256sum] = "fe1d8331dfa7cc0a883b49d75fc76380b2ab2734b220fbb87d774e4fd4b851f8"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
diff --git a/meta-python/recipes-devtools/python/python-packaging_19.2.bb b/meta-python/recipes-devtools/python/python-packaging_20.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-packaging_19.2.bb
rename to meta-python/recipes-devtools/python/python-packaging_20.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-packaging_19.2.bb b/meta-python/recipes-devtools/python/python3-packaging_20.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-packaging_19.2.bb
rename to meta-python/recipes-devtools/python/python3-packaging_20.0.bb
-- 
2.17.1




