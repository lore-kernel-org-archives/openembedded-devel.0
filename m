Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B40016D545
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 08:21:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,454,1557158400"; d="scan'208";a="70807688"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jul 2019 16:21:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7ADBC4CDE64F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:21:03 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 16:21:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jul 2019 16:20:14 +0800
Message-ID: <20190705082014.6131-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 7ADBC4CDE64F.AAC4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] php: upgrade 7.3.6 -> 7.3.7
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
X-List-Received-Date: Fri, 05 Jul 2019 08:21:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from php_7.3.6.bb to php_7.3.7.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_7.3.6.bb => php_7.3.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_7.3.6.bb => php_7.3.7.bb} (88%)

diff --git a/meta-oe/recipes-devtools/php/php_7.3.6.bb b/meta-oe/recipes-devtools/php/php_7.3.7.bb
similarity index 88%
rename from meta-oe/recipes-devtools/php/php_7.3.6.bb
rename to meta-oe/recipes-devtools/php/php_7.3.7.bb
index b1cac1c..1028cf1 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.6.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.7.bb
@@ -14,8 +14,8 @@ SRC_URI_append_class-target = " \
                                 file://xfail_two_bug_tests.patch \
                                 "
 
-SRC_URI[md5sum] = "bde9a912fb311182cd460dad1abbc247"
-SRC_URI[sha256sum] = "1e5ac8700154835c0910e3a814517da9b87bb4a82cc7011fea1a82096b6f6f77"
+SRC_URI[md5sum] = "6c260fa5615d2737d819c1ed9655f694"
+SRC_URI[sha256sum] = "c3608fa7114642725854119ccffe722f42fc7c31e5e4c00d5cb4cb1a0d16bf18"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
                         --with-pdo-mysql=mysqlnd \
-- 
2.7.4




