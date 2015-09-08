Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4DA65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 14:37:03 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so117650469wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Y/A8pUeyuQk3bfjdF3YUKYx7QtjwCfbflUI6BPJGhKA=;
	b=e6s3SisejUrTL2VjOCFwAiVgYxSbgjhCwNNYxEf2vtxa+2HGp1MG4kgmM8JptPKsw+
	8nsjYVw3KLTbtkM8Qa26rlO8l/UwSkfB4bTZPbhR66v6UB7C/gy4XXvyrzl4uH2Gt5rp
	n5zyu87OkgoA6j76tf6/E3RWyVFbkoP1em7jch9JveeybaXacCXKHKLm7in5NgghRwIT
	vKp40xp40kfyWJ4WgOXamEzyUcdI0ziLcyuczukJG4YRP9A/CHj3B/qnhrtQZRtD5snJ
	T+BoWoO1+VSfygYEkBfIJsqr9QXjResCWzXzy7EH0vcXLaZcD3AI4hIr84SSn8DvrmRH
	GMPA==
X-Received: by 10.180.230.199 with SMTP id ta7mr4010043wic.1.1441723023396;
	Tue, 08 Sep 2015 07:37:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ev6sm4368592wib.12.2015.09.08.07.37.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 07:37:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 16:37:48 +0200
Message-Id: <1441723068-14347-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [meta-oe][PATCH] postgresql.inc: fix indentation to use 4 spaces
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
X-List-Received-Date: Tue, 08 Sep 2015 14:37:07 -0000

* like rest of meta-oe and other sane layers
* never mix tabs and spaces (especially on the same line)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc | 165 +++++++++++-----------
 1 file changed, 82 insertions(+), 83 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 2b8db34..f3ff225 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -12,11 +12,11 @@ DESCRIPTION = "\
     server over a network connection. This package contains the docs \
     in HTML for the whole package, as well as command-line utilities for \
     managing PostgreSQL databases on a PostgreSQL server. \
-     \
+    \
     If you want to manipulate a PostgreSQL database on a local or remote \
     PostgreSQL server, you need this package. You also need to install \
     this package if you're installing the postgresql-server package. \
-    "
+"
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
 DEPENDS = "zlib readline tzcode-native"
@@ -25,13 +25,13 @@ INC_PR = "r0"
 ARM_INSTRUCTION_SET = "arm"
 
 SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
-           file://postgresql.init \
-           file://postgresql-bashprofile \
-           file://postgresql.pam \
-           file://postgresql-setup \
-           file://postgresql.service \
-           file://0001-Use-pkg-config-for-libxml2-detection.patch \
-          "
+    file://postgresql.init \
+    file://postgresql-bashprofile \
+    file://postgresql.pam \
+    file://postgresql-setup \
+    file://postgresql.service \
+    file://0001-Use-pkg-config-for-libxml2-detection.patch \
+"
 
 LEAD_SONAME = "libpq.so"
 
@@ -60,22 +60,21 @@ PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
 PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
 # when tcl native package  is fixed change WORKDIR to STAGING_BINDIR_CROSS
-PACKAGECONFIG[tcl] = \
-    "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl,"
+PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl,"
 PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
 PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
 PACKAGECONFIG[perl] = "--with-perl,--without-perl,perl,perl"
 
 EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
