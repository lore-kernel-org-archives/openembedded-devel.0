Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0946D7F034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 20:27:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6IKR6QB020548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 13:27:06 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 18 Jul 2019 13:26:53 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Jul 2019 13:26:53 -0700
Message-ID: <20190718202653.209093-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] php: remove host specific info from header file
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
X-List-Received-Date: Thu, 18 Jul 2019 20:27:06 -0000
Content-Type: text/plain

Import patch from Debian.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../php/php/debian-php-fixheader.patch             | 31 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.3.7.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100755 meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch

diff --git a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
new file mode 100755
index 0000000..21050f7
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
@@ -0,0 +1,31 @@
+php: remove host specific info from header file
+
+https://sources.debian.org/data/main/p/php7.3/7.3.6-1/debian/patches/
+        0036-php-5.4.9-fixheader.patch
+
+Upstream-Status: Inappropriate [not author]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+From: Debian PHP Maintainers <pkg-php-maint@lists.alioth.debian.org>
+Date: Sat, 2 May 2015 10:26:56 +0200
+Subject: php-5.4.9-fixheader
+
+Make generated php_config.h constant across rebuilds.
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 433d7e6..41893d7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1357,7 +1357,7 @@ PHP_BUILD_DATE=`date -u +%Y-%m-%d`
+ fi
+ AC_DEFINE_UNQUOTED(PHP_BUILD_DATE,"$PHP_BUILD_DATE",[PHP build date])
+ 
+-PHP_UNAME=`uname -a | xargs`
++PHP_UNAME=`uname | xargs`
+ AC_DEFINE_UNQUOTED(PHP_UNAME,"$PHP_UNAME",[uname -a output])
+ PHP_OS=`uname | xargs`
+ AC_DEFINE_UNQUOTED(PHP_OS,"$PHP_OS",[uname output])
diff --git a/meta-oe/recipes-devtools/php/php_7.3.7.bb b/meta-oe/recipes-devtools/php/php_7.3.7.bb
index 1028cf1..72e4c26 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.7.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.7.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
             file://0048-Use-pkg-config-for-FreeType2-detection.patch \
             file://0049-ext-intl-Use-pkg-config-to-detect-icu.patch \
             file://0001-Use-pkg-config-for-libxml2-detection.patch \
+            file://debian-php-fixheader.patch \
            "
 SRC_URI_append_class-target = " \
                                 file://pear-makefile.patch \
-- 
2.7.4


