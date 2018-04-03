Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 19D5D74848
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 09:50:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 02:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,400,1517904000"; d="scan'208";a="44486613"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.235])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2018 02:50:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Apr 2018 17:50:14 +0800
Message-Id: <1522749016-17637-4-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522749016-17637-1-git-send-email-anuj.mittal@intel.com>
References: <1522749016-17637-1-git-send-email-anuj.mittal@intel.com>
Subject: [meta-oe][PATCH 3/5] php5: upgrade to 5.6.35
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
X-List-Received-Date: Tue, 03 Apr 2018 09:50:39 -0000

For changes, see:
http://php.net/ChangeLog-5.php#5.6.35

Split patches between php5 and php7 to ensure there are no
fuzz warnings for both the versions.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-devtools/php/php.inc               |  2 -
 .../php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch    | 63 ++++++++++++++++++++++
 .../php/php/php5-pear-makefile.patch               | 26 +++++++++
 .../php/php/php5-phar-makefile.patch               | 46 ++++++++++++++++
 .../php/{php_5.6.33.bb => php_5.6.35.bb}           | 12 +++--
 meta-oe/recipes-devtools/php/php_7.2.4.bb          |  4 ++
 6 files changed, 148 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php/php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php5-pear-makefile.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php5-phar-makefile.patch
 rename meta-oe/recipes-devtools/php/{php_5.6.33.bb => php_5.6.35.bb} (52%)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index d2af4f6..fbc750d 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -18,8 +18,6 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
 SRC_URI_append_class-target = " \
             file://iconv.patch \
             file://imap-fix-autofoo.patch \
-            file://pear-makefile.patch \
-            file://phar-makefile.patch \
             file://php_exec_native.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
diff --git a/meta-oe/recipes-devtools/php/php/php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php/php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch
new file mode 100644
index 0000000..1d21f8c
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch
@@ -0,0 +1,63 @@
+From 5f49987e88dfcbdb84be6e0c9025432fbd998709 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Thu, 20 Aug 2015 16:29:35 +0800
+Subject: [PATCH] config.m4: change AC_TRY_RUN to AC_TRY_LINK
+
+Upstream-Status: Pending
+
+AC_TRY_RUN is not suitable for cross-compile
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+%% original patch: change-AC_TRY_RUN-to-AC_TRY_LINK.patch
+
+%% original patch: php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch
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
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php5-pear-makefile.patch b/meta-oe/recipes-devtools/php/php/php5-pear-makefile.patch
new file mode 100644
index 0000000..cff6426
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php5-pear-makefile.patch
@@ -0,0 +1,26 @@
+From 79725e82d5981fc94eb657f0f46a499dbfc1cc40 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 2 Nov 2011 16:54:57 +0100
+Subject: [PATCH] Upstream-status: Unknown
+
+%% original patch: php5-pear-makefile.patch
+---
+ pear/Makefile.frag | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pear/Makefile.frag b/pear/Makefile.frag
+index 00bacae..739eeca 100644
+--- a/pear/Makefile.frag
++++ b/pear/Makefile.frag
+@@ -11,7 +11,7 @@ PEAR_PREFIX = -dp a${program_prefix}
+ PEAR_SUFFIX = -ds a$(program_suffix)
+ 
+ install-pear-installer: $(SAPI_CLI_PATH)
+-	@$(top_builddir)/sapi/cli/php $(PEAR_INSTALL_FLAGS) pear/install-pear-nozlib.phar -d "$(peardir)" -b "$(bindir)" ${PEAR_PREFIX} ${PEAR_SUFFIX}
++	@$(PHP_NATIVE_DIR)/php $(PEAR_INSTALL_FLAGS) $(builddir)/install-pear-nozlib.phar -d "$(peardir)" -b "$(bindir)" ${PEAR_PREFIX} ${PEAR_SUFFIX}
+ 
+ install-pear:
+ 	@echo "Installing PEAR environment:      $(INSTALL_ROOT)$(peardir)/"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php5-phar-makefile.patch b/meta-oe/recipes-devtools/php/php/php5-phar-makefile.patch
new file mode 100644
index 0000000..4e1efd4
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php5-phar-makefile.patch
@@ -0,0 +1,46 @@
+From 3ea626a8d081f56b01004b7992534d4e6b81a9cc Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 2 Nov 2011 16:54:57 +0100
+Subject: [PATCH] Fix phar packaging
+
+Inherited from OE-Classic, with some additions to fix host paths leaking
+into the target package.
+
+Upstream-Status: Inappropriate [config]
+
+%% original patch: php5-phar-makefile.patch
+---
+ ext/phar/Makefile.frag | 17 +++--------------
+ 1 file changed, 3 insertions(+), 14 deletions(-)
+
+diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
+index b8b1b42..1005b2d 100644
+--- a/ext/phar/Makefile.frag
++++ b/ext/phar/Makefile.frag
+@@ -5,20 +5,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
+ 
+ PHP_PHARCMD_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0 -d 'safe_mode=0'
+ PHP_PHARCMD_EXECUTABLE = ` \
+-	if test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \
+-		$(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$(SAPI_CLI_PATH) -n"; \
+-		if test "x$(PHP_MODULES)" != "x"; then \
+-		$(top_srcdir)/build/shtool echo -n -- " -d extension_dir=$(top_builddir)/modules"; \
+-		for i in bz2 zlib phar; do \
+-			if test -f "$(top_builddir)/modules/$$i.la"; then \
+-				. $(top_builddir)/modules/$$i.la; $(top_srcdir)/build/shtool echo -n -- " -d extension=$$dlname"; \
+-			fi; \
+-		done; \
+-		fi; \
+-	else \
+-		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; \
+-	fi;`
+-PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
++		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
++
++PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
+ 
+ $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
+ 	-@test -d $(builddir)/phar || mkdir $(builddir)/phar
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php_5.6.33.bb b/meta-oe/recipes-devtools/php/php_5.6.35.bb
similarity index 52%
rename from meta-oe/recipes-devtools/php/php_5.6.33.bb
rename to meta-oe/recipes-devtools/php/php_5.6.35.bb
index 9c78918..5ccbfa1 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.33.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.35.bb
@@ -2,14 +2,20 @@ require php.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
 
-SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
+SRC_URI += "file://php5-change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://pthread-check-threads-m4.patch \
             file://0001-Add-lpthread-to-link.patch \
             file://acinclude-xml2-config.patch \
             file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
             "
-SRC_URI[md5sum] = "1ba84d9881521065f6398e665786f9e2"
-SRC_URI[sha256sum] = "07f696a9761dcd839e2045c95c3a4d2ffb52c54417477cca9d30a14975b831cc"
+
+SRC_URI_append_class-target = " \
+                                file://php5-pear-makefile.patch \
+                                file://php5-phar-makefile.patch \
+                                "
+
+SRC_URI[md5sum] = "905ae5f586351f3ca29d044c9484d475"
+SRC_URI[sha256sum] = "ee78a7e9ca21d8ea394d037c55effff477a49dbae31c7753c547036f5bd73b92"
 
 DEPENDS += "libmcrypt"
 EXTRA_OECONF += "--with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
diff --git a/meta-oe/recipes-devtools/php/php_7.2.4.bb b/meta-oe/recipes-devtools/php/php_7.2.4.bb
index e00e1b5..1a9c8ff 100644
--- a/meta-oe/recipes-devtools/php/php_7.2.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.2.4.bb
@@ -6,6 +6,10 @@ SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://0001-acinclude.m4-skip-binconfig-check-for-libxml.patch \
             file://0001-main-php_ini.c-build-empty-php_load_zend_extension_c.patch \
            "
+SRC_URI_append_class-target = " \
+                                file://pear-makefile.patch \
+                                file://phar-makefile.patch \
+                                "
 
 SRC_URI[md5sum] = "864c64ffd2f1686b035ef8ce6a6d8478"
 SRC_URI[sha256sum] = "11658a0d764dc94023b9fb60d4b5eb75d438ad17981efe70abb0d0d09a447ef3"
-- 
2.7.4


