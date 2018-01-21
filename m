Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6994378748
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169370"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:28 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:11 -0800
Message-Id: <3ac873ad8c5dce4feefef8b8e82f80d6939a818d.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 11/12] libtest-harness-perl: upgrade 3.36 -> 3.39
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:26 -0000

* Fix RDEPENDS
* Add note that perl-module-test-harness should be preferred
  unless a newer version is needed than provided by perl

Changes:

3.39    06-04-2017
        - Make tests pass when PERL_USE_UNSAFE_INC=0

3.38    13-03-2017
        - Released 3.37_01 without changes

3.37_01
        - Set PERL_USE_UNSAFE_INC when running tests using Test::Harness (Leon Timmermans)
        - Avoid loading optional modules from . in prove

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...-harness-perl_3.36.bb => libtest-harness-perl_3.39.bb} | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.36.bb => libtest-harness-perl_3.39.bb} (88%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.39.bb
similarity index 88%
rename from meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
rename to meta-perl/recipes-perl/libtest/libtest-harness-perl_3.39.bb
index 1aed5e0d6..35054c758 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.39.bb
@@ -1,3 +1,8 @@
+# NOTE:
+#     You should use perl-module-test-harness instead of this package,
+#     unless you specifically need a newer version than what is provided
+#     by perl in oe-core.
+
 SUMMARY = "Test::Harness - Run Perl standard test scripts with statistics"
 DESCRIPTION = "Although, for historical reasons, the Test::Harness \
 distribution takes its name from this module it now exists only to provide \
@@ -21,13 +26,19 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=b08db4360eec119e875dddd7cb8a5ddd"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
-SRC_URI[md5sum] = "4c8d9c77e8e06ca96c7383c05c8f3616"
-SRC_URI[sha256sum] = "e7566f13b041d028b56f184b77ec2545ec6f0bb5a0f8f5368f7e4a08b496b63e"
+SRC_URI[md5sum] = "7877298e3b717734095ecb8e918b043e"
+SRC_URI[sha256sum] = "69bd44c81c6e1d2db18e298ecf631852608893ddfddb332a7d55285bbfc51132"
+
+UPSTREAM_CHECK_REGEX = "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
 S = "${WORKDIR}/Test-Harness-${PV}"
 
 inherit cpan
 
+RDEPENDS_${PN} += "\
+    perl-module-benchmark \
+"
+
 RPROVIDES_${PN} += "libapp-prove-perl \
                     libapp-prove-state-perl \
                     libapp-prove-state-result-perl \
-- 
2.13.6


