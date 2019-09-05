Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05ABF7F2E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 22:39:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x85Mct2k009934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Sep 2019 15:39:06 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 5 Sep 2019 15:38:45 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Sep 2019 06:38:39 +0800
Message-ID: <20190905223839.33419-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905223839.33419-1-kai.kang@windriver.com>
References: <20190905223839.33419-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][Patch 2/2] php: sync with apache2's change
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
X-List-Received-Date: Thu, 05 Sep 2019 22:39:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It redefines apache2's libexecdir. Update php to sync with that change.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 4c0617c49..d738d2d93 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -172,10 +172,8 @@ do_install_append_class-target() {
     done
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
-        install -d ${D}${libdir}/apache2/modules
         install -d ${D}${sysconfdir}/apache2/modules.d
         install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
-        install -m 755  libs/libphp${PHP_MAJOR_VERSION}.so ${D}${libdir}/apache2/modules
         install -m 644  ${WORKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf ${D}${sysconfdir}/apache2/modules.d
         sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php${PHP_MAJOR_VERSION}.conf
         cat ${S}/php.ini-production | \
@@ -211,7 +209,7 @@ INITSCRIPT_PACKAGES = "${PN}-fpm"
 inherit update-rc.d
 
 FILES_${PN}-dbg =+ "${bindir}/.debug \
-                    ${libdir}/apache2/modules/.debug"
+                    ${libexecdir}/apache2/modules/.debug"
 FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
 FILES_${PN}-cli = "${bindir}/php"
 FILES_${PN}-phar = "${bindir}/phar*"
@@ -237,7 +235,7 @@ FILES_${PN}-dev = "${includedir}/php ${PHP_LIBDIR}/build ${bindir}/phpize \
 FILES_${PN}-staticdev += "${PHP_LIBDIR}/extensions/*/*.a"
 FILES_${PN}-opcache = "${PHP_LIBDIR}/extensions/*/opcache${SOLIBSDEV}"
 FILES_${PN} = "${PHP_LIBDIR}/php"
-FILES_${PN} += "${bindir}"
+FILES_${PN} += "${bindir} ${libexecdir}/apache2"
 
 SUMMARY_${PN}-modphp = "PHP module for the Apache HTTP server"
 FILES_${PN}-modphp = "${libdir}/apache2 ${sysconfdir}"
-- 
2.17.1


