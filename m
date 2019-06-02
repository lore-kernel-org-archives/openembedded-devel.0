Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5530F7E33A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:43:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:43:44 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:43:44 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:07 -0700
Message-Id: <20190602184318.71277-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 02/13] libtest-deep-perl: add recipe for v1.128
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
X-List-Received-Date: Sun, 02 Jun 2019 18:43:43 -0000
Content-Transfer-Encoding: 8bit

Test::Deep gives you very flexible ways to check that the result you got is
the result you were expecting. At its simplest it compares two structures
by going through each level, ensuring that the values match, that arrays and
hashes have the same elements and that references are blessed into the
correct class. It also handles circular data structures without getting
caught in an infinite loop.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libtest/libtest-deep-perl_1.128.bb        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtest/libtest-deep-perl_1.128.bb

diff --git a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.128.bb b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.128.bb
new file mode 100644
index 0000000000..44a915c5b7
--- /dev/null
+++ b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.128.bb
@@ -0,0 +1,56 @@
+SUMMARY = "Test::Deep - Extremely flexible deep comparison"
+DESCRIPTION = "If you don't know anything about automated testing in Perl \
+then you should probably read about Test::Simple and Test::More before \
+preceding. Test::Deep uses the Test::Builder framework. \
+\ 
+Test::Deep gives you very flexible ways to check that the result you got is \
+the result you were expecting. At its simplest it compares two structures \
+by going through each level, ensuring that the values match, that arrays and \
+hashes have the same elements and that references are blessed into the \
+correct class. It also handles circular data structures without getting \
+caught in an infinite loop. \
+\
+Where it becomes more interesting is in allowing you to do something besides \
+simple exact comparisons. With strings, the \'eq\' operator checks that 2 \
+strings are exactly equal but sometimes that's not what you want. When you \
+don't know exactly what the string should be but you do know some things \
+about how it should look, \'eq\' is no good and you must use pattern matching \
+instead. Test::Deep provides pattern matching for complex data structures \
+distribution."
+
+SECTION = "libs"
+
+HOMEPAGE = "http://github.com/rjbs/Test-Deep/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://lib/Test/Deep.pm;beginline=1817;endline=1826;md5=aebc793c87a3d8771fe98d5d369898e7"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Deep-${PV}.tar.gz"
+SRC_URI[md5sum] = "9bc47147ea720fc01bc6b214afb884ff"
+SRC_URI[sha256sum] = "852d7e836fba8269b0b755082051a24a1a309d015a8b76838790af9e3760092f"
+
+UPSTREAM_CHECK_REGEX = "Test\-Deep\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
+
+S = "${WORKDIR}/Test-Deep-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS_${PN} += " \
+    perl-module-dynaloader \
+    perl-module-exporter \
+    perl-module-fcntl \
+    perl-module-list-util \
+    perl-module-scalar-util \
+    perl-module-strict \
+    perl-module-vars \
+    perl-module-warnings \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-if \
+    perl-module-lib \
+    perl-module-test-more \
+    perl-module-test-tester \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


