Return-Path: <dingo@movis.dk>
Received: from sabrina (0904ds6-noe.0.fullrate.dk [89.150.185.1])
	by mail.openembedded.org (Postfix) with ESMTP id 5D39D6AFB5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 12:55:56 +0000 (UTC)
Received: by sabrina (Postfix, from userid 1000)
	id 602871C40155; Mon, 19 Aug 2013 14:55:34 +0200 (CEST)
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Aug 2013 14:55:29 +0200
Message-Id: <1376916929-23457-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] perl-module-test-simple: renamed
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
X-List-Received-Date: Mon, 19 Aug 2013 12:55:56 -0000

Renamed perl-module-test-simple and its provided modules to match naming convention as per request

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libtest-simple-perl_0.98.bb}                                  |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/{perl-module-test-simple/perl-module-test-simple_0.98.bb => libtest-simple-perl/libtest-simple-perl_0.98.bb} (56%)

diff --git a/meta-perl/recipes-perl/perl-module-test-simple/perl-module-test-simple_0.98.bb b/meta-perl/recipes-perl/libtest-simple-perl/libtest-simple-perl_0.98.bb
similarity index 56%
rename from meta-perl/recipes-perl/perl-module-test-simple/perl-module-test-simple_0.98.bb
rename to meta-perl/recipes-perl/libtest-simple-perl/libtest-simple-perl_0.98.bb
index daeb7bb..2443399 100644
--- a/meta-perl/recipes-perl/perl-module-test-simple/perl-module-test-simple_0.98.bb
+++ b/meta-perl/recipes-perl/libtest-simple-perl/libtest-simple-perl_0.98.bb
@@ -2,11 +2,10 @@ SUMMARY = "Test::Builder - Backend for building test libraries"
 AUTHOR = "Michael G. Schwern <mschwern@cpan.org>"
 HOMEPAGE = "https://metacpan.org/module/Test::Builder"
 SECTION = "cpan"
-LICENSE = "GPLv1"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;md5=23e939b09e39c1a3069cf98c7f04500e"
 
-PROVIDES_${PN} += 'perl-module-test-builder perl-module-builder-io-scalar perl-module-builder-module perl-module-builder-tester perl-module-builder-tester-color perl-module-test-more perl-module-test-simple'
-RPROVIDES_${PN} += 'perl-module-test-builder perl-module-builder-io-scalar perl-module-builder-module perl-module-builder-tester perl-module-builder-tester-color perl-module-test-more perl-module-test-simple'
+RPROVIDES_${PN} += 'perl-libtest-builder-perl libbuilder-io-scalar-perl libbuilder-module-perl libbuilder-tester-perl libbuilder-tester-color-perl libtest-more-perl libtest-simple-perl'
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/M/MS/MSCHWERN/Test-Simple-0.98.tar.gz"
 SRC_URI[md5sum] = "a8b26c97440269b33dd79fd847c521d8"
-- 
1.7.10.4


