Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 70346606D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 08:02:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,462,1559491200"; d="scan'208";a="74757934"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Sep 2019 16:02:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9FEE84CE14E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:02:15 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Sep 2019 16:02:19 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Sep 2019 17:01:56 +0900
Message-ID: <20190903080156.33424-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 9FEE84CE14E4.A45A8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] php: upgrade 7.3.8 -> 7.3.9
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
X-List-Received-Date: Tue, 03 Sep 2019 08:02:19 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_7.3.8.bb => php_7.3.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_7.3.8.bb => php_7.3.9.bb} (88%)

diff --git a/meta-oe/recipes-devtools/php/php_7.3.8.bb b/meta-oe/recipes-devtools/php/php_7.3.9.bb
similarity index 88%
rename from meta-oe/recipes-devtools/php/php_7.3.8.bb
rename to meta-oe/recipes-devtools/php/php_7.3.9.bb
index 072d53a09..4d656da0f 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.8.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.9.bb
@@ -15,8 +15,8 @@ SRC_URI_append_class-target = " \
                                 file://xfail_two_bug_tests.patch \
                                 "
 
-SRC_URI[md5sum] = "4ffc06e803cd782a95483eb02213301e"
-SRC_URI[sha256sum] = "d566c630175d9fa84a98d3c9170ec033069e9e20c8d23dea49ae2a976b6c76f5"
+SRC_URI[md5sum] = "bcc37749815009c9201e4c126e1ab8ee"
+SRC_URI[sha256sum] = "a39c9709a8c9eb7ea8ac4933ef7a78b92f7e5735a405c8b8e42ee39541d963c4"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
                         --with-pdo-mysql=mysqlnd \
-- 
2.17.1




