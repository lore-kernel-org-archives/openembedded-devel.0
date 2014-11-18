Return-Path: <todd.e.brandt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DD01C7214E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 22:58:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2014 14:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,412,1413270000"; d="scan'208";a="639302278"
Received: from unknown (HELO linux.intel.com) ([10.255.13.140])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2014 14:58:30 -0800
Date: Tue, 18 Nov 2014 14:59:02 -0800
From: Todd E Brandt <todd.e.brandt@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141118225901.GA12111@linux.intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH/RESEND v3] Phoronix Test Suite package
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
X-List-Received-Date: Tue, 18 Nov 2014 22:58:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is the package recipe for the phoronix test suite v5.2.1. The
tool is for benchmarking and testing of the system.

Signed-off-by: Todd Brandt <todd.e.brandt@linux.intel.com>
----
 meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

v2: changes based on Ross Burton's comments. However, I kept this line:
S = "${WORKDIR}/phoronix-test-suite", since the tarball folder doesn't
include the version number.
v3: changed the license file locatoin and moved the RDEPENDS field down
v3resend: has this been accepted?

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
new file mode 100644
index 0000000..ef9f735
--- /dev/null
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Phoronix Test Suite"
+DESCRIPTION = "The Phoronix Test Suite is designed to carry out both qualitative \
+and quantitative benchmarks in a clean, reproducible, and easy-to-use manner."
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
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
+RDEPENDS_${PN} = "php-cli"
+FILES_${PN} += " \
+	${datadir}/phoronix-test-suite \
+	${datadir}/appdata/phoronix-test-suite.appdata.xml \
+	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
+	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png \
+	${datadir}/mime/packages/openbenchmarking-mime.xml \
+"

