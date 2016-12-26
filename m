Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 017626059F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2016 14:39:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14271492"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Dec 2016 22:39:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 2C35B4818553
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2016 22:39:22 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 26 Dec 2016 22:39:27 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Dec 2016 22:39:08 +0800
Message-ID: <1482763148-5077-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 2C35B4818553.A4F39
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH v4] add php 7.1.0
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
X-List-Received-Date: Mon, 26 Dec 2016 14:39:33 -0000
Content-Type: text/plain

1)Add php_7.1.0.bb
2)Delete php_5.5.38.bb,since it is Replaced by php_5.6.26.bb.
3)Move pthread-check-threads-m4.patch out of 7.1.0, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         | 56 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php.inc               |  1 -
 meta-oe/recipes-devtools/php/php_5.5.38.bb         |  6 ---
 meta-oe/recipes-devtools/php/php_5.6.26.bb         |  4 +-
 meta-oe/recipes-devtools/php/php_7.1.0.bb          | 14 ++++++
 5 files changed, 73 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.5.38.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_7.1.0.bb

diff --git a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
new file mode 100644
index 0000000..39c334f
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
@@ -0,0 +1,56 @@
+[PATCH] config.m4: change AC_TRY_RUN to AC_TRY_LINK
+
+Upstream-Status: Pending
+
+AC_TRY_RUN is not suitable for cross-compile
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ ext/fileinfo/config.m4 | 31 ++++++-------------------------
+ 1 file changed, 6 insertions(+), 25 deletions(-)
+
+diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4
+index 7e98d62..8a8ea0e 100644
+--- a/ext/fileinfo/config.m4
++++ b/ext/fileinfo/config.m4
+@@ -14,31 +14,12 @@ if test "$PHP_FILEINFO" != "no"; then
+     libmagic/readcdf.c libmagic/softmagic.c"
+ 
+   AC_MSG_CHECKING([for strcasestr])
+-  AC_TRY_RUN([
+-#include <string.h>
+-#include <strings.h>
+-#include <stdlib.h>
+-
+-int main(void)
+-{
+-        char *s0, *s1, *ret;
+-
+-        s0 = (char *) malloc(42);
+-        s1 = (char *) malloc(8);
+-
+-        memset(s0, 'X', 42);
+-        s0[24] = 'Y';
+-        s0[26] = 'Z';
+-        s0[41] = '\0';
+-        memset(s1, 'x', 8);
+-        s1[0] = 'y';
+-        s1[2] = 'Z';
+-        s1[7] = '\0';
+-
+-        ret = strcasestr(s0, s1);
+-
+-        return !(NULL != ret);
+-}
++  AC_TRY_COMPILE([
++     #include <string.h>
++     #include <strings.h>
++     #include <stdlib.h>
++  ],[
++     strcasestr(NULL, NULL);
+   ],[
+     dnl using the platform implementation
+     AC_MSG_RESULT(yes)
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index cd91940..c4fb1d9 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -24,7 +24,6 @@ SRC_URI_append_class-target = " \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
             file://configure.patch \
-            file://pthread-check-threads-m4.patch \
             file://70_mod_php5.conf \
             file://php-fpm.service \
           "
diff --git a/meta-oe/recipes-devtools/php/php_5.5.38.bb b/meta-oe/recipes-devtools/php/php_5.5.38.bb
deleted file mode 100644
index 26f35b1..0000000
--- a/meta-oe/recipes-devtools/php/php_5.5.38.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require php.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=464ca70af214d2407f6b7d4458158afd"
-
-SRC_URI[md5sum] = "312244a0eecad602a1555ed2434e223f"
-SRC_URI[sha256sum] = "473c81ebb2e48ca468caee031762266651843d7227c18a824add9b07b9393e38"
diff --git a/meta-oe/recipes-devtools/php/php_5.6.26.bb b/meta-oe/recipes-devtools/php/php_5.6.26.bb
index cbd0615..ddc7ce3 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.26.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.26.bb
@@ -2,6 +2,8 @@ require php.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
 
-SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
+SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
+            file://pthread-check-threads-m4.patch \
+           "
 SRC_URI[md5sum] = "cb424b705cfb715fc04f499f8a8cf52e"
 SRC_URI[sha256sum] = "d47aab8083a4284b905777e1b45dd7735adc53be827b29f896684750ac8b6236"
diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb b/meta-oe/recipes-devtools/php/php_7.1.0.bb
new file mode 100644
index 0000000..210d91f
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_7.1.0.bb
@@ -0,0 +1,14 @@
+require php.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
+
+SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
+SRC_URI[md5sum] = "54e364b60a88db77adb96aacb10f10a4"
+SRC_URI[sha256sum] = "68bcfd7deed5b3474d81dec9f74d122058327e2bed0ac25bbc9ec70995228e61"
+
+PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
+                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
+                        ,--without-mysqli --without-pdo-mysql \
+                        ,mysql5"
+
+FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
-- 
2.7.4




