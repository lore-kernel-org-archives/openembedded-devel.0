Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6mPx-0003bf-Ch
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 17:42:03 +0200
Received: by gwb17 with SMTP id 17so400191gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MQaBzkncqr/UbYuhEqPqkWMfeL1wT7MqqB7FiAdpyro=;
	b=vvQgEZjh6BgpJN98QdECoiUbRk07OVNkKSEEF00YcNMG1Owim8+tWqd/DULsfQhQn/
	Hnx3SUpMi5EHDhvJ31gV7PtqS+EQVYrFm/LyP7H9IXTaZaSuxuYibGmZy3vEvoM6NEFe
	RBg58MrdIZwa5HxewoQadFBEJx2w/68Aa0UBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PS/S6rSp+BXGLnysvQkAXWpY6xRWVi0A1R/WSknOHdALy2gTKcBXpjEGpGEpSuy2ii
	2M5x8Ru+IcEcErlRH622ug3TMukZpmCY9TP4wRlDVASvLnRfYMIUsWMSDA6UDnirVpQw
	bbA9CGVoMUzE4ynfMDczIWv43HfhTATF3nGb0=
Received: by 10.42.150.73 with SMTP id z9mr709877icv.348.1287157289375;
	Fri, 15 Oct 2010 08:41:29 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id in12sm13258382ibb.9.2010.10.15.08.41.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Oct 2010 08:41:28 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 08:41:21 -0700
Message-Id: <1287157281-31597-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 15:42:03 -0000

From: Chris Larson <chris_larson@mentor.com>

Given the current implementation of OVERRIDES in bitbake, the variable is
expected to contain elements in the order least specific to most specific,
however, our current usage of it does not match that.  As one example, "local"
is supposed to always be the most specific override, yet currently it's the
least specific.  As another example, currently the target architecture is seen
as more specific than the machine, which is also clearly wrong.

Big thanks to Chase Maupin for investigating and identifying this long
standing issue.

It becomes clear that a reversal of the current value will bring us to a more
sane behavior, and avoids the need for the dual overrides hack mentioned in
the comments, so this implements this reversal, and drops the unnecessary and
confusing comments.

This also introduces a MACHINE_OVERRIDES variable as a generic mechanism to
inject overrides elements which are more specific than the distro but less
specific than the machine, which is where things like MACHINE_CLASS or
SOC_FAMILY or the like would go.  This variable is *space* separated, to make
it easier and more convenient to assemble the variable incrementally.

Reported-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 conf/bitbake.conf                             |   17 ++-----------
 conf/distro/include/arm-thumb.inc             |    6 ++--
 conf/distro/micro.conf                        |    6 ++--
 conf/distro/minimal.conf                      |    5 ++-
 conf/distro/shr.conf                          |    5 ++-
 conf/machine/fsg3be.conf                      |    2 +-
 conf/machine/kixrp435.conf                    |    2 +-
 conf/machine/nslu2be.conf                     |    2 +-
 conf/machine/nslu2le.conf                     |    2 +-
 docs/usermanual/chapters/common_use_cases.xml |   31 +++++++++++++++++++-----
 recipes/binutils/binutils_csl-arm-20050416.bb |    2 +-
 recipes/binutils/binutils_csl-arm-20050603.bb |    2 +-
 recipes/eglibc/eglibc-package.bbclass         |    2 +-
 recipes/glibc/glibc-package.inc               |    2 +-
 recipes/prelink/prelink_20061027.bb           |    2 +-
 recipes/prelink/prelink_20071009.bb           |    2 +-
 recipes/prelink/prelink_20090925.bb           |    2 +-
 17 files changed, 50 insertions(+), 42 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index a5d6a1a..30dcd3e 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -675,20 +675,9 @@ BUILDCFG_NEEDEDVARS ?= "TARGET_ARCH TARGET_OS"
 
 # Overrides are processed left to right, so the ones that are named later take precedence.
 # You generally want them to go from least to most specific.
-# 
-# This means that an envionment variable named '<foo>_arm' overrides an
-# environment variable '<foo>' (when ${TARGET_ARCH} is arm).
-# an environment variable '<foo>_ramses' overrides '<foo>' but doesn't override
-# '<foo>_arm' when ${MACHINE} is 'ramses'. 
-# If you use combination ie '<foo>_arm_ramses', then '<foo>_arm_ramses' will override 
-# '<foo>_arm' and then '<foo>' will be overriden with that value from '<foo>_arm'.
-# And finally '<foo>_local' overrides anything, but with lowest priority.
-#
-# This works for  functions as well, they are really just environment variables.
-# Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
-# Alternative OVERRIDES definition without "fail fast", usually only for native building and Scratchbox toolchains.
-#OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}"
+MACHINE_OVERRIDES ?= ""
+OVERRIDES = "pn-${PN}:fail-fast:build-${BUILD_OS}:${TARGET_ARCH}:${TARGET_OS}:\
+${DISTRO}:${@':'.join(d.getVar('MACHINE_OVERRIDES', True).split())}:${MACHINE}:local"
 
 ##################################################################
 # Include the rest of the config files.
