Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0435605BC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 07:07:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M77XMw008602
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 00:07:33 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Apr 2014 00:07:32 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Apr 2014 15:07:27 +0800
Message-ID: <1398150448-25424-3-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1398150448-25424-1-git-send-email-Chong.Lu@windriver.com>
References: <1398150448-25424-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/4] postgresql: split out contrib into seperate packages
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
X-List-Received-Date: Tue, 22 Apr 2014 07:07:34 -0000
Content-Type: text/plain

Make contrib and split them into postgresql-contrib.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc |   72 ++++++++++++++++++++-
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 389424e..0bb0eb3 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -24,8 +24,6 @@ INC_PR = "r0"
 
 ARM_INSTRUCTION_SET = "arm"
 
-#WARNING: this recipe assumes you have the timezone compiler present in /usr/sbin/zic
-
 SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2 \
            file://postgresql.init \
            file://postgresql-bashprofile \
@@ -47,7 +45,7 @@ EXTRA_OECONF_sh4 += "--disable-spinlocks"
 EXTRA_OECONF_aarch64 += "--disable-spinlocks"
 
 do_compile_append() {
-    cp /usr/sbin/zic ${S}/src/timezone/
+	oe_runmake -C contrib all
 }
 
 # server needs to configure user and group
@@ -63,6 +61,12 @@ INITSCRIPT_NAME = "${BPN}-server"
 INITSCRIPT_PARAMS = "start 64 . stop 36 0 1 2 3 4 5 6 ."
 
 do_install_append() {
+	# install contrib
+	oe_runmake DESTDIR=${D} -C contrib install
+	# install tutorial
+	install -d -m 0755 ${D}${libdir}/${BPN}/tutorial
+	install ${S}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
+
 	# install COPYRIGHT README HISTORY
 	install -d -m 0755 ${D}${docdir}/${BPN}
 	for i in ${S}/{COPYRIGHT,README,HISTORY} \
@@ -92,6 +96,7 @@ PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
              libecpg-dbg libecpg libecpg-dev libecpg-staticdev libecpg-doc \
              libpq-dbg libpq libpq-dev libpq-staticdev \
              libpgtypes-dbg libpgtypes libpgtypes-staticdev libpgtypes-dev \
+             ${PN}-contrib ${PN}-contrib-dbg \
 "
 
 FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
@@ -175,3 +180,64 @@ FILES_libpgtypes = "${libdir}/libpgtypes*${SOLIBS}"
 FILES_libpgtypes-dbg = "${libdir}/.debug/libpgtypes*"
 FILES_libpgtypes-staticdev = "${libdir}/libpgtypes*.a"
 FILES_libpgtypes-dev = "${libdir}/libpgtypes*${SOLIBS} ${includedir}/pgtypes*.h"
+
+FILES_${PN}-contrib = " ${bindir}/oid2name ${bindir}/pg_standby \
+    ${bindir}/pgbench ${bindir}/vacuumlo \
+    ${S}/contrib/spi/*.example \
+    ${libdir}/${BPN}/_int.so ${libdir}/${BPN}/adminpack.so \
+    ${libdir}/${BPN}/autoinc.so ${libdir}/${BPN}/auto_explain.so \
+    ${libdir}/${BPN}/auth_delay.so ${libdir}/${BPN}/btree_gin.so \
+    ${libdir}/${BPN}/btree_gist.so ${libdir}/${BPN}/.so \
+    ${libdir}/${BPN}/chkpass.so ${libdir}/${BPN}/citext.so \
+    ${libdir}/${BPN}/cube.so ${libdir}/${BPN}/dblink.so \
+    ${libdir}/${BPN}/dict_int.so ${libdir}/${BPN}/dict_xsyn.so \
+    ${libdir}/${BPN}/dummy_seclabel.so ${libdir}/${BPN}/earthdistance.so \
+    ${libdir}/${BPN}/file_fdw.so ${libdir}/${BPN}/fuzzystrmatch.so \
+    ${libdir}/${BPN}/hstore.so ${libdir}/${BPN}/insert_username.so \
+    ${libdir}/${BPN}/isn.so ${libdir}/${BPN}/lo.so \
+    ${libdir}/${BPN}/ltree.so ${libdir}/${BPN}/moddatetime.so \
+    ${libdir}/${BPN}/pageinspect.so ${libdir}/${BPN}/pg_buffercache.so \
+    ${libdir}/${BPN}/pg_freespacemap.so ${libdir}/${BPN}/pg_trgm.so \
+    ${libdir}/${BPN}/pgcrypto.so ${libdir}/${BPN}/pgrowlocks.so \
+    ${libdir}/${BPN}/pgstattuple.so ${libdir}/${BPN}/pg_stat_statements.so \
+    ${libdir}/${BPN}/refint.so ${libdir}/${BPN}/seg.so \
+    ${libdir}/${BPN}/sslinfo.so \
+    ${libdir}/${BPN}/tablefunc.so \
+    ${libdir}/${BPN}/test_parser.so ${libdir}/${BPN}/timetravel.so \
+    ${libdir}/${BPN}/tsearch2.so ${libdir}/${BPN}/uuid-ossp.so \
+    ${libdir}/${BPN}/pgxml.so ${libdir}/${BPN}/passwordcheck.so \
+    ${libdir}/${BPN}/pg_upgrade_support.so ${libdir}/${BPN}/.so \
+    ${libdir}/${BPN}/unaccent.so \
+"
+FILES_${PN}-contrib-dbg = " \
+    ${libdir}/${BPN}/.debug/_int.so ${libdir}/${BPN}/.debug/adminpack.so \
+    ${libdir}/${BPN}/.debug/autoinc.so ${libdir}/${BPN}/.debug/auto_explain.so \
+    ${libdir}/${BPN}/.debug/auth_delay.so ${libdir}/${BPN}/.debug/btree_gin.so \
+    ${libdir}/${BPN}/.debug/btree_gist.so ${libdir}/${BPN}/.debug/.so \
+    ${libdir}/${BPN}/.debug/chkpass.so ${libdir}/${BPN}/.debug/citext.so \
+    ${libdir}/${BPN}/.debug/cube.so ${libdir}/${BPN}/.debug/dblink.so \
+    ${libdir}/${BPN}/.debug/dict_int.so ${libdir}/${BPN}/.debug/dict_xsyn.so \
+    ${libdir}/${BPN}/.debug/dummy_seclabel.so \
+    ${libdir}/${BPN}/.debug/earthdistance.so \
+    ${libdir}/${BPN}/.debug/file_fdw.so ${libdir}/${BPN}/.debug/fuzzystrmatch.so \
+    ${libdir}/${BPN}/.debug/hstore.so ${libdir}/${BPN}/.debug/insert_username.so \
+    ${libdir}/${BPN}/.debug/isn.so ${libdir}/${BPN}/.debug/lo.so \
+    ${libdir}/${BPN}/.debug/ltree.so ${libdir}/${BPN}/.debug/moddatetime.so \
+    ${libdir}/${BPN}/.debug/pageinspect.so \
+    ${libdir}/${BPN}/.debug/pg_buffercache.so \
+    ${libdir}/${BPN}/.debug/pg_freespacemap.so \
+    ${libdir}/${BPN}/.debug/pg_trgm.so \
+    ${libdir}/${BPN}/.debug/pgcrypto.so ${libdir}/${BPN}/.debug/pgrowlocks.so \
+    ${libdir}/${BPN}/.debug/pgstattuple.so \
+    ${libdir}/${BPN}/.debug/pg_stat_statements.so \
+    ${libdir}/${BPN}/.debug/refint.so ${libdir}/${BPN}/.debug/seg.so \
+    ${libdir}/${BPN}/.debug/sslinfo.so \
+    ${libdir}/${BPN}/.debug/tablefunc.so \
+    ${libdir}/${BPN}/.debug/test_parser.so ${libdir}/${BPN}/.debug/timetravel.so \
+    ${libdir}/${BPN}/.debug/tsearch2.so ${libdir}/${BPN}/.debug/uuid-ossp.so \
+    ${libdir}/${BPN}/.debug/pgxml.so ${libdir}/${BPN}/.debug/passwordcheck.so \
+    ${libdir}/${BPN}/.debug/pg_upgrade_support.so \
+    ${libdir}/${BPN}/.debug/unaccent.so \
+"
+DESCRIPTION_${PN}-contrib = "The postgresql-contrib package contains \
+    contributed packages that are included in the PostgreSQL distribution."
-- 
1.7.9.5


