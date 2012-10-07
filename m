Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TKp0f-0007mp-U3
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 13:27:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Oct 2012 04:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,547,1344236400"; d="scan'208";a="230911608"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.60])
	by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2012 04:13:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 12:13:50 +0100
Message-Id: <a86dabe878054ac4de96168742d293ed70d4b121.1349608252.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349608252.git.paul.eggleton@linux.intel.com>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349608252.git.paul.eggleton@linux.intel.com>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 2/3] modphp: fix default php.ini & add PACKAGECONFIG
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
X-List-Received-Date: Sun, 07 Oct 2012 11:27:02 -0000

* Add "mysql" PACKAGECONFIG option
* Add "pgsql" PACKAGECONFIG option (untested)
* Use the correct template php.ini filename so that we actually get
  some content in the default file

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc      |   34 ++++++++++----------
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb |    2 +-
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 82b5ce1..344eb31 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -20,27 +20,27 @@ CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
                 --enable-maintainer-zts \
                 --without-mysql \
-		--enable-force-cgi-redirect \
-		--disable-cgi \
-		--disable-cli \
-		--disable-pdo \
-		--without-pear \
-		--without-iconv \
-		--disable-ipv6 \
-		--disable-xml \
-		--disable-xmlreader \
-		--disable-xmlwriter \
-		--disable-simplexml \
-		--disable-libxml \
-		--disable-dom \
+                --enable-force-cgi-redirect \
+                --disable-cgi \
+                --disable-cli \
+                --disable-pdo \
+                --without-pear \
+                --without-iconv \
+                --disable-ipv6 \
+                --disable-xml \
+                --disable-xmlreader \
+                --disable-xmlwriter \
+                --disable-simplexml \
+                --disable-libxml \
+                --disable-dom \
                 --disable-rpath \
                 --libdir=${libdir}/php5 \
                 --with-zlib --with-zlib-dir=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-config-file-path=${sysconfdir}/php/apache2-php5"
 
-# to get postgres support, add it to the DEPENDS above
-# and uncomment this line.  similar for mysql
-#EXTRA_OECONF += " --with-pgsql=${STAGING_DIR_HOST}${layout_exec_prefix}"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config,--without-mysqli,mysql5"
+PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,mysql5"
 
 acpaths = ""
 
@@ -60,7 +60,7 @@ do_install  () {
 	install -d ${D}${sysconfdir}/php/apache2-php5
 	install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
 	install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
-	cat ${S}/php.ini-dist | \
+	cat ${S}/php.ini-production | \
 		sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
 		> ${D}${sysconfdir}/php/apache2-php5/php.ini
 
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb b/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
index b6a5126..707f5f9 100644
--- a/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
+++ b/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb
@@ -1,5 +1,5 @@
 include modphp5.inc
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "7caac4f71e2f21426c11ac153e538392"
 SRC_URI[sha256sum] = "c8075b6e83c5db0d26cc8426a7456856421089a76c963813b1fcac3ced041cb3"
-- 
1.7.9.5



