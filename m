Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1R1g58-0002Gm-DW
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 16:59:58 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R1fg7-0005Rh-JJ from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 07:34:07 -0700
Received: from localhost.localdomain ([137.202.157.139]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 8 Sep 2011 16:34:06 +0200
From: "Mehmood, Imran" <Imran_Mehmood@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Sep 2011 19:32:41 +0500
Message-Id: <94a25d92b4d0e9379caaab127ccac1a94e9e4d28.1315491183.git.Imran_Mehmood@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1315491183.git.Imran_Mehmood@mentor.com>
References: <cover.1315491183.git.Imran_Mehmood@mentor.com>
In-Reply-To: <Imran_Mehmood@mentor.com>
References: <Imran_Mehmood@mentor.com>
X-OriginalArrivalTime: 08 Sep 2011 14:34:06.0741 (UTC)
	FILETIME=[5D2BD450:01CC6E34]
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: [meta-oe][PATCH 1/1] cramfs: Adds cvs version recipe (initial recipe)
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
X-List-Received-Date: Thu, 08 Sep 2011 14:59:58 -0000

From: Imran Mehmood <Imran_Mehmood@mentor.com>

* Imported from oe.dev commit id e0728e428367d5534d6a56e452487529c5ec4918
* Added do_compile_prepend to make symbolic link named Makefile pointing to GNUmakefile to resolve missing Makefile error.

Signed-off-by: Imran Mehmood <Imran_Mehmood@mentor.com>
---
 meta-oe/recipes-support/cramfs/cramfs_cvs.bb |   29 ++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/cramfs/cramfs_cvs.bb

diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
new file mode 100644
index 0000000..667097c
--- /dev/null
+++ b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Builds cramfs filesystems for embedded systems"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/linux/COPYING;md5=9579385572eb40eded61dcb07e0038a4"
+DEPENDS = "zlib"
+SRCDATE = "20110110"
+PV = "1.1+cvs${SRCDATE}"
+
+SRC_URI = "cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;module=linux"
+S = "${WORKDIR}/linux/scripts/cramfs"
+
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'CFLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
+
+
+do_compile_prepend() {
+        ln -s GNUmakefile Makefile
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install mkcramfs ${D}${bindir}
+	install cramfsck ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native"
+
-- 
1.7.0.4



