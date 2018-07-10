Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C9D577553D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:20:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6A3KX6K004498
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jul 2018 20:20:33 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 9 Jul 2018 20:20:32 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Jul 2018 11:20:26 +0800
Message-ID: <1531192828-46910-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531192828-46910-1-git-send-email-changqing.li@windriver.com>
References: <1531192828-46910-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: upgrade 5.6.35 -> 5.6.36
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
X-List-Received-Date: Tue, 10 Jul 2018 03:20:33 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_5.6.35.bb => php_5.6.36.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_5.6.35.bb => php_5.6.36.bb} (85%)

diff --git a/meta-oe/recipes-devtools/php/php_5.6.35.bb b/meta-oe/recipes-devtools/php/php_5.6.36.bb
similarity index 85%
rename from meta-oe/recipes-devtools/php/php_5.6.35.bb
rename to meta-oe/recipes-devtools/php/php_5.6.36.bb
index c17c0d6..addddb3 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.35.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.36.bb
@@ -15,8 +15,8 @@ SRC_URI_append_class-target = " \
                                 file://php5-0001-opcache-config.m4-enable-opcache.patch \
                                 "
 
-SRC_URI[md5sum] = "905ae5f586351f3ca29d044c9484d475"
-SRC_URI[sha256sum] = "ee78a7e9ca21d8ea394d037c55effff477a49dbae31c7753c547036f5bd73b92"
+SRC_URI[md5sum] = "6ca12a0e52dcd99cf4d5b2d74c6cde6f"
+SRC_URI[sha256sum] = "626a0e3f5d8a0e686a2b930f0dd3a0601fe3dcb5e43dd0e8c3fab631e64e172a"
 
 DEPENDS += "libmcrypt"
 EXTRA_OECONF += "--with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
-- 
2.7.4