-                 --datadir=${datadir}/${BPN} \
-                 --sysconfdir=${sysconfdir}/${BPN} \
+    --datadir=${datadir}/${BPN} \
+    --sysconfdir=${sysconfdir}/${BPN} \
 "
 EXTRA_OECONF_sh4 += "--disable-spinlocks"
 EXTRA_OECONF_aarch64 += "--disable-spinlocks"
 
 PACKAGES_DYNAMIC += "^${PN}-plperl ^${PN}-plperl-dbg \
-                     ^${PN}-pltcl ^${PN}-pltcl-dbg \
-                     ^${PN}-plpython ^${PN}-plpython-dbg \
+    ^${PN}-pltcl ^${PN}-pltcl-dbg \
+    ^${PN}-plpython ^${PN}-plpython-dbg \
 "
 
 python populate_packages_prepend() {
@@ -110,47 +109,47 @@ python populate_packages_prepend() {
 }
 
 do_configure() {
-	# do_configure_prepend
-	# make sure configure finds python includdirs with these envs
-	export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-	       STAGING_INCDIR=${STAGING_INCDIR} \
-	       STAGING_LIBDIR=${STAGING_LIBDIR}
-
-	# do_configure
-	autotools_do_configure
-
-	# do_configure_append
-	# workaround perl package related bugs
-	sed -i -e "s:-L/usr/local/lib:-L=/usr/local/lib:g" \
-	    ${B}/src/Makefile.global
-	LIBPNA="\${STAGING_LIBDIR_NATIVE}/perl-native"
-	LIBNA="\${STAGING_LIBDIR_NATIVE}"
-	BLIBNA="\${STAGING_BASE_LIBDIR_NATIVE}"
-	sed -i -e "/^perl_archlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
-	    ${B}/src/Makefile.global
-	sed -i -e "/^perl_privlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
-	    ${B}/src/Makefile.global
-	# remove the rpath, replace with correct lib path
-	sed -i \
-	    -e "/^perl_embed_ldflags/s:-Wl,-rpath,${LIBNA}::g" \
-	    -e "/^perl_embed_ldflags/s:-Wl,-rpath,${BLIBNA}::g" \
-	    -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${LIBNA}::g" \
-	    -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${BLIBNA}::g" \
-	    -e "/^perl_embed_ldflags/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
-	    -e "/^perl_embed_ldflags/s:${LIBNA}:${STAGING_LIBDIR}:g"  \
-	    -e "/^perl_embed_ldflags/s:${BLIBNA}:${STAGING_BASELIBDIR}:g" \
-	    -e "/^TCLSH/s:=.*:= ${bindir}/tclsh:g" \
-	${B}/src/Makefile.global
-
-	# workaround perl package's libperl.so problem
-	# we are using perlnative so this perl should have same version
-	perl_version=`perl -v 2>/dev/null | \
-            sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\1/p'`
-	if [ ! -h "${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so" -a \
-	     ! -h "${STAGING_LIBDIR}/libperl.so" ]; then
-		ln -sf ../../../libperl.so.5 \
-		    ${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so
-	fi
+    # do_configure_prepend
+    # make sure configure finds python includdirs with these envs
+    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+           STAGING_INCDIR=${STAGING_INCDIR} \
+           STAGING_LIBDIR=${STAGING_LIBDIR}
+
+    # do_configure
+    autotools_do_configure
+
+    # do_configure_append
+    # workaround perl package related bugs
+    sed -i -e "s:-L/usr/local/lib:-L=/usr/local/lib:g" \
+        ${B}/src/Makefile.global
+    LIBPNA="\${STAGING_LIBDIR_NATIVE}/perl-native"
+    LIBNA="\${STAGING_LIBDIR_NATIVE}"
+    BLIBNA="\${STAGING_BASE_LIBDIR_NATIVE}"
+    sed -i -e "/^perl_archlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+        ${B}/src/Makefile.global
+    sed -i -e "/^perl_privlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+        ${B}/src/Makefile.global
+    # remove the rpath, replace with correct lib path
+    sed -i \
+        -e "/^perl_embed_ldflags/s:-Wl,-rpath,${LIBNA}::g" \
+        -e "/^perl_embed_ldflags/s:-Wl,-rpath,${BLIBNA}::g" \
+        -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${LIBNA}::g" \
+        -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${BLIBNA}::g" \
+        -e "/^perl_embed_ldflags/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+        -e "/^perl_embed_ldflags/s:${LIBNA}:${STAGING_LIBDIR}:g"  \
+        -e "/^perl_embed_ldflags/s:${BLIBNA}:${STAGING_BASELIBDIR}:g" \
+        -e "/^TCLSH/s:=.*:= ${bindir}/tclsh:g" \
+    ${B}/src/Makefile.global
+
+    # workaround perl package's libperl.so problem
+    # we are using perlnative so this perl should have same version
+    perl_version=`perl -v 2>/dev/null | \
+        sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\1/p'`
+    if [ ! -h "${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so" -a \
+         ! -h "${STAGING_LIBDIR}/libperl.so" ]; then
+        ln -sf ../../../libperl.so.5 \
+            ${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so
+    fi
 }
 
 do_compile_append() {
@@ -209,11 +208,11 @@ do_install_append() {
 SSTATE_SCAN_FILES += "Makefile.global"
 
 PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
-             libecpg-compat-dbg libecpg-compat libecpg-compat-dev \
-             libecpg-dbg libecpg libecpg-dev libecpg-staticdev libecpg-doc \
-             libpq-dbg libpq libpq-dev libpq-staticdev \
-             libpgtypes-dbg libpgtypes libpgtypes-staticdev libpgtypes-dev \
-             ${PN}-contrib ${PN}-contrib-dbg \
+    libecpg-compat-dbg libecpg-compat libecpg-compat-dev \
+    libecpg-dbg libecpg libecpg-dev libecpg-staticdev libecpg-doc \
+    libpq-dbg libpq libpq-dev libpq-staticdev \
+    libpgtypes-dbg libpgtypes libpgtypes-staticdev libpgtypes-dev \
+    ${PN}-contrib ${PN}-contrib-dbg \
 "
 
 FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
@@ -236,21 +235,21 @@ FILES_${PN}-dbg += " ${libdir}/${BPN}/.debug/dict_snowball.so \
 "
 
 FILES_${PN}-client = "${bindir}/clusterdb \
-                ${bindir}/createdb \
-                ${bindir}/createlang \
-                ${bindir}/createuser \
-                ${bindir}/dropdb \
-                ${bindir}/droplang \
-                ${bindir}/dropuser \
-                ${bindir}/pg_dump \
-                ${bindir}/pg_dumpall \
-                ${bindir}/pg_restore \
-                ${bindir}/psql \
-                ${bindir}/reindexdb \
-                ${bindir}/vacuumdb \
-                ${bindir}/vacuumlo \
-                ${datadir}/${BPN}/psqlrc.sample"
-
+    ${bindir}/createdb \
+    ${bindir}/createlang \
+    ${bindir}/createuser \
+    ${bindir}/dropdb \
+    ${bindir}/droplang \
+    ${bindir}/dropuser \
+    ${bindir}/pg_dump \
+    ${bindir}/pg_dumpall \
+    ${bindir}/pg_restore \
+    ${bindir}/psql \
+    ${bindir}/reindexdb \
+    ${bindir}/vacuumdb \
+    ${bindir}/vacuumlo \
+    ${datadir}/${BPN}/psqlrc.sample \
+"
 FILES_${PN}-client-doc = "${mandir}/man1/clusterdb.* \
     ${mandir}/man1/createdb.*   ${mandir}/man1/createlang.* \
     ${mandir}/man1/createuser.* ${mandir}/man1/dropdb.* \
@@ -260,13 +259,11 @@ FILES_${PN}-client-doc = "${mandir}/man1/clusterdb.* \
     ${mandir}/man1/reindexdb.*  ${mandir}/man1/vacuumdb.* \
     ${mandir}/man7/* \
 "
-
 FILES_${PN}-doc += "${docdir}/${BPN}/html ${libdir}/${BPN}/tutorial/ \
     ${mandir}/man1/initdb.* ${mandir}/man1/pg_controldata.* \
     ${mandir}/man1/pg_ctl.* ${mandir}/man1/pg_resetxlog.* \
     ${mandir}/man1/postgres.* ${mandir}/man1/postmaster.* \
 "
-
 FILES_${PN}-timezone = "${datadir}/${BPN}/timezone \
     ${datadir}/${BPN}/timezonesets \
 "
@@ -276,10 +273,11 @@ FILES_${PN}-server-dev = "${includedir}/${BPN}/server"
 FILES_libecpg = "${libdir}/libecpg*${SOLIBS}"
 FILES_libecpg-dbg = "${libdir}/.debug/libecpg*"
 FILES_libecpg-dev = "${libdir}/libecpg*${SOLIBSDEV} \
-                     ${libdir}/libpgtypes*${SOLIBSDEV} \
-                     ${includedir}/ecpg*.h ${includedir}/${BPN}/ecpg*.h \
-                     ${includedir}/pgtypes*.h ${includedir}/${BPN}/informix \
-                     ${includedir}/sql3types.h ${includedir}/sqlca.h"
+    ${libdir}/libpgtypes*${SOLIBSDEV} \
+    ${includedir}/ecpg*.h ${includedir}/${BPN}/ecpg*.h \
+    ${includedir}/pgtypes*.h ${includedir}/${BPN}/informix \
+    ${includedir}/sql3types.h ${includedir}/sqlca.h \
+"
 FILES_libecpg-doc = "${mandir}/man1/ecpg.*"
 FILES_libecpg-staticdev = "${libdir}/libecpg*.a"
 SECTION_libecpg-staticdev = "devel"
@@ -288,7 +286,8 @@ RDEPENDS_libecpg-staticdev = "libecpg-dev (= ${EXTENDPKGV})"
 FILES_libpq = "${libdir}/libpq*${SOLIBS}"
 FILES_libpq-dbg = "${libdir}/.debug/libpq* ${libdir}/${BPN}/pgxs/src/test/regress/.debug/*"
 FILES_libpq-dev = "${libdir}/libpq*${SOLIBSDEV} \
-                   ${includedir}"
+    ${includedir} \
+"
 FILES_libpq-staticdev = "${libdir}/libpq*.a ${libdir}/libpgport.a"
 SECTION_libpq-staticdev = "devel"
 RDEPENDS_libpq-staticdev = "libpq-dev (= ${EXTENDPKGV})"
-- 
2.5.1


