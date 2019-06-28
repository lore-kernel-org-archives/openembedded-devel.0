Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F30C37E4FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055471"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:53:01 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:20 -0700
Message-Id: <27d032a3877a69ff882e5759f2059c18702e0e52.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 4/9] libdbd-sqlite-perl: upgrade 1.54 -> 1.62; enable ptest
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
X-List-Received-Date: Fri, 28 Jun 2019 05:00:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Add ptest dependencies`
* Reorganize recipe according to best practices
* Use CPAN_MIRROR
* Update HOMEPAGE

Upstream release notes:

1.62 2018-12-29
    - Switched to a production version

1.61_04 2018-12-22
    - Added sqlite_db_config method and new constants for it
    - Added sqlite_defensive option to disallow dangerous SQLite features
    - Exposed some of the hidden extended result codes

1.61_03 2018-12-19
    - Upgraded SQLite to 3.26.0, which reportedly has a security fix

1.61_02 2018-12-01
    - Added sqlite_backup_from_dbh/sqlite_backup_to_dbh methods
    - Introduced sqlite_prefer_numeric_type database handle attribute
      that changes the value of TYPE statement handle attribute
      from an array of string to an array of integer, as an experimental
      feature. Setting this may break your applications.
    - Changed preferred bugtracker

1.61_01 2018-12-01
    - Added ability to configure SQLITE_MAX_LENGT with environmental
      variable (Roy Storey)
    - Added sqlite_limit database handle method to change run-time limits
    - Upgraded SQLite to 3.25.3
    - Updated constants

1.60 2018-12-01
    - Switched to a production version

1.59_03 2018-11-03
    - Added a note on the long standing bug on TYPE statement
      handle attribute
    - Applied a doc patch on Virtual::PerlData by Björn Höhrmann
      (GH-31)

1.59_02 2018-09-30
    - Upgraded SQLite to 3.25.2

1.59_01 2018-09-17
    - Upgraded SQLite to 3.25.0, with ALTER TABLE ... RENAME COLUMN
      and UPSERT among others
    - Added ::GetInfo (GH#32, Brendan Byrd)
    - Fix to use a PV value as a virtual table column value
      where appropriate (RT-124941)
    - Add deferrability to foreign_key_info (mohawk2)

1.58 2018-03-28
    - Switched to a production version.

1.57_01 2018-03-21
    - Made it an error to fetch attributes from a statement
      handle whose database handle is inactive (ribasushi++)

1.56 2018-02-28
    - Switched to a production version.

1.55_07 2018-01-27
    - This is a developer release to help testing DBIx::Class
    - Upgraded SQLite to 3.22.0
    - Disabled two STAT compile time options (tentatively),
      which fixes RT-124227 anyway

1.55_06 2018-01-27
    - This is a developer release to help testing DBIx::Class
    - Downgraded SQLite to 3.19.3 because of a SQLite regression
      (RT-124227, ribasushi++)
    - Fixed some tests to adapt to a change in error format
      introduced by the latest DBI
    - Remove no warnings test from t/43_fts.t which failed under
      some environments

1.55_05 2017-12-16
    - Implemented ParamValues statement handle attribute (RT-123886)

1.55_04 2017-11-22
    - Updated SQLite to 3.21.0
    - Resolved #122581: statistics_info() doesn't work correctly
      (John Deighan)
    - Fixed typo (GH#26, ReneNyffenegger)
    - Silenced some warnings (GH#25, Jacques Germishuys)
    - Fixed no dot in @INC issue (GH#24, ribasushi)
    - Fixed zero-length BLOB value is retrieved as undef
      (GH#23, SATO Kentaro)
    - Fixed VirtualTable::PerlData to use new ops added in SQLite 3.21.0
      (GH#28, fschlich)
    - noted on sqlite_extended_result_codes handle attribute

1.55_03 2017-02-14
    - Updated SQLite to 3.17.0

1.55_02 2017-01-08
    - Updated SQLite to 3.16.2
    - Fixed statistics_info when only unique indexes were requested (Dave
      Rolsky++). GitHub #21

1.55_01 2017-01-04
    - Updated SQLite to 3.16.0

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...erl_1.54.bb => libdbd-sqlite-perl_1.62.bb} | 43 +++++++++++++------
 1 file changed, 29 insertions(+), 14 deletions(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.54.bb => libdbd-sqlite-perl_1.62.bb} (53%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.62.bb
similarity index 53%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.62.bb
index c72e536deb..4af9d3c5c6 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.62.bb
@@ -4,34 +4,33 @@ thing in the distribution. So in order to get a fast transaction capable \
 RDBMS working for your perl project you simply have to install this \
 module, and nothing else. \
 "
-HOMEPAGE = "http://search.cpan.org/~ishigaki/DBD-SQLite/"
+HOMEPAGE = "https://metacpan.org/release/DBD-SQLite"
 
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-DEPENDS += "libdbi-perl-native"
-RDEPENDS_${PN} += "libdbi-perl \
-                   sqlite3 \
-                   perl-module-constant \
-                   perl-module-locale \
-                   perl-module-tie-hash \
-"
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1726e2117494ba3e13e1c3d93f795360"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[md5sum] = "8f835ddacb9a4a92a52bbe2d24d18a8e"
-SRC_URI[sha256sum] = "3929a6dbd8d71630f0cb57f85dcef9588cd7ac4c9fa12db79df77b9d3a4d7269"
+SRC_URI[md5sum] = "f2e11a2bea6bd864404c0363d7eddaf8"
+SRC_URI[sha256sum] = "bd82ef322a9e5469a7a62d845c32fad1188b76ccb49a88520cec768343cce85c"
 
 UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
 S = "${WORKDIR}/DBD-SQLite-${PV}"
 
-inherit cpan
+DEPENDS += "libdbi-perl-native"
 
-BBCLASSEXTEND = "native"
+inherit cpan ptest-perl
+
+RDEPENDS_${PN} += "libdbi-perl \
+		   sqlite3 \
+		   perl-module-constant \
+		   perl-module-locale \
+		   perl-module-tie-hash \
+"
 
 do_install_append() {
     if [ ${PERL_DBM_TEST} = "1" ]; then
@@ -39,3 +38,19 @@ do_install_append() {
     fi
 }
 
+do_install_ptest() {
+	cp -r ${B}/MANIFEST ${D}${PTEST_PATH}
+	chown -R root:root ${D}${PTEST_PATH}
+}
+
+RDEPENDS_${PN}-ptest += " \
+    libtest-nowarnings-perl \
+    perl-module-lib \
+    perl-module-encode \
+    perl-module-file-spec \
+    perl-module-file-spec-functions \
+    perl-module-findbin \
+    perl-module-test-more \
+    "
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


