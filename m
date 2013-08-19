Return-Path: <dingo@movis.dk>
Received: from sabrina (0904ds6-noe.0.fullrate.dk [89.150.185.1])
	by mail.openembedded.org (Postfix) with ESMTP id D1DBD6AFB5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 13:16:19 +0000 (UTC)
Received: by sabrina (Postfix, from userid 1000)
	id D58A41C40155; Mon, 19 Aug 2013 15:15:57 +0200 (CEST)
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Aug 2013 15:15:53 +0200
Message-Id: <1376918153-17394-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] perl-module-scalar-list-utils: rename, perl-module-test-harness: rename
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
X-List-Received-Date: Mon, 19 Aug 2013 13:16:21 -0000

Updated files as per naming conventions

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libscalar-list-utils-perl_1.31.bb}                               |    2 +-
 .../libtest-harness-perl_3.28.bb}                                    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/{perl-module-scalar-list-utils/perl-module-scalar-list-utils_1.31.bb => libscalar-list-utils-perl/libscalar-list-utils-perl_1.31.bb} (93%)
 rename meta-perl/recipes-perl/{perl-module-test-harness/perl-module-test-harness_3.28.bb => libtest-harness-perl/libtest-harness-perl_3.28.bb} (96%)

diff --git a/meta-perl/recipes-perl/perl-module-scalar-list-utils/perl-module-scalar-list-utils_1.31.bb b/meta-perl/recipes-perl/libscalar-list-utils-perl/libscalar-list-utils-perl_1.31.bb
similarity index 93%
rename from meta-perl/recipes-perl/perl-module-scalar-list-utils/perl-module-scalar-list-utils_1.31.bb
rename to meta-perl/recipes-perl/libscalar-list-utils-perl/libscalar-list-utils-perl_1.31.bb
index b12e41a..49341fe 100644
--- a/meta-perl/recipes-perl/perl-module-scalar-list-utils/perl-module-scalar-list-utils_1.31.bb
+++ b/meta-perl/recipes-perl/libscalar-list-utils-perl/libscalar-list-utils-perl_1.31.bb
@@ -5,7 +5,7 @@ SECTION = "cpan"
 LICENSE = "GPLv1"
 LIC_FILES_CHKSUM = "file://README;md5=c0ed8d34eaf984d0fb0b1becc3c26f93"
 
-RDEPENDS_${PN} += 'perl-module-test-more'
+RDEPENDS_${PN} += 'libtest-more-perl'
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/P/PE/PEVANS/Scalar-List-Utils-1.31.tar.gz"
 SRC_URI[md5sum] = "fa00004f4f32ee55249f198537a7c44e"
diff --git a/meta-perl/recipes-perl/perl-module-test-harness/perl-module-test-harness_3.28.bb b/meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb
similarity index 96%
rename from meta-perl/recipes-perl/perl-module-test-harness/perl-module-test-harness_3.28.bb
rename to meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb
index a7ed42e..50e262f 100644
--- a/meta-perl/recipes-perl/perl-module-test-harness/perl-module-test-harness_3.28.bb
+++ b/meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb
@@ -2,7 +2,7 @@ SUMMARY = "Test::Harness - Run Perl standard test scripts with statistics"
 AUTHOR = "Curis \"Ovid\" Poe <ovid@cpan.org>"
 HOMEPAGE = "https://metacpan.org/module/Test::Harness"
 SECTION = "devtools"
-LICENSE = "GPLv1"
+LICENSE = "GPLv1+"
 LIC_FILES_CHKSUM = "file://README;md5=37947a7c4fbd4a63c41d1bfa385e0c1e"
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/O/OV/OVID/Test-Harness-3.28.tar.gz"
-- 
1.7.10.4


