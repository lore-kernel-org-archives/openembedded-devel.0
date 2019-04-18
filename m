Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7D37C749
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 02:04:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,364,1549900800"; d="scan'208";a="59578063"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Apr 2019 10:04:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B1ED4CD8478
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 10:04:37 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 18 Apr 2019 10:04:39 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Apr 2019 10:05:27 +0800
Message-ID: <20190418020527.12700-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 7B1ED4CD8478.A97E2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyopenssl: upgrade 18.0.0 -> 19.0.0
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
X-List-Received-Date: Thu, 18 Apr 2019 02:04:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pyopenssl_18.0.0.bb to python-pyopenssl_19.0.0.bb.

-Upgrade from python3-pyopenssl_18.0.0.bb to python3-pyopenssl_19.0.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyopenssl.inc      | 4 ++--
 ...{python-pyopenssl_18.0.0.bb => python-pyopenssl_19.0.0.bb} | 0
 ...ython3-pyopenssl_18.0.0.bb => python3-pyopenssl_19.0.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyopenssl_18.0.0.bb => python-pyopenssl_19.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_18.0.0.bb => python3-pyopenssl_19.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
index 516e7958a..00c103fcf 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl.inc
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[md5sum] = "c92e9c85b520b7e153fef0f7f3c5dda7"
-SRC_URI[sha256sum] = "6488f1423b00f73b7ad5167885312bb0ce410d3312eb212393795b53c8caa580"
+SRC_URI[md5sum] = "b9876625dc1d5a5a662d748689191537"
+SRC_URI[sha256sum] = "aeca66338f6de19d1aa46ed634c3b9ae519a64b458f8468aec688e7e3c20f200"
 
 PYPI_PACKAGE = "pyOpenSSL"
 
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_18.0.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_19.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyopenssl_18.0.0.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_19.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_18.0.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_19.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_18.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_19.0.0.bb
-- 
2.20.1




