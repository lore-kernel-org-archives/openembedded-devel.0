Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CAA857F568
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 06:15:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,227,1569254400"; d="scan'208";a="77459593"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 14:15:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5518E4CE1507
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 14:07:59 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 25 Oct 2019 14:15:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Oct 2019 14:16:08 +0800
Message-ID: <20191025061608.310-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 5518E4CE1507.A913A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] wolfssl: upgrade 4.1.0 -> 4.2.0
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
X-List-Received-Date: Fri, 25 Oct 2019 06:15:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/wolfssl/{wolfssl_4.1.0.bb => wolfssl_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.1.0.bb => wolfssl_4.2.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.1.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.2.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.1.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.2.0.bb
index ae37938..5d8bc9b 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.1.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.2.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
-SRCREV = "50fbdb961fd8c2d8123064e567ae8ec44167732d"
+SRCREV = "cb7b4af9861ad627faffdc3d24a196c2d11930b8"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4




