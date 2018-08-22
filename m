Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1A716079F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 00:26:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7M0QZTq019027
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 17:26:35 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 21 Aug 2018 17:26:34 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Aug 2018 08:26:32 +0800
Message-ID: <1534897592-14237-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-webserver][PATCH] xdebug: upgrade 2.6.0 -> 2.6.1
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
X-List-Received-Date: Wed, 22 Aug 2018 00:26:35 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-php/xdebug/{xdebug_2.6.0.bb => xdebug_2.6.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.6.0.bb => xdebug_2.6.1.bb} (86%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.6.1.bb
similarity index 86%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_2.6.1.bb
index 2b8d1ef..773dbf3 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.6.1.bb
@@ -6,8 +6,8 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "ed3545852e6f4a00fb8730362d0431ee"
-SRC_URI[sha256sum] = "b5264cc03bf68fcbb04b97229f96dca505d7b87ec2fb3bd4249896783d29cbdc"
+SRC_URI[md5sum] = "35cc0f2e8b7d40556a9ad9afd9c49aee"
+SRC_URI[sha256sum] = "dae691d6c052073b886e0c6e1306a707bca9fd18a1e3485384ef6c4aacf1bd77"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.7.4


