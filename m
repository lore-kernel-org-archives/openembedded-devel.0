Received: from 1.27.mail-out.ovh.net ([46.105.60.43] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pyqc6-00015h-F1
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 20:06:02 +0100
Received: (qmail 17801 invoked by uid 503); 13 Mar 2011 19:51:13 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 13 Mar 2011 19:51:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Mar 2011 20:57:29 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Mar 2011 20:57:27 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Mar 2011 19:58:53 +0100
Message-Id: <1300042739-17381-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300042739-17381-1-git-send-email-eric@eukrea.com>
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1411597008858099019
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 3/9] apr: remove old versions
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
X-List-Received-Date: Sun, 13 Mar 2011 19:06:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

recent apr was not building, others are not pinned anywhere.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/apr/apr-1.3.5/cleanup.patch    |   42 --------------------------------
 recipes/apr/apr-util_0.9.12.bb         |   22 ----------------
 recipes/apr/apr-util_1.3.4.bb          |   38 ----------------------------
 recipes/apr/apr_0.9.12.bb              |   16 ------------
 recipes/apr/apr_1.3.12.bb              |   36 ---------------------------
 recipes/apr/apr_1.3.3.bb               |   35 --------------------------
 recipes/apr/apr_1.3.5.bb               |   35 --------------------------
 recipes/apr/files/gen_uri_delims.patch |    7 -----
 recipes/apr/files/uri_delims.h         |   16 ------------
 9 files changed, 0 insertions(+), 247 deletions(-)
 delete mode 100644 recipes/apr/apr-1.3.5/cleanup.patch
 delete mode 100644 recipes/apr/apr-util_0.9.12.bb
 delete mode 100644 recipes/apr/apr-util_1.3.4.bb
 delete mode 100644 recipes/apr/apr_0.9.12.bb
 delete mode 100644 recipes/apr/apr_1.3.12.bb
 delete mode 100644 recipes/apr/apr_1.3.3.bb
 delete mode 100644 recipes/apr/apr_1.3.5.bb
 delete mode 100644 recipes/apr/files/gen_uri_delims.patch
 delete mode 100644 recipes/apr/files/uri_delims.h

