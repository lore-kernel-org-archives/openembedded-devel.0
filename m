Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 045067EA60
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055487"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:53:06 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:22 -0700
Message-Id: <a2710fa95701f2c5f105fd724648461eef3765e9.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 6/9] libtest-warn-perl: add recipe for 0.36
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
X-List-Received-Date: Fri, 28 Jun 2019 05:00:09 -0000
Content-Transfer-Encoding: 8bit

ptest dependency for libcgi-perl

NAME
Test::Warn - Perl extension to test methods for warnings

DESCRIPTION
A good style of Perl programming calls for a lot of diverse regression tests.

This module provides a few convenience methods for testing warning based-code.

If you are not already familiar with the Test::More manpage now would be the time to go take a look.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libtest/libtest-warn-perl_0.36.bb         | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb

diff --git a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb
new file mode 100644
index 0000000000..c336da80f1
--- /dev/null
+++ b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Test::Warn - Perl extension to test methods for warnings"
+DESCRIPTION = "This module provides a few convenience methods for testing \
+warning based code. \
+\
+If you are not already familiar with the Test::More manpage now would be \
+the time to go take a look. \
+"
+
+SECTION = "libs"
+HOMEPAGE= "https://metacpan.org/release/Test-Warn"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=73;endline=78;md5=42b423d91c92ba59c215835a2ee9b57a"
+
+CPAN_PACKAGE = "Test-Warn"
+CPAN_AUTHOR = "BIGJ"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/B/BI/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "3d958f43d36db263994affde5da09b51"
+SRC_URI[sha256sum] = "ecbca346d379cef8d3c0e4ac0c8eb3b2613d737ffaaeae52271c38d7bf3c6cda"
+
+S = "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
+
+inherit cpan ptest-perl
+
+do_install_ptest() {
+    cp -r ${B}/blib ${D}${PTEST_PATH}
+    chown -R root:root ${D}${PTEST_PATH}
+}
+
+RDEPENDS_${PN} += " \
+    libsub-uplevel-perl \
+    perl-module-blib \
+    perl-module-carp \
+    perl-module-test-builder \
+    perl-module-test-builder-tester \
+    perl-module-test-tester \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-file-spec \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


