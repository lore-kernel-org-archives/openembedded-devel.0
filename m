Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E0C6D7FA42
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:38:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,402,1571673600"; d="scan'208";a="81374710"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 17:38:54 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DE4A849E932D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 17:29:55 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 17:38:52 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 6 Jan 2020 17:39:00 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jan 2020 05:54:57 -0800
Message-ID: <1578318898-25525-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: DE4A849E932D.A552A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] wolfssl: upgrade 4.2.0 -> 4.3.0
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
X-List-Received-Date: Mon, 06 Jan 2020 09:38:54 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../wolfssl/{wolfssl_4.2.0.bb => wolfssl_4.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.2.0.bb => wolfssl_4.3.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.2.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.3.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.2.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.3.0.bb
index 5d8bc9ba9..a6c8cd09c 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.2.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.3.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
-SRCREV = "cb7b4af9861ad627faffdc3d24a196c2d11930b8"
+SRCREV = "3f13b49fa318fbd3216d7da36d942e7c276d3413"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.17.1




