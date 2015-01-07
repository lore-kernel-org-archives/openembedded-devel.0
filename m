Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E81157213F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:50:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 07 Jan 2015 06:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,714,1413270000"; d="scan'208";a="665825737"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 06:50:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 14:50:20 +0000
Message-Id: <4486b542b746250175b312e35002bda51cc8f1e2.1420641979.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v4 05/13] php: fix phar script packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jan 2015 14:50:44 -0000

Fix several issues with how the phar package is installed and packaged:
* The symlink was pointing to an absolute path on the host, which
  naturally does not work on the target
* The script itself had a shebang pointing to a path on the host
* A file-rdeps warning was occurring due to rpmdeps detecting that the
  script requires the php binary; in order to prevent the main php
  package depending on php-cli which provides the php binary, move the
  phar script to its own package (I suspect most people won't need it
  anyway).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-devtools/php/php/phar-makefile.patch   | 29 +++++++++++++++-------
 meta-oe/recipes-devtools/php/php_5.5.20.bb         |  4 ++-
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php/phar-makefile.patch b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
index 8a1136d..2851b0f 100644
--- a/meta-oe/recipes-devtools/php/php/phar-makefile.patch
+++ b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
@@ -1,12 +1,15 @@
-Upstream-status: Unknown
+Fix phar packaging
+
+Inherited from OE-Classic, with some additions to fix host paths leaking
+into the target package.
+
+Upstream-Status: Inappropriate [config]
 
 diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
-old mode 100644
-new mode 100755
-index ed6de9f..9d03198
+index 6516ddf..36e6cf4 100644
 --- a/ext/phar/Makefile.frag
 +++ b/ext/phar/Makefile.frag
-@@ -5,19 +5,8 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
+@@ -5,20 +5,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
  
  PHP_PHARCMD_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0 -d 'safe_mode=0'
  PHP_PHARCMD_EXECUTABLE = ` \
@@ -23,11 +26,19 @@ index ed6de9f..9d03198
 -	else \
 -		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; \
 -	fi;`
+-PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
 +		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
 +
- PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
++PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
  
  $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
--- 
-1.9.3
-
+ 	-@test -d $(builddir)/phar || mkdir $(builddir)/phar
+@@ -39,7 +28,7 @@ install-pharcmd: pharcmd
+ 	-@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
+ 	$(INSTALL) $(builddir)/phar.phar $(INSTALL_ROOT)$(bindir)
+ 	-@rm -f $(INSTALL_ROOT)$(bindir)/phar
+-	$(LN_S) -f $(INSTALL_ROOT)$(bindir)/phar.phar $(INSTALL_ROOT)$(bindir)/phar
++	$(LN_S) -f $(bindir)/phar.phar $(INSTALL_ROOT)$(bindir)/phar
+ 	@$(mkinstalldirs) $(INSTALL_ROOT)$(mandir)/man1
+ 	@$(INSTALL_DATA) $(builddir)/phar.1 $(INSTALL_ROOT)$(mandir)/man1/phar.1
+ 	@$(INSTALL_DATA) $(builddir)/phar.phar.1 $(INSTALL_ROOT)$(mandir)/man1/phar.phar.1
diff --git a/meta-oe/recipes-devtools/php/php_5.5.20.bb b/meta-oe/recipes-devtools/php/php_5.5.20.bb
index 7f11b7f..7821f0a 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.20.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.20.bb
@@ -183,9 +183,10 @@ php_sysroot_preprocess () {
 
 MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
 
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
 
 RDEPENDS_${PN}-pear = "${PN}"
+RDEPENDS_${PN}-phar = "${PN}-cli"
 RDEPENDS_${PN}-cli = "${PN}"
 RDEPENDS_${PN}-modphp = "${PN} apache2"
 RDEPENDS_${PN}-dev = "${PN}"
@@ -197,6 +198,7 @@ FILES_${PN}-dbg =+ "${bindir}/.debug \
                     ${libdir}/apache2/modules/.debug"
 FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
 FILES_${PN}-cli = "${bindir}/php"
+FILES_${PN}-phar = "${bindir}/phar*"
 FILES_${PN}-cgi = "${bindir}/php-cgi"
 FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm"
 FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
-- 
1.9.3


