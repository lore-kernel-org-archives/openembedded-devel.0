Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A05647F67E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 21:22:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xACLMjmc006273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 13:22:45 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 12 Nov 2019 13:22:44 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Nov 2019 13:22:44 -0800
Message-ID: <20191112212244.53157-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH 1/1] php: fix CVE-2019-11043
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
X-List-Received-Date: Tue, 12 Nov 2019 21:22:44 -0000
Content-Type: text/plain

Backport unmodified patch from git.php.net.  Fixed in php 7.3.11.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-devtools/php/php/CVE-2019-11043.patch  | 38 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.3.9.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch
new file mode 100644
index 0000000..7e20063
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch
@@ -0,0 +1,38 @@
+From ab061f95ca966731b1c84cf5b7b20155c0a1c06a Mon Sep 17 00:00:00 2001
+From: Jakub Zelenka <bukka@php.net>
+Date: Sat, 12 Oct 2019 15:56:16 +0100
+Subject: [PATCH] Fix bug #78599 (env_path_info underflow can lead to RCE)
+
+CVE: CVE-2019-11043
+
+Fixed in php version 7.3.11.
+
+Upstream-Status: Backport [https://git.php.net/repository/php-src.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ NEWS                                          |  4 +-
+ sapi/fpm/fpm/fpm_main.c                       |  4 +-
+ .../tests/bug78599-path-info-underflow.phpt   | 61 +++++++++++++++++++
+ sapi/fpm/tests/tester.inc                     | 11 +++-
+ 4 files changed, 75 insertions(+), 5 deletions(-)
+ create mode 100644 sapi/fpm/tests/bug78599-path-info-underflow.phpt
+
+diff --git a/sapi/fpm/fpm/fpm_main.c b/sapi/fpm/fpm/fpm_main.c
+index 24a7e5d56a..50f92981f1 100644
+--- a/sapi/fpm/fpm/fpm_main.c
++++ b/sapi/fpm/fpm/fpm_main.c
+@@ -1209,8 +1209,8 @@ static void init_request_info(void)
+ 								path_info = script_path_translated + ptlen;
+ 								tflag = (slen != 0 && (!orig_path_info || strcmp(orig_path_info, path_info) != 0));
+ 							} else {
+-								path_info = env_path_info ? env_path_info + pilen - slen : NULL;
+-								tflag = (orig_path_info != path_info);
++								path_info = (env_path_info && pilen > slen) ? env_path_info + pilen - slen : NULL;
++								tflag = path_info && (orig_path_info != path_info);
+ 							}
+ 
+ 							if (tflag) {
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.3.9.bb b/meta-oe/recipes-devtools/php/php_7.3.9.bb
index a5c7b9b..e886cb1 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.9.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
             file://0001-Use-pkg-config-for-libxml2-detection.patch \
             file://debian-php-fixheader.patch \
             file://CVE-2019-6978.patch \
+            file://CVE-2019-11043.patch \
            "
 SRC_URI_append_class-target = " \
                                 file://pear-makefile.patch \
-- 
2.7.4


