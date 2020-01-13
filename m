Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 960127FCE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:19:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,429,1571673600"; d="scan'208";a="81744418"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 21:19:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 21C734CE1CB0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:10:27 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 21:19:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 21:19:36 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2020 09:09:39 -0800
Message-ID: <1578935381-39920-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578935381-39920-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578935381-39920-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 21C734CE1CB0.A2BA5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-asn1crypto: 1.2.0 -> 1.3.0
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
X-List-Received-Date: Mon, 13 Jan 2020 13:19:33 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc     | 4 ++--
 ...{python-asn1crypto_1.2.0.bb => python-asn1crypto_1.3.0.bb} | 0
 ...ython3-asn1crypto_1.2.0.bb => python3-asn1crypto_1.3.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-asn1crypto_1.2.0.bb => python-asn1crypto_1.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-asn1crypto_1.2.0.bb => python3-asn1crypto_1.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 9b8c1cb04..de6e1a55b 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
 
 PYPI_PACKAGE = "asn1crypto"
 
-SRC_URI[md5sum] = "fc3815cdd4812505e3ee297740c5f5d3"
-SRC_URI[sha256sum] = "87620880a477123e01177a1f73d0f327210b43a3cdbd714efcd2fa49a8d7b384"
+SRC_URI[md5sum] = "daad112940181917e3ff169b47b9bd9a"
+SRC_URI[sha256sum] = "5a215cb8dc12f892244e3a113fe05397ee23c5c4ca7a69cd6e69811755efc42d"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto_1.2.0.bb b/meta-python/recipes-devtools/python/python-asn1crypto_1.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-asn1crypto_1.2.0.bb
rename to meta-python/recipes-devtools/python/python-asn1crypto_1.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.2.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-asn1crypto_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
-- 
2.17.1




