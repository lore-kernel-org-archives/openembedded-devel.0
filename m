Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TIiqh-00038F-LY
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 18:28:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Oct 2012 09:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,517,1344236400"; d="scan'208";a="229137565"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2012 09:15:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 17:14:57 +0100
Message-Id: <79630778f1fd80c9d82d4cb90a2c48cfe0b46cdf.1349107616.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349107616.git.paul.eggleton@linux.intel.com>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349107616.git.paul.eggleton@linux.intel.com>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 5/6] modphp: update to 5.3.14 and fix
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
X-List-Received-Date: Mon, 01 Oct 2012 16:28:04 -0000

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
 .../recipes-php/modphp/files/pthread-check.patch   |   64 ++++++++++++++++++++
 meta-webserver/recipes-php/modphp/modphp5.inc      |   61 +++++++++++++------
 meta-webserver/recipes-php/modphp/modphp_5.1.6.bb  |    5 --
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb |    5 ++
 4 files changed, 112 insertions(+), 23 deletions(-)
 create mode 100644 meta-webserver/recipes-php/modphp/files/pthread-check.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.1.6.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb

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
index 9158c08..80d6434 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -4,21 +4,22 @@ LICENSE = "PHP"
 RDEPENDS_${PN} = "apache2"
 DEPENDS = "apache2-native apache2 zlib"
 
-#SRC_URI = "http://de3.php.net/distributions/php-${PV}.tar.bz2 \
-SRC_URI = "http://museum.php.net/php5/php-${PV}.tar.bz2 \
-	   file://configure.patch \
-	  "
+SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
+           file://configure.patch \
+           file://pthread-check.patch \
+           file://70_mod_php5.conf \
+           "
 
 S = "${WORKDIR}/php-${PV}"
 
-inherit autotools
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb564efdf78cce8ea6e4b5a4f7c05d97"
 
-FILES_${PN} = "${libdir}/apache2 /etc"
-FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"
+inherit autotools
 
-CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR_NATIVE}/apache2"
+CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
-EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_NATIVE}/apxs \
+EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
+                --enable-maintainer-zts \
                 --without-mysql \
 		--enable-force-cgi-redirect \
 		--disable-cgi \
@@ -33,8 +34,10 @@ EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_NATIVE}/apxs \
 		--disable-simplexml \
 		--disable-libxml \
 		--disable-dom \
-                --with-zlib --with-zlib-dir=${STAGING_DIR}${layout_exec_prefix}/.. \
-                --with-config-file-path=/etc/php/apache2-php5"
+                --disable-rpath \
+                --libdir=${libdir}/php5 \
+                --with-zlib --with-zlib-dir=${STAGING_DIR_TARGET}${exec_prefix} \
+                --with-config-file-path=${sysconfdir}/php/apache2-php5"
 
 #		--with-libxml-dir=${STAGING_DIR_NATIVE}${layout_exec_prefix} \
 
@@ -49,18 +52,40 @@ acpaths = ""
 # which breaks everything...
 #
 do_configure() {
+	find . -name config.m4 -o -name configure | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
 	export PHP_LIBXML_DIR=${STAGING_DIR_NATIVE}${layout_exec_prefix} 
 	oe_runconf
 }
 
-#
 do_install  () {
-	install -d ${D}/usr/lib/apache2/modules 
-	install -d ${D}/etc/apache2/modules.d 
-	install -d ${D}/etc/php/apache2-php5
-	install -m 755  libs/libphp5.so ${D}/usr/lib/apache2/modules
-	install -m 644  ${FILESDIR}/70_mod_php5.conf ${D}/etc/apache2/modules.d
+	install -d ${D}${libdir}/apache2/modules
+	install -d ${D}${sysconfdir}/apache2/modules.d
+	install -d ${D}${sysconfdir}/php/apache2-php5
+	install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
+	install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
 	cat ${S}/php.ini-dist | \
 		sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
-		> ${D}/etc/php/apache2-php5/php.ini
+		> ${D}${sysconfdir}/php/apache2-php5/php.ini
+
+	install -d ${D}${bindir}
+	install -m 755 scripts/phpize ${D}${bindir}
+	install -m 755 scripts/php-config ${D}${bindir}
+
+	oe_runmake install-build install-headers INSTALL_ROOT=${D}
 }
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
+FILES_${PN} = "${libdir}/apache2 ${sysconfdir}"
+FILES_${PN}-dev += "${bindir}/phpize ${bindir}/php-config ${libdir}/php5"
+FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"
+
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb b/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb
deleted file mode 100644
index a75a742..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-include modphp5.inc
-PR ='r3'
-
-SRC_URI[md5sum] = "08e423aa314369d4392a36b3f7246afc"
-SRC_URI[sha256sum] = "3e9510ce715f28b7e6b803fcdadb73b37c83792c0b5e1e9bcb066ab972649996"
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



