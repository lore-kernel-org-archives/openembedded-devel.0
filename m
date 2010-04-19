Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1O3mdJ-0001Ar-SD
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 10:47:11 +0200
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 76B4B68221;
	Mon, 19 Apr 2010 12:43:12 +0400 (MSD)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1O3mY0-0004eM-As; Mon, 19 Apr 2010 12:41:40 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Apr 2010 12:41:40 +0400
Message-Id: <1271666500-17854-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
X-Altell-MailScanner-ID: 76B4B68221.C38B0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] change INHIBIT_PACKAGE_STRIP to PACKAGE_STRIP with more options
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
X-List-Received-Date: Mon, 19 Apr 2010 08:47:11 -0000

Originally approached with "package.bbclass: introduce KEEP_GNU_DEBUGLINK":
http://patchwork.openembedded.org/patch/886/

Redone with a change from INHIBIT_PACKAGE_STRIP to PACKAGE_STRIP which
allows more options. By default it does exactly the same thing as is done
today, strips the binary, but keeps the gnu.debuglink section. When set to
"no", stripping is not done at all, when set to "full" the gnu.debuglink
section is not re-added to the binary.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/package.bbclass                            |    5 +++--
 conf/distro/sharprom-compatible.conf               |    2 +-
 conf/local.conf.sample                             |   15 +++++++++++----
 recipes/gcc/gcc-package-cross.inc                  |    8 ++++----
 recipes/gcc/gcc-package-sdk.inc                    |    8 ++++----
 recipes/madwifi/madwifi-ng_r2826-20071105.bb       |    2 +-
 recipes/madwifi/madwifi-ng_r3314-20080131.bb       |    2 +-
 recipes/madwifi/madwifi-ng_r3837-20080802.bb       |    2 +-
 recipes/madwifi/madwifi-ng_r3878-20081204.bb       |    2 +-
 recipes/madwifi/madwifi-ng_r4029-20090525.bb       |    2 +-
 recipes/mii-diag/mii-diag_2.11.bb                  |    2 +-
 .../prism2-firmware-update_1.7.4.bb                |    2 +-
 recipes/mtd/mtd-utils-tests_1.2.0+git.bb           |    2 +-
 recipes/nvidia-drivers/nvidia-drivers.inc          |    2 +-
 recipes/nylon/nylon-scripts_cvs.bb                 |    2 +-
 recipes/nylon/nylon-statistics.bb                  |    2 +-
 .../omap3-sgx-modules_1.4.14.2514.bb               |    2 +-
 .../omap3-sgx-modules_1.4.14.2616.bb               |    2 +-
 recipes/snes232/snes232_cvs.bb                     |    2 +-
 recipes/ti/README                                  |    2 +-
 recipes/ti/ti-codecs-dm6467_1.0.0.bb               |    2 +-
 recipes/ti/ti-dm355mm-module_1.13.bb               |    2 +-
 recipes/ti/ti-dm365mm-module.inc                   |    2 +-
 recipes/ti/ti-dvsdk-demos.inc                      |    2 +-
 recipes/ti/ti-linuxutils.inc                       |    2 +-
 recipes/ti/ti-staging.inc                          |    2 +-
 26 files changed, 44 insertions(+), 36 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 062f782..910d282 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -197,7 +197,8 @@ def runstrip(file, d):
 
     os.system("%s'%s' --only-keep-debug '%s' '%s'" % (pathprefix, objcopy, file, debugfile))
     ret = os.system("%s%s" % (pathprefix, stripcmd))
