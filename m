Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id BFF0A6C007
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:19:11 +0000 (UTC)
Received: (qmail 25676 invoked by uid 89); 3 Sep 2013 15:19:00 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:19:00 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 17:18:32 +0200
Message-Id: <1378221512-13512-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl] libtest-simple-perl_0.98.bb: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:19:12 -0000

Test::Simple recipe

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libtest-simple-perl_0.98.bb                    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtest-simple-perl/libtest-simple-perl_0.98.bb

diff --git a/meta-perl/recipes-perl/libtest-simple-perl/libtest-simple-perl_0.98.bb b/meta-perl/recipes-perl/libtest-simple-perl/libtest-simple-perl_0.98.bb
new file mode 100644
index 0000000..5e76181
--- /dev/null
+++ b/meta-perl/recipes-perl/libtest-simple-perl/libtest-simple-perl_0.98.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Test::Builder - Backend for building test libraries"
+AUTHOR = "Michael G. Schwern <mschwern@cpan.org>"
+HOMEPAGE = "https://metacpan.org/module/Test::Builder"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=23e939b09e39c1a3069cf98c7f04500e"
+
+RPROVIDES_${PN} += "libtest-builder-perl \
+                    libbuilder-io-scalar-perl \
+                    libbuilder-module-perl \
+                    libtest-builder-tester-perl \
+                    libbuilder-tester-color-perl \
+                    libtest-more-perl \
+                    libtest-simple-perl \
+                    "
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/M/MS/MSCHWERN/Test-Simple-${PV}.tar.gz"
+SRC_URI[md5sum] = "a8b26c97440269b33dd79fd847c521d8"
+SRC_URI[sha256sum] = "2fb203e2cb75e72c6f70af71c6b01998f2c0ec2afba6c38cc5053c6107cd12a8"
+
+S = "${WORKDIR}/Test-Simple-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.rc3


