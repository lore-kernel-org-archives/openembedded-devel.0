Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Haz-0001ap-KD
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 17:32:49 +0200
Received: from archHP.dbnet.local (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 579764ED97;
	Wed,  5 Sep 2012 12:50:29 +0100 (BST)
From: ml@communistcode.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 16:21:33 +0100
Message-Id: <1346858494-4849-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCHv4 2/3] liblockdev: new recipe, new version of libcec requires it
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
X-List-Received-Date: Wed, 05 Sep 2012 15:32:49 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

V4

- Remove debian packaging patch, it is not needed

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../liblockdev/liblockdev_1.0.3.bb                 | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb

diff --git a/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
new file mode 100644
index 0000000..be5ce44
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Manage character and block device lockfiles."
+HOMEPAGE = "http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+PV = "1.0.3"
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
+
+FILES_{PN} = "${includedir}/* \
+              ${libdir}/* \
+"
-- 
1.7.12



