Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OalYq-0005SE-N6
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 10:18:54 +0200
Received: by pzk2 with SMTP id 2so1447943pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 01:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Fr9glSeL4tjcuG6BJEbcvY2KNL2iDCkyMLp5aLLOaOw=;
	b=GhYFI70+MRK0RFarcilJXmZrRubStWxZ1laHWWKVESjpkdu5KImG66kuOZayau8+Zf
	2YqnLNblMuhrL1x/OFXPWkfBe9GrY/w9GFFvNAvSx7ZvICzuLg/uN0u8I7ZEMg7z8Hnw
	32db0QiG43Y5y6A9oAn6favFEiw9gcfq0Q1Q4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=iLR4ibaO129LxIABmUKSGK+isgfkM4+pJv8Q2OC0UI3k9XO5kiIDpN/I45rORlf8X4
	zx6l2fa/e7NCEsSsDIJoraI+wVc/o79HfDIOEV8Hl6oiPLcHKkIgxMVmDC2oGPa+slgc
	g7KHaCrn6uExqHyescC7IAmX0zmCAHyN7UK7o=
Received: by 10.114.110.2 with SMTP id i2mr6495120wac.167.1279527522399;
	Mon, 19 Jul 2010 01:18:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c10sm72663913wam.13.2010.07.19.01.18.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Jul 2010 01:18:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Jul 2010 01:18:55 -0700
Message-Id: <1279527535-11994-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC][PATCH] distro: Move thumb into distro features
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
X-List-Received-Date: Mon, 19 Jul 2010 08:18:54 -0000

* Currenlty we define the thumb specific overrides in machine tune files
  and as machine conf files are included before the distro conf files
  the overrides dont get right values and set incorrectly.

* This patch moves the tune-thumb.inc from machine/include into
  distro/include and lets distro decide on thumb and thumb-interworking
  features based on the machine selected. If a machine which does not
  support thumb like all armv4 based machines is selected then distro
  makes correct decision now to disable thumb and thumb-interworking
  based upon the machine seletected.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/angstrom-2008.1.conf            |    1 +
 conf/distro/gmustix.conf                    |    2 +
 conf/distro/include/arm-thumb.inc           |   32 +++++++++++++++++++++++++++
 conf/distro/kaeilos-2010.conf               |    1 +
 conf/distro/kaeilos.conf                    |    1 +
 conf/distro/micro.conf                      |    1 +
 conf/distro/minimal.conf                    |    3 +-
 conf/distro/shr.conf                        |    1 +
 conf/distro/slugos.conf                     |    2 +
 conf/machine/include/ixp4xx.inc             |    1 -
 conf/machine/include/tune-arm1136-novfp.inc |    3 --
 conf/machine/include/tune-arm1136jf-s.inc   |    3 --
 conf/machine/include/tune-arm1176jzf-s.inc  |    3 --
 conf/machine/include/tune-arm920t.inc       |    4 ---
 conf/machine/include/tune-arm926ejs.inc     |    3 --
 conf/machine/include/tune-arm9tdmi.inc      |    4 ---
 conf/machine/include/tune-armv7.inc         |    4 ---
 conf/machine/include/tune-ep9312.inc        |    3 --
 conf/machine/include/tune-thumb.inc         |   32 ---------------------------
 conf/machine/include/tune-xscale.inc        |    4 ---
 conf/machine/palmz31.conf                   |    3 --
 conf/machine/palmz72.conf                   |    3 --
 22 files changed, 43 insertions(+), 71 deletions(-)
 create mode 100644 conf/distro/include/arm-thumb.inc
 delete mode 100644 conf/machine/include/tune-thumb.inc

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 7c70c84..84e8096 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -136,6 +136,7 @@ PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
 
 # Toolchain virtuals:
 require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
+require conf/distro/include/arm-thumb.inc
 
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
diff --git a/conf/distro/gmustix.conf b/conf/distro/gmustix.conf
index 17f8056..5dd519d 100644
--- a/conf/distro/gmustix.conf
+++ b/conf/distro/gmustix.conf
@@ -5,6 +5,8 @@
 INHERIT += "package_tar package_ipk"
 LIBC = "uclibc"
 require conf/distro/include/${LIBC}.inc
