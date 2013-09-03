Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id C550C6C018
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:10:38 +0000 (UTC)
Received: (qmail 25621 invoked by uid 89); 3 Sep 2013 15:10:28 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:10:28 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 17:10:04 +0200
Message-Id: <1378221004-13038-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl] libtest-harness-perl_3.28: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:10:39 -0000

Added Test::Harness

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libtest-harness-perl_3.28.bb                   | 53 +++++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb b/meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb
index 881f5a6..62e6386 100644
--- a/meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb
+++ b/meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb
@@ -1,10 +1,59 @@
 SUMMARY = "Test::Harness - Run Perl standard test scripts with statistics"
 AUTHOR = "Curis \"Ovid\" Poe <ovid@cpan.org>"
 HOMEPAGE = "https://metacpan.org/module/Test::Harness"
-SECTION = "devtools"
-LICENSE = "GPLv1+"
+SECTION = "libs"
+LICENSE = "GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;md5=37947a7c4fbd4a63c41d1bfa385e0c1e"
 
+RPROVIDES_${PN} = "libapp-prove-perl \
+                  libapp-prove-state-perl \
+                  libapp-prove-state-result-perl \
+                  libapp-prove-state-result-test-perl \
+                  libtap-base-perl \
+                  libtap-formatter-base-perl \
+                  libtap-formatter-color-perl \
+                  libtap-formatter-console-perl \
+                  libtap-formatter-console-parallelsession-perl \                  
+                  libtap-formatter-console-session-perl \
+                  libtap-formatter-file-perl \
+                  libtap-formatter-file-session-perl \
+                  libtap-formatter-session-perl \
+                  libtap-harness-perl \
+                  libtap-object-perl \
+                  libtap-parser-perl \
+                  libtap-parser-aggregator-perl \
+                  libtap-parser-grammar-perl \
+                  libtap-parser-iterator-perl \
+                  libtap-parser-iterator-array-perl \
+                  libtap-parser-iterator-process-perl \
+                  libtap-parser-iterator-stream-perl \
+                  libtap-parser-iteratorfactory-perl \
+                  libtap-parser-multiplexer-perl \
+                  libtap-parser-result-perl \
+                  libtap-parsser-result-bailout-perl \
+                  libtap-parser-result-comment-perl \
+                  libtap-parser-result-plan-perl \
+                  libtap-parser-result-pragma-perl \
+                  libtap-parser-result-test-perl \
+                  libtap-parser-result-unknown-perl \
+                  libtap-parser-result-version-perl \
+                  libtap-parser-result-yaml-perl \
+                  libtap-parser-resultfactory-perl \
+                  libtap-parser-scheduler-perl \
+                  libtap-parser-scheduler-job-perl \
+                  libtap-parser-scheduler-spinner-perl \
+                  libtap-parser-source-perl \
+                  libtap-parser-sourcehandler-perl \
+                  libtap-parser-sourcehandler-executable-perl \
+                  libtap-parser-sourcehandler-file-perl \
+                  libtap-parser-sourcehandler-handle-perl \
+                  libtap-parser-sourcehandler-perl-perl \
+                  libtap-parser-sourcehandler-rawtap-perl \
+                  libtap-parser-utils-perl \
+                  libtap-parser-yamlish-reader-perl \
+                  libtap-parser-yamlish-writer-perl \
+                  "
+                  
 SRC_URI = "http://cpan.metacpan.org/authors/id/O/OV/OVID/Test-Harness-${PV}.tar.gz"
 SRC_URI[md5sum] = "e71faf73830f249e2eb569a52362c106"
 SRC_URI[sha256sum] = "209d538a7809935967c2c148a36c75a2959a3c3432e1d406288662632870a07c"
-- 
1.8.4.rc3


