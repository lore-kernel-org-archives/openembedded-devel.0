Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OvCRf-0004kC-6v
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 19:04:15 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OvCQt-00037R-3R from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 10:03:07 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 13 Sep 2010 10:03:06 -0700
Received: from localhost.localdomain ([172.30.80.178]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 13 Sep 2010 11:03:05 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 10:02:56 -0700
Message-Id: <1284397376-29968-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 13 Sep 2010 17:03:05.0991 (UTC)
	FILETIME=[88AB2170:01CB5365]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] apr, apr-util: Remove 1.2.* versions
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
X-List-Received-Date: Mon, 13 Sep 2010 17:04:17 -0000

These don't patch and aren't pinned by anyone.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/apr/apr-util_1.2.12.bb |   33 ---------------------------------
 recipes/apr/apr-util_1.2.7.bb  |   28 ----------------------------
 recipes/apr/apr_1.2.12.bb      |   36 ------------------------------------
 recipes/apr/apr_1.2.7.bb       |   33 ---------------------------------
 4 files changed, 0 insertions(+), 130 deletions(-)
 delete mode 100644 recipes/apr/apr-util_1.2.12.bb
 delete mode 100644 recipes/apr/apr-util_1.2.7.bb
 delete mode 100644 recipes/apr/apr_1.2.12.bb
 delete mode 100644 recipes/apr/apr_1.2.7.bb

diff --git a/recipes/apr/apr-util_1.2.12.bb b/recipes/apr/apr-util_1.2.12.bb
deleted file mode 100644
index 18e4ad3..0000000
--- a/recipes/apr/apr-util_1.2.12.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) companion library"
-SECTION = "libs"
-DEPENDS = "apr expat gdbm"
-LICENSE = "Apache License, Version 2.0"
-
-PR = "r4"
-
-inherit autotools lib_package binconfig
-
-# apache mirrors?
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
-           file://configure_fixes.patch"
-
-EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS} --with-dbm=gdbm \
-		--with-gdbm=${STAGING_DIR_HOST}${layout_prefix} \
-		--without-sqlite2 \
-		--without-sqlite3 \
-		--with-expat=${STAGING_DIR_HOST}${layout_prefix}"
-
-
-OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
-
-LIBTOOL = "${HOST_SYS}-libtool"
-EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
-
-do_configure_prepend() {
-	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
-	echo "AC_PROG_LIBTOOL" >> ${S}/configure.in
-	libtoolize --force
-}
-
-SRC_URI[md5sum] = "e292942e22edd21b68609086352212e4"
-SRC_URI[sha256sum] = "7d70ff17bec733bdb04a6653a8e9c15ab7d88429dac91a4ae58c1db5caaee07f"
diff --git a/recipes/apr/apr-util_1.2.7.bb b/recipes/apr/apr-util_1.2.7.bb
deleted file mode 100644
index 282b55e..0000000
--- a/recipes/apr/apr-util_1.2.7.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) companion library"
-SECTION = "libs"
-DEPENDS = "apr expat gdbm"
-LICENSE = "Apache License, Version 2.0"
-
-PR = "r3"
-
-# apache mirrors?
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
-           file://configure_fixes.patch"
-
-EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS} --with-dbm=gdbm \
-		--with-gdbm=${STAGING_DIR_HOST}${layout_prefix} \
-		--without-sqlite2 \
-		--without-sqlite3 \
-		--with-expat=${STAGING_DIR_HOST}${layout_prefix}"
-
-
-inherit autotools lib_package binconfig
-
-OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
-
-do_configure_prepend () {
-	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
-}
-
-SRC_URI[md5sum] = "c3702668a640be1695956115857ec22e"
-SRC_URI[sha256sum] = "8cd84eb2031a91572e1be2975f4171730a9be72c4cd88718c4c40ac7dc4fd7d3"
diff --git a/recipes/apr/apr_1.2.12.bb b/recipes/apr/apr_1.2.12.bb
deleted file mode 100644
index 775578a..0000000
--- a/recipes/apr/apr_1.2.12.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) library"
-SECTION = "libs"
-LICENSE = "Apache License, Version 2.0"
-
-PR = "r2"
-
-# apache mirrors?
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
-           file://configure_fixes.patch"
-
-inherit autotools lib_package binconfig
-
-OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
-
-LIBTOOL = "${HOST_SYS}-libtool"
-EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
-
-do_configure_prepend() {
-	rm -f ${S}/build/libtool.m4
-}
-
-do_stage() {
-  autotools_stage_all
-  install -d ${STAGING_DATADIR}/apr
-  cp ${S}/build/apr_rules.mk ${STAGING_DATADIR}/apr/
-  sed -i s,apr_builddir=.*,apr_builddir=,g ${STAGING_DATADIR}/apr/apr_rules.mk
-  sed -i s,apr_builders=.*,apr_builders=,g ${STAGING_DATADIR}/apr/apr_rules.mk
-  sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${TARGET_PREFIX}libtool,g ${STAGING_DATADIR}/apr/apr_rules.mk
-  sed -i s,\$\(apr_builders\),${STAGING_DATADIR}/apr/,g ${STAGING_DATADIR}/apr/apr_rules.mk
-  cp ${S}/build/mkdir.sh ${STAGING_DATADIR}/apr/
-  cp ${S}/build/make_exports.awk ${STAGING_DATADIR}/apr/
-  cp ${S}/build/make_var_export.awk ${STAGING_DATADIR}/apr/
-}
-
-SRC_URI[md5sum] = "c5da94517e3918f0f2b2e0a05f56aa21"
-SRC_URI[sha256sum] = "db22b34c0bfcab8546632475c6de2c63990214fb8ae5e2ada565410a85e22134"
diff --git a/recipes/apr/apr_1.2.7.bb b/recipes/apr/apr_1.2.7.bb
deleted file mode 100644
index cfb6e30..0000000
--- a/recipes/apr/apr_1.2.7.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) library"
-SECTION = "libs"
-LICENSE = "Apache License, Version 2.0"
-
-PR = "r2"
-
-# apache mirrors?
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
-           file://configure_fixes.patch"
-
-inherit autotools lib_package binconfig
-
-OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
-
-do_configure() {
-  oe_runconf
-}
-
-do_stage() {
-  autotools_stage_all
-  install -d ${STAGING_DATADIR}/apr
-  cp ${S}/build/apr_rules.mk ${STAGING_DATADIR}/apr/
-  sed -i s,apr_builddir=.*,apr_builddir=,g ${STAGING_DATADIR}/apr/apr_rules.mk
-  sed -i s,apr_builders=.*,apr_builders=,g ${STAGING_DATADIR}/apr/apr_rules.mk
-  sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${TARGET_PREFIX}libtool,g ${STAGING_DATADIR}/apr/apr_rules.mk
-  sed -i s,\$\(apr_builders\),${STAGING_DATADIR}/apr/,g ${STAGING_DATADIR}/apr/apr_rules.mk
-  cp ${S}/build/mkdir.sh ${STAGING_DATADIR}/apr/
-  cp ${S}/build/make_exports.awk ${STAGING_DATADIR}/apr/
-  cp ${S}/build/make_var_export.awk ${STAGING_DATADIR}/apr/
-}
-
-SRC_URI[md5sum] = "e77887dbafc515c63feac84686bcb3bc"
-SRC_URI[sha256sum] = "384437f3c4eb7d53ad27fdadce6cbc295ef16653b7f7739a480d91c784082ec9"
-- 
1.6.3.3



