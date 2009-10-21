Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N0WXZ-0005NA-Jj
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 10:27:32 +0200
Received: (qmail 12847 invoked by uid 813007); 21 Oct 2009 08:26:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 Oct 2009 08:26:29 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2009 10:28:15 +0200
Message-Id: <1256113695-18662-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH] linux-bug: added extra staging, bumped SRCREV
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
X-List-Received-Date: Wed, 21 Oct 2009 08:27:32 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>


Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
---
 recipes/linux/linux-bug_2.6.27.2.bb |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/recipes/linux/linux-bug_2.6.27.2.bb b/recipes/linux/linux-bug_2.6.27.2.bb
index b5899a7..8c83f9a 100644
--- a/recipes/linux/linux-bug_2.6.27.2.bb
+++ b/recipes/linux/linux-bug_2.6.27.2.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Linux kernel for bug"
 
 PV_append = "+svnr${SRCREV}"
 KV = "2.6.27.2"
-PR = "r28"
+PR = "r29"
 
 COMPATIBLE_MACHINE = "bug"
 
 SVN_PRJ = "bug-linux-${KV}"
-SRCREV = "10017"
+SRCREV = "10199"
 
 SRC_URI = "svn://svn.buglabs.net/bug/branches/R1.4/qa;module=${SVN_PRJ};proto=svn \
            file://defconfig \
@@ -21,10 +21,17 @@ UBOOT_ENTRYPOINT = "0x80008000"
 require linux.inc
 
 do_install_append() {
-#        install -m 0644 arch/${ARCH}/boot/uImage ${D}/${KERNEL_IMAGEDEST}/uImage-${KERNEL_VERSION}
         cd ${D}/${KERNEL_IMAGEDEST} && ln -sf uImage-${KERNEL_VERSION} uImage
 }
 
+do_stage_append() {
+	cp -fR arch/arm/include/asm/* ${STAGING_KERNEL_DIR}/include/asm/
+	if [ ! -e ${STAGING_KERNEL_DIR}/include/mach ]; then
+		mkdir ${STAGING_KERNEL_DIR}/include/mach
+	fi
+	cp -fR arch/arm/plat-mxc/include/mach/* ${STAGING_KERNEL_DIR}/include/mach/
+}
+
 FILESDIR = "${WORKDIR}"
 FILES_kernel-image += "${KERNEL_IMAGEDEST}/uImage*"
 
-- 
1.6.5





