Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 72E07795F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:35:57 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 62921220890;
	Tue, 18 Sep 2018 10:26:14 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 10:26:02 +0200
Message-Id: <20180918082608.1088-3-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180918082608.1088-1-max+openembedded@blarg.de>
References: <20180918082608.1088-1-max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 3/8] [meta-oe] nginx: add PACKAGECONFIG[ssl]
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
X-List-Received-Date: Tue, 18 Sep 2018 08:35:58 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index f1b50bcde..24c2cedf5 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -9,7 +9,7 @@ LICENSE = "BSD-2-Clause"
 
 SECTION = "net"
 
-DEPENDS = "libpcre zlib openssl"
+DEPENDS = "libpcre zlib"
 
 SRC_URI = " \
     http://nginx.org/download/nginx-${PV}.tar.gz \
@@ -34,7 +34,10 @@ NGINX_USER   ?= "www"
 EXTRA_OECONF = ""
 DISABLE_STATIC = ""
 
+PACKAGECONFIG ??= "ssl"
+
 PACKAGECONFIG[http2] = "--with-http_v2_module,,"
+PACKAGECONFIG[ssl] = "--with-http_ssl_module,,openssl"
 
 do_configure () {
     if [ "${SITEINFO_BITS}" = "64" ]; then
@@ -72,7 +75,6 @@ do_configure () {
     --pid-path=/run/nginx/nginx.pid \
     --prefix=${prefix} \
     --with-threads \
-    --with-http_ssl_module \
     --with-http_gzip_static_module \
     ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
 }
-- 
2.18.0


