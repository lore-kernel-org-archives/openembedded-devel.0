Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2036BE03
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 14:53:57 +0000 (UTC)
Received: (qmail 25447 invoked by uid 89); 3 Sep 2013 14:53:46 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 14:53:46 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 16:53:19 +0200
Message-Id: <1378219999-12757-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH] libcarp-perl: added
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
X-List-Received-Date: Tue, 03 Sep 2013 14:53:58 -0000

Carp recipe added

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../recipes-perl/libcarp-perl/libcarp-perl_1.26.bb | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcarp-perl/libcarp-perl_1.26.bb

diff --git a/meta-perl/recipes-perl/libcarp-perl/libcarp-perl_1.26.bb b/meta-perl/recipes-perl/libcarp-perl/libcarp-perl_1.26.bb
new file mode 100644
index 0000000..0ae7bf3
--- /dev/null
+++ b/meta-perl/recipes-perl/libcarp-perl/libcarp-perl_1.26.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Carp - alternative warn and die for modules"
+AUTHOR = "Andrew Main <zefram@fysk.org>"
+HOMEPAGE = "https://metacpan.org/module/Carp"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=d613c00d4cb8d48c01f09fca2a7873a0"
+
+RPROVIDES_${PN} = "libcarp-heavy-perl"
+
+RDEPENDS_${PN} += "perl-module-strict \
+                   perl-module-warnings \
+                   libexporter-perl \
+                   libtest-more-perl \
+                  "
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/Carp-${PV}.tar.gz"
+SRC_URI[md5sum] = "86229a6f0dc44e0730f96c1909bb346d"
+SRC_URI[sha256sum] = "0a310222a9a52eca9425bca19e6d8e04faa8bb4f64d5c16f2f6cce8190c0a99b"
+
+S = "${WORKDIR}/Carp-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
+
-- 
1.8.4.rc3


