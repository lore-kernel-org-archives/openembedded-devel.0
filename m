Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9aYE-0003Dw-35
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:47:14 +0200
Received: from archHP.dbnet.local (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id AC00A4840D;
	Thu,  6 Sep 2012 09:01:45 +0100 (BST)
From: ml@communistcode.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 12:35:46 +0100
Message-Id: <1346931347-8672-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCHv5][meta-oe 1/2] liblockdev: new recipe, new version of libcec requires it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 11:47:14 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

V5

- FILES_{PN} no loger required now libdir and includedir are passed to
oe_runmake

V4

- Remove debian packaging patch, it is not needed

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-extended/liblockdev/liblockdev_1.0.3.bb  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb

diff --git a/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
new file mode 100644
index 0000000..210a47b
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Manage character and block device lockfiles."
+HOMEPAGE = "http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/l/lockdev/lockdev_${PV}.orig.tar.gz"
+
+SRC_URI[md5sum] = "64b9c1b87b125fc348e892e24625524a"
+SRC_URI[sha256sum] = "ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82"
+
+S = "${WORKDIR}/lockdev-${PV}"
+
+do_compile() {
+  oe_runmake CC="${CC}" LD="${LD}" shared
+}
+
+do_install() {
+  oe_runmake basedir="${D}" incdir="${D}${includedir}" libdir="${D}${libdir}" install_dev
+}
-- 
1.7.12



