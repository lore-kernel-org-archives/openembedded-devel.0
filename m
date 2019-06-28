Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 18FFD7EA38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055456"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:52:55 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:18 -0700
Message-Id: <a853162aa82bf2c1723190f00fc6ad608ab21fc8.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/9] libdbi-perl: fix dependencies
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
X-List-Received-Date: Fri, 28 Jun 2019 05:00:02 -0000
Content-Transfer-Encoding: 8bit

* Fix RDEPENDS, drop class-target (dependencies are the same for native)
* Reorganize recipe to best practices
* Add ptest dependencies

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/libdbi-perl_1.642.bb                 | 38 +++++++++++++++----
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
index ff4a9d0610..77991bd158 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
@@ -7,13 +7,6 @@ database interface independent of the actual database being used. \
 HOMEPAGE = "http://search.cpan.org/dist/DBI/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-RDEPENDS_${PN}_class-target = " \
-    perl-module-carp \
-    perl-module-exporter \
-    perl-module-exporter-heavy \
-    perl-module-dynaloader \
-"
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
@@ -34,4 +27,35 @@ do_install_prepend() {
 	rm -rf ${B}/t/z*.t
 }
 
+RDEPENDS_${PN} = " \
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-exporter-heavy \
+    perl-module-dynaloader \
+    perl-module-io-dir \
+    perl-module-scalar-util \
+    perl-module-universal \
+"
+
+RDEPENDS_${PN}-ptest = " \
+    ${PN} \
+    perl-module-b \
+    perl-module-benchmark \
+    perl-module-cwd \
+    perl-module-data-dumper \
+    perl-module-encode \
+    perl-module-encode-byte \
+    perl-module-encode-encoding \
+    perl-module-file-copy \
+    perl-module-file-path \
+    perl-module-lib \
+    perl-module-perlio \
+    perl-module-perlio-scalar \
+    perl-module-perlio-via \
+    perl-module-sdbm-file \
+    perl-module-storable \
+    perl-module-test-more \
+    perl-module-utf8 \
+    "
+
 BBCLASSEXTEND = "native"
-- 
2.20.1


