Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03A05744B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:22:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5T6McnE024102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 23:22:39 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 28 Jun 2018 23:22:27 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 14:22:13 +0800
Message-ID: <1530253337-32732-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
References: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: upgrade 7.2.4 -> 7.2.7
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
X-List-Received-Date: Fri, 29 Jun 2018 06:22:38 -0000
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch    | 2 +-
 meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch         | 2 +-
 meta-oe/recipes-devtools/php/php/iconv.patch                         | 2 +-
 meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch              | 2 +-
 meta-oe/recipes-devtools/php/php/pear-makefile.patch                 | 2 +-
 meta-oe/recipes-devtools/php/php/php5-pear-makefile.patch            | 2 +-
 meta-oe/recipes-devtools/php/php/php_exec_native.patch               | 2 +-
 meta-oe/recipes-devtools/php/{php_7.2.4.bb => php_7.2.7.bb}          | 5 ++---
 8 files changed, 9 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_7.2.4.bb => php_7.2.7.bb} (80%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
index 51a5e43..e7d326d 100644
--- a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
@@ -4,7 +4,7 @@ Date: Tue, 17 Jun 2014 09:53:00 +0200
 Subject: [PATCH 3/8] acinclude: use pkgconfig for libxml2 config
 
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-Upstream-Status: pending
+Upstream-Status: Pending
 ---
  acinclude.m4 | 63 ++++++++++++++++++++++--------------------------------------
  1 file changed, 23 insertions(+), 40 deletions(-)
diff --git a/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch b/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
index 30811a7..d083166 100644
--- a/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
+++ b/meta-oe/recipes-devtools/php/php/acinclude-xml2-config.patch
@@ -1,4 +1,4 @@
-Upstream-status: Unknown
+Upstream-Status: Pending
 
 diff --git a/acinclude.m4 b/acinclude.m4
 index 4fd452e..206fcbf 100644
diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch b/meta-oe/recipes-devtools/php/php/iconv.patch
index b6e3ceb..ecf7d87 100644
--- a/meta-oe/recipes-devtools/php/php/iconv.patch
+++ b/meta-oe/recipes-devtools/php/php/iconv.patch
@@ -1,7 +1,7 @@
 From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Upstream-status: Unknown
+Subject: [PATCH] Upstream-Status: Pending
 
 ---
  acinclude.m4        | 3 ++-
diff --git a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch b/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
index b5fb7d4..16359af 100644
--- a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
+++ b/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
@@ -1,7 +1,7 @@
 From c084c8349d1780980e232cb28b60a109e3d89438 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Upstream-status: Unknown
+Subject: [PATCH] Upstream-Status: Pending
 
 ---
  acinclude.m4       |  2 +-
diff --git a/meta-oe/recipes-devtools/php/php/pear-makefile.patch b/meta-oe/recipes-devtools/php/php/pear-makefile.patch
index 4bc1025..fcbf25b 100644
--- a/meta-oe/recipes-devtools/php/php/pear-makefile.patch
+++ b/meta-oe/recipes-devtools/php/php/pear-makefile.patch
@@ -1,7 +1,7 @@
 From edd575a546d56bb5683aff19782b16963d61fd0b Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Upstream-status: Unknown
+Subject: [PATCH] Upstream-Status: Pending
 
 ---
  pear/Makefile.frag | 2 +-
diff --git a/meta-oe/recipes-devtools/php/php/php5-pear-makefile.patch b/meta-oe/recipes-devtools/php/php/php5-pear-makefile.patch
index cff6426..9974303 100644
--- a/meta-oe/recipes-devtools/php/php/php5-pear-makefile.patch
+++ b/meta-oe/recipes-devtools/php/php/php5-pear-makefile.patch
@@ -1,7 +1,7 @@
 From 79725e82d5981fc94eb657f0f46a499dbfc1cc40 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Upstream-status: Unknown
+Subject: [PATCH] Upstream-Status: Pending
 
 %% original patch: php5-pear-makefile.patch
 ---
diff --git a/meta-oe/recipes-devtools/php/php/php_exec_native.patch b/meta-oe/recipes-devtools/php/php/php_exec_native.patch
index 6af0dc8..8040900 100644
--- a/meta-oe/recipes-devtools/php/php/php_exec_native.patch
+++ b/meta-oe/recipes-devtools/php/php/php_exec_native.patch
@@ -1,7 +1,7 @@
 From d251b5aa3d23803d016ca16818e2e1d2f2b70a02 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Upstream-status: Inappriate
+Subject: [PATCH] Upstream-Status: Inappriate
 
 ---
  sapi/cli/config.m4 | 2 +-
diff --git a/meta-oe/recipes-devtools/php/php_7.2.4.bb b/meta-oe/recipes-devtools/php/php_7.2.7.bb
similarity index 80%
rename from meta-oe/recipes-devtools/php/php_7.2.4.bb
rename to meta-oe/recipes-devtools/php/php_7.2.7.bb
index 2fd1e66..a256cd7 100644
--- a/meta-oe/recipes-devtools/php/php_7.2.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.2.7.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=67e369bc8d1f2e641236b8002039a6a2"
 
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://0001-acinclude.m4-skip-binconfig-check-for-libxml.patch \
-            file://0001-main-php_ini.c-build-empty-php_load_zend_extension_c.patch \
             file://0001-fix-error-caused-by-a-new-variable-is-declared-after.patch \
            "
 SRC_URI_append_class-target = " \
@@ -13,8 +12,8 @@ SRC_URI_append_class-target = " \
                                 file://0001-opcache-config.m4-enable-opcache.patch \
                                 "
 
-SRC_URI[md5sum] = "864c64ffd2f1686b035ef8ce6a6d8478"
-SRC_URI[sha256sum] = "11658a0d764dc94023b9fb60d4b5eb75d438ad17981efe70abb0d0d09a447ef3"
+SRC_URI[md5sum] = "4b5698c8c6c2b9cbff3a5706da67bb0f"
+SRC_URI[sha256sum] = "cc81675a96af4dd18d8ffc02f26a36c622abadf86af7ecfea7bcde8d3c96d5a3"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-- 
2.7.4


