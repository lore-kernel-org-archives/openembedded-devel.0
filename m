Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 94FE06BE03
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 14:45:09 +0000 (UTC)
Received: (qmail 25325 invoked by uid 89); 3 Sep 2013 14:44:59 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 14:44:59 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 16:44:33 +0200
Message-Id: <1378219473-12551-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH] libtest-harness-perl: added
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
X-List-Received-Date: Tue, 03 Sep 2013 14:45:11 -0000

Added Test::Harness recipe

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libtest-harness-perl/libtest-harness-perl_3.28.bb  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb

diff --git a/meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb b/meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb
new file mode 100644
index 0000000..881f5a6
--- /dev/null
+++ b/meta-perl/recipes-perl/libtest-harness-perl/libtest-harness-perl_3.28.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Test::Harness - Run Perl standard test scripts with statistics"
+AUTHOR = "Curis \"Ovid\" Poe <ovid@cpan.org>"
+HOMEPAGE = "https://metacpan.org/module/Test::Harness"
+SECTION = "devtools"
+LICENSE = "GPLv1+"
+LIC_FILES_CHKSUM = "file://README;md5=37947a7c4fbd4a63c41d1bfa385e0c1e"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/O/OV/OVID/Test-Harness-${PV}.tar.gz"
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
-- 
1.8.4.rc3


