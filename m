Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCFD78E68
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 05:17:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w795HLVM009353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Aug 2018 22:17:21 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 8 Aug 2018 22:17:20 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Aug 2018 13:16:48 +0800
Message-ID: <1533791809-371521-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533791809-371521-1-git-send-email-changqing.li@windriver.com>
References: <1533791809-371521-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: upgrade 7.2.7 -> 7.2.8
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
X-List-Received-Date: Thu, 09 Aug 2018 05:17:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_7.2.7.bb => php_7.2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_7.2.7.bb => php_7.2.8.bb} (86%)

diff --git a/meta-oe/recipes-devtools/php/php_7.2.7.bb b/meta-oe/recipes-devtools/php/php_7.2.8.bb
similarity index 86%
rename from meta-oe/recipes-devtools/php/php_7.2.7.bb
rename to meta-oe/recipes-devtools/php/php_7.2.8.bb
index a256cd7..e8cb7fd 100644
--- a/meta-oe/recipes-devtools/php/php_7.2.7.bb
+++ b/meta-oe/recipes-devtools/php/php_7.2.8.bb
@@ -12,8 +12,8 @@ SRC_URI_append_class-target = " \
                                 file://0001-opcache-config.m4-enable-opcache.patch \
                                 "
 
-SRC_URI[md5sum] = "4b5698c8c6c2b9cbff3a5706da67bb0f"
-SRC_URI[sha256sum] = "cc81675a96af4dd18d8ffc02f26a36c622abadf86af7ecfea7bcde8d3c96d5a3"
+SRC_URI[md5sum] = "4c5e420b85d12306d84c7e1fa9b085c5"
+SRC_URI[sha256sum] = "1f8068f520a60fff3db19be1b849f0c02a33a0fd8b34b7ae05556ef682187ee6"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-- 
2.7.4