diff --git a/conf/distro/include/arm-thumb.inc b/conf/distro/include/arm-thumb.inc
index 36edd4f..75ed978 100644
--- a/conf/distro/include/arm-thumb.inc
+++ b/conf/distro/include/arm-thumb.inc
@@ -16,9 +16,9 @@ THUMB_INTERWORK ?= "no"
 #    arm system and vice versa.  It is strongly recommended that DISTROs not
 #    turn this off - the actual cost is very small.
 
-OVERRIDE_THUMB = "${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
-OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
-OVERRIDES_append_arm =. "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
+OVERRIDE_THUMB = "${@['', 'thumb:'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
+OVERRIDE_INTERWORK = "${@['', 'thumb-interwork:'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
+OVERRIDES_prepend_arm =. "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
 
 #    Compiler and linker options for application code and kernel code.  These
 #    options ensure that the compiler has the correct settings for the selected
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 6d396b3..19b5e62 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -69,10 +69,10 @@ require conf/distro/include/sane-toolchain.inc
 require conf/distro/include/arm-thumb.inc
 
 #############################################################################
-# OVERRIDES adjusted from bitbake.conf to feature the MACHINE_CLASS
+# Ensure MACHINE_CLASS is in OVERRIDES
 #############################################################################
-OVERRIDES = "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:\
-${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+MACHINE_CLASS ?= ""
+MACHINE_OVERRIDES += "${MACHINE_CLASS}"
 
 #############################################################################
 # PREFERRED VERSIONS
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 376ffde..0d32cfe 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -81,9 +81,10 @@ KERNEL = "kernel26"
 MACHINE_KERNEL_VERSION = "2.6"
 
 #############################################################################
-# OVERWRITES adjusted from bitbake.conf to feature the MACHINE_CLASS
+# Ensure MACHINE_CLASS is in OVERRIDES
 #############################################################################
-OVERRIDES = "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+MACHINE_CLASS ?= ""
+MACHINE_OVERRIDES += "${MACHINE_CLASS}"
 
 #############################################################################
 # TOOLCHAIN
diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index ade8cba..74e3fe9 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -151,9 +151,10 @@ KERNEL = "kernel26"
 MACHINE_KERNEL_VERSION = "2.6"
 
 #############################################################################
-# OVERWRITES adjusted from bitbake.conf to feature the MACHINE_CLASS
+# Ensure MACHINE_CLASS is in OVERRIDES
 #############################################################################
-OVERRIDES = "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+MACHINE_CLASS ?= ""
+MACHINE_OVERRIDES += "${MACHINE_CLASS}"
 
 #############################################################################
 # TOOLCHAIN
diff --git a/conf/machine/fsg3be.conf b/conf/machine/fsg3be.conf
index a2ca95b..c5ddc25 100644
--- a/conf/machine/fsg3be.conf
+++ b/conf/machine/fsg3be.conf
@@ -8,7 +8,7 @@ PACKAGE_EXTRA_ARCHS = "ixp4xxbe"
 
 MACHINE_ARCH = "ixp4xxbe"
 
-OVERRIDES = "local:${MACHINE}:ixp4xxbe:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+MACHINE_OVERRIDES += "ixp4xx ixp4xxbe"
 
 # Match the vendor's latest kernel
 PREFERRED_PROVIDER_virtual/kernel ?= "fsg3-kernel"
diff --git a/conf/machine/kixrp435.conf b/conf/machine/kixrp435.conf
index 8259127..ba8216d 100644
--- a/conf/machine/kixrp435.conf
+++ b/conf/machine/kixrp435.conf
@@ -7,7 +7,7 @@ TARGET_ARCH = "arm"
 # Note: armv4 armv4t armv5te will be added by tune-xscale.inc automatically.
 PACKAGE_EXTRA_ARCHS = "armv5e ixp4xxle"
 
-OVERRIDES = "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+MACHINE_OVERRIDES += "ixp4xx nslu2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 PREFERRED_VERSION_linux = "2.6.30"
diff --git a/conf/machine/nslu2be.conf b/conf/machine/nslu2be.conf
index 9bc92f1..69d12a7 100644
--- a/conf/machine/nslu2be.conf
+++ b/conf/machine/nslu2be.conf
@@ -7,7 +7,7 @@ TARGET_ARCH = "armeb"
 # Note: armv4b armv4tb armv5teb will be added by tune-xscale.inc automatically.
 PACKAGE_EXTRA_ARCHS = "armv5eb ixp4xxbe"
 
