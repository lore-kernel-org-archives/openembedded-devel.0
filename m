Return-Path: <dingo@movis.dk>
Received: from sabrina (0904ds6-noe.0.fullrate.dk [89.150.185.1])
	by mail.openembedded.org (Postfix) with ESMTP id 415D06AFCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 12:12:03 +0000 (UTC)
Received: by sabrina (Postfix, from userid 1000)
	id 0A2AD1C40155; Mon, 19 Aug 2013 14:11:41 +0200 (CEST)
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Aug 2013 14:11:25 +0200
Message-Id: <1376914285-16938-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] perl-module-test-more: deleted, perl-module-test-simple: add Test::Simple contains Test::More and a number of other packages. As such, Test::More has been removed and Test::Simple added with RPROVIDES and PROVIDES set.
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
X-List-Received-Date: Mon, 19 Aug 2013 12:12:04 -0000

---
 .../perl-module-test-more_0.98.bb                   |   19 -------------------
 .../perl-module-test-simple_0.98.bb                 |   19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/perl-module-test-more/perl-module-test-more_0.98.bb
 create mode 100644 meta-perl/recipes-perl/perl-module-test-simple/perl-module-test-simple_0.98.bb

diff --git a/meta-perl/recipes-perl/perl-module-test-more/perl-module-test-more_0.98.bb b/meta-perl/recipes-perl/perl-module-test-more/perl-module-test-more_0.98.bb
deleted file mode 100644
index 429284d..0000000
--- a/meta-perl/recipes-perl/perl-module-test-more/perl-module-test-more_0.98.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Test::More - yet another framework for writing test scripts"
-AUTHOR = "Michael G Schwern <schwern@pobox.com>"
-HOMEPAGE = "https://metacpan.org/module/Test::More"
-SECTION = "cpan"
-LICENSE = "GPLv1"
-LIC_FILES_CHKSUM = "file://README;md5=23e939b09e39c1a3069cf98c7f04500e"
-
-RDEPENDS_${PN} += 'perl-module-test-harness'
-
-SRC_URI = "http://cpan.metacpan.org/authors/id/M/MS/MSCHWERN/Test-Simple-0.98.tar.gz"
-SRC_URI[md5sum] = "a8b26c97440269b33dd79fd847c521d8"
-SRC_URI[sha256sum] = "2fb203e2cb75e72c6f70af71c6b01998f2c0ec2afba6c38cc5053c6107cd12a8"
-
-S = "${WORKDIR}/Test-Simple-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-perl/recipes-perl/perl-module-test-simple/perl-module-test-simple_0.98.bb b/meta-perl/recipes-perl/perl-module-test-simple/perl-module-test-simple_0.98.bb
new file mode 100644
index 0000000..daeb7bb
--- /dev/null
+++ b/meta-perl/recipes-perl/perl-module-test-simple/perl-module-test-simple_0.98.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Test::Builder - Backend for building test libraries"
+AUTHOR = "Michael G. Schwern <mschwern@cpan.org>"
+HOMEPAGE = "https://metacpan.org/module/Test::Builder"
+SECTION = "cpan"
+LICENSE = "GPLv1"
+LIC_FILES_CHKSUM = "file://README;md5=23e939b09e39c1a3069cf98c7f04500e"
+
+PROVIDES_${PN} += 'perl-module-test-builder perl-module-builder-io-scalar perl-module-builder-module perl-module-builder-tester perl-module-builder-tester-color perl-module-test-more perl-module-test-simple'
+RPROVIDES_${PN} += 'perl-module-test-builder perl-module-builder-io-scalar perl-module-builder-module perl-module-builder-tester perl-module-builder-tester-color perl-module-test-more perl-module-test-simple'
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/M/MS/MSCHWERN/Test-Simple-0.98.tar.gz"
+SRC_URI[md5sum] = "a8b26c97440269b33dd79fd847c521d8"
+SRC_URI[sha256sum] = "2fb203e2cb75e72c6f70af71c6b01998f2c0ec2afba6c38cc5053c6107cd12a8"
+
+S = "${WORKDIR}/Test-Simple-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4


