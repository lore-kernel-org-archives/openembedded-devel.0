Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B2128610D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 07:07:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M77VvT008599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 00:07:31 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Apr 2014 00:07:31 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Apr 2014 15:07:26 +0800
Message-ID: <1398150448-25424-2-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1398150448-25424-1-git-send-email-Chong.Lu@windriver.com>
References: <1398150448-25424-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/4] postgresql: split out some lib files into seperate packages
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
X-List-Received-Date: Tue, 22 Apr 2014 07:07:33 -0000
Content-Type: text/plain

1. Split out libecpg-compat-dev, libecpg-staticdev, libecpg-doc, libpq-staticdev,
libpgtypes-staticdev and libpgtypes-dev into seperate packages.
2. Multilib builds set the package name (PN) to both foo and lib32-foo breaking
build.use BPN instead to get the Base package name.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc |   70 +++++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index db425e7..389424e 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -63,6 +63,13 @@ INITSCRIPT_NAME = "${BPN}-server"
 INITSCRIPT_PARAMS = "start 64 . stop 36 0 1 2 3 4 5 6 ."
 
 do_install_append() {
+	# install COPYRIGHT README HISTORY
+	install -d -m 0755 ${D}${docdir}/${BPN}
+	for i in ${S}/{COPYRIGHT,README,HISTORY} \
+            ${S}/doc/{KNOWN_BUGS,MISSING_FEATURES,README*,bug.template}; do
+		[ -f $i ] && install $i ${D}${docdir}/${BPN}
+	done
+
 	# install dirs and server init
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/${BPN}.init \
@@ -81,10 +88,27 @@ do_install_append() {
 SSTATE_SCAN_FILES += "Makefile.global"
 
 PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
-             libecpg-compat-dbg libecpg-compat \
-             libecpg-dbg libecpg libecpg-dev \
-             libpq-dbg libpq libpq-dev \ 
-             libpgtypes-dbg libpgtypes "
+             libecpg-compat-dbg libecpg-compat libecpg-compat-dev \
+             libecpg-dbg libecpg libecpg-dev libecpg-staticdev libecpg-doc \
+             libpq-dbg libpq libpq-dev libpq-staticdev \
+             libpgtypes-dbg libpgtypes libpgtypes-staticdev libpgtypes-dev \
+"
+
+FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
+    ${localstatedir}/lib/${BPN}/data ${localstatedir}/lib/${BPN}/backups \
+    ${localstatedir}/lib/${BPN}/.bash_profile ${sysconfdir}/default/${BPN} \
+    ${libdir}/${BPN}/dict_snowball.so ${libdir}/${BPN}/plpgsql.so \
+    ${libdir}/${BPN}/euc2004_sjis2004.so \
+    ${libdir}/${BPN}/libpqwalreceiver.so \
+    ${libdir}/${BPN}/*_and_*.so \
+"
+
+FILES_${PN}-dbg += " ${libdir}/${BPN}/.debug/dict_snowball.so \
+    ${libdir}/${BPN}/.debug/plpgsql.so \
+    ${libdir}/${BPN}/.debug/euc2004_sjis2004.so \
+    ${libdir}/${BPN}/.debug/libpqwalreceiver.so \
+    ${libdir}/${BPN}/.debug/*_and_*.so \
+"
 
 FILES_${PN}-client = "${bindir}/clusterdb \
                 ${bindir}/createdb \
@@ -100,32 +124,54 @@ FILES_${PN}-client = "${bindir}/clusterdb \
                 ${bindir}/reindexdb \
                 ${bindir}/vacuumdb \
                 ${bindir}/vacuumlo \
-                ${datadir}/${PN}/psqlrc.sample"
+                ${datadir}/${BPN}/psqlrc.sample"
+
+FILES_${PN}-client-doc = "${mandir}/man1/clusterdb.* \
+    ${mandir}/man1/createdb.*   ${mandir}/man1/createlang.* \
+    ${mandir}/man1/createuser.* ${mandir}/man1/dropdb.* \
+    ${mandir}/man1/droplang.*   ${mandir}/man1/dropuser.* \
+    ${mandir}/man1/pg_dump.*    ${mandir}/man1/pg_dumpall.* \
+    ${mandir}/man1/pg_restore.* ${mandir}/man1/psql.* \
+    ${mandir}/man1/reindexdb.*  ${mandir}/man1/vacuumdb.* \
+    ${mandir}/man7/* \
+"
 
-FILES_${PN}-doc += "${prefix}/doc/"
-FILES_${PN}-timezone = "${datadir}/${PN}/timezone"
-FILES_${PN}-server-dev = "${includedir}/${PN}/server"
+FILES_${PN}-doc += "${docdir}/${BPN}/html ${libdir}/${BPN}/tutorial/ \
+    ${mandir}/man1/initdb.* ${mandir}/man1/pg_controldata.* \
+    ${mandir}/man1/pg_ctl.* ${mandir}/man1/pg_resetxlog.* \
+    ${mandir}/man1/postgres.* ${mandir}/man1/postmaster.* \
+"
+
+FILES_${PN}-timezone = "${datadir}/${BPN}/timezone \
+    ${datadir}/${BPN}/timezonesets \
+"
+RDEPENDS_${PN} += "${PN}-timezone"
+FILES_${PN}-server-dev = "${includedir}/${BPN}/server"
 
 FILES_libecpg = "${libdir}/libecpg*${SOLIBS}"
 FILES_libecpg-dbg = "${libdir}/.debug/libecpg*"
 FILES_libecpg-dev = "${libdir}/libecpg*${SOLIBSDEV} \
                      ${libdir}/libpgtypes*${SOLIBSDEV} \
-                     ${includedir}/ecpg*.h ${includedir}/${PN}/ecpg*.h \
-                     ${includedir}/pgtypes*.h ${includedir}/${PN}/informix \
+                     ${includedir}/ecpg*.h ${includedir}/${BPN}/ecpg*.h \
+                     ${includedir}/pgtypes*.h ${includedir}/${BPN}/informix \
                      ${includedir}/sql3types.h ${includedir}/sqlca.h"
+FILES_libecpg-doc = "${mandir}/man1/ecpg.*"
 FILES_libecpg-staticdev = "${libdir}/libecpg*.a"
 SECTION_libecpg-staticdev = "devel"
 RDEPENDS_libecpg-staticdev = "libecpg-dev (= ${EXTENDPKGV})"
 
 FILES_libpq = "${libdir}/libpq*${SOLIBS}"
-FILES_libpq-dbg = "${libdir}/.debug/libpq* ${libdir}/${PN}/pgxs/src/test/regress/.debug/*"
+FILES_libpq-dbg = "${libdir}/.debug/libpq* ${libdir}/${BPN}/pgxs/src/test/regress/.debug/*"
 FILES_libpq-dev = "${libdir}/libpq*${SOLIBSDEV} \
                    ${includedir}"
-FILES_libpq-staticdev = "${libdir}/libpq*.a"
+FILES_libpq-staticdev = "${libdir}/libpq*.a ${libdir}/libpgport.a"
 SECTION_libpq-staticdev = "devel"
 RDEPENDS_libpq-staticdev = "libpq-dev (= ${EXTENDPKGV})"
 
 FILES_libecpg-compat = "${libdir}/libecpg_compat*${SOLIBS}"
 FILES_libecpg-compat-dbg = "${libdir}/.debug/libecpg_compat*"
+FILES_libecpg-compat-dev = "${libdir}/libecpg_compat*${SOLIBS}"
 FILES_libpgtypes = "${libdir}/libpgtypes*${SOLIBS}"
 FILES_libpgtypes-dbg = "${libdir}/.debug/libpgtypes*"
+FILES_libpgtypes-staticdev = "${libdir}/libpgtypes*.a"
+FILES_libpgtypes-dev = "${libdir}/libpgtypes*${SOLIBS} ${includedir}/pgtypes*.h"
-- 
1.7.9.5


