Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id DE7496C044
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:41:43 +0000 (UTC)
Received: (qmail 25921 invoked by uid 89); 3 Sep 2013 15:41:33 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:41:33 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 17:41:10 +0200
Message-Id: <1378222870-14027-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl][PATCH] libencode-locale-perl_1.03: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:41:44 -0000

Encode::Locale added

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libencode-locale-perl_1.03.bb                    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libencode-locale-perl/libencode-locale-perl_1.03.bb

diff --git a/meta-perl/recipes-perl/libencode-locale-perl/libencode-locale-perl_1.03.bb b/meta-perl/recipes-perl/libencode-locale-perl/libencode-locale-perl_1.03.bb
new file mode 100644
index 0000000..1919488
--- /dev/null
+++ b/meta-perl/recipes-perl/libencode-locale-perl/libencode-locale-perl_1.03.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Encode::Locale - Determine the locale encoding"
+AUTHOR = "Gisle Aas <gisle@activestate.com>"
+HOMEPAGE = "https://metacpan.org/module/Encode::Locale"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=14e8006c2134045725fd81292a323d24"
+
+RDEPENDS_${PN} = "libencode-perl \
+                 libencode-alias-perl \
+                 "
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/G/GA/GAAS/Encode-Locale-${PV}.tar.gz"
+SRC_URI[md5sum] = "de8422d068634e7c1068dab4e18b452f"
+SRC_URI[sha256sum] = "f76337e0933225914111fcc3319ff4db359b1abfd1aa56dff2df5378db0e2d55"
+
+S = "${WORKDIR}/Encode-Locale-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.rc3


