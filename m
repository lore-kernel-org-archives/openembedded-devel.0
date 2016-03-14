Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id C2C3160116
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 10:23:29 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u2EANTFQ032220
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 11:23:29 +0100
Received: from dev.sbt.siemens.com ([139.16.73.13])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u2EANIA0022473;
	Mon, 14 Mar 2016 11:23:29 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2016 11:23:13 +0100
Message-Id: <1457950994-15925-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457950994-15925-1-git-send-email-pascal.bach@siemens.com>
References: <1457950994-15925-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-webserver][PATCH v4 2/3] nginx: add stable version 1.8.1 as alternative to the mainline version 1.9.x
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
X-List-Received-Date: Mon, 14 Mar 2016 10:23:30 -0000

The 1.8 branch is the current stable branch of nginx.
This means the branch doesn't get new features, but is still supported with bugfixes.

Depending on the use case it is more suitable to use on an embedded device
than the 1.9 branch which adds new features with every release.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc       | 2 +-
 meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb  | 6 ++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 53e3235..2169b67 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -6,7 +6,7 @@ concurrency, performance and low memory usage."
 
 HOMEPAGE = "http://nginx.org/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
+
 SECTION = "net"
 
 DEPENDS = "libpcre gzip openssl"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb
new file mode 100644
index 0000000..089f547
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3845852aedfa8d6d7765f55d06cc3ebd"
+
+SRC_URI[md5sum] = "2e91695074dbdfbf1bcec0ada9fda462"
+SRC_URI[sha256sum] = "8f4b3c630966c044ec72715754334d1fdf741caa1d5795fb4646c27d09f797b7"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
index d76bd9e..3b9d26f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
@@ -1,5 +1,7 @@
 require nginx.inc
 
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
+
 SRC_URI[md5sum] = "76eb5853a1190e0cfc691aa21c545de3"
 SRC_URI[sha256sum] = "6a5c72f4afaf57a6db064bba0965d72335f127481c5d4e64ee8714e7b368a51f"
 
-- 
2.1.4


