Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RnfRq-0004St-KP
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 01:01:46 +0100
Received: from mizar.localdomain (87.0.248.69) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650162CFB6; Thu, 19 Jan 2012 00:54:10 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 00:52:58 +0100
Message-Id: <1326930779-21885-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
References: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 2/3] kexecboot-cfg: Inhibit toolchain dependencies and echo $DISTRO_VERSION
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
X-List-Received-Date: Thu, 19 Jan 2012 00:01:46 -0000

* $DISTRO_VERSION is always set and is more detailed
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
index 24dd2a4..3bc212e 100644
--- a/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
+++ b/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
@@ -3,7 +3,9 @@ SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r12"
+PR = "r13"
+
+INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://icon.xpm"
 
@@ -20,7 +22,7 @@ echo '# First kernel stanza.
 KERNEL=/boot/${KERNEL_IMAGETYPE}
 
 # Show this label in kexecboot menu.
-LABEL=${DISTRO}-${MACHINE}
+LABEL=${DISTRO_VERSION}-${MACHINE}
 #
 # Append this tags to the kernel cmdline.
 APPEND=${CMDLINE} ${CMDLINE_DEBUG}
-- 
1.7.3.4



