Return-Path: <todd.e.brandt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 915A270FAB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Sep 2014 00:30:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 19 Sep 2014 17:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="388868936"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO linux.intel.com)
	([10.255.13.38])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2014 17:25:06 -0700
Date: Fri, 19 Sep 2014 17:30:45 -0700
From: Todd E Brandt <todd.e.brandt@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140920003044.GA30844@linux.intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH v2] Phoronix Test Suite package
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
X-List-Received-Date: Sat, 20 Sep 2014 00:30:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is the package recipe for the phoronix test suite v5.2.1. The
tool is for benchmarking and testing of the system.

Signed-off-by: Todd Brandt <todd.e.brandt@linux.intel.com>
----
 meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

v2:
- changes based on Ross Burton's comments. However, I kept this line:
S = "${WORKDIR}/phoronix-test-suite", since the tarball folder doesn't
include the version number.
- moved the recipe from recipes-devtools to recipes-benchmark
- changed the section from tests to console/tests

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
new file mode 100644
index 0000000..af5eb54
--- /dev/null
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Phoronix Test Suite"
+DESCRIPTION = "The Phoronix Test Suite is designed to carry out both qualitative \
+and quantitative benchmarks in a clean, reproducible, and easy-to-use manner."
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://../phoronix-test-suite/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+RDEPENDS_${PN} = "php-cli"
+SECTION = "console/tests"
+
+SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
+SRC_URI[md5sum] = "51e52d883710dc516c5494bd1c377219"
+SRC_URI[sha256sum] = "1186f460691e2fe7a07df5edb8d8ed1ac0c65327512e646da2b2e3a60dda6cd9"
+S = "${WORKDIR}/phoronix-test-suite"
+
+do_install() {
+	DESTDIR=${D} ./install-sh ${exec_prefix}
+}
+
+FILES_${PN} += " \
+	${datadir}/phoronix-test-suite \
+	${datadir}/appdata/phoronix-test-suite.appdata.xml \
+	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
+	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png \
+	${datadir}/mime/packages/openbenchmarking-mime.xml \
+"

