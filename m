Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1DC779D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 09:43:00 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v2L9gu7M027734
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 10:42:56 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.72])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v2L9guxI011836;
	Tue, 21 Mar 2017 10:42:56 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Mar 2017 10:42:50 +0100
Message-Id: <1490089371-23969-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-webserver][PATCH 1/2] nginx: set sane defaults for temp directories
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
X-List-Received-Date: Tue, 21 Mar 2017 09:43:01 -0000

Currently the build directiories en up in /usr/*_temp which is not what most
users will expect. This changes the default location to /tmp/nginx/*_tmp.

The location can still be overridden in the nginx.conf file.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index e4e5f63..7f83937 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -63,6 +63,11 @@ do_configure () {
     --conf-path=${sysconfdir}/nginx/nginx.conf \
     --http-log-path=${localstatedir}/log/nginx/access.log \
     --error-log-path=${localstatedir}/log/nginx/error.log \
+    --http-client-body-temp-path=/run/nginx/client_body_temp \
+    --http-proxy-temp-path=/run/nginx/proxy_temp \
+    --http-fastcgi-temp-path=/run/nginx/fastcgi_temp \
+    --http-uwsgi-temp-path=/run/nginx/uwsgi_temp \
+    --http-scgi-temp-path=/run/nginx/scgi_temp \
     --pid-path=/run/nginx/nginx.pid \
     --prefix=${prefix} \
     --with-http_ssl_module \
-- 
2.1.4


