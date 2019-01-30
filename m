Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 63619607DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 00:44:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,538,1539619200"; d="scan'208";a="53161504"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jan 2019 08:44:03 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C74EC4C4A8BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 08:43:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 30 Jan 2019 08:44:04 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Jan 2019 08:44:45 +0800
Message-ID: <20190130004445.21000-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: C74EC4C4A8BE.A27D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] php: upgrade to 5.6.39
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
X-List-Received-Date: Wed, 30 Jan 2019 00:44:04 -0000
Content-Type: text/plain

1.Upgrade php from 5.6.38 to 5.6.39.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_5.6.38.bb => php_5.6.39.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_5.6.38.bb => php_5.6.39.bb} (86%)

diff --git a/meta-oe/recipes-devtools/php/php_5.6.38.bb b/meta-oe/recipes-devtools/php/php_5.6.39.bb
similarity index 86%
rename from meta-oe/recipes-devtools/php/php_5.6.38.bb
rename to meta-oe/recipes-devtools/php/php_5.6.39.bb
index d6f51454f..a1e7dcdec 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.38.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.39.bb
@@ -16,8 +16,8 @@ SRC_URI_append_class-target = " \
                                 file://php5-0001-opcache-config.m4-enable-opcache.patch \
                                 "
 
-SRC_URI[md5sum] = "5b98aa066567eca8e5738b8ef4a3545c"
-SRC_URI[sha256sum] = "d65b231bbdd63be4439ef5ced965cfd63e62983429dbd4dfcfb49981593ebc03"
+SRC_URI[md5sum] = "6951d66bf07ce35beda3be0a66bd8e7c"
+SRC_URI[sha256sum] = "b3db2345f50c010b01fe041b4e0f66c5aa28eb325135136f153e18da01583ad5"
 
 DEPENDS += "libmcrypt"
 EXTRA_OECONF += "--with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
-- 
2.17.2




