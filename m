Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C9BDC6014F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 05:35:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q5Z8xG026217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 22:35:09 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 25 Sep 2016 22:35:08 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Sep 2016 13:31:19 +0800
Message-ID: <1474867881-15637-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1474867881-15637-1-git-send-email-mingli.yu@windriver.com>
References: <1474867881-15637-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/3] mariadb: add libdbi-perl to RDEPENDS
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
X-List-Received-Date: Mon, 26 Sep 2016 05:35:09 -0000
Content-Type: text/plain

From: Zhixiong Chi <Zhixiong.Chi@windriver.com>

The commands(mysql_convert_table_format and mysql_setpermission) need
the supported API provided by the libdbi-perl package.
So add the libdbi-perl to the variable RDEPENDS of mariabdb-server.

Move libdbi-perl from meta-perl to meta-oe

Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-devtools/perl/libdbi-perl_1.636.bb | 26 ++++++++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb.inc          |  2 +-
 meta-perl/recipes-perl/libdb/libdbi-perl_1.636.bb  | 26 ----------------------
 3 files changed, 27 insertions(+), 27 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl_1.636.bb
 delete mode 100644 meta-perl/recipes-perl/libdb/libdbi-perl_1.636.bb

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.636.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.636.bb
new file mode 100644
index 0000000..085b904
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.636.bb
@@ -0,0 +1,26 @@
+SUMMARY = "The Perl Database Interface"
+DESCRIPTION = "DBI is a database access Application Programming Interface \
+(API) for the Perl Language. The DBI API Specification defines a set \
+of functions, variables and conventions that provide a consistent \
+database interface independent of the actual database being used. \
+"
+HOMEPAGE = "http://search.cpan.org/dist/DBI/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+RDEPENDS_${PN} = " perl-module-carp \
+                   perl-module-exporter \
+                   perl-module-exporter-heavy \
+                   perl-module-dynaloader \
+"
+
+LIC_FILES_CHKSUM = "file://DBI.pm;beginline=8147;endline=8151;md5=2e5f6cf47e5ad7b77dcb6172edc29292"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
+SRC_URI[md5sum] = "60f291e5f015550dde71d1858dfe93ba"
+SRC_URI[sha256sum] = "8f7ddce97c04b4b7a000e65e5d05f679c964d62c8b02c94c1a7d815bb2dd676c"
+
+S = "${WORKDIR}/DBI-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 73905b6..c2d2ecf 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -169,7 +169,7 @@ RDEPENDS_${PN}-client = "perl perl-module-getopt-long perl-module-file-temp \
 RDEPENDS_${PN}-server = "perl perl-module-getopt-long perl-module-data-dumper \
     perl-module-file-basename perl-module-file-path perl-module-sys-hostname \
     perl-module-file-copy perl-module-file-temp perl-module-posix \
-    ${PN}-client"
+    ${PN}-client libdbi-perl"
 RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-module-getopt-long \
     perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-module-threads \
     perl-module-threads-shared perl-module-io-socket perl-module-sys-hostname perl-module-file-copy \
diff --git a/meta-perl/recipes-perl/libdb/libdbi-perl_1.636.bb b/meta-perl/recipes-perl/libdb/libdbi-perl_1.636.bb
deleted file mode 100644
index 085b904..0000000
--- a/meta-perl/recipes-perl/libdb/libdbi-perl_1.636.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "The Perl Database Interface"
-DESCRIPTION = "DBI is a database access Application Programming Interface \
-(API) for the Perl Language. The DBI API Specification defines a set \
-of functions, variables and conventions that provide a consistent \
-database interface independent of the actual database being used. \
-"
-HOMEPAGE = "http://search.cpan.org/dist/DBI/"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-RDEPENDS_${PN} = " perl-module-carp \
-                   perl-module-exporter \
-                   perl-module-exporter-heavy \
-                   perl-module-dynaloader \
-"
-
-LIC_FILES_CHKSUM = "file://DBI.pm;beginline=8147;endline=8151;md5=2e5f6cf47e5ad7b77dcb6172edc29292"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
-SRC_URI[md5sum] = "60f291e5f015550dde71d1858dfe93ba"
-SRC_URI[sha256sum] = "8f7ddce97c04b4b7a000e65e5d05f679c964d62c8b02c94c1a7d815bb2dd676c"
-
-S = "${WORKDIR}/DBI-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND = "native"
-- 
2.8.1