-OVERRIDES = "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+MACHINE_OVERRIDES += "ixp4xx nslu2"
 
 ROOT_FLASH_SIZE ?= "6"
 
diff --git a/conf/machine/nslu2le.conf b/conf/machine/nslu2le.conf
index 62e47cb..5cd8a77 100644
--- a/conf/machine/nslu2le.conf
+++ b/conf/machine/nslu2le.conf
@@ -7,7 +7,7 @@ TARGET_ARCH = "arm"
 # Note: armv4 armv4t armv5te will be added by tune-xscale.inc automatically.
 PACKAGE_EXTRA_ARCHS = "armv5e ixp4xxle"
 
-OVERRIDES = "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+MACHINE_OVERRIDES += "ixp4xx nslu2"
 
 ROOT_FLASH_SIZE ?= "6"
 
diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/usermanual/chapters/common_use_cases.xml
index 8202dda..2114047 100644
--- a/docs/usermanual/chapters/common_use_cases.xml
+++ b/docs/usermanual/chapters/common_use_cases.xml
@@ -7,8 +7,8 @@
 
     <para>Creating a new distribution is not complicated, however we urge you
     to try existing distributions first, because it's also very easy to do
-    wrong. The config needs to be created in $OEBASE/openembedded/conf/distro 
-    directory. So what has to be inside? 
+    wrong. The config needs to be created in $OEBASE/openembedded/conf/distro
+    directory. So what has to be inside?
       <itemizedlist>
         <listitem>
           <para><command>DISTRO_VERSION</command> so users will know which
@@ -72,8 +72,8 @@ SRCDATE = "20061014"
   <section id="commonuse_new_machine">
     <title>Adding a new Machine</title>
 
-    <para>To be able to build for a device OpenEmbedded has to know about it, 
-    so a machine config file needs to be written. All of the machine 
+    <para>To be able to build for a device OpenEmbedded has to know about it,
+    so a machine config file needs to be written. All of the machine
     configs are stored in $OEBASE/openembedded/conf/machine/ directory.</para>
 
     <para>As usual some variables are required: <itemizedlist>
@@ -97,6 +97,23 @@ SRCDATE = "20061014"
     <para>There are also some optional variables that can be defined:
     <itemizedlist>
     <listitem>
+      <para>
+        <command>MACHINE_OVERRIDES</command> lists additional items to add to
+        the <command>OVERRIDES</command> variable, between the
+        <command>DISTRO</command> and the <command>MACHINE</command>.  This is
+        utilized to add overrides which are less specific than the machine,
+        but are nonetheless related to it, allowing us to define variables a
+        certain way for a group of machines, rather than for each individual
+        one.  As an example, this variable may be used by the distribution to
+        add <command>SOC_FAMILY</command> or <command>MACHINE_CLASS</command>.
+      </para>
+      <para>
+        Note that this variable is space separated, and should always be
+        manipulated with +=, to ensure it's built up incrementally, and no
+        additions are lost.
+      </para>
+    </listitem>
+    <listitem>
           <para><command>SOC_FAMILY</command> describes a family of processors
             that all share common features such as kernel versions,
             bootloaders, etc.  This is used to allow overrides for a whole
@@ -105,7 +122,7 @@ SRCDATE = "20061014"
             or local setting.
           </para>
           <para>
-            NOTE: SOC_FAMILY is different than MACHINE_CLASS in that 
+            NOTE: SOC_FAMILY is different than MACHINE_CLASS in that
             MACHINE_CLASS is intended to specify a grouping of devices
             that may have different processors but share common features.
             For example all OMAP3 devices can be described using the SOC_FAMILY
@@ -139,7 +156,7 @@ SRCDATE = "20061014"
             <listitem><para>for cvs: add 'PV = "1.1+cvs${SRCREV}"' to your bb file.</para></listitem>
           </itemizedlist>
         Accompany either with an entry to conf/distro/include/sane-srcrevs.inc for a revision that you know
-        builds successfully.  It is also common to define the stable SRCREV 
+        builds successfully.  It is also common to define the stable SRCREV
         for your package directly in the package recipe.
         </para>
         <para>
@@ -276,7 +293,7 @@ RDEPENDS_${PN} += "\
             <title>Putting it together</title>
             <para>In the previous two sections we have prepared the host and
             target side. One thing that is missing is combining the two newly
-            created tasks and actually creating the SDK. This is what we are 
+            created tasks and actually creating the SDK. This is what we are
             going to do now.</para>
 
             <para>Create <filename>meta-toolchain-YOU.bb</filename> in the
