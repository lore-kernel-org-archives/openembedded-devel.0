Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECDA5795DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:58:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8HFwJHh016081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:58:19 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:58:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:25 +0800
Message-ID: <95b2ee033e2c61215934e8bc069ddb48086f21a1.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/19] postgresql: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:58:19 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 74 +++++++--------------------
 1 file changed, 19 insertions(+), 55 deletions(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 44a1b30..3bf71f0 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -72,21 +72,19 @@ EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
 EXTRA_OECONF_sh4 += "--disable-spinlocks"
 EXTRA_OECONF_aarch64 += "--disable-spinlocks"
 
-PACKAGES_DYNAMIC += "^${PN}-plperl ^${PN}-plperl-dbg \
-    ^${PN}-pltcl ^${PN}-pltcl-dbg \
-    ^${PN}-plpython ^${PN}-plpython-dbg \
+PACKAGES_DYNAMIC += "^${PN}-plperl \
+    ^${PN}-pltcl \
+    ^${PN}-plpython \
 "
 
 python populate_packages_prepend() {
 
-    def fill_more(name, dbg=True):
+    def fill_more(name):
         if name is None or name.strip() == "":
             return
 
         fpack=d.getVar('PACKAGES', False) or ""
         fpack="${PN}-" + name + " " + fpack
-        if dbg:
-            fpack="${PN}-" + name + "-dbg" + " " + fpack
         d.setVar('PACKAGES', fpack)
 
     conf=(d.getVar('PACKAGECONFIG') or "").split()
@@ -205,13 +203,23 @@ SSTATE_SCAN_FILES += "Makefile.global"
 SSTATE_SCAN_FILES_remove = "*_config"
 
 PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
-    libecpg-compat-dbg libecpg-compat libecpg-compat-dev \
-    libecpg-dbg libecpg libecpg-dev libecpg-staticdev libecpg-doc \
-    libpq-dbg libpq libpq-dev libpq-staticdev \
-    libpgtypes-dbg libpgtypes libpgtypes-staticdev libpgtypes-dev \
-    ${PN}-contrib ${PN}-contrib-dbg \
+    libecpg-compat libecpg-compat-dev \
+    libecpg libecpg-dev libecpg-staticdev libecpg-doc \
+    libpq libpq-dev libpq-staticdev \
+    libpgtypes libpgtypes-staticdev libpgtypes-dev \
+    ${PN}-contrib \
 "
 
+RPROVIDES_${PN}-dbg += "libecpg-compat-dbg \
+                        libecpg-dbg \
+                        libpq-dbg \
+                        libpgtypes-dbg \
+                        ${PN}-contrib-dbg \
+                        ${PN}-pltcl-dbg \
+                        ${PN}-plpython-dbg \
+                        ${PN}-plperl-dbg \
+                       "
+
 FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
     ${localstatedir}/lib/${BPN}/data ${localstatedir}/lib/${BPN}/backups \
     ${localstatedir}/lib/${BPN}/.bash_profile ${sysconfdir}/default/${BPN} \
@@ -224,13 +232,6 @@ FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
        else ''} \
 "
 
-FILES_${PN}-dbg += " ${libdir}/${BPN}/.debug/dict_snowball.so \
-    ${libdir}/${BPN}/.debug/plpgsql.so \
-    ${libdir}/${BPN}/.debug/euc2004_sjis2004.so \
-    ${libdir}/${BPN}/.debug/libpqwalreceiver.so \
-    ${libdir}/${BPN}/.debug/*_and_*.so \
-"
-
 FILES_${PN}-client = "${bindir}/clusterdb \
     ${bindir}/createdb \
     ${bindir}/createlang \
@@ -268,7 +269,6 @@ RDEPENDS_${PN} += "${PN}-timezone"
 FILES_${PN}-server-dev = "${includedir}/${BPN}/server"
 
 FILES_libecpg = "${libdir}/libecpg*${SOLIBS}"
-FILES_libecpg-dbg = "${libdir}/.debug/libecpg*"
 FILES_libecpg-dev = "${libdir}/libecpg*${SOLIBSDEV} \
     ${libdir}/libpgtypes*${SOLIBSDEV} \
     ${includedir}/ecpg*.h ${includedir}/${BPN}/ecpg*.h \
@@ -281,7 +281,6 @@ SECTION_libecpg-staticdev = "devel"
 RDEPENDS_libecpg-staticdev = "libecpg-dev (= ${EXTENDPKGV})"
 
 FILES_libpq = "${libdir}/libpq*${SOLIBS}"
-FILES_libpq-dbg = "${libdir}/.debug/libpq* ${libdir}/${BPN}/pgxs/src/test/regress/.debug/*"
 FILES_libpq-dev = "${libdir}/libpq*${SOLIBSDEV} \
     ${includedir} \
 "
@@ -290,10 +289,8 @@ SECTION_libpq-staticdev = "devel"
 RDEPENDS_libpq-staticdev = "libpq-dev (= ${EXTENDPKGV})"
 
 FILES_libecpg-compat = "${libdir}/libecpg_compat*${SOLIBS}"
-FILES_libecpg-compat-dbg = "${libdir}/.debug/libecpg_compat*"
 FILES_libecpg-compat-dev = "${libdir}/libecpg_compat*${SOLIBS}"
 FILES_libpgtypes = "${libdir}/libpgtypes*${SOLIBS}"
-FILES_libpgtypes-dbg = "${libdir}/.debug/libpgtypes*"
 FILES_libpgtypes-staticdev = "${libdir}/libpgtypes*.a"
 FILES_libpgtypes-dev = "${libdir}/libpgtypes*${SOLIBS} ${includedir}/pgtypes*.h"
 
@@ -325,50 +322,18 @@ FILES_${PN}-contrib = " ${bindir}/oid2name ${bindir}/pg_standby \
     ${libdir}/${BPN}/pg_upgrade_support.so ${libdir}/${BPN}/.so \
     ${libdir}/${BPN}/unaccent.so \
 "
-FILES_${PN}-contrib-dbg = " \
-    ${libdir}/${BPN}/.debug/_int.so ${libdir}/${BPN}/.debug/adminpack.so \
-    ${libdir}/${BPN}/.debug/autoinc.so ${libdir}/${BPN}/.debug/auto_explain.so \
-    ${libdir}/${BPN}/.debug/auth_delay.so ${libdir}/${BPN}/.debug/btree_gin.so \
-    ${libdir}/${BPN}/.debug/btree_gist.so ${libdir}/${BPN}/.debug/.so \
-    ${libdir}/${BPN}/.debug/chkpass.so ${libdir}/${BPN}/.debug/citext.so \
-    ${libdir}/${BPN}/.debug/cube.so ${libdir}/${BPN}/.debug/dblink.so \
-    ${libdir}/${BPN}/.debug/dict_int.so ${libdir}/${BPN}/.debug/dict_xsyn.so \
-    ${libdir}/${BPN}/.debug/dummy_seclabel.so \
-    ${libdir}/${BPN}/.debug/earthdistance.so \
-    ${libdir}/${BPN}/.debug/file_fdw.so ${libdir}/${BPN}/.debug/fuzzystrmatch.so \
-    ${libdir}/${BPN}/.debug/hstore.so ${libdir}/${BPN}/.debug/insert_username.so \
-    ${libdir}/${BPN}/.debug/isn.so ${libdir}/${BPN}/.debug/lo.so \
-    ${libdir}/${BPN}/.debug/ltree.so ${libdir}/${BPN}/.debug/moddatetime.so \
-    ${libdir}/${BPN}/.debug/pageinspect.so \
-    ${libdir}/${BPN}/.debug/pg_buffercache.so \
-    ${libdir}/${BPN}/.debug/pg_freespacemap.so \
-    ${libdir}/${BPN}/.debug/pg_trgm.so \
-    ${libdir}/${BPN}/.debug/pgcrypto.so ${libdir}/${BPN}/.debug/pgrowlocks.so \
-    ${libdir}/${BPN}/.debug/pgstattuple.so \
-    ${libdir}/${BPN}/.debug/pg_stat_statements.so \
-    ${libdir}/${BPN}/.debug/refint.so ${libdir}/${BPN}/.debug/seg.so \
-    ${libdir}/${BPN}/.debug/sslinfo.so \
-    ${libdir}/${BPN}/.debug/tablefunc.so \
-    ${libdir}/${BPN}/.debug/test_parser.so ${libdir}/${BPN}/.debug/timetravel.so \
-    ${libdir}/${BPN}/.debug/tsearch2.so ${libdir}/${BPN}/.debug/uuid-ossp.so \
-    ${libdir}/${BPN}/.debug/pgxml.so ${libdir}/${BPN}/.debug/passwordcheck.so \
-    ${libdir}/${BPN}/.debug/pg_upgrade_support.so \
-    ${libdir}/${BPN}/.debug/unaccent.so \
-"
 DESCRIPTION_${PN}-contrib = "The postgresql-contrib package contains \
     contributed packages that are included in the PostgreSQL distribution."
 
 FILES_${PN}-pltcl = "${libdir}/${BPN}/pltcl.so ${bindir}/pltcl_delmod \
     ${binddir}/pltcl_listmod ${bindir}/pltcl_loadmod  \
     ${datadir}/${BPN}/unknown.pltcl"
-FILES_${PN}-pltcl-dbg = "${libdir}/${BPN}/.debug/pltcl.so"
 SUMMARY_${PN}-pltcl = "The Tcl procedural language for PostgreSQL"
 DESCRIPTION_${PN}-pltcl = "PostgreSQL is an advanced Object-Relational \
     database management system.  The postgresql-pltcl package contains the PL/Tcl \
     procedural language for the backend."
 
 FILES_${PN}-plperl = "${libdir}/${BPN}/plperl.so"
-FILES_${PN}-plperl-dbg = "${libdir}/${BPN}/.debug/plperl.so"
 SUMMARY_${PN}-plperl = "The Perl procedural language for PostgreSQL"
 DESCRIPTION_${PN}-plperl = "PostgreSQL is an advanced Object-Relational \
     database management system.  The postgresql-plperl package contains the \
@@ -377,7 +342,6 @@ DESCRIPTION_${PN}-plperl = "PostgreSQL is an advanced Object-Relational \
 # In version 8, it will be plpython.so
 # In version 9, it might be plpython{2,3}.so depending on python2 or 3
 FILES_${PN}-plpython = "${libdir}/${BPN}/plpython*.so"
-FILES_${PN}-plpython-dbg = "${libdir}/${BPN}/.debug/plpython*.so"
 SUMMARY_${PN}-plpython = "The Python procedural language for PostgreSQL"
 DESCRIPTION_${PN}-plpython = "PostgreSQL is an advanced Object-Relational \
     database management system.  The postgresql-plpython package contains \
-- 
2.7.4


