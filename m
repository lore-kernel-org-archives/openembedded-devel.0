Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7046C018
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:38:48 +0000 (UTC)
Received: (qmail 25820 invoked by uid 89); 3 Sep 2013 15:38:38 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:38:38 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 17:38:11 +0200
Message-Id: <1378222691-13852-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl][PATCH] libdigest-md5-perl_2.53: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:38:49 -0000

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libdigest-md5-perl/libdigest-md5-perl_2.53.bb      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libdigest-md5-perl/libdigest-md5-perl_2.53.bb

diff --git a/meta-perl/recipes-perl/libdigest-md5-perl/libdigest-md5-perl_2.53.bb b/meta-perl/recipes-perl/libdigest-md5-perl/libdigest-md5-perl_2.53.bb
new file mode 100644
index 0000000..bbbaf2d
--- /dev/null
+++ b/meta-perl/recipes-perl/libdigest-md5-perl/libdigest-md5-perl_2.53.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Digest::MD5 - Perl interface to the MD5 Algorithm"
+AUTHOR = "Gisle Aas <gisle@activestate.com>"
+HOMEPAGE = "https://metacpan.org/module/Digest::MD5"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=2f93400875dbb56f36691d5f69f3eba5"
+
+RDEPENDS_${PN} = "libdigest-base-perl"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/G/GA/GAAS/Digest-MD5-${PV}.tar.gz"
+SRC_URI[md5sum] = "affc629d05c4c7b3efe4b3b874bce528"
+SRC_URI[sha256sum] = "cde667c0c0c8a4d819d332ba9a4cad7e9f75fc7cabd490aae405ce7bc54d5152"
+
+S = "${WORKDIR}/Digest-MD5-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.rc3


