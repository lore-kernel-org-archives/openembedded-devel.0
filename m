Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8ED37E261
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 03:04:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5534d4w011401
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jun 2019 20:04:49 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 20:04:28 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jun 2019 11:03:58 +0800
Message-ID: <1559703841-263740-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] php: upgrade 7.3.4 -> 7.3.6
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
X-List-Received-Date: Wed, 05 Jun 2019 03:04:58 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_7.3.4.bb => php_7.3.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_7.3.4.bb => php_7.3.6.bb} (88%)

diff --git a/meta-oe/recipes-devtools/php/php_7.3.4.bb b/meta-oe/recipes-devtools/php/php_7.3.6.bb
similarity index 88%
rename from meta-oe/recipes-devtools/php/php_7.3.4.bb
rename to meta-oe/recipes-devtools/php/php_7.3.6.bb
index 4e577df..b1cac1c 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.6.bb
@@ -14,8 +14,8 @@ SRC_URI_append_class-target = " \
                                 file://xfail_two_bug_tests.patch \
                                 "
 
-SRC_URI[md5sum] = "efb58aea95a66738d871f83ec55fec6f"
-SRC_URI[sha256sum] = "2e2c3d8212c83649e443b61efffbd03df4b9edd0f9c7a679081fe4cb2da12b78"
+SRC_URI[md5sum] = "bde9a912fb311182cd460dad1abbc247"
+SRC_URI[sha256sum] = "1e5ac8700154835c0910e3a814517da9b87bb4a82cc7011fea1a82096b6f6f77"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
                         --with-pdo-mysql=mysqlnd \
-- 
2.7.4


