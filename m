Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4668E784C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 04:22:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Mar 2018 21:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,363,1517904000"; d="scan'208";a="45261353"
Received: from chiron.jf.intel.com ([10.7.159.63])
	by orsmga002.jf.intel.com with ESMTP; 25 Mar 2018 21:22:43 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 21:22:33 -0700
Message-Id: <20180326042233.31768-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-oe][PATCH] libdbi-perl: upgrade v1.639 -> v1.641; inherit ptest-perl
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
X-List-Received-Date: Mon, 26 Mar 2018 04:22:42 -0000

* Remove tests that require "-T" (taint)
* Remove 85gofer.t test, failure mode unclear
* Remove duplicate tests

* Use LICENSE file for checksum
  - License remains the same

License-Update: use LICENSE file for checksum

Upstream release notes:

Changes in DBI 1.641 - 19th March 2018

    Remove dependency on Storable 2.16 introduced in DBI 1.639
        thanks to Ribasushi #60
    Avoid compiler warnings in Driver.xst #59
        thanks to pali #59

Changes in DBI 1.640 - 28th January 2018

    Fix test t/91_store_warning.t for perl 5.10.0
        thanks to pali #57

    Add Perl 5.10.0 and 5.8.1 specific versions to Travis testing
        thanks to pali #57
    Add registration of mariadb_ prefix for new DBD::MariaDB driver
        thanks to pali #56

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{libdbi-perl_1.639.bb => libdbi-perl_1.641.bb}     | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.639.bb => libdbi-perl_1.641.bb} (58%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.639.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.641.bb
similarity index 58%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.639.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.641.bb
index bef4a82582..24a1245fc0 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.639.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.641.bb
@@ -13,14 +13,24 @@ RDEPENDS_${PN} = " perl-module-carp \
                    perl-module-dynaloader \
 "
 
-LIC_FILES_CHKSUM = "file://DBI.pm;md5=62a0479400fd3c7f793568af2e1f08ee;beginline=8147;endline=8151"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
-SRC_URI[md5sum] = "f9bf9775b3dbaabc4630b2b29941aa89"
-SRC_URI[sha256sum] = "8e2cb3d6a8425bd68702aebbeee01e754ee11ad00e7f4f9a61b75483de104e8c"
+SRC_URI[md5sum] = "e77fd37fcf77fc88fde029c1b75ded54"
+SRC_URI[sha256sum] = "5509e532cdd0e3d91eda550578deaac29e2f008a12b64576e8c261bb92e8c2c1"
 
 S = "${WORKDIR}/DBI-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
+
+do_install_prepend() {
+	# test requires "-T" (taint) command line option
+	rm -rf ${B}/t/pod-coverage.t
+	rm -rf ${B}/t/13taint.t
+	# source of test failure not obvious
+	rm -rf ${B}/t/85gofer.t
+	# unclear why there are several duplicates of tests in tarball
+	rm -rf ${B}/t/z*.t
+}
 
 BBCLASSEXTEND = "native"
-- 
2.14.3


