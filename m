Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM59E-0003Bd-4y
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:07:12 +0200
Received: (qmail 32115 invoked by uid 813007); 1 Jul 2009 18:55:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:55:16 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:59 +0200
Message-Id: <1246474518-16737-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011819.54127.marcin@juszkiewicz.com.pl>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 077/125] kexecboot: require ../linux/linux.inc, not recipes/linux/linux.inc.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:07:12 -0000

From: Chris Larson <clarson@mvista.com>

linux-kexecboot.inc does a 'require recipes/linux/linux.inc', but it really
depends on how the upstream OpenEmbedded linux/linux.inc behaves, not whatever
the first one it finds in BBPATH does.  This broke builds for me combining
upstream OpenEmbedded with some local collections that do different things
with their kernels.

Signed-off-by: Chris Larson <clarson@mvista.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/kexecboot/linux-kexecboot.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/kexecboot/linux-kexecboot.inc b/recipes/kexecboot/linux-kexecboot.inc
index 31b6377..eba5d66 100644
--- a/recipes/kexecboot/linux-kexecboot.inc
+++ b/recipes/kexecboot/linux-kexecboot.inc
@@ -6,7 +6,7 @@ SRC_URI = "file://defconfig"
 LOGO_SIZE = '${@base_conditional("GUI_MACHINE_CLASS", "bigscreen", "vga", "qvga", d)}'
 SRC_URI += "file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2"
 
-require recipes/linux/linux.inc
+require ../linux/linux.inc
 
 DONT_CHECK_KERNELSIZE = ""
 INITRAMFS_IMAGE = "initramfs-kexecboot-image"
-- 
1.6.3.1