+require conf/distro/include/arm-thumb.inc
+
 TARGET_OS = "linux-uclibc"
 TARGET_FPU = "soft"
 IMAGE_FSTYPES = "jffs2"
diff --git a/conf/distro/include/arm-thumb.inc b/conf/distro/include/arm-thumb.inc
new file mode 100644
index 0000000..cd88bb4
--- /dev/null
+++ b/conf/distro/include/arm-thumb.inc
@@ -0,0 +1,32 @@
+#tune file for thumb instructions
+
+ARM_INSTRUCTION_SET ?= "arm"
+# "arm" "thumb"
+#    The instruction set the compiler should use when generating application
+#    code.  The kernel is always compiled with arm code at present.  arm code
+#    is the original 32 bit ARM instruction set, thumb code is the 16 bit
+#    encoded RISC sub-set.  Thumb code is smaller (maybe 70% of the ARM size)
+#    but requires more instructions (140% for 70% smaller code) so may be
+#    slower.
+
+THUMB_INTERWORK ?= "no"
+# "yes" "no"
+#    Whether to compile with code to allow interworking between the two
+#    instruction sets.  This allows thumb code to be executed on a primarily
+#    arm system and vice versa.  It is strongly recommended that DISTROs not
+#    turn this off - the actual cost is very small.
+
+OVERRIDE_THUMB = "${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
+OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
+OVERRIDES .= "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
+
+#    Compiler and linker options for application code and kernel code.  These
+#    options ensure that the compiler has the correct settings for the selected
+#    instruction set and interworking.
+ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
+ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
+
+#
+TARGET_CC_ARCH +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
+TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -mno-thumb"
+
diff --git a/conf/distro/kaeilos-2010.conf b/conf/distro/kaeilos-2010.conf
index 4bb637c..ba37445 100644
--- a/conf/distro/kaeilos-2010.conf
+++ b/conf/distro/kaeilos-2010.conf
@@ -96,6 +96,7 @@ PREFERRED_VERSION_gcc-cross-intermediate ?= "${KAEILOS_GCC_VERSION}"
 
 PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
 require conf/distro/include/sane-toolchain.inc
+require conf/distro/include/arm-thumb.inc
 
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index eb12d2e..b141280 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -124,6 +124,7 @@ PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
 
 # Toolchain virtuals:
 require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
+require conf/distro/include/arm-thumb.inc
 
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 9885425..fc50391 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -66,6 +66,7 @@ PREFERRED_VERSION_glibc             ?= "2.10.1"
 PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
 PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
 require conf/distro/include/sane-toolchain.inc
+require conf/distro/include/arm-thumb.inc
 
 #############################################################################
 # OVERRIDES adjusted from bitbake.conf to feature the MACHINE_CLASS
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index e400c14..9a08130 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -16,7 +16,7 @@ DISTRO_VERSION = "dev-snapshot-${SRCDATE}"
 DISTRO_TYPE ?= "debug"
 
 # Ensure some form of release config, so error out if someone thinks he knows better
-DISTRO_CHECK := "${@bb.data.getVar('DISTRO_VERSION',d,1) or bb.fatal('Remove this line or set a dummy DISTRO_VERSION")
+DISTRO_CHECK := "${@bb.data.getVar('DISTRO_VERSION',d,1) or bb.fatal('Remove this line or set a dummy DISTRO_VERSION')}"
 
 #############################################################################
 # FEATURE SELECTION
@@ -86,6 +86,7 @@ MACHINE_KERNEL_VERSION = "2.6"
 #############################################################################
 LIBC ?= "eglibc"
 require conf/distro/include/sane-toolchain.inc
+require conf/distro/include/arm-thumb.inc
 
 #############################################################################
 # PREFERRED VERSIONS
diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index f0167da..9fd156f 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -159,6 +159,7 @@ PREFERRED_VERSION_eglibc             ?= "2.12"
 PREFERRED_VERSION_eglibc-initial     ?= "2.12"
 PREFERRED_GCC_VERSION                ?= "4.5"
 require conf/distro/include/sane-toolchain.inc
+require conf/distro/include/arm-thumb.inc
 
 # Set some java bits
 require conf/distro/include/sane-toolchain-java.inc
diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
index 5a2f0dc..5f9c06c 100644
--- a/conf/distro/slugos.conf
+++ b/conf/distro/slugos.conf
@@ -22,3 +22,5 @@ require conf/distro/include/slugos.inc
 # Can be either glibc or eglibc (or perhaps even uclibc)
 LIBC ?= "eglibc"
 require conf/distro/include/${LIBC}.inc
+require conf/distro/include/arm-thumb.inc
+
diff --git a/conf/machine/include/ixp4xx.inc b/conf/machine/include/ixp4xx.inc
index 192cbb1..cf7f0dd 100644
--- a/conf/machine/include/ixp4xx.inc
+++ b/conf/machine/include/ixp4xx.inc
@@ -22,7 +22,6 @@ IMAGE_FSTYPES ?= "jffs2 tar.gz"
 EXTRA_IMAGECMD_jffs2 = "--pad --eraseblock=0x20000 -n"
 
 require conf/machine/include/tune-xscale.inc
-require conf/machine/include/tune-thumb.inc
 
 #-------------------------------------------------------------------------------
 # Board defaults
diff --git a/conf/machine/include/tune-arm1136-novfp.inc b/conf/machine/include/tune-arm1136-novfp.inc
index e1f7945..58134b7 100644
--- a/conf/machine/include/tune-arm1136-novfp.inc
+++ b/conf/machine/include/tune-arm1136-novfp.inc
@@ -5,6 +5,3 @@ TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s"
 FEED_ARCH = "armv6-novfp"
 BASE_PACKAGE_ARCH = "armv6-novfp"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6-novfp"
-
-# Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
-require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-arm1136jf-s.inc b/conf/machine/include/tune-arm1136jf-s.inc
index c532b9c..2944cc7 100644
--- a/conf/machine/include/tune-arm1136jf-s.inc
+++ b/conf/machine/include/tune-arm1136jf-s.inc
@@ -2,6 +2,3 @@ TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv6"
 BASE_PACKAGE_ARCH = "armv6"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6"
-
-# Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
-require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-arm1176jzf-s.inc b/conf/machine/include/tune-arm1176jzf-s.inc
index b7c5291..ee2884b 100644
--- a/conf/machine/include/tune-arm1176jzf-s.inc
+++ b/conf/machine/include/tune-arm1176jzf-s.inc
@@ -2,6 +2,3 @@ TARGET_CC_ARCH = "-march=armv6j -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=softfp
 FEED_ARCH = "armv6"
 BASE_PACKAGE_ARCH = "armv6"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6"
-
-# Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
-require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-arm920t.inc b/conf/machine/include/tune-arm920t.inc
index 5a373e9..fee5c58 100644
--- a/conf/machine/include/tune-arm920t.inc
+++ b/conf/machine/include/tune-arm920t.inc
@@ -2,7 +2,3 @@ FEED_ARCH = "armv4t"
 BASE_PACKAGE_ARCH = "armv4t" 
 TARGET_CC_ARCH = "-march=armv4t -mtune=arm920t"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t"
-
-# Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
-require conf/machine/include/tune-thumb.inc
-
diff --git a/conf/machine/include/tune-arm926ejs.inc b/conf/machine/include/tune-arm926ejs.inc
index f6f5064..f41e460 100644
--- a/conf/machine/include/tune-arm926ejs.inc
+++ b/conf/machine/include/tune-arm926ejs.inc
@@ -5,6 +5,3 @@ PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te"
 # For gcc 4.x you need:
 TARGET_CC_ARCH = "-march=armv5te -mtune=arm926ej-s"
 BASE_PACKAGE_ARCH = "armv5te"
-
-# Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
-require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-arm9tdmi.inc b/conf/machine/include/tune-arm9tdmi.inc
index a11ee38..d788b53 100644
--- a/conf/machine/include/tune-arm9tdmi.inc
+++ b/conf/machine/include/tune-arm9tdmi.inc
@@ -2,7 +2,3 @@ FEED_ARCH = "armv4t"
 BASE_PACKAGE_ARCH = "armv4t"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t"
 TARGET_CC_ARCH = "-mcpu=arm9tdmi -mtune=arm9tdmi"