diff --git a/recipes/apr/apr-1.3.5/cleanup.patch b/recipes/apr/apr-1.3.5/cleanup.patch
deleted file mode 100644
index 53623a2..0000000
--- a/recipes/apr/apr-1.3.5/cleanup.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Index: apr-1.3.5/build/buildcheck.sh
-===================================================================
---- apr-1.3.5.orig/build/buildcheck.sh	2009-02-23 20:37:18.000000000 -0700
-+++ apr-1.3.5/build/buildcheck.sh	2010-09-09 11:09:08.000000000 -0700
-@@ -31,36 +31,4 @@
- else
- echo "buildconf: autoconf version $ac_version (ok)"
- fi
--
--# Sample libtool --version outputs:
--# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)
--# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
--# output is multiline from 1.5 onwards
--
--# Require libtool 1.4 or newer
--libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
--lt_pversion=`$libtool --version 2>/dev/null|sed -e 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
--if test -z "$lt_pversion"; then
--echo "buildconf: libtool not found."
--echo "           You need libtool version 1.4 or newer installed"
--echo "           to build APR from SVN."
--exit 1
--fi
--lt_version=`echo $lt_pversion|sed -e 's/\([a-z]*\)$/.\1/'`
--IFS=.; set $lt_version; IFS=' '
--lt_status="good"
--if test "$1" = "1"; then
--   if test "$2" -lt "4"; then
--      lt_status="bad"
--   fi
--fi
--if test $lt_status = "good"; then
--   echo "buildconf: libtool version $lt_pversion (ok)"
--   exit 0
--fi
--
--echo "buildconf: libtool version $lt_pversion found."
--echo "           You need libtool version 1.4 or newer installed"
--echo "           to build APR from SVN."
--
--exit 1
-+exit 0
diff --git a/recipes/apr/apr-util_0.9.12.bb b/recipes/apr/apr-util_0.9.12.bb
deleted file mode 100644
index 89c9a93..0000000
--- a/recipes/apr/apr-util_0.9.12.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) companion library"
-SECTION = "libs"
-DEPENDS = "apr expat gdbm"
-LICENSE = "Apache"
-HOMEPAGE = "http://apr.apache.org"
-PR = "r1"
-
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
-           file://gen_uri_delims.patch \
-           file://uri_delims.h"
-
-EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS} --with-dbm=gdbm --with-gdbm=${STAGING_DIR_HOST}${layout_prefix} --with-expat=${STAGING_DIR_HOST}${layout_prefix}"
-
-inherit autotools lib_package binconfig
-
-do_configure() {
-	cp ${S}/../uri_delims.h ${S}/uri/.
-	oe_runconf
-}
-
-SRC_URI[md5sum] = "8e9cc71a1303b67b3278fbeab9799f2e"
-SRC_URI[sha256sum] = "5768fcc4d38fa6f811b0a89e2ef450d0f52688ff9263e548819adb096fbfc9c3"
diff --git a/recipes/apr/apr-util_1.3.4.bb b/recipes/apr/apr-util_1.3.4.bb
deleted file mode 100644
index a2c8211..0000000
--- a/recipes/apr/apr-util_1.3.4.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) companion library"
-SECTION = "libs"
-DEPENDS = "apr expat gdbm"
-LICENSE = "Apache License, Version 2.0"
-
-PR = "r7"
-
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
-           file://configfix.patch \
-           file://configure_fixes.patch"
-
-EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
-		--with-dbm=gdbm \
-		--with-gdbm=${STAGING_DIR_HOST}${layout_prefix} \
-		--without-sqlite2 \
-		--without-sqlite3 \
-		--without-pgsql \
-		--with-expat=${STAGING_DIR_HOST}${layout_prefix}"
-
-
-inherit autotools lib_package binconfig
-
-OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
-
-do_configure_prepend() {
-	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
-	echo "AC_PROG_LIBTOOL" >> ${S}/configure.in
-}
-
-do_configure_append() {
-	sed -i -e  s:apr_builders=/usr/share/build-1:apr_builders=${STAGING_DATADIR}/build-1:g ${S}/build/rules.mk
-	sed -i /^LIBTOOL/d ${S}/build/rules.mk
-	echo LIBTOOL="${HOST_SYS}-libtool --tag=CC" >> ${S}/build/rules.mk
-}
-
-
-SRC_URI[md5sum] = "a10e2ca150ff07f484c724c36142211f"
-SRC_URI[sha256sum] = "3f07ffdb18fb853290c9b83e82cd5cae66b8fbc357bd391e846c0afdd24fed7e"
diff --git a/recipes/apr/apr_0.9.12.bb b/recipes/apr/apr_0.9.12.bb
deleted file mode 100644
index 8748757..0000000
--- a/recipes/apr/apr_0.9.12.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) library"
-SECTION = "libs"
-LICENSE = "Apache"
-HOMEPAGE = "http://apr.apache.org"
-PR = "r1"
-
-SRC_URI = "${APACHE_MIRROR}/apr/apr-${PV}.tar.bz2"
-
-inherit autotools lib_package binconfig
-
-do_configure() {
-	oe_runconf
-}
-
-SRC_URI[md5sum] = "63fef787c263bd8025c6ab6a6cecdd01"
-SRC_URI[sha256sum] = "cd1da2119dd812127ab6e6e8cbb954d9b74fe01ec744364ba79c9845865ffdaa"
diff --git a/recipes/apr/apr_1.3.12.bb b/recipes/apr/apr_1.3.12.bb
deleted file mode 100644
index 38ed343..0000000
--- a/recipes/apr/apr_1.3.12.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) library"
-SECTION = "libs"
-LICENSE = "Apache License, Version 2.0"
-
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
-           file://configure_fixes.patch \
-#	   file://cleanup.patch \
-           file://configfix.patch"
-
-SRC_URI[md5sum] = "6f19af60a161480cc16bb6adb9820040"
-SRC_URI[sha256sum] = "cdc5eff894239344cb35e06f10e8d39a5b46d4250750c6c4ac4058ffbfb6ae80"
-
-inherit autotools lib_package binconfig
-
-OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
-
-do_configure_prepend() {
-	cd ${S}
-	echo "top_builddir=@apr_builddir@" >> build/apr_rules.mk.in
-	cp build/libtool.m4 .
-	./buildconf
-}
-
-FILES_${PN}-dev += "${datadir}/build-1/* ${libdir}/apr.exp"
-
-do_install_append() {
-	install -d ${D}${datadir}/apr
-	cp ${S}/build/apr_rules.mk ${D}${datadir}/apr/
-	sed -i s,apr_builddir=.*,apr_builddir=,g ${D}${datadir}/apr/apr_rules.mk
-	sed -i s,apr_builders=.*,apr_builders=,g ${D}${datadir}/apr/apr_rules.mk
-	sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${HOST_SYS}-libtool,g ${D}${datadir}/apr/apr_rules.mk
-	sed -i s,\$\(apr_builders\),${D}${datadir}/apr/,g ${D}${datadir}/apr/apr_rules.mk
-	cp ${S}/build/mkdir.sh ${D}${datadir}/apr/
-	cp ${S}/build/make_exports.awk ${D}${datadir}/apr/
-	cp ${S}/build/make_var_export.awk ${D}${datadir}/apr/
-}
diff --git a/recipes/apr/apr_1.3.3.bb b/recipes/apr/apr_1.3.3.bb
deleted file mode 100644
index 22e399d..0000000
--- a/recipes/apr/apr_1.3.3.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) library"
-SECTION = "libs"
-LICENSE = "Apache License, Version 2.0"
-
-PR = "r4"
-
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
-           file://configure_fixes.patch \
-	   file://cleanup.patch \
-           file://configfix.patch"
-
-inherit autotools lib_package binconfig
-
-OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
-
-do_configure_prepend() {
-	cd ${S}
-	./buildconf
-}
-
-do_stage() {
-	autotools_stage_all
-	install -d ${STAGING_DATADIR}/apr
-	cp ${S}/build/apr_rules.mk ${STAGING_DATADIR}/apr/
-	sed -i s,apr_builddir=.*,apr_builddir=,g ${STAGING_DATADIR}/apr/apr_rules.mk
-	sed -i s,apr_builders=.*,apr_builders=,g ${STAGING_DATADIR}/apr/apr_rules.mk
-	sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${HOST_SYS}-libtool,g ${STAGING_DATADIR}/apr/apr_rules.mk
-	sed -i s,\$\(apr_builders\),${STAGING_DATADIR}/apr/,g ${STAGING_DATADIR}/apr/apr_rules.mk
-	cp ${S}/build/mkdir.sh ${STAGING_DATADIR}/apr/
-	cp ${S}/build/make_exports.awk ${STAGING_DATADIR}/apr/
-	cp ${S}/build/make_var_export.awk ${STAGING_DATADIR}/apr/
-}
-
-SRC_URI[md5sum] = "2090c21dee4f0eb1512604127dcd158f"
-SRC_URI[sha256sum] = "d95f3b78366c86317043304864bb08cb836312c87ea7d142a4c02154e7e0dd37"
diff --git a/recipes/apr/apr_1.3.5.bb b/recipes/apr/apr_1.3.5.bb
deleted file mode 100644
index 4f4c288..0000000
--- a/recipes/apr/apr_1.3.5.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Apache Portable Runtime (APR) library"
-SECTION = "libs"
-LICENSE = "Apache License, Version 2.0"
-
-PR = "r5"
-
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2;name=apr135tarbz2 \
-           file://configure_fixes.patch \
-	   file://cleanup.patch \
-           file://configfix.patch"
-
-inherit autotools lib_package binconfig
-
-OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
-
-do_configure_prepend() {
-	cd ${S}
-	./buildconf
-}
-
-do_stage() {
-	autotools_stage_all
-	install -d ${STAGING_DATADIR}/apr
-	cp ${S}/build/apr_rules.mk ${STAGING_DATADIR}/apr/
-	sed -i s,apr_builddir=.*,apr_builddir=,g ${STAGING_DATADIR}/apr/apr_rules.mk
-	sed -i s,apr_builders=.*,apr_builders=,g ${STAGING_DATADIR}/apr/apr_rules.mk
-	sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${HOST_SYS}-libtool,g ${STAGING_DATADIR}/apr/apr_rules.mk
-	sed -i s,\$\(apr_builders\),${STAGING_DATADIR}/apr/,g ${STAGING_DATADIR}/apr/apr_rules.mk
-	cp ${S}/build/mkdir.sh ${STAGING_DATADIR}/apr/
-	cp ${S}/build/make_exports.awk ${STAGING_DATADIR}/apr/
-	cp ${S}/build/make_var_export.awk ${STAGING_DATADIR}/apr/
-}
-
-SRC_URI[apr135tarbz2.md5sum] = "9ac9a00eaa190937fdbbde7b4f03ac1e"
-SRC_URI[apr135tarbz2.sha256sum] = "a33d360b70a9c7971651b3810513d7a85ca84d13ddfc1cb96d6cb0af76aab574"
diff --git a/recipes/apr/files/gen_uri_delims.patch b/recipes/apr/files/gen_uri_delims.patch
deleted file mode 100644
index 57bc15a..0000000
--- a/recipes/apr/files/gen_uri_delims.patch
+++ /dev/null
@@ -1,7 +0,0 @@
---- apr-util-0.9.7/uri/Makefile.in.old	2006-03-11 23:01:09.000000000 +0100
-+++ apr-util-0.9.7/uri/Makefile.in	2006-03-11 23:01:28.000000000 +0100
-@@ -15,4 +15,3 @@
- apr_uri.lo: uri_delims.h apr_uri.c
- 
- uri_delims.h: gen_uri_delims
--	./gen_uri_delims > uri_delims.h
diff --git a/recipes/apr/files/uri_delims.h b/recipes/apr/files/uri_delims.h
deleted file mode 100644
index 0c855bf..0000000
--- a/recipes/apr/files/uri_delims.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* this file is automatically generated by gen_uri_delims, do not edit */
-static const unsigned char uri_delims[256] = {
-    T_NUL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,T_HASH,0,0,0,0,
-    0,0,0,0,0,0,0,T_SLASH,0,0,0,0,0,0,0,0,0,0,T_COLON,0,
-    0,0,0,T_QUESTION,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
-};
-- 
1.7.0.4



