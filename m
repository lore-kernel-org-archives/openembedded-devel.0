Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B68D57F331
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 05:29:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,360,1559491200"; d="scan'208";a="73198681"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Aug 2019 13:29:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6406D4CDFCFB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 13:29:28 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 8 Aug 2019 13:29:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Aug 2019 13:28:46 +0800
Message-ID: <20190808052846.10445-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 6406D4CDFCFB.A97C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] php: upgrade 7.3.7 -> 7.3.8
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
X-List-Received-Date: Thu, 08 Aug 2019 05:29:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_7.3.7.bb => php_7.3.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_7.3.7.bb => php_7.3.8.bb} (88%)

diff --git a/meta-oe/recipes-devtools/php/php_7.3.7.bb b/meta-oe/recipes-devtools/php/php_7.3.8.bb
similarity index 88%
rename from meta-oe/recipes-devtools/php/php_7.3.7.bb
rename to meta-oe/recipes-devtools/php/php_7.3.8.bb
index 72e4c26..072d53a 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.7.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.8.bb
@@ -15,8 +15,8 @@ SRC_URI_append_class-target = " \
                                 file://xfail_two_bug_tests.patch \
                                 "
 
-SRC_URI[md5sum] = "6c260fa5615d2737d819c1ed9655f694"
-SRC_URI[sha256sum] = "c3608fa7114642725854119ccffe722f42fc7c31e5e4c00d5cb4cb1a0d16bf18"
+SRC_URI[md5sum] = "4ffc06e803cd782a95483eb02213301e"
+SRC_URI[sha256sum] = "d566c630175d9fa84a98d3c9170ec033069e9e20c8d23dea49ae2a976b6c76f5"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
                         --with-pdo-mysql=mysqlnd \
-- 
2.7.4




