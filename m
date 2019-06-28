Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2942F7EA55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055467"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:52:59 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:19 -0700
Message-Id: <677426b9172271080f04c8591bc63b4731178342.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 3/9] libtest-nowarnings-perl: add recipe for 1.04
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

* Ensures that no warnings are emitted during tests
* ptest dependency for libdbd-sqlite-perl

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libtest/libtest-nowarnings-perl_1.04.bb   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb

diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
new file mode 100644
index 0000000000..f3c28d39ce
--- /dev/null
+++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Make sure you didn't emit any warnings while testing"
+DESCRIPTION = "In general, your tests shouldn't produce warnings. This \
+modules causes any warnings to be captured and stored. It automatically \
+adds an extra test that will run when your script ends to check that there \
+were no warnings. If there were any warings, the test will give a \\"not ok\\" \
+and diagnostics of where, when and what the warning was, including a stack \
+trace of what was going on when the it occurred.\
+\
+If some of your tests are supposed to produce warnings then you should \
+be capturing and checking them with Test::Warn, that way \
+Test::NoWarnings will not see them and so not complain.\
+\
+The test is run by an \\"END\\" block in Test::NoWarnings. It will not be \
+run when any forked children exit."
+
+SECTION = "libs"
+LICENSE = "LGPL-2.1"
+
+HOMEPAGE= "https://metacpan.org/release/Test-NoWarnings"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+CPAN_PACKAGE = "Test-NoWarnings"
+CPAN_AUTHOR = "ADAMK"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/A/AD/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "682ed043f7d3e38f3dfd8745fd21c49a"
+SRC_URI[sha256sum] = "638a57658cb119af1fe5b15e73d47c2544dcfef84af0c6b1b2e97f08202b686c"
+
+RDEPENDS_${PN} += "perl-module-test-builder perl-module-test-more perl-module-test-tester"
+
+S = "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
+
+inherit cpan ptest-perl
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


