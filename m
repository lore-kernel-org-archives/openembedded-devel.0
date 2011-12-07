Received: from fb2.tech.numericable.fr ([82.216.111.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.gardet@oliseo.fr>) id 1RYHw5-0005lC-Qa
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 14:53:25 +0100
Received: from smtp4.tech.numericable.fr (smtp4.nc.sdv.fr [10.0.0.60])
	by fb2.tech.numericable.fr (Postfix) with ESMTP id ABE2819D11A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2011 14:46:39 +0100 (CET)
Received: from localhost.localdomain (164.60-224-89.dsl.completel.net
	[89.224.60.164])
	by smtp4.tech.numericable.fr (Postfix) with ESMTP id 28E3712A823;
	Wed,  7 Dec 2011 14:46:36 +0100 (CET)
From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Dec 2011 14:46:24 +0100
Message-Id: <1323265584-7090-1-git-send-email-guillaume.gardet@oliseo.fr>
X-Mailer: git-send-email 1.7.7
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefjedrudehucetggdotefuucfrrhhofhhilhgvmecupfgfoffgtffkveetuefngfenuceurghilhhouhhtmecufedttdenuc
Cc: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Subject: [PATCH v2] Fix git URL to linux-omap git repo.
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
X-List-Received-Date: Wed, 07 Dec 2011 13:53:26 -0000

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
---
 recipes/linux/linux-kexecboot_2.6.32.bb |    2 +-
 recipes/linux/linux-omap2_git.bb        |    2 +-
 recipes/linux/linux-omap_2.6.26.bb      |    2 +-
 recipes/linux/linux-omap_2.6.27.bb      |    2 +-
 recipes/linux/linux-omap_2.6.28.bb      |    2 +-
 recipes/linux/linux-omap_2.6.29.bb      |    2 +-
 recipes/linux/linux-omap_2.6.31.bb      |    2 +-
 recipes/linux/linux-omap_2.6.32.bb      |    2 +-
 recipes/linux/linux-omap_2.6.37.bb      |    2 +-
 recipes/linux/linux-omap_2.6.38.bb      |    2 +-
 recipes/linux/linux-omap_2.6.39.bb      |    2 +-
 recipes/linux/linux-omap_git.bb         |    2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes/linux/linux-kexecboot_2.6.32.bb b/recipes/linux/linux-kexecboot_2.6.32.bb
index 4c3294a..0c0d2af 100644
--- a/recipes/linux/linux-kexecboot_2.6.32.bb
+++ b/recipes/linux/linux-kexecboot_2.6.32.bb
@@ -21,7 +21,7 @@ SRC_URI += "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=k
 SRC_URI[kernel.md5sum] = "260551284ac224c3a43c4adac7df4879"
 SRC_URI[kernel.sha256sum] = "5099786d80b8407d98a619df00209c2353517f22d804fdd9533b362adcb4504e"
 
-SRC_URI_append_omap3 = " git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git;rev=6833f1a8cdcb65a370f898bde6b6af63f81962df \
+SRC_URI_append_omap3 = " git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git;rev=6833f1a8cdcb65a370f898bde6b6af63f81962df \
 file://defconfig \
 file://sctp-fix.patch \
 file://cm-t35/0001-omap3-cm-t35-add-mux-initialization.patch \
diff --git a/recipes/linux/linux-omap2_git.bb b/recipes/linux/linux-omap2_git.bb
index cb427e3..ad3a7eb 100644
--- a/recipes/linux/linux-omap2_git.bb
+++ b/recipes/linux/linux-omap2_git.bb
@@ -8,7 +8,7 @@ PV = "2.6.26"
 #PV = "2.6.26+2.6.27-rc1+${PR}+git${SRCREV}"
 PR = "r64"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append_beagleboard = " file://no-harry-potter.diff \
diff --git a/recipes/linux/linux-omap_2.6.26.bb b/recipes/linux/linux-omap_2.6.26.bb
index 0c8dcd9..0d74820 100644
--- a/recipes/linux/linux-omap_2.6.26.bb
+++ b/recipes/linux/linux-omap_2.6.26.bb
@@ -5,7 +5,7 @@ SRCREV = "d6daf8d8cc5ccf90247def5551ee9c3e8555e848"
 PV = "2.6.26"
 PR = "r65"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append_beagleboard = " file://no-harry-potter.diff \
diff --git a/recipes/linux/linux-omap_2.6.27.bb b/recipes/linux/linux-omap_2.6.27.bb
index fdf0fdd..36f86d9 100644
--- a/recipes/linux/linux-omap_2.6.27.bb
+++ b/recipes/linux/linux-omap_2.6.27.bb
@@ -8,7 +8,7 @@ COMPATIBLE_MACHINE = "omap5912osk|omap1710h3|omap2430sdp|omap2420h4|beagleboard|
 SRCREV = "2a3408be17f287fdb5809c9b6c68e7ad96d25b74"
 PR = "r14"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " \
diff --git a/recipes/linux/linux-omap_2.6.28.bb b/recipes/linux/linux-omap_2.6.28.bb
index 622a38d..53fcc83 100644
--- a/recipes/linux/linux-omap_2.6.28.bb
+++ b/recipes/linux/linux-omap_2.6.28.bb
@@ -11,7 +11,7 @@ SRCREV = "79d042a081d3e467c735bb0d9569ed6296f85a3c"
 
 PV = "2.6.28"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;branch=omap-2.6.28;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;branch=omap-2.6.28;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " \
diff --git a/recipes/linux/linux-omap_2.6.29.bb b/recipes/linux/linux-omap_2.6.29.bb
index a87fb25..3248dc3 100644
--- a/recipes/linux/linux-omap_2.6.29.bb
+++ b/recipes/linux/linux-omap_2.6.29.bb
@@ -17,7 +17,7 @@ SRCREV = "58cf2f1425abfd3a449f9fe985e48be2d2555022"
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 PR_append = "+gitr${SRCREV}"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " \
diff --git a/recipes/linux/linux-omap_2.6.31.bb b/recipes/linux/linux-omap_2.6.31.bb
index 0f1e79b..2b627ca 100644
--- a/recipes/linux/linux-omap_2.6.31.bb
+++ b/recipes/linux/linux-omap_2.6.31.bb
@@ -13,7 +13,7 @@ SRCREV = "945044d157dd63c6af0f2ed40a5346382af94eb4"
 #PV = "2.6.30+2.6.31-rc8+gitr${SRCREV}"
 PV = "2.6.31"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " \
diff --git a/recipes/linux/linux-omap_2.6.32.bb b/recipes/linux/linux-omap_2.6.32.bb
index 348ec96..f5aacda 100644
--- a/recipes/linux/linux-omap_2.6.32.bb
+++ b/recipes/linux/linux-omap_2.6.32.bb
@@ -13,7 +13,7 @@ SRCREV = "89c9eaeb92c97348dcabd6cb377b646c00855f6a"
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 PV = "2.6.32"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " \
diff --git a/recipes/linux/linux-omap_2.6.37.bb b/recipes/linux/linux-omap_2.6.37.bb
index 9c7ce01..6c63fa7 100644
--- a/recipes/linux/linux-omap_2.6.37.bb
+++ b/recipes/linux/linux-omap_2.6.37.bb
@@ -12,7 +12,7 @@ SRCREV = "fa3b4e23ec20cfc944db7cc2b30b0d82c20e4472"
 
 FILESPATHPKG_prepend = "linux-omap-2.6.37:"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " \
diff --git a/recipes/linux/linux-omap_2.6.38.bb b/recipes/linux/linux-omap_2.6.38.bb
index b79d701..732e6df 100644
--- a/recipes/linux/linux-omap_2.6.38.bb
+++ b/recipes/linux/linux-omap_2.6.38.bb
@@ -12,7 +12,7 @@ SRCREV = "73ee404d7dedd23e35aae3ce516c504db783716f"
 
 FILESPATHPKG_prepend = "linux-omap-2.6.38:"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " file://base/0001-ARM-OMAP-beagleboard-Add-infrastructure-to-do-fixups.patch \
diff --git a/recipes/linux/linux-omap_2.6.39.bb b/recipes/linux/linux-omap_2.6.39.bb
index 3880aa1..8172d5a 100644
--- a/recipes/linux/linux-omap_2.6.39.bb
+++ b/recipes/linux/linux-omap_2.6.39.bb
@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "o"
 
 FILESPATHPKG_prepend = "linux-omap-2.6.39:"
 
-SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
             file://defconfig"
 
 SRC_URI_append = " \
diff --git a/recipes/linux/linux-omap_git.bb b/recipes/linux/linux-omap_git.bb
index e74e8cf..1d729c2 100644
--- a/recipes/linux/linux-omap_git.bb
+++ b/recipes/linux/linux-omap_git.bb
@@ -15,7 +15,7 @@ FILESPATHPKG_prepend = "linux-omap-2.6.31:"
 #PV = "2.6.30+2.6.31-rc8+gitr${SRCREV}"
 PV = "2.6.31"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " \
-- 
1.7.7



