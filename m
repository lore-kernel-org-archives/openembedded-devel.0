Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6546C04A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:43:35 +0000 (UTC)
Received: (qmail 25951 invoked by uid 89); 3 Sep 2013 15:43:25 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:43:25 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 17:43:02 +0200
Message-Id: <1378222982-14097-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl][PATCH] libfile-listing-perl_6.04: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:43:36 -0000

File::Listing added

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libfile-listing-perl_6.04.bb                   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libfile-listing-perl/libfile-listing-perl_6.04.bb

diff --git a/meta-perl/recipes-perl/libfile-listing-perl/libfile-listing-perl_6.04.bb b/meta-perl/recipes-perl/libfile-listing-perl/libfile-listing-perl_6.04.bb
new file mode 100644
index 0000000..991de44
--- /dev/null
+++ b/meta-perl/recipes-perl/libfile-listing-perl/libfile-listing-perl_6.04.bb
@@ -0,0 +1,26 @@
+SUMMARY = "File::Listing - parse directory listing"
+AUTHOR = "Gisle Aas <gisle@activestate.com>"
+HOMEPAGE = "https://metacpan.org/module/File::Listing"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=b797097ead2abb910a9b40c0393742c3"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/G/GA/GAAS/File-Listing-${PV}.tar.gz"
+SRC_URI[md5sum] = "83f636b477741f3a014585bb9cc079a6"
+SRC_URI[sha256sum] = "1e0050fcd6789a2179ec0db282bf1e90fb92be35d1171588bd9c47d52d959cf5"
+
+RDEPENDS_${PN} += 'libhttp-date-perl'
+
+RPROVIDES_${PN} += "libfile-listing-perl \
+                    libfile-listing-apache-perl \
+                    libfile-listing-dosftp-perl \
+                    libfile-listing-netware-perl \
+                    libfile-listing-unix-perl \
+                    libfile-listing-vms-perl \
+                    "
+
+S = "${WORKDIR}/File-Listing-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.rc3


