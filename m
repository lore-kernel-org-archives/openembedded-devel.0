Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 220DC77CEF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:41:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3D7fmah021281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 00:41:48 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Apr 2017 00:41:47 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Apr 2017 03:41:46 -0400
Message-ID: <1492069306-165991-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] php: fix install error for libphp*.so
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
X-List-Received-Date: Thu, 13 Apr 2017 07:41:49 -0000
Content-Type: text/plain

Different version php have different libphp*.so, so we need to install its
corresponding libphp*.so, for example:

    php-7.1.0  libphp7.so
    php-5.6.26 libphp5.so

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc       | 6 +++++-
 meta-oe/recipes-devtools/php/php_5.6.26.bb | 2 --
 meta-oe/recipes-devtools/php/php_7.1.0.bb  | 2 --
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index d3ec9de..7f37daa 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -176,7 +176,11 @@ do_install_append_class-target() {
         install -d ${D}${libdir}/apache2/modules
         install -d ${D}${sysconfdir}/apache2/modules.d
         install -d ${D}${sysconfdir}/php/apache2-php5
-        install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
+        if [[ ${PV} == 7* ]]; then
+            install -m 755  libs/libphp7.so ${D}${libdir}/apache2/modules
+        elif [[ ${PV} == 5* ]]; then
+            install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
+        fi
         install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
         sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php5.conf
         cat ${S}/php.ini-production | \
diff --git a/meta-oe/recipes-devtools/php/php_5.6.26.bb b/meta-oe/recipes-devtools/php/php_5.6.26.bb
index c5698f8..ddc7ce3 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.26.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.26.bb
@@ -7,5 +7,3 @@ SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
            "
 SRC_URI[md5sum] = "cb424b705cfb715fc04f499f8a8cf52e"
 SRC_URI[sha256sum] = "d47aab8083a4284b905777e1b45dd7735adc53be827b29f896684750ac8b6236"
-
-PNBLACKLIST[php] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131630/"
diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb b/meta-oe/recipes-devtools/php/php_7.1.0.bb
index ee8155c..210d91f 100644
--- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
+++ b/meta-oe/recipes-devtools/php/php_7.1.0.bb
@@ -12,5 +12,3 @@ PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         ,mysql5"
 
 FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
-
-PNBLACKLIST[php] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130601/"
-- 
2.8.1


