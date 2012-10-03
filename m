Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJSdz-0002CC-SO
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 19:22:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2012 10:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,528,1344236400"; d="scan'208";a="230100566"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.52])
	by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2012 10:08:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2012 18:08:24 +0100
Message-Id: <418650c55d05724af398dc5fe1185b47bf788135.1349283829.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349283829.git.paul.eggleton@linux.intel.com>
References: <cover.1349283829.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349283829.git.paul.eggleton@linux.intel.com>
References: <cover.1349283829.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v2 3/4] modphp: add from OE-Classic, update to 5.3.14 and fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 17:22:00 -0000

* Use working SRC_URI
* Fix to use correct headers and apxs script for cross-compiling
* Enable threading
* Install headers and scripts for building extension modules
* Use proper variables instead of /etc, /usr/lib etc.
* Fix rpath QA issues
* Add LIC_FILES_CHKSUM
* Put apache config file into SRC_URI instead of referring to it using
  FILESDIR

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-php/modphp/files/70_mod_php5.conf      |   12 +++
 .../recipes-php/modphp/files/configure.patch       |   11 +++
 .../recipes-php/modphp/files/pthread-check.patch   |   64 ++++++++++++++
 meta-webserver/recipes-php/modphp/modphp5.inc      |   90 ++++++++++++++++++++
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb |    5 ++
 5 files changed, 182 insertions(+)
 create mode 100644 meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
 create mode 100644 meta-webserver/recipes-php/modphp/files/configure.patch
 create mode 100644 meta-webserver/recipes-php/modphp/files/pthread-check.patch
 create mode 100644 meta-webserver/recipes-php/modphp/modphp5.inc
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb

diff --git a/meta-webserver/recipes-php/modphp/files/70_mod_php5.conf b/meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
new file mode 100644
index 0000000..1de6fb1
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
@@ -0,0 +1,12 @@
+# vim: ft=apache sw=4 ts=4
+<IfDefine PHP5>
+	# Load the module first
+	<IfModule !sapi_apache2.c>
+		LoadModule php5_module    lib/apache2/modules/libphp5.so
+	</IfModule>
+
+	# Set it to handle the files
+	AddHandler php5-script .php .phtml .php3 .php4 .php5
+	AddType application/x-httpd-php-source .phps
+	DirectoryIndex index.html index.html.var index.php index.phtml
+</IfDefine>
diff --git a/meta-webserver/recipes-php/modphp/files/configure.patch b/meta-webserver/recipes-php/modphp/files/configure.patch
new file mode 100644
index 0000000..c5334c7
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/configure.patch
@@ -0,0 +1,11 @@
+--- php-5.1.6/configure.old	2006-09-12 07:54:14.000000000 -0700
++++ php-5.1.6/configure	2006-09-12 07:54:37.000000000 -0700
+@@ -14715,8 +14715,6 @@
+ 
+ 
+ 
+-  unset ac_cv_func_dlopen
+-  unset ac_cv_func___dlopen
+   unset found
+   
+   echo $ac_n "checking for dlopen""... $ac_c" 1>&6
diff --git a/meta-webserver/recipes-php/modphp/files/pthread-check.patch b/meta-webserver/recipes-php/modphp/files/pthread-check.patch
new file mode 100644
index 0000000..1388b2b
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/pthread-check.patch
@@ -0,0 +1,64 @@
+Hack configure script so it does not disable pthread support when cross-compiling
+
+Upstream-Status: Inapproprate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/configure b/configure
+index 03d8f95..6794d45 100755
+--- a/configure
++++ b/configure
+@@ -3506,7 +3506,7 @@ fi
+   
+ if test "$cross_compiling" = yes; then
+   
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+@@ -3566,7 +3566,7 @@ else
+       
+ if test "$cross_compiling" = yes; then
+   
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+@@ -3636,7 +3636,7 @@ if test "$pthreads_working" != "yes"; then
+     
+ if test "$cross_compiling" = yes; then
+   
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+@@ -106833,7 +106833,7 @@ fi
+   
+ if test "$cross_compiling" = yes; then
+   
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+@@ -106893,7 +106893,7 @@ else
+       
+ if test "$cross_compiling" = yes; then
+   
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+@@ -106963,7 +106963,7 @@ if test "$pthreads_working" != "yes"; then
+     
+ if test "$cross_compiling" = yes; then
+   
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
new file mode 100644
index 0000000..82b5ce1
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -0,0 +1,90 @@
+SECTION = "console/network"
+DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the apache php module."
+LICENSE = "PHP"
+DEPENDS = "apache2-native apache2 zlib"
+
+SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
+           file://configure.patch \
+           file://pthread-check.patch \
+           file://70_mod_php5.conf \
+           "
+
+S = "${WORKDIR}/php-${PV}"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb564efdf78cce8ea6e4b5a4f7c05d97"
+
+inherit autotools
+
+CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
+
+EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
+                --enable-maintainer-zts \
+                --without-mysql \
+		--enable-force-cgi-redirect \
+		--disable-cgi \
+		--disable-cli \
+		--disable-pdo \
+		--without-pear \
+		--without-iconv \
+		--disable-ipv6 \
+		--disable-xml \
+		--disable-xmlreader \
+		--disable-xmlwriter \
+		--disable-simplexml \
+		--disable-libxml \
+		--disable-dom \
+                --disable-rpath \
+                --libdir=${libdir}/php5 \
+                --with-zlib --with-zlib-dir=${STAGING_DIR_TARGET}${exec_prefix} \
+                --with-config-file-path=${sysconfdir}/php/apache2-php5"
+
+# to get postgres support, add it to the DEPENDS above
+# and uncomment this line.  similar for mysql
+#EXTRA_OECONF += " --with-pgsql=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+acpaths = ""
+
+#
+# override the autotools do_configure, which runs autoconf,
+# which breaks everything...
+#
+do_configure() {
+	find . -name config.m4 -o -name configure | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
+	export PHP_LIBXML_DIR=${STAGING_DIR_NATIVE}${layout_exec_prefix} 
+	oe_runconf
+}
+
+do_install  () {
+	install -d ${D}${libdir}/apache2/modules
+	install -d ${D}${sysconfdir}/apache2/modules.d
+	install -d ${D}${sysconfdir}/php/apache2-php5
+	install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
+	install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
+	cat ${S}/php.ini-dist | \
+		sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
+		> ${D}${sysconfdir}/php/apache2-php5/php.ini
+
+	install -d ${D}${bindir}
+	install -m 755 scripts/phpize ${D}${bindir}
+	install -m 755 scripts/php-config ${D}${bindir}
+
+	oe_runmake install-build install-headers INSTALL_ROOT=${D}
+}
+
+SYSROOT_PREPROCESS_FUNCS += "php_sysroot_preprocess"
+
+php_sysroot_preprocess () {
+        install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+        install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+        install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+
+	sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/phpize
+	sed -i 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
+}
+
+RDEPENDS_${PN} = "apache2"
+
+FILES_${PN} = "${libdir}/apache2 ${sysconfdir}"
+FILES_${PN}-dev += "${bindir}/phpize ${bindir}/php-config ${libdir}/php5"
+FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"
+
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb b/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
new file mode 100644
index 0000000..b6a5126
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
@@ -0,0 +1,5 @@
+include modphp5.inc
+PR = "r0"
+
+SRC_URI[md5sum] = "7caac4f71e2f21426c11ac153e538392"
+SRC_URI[sha256sum] = "c8075b6e83c5db0d26cc8426a7456856421089a76c963813b1fcac3ced041cb3"
-- 
1.7.9.5



