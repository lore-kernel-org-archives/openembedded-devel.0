Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id BBB0D77379
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 15:03:25 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u14F3P3q018999
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Feb 2016 16:03:25 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.41])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u14F3Kwu020415;
	Thu, 4 Feb 2016 16:03:25 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:03:14 +0100
Message-Id: <1454598194-11339-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454598194-11339-1-git-send-email-pascal.bach@siemens.com>
References: <1454598194-11339-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-webserver][PATCH 2/2] nginx: update to 1.9.10
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
X-List-Received-Date: Thu, 04 Feb 2016 15:03:26 -0000

---
 .../recipes-httpd/nginx/{nginx_1.9.9.bb => nginx_1.9.10.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.9.bb => nginx_1.9.10.bb} (95%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb
similarity index 95%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb
index 08f53a7..5d63d41 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb
@@ -6,7 +6,7 @@ concurrency, performance and low memory usage."
 
 HOMEPAGE = "http://nginx.org/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3845852aedfa8d6d7765f55d06cc3ebd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
 SECTION = "net"
 
 DEPENDS = "libpcre gzip openssl"
@@ -19,8 +19,8 @@ SRC_URI = " \
 	file://nginx-volatile.conf \
 	file://nginx.service \
 "
-SRC_URI[md5sum] = "50fdfa08e93ead7a111cba5a5f5735af"
-SRC_URI[sha256sum] = "de66bb2b11c82533aa5cb5ccc27cbce736ab87c9f2c761e5237cda0b00068d73"
+SRC_URI[md5sum] = "64cc970988356a5e0fc4fcd1ab84fe57"
+SRC_URI[sha256sum] = "fb14d76844cab0a5a0880768be28965e74f9956790f618c454ef6098e26631d9"
 
 inherit update-rc.d useradd
 
-- 
2.1.4


