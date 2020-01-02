Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACC67D2E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 03:30:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81227365"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 11:30:47 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 52A3F49E9310
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 11:21:52 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 11:30:45 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 11:30:46 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 11:32:02 +0800
Message-ID: <20200102033202.28879-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 52A3F49E9310.A755A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-bitarray: upgrade 1.1.0 -> 1.2.0
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
X-List-Received-Date: Thu, 02 Jan 2020 03:30:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-bitarray.inc     | 6 +++---
 .../{python-bitarray_1.1.0.bb => python-bitarray_1.2.0.bb}  | 0
 ...{python3-bitarray_1.1.0.bb => python3-bitarray_1.2.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-bitarray_1.1.0.bb => python-bitarray_1.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.1.0.bb => python3-bitarray_1.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-bitarray.inc b/meta-python/recipes-devtools/python/python-bitarray.inc
index da5d11f1c..e156bd87e 100644
--- a/meta-python/recipes-devtools/python/python-bitarray.inc
+++ b/meta-python/recipes-devtools/python/python-bitarray.inc
@@ -1,10 +1,10 @@
 SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
 HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=00f0d12ccaf4e6b0b4fe501663621fa3"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f1c84020645d906bd6569f6bcf071eca"
 
-SRC_URI[md5sum] = "743d396a1012d6f7d791d8a526da302d"
-SRC_URI[sha256sum] = "9f578314c7808eb1416620dc7d7977d4787a65a4f61b4c9685343a860712615b"
+SRC_URI[md5sum] = "ce21bdfb6d074bd051abd601667b238e"
+SRC_URI[sha256sum] = "4f8706b651243c9faa981f075bcbdef2fab83e9b9bc9211ed2cb5849f9a68342"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-bitarray_1.1.0.bb b/meta-python/recipes-devtools/python/python-bitarray_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-bitarray_1.1.0.bb
rename to meta-python/recipes-devtools/python/python-bitarray_1.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.1.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.2.0.bb
-- 
2.20.1




