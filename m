Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A04467FAAE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 02:30:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,251,1571673600"; d="scan'208";a="79196030"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Nov 2019 10:30:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 848BC4CE1C98
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 10:21:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Nov 2019 10:30:02 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Nov 2019 01:14:27 -0800
Message-ID: <1574932470-14682-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574932470-14682-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1574932470-14682-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 848BC4CE1C98.AA4D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] python-pyopenssl: upgrade 19.0.0 -> 19.1.0
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
X-List-Received-Date: Thu, 28 Nov 2019 02:30:04 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyopenssl.inc              | 4 ++--
 .../python/{python-pyopenssl_19.0.0.bb => python-pyopenssl_19.1.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyopenssl_19.0.0.bb => python-pyopenssl_19.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
index 00c103f..c6a4005 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl.inc
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[md5sum] = "b9876625dc1d5a5a662d748689191537"
-SRC_URI[sha256sum] = "aeca66338f6de19d1aa46ed634c3b9ae519a64b458f8468aec688e7e3c20f200"
+SRC_URI[md5sum] = "d9804fedbd1eb0c7d9243397b1fbf972"
+SRC_URI[sha256sum] = "9a24494b2602aaf402be5c9e30a0b82d4a5c67528fe8fb475e3f3bc00dd69507"
 
 PYPI_PACKAGE = "pyOpenSSL"
 
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_19.0.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_19.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyopenssl_19.0.0.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_19.1.0.bb
-- 
2.7.4




