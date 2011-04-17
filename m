Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QBWpY-0005qK-U9
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 20:36:22 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJT00CGG7K69T1D@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	17 Apr 2011 13:33:47 -0500 (CDT)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E0C1D14AF5A; Sun,
	17 Apr 2011 14:33:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Apr 2011 14:33:33 -0400
Message-id: <1303065213-11991-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.4.1
In-reply-to: <1302319620-18223-5-git-send-email-heroor@gmail.com>
References: <1302319620-18223-5-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>, Denys Dmytriyenko <denys@ti.com>
Subject: [PATCHv4 5/5] ti-syslink-libs: Add Syslink version 02.00.00.68 Beta1
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
X-List-Received-Date: Sun, 17 Apr 2011 18:36:22 -0000

From: Siddharth Heroor <heroor@ti.com>

Signed-off-by: Siddharth Heroor <heroor@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...i-syslink-libs_02.00.00.67+02.00.00.68-beta1.bb |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68-beta1.bb

diff --git a/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68-beta1.bb b/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68-beta1.bb
new file mode 100644
index 0000000..a5ec783
--- /dev/null
+++ b/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68-beta1.bb
@@ -0,0 +1,23 @@
+require ti-syslink-libs.inc
+
+SYSLINKVER = "02_00_00_68_beta1"
+PV = "02_00_00_67+02_00_00_68-beta1"
+
+S = "${WORKDIR}/syslink_${SYSLINKVER}"
+SYSLINK_ROOT = "${WORKDIR}/syslink_${SYSLINKVER}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${SYSLINKVER}/exports/syslink_${SYSLINKVER}.tar.gz;name=syslinktarball"
+SRC_URI[syslinktarball.md5sum] = "468034372124f70f82b60cfb5f11c8e8"
+SRC_URI[syslinktarball.sha256sum] = "ed574dcb3a5477cfbc69a1c9e768d5197291cb057d19fd791e16e1c89af3e8e1"
+
+do_configure() {
+    # Update config.bld
+    sed -i \
+        -e s:^C674_ELF.rootDir.*:C674_ELF.rootDir\ =\ \"${CODEGEN_INSTALL_DIR}\":g \
+        -e s:C64P_COFF,://C64P_COFF:g \
+        -e s:C64P_ELF,://C64P_ELF:g \
+        -e s:C674_COFF,://C674P_COFF:g \
+        -e s:M3_ELF,://M3_ELF:g \
+        -e s:A8_ELF$://A8_ELF:g \
+        ${S}/config.bld
+}
-- 
1.7.0.4



