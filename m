Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 69AB978E33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:41:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44069299"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2018 17:41:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 89AFB4B71140
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:41:44 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 28 Aug 2018 17:41:41 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Aug 2018 17:41:27 +0800
Message-ID: <20180828094128.19607-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 89AFB4B71140.ADA6A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] php: 7.2.8 -> 7.2.9
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
X-List-Received-Date: Tue, 28 Aug 2018 09:41:44 -0000
Content-Type: text/plain

Upgrade php from 7.2.8 to 7.2.9

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_7.2.8.bb => php_7.2.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_7.2.8.bb => php_7.2.9.bb} (87%)

diff --git a/meta-oe/recipes-devtools/php/php_7.2.8.bb b/meta-oe/recipes-devtools/php/php_7.2.9.bb
similarity index 87%
rename from meta-oe/recipes-devtools/php/php_7.2.8.bb
rename to meta-oe/recipes-devtools/php/php_7.2.9.bb
index 2a7937e..a5d5afe 100644
--- a/meta-oe/recipes-devtools/php/php_7.2.8.bb
+++ b/meta-oe/recipes-devtools/php/php_7.2.9.bb
@@ -13,8 +13,8 @@ SRC_URI_append_class-target = " \
                                 file://0001-opcache-config.m4-enable-opcache.patch \
                                 "
 
-SRC_URI[md5sum] = "4c5e420b85d12306d84c7e1fa9b085c5"
-SRC_URI[sha256sum] = "1f8068f520a60fff3db19be1b849f0c02a33a0fd8b34b7ae05556ef682187ee6"
+SRC_URI[md5sum] = "175023bc43fd8f883e60849a02a03b93"
+SRC_URI[sha256sum] = "e9e3aaa6c317b7fea78246a758b017544366049d2789ad5a44fe9398464c53a8"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-- 
2.7.4