diff --git a/recipes/binutils/binutils_csl-arm-20050416.bb b/recipes/binutils/binutils_csl-arm-20050416.bb
index ad45438..71803d1 100644
--- a/recipes/binutils/binutils_csl-arm-20050416.bb
+++ b/recipes/binutils/binutils_csl-arm-20050416.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-cvs"
 PV = "2.15.99+csl-arm+cvs20050416"
 PR = "r3"
-OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
+OVERRIDES_prepend = "${TARGET_ARCH}-${TARGET_OS}:"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_arm-linux = "-1"
 DEFAULT_PREFERENCE_arm-linuxeabi = "-1"
diff --git a/recipes/binutils/binutils_csl-arm-20050603.bb b/recipes/binutils/binutils_csl-arm-20050603.bb
index 595cb98..50e8677 100644
--- a/recipes/binutils/binutils_csl-arm-20050603.bb
+++ b/recipes/binutils/binutils_csl-arm-20050603.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-cvs"
 PV = "2.15.99+csl-arm+cvs20050603"
 PR = "r3"
-OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
+OVERRIDES_prepend = "${TARGET_ARCH}-${TARGET_OS}:"
 DEFAULT_PREFERENCE = "-1"
 #DEFAULT_PREFERENCE_arm-linux = "1"
 #DEFAULT_PREFERENCE_arm-linuxeabi = "1"
diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index dbca1ab..c802bd5 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -116,7 +116,7 @@ def get_eglibc_fpu_setting(bb, d):
 EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
 EXTRA_OEMAKE += "rootsbindir=${base_sbindir}"
 
-OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
+OVERRIDES_prepend = "${TARGET_ARCH}-${TARGET_OS}:"
 
 do_configure_prepend() {
         sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
diff --git a/recipes/glibc/glibc-package.inc b/recipes/glibc/glibc-package.inc
index 0b263bb..8cd8564 100644
--- a/recipes/glibc/glibc-package.inc
+++ b/recipes/glibc/glibc-package.inc
@@ -44,7 +44,7 @@ def get_glibc_fpu_setting(bb, d):
 EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
 EXTRA_OEMAKE += "rootsbindir=${base_sbindir}"
 
-OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
+OVERRIDES_prepend = "${TARGET_ARCH}-${TARGET_OS}:"
 
 do_install() {
 	oe_runmake install_root=${D} install
diff --git a/recipes/prelink/prelink_20061027.bb b/recipes/prelink/prelink_20061027.bb
index ad2faf5..552117b 100644
--- a/recipes/prelink/prelink_20061027.bb
+++ b/recipes/prelink/prelink_20061027.bb
@@ -12,7 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/p/prelink/prelink_0.0.${PV}.orig.tar.gz \
            file://prelink.default"
 
 TARGET_OS_ORIG := "${TARGET_OS}"
-OVERRIDES_append = ":${TARGET_OS_ORIG}"
+OVERRIDES_prepend = "${TARGET_OS_ORIG}:"
 SRC_URI_append_linux-gnueabi = " file://arm_eabi.patch"
 
 S = "${WORKDIR}/prelink-0.0.${PV}"
diff --git a/recipes/prelink/prelink_20071009.bb b/recipes/prelink/prelink_20071009.bb
index faf930c..e2ab3fb 100644
--- a/recipes/prelink/prelink_20071009.bb
+++ b/recipes/prelink/prelink_20071009.bb
@@ -12,7 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/p/prelink/prelink_0.0.${PV}.orig.tar.gz \
            file://prelink.default"
 
 TARGET_OS_ORIG := "${TARGET_OS}"
-OVERRIDES_append = ":${TARGET_OS_ORIG}"
+OVERRIDES_prepend = "${TARGET_OS_ORIG}:"
 SRC_URI_append_linux-gnueabi = " file://arm_eabi.patch"
 
 S = "${WORKDIR}/prelink-0.0.${PV}"
diff --git a/recipes/prelink/prelink_20090925.bb b/recipes/prelink/prelink_20090925.bb
index 4c83402..5b247b6 100644
--- a/recipes/prelink/prelink_20090925.bb
+++ b/recipes/prelink/prelink_20090925.bb
@@ -12,7 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/p/prelink/prelink_0.0.${PV}.orig.tar.gz \
            file://prelink.default"
 
 #TARGET_OS_ORIG := "${TARGET_OS}"
-#OVERRIDES_append = ":${TARGET_OS_ORIG}"
+#OVERRIDES_prepend = "${TARGET_OS_ORIG}:"
 #SRC_URI_append_linux-gnueabi = " file://arm_eabi.patch"
 
 S = "${WORKDIR}/prelink-0.0.${PV}"
-- 
1.7.2.3



