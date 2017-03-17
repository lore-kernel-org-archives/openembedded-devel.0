Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id CCA86779BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Mar 2017 06:04:27 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v2H64OpG022493
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Mar 2017 07:04:25 +0100
Received: from dev.sbt.siemens.com ([132.186.201.60])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v2H64Nw6026233;
	Fri, 17 Mar 2017 07:04:24 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Mar 2017 07:04:19 +0100
Message-Id: <1489730659-8336-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-webserver][PATCH] nginx: make user in nginx.conf consistent with the default value
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
X-List-Received-Date: Fri, 17 Mar 2017 06:04:28 -0000

It gets replaces with the real NGINX_USER anyway, but it confuses people
that there is a different value by default. So just make it the same as the
default NGINX_USER

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
index fb7e4b6..69d3a2a 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.conf
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
@@ -1,5 +1,5 @@
 
-user  www-data;
+user  www;
 worker_processes  1;
 
 error_log  /var/log/nginx/error.log;
-- 
2.1.4


