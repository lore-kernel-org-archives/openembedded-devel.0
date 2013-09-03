Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3316C057
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:47:20 +0000 (UTC)
Received: (qmail 25987 invoked by uid 89); 3 Sep 2013 15:47:09 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:47:09 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 17:46:46 +0200
Message-Id: <1378223206-14183-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl][PATCH] libhtml-parser-perl_3.71.bb: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:47:20 -0000

HTML::Parser and RPROVIDES added

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libhtml-parser-perl_3.71.bb                    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libhtml-parser-perl/libhtml-parser-perl_3.71.bb

diff --git a/meta-perl/recipes-perl/libhtml-parser-perl/libhtml-parser-perl_3.71.bb b/meta-perl/recipes-perl/libhtml-parser-perl/libhtml-parser-perl_3.71.bb
new file mode 100644
index 0000000..ad8c57a
--- /dev/null
+++ b/meta-perl/recipes-perl/libhtml-parser-perl/libhtml-parser-perl_3.71.bb
@@ -0,0 +1,29 @@
+SUMARRY = "This package contains the Parser.pm module with friends."
+AUTHOR = "Gisle Aas <gisle@activestate.com>"
+HOMEPAGE = "https://metacpan.org/release/HTML-Parser"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=6c3dacf9f405c7483870ab5f148770c3"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
+SRC_URI[md5sum] = "9128a45893097dfa3bf03301b19c5efe"
+SRC_URI[sha256sum] = "be918b3749d3ff93627f72ee4b825683332ecb4c81c67a3a8d72b0435ffbd802"
+
+RDEPENDS_${PN} += 'libhtml-tagset-perl libxsloader-perl'
+
+RPROVIDES_${PN} += "libhtml-entities-perl \
+                    libhtml-filter-perl \
+                    libhtml-headparser-perl \
+                    libhtml-linkextor-perl \
+                    libhtml-parser-perl \
+                    libhtml-pullparser-perl \
+                    libhtml-tokeparser-perl \
+                    "
+
+S = "${WORKDIR}/HTML-Parser-${PV}"
+
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.rc3


