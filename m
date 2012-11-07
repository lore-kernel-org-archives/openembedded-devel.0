Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.macdonald@windriver.com>) id 1TWBJL-0006tX-5E
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Nov 2012 20:29:31 +0100
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA7JFQ6a019564;
	Wed, 7 Nov 2012 11:15:27 -0800 (PST)
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Nov 2012 14:15:21 -0500
Message-Id: <1352315721-7792-2-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.11.3
In-Reply-To: <1352315721-7792-1-git-send-email-joe.macdonald@windriver.com>
References: <1352315721-7792-1-git-send-email-joe.macdonald@windriver.com>
Cc: dennis.hall@windriver.com
Subject: [meta-networking][PATCH] aoetools: add a recipe for version 34
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
X-List-Received-Date: Wed, 07 Nov 2012 19:29:31 -0000

From: dhall <dennis.hall@windriver.com>

Add the aoetools (ATA over Ethernet) package to be
used along with a kernel module(aoe.ko) and server
software(vblade) to support ATA over ethernet network
storage.

Signed-off-by: dhall <dennis.hall@windriver.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 .../recipes-support/aoetools/aoetools_34.bb        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-support/aoetools/aoetools_34.bb

diff --git a/meta-networking/recipes-support/aoetools/aoetools_34.bb b/meta-networking/recipes-support/aoetools/aoetools_34.bb
new file mode 100644
index 0000000..07bfb0f
--- /dev/null
+++ b/meta-networking/recipes-support/aoetools/aoetools_34.bb
@@ -0,0 +1,25 @@
+SUMMARY = "ATA over Ethernet Tools"
+DESCRIPTION = " \
+The aoetools are programs for users of the ATA over Ethernet (AoE)network \
+storage protocol, a simple protocol for using storage over anethernet LAN. \
+The vblade program (storage target) exports a blockdevice using AoE. \
+"
+HOMEPAGE = "http://sourceforge.net/projects/${PN}"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+RRECOMMENDS_${PN} = "kernel-module-aoe"
+PR = "r0"
+
+
+SRC_URI = "http://sourceforge.net/projects/${PN}/files/${PN}/${PV}/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "cde7f7cedc7cd9938a5ebfd009dd3ec0"
+SRC_URI[sha256sum] = "fd6c57244e9458d7cbe7a0171295ddee4d8cdcae291e40d6acbc641df7296d85"
+
+# EXTRA_OEMAKE is typically: -e MAKEFLAGS=
+# the -e causes problems as CFLAGS is modified in the Makefile.
+EXTRA_OEMAKE = ""
+
+do_install() {
+        oe_runmake DESTDIR=${D} install
+}
-- 
1.7.11.3



