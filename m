Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D51D0E6C2
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 10:36:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14070.1764067014180057363
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 02:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F8lBKrmy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764067014; x=1795603014;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MmH2HxCW0tMzeJdJtyyGKSw/UfybSdqIaU7GV5NTcME=;
  b=F8lBKrmyWaVuOIV+Lg3ExNNVPv2e0zo69d3aNRFE+qtelVViefFlS5Ig
   enY4xpH6lcQDduo6uDEUiq5UBBJ/3iWvhGht73+gUA5nWWGvH8ADnKXHc
   GRD9Sr0N+MTxuJehjHu8MTovHZ5Xg/W7hsxjtnWebTr8ZcTETk/BCeLfj
   fNVR3/AK6IE2PMPjA7Wea+vJaj6Lh9sVFcwqunKWGSZmWaW7k9U5HHsOs
   BIfmzuUmcXrIrLbc6OK1+hA3A1KiDk3bMbHTh93PA0fH67U4hy1Wrdvi5
   swKgVOthl7egkVmKw/bgiYG0MTEzUgiQSQsmYSVOZj87ejjkmMQClZH6c
   Q==;
X-CSE-ConnectionGUID: Egx/EJTyQoGP559htOC8fw==
X-CSE-MsgGUID: LE2vm5dYS6G9DxRa50KQQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="208899765"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="208899765"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 19:36:50 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DE4C41002B9F
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 10:36:49 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9E157C02F21
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 10:36:49 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 92E2518004FA
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 10:36:47 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] php: upgrade 8.4.15 -> 8.5.0
Date: Tue, 25 Nov 2025 18:36:44 +0800
Message-ID: <20251125103644.3585-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 10:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122053

1. Changelog:
  https://github.com/php/php-src/releases/tag/php-8.5.0

2. Remove opcache-related options as it was not in 8.5.0.

3. Fix FILES:${PN}-fpm to resolve following error:
  ERROR: php-8.5.0-r0 do_package: QA Issue: php: Files/directories were installed but not shipped in any package:
  /usr/share/php
  /usr/share/php/fpm
  /usr/share/php/fpm/status.html
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../php/{php_8.4.15.bb => php_8.5.0.bb}             | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.15.bb => php_8.5.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.15.bb b/meta-oe/recipes-devtools/php/php_8.5.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/php/php_8.4.15.bb
rename to meta-oe/recipes-devtools/php/php_8.5.0.bb
index 629eef0519..412ffd9f06 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.15.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.0.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "b7155bdd498d60d63e4bc320dc224863976d31b5bd9339699726c961255a3197"
+SRC_URI[sha256sum] = "cd16cb045b34a6cec6a83008e1b335f365c7a832fcc483df82308664c6d021f9"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
@@ -91,7 +91,7 @@ EXTRA_OECONF:class-native = " \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-PACKAGECONFIG ??= "mysql sqlite3 opcache openssl \
+PACKAGECONFIG ??= "mysql sqlite3 openssl \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
 "
 PACKAGECONFIG:class-native = ""
@@ -104,7 +104,6 @@ PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
                         --with-pdo-mysql=mysqlnd \
                         ,--without-mysqli --without-pdo-mysql \
                         ,mysql5"
-PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[pam] = ",,libpam"
 PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
@@ -230,13 +229,12 @@ php_sysroot_preprocess () {
 
 MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
 
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
 
 RDEPENDS:${PN} += "libgcc"
 RDEPENDS:${PN}-pear = "${PN}"
 RDEPENDS:${PN}-cli = "${PN}"
 RDEPENDS:${PN}-modphp = "${PN} apache2"
-RDEPENDS:${PN}-opcache = "${PN}"
 
 ALLOW_EMPTY:${PN} = "1"
 
@@ -244,9 +242,7 @@ INITSCRIPT_PACKAGES = "${PN}-fpm"
 inherit update-rc.d
 
 # WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: ELF binary /usr/libexec/apache2/modules/libphp.so has relocations in .text [textrel]
-#WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php-opcache: ELF binary /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has relocations in .text [textrel]
 INSANE_SKIP:${PN}:append:x86 = " textrel"
-INSANE_SKIP:${PN}-opcache:append:x86 = " textrel"
 
 FILES:${PN}-dbg =+ "${bindir}/.debug \
                     ${libexecdir}/apache2/modules/.debug"
@@ -254,7 +250,7 @@ FILES:${PN}-doc += "${PHP_LIBDIR}/php/doc"
 FILES:${PN}-cli = "${bindir}/php"
 FILES:${PN}-phpdbg = "${bindir}/phpdbg"
 FILES:${PN}-cgi = "${bindir}/php-cgi"
-FILES:${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${sysconfdir}/php-fpm.d/www.conf.default"
+FILES:${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/php/fpm ${sysconfdir}/init.d/php-fpm ${sysconfdir}/php-fpm.d/www.conf.default"
 FILES:${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
 CONFFILES:${PN}-fpm = "${sysconfdir}/php-fpm.conf"
 CONFFILES:${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
@@ -273,7 +269,6 @@ FILES:${PN}-dev = "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/phpize \
                 ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap \
                 ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
 FILES:${PN}-staticdev += "${PHP_LIBDIR}/extensions/*/*.a"
-FILES:${PN}-opcache = "${PHP_LIBDIR}/extensions/*/opcache${SOLIBSDEV}"
 FILES:${PN} = "${PHP_LIBDIR}/php"
 FILES:${PN} += "${bindir} ${libexecdir}/apache2"
 
-- 
2.43.0


