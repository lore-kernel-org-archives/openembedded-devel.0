Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DED746FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:49:06 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id e201so28843192wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3Ur5E+PzqM/n98bVUFCWh/iaOLueTD2G+39SYBKtbac=;
	b=M3TOGHIi2/hHKovCZ4YWEtkRy23F6lbHUWG61GWrw2rp9YySR1cBMX/QTEjU8L+7Ha
	gRIpXn4DHBchDf7kwG1nuPk1INOStooGMw/jFWU0CNIBFLhrln7fhTZj4iwXdrd2vUyL
	tEaGW7AIEJQ132jrU53jwdztV0w7HQlDfydXQWZcWCPkdE7Mt7JQPgyWaYiWJZCCDsL4
	P+5ndKYpoU0pqvh1Zm91hpq6+SGrydVrmHfZF++C24lomCxOxjAgMZb5x3z5WzfuzVF8
	+yRyxKTT30bcHER5KkSTXwh4TuXqFWa0wd4U08TndlW56v24w6Tm1l5/OreW/xdeBwfe
	oLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3Ur5E+PzqM/n98bVUFCWh/iaOLueTD2G+39SYBKtbac=;
	b=ZbyaN0bLoPEpkAxkwuFt95/LmphPkssvSOjH9at8OcQ51HQcbkYoY8YiZiVdj3QaiQ
	d6LAsp2MZ8+284PBDNndNXz4S/YqoXBB/LJETq1fetTsi5HQe9eDE51MNKRxnCk0mrEo
	BBESrVUWUWF6pNVrO/kWr0HdAWQOXVYLf1Nze/eyKN14h/BvYXB+QAMVMMDGHNe9KXvq
	ZMrYxX9S2dQcu1OOuKzGjSTwzx3e53fnvuv3dl+nuIotZAsQhde1Kv2R1CuTNAuhZW3C
	577/m4Ll2Q1IKECRpjSF8gn7dqzZNwRxZLZemcCf2x0mguHfpU4IOh0u/EmIisogNw8v
	lMXA==
X-Gm-Message-State: AOPr4FVRkEbyXv0q8IT+p+xUc2jTXMBOL3XM7A/6HTxbs8HGIFYp12JZsspFnPI84Px3JW5+
X-Received: by 10.194.123.65 with SMTP id ly1mr22227342wjb.125.1461354546453; 
	Fri, 22 Apr 2016 12:49:06 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm4875842wmf.8.2016.04.22.12.49.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:49:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 20:48:51 +0100
Message-Id: <1461354536-23240-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
References: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/8] meta-webserver: use bb.utils.contains() instead of base_contains()
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
X-List-Received-Date: Fri, 22 Apr 2016 19:49:08 -0000

base_contains() is a compatibility wrapper and may warn in the future, so
replace all instances with bb.utils.contains().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb   | 4 ++--
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 4 ++--
 meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb    | 2 +-
 meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb      | 2 +-
 meta-webserver/recipes-httpd/nginx/nginx.inc             | 2 +-
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb  | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
index df25034..81151d1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
@@ -57,7 +57,7 @@ EXTRA_OECONF = "--enable-ssl \
     --enable-mpms-shared \
     ac_cv_have_threadsafe_pollset=no"
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
 
@@ -86,7 +86,7 @@ do_install_append() {
     # Set 'ServerName' to fix error messages when restart apache service
     sed -i 's/^#ServerName www.example.com/ServerName localhost/' ${D}/${sysconfdir}/${BPN}/httpd.conf
 
-    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then 
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then 
         install -d ${D}${sysconfdir}/tmpfiles.d/
         install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
     fi
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 451e97c..5287ea4 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 PR = "r9"
 
-DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "libpcre openssl mysql5 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://www.cherokee-project.de/mirrors/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
            file://cherokee.init \
@@ -26,7 +26,7 @@ PACKAGECONFIG[geoip] = "--with-geoip,--without-geoip,geoip"
 
 EXTRA_OECONF = "--disable-static \
                 --disable-nls \
-               ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+               ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
                --with-wwwroot=${localstatedir}/www/cherokee \
 "
 
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
index 31293e4..7062174 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
@@ -48,7 +48,7 @@ do_install_append() {
     # by default if php is installed
     echo "Server = ${bindir}/php-cgi ; 2 ; 127.0.0.1:2005 ; nobody:nobody ; ${sysconfdir}/php/hiawatha-php5/php.ini" >> ${D}${sysconfdir}/hiawatha/php-fcgi.conf
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}/${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
     fi
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
index 22d88f8..be8ed37 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
@@ -58,7 +58,7 @@ do_install_append() {
     mkdir -p ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system
     fi
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 2169b67..ebf926a 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -66,7 +66,7 @@ do_configure () {
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 	rm -fr ${D}${localstatedir}/run ${D}/run
-	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/${BPN} - - - -" \
 		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
index fe860ec..562ecd0 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
@@ -46,7 +46,7 @@ do_install() {
     install -m 0644 ${WORKDIR}/nhttpd.conf ${D}${sysconfdir}
     install -m 0755 ${WORKDIR}/nostromo ${D}${sysconfdir}/init.d
     install -D -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/nostromo
-    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -D -m 0644 ${WORKDIR}/tmpfiles.conf ${D}${sysconfdir}/tmpfiles.d/nostromo.conf
     fi
     install -m 0644 htdocs/index.html ${D}${localstatedir}/nostromo/htdocs/index.html
-- 
2.8.0.rc3


