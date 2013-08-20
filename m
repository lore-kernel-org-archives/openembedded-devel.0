Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 258E76B7CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:02:20 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Aug 2013 16:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,923,1367996400"; d="scan'208";a="284568330"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.209])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Aug 2013 16:02:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2013 00:01:48 +0100
Message-Id: <91bac2359f8b5be559a90cb289d63eceb1da4515.1377039620.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377039620.git.paul.eggleton@linux.intel.com>
References: <cover.1377039620.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377039620.git.paul.eggleton@linux.intel.com>
References: <cover.1377039620.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe,meta-webserver][PATCH 1/4] apache2: update to 2.4.6
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
X-List-Received-Date: Tue, 20 Aug 2013 23:02:20 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../{apache2-2.4.4 => apache2-2.4.6}/apache-configure_perlbin.patch   | 0
 .../{apache2-2.4.4 => apache2-2.4.6}/apache-ssl-ltmain-rpath.patch    | 0
 .../apache2/{apache2-2.4.4 => apache2-2.4.6}/fix-libtool-name.patch   | 0
 .../{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.1-corelimit.patch      | 0
 .../{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.1-selinux.patch        | 0
 .../apache2/{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.4-export.patch | 0
 .../{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.4-r1332643.patch       | 0
 .../replace-lynx-to-curl-in-apachectl-script.patch                    | 0
 .../apache2/{apache2-2.4.4 => apache2-2.4.6}/server-makefile.patch    | 0
 .../apache2/{apache2-native_2.4.4.bb => apache2-native_2.4.6.bb}      | 4 ++--
 .../recipes-httpd/apache2/{apache2_2.4.4.bb => apache2_2.4.6.bb}      | 4 ++--
 11 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/apache-configure_perlbin.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/apache-ssl-ltmain-rpath.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/fix-libtool-name.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.1-corelimit.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.1-selinux.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.4-export.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/httpd-2.4.4-r1332643.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/replace-lynx-to-curl-in-apachectl-script.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.4 => apache2-2.4.6}/server-makefile.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.4.bb => apache2-native_2.4.6.bb} (89%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.4.bb => apache2_2.4.6.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/apache-configure_perlbin.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.4/apache-configure_perlbin.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.6/apache-configure_perlbin.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/apache-ssl-ltmain-rpath.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/apache-ssl-ltmain-rpath.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.4/apache-ssl-ltmain-rpath.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.6/apache-ssl-ltmain-rpath.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/fix-libtool-name.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/fix-libtool-name.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.4/fix-libtool-name.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.6/fix-libtool-name.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.1-corelimit.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.1-corelimit.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.1-corelimit.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.1-corelimit.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.1-selinux.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.1-selinux.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.1-selinux.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.1-selinux.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-export.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-export.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-export.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-export.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-r1332643.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-r1332643.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/replace-lynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/replace-lynx-to-curl-in-apachectl-script.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.4/replace-lynx-to-curl-in-apachectl-script.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.6/replace-lynx-to-curl-in-apachectl-script.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/server-makefile.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/server-makefile.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.4/server-makefile.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.6/server-makefile.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.4.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.6.bb
similarity index 89%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.4.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.6.bb
index 2855648..6efd469 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.4.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.6.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
-SRC_URI[md5sum] = "0e712ee2119cd798c8ae39d5f11a9206"
-SRC_URI[sha256sum] = "92aabddeca76a4ac7330b143df1407bbf35574c7291c15172238ac598d97655c"
+SRC_URI[md5sum] = "ea5e361ca37b8d7853404419dd502efe"
+SRC_URI[sha256sum] = "dc9f3625ebc08bea55eeb0d16e71fba656f252e6cd0aa244ee7806dc3b022fea"
 
 do_configure () {
     ./configure --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
index 8c9416a..f230f94 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://init"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
-SRC_URI[md5sum] = "0e712ee2119cd798c8ae39d5f11a9206"
-SRC_URI[sha256sum] = "92aabddeca76a4ac7330b143df1407bbf35574c7291c15172238ac598d97655c"
+SRC_URI[md5sum] = "ea5e361ca37b8d7853404419dd502efe"
+SRC_URI[sha256sum] = "dc9f3625ebc08bea55eeb0d16e71fba656f252e6cd0aa244ee7806dc3b022fea"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
1.8.1.2


