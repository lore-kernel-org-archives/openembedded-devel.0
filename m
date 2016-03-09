Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id CF5166FEF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 12:34:13 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u29CYD4d025314
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Mar 2016 13:34:13 +0100
Received: from dev.sbt.siemens.com (md132uzc.ww300.siemens.net
	[139.22.128.135])
	by mail2.siemens.de (8.15.2/8.15.2) with SMTP id u29CY5BV004454;
	Wed, 9 Mar 2016 13:34:12 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 13:33:58 +0100
Message-Id: <1457526838-18460-3-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457526838-18460-1-git-send-email-pascal.bach@siemens.com>
References: <1457526838-18460-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-webserver][PATCH v3 3/3] nginx: make the 1.8.x branch the default
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
X-List-Received-Date: Wed, 09 Mar 2016 12:34:14 -0000

The 1.9.x branch is still supported but it needs to be explicitly selected.
---
 meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
index 3b9d26f..3eec0f9 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
@@ -1,5 +1,9 @@
 require nginx.inc
 
+# 1.9.x is the current mainline branches containing all new features
+# 1.8.x branch is the current stable branch, the recommended default
+DEFAULT_PREFERENCE = "-1"
+
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
 
 SRC_URI[md5sum] = "76eb5853a1190e0cfc691aa21c545de3"
-- 
2.1.4


