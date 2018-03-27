Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 1818678654
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2018 01:45:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Mar 2018 18:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,366,1517904000"; d="scan'208";a="38362783"
Received: from chiron.jf.intel.com ([10.7.159.63])
	by orsmga003.jf.intel.com with ESMTP; 26 Mar 2018 18:45:01 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Mar 2018 18:44:52 -0700
Message-Id: <20180327014452.37297-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [meta-perl][PATCH] libtest-harness-perl: upgrade v3.39 -> v3.42; inherit ptest-perl
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
X-List-Received-Date: Tue, 27 Mar 2018 01:45:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Remove tests which require "-T" (taint) command line option
* Remove tests which are inappropriate for on-target testing
* Install "prove" to /usr/local/bin to avoid conflict with perl-misc

Upstream release notes:
3.42    19-03-2018
        - Enable rulesfile.t to run in core

3.41    27-02-2018
        - Released 3.40_01 without code modifications

3.40_01 23-07-2017
        - Return handle for pipes and sockets #58 (Erik Huelsmann)
        - TAP v13 plan allows trailing whitespace (Steffen Schwigon)
        - prove: add a --statefile=<path> option to customize the .prove file
          (Ævar Arnfjörð Bjarmason)
        - Avoid non-deterministic source handling, make a SourceHandler tie an
          error. (Michael Schwern, Leon Timmermans)
        - Fix and simplify MSWin32 colorization (Roy Ivy III)
        - Fix file source handler to accept single extensions option (Tomoki Aonuma)
        - Spelling fixes (Brian Wightman)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...s-perl_3.39.bb => libtest-harness-perl_3.42.bb} | 35 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.39.bb => libtest-harness-perl_3.42.bb} (81%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.39.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
similarity index 81%
rename from meta-perl/recipes-perl/libtest/libtest-harness-perl_3.39.bb
rename to meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
index 35054c7586..c9ba594803 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.39.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
@@ -26,14 +26,14 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=b08db4360eec119e875dddd7cb8a5ddd"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
-SRC_URI[md5sum] = "7877298e3b717734095ecb8e918b043e"
-SRC_URI[sha256sum] = "69bd44c81c6e1d2db18e298ecf631852608893ddfddb332a7d55285bbfc51132"
+SRC_URI[md5sum] = "c794906473f88d6b74194e2d56f16bd6"
+SRC_URI[sha256sum] = "0fd90d4efea82d6e262e6933759e85d27cbcfa4091b14bf4042ae20bab528e53"
 
 UPSTREAM_CHECK_REGEX = "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
 S = "${WORKDIR}/Test-Harness-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 RDEPENDS_${PN} += "\
     perl-module-benchmark \
@@ -88,4 +88,33 @@ RPROVIDES_${PN} += "libapp-prove-perl \
                     libtap-parser-yamlish-writer-perl \
                     "
 
+do_install_prepend() {
+	# these tests are inappropriate on target
+	rm -rf ${B}/t/000-load.t
+	rm -rf ${B}/t/state.t
+	# these tests require "-T" (taint) option on command line
+	rm -rf ${B}/t/aggregator.t
+	rm -rf ${B}/t/bailout.t
+	rm -rf ${B}/t/base.t
+	rm -rf ${B}/t/callbacks.t
+	rm -rf ${B}/t/errors.t
+	rm -rf ${B}/t/nested.t
+	rm -rf ${B}/t/object.t
+	rm -rf ${B}/t/premature-bailout.t
+	rm -rf ${B}/t/results.t
+	rm -rf ${B}/t/streams.t
+	rm -rf ${B}/t/yamlish-output.t
+	rm -rf ${B}/t/compat/version.t
+}
+
+do_install_append() {
+	install -d ${D}/usr/local/bin
+	# do not clobber perl-misc /usr/bin/prove
+	install -m 0755 ${B}/bin/prove ${D}/usr/local/bin/
+	rm -rf ${D}${bindir}/prove
+	rm -rf ${D}${bindir}
+}
+
+FILES_${PN} += "/usr/local/bin/prove"
+
 BBCLASSEXTEND = "native"
-- 
2.14.3


