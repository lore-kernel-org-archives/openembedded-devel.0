Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D36BE7CE12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 10:02:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46SLDx3pxHz4K
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 12:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568109761;
	bh=H9piVP+XF4a4I56lDvnzvIBObifbNcI2UHSxNEWsOFs=;
	h=From:To:Subject:Date:From;
	b=C7jSSY8PC/6e1gMJAoghAbY/5AWu9m8/5czZMohTyhxd0Ki0vgj52qEjd2+qaw/qL
	VCdlF9Vm4Edx16u1KVdbblO6vF7vCdk1D7UdDcRM24bVLcMePmrN/L/UMeItUreDLK
	GOSgKFksYOu9PcHmJrYEL16aA8EkI5gMXY8WDKODsUHAD675UtAG37yg8pNzbnc3xB
	k07VB5V95di6IHeDlIvW3Y+OdJOawKawOL0MUDeN0FJCky/jBfLus9UWG5FYvL9YE6
	6jZqu8Y1pBxFVgJVRNlaui0RS3qS4Gftld4uSWxB9tHLQZqwfXpjLjHZeeswo+UAF4
	R1Z3GDKG0EnwMDfb7vKpMpExHpapiHWiSx5HqakgyaR1yqzXx/nvwZ6bBs2DmBDDLm
	hx6udweIKoiKeINov23eaj0nUxfaN0pSbTKcDpYrPpuMDBk3PUhwP35GfsfQR7jLtf
	Ok9i1XfDH2B/GWfjaQuSNwwwfVO1Cn2trijY+7GroJBLH//K+N4dZnmd3lmltWcf60
	3eMoUAj9QQ+XyJ/5yUhGvnqzb4DwrY+aU3lRa+1Um3ucTapdQbdpnWo+z4j5TI2+a1
	QiH6oPjGEtFtarhVkANQ6wjuFujN7zhYFcxKfjJCtJSrsxOqHk7+bqWHO1bAoFYDRv
	2IKnz0oRsZ3SVhoaUUktqdpY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 13:02:40 +0300
Message-Id: <20190910100240.26965-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] php: Move more into php.inc after php5 removal
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
X-List-Received-Date: Tue, 10 Sep 2019 10:02:41 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/php/php.inc      | 10 +++++-----
 meta-oe/recipes-devtools/php/php_7.3.9.bb |  8 --------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 6e9315c1e..becf57a9f 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -74,10 +74,9 @@ PACKAGECONFIG_class-native = ""
 
 PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
 
-PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
-                        --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
-                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-                        ,--without-mysql --without-mysqli --without-pdo-mysql \
+PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
+                        --with-pdo-mysql=mysqlnd \
+                        ,--without-mysqli --without-pdo-mysql \
                         ,mysql5"
 
 PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
@@ -95,6 +94,7 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
@@ -216,7 +216,7 @@ FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
 FILES_${PN}-cli = "${bindir}/php"
 FILES_${PN}-phar = "${bindir}/phar*"
 FILES_${PN}-cgi = "${bindir}/php-cgi"
-FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service"
+FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service ${sysconfdir}/php-fpm.d/www.conf.default"
 FILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
 CONFFILES_${PN}-fpm = "${sysconfdir}/php-fpm.conf"
 CONFFILES_${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
diff --git a/meta-oe/recipes-devtools/php/php_7.3.9.bb b/meta-oe/recipes-devtools/php/php_7.3.9.bb
index 4d656da0f..23ab7ca8e 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.9.bb
@@ -17,11 +17,3 @@ SRC_URI_append_class-target = " \
 
 SRC_URI[md5sum] = "bcc37749815009c9201e4c126e1ab8ee"
 SRC_URI[sha256sum] = "a39c9709a8c9eb7ea8ac4933ef7a78b92f7e5735a405c8b8e42ee39541d963c4"
-
-PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
-                        --with-pdo-mysql=mysqlnd \
-                        ,--without-mysqli --without-pdo-mysql \
-                        ,mysql5"
-PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
-
-FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
-- 
2.17.1