-
-# Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
-require conf/machine/include/tune-thumb.inc
-
diff --git a/conf/machine/include/tune-armv7.inc b/conf/machine/include/tune-armv7.inc
index 05ec3da..379a3eb 100644
--- a/conf/machine/include/tune-armv7.inc
+++ b/conf/machine/include/tune-armv7.inc
@@ -5,7 +5,3 @@ TARGET_CC_ARCH = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv7"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7"
 BASE_PACKAGE_ARCH = "armv7"
-
-# Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
-require conf/machine/include/tune-thumb.inc
-
diff --git a/conf/machine/include/tune-ep9312.inc b/conf/machine/include/tune-ep9312.inc
index c8770e0..7458281 100644
--- a/conf/machine/include/tune-ep9312.inc
+++ b/conf/machine/include/tune-ep9312.inc
@@ -5,9 +5,6 @@ PACKAGE_EXTRA_ARCHS += "armv4t ep9312"
 BASE_PACKAGE_ARCH = "ep9312"
 FEED_ARCH = "ep9312"
 
-# Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
-require conf/machine/include/tune-thumb.inc
-
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O -fno-signed-zeros"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
 SELECTED_OPTIMIZATION = "${@bb.data.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) == '1'], d, 1)}"
diff --git a/conf/machine/include/tune-thumb.inc b/conf/machine/include/tune-thumb.inc
deleted file mode 100644
index cd88bb4..0000000
--- a/conf/machine/include/tune-thumb.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-#tune file for thumb instructions
-
-ARM_INSTRUCTION_SET ?= "arm"
-# "arm" "thumb"
-#    The instruction set the compiler should use when generating application
-#    code.  The kernel is always compiled with arm code at present.  arm code
-#    is the original 32 bit ARM instruction set, thumb code is the 16 bit
-#    encoded RISC sub-set.  Thumb code is smaller (maybe 70% of the ARM size)
-#    but requires more instructions (140% for 70% smaller code) so may be
-#    slower.
-
-THUMB_INTERWORK ?= "no"
-# "yes" "no"
-#    Whether to compile with code to allow interworking between the two
-#    instruction sets.  This allows thumb code to be executed on a primarily
-#    arm system and vice versa.  It is strongly recommended that DISTROs not
-#    turn this off - the actual cost is very small.
-
-OVERRIDE_THUMB = "${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
-OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
-OVERRIDES .= "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
-
-#    Compiler and linker options for application code and kernel code.  These
-#    options ensure that the compiler has the correct settings for the selected
-#    instruction set and interworking.
-ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
-ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
-
-#
-TARGET_CC_ARCH +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
-TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -mno-thumb"
-
diff --git a/conf/machine/include/tune-xscale.inc b/conf/machine/include/tune-xscale.inc
index 3a6bd0e..f0f58bc 100644
--- a/conf/machine/include/tune-xscale.inc
+++ b/conf/machine/include/tune-xscale.inc
@@ -7,7 +7,3 @@ TARGET_CC_ARCH = "-march=armv5te -mtune=xscale"
 TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
 PACKAGE_EXTRA_ARCHS += "${@['armv4b armv4tb armv5teb', 'armv4 armv4t armv5te'][ bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
 BASE_PACKAGE_ARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
-
-# Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
-require conf/machine/include/tune-thumb.inc
-
diff --git a/conf/machine/palmz31.conf b/conf/machine/palmz31.conf
index 0332952..9fb5f7e 100644
--- a/conf/machine/palmz31.conf
+++ b/conf/machine/palmz31.conf
@@ -11,9 +11,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "160"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-# Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
-require conf/machine/include/tune-thumb.inc
-
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-i2c-pxa \
 			     kernel-module-i2c-algo-pxa \
 			     kernel-module-i2c-dev \
diff --git a/conf/machine/palmz72.conf b/conf/machine/palmz72.conf
index 502c11a..9766434 100644
--- a/conf/machine/palmz72.conf
+++ b/conf/machine/palmz72.conf
@@ -11,9 +11,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-# Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
-require conf/machine/include/tune-thumb.inc
-
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-i2c-pxa \
 			     kernel-module-i2c-algo-pxa \
 			     kernel-module-i2c-dev \
-- 
1.7.0.4



