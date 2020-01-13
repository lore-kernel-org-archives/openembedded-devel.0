Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 323B37FCE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:19:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,429,1571673600"; d="scan'208";a="81744429"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 21:19:39 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 812D24CE1CB2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:10:32 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 21:19:39 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 21:19:41 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2020 09:09:40 -0800
Message-ID: <1578935381-39920-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578935381-39920-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578935381-39920-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 812D24CE1CB2.A27C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-bitarray: 1.2.0 -> 1.2.1
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
X-List-Received-Date: Mon, 13 Jan 2020 13:19:39 -0000
Content-Type: text/plain

-PKG-INFO-Update: Version updated to 2019.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-bitarray.inc     | 6 +++---
 .../{python-bitarray_1.2.0.bb => python-bitarray_1.2.1.bb}  | 0
 .../{python3-bitarray_1.2.0.bb => python3-bitarray_1.2.1.b} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-bitarray_1.2.0.bb => python-bitarray_1.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.2.0.bb => python3-bitarray_1.2.1.b} (100%)

diff --git a/meta-python/recipes-devtools/python/python-bitarray.inc b/meta-python/recipes-devtools/python/python-bitarray.inc
index e156bd87e..32da348c4 100644
--- a/meta-python/recipes-devtools/python/python-bitarray.inc
+++ b/meta-python/recipes-devtools/python/python-bitarray.inc
@@ -1,10 +1,10 @@
 SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
 HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f1c84020645d906bd6569f6bcf071eca"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae"
 
-SRC_URI[md5sum] = "ce21bdfb6d074bd051abd601667b238e"
-SRC_URI[sha256sum] = "4f8706b651243c9faa981f075bcbdef2fab83e9b9bc9211ed2cb5849f9a68342"
+SRC_URI[md5sum] = "a46bf869f6adf34f5b0dc82b469793b7"
+SRC_URI[sha256sum] = "2ed675f460bb0d3d66fd8042a6f1f0d36cf213e52e72a745283ddb245da7b9cf"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-bitarray_1.2.0.bb b/meta-python/recipes-devtools/python/python-bitarray_1.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-bitarray_1.2.0.bb
rename to meta-python/recipes-devtools/python/python-bitarray_1.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.b
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.2.1.b
-- 
2.17.1




