Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sgl40-0005z0-VM
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 01:08:53 +0200
Received: from mizar.localdomain (79.21.254.221) by smtp208.alice.it
	(8.6.023.02) id 4F056E8512F6CDB6; Tue, 19 Jun 2012 00:58:10 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 00:58:04 +0200
Message-Id: <1340060286-28769-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1340060286-28769-1-git-send-email-andrea.adami@gmail.com>
References: <1340060286-28769-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH 2/4] kexecboot-cfg: update and use new LABEL separator
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
X-List-Received-Date: Mon, 18 Jun 2012 23:08:53 -0000

* previously the sections were separated by KERNEL string

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb     |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
index 4dca06c..6f70edd 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
@@ -21,11 +21,10 @@ do_configure_prepend () {
 
 do_install_prepend () {
 echo '# First kernel stanza.
-# Specify full kernel path on target.
-KERNEL=/boot/${KERNEL_IMAGETYPE}
-
 # Show this label in kexecboot menu.
 LABEL=${KEXECBOOT_LABEL}
+# Specify full kernel path on target.
+KERNEL=/boot/${KERNEL_IMAGETYPE}
 #
 # Append this tags to the kernel cmdline.
 APPEND=${CMDLINE} ${CMDLINE_DEBUG}
@@ -44,8 +43,8 @@ APPEND=${CMDLINE} ${CMDLINE_DEBUG}
 #
 #
 # Second kernel stanza.
-# KERNEL=/boot/${KERNEL_IMAGETYPE}-test
 # LABEL=${KEXECBOOT_LABEL}-test
+# KERNEL=/boot/${KERNEL_IMAGETYPE}-test
 # APPEND=${CMDLINE}
 #' >> ${S}/boot.cfg
 }
-- 
1.7.3.4



