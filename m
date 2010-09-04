Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <plagnioj@jcrosoft.com>) id 1OrjEY-0001yG-3t
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 05:16:04 +0200
Received: (qmail 7407 invoked by uid 503); 4 Sep 2010 03:37:27 -0000
Received: from b7.ovh.net (HELO mail409.ha.ovh.net) (213.186.33.57)
	by 63.mail-out.ovh.net with SMTP; 4 Sep 2010 03:37:27 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Sep 2010 05:15:24 +0200
Received: from ns32433.ovh.net (HELO localhost)
	(plagnioj%jcrosoft.com@213.251.161.87)
	by ns0.ovh.net with SMTP; 4 Sep 2010 05:15:22 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Sep 2010 05:14:45 +0200
Message-Id: <1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20100903111210.GA17702@game.jcrosoft.org>
References: <20100903111210.GA17702@game.jcrosoft.org>
X-Ovh-Tracer-Id: 13387512842683067209
X-Ovh-Remote: 213.251.161.87 (ns32433.ovh.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: plagnioj@jcrosoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it global
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
X-List-Received-Date: Sat, 04 Sep 2010 03:16:04 -0000

add global OVERRIDES ${TARGET_SOC_FAMILY} and ${TARGET_ARCH}_${TARGET_SOC_FAMILY}

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 classes/base.bbclass                  |    4 ++--
 conf/bitbake.conf                     |    6 ++++--
 conf/distro/include/angstrom.inc      |    6 ++----
 conf/machine/include/dm355.inc        |    2 +-
 conf/machine/include/dm365.inc        |    2 +-
 conf/machine/include/dm6446.inc       |    2 +-
 conf/machine/include/dm6467.inc       |    2 +-
 conf/machine/include/omap3.inc        |    2 +-
 conf/machine/include/omapl137.inc     |    2 +-
 conf/machine/include/omapl138.inc     |    2 +-
 recipes/ti/ti-codec-engine.inc        |    2 +-
 recipes/ti/ti-dsplink.inc             |    2 +-
 recipes/ti/ti-linuxutils.inc          |    4 ++--
 recipes/ti/ti-local-power-manager.inc |    2 +-
 14 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 299e875..0085655 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -336,8 +336,8 @@ python () {
             import re
             this_machine = bb.data.getVar('MACHINE', d, 1)
             if this_machine and not re.match(need_machine, this_machine):
-                this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
-                if this_soc_family and not re.match(need_machine, this_soc_family):
+                this_target_soc_family = bb.data.getVar('TARGET_SOC_FAMILY', d, 1)
+                if this_target_soc_family and not re.match(need_machine, this_target_soc_family):
                     raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
 
         need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 677c76a..672d8df 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -113,6 +113,8 @@ TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS'
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
 TARGET_EXEEXT = ""
+TARGET_SOC_FAMILY ?= "Unknown"
+
 
 SDK_ARCH ?= "${BUILD_ARCH}"
 SDK_OS ?= "${BUILD_OS}"
@@ -677,9 +679,9 @@ BUILDCFG_NEEDEDVARS ?= "TARGET_ARCH TARGET_OS"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:${TARGET_SOC_FAMILY}:${TARGET_ARCH}_${TARGET_SOC_FAMILY}:build-${BUILD_OS}:fail-fast:pn-${PN}"
 # Alternative OVERRIDES definition without "fail fast", usually only for native building and Scratchbox toolchains.
-#OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}"
+#OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:${TARGET_SOC_FAMILY}:${TARGET_ARCH}_${TARGET_SOC_FAMILY}:build-${BUILD_OS}:pn-${PN}"
 
 ##################################################################
 # Include the rest of the config files.
diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 8983c86..ae6781d 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -11,10 +11,8 @@ BUILDNAME = "Angstrom ${DISTRO_VERSION}"
 
 TARGET_VENDOR = "-angstrom"
 
-SOC_FAMILY ?= "Unknown"
-
-# Add FEED_ARCH and SOC_FAMILY to overrides
-OVERRIDES .= ":${FEED_ARCH}:${SOC_FAMILY}"
+# Add FEED_ARCH to overrides
+OVERRIDES .= ":${FEED_ARCH}"
 
 # Put links to sources in deploy/sources to make it easier for people to be GPL compliant
 INHERIT += "src_distribute_local"
diff --git a/conf/machine/include/dm355.inc b/conf/machine/include/dm355.inc
index d666d5e..19556691 100644
--- a/conf/machine/include/dm355.inc
+++ b/conf/machine/include/dm355.inc
@@ -1,2 +1,2 @@
-SOC_FAMILY = "dm355"
+TARGET_SOC_FAMILY = "dm355"
 
diff --git a/conf/machine/include/dm365.inc b/conf/machine/include/dm365.inc
index b974f2c..6793c74 100644
--- a/conf/machine/include/dm365.inc
+++ b/conf/machine/include/dm365.inc
@@ -1,2 +1,2 @@
-SOC_FAMILY = "dm365"
+TARGET_SOC_FAMILY = "dm365"
 
diff --git a/conf/machine/include/dm6446.inc b/conf/machine/include/dm6446.inc
index 827b375..5e2f16c 100644
--- a/conf/machine/include/dm6446.inc
+++ b/conf/machine/include/dm6446.inc
@@ -1,2 +1,2 @@
-SOC_FAMILY = "dm6446"
+TARGET_SOC_FAMILY = "dm6446"
 
diff --git a/conf/machine/include/dm6467.inc b/conf/machine/include/dm6467.inc
index 5200f85..b5ed729 100644
--- a/conf/machine/include/dm6467.inc
+++ b/conf/machine/include/dm6467.inc
@@ -1 +1 @@
-SOC_FAMILY = "dm6467"
+TARGET_SOC_FAMILY = "dm6467"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 1052296..d1ffcad 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -1,4 +1,4 @@
-SOC_FAMILY = "omap3"
+TARGET_SOC_FAMILY = "omap3"
 
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
diff --git a/conf/machine/include/omapl137.inc b/conf/machine/include/omapl137.inc
index cd84594..7187572 100644
--- a/conf/machine/include/omapl137.inc
+++ b/conf/machine/include/omapl137.inc
@@ -1 +1 @@
-SOC_FAMILY = "omapl137"
+TARGET_SOC_FAMILY = "omapl137"
diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl138.inc
index 4c22275..887aabe 100644
--- a/conf/machine/include/omapl138.inc
+++ b/conf/machine/include/omapl138.inc
@@ -1 +1 @@
-SOC_FAMILY = "omapl138"
+TARGET_SOC_FAMILY = "omapl138"
diff --git a/recipes/ti/ti-codec-engine.inc b/recipes/ti/ti-codec-engine.inc
index 1b89ea7..56347b0 100644
--- a/recipes/ti/ti-codec-engine.inc
+++ b/recipes/ti/ti-codec-engine.inc
@@ -25,7 +25,7 @@ DEPENDS_append_omap3	= " ti-dspbios ti-dsplink ti-local-power-manager ti-cgt6x t
 DEPENDS_append_omapl137 = " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
 DEPENDS_append_omapl138 = " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
 
-# SOC_FAMILY configuration
+# TARGET_SOC_FAMILY configuration
 
 # Define DEVICES variable
 CEEXAMPLESDEVICES_dm6446     = "DM6446"
diff --git a/recipes/ti/ti-dsplink.inc b/recipes/ti/ti-dsplink.inc
index 388d057..2fb7079 100644
--- a/recipes/ti/ti-dsplink.inc
+++ b/recipes/ti/ti-dsplink.inc
@@ -28,7 +28,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/${PV_DL_PATH}/dsplink_l
 DEPENDS = "ti-dspbios ti-xdctools ti-cgt6x" 
 DEPENDS += "virtual/kernel perl-native" 
 
-# SOC_FAMILY configuration
+# TARGET_SOC_FAMILY configuration
 
 DSPLINKPLATFORM_dm6446    = "DAVINCI"
 DSPLINKPLATFORM_dm6467    = "DAVINCIHD"
diff --git a/recipes/ti/ti-linuxutils.inc b/recipes/ti/ti-linuxutils.inc
index 073416a..c650044 100644
--- a/recipes/ti/ti-linuxutils.inc
+++ b/recipes/ti/ti-linuxutils.inc
@@ -18,7 +18,7 @@ inherit module
 do_compile() {
     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 
-    case ${SOC_FAMILY} in 
+    case ${TARGET_SOC_FAMILY} in
     dm365)
             modules="cmem edma irq";;
     omap3)
@@ -53,7 +53,7 @@ do_install () {
       EXEC_DIR="${D}${installdir}/ti-linuxutils-app/cmem-app" \
       install
     # Install EDMA
-    if [ ${SOC_FAMILY} == "dm365" ] ; then
+    if [ ${TARGET_SOC_FAMILY} == "dm365" ] ; then
         cd ${S}/packages/ti/sdo/linuxutils/edma/apps
         make \
          LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" \
diff --git a/recipes/ti/ti-local-power-manager.inc b/recipes/ti/ti-local-power-manager.inc
index a0e3bfd..31f9243 100644
--- a/recipes/ti/ti-local-power-manager.inc
+++ b/recipes/ti/ti-local-power-manager.inc
@@ -22,7 +22,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/lp
 DEPENDS = "ti-dsplink ti-xdctools"
 DEPENDS += "virtual/kernel"
 
-# SOC_FAMILY configuration
+# TARGET_SOC_FAMILY configuration
 
 LPMDSPPOWERSOC_omap3  = "omap3530"
 LPMDSPPOWERSOC_dm6446 = "dm6446"
-- 
1.7.2



