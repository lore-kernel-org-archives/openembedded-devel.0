Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id DCB65719B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 May 2017 10:20:18 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v4TAKHaq029840
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 May 2017 12:20:18 +0200
Received: from dev.sbt.siemens.com ([139.16.116.48])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v4TAK8Um005309;
	Mon, 29 May 2017 12:20:08 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 May 2017 12:20:00 +0200
Message-Id: <1496053200-6249-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-webserver][PATCH] nginx: depend on zlib instead of gzip
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
X-List-Received-Date: Mon, 29 May 2017 10:20:19 -0000

nginx requires zlib not gzip for compression.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index f98f299..77d1b32 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -9,7 +9,7 @@ LICENSE = "BSD-2-Clause"
 
 SECTION = "net"
 
-DEPENDS = "libpcre gzip openssl"
+DEPENDS = "libpcre zlib openssl"
 
 SRC_URI = " \
     http://nginx.org/download/nginx-${PV}.tar.gz \
-- 
2.1.4


