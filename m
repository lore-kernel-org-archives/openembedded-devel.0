Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 150CC77BFF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 03:34:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3D3YkbK019905
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 20:34:46 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 20:34:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Apr 2017 20:34:45 -0700
Message-ID: <20170413033445.16995-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] php: remove PNBLACKLIST
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
X-List-Received-Date: Thu, 13 Apr 2017 03:34:48 -0000
Content-Type: text/plain

It has been fixed since:
commit b5bb61163751d93672bdcdfb24dda21398e42657
Author: dengke.du@windriver.com <dengke.du@windriver.com>
Date:   Tue Mar 28 04:13:36 2017 -0400

    php: fix install failure

Also remove it for xdebug since php works now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-devtools/php/php_5.6.26.bb        | 2 --
 meta-oe/recipes-devtools/php/php_7.1.0.bb         | 2 --
 meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb | 2 --
 3 files changed, 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_5.6.26.bb b/meta-oe/recipes-devtools/php/php_5.6.26.bb
index 30a71f6..ddc7ce3 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.26.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.26.bb
@@ -7,5 +7,3 @@ SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
            "
 SRC_URI[md5sum] = "cb424b705cfb715fc04f499f8a8cf52e"
 SRC_URI[sha256sum] = "d47aab8083a4284b905777e1b45dd7735adc53be827b29f896684750ac8b6236"
-
-PNBLACKLIST[php] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131630/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb b/meta-oe/recipes-devtools/php/php_7.1.0.bb
index 99075d0..210d91f 100644
--- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
+++ b/meta-oe/recipes-devtools/php/php_7.1.0.bb
@@ -12,5 +12,3 @@ PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         ,mysql5"
 
 FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
-
-PNBLACKLIST[php] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130601/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
index 651745f..077bdc8 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
@@ -31,5 +31,3 @@ do_install() {
 
 FILES_${PN} += "${libdir}/php5/extensions/*/*.so"
 FILES_${PN}-dbg += "${libdir}/php5/extensions/*/.debug"
-
-PNBLACKLIST[xdebug] ?= "Depends on blacklisted php - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.9.0