-    os.system("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file))
+    if (bb.data.getVar('PACKAGE_STRIP', d, True) != 'full'):
+        os.system("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file))
 
     if newmode:
         os.chmod(file, origmode)
@@ -389,7 +390,7 @@ python populate_packages () {
 			package_list.append(pkg)
 
 
-	if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, True) != '1'):
+	if (bb.data.getVar('PACKAGE_STRIP', d, True) != 'no'):
 		for f in (bb.data.getVar('PACKAGESTRIPFUNCS', d, True) or '').split():
 			bb.build.exec_func(f, d)
 
diff --git a/conf/distro/sharprom-compatible.conf b/conf/distro/sharprom-compatible.conf
index 0e8e272..caee288 100644
--- a/conf/distro/sharprom-compatible.conf
+++ b/conf/distro/sharprom-compatible.conf
@@ -57,7 +57,7 @@ PREFERRED_VERSION_glibc = "2.2.5"
 PREFERRED_VERSION_linux-libc-headers = "2.4.18"
 
 IPKGBUILDCMD = "ipkg-build -c -o 0 -g 0"
-#INHIBIT_PACKAGE_STRIP = "1"
+#PACKAGE_STRIP = "no"
 
 #
 # Opie
diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index 2cff53b..af20c93 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -124,11 +124,18 @@ IMAGE_FSTYPES = "jffs2 tar"
 # Uncomment this if you want BitBake to emit debugging output
 # BBDEBUG = "yes"
 
-# Uncomment these two if you want BitBake to build images useful for debugging. 
-# Note that INHIBIT_PACKAGE_STRIP needs a package format to be defined.
-# Also note that OE now produces -dbg packages which contain debugging symbols.
+# Use DEBUG_BUILD to build packages with DEBUG_OPTIMIZATION instead of
+# FULL_OPTIMIZATION.
+#
 # DEBUG_BUILD = "1"
-# INHIBIT_PACKAGE_STRIP = "1"
+
+# If you want to have unstripped ready-to-debug binaries, set this to "no",
+# although for debugging you can use automatically produced -dbg packages.
+# If you need to have completely undebuggable builds, set this to "full",
+# by default gnu.debuglink section is left in the binaries after stripping, so
+# this might be useful if you want to have checksum-level binary consistency
+# across successive builds.
+# PACKAGE_STRIP = "no"
 
 # Uncomment these to build a package such that you can use gprof to profile it.
 # NOTE: This will only work with 'linux' targets, not
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 0f91861..f23d7fd 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -1,6 +1,6 @@
-INHIBIT_PACKAGE_STRIP ?= ""
-OLD_INHIBIT_PACKAGE_STRIP := "${INHIBIT_PACKAGE_STRIP}"
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP ?= ""
+OLD_PACKAGE_STRIP := "${PACKAGE_STRIP}"
+PACKAGE_STRIP = "no"
 
 PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
 
@@ -58,7 +58,7 @@ do_install () {
 
        # Manually run the target stripper since we won't get it run by
        # the packaging.
-       if [ "x${OLD_INHIBIT_PACKAGE_STRIP}" != "x1" ]; then
+       if [ "x${OLD_PACKAGE_STRIP}" != "xno" ]; then
                ${TARGET_PREFIX}strip ${D}${target_libdir}/libstdc++.so.* || true
                ${TARGET_PREFIX}strip ${D}${target_libdir}/libg2c.so.* || true
                ${TARGET_PREFIX}strip ${D}${target_base_libdir}/libgcc_s.so.* || true
diff --git a/recipes/gcc/gcc-package-sdk.inc b/recipes/gcc/gcc-package-sdk.inc
index dcf2c89..dd32ec7 100644
--- a/recipes/gcc/gcc-package-sdk.inc
+++ b/recipes/gcc/gcc-package-sdk.inc
@@ -1,6 +1,6 @@
-INHIBIT_PACKAGE_STRIP ?= ""
-OLD_INHIBIT_PACKAGE_STRIP := "${INHIBIT_PACKAGE_STRIP}"
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP ?= ""
+OLD_PACKAGE_STRIP := "${PACKAGE_STRIP}"
+PACKAGE_STRIP = "no"
 
 # Having anything auto depending on gcc-cross-sdk is a really bad idea...
 EXCLUDE_FROM_SHLIBS = "1"
@@ -54,7 +54,7 @@ do_install () {
 
 	# Manually run the target stripper since we won't get it run by
 	# the packaging.
-	if [ "x${OLD_INHIBIT_PACKAGE_STRIP}" != "x1" ]; then
+	if [ "x${OLD_PACKAGE_STRIP}" != "xno" ]; then
 		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libstdc++.so.*
 		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libg2c.so.* || true
 		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libgcc_s.so.*
diff --git a/recipes/madwifi/madwifi-ng_r2826-20071105.bb b/recipes/madwifi/madwifi-ng_r2826-20071105.bb
index 899be22..515458a 100644
--- a/recipes/madwifi/madwifi-ng_r2826-20071105.bb
+++ b/recipes/madwifi/madwifi-ng_r2826-20071105.bb
@@ -6,7 +6,7 @@ DEFAULT_PREFERENCE_mpc8323e-rdb = "1"
 
 # Disable stripping of kernel modules, since this action strips too
 # much out, and the resulting module won't load.
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 require madwifi-ng_r.inc
 
diff --git a/recipes/madwifi/madwifi-ng_r3314-20080131.bb b/recipes/madwifi/madwifi-ng_r3314-20080131.bb
index 1648c2e..f97ed1a 100644
--- a/recipes/madwifi/madwifi-ng_r3314-20080131.bb
+++ b/recipes/madwifi/madwifi-ng_r3314-20080131.bb
@@ -2,7 +2,7 @@
 
 # Disable stripping of kernel modules, since this action strips too
 # much out, and the resulting module won't load.
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 require madwifi-ng_r.inc
 
diff --git a/recipes/madwifi/madwifi-ng_r3837-20080802.bb b/recipes/madwifi/madwifi-ng_r3837-20080802.bb
index f702720..19309e7 100644
--- a/recipes/madwifi/madwifi-ng_r3837-20080802.bb
+++ b/recipes/madwifi/madwifi-ng_r3837-20080802.bb
@@ -2,7 +2,7 @@
 
 # Disable stripping of kernel modules, since this action strips too
 # much out, and the resulting module won't load.
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 require madwifi-ng_r.inc
 
diff --git a/recipes/madwifi/madwifi-ng_r3878-20081204.bb b/recipes/madwifi/madwifi-ng_r3878-20081204.bb
index 289a59b..379a699 100644
--- a/recipes/madwifi/madwifi-ng_r3878-20081204.bb
+++ b/recipes/madwifi/madwifi-ng_r3878-20081204.bb
@@ -7,7 +7,7 @@ DEFAULT_PREFERENCE_slugos = "1"
 
 # Disable stripping of kernel modules, since this action strips too
 # much out, and the resulting module won't load.
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 require madwifi-ng_r.inc
 
diff --git a/recipes/madwifi/madwifi-ng_r4029-20090525.bb b/recipes/madwifi/madwifi-ng_r4029-20090525.bb
index dc288d8..ab4deea 100644
--- a/recipes/madwifi/madwifi-ng_r4029-20090525.bb
+++ b/recipes/madwifi/madwifi-ng_r4029-20090525.bb
@@ -2,7 +2,7 @@
 
 # Disable stripping of kernel modules, since this action strips too
 # much out, and the resulting module won't load.
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 require madwifi-ng_r.inc
 
diff --git a/recipes/mii-diag/mii-diag_2.11.bb b/recipes/mii-diag/mii-diag_2.11.bb
index e49a990..fc87a00 100644
--- a/recipes/mii-diag/mii-diag_2.11.bb
+++ b/recipes/mii-diag/mii-diag_2.11.bb
@@ -6,7 +6,7 @@ PR = "r4"
 
 S = "${WORKDIR}/"
 
-#INHIBIT_PACKAGE_STRIP = "1"
+#PACKAGE_STRIP = "no"
 
 SRC_URI = "file://mii-diag.c \
            file://libmii.c"
diff --git a/recipes/misc-binary-only/prism2-firmware-update_1.7.4.bb b/recipes/misc-binary-only/prism2-firmware-update_1.7.4.bb
index dae62ae..501fa8a 100644
--- a/recipes/misc-binary-only/prism2-firmware-update_1.7.4.bb
+++ b/recipes/misc-binary-only/prism2-firmware-update_1.7.4.bb
@@ -6,7 +6,7 @@ LICENSE = "unknown"
 
 SRC_URI = "http://www.red-bean.com/~proski/firmware/${PV}.tar.bz2"
 
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 do_install() {
 	install -d ${D}tmp
diff --git a/recipes/mtd/mtd-utils-tests_1.2.0+git.bb b/recipes/mtd/mtd-utils-tests_1.2.0+git.bb
index 7787c51..fa90696 100644
--- a/recipes/mtd/mtd-utils-tests_1.2.0+git.bb
+++ b/recipes/mtd/mtd-utils-tests_1.2.0+git.bb
@@ -19,7 +19,7 @@ do_compile () {
 do_stage () {
 }
 
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 mtd_utils_tests = " \
 	help_all.sh \
diff --git a/recipes/nvidia-drivers/nvidia-drivers.inc b/recipes/nvidia-drivers/nvidia-drivers.inc
index 32f16a4..ef65ae4 100644
--- a/recipes/nvidia-drivers/nvidia-drivers.inc
+++ b/recipes/nvidia-drivers/nvidia-drivers.inc
@@ -7,7 +7,7 @@ DESCRIPTION="NVidia Graphics Driver Binary"
 LICENSE = "NVIDIA"
 
 inherit module
-INHIBIT_PACKAGE_STRIP="1"
+PACKAGE_STRIP = "no"
 
 def nvidia_pkgrun(d):
 	import bb, re
diff --git a/recipes/nylon/nylon-scripts_cvs.bb b/recipes/nylon/nylon-scripts_cvs.bb
index 602f1c2..c4deca6 100644
--- a/recipes/nylon/nylon-scripts_cvs.bb
+++ b/recipes/nylon/nylon-scripts_cvs.bb
@@ -13,7 +13,7 @@ RDEPENDS = "bash"
 SRC_URI = "http://download.berlin.freifunk.net/meshcube.org/nylon/stable/sources/${PN}_gruen.4g__${SRCDATE}.tar.gz \
 	file://firewall-bash.diff;patch=1"
 S = "${WORKDIR}/${PN}"
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 do_install() {
 	install -d -m 755 ${D}
diff --git a/recipes/nylon/nylon-statistics.bb b/recipes/nylon/nylon-statistics.bb
index 91527ac..abed005 100644
--- a/recipes/nylon/nylon-statistics.bb
+++ b/recipes/nylon/nylon-statistics.bb
@@ -10,7 +10,7 @@ PR = "r1"
 
 SRC_URI = "http://download.berlin.freifunk.net/meshcube.org/nylon/stable/sources/${PN}_gruen.4g__${SRCDATE}.tar.gz"
 S = "${WORKDIR}/${PN}"
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 do_install() {
 	install -d ${D}/srv/www/cgi-bin
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
index efb4531..c0532c0 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
@@ -22,7 +22,7 @@ inherit module
 
 PVRBUILD = "release"
 
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 MAKE_TARGETS = " BUILD=${PVRBUILD}"
 
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
index 4863ff1..d5eaf97 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
@@ -21,7 +21,7 @@ inherit module
 
 PVRBUILD = "release"
 
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=omap3630"
 
diff --git a/recipes/snes232/snes232_cvs.bb b/recipes/snes232/snes232_cvs.bb
index 1424f86..5482c01 100644
--- a/recipes/snes232/snes232_cvs.bb
+++ b/recipes/snes232/snes232_cvs.bb
@@ -1,7 +1,7 @@
 SECTION = "unknown"
 PR = "r4"
 LICENSE = "GPL"
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 RRECOMMENDS = "kernel-module-serport"
 
diff --git a/recipes/ti/README b/recipes/ti/README
index eed00f0..2fbb9f1 100644
--- a/recipes/ti/README
+++ b/recipes/ti/README
@@ -30,7 +30,7 @@ The complete unpacked trees are staged to staging/machine/usr/share/ti/${PN}(-tr
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 BASEPKG_HOST_SYS = "${MULTIMACH_HOST_SYS}"
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 The 'BASEPKG_HOST_SYS' bit is what makes it work, but cause trouble is you want to read from it, so ti-paths.inc does:
 
diff --git a/recipes/ti/ti-codecs-dm6467_1.0.0.bb b/recipes/ti/ti-codecs-dm6467_1.0.0.bb
index 9454b94..709b21f 100644
--- a/recipes/ti/ti-codecs-dm6467_1.0.0.bb
+++ b/recipes/ti/ti-codecs-dm6467_1.0.0.bb
@@ -38,4 +38,4 @@ do_install () {
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
diff --git a/recipes/ti/ti-dm355mm-module_1.13.bb b/recipes/ti/ti-dm355mm-module_1.13.bb
index f7bd831..0308ab1 100644
--- a/recipes/ti/ti-dm355mm-module_1.13.bb
+++ b/recipes/ti/ti-dm355mm-module_1.13.bb
@@ -39,7 +39,7 @@ do_install () {
     install -m 0755 ${S}/dm355mm/module/dm350mmap.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp
 }
 
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 SRC_URI[md5sum] = "f6221188bea76b7aaf0c45e9bcf26329"
 SRC_URI[sha256sum] = "f1a6dea51be9798903a0543fb50f463b0594b1f11b897bc50e40825fb7527c61"
diff --git a/recipes/ti/ti-dm365mm-module.inc b/recipes/ti/ti-dm365mm-module.inc
index 6b0497b..caf0441 100644
--- a/recipes/ti/ti-dm365mm-module.inc
+++ b/recipes/ti/ti-dm365mm-module.inc
@@ -25,5 +25,5 @@ do_install () {
     install -m 0755 ${S}/module/dm365mmap.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp
 }
 
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 INSANE_SKIP_${PN} = True
diff --git a/recipes/ti/ti-dvsdk-demos.inc b/recipes/ti/ti-dvsdk-demos.inc
index 99e9875..af1ecd8 100644
--- a/recipes/ti/ti-dvsdk-demos.inc
+++ b/recipes/ti/ti-dvsdk-demos.inc
@@ -64,5 +64,5 @@ FILES_${PN} = "${installdir}/dvsdk-demos/*"
 
 BASE_SRC_URI ?= "http://install.source.dir.local"
 
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 INSANE_SKIP_${PN} = "True"
diff --git a/recipes/ti/ti-linuxutils.inc b/recipes/ti/ti-linuxutils.inc
index 3482d70..209299d 100644
--- a/recipes/ti/ti-linuxutils.inc
+++ b/recipes/ti/ti-linuxutils.inc
@@ -83,4 +83,4 @@ FILES_ti-irq-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/irq*.ko
 FILES_ti-linuxutils-app = "${installdir}/ti-linuxutils-app/*/*"
 
 INSANE_SKIP_ti-linuxutils-app = "True"
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
diff --git a/recipes/ti/ti-staging.inc b/recipes/ti/ti-staging.inc
index faa2461..593f094 100644
--- a/recipes/ti/ti-staging.inc
+++ b/recipes/ti/ti-staging.inc
@@ -6,7 +6,7 @@ BASEPKG_HOST_SYS = "${MULTIMACH_HOST_SYS}"
 # Search archdir for shlibs instead of machine dir due to above BASEPKG_HOST_SYS
 SHLIBSDIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}/shlibs"
 
-INHIBIT_PACKAGE_STRIP = "1"
+PACKAGE_STRIP = "no"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dev = "1"
-- 
1.5.6.5



