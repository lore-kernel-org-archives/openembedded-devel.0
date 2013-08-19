Return-Path: <dingo@movis.dk>
Received: from sabrina (0904ds6-noe.0.fullrate.dk [89.150.185.1])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7566AFCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 11:56:04 +0000 (UTC)
Received: by sabrina (Postfix, from userid 1000)
	id 156BC1C40155; Mon, 19 Aug 2013 13:55:43 +0200 (CEST)
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Aug 2013 13:55:41 +0200
Message-Id: <1376913341-18910-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] Added recipes for Test::More and its dependency Test::Harness Signed-off-by: Emil Petersen <erp@movis.dk>
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
X-List-Received-Date: Mon, 19 Aug 2013 11:56:04 -0000

---
 .../perl-module-test-harness_3.28.bb                |   18 ++++++++++++++++++
 .../perl-module-test-more_0.98.bb                   |   19 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-perl/recipes-perl/perl-module-test-harness/perl-module-test-harness_3.28.bb
 create mode 100644 meta-perl/recipes-perl/perl-module-test-more/perl-module-test-more_0.98.bb

diff --git a/meta-perl/recipes-perl/perl-module-test-harness/perl-module-test-harness_3.28.bb b/meta-perl/recipes-perl/perl-module-test-harness/perl-module-test-harness_3.28.bb
new file mode 100644
index 0000000..a7ed42e
--- /dev/null
+++ b/meta-perl/recipes-perl/perl-module-test-harness/perl-module-test-harness_3.28.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Test::Harness - Run Perl standard test scripts with statistics"
+AUTHOR = "Curis \"Ovid\" Poe <ovid@cpan.org>"
+HOMEPAGE = "https://metacpan.org/module/Test::Harness"
+SECTION = "devtools"
+LICENSE = "GPLv1"
+LIC_FILES_CHKSUM = "file://README;md5=37947a7c4fbd4a63c41d1bfa385e0c1e"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/O/OV/OVID/Test-Harness-3.28.tar.gz"
+SRC_URI[md5sum] = "e71faf73830f249e2eb569a52362c106"
+SRC_URI[sha256sum] = "209d538a7809935967c2c148a36c75a2959a3c3432e1d406288662632870a07c"
+
+S = "${WORKDIR}/Test-Harness-${PV}/"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
+
+
diff --git a/meta-perl/recipes-perl/perl-module-test-more/perl-module-test-more_0.98.bb b/meta-perl/recipes-perl/perl-module-test-more/perl-module-test-more_0.98.bb
new file mode 100644
index 0000000..429284d
--- /dev/null
+++ b/meta-perl/recipes-perl/perl-module-test-more/perl-module-test-more_0.98.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Test::More - yet another framework for writing test scripts"
+AUTHOR = "Michael G Schwern <schwern@pobox.com>"
+HOMEPAGE = "https://metacpan.org/module/Test::More"
+SECTION = "cpan"
+LICENSE = "GPLv1"
+LIC_FILES_CHKSUM = "file://README;md5=23e939b09e39c1a3069cf98c7f04500e"
+
+RDEPENDS_${PN} += 'perl-module-test-harness'
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
+
-- 
1.7.10.4


