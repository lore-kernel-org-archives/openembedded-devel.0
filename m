Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7A66BEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 14:58:57 +0000 (UTC)
Received: (qmail 25526 invoked by uid 89); 3 Sep 2013 14:58:47 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 14:58:47 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 16:58:24 +0200
Message-Id: <1378220304-12867-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH] libtest-perl_1.26: added
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
X-List-Received-Date: Tue, 03 Sep 2013 14:58:58 -0000

Test recipe added

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../recipes-perl/libtest-perl/libtest-perl_1.26.bb  | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtest-perl/libtest-perl_1.26.bb

diff --git a/meta-perl/recipes-perl/libtest-perl/libtest-perl_1.26.bb b/meta-perl/recipes-perl/libtest-perl/libtest-perl_1.26.bb
new file mode 100644
index 0000000..5596ffe
--- /dev/null
+++ b/meta-perl/recipes-perl/libtest-perl/libtest-perl_1.26.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Test - provides a simple framework for writing test scripts"
+AUTHOR = "Jesse Vincent <jesse+cpan@fsck.com>"
+HOMEPAGE = "https://metacpan.org/module/Test"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=82da57b253d95f830de58fae58c3af4e"
+
+RDEPEND_${PN} = "libfile-spec-perl \
+                 libtest-harness-perl \
+                "
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/J/JE/JESSE/Test-${PV}.tar.gz"
+SRC_URI[md5sum] = "6ec6583c34be3770edd466876546fb50"
+SRC_URI[sha256sum] = "f7701bd28e05e7f82fe9a181bbab38f53fa6aeae48d2a810da74d1b981d4f392"
+
+S = "${WORKDIR}/Test-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
+
-- 
1.8.4.rc3


