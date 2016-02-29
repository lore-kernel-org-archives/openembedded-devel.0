Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6457718B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:43:33 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u1T8hWCv020734
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 09:43:32 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.79.50])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u1T8hNMZ030019;
	Mon, 29 Feb 2016 09:43:33 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Feb 2016 09:43:11 +0100
Message-Id: <1456735391-9764-3-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456735391-9764-1-git-send-email-pascal.bach@siemens.com>
References: <1456735391-9764-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-oe][PATCH v2 3/3] nginx: make the 1.8.x branch the default
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
X-List-Received-Date: Mon, 29 Feb 2016 08:43:35 -0000

The 1.9.x branch is still supported but it needs to be explicitly selected.
---
 meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
index d76bd9e..b11eab4 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
@@ -1,5 +1,9 @@
 require nginx.inc
 
+# 1.9.x is the current mainline branches containing all new features
+# 1.8.x branch is the current stable branch, the recommended default
+DEFAULT_PREFERENCE = "-1"
+
 SRC_URI[md5sum] = "76eb5853a1190e0cfc691aa21c545de3"
 SRC_URI[sha256sum] = "6a5c72f4afaf57a6db064bba0965d72335f127481c5d4e64ee8714e7b368a51f"
 
-- 
2.1.4


