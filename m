Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TdqA9-0006iq-ED
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 23:31:25 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 9B5A8D22EB;
	Wed, 28 Nov 2012 23:17:22 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2012 23:17:09 +0100
Message-Id: <1354141029-8687-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <20121128210948.0f75a586@eb-e6520>
References: <20121128210948.0f75a586@eb-e6520>
Subject: [meta-oe][PATCH] php: add apache configuration for php-fpm
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
X-List-Received-Date: Wed, 28 Nov 2012 22:31:25 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-devtools/php/php.inc                 | 8 ++++++--
 meta-oe/recipes-devtools/php/php/php-fpm-apache.conf | 6 ++++++
 meta-oe/recipes-devtools/php/php_5.3.19.bb           | 1 +
 3 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php/php-fpm-apache.conf

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 7850c1e..5e5a087 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -7,7 +7,7 @@ DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native mysql5 \
            libc-client openssl sqlite3"
 DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
 
@@ -65,6 +65,8 @@ do_install_append_pn-php() {
     rm -rf ${D}/.[a-z]*
     sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}/${sysconfdir}/pear.conf
     install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
+    install -d ${D}/${sysconfdir}/apache2/conf.d
+    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
     install -d ${D}${sysconfdir}/init.d
     sed -i 's:=/usr/sbin:=${sbindir}:g' ${S}/sapi/fpm/init.d.php-fpm
     sed -i 's:=/etc:=${sysconfdir}:g' ${S}/sapi/fpm/init.d.php-fpm
@@ -72,7 +74,7 @@ do_install_append_pn-php() {
     install -m 0755 ${S}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
 }
 
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
 
 RDEPENDS_${PN}-pear = "${PN}"
 RDEPENDS_${PN}-cli = "${PN}"
@@ -86,7 +88,9 @@ FILES_${PN}-doc += "${libdir}/php/doc"
 FILES_${PN}-cli = "${bindir}/php"
 FILES_${PN}-cgi = "${bindir}/php-cgi"
 FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm"
+FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
 CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
+CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
 INITSCRIPT_NAME_${PN}-fpm = "php-fpm"
 INITSCRIPT_PARAMS_${PN}-fpm = "defaults 60"
 FILES_${PN}-pear = "${bindir}/pear* ${bindir}/pecl ${libdir}/php/PEAR \
diff --git a/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf b/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf
new file mode 100644
index 0000000..77cdd82
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php-fpm-apache.conf
@@ -0,0 +1,6 @@
+# Taken from http://wiki.apache.org/httpd/PHP-FPM
+
+LoadModule proxy_module      lib/apache2/modules/mod_proxy.so
+LoadModule proxy_fcgi_module lib/apache2/modules/mod_proxy_fcgi.so
+
+ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/usr/share/apache2/htdocs/
diff --git a/meta-oe/recipes-devtools/php/php_5.3.19.bb b/meta-oe/recipes-devtools/php/php_5.3.19.bb
index 27baa1d..8204104 100644
--- a/meta-oe/recipes-devtools/php/php_5.3.19.bb
+++ b/meta-oe/recipes-devtools/php/php_5.3.19.bb
@@ -15,6 +15,7 @@ SRC_URI_append_pn-php += "file://iconv.patch \
             file://php_exec_native.patch \
             file://fix-fpm-cross-compile.patch \
             file://php-fpm.conf \
+            file://php-fpm-apache.conf \
             "
 
 SRC_URI[md5sum] = "e1d2a3ec7849d4b3032bd1abf1916aa4"
-- 
1.8.0



