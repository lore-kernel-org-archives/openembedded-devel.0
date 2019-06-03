Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	by mail.openembedded.org (Postfix) with ESMTP id 5644F7E024
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2019 04:12:58 +0000 (UTC)
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 91795100003;
	Mon,  3 Jun 2019 04:12:53 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 21:10:44 -0700
Message-Id: <20190603041044.17529-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lmsensors: Update to 3.5.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2019 04:12:58 -0000
Content-Transfer-Encoding: 8bit

* Switch to git rather than using inconsistent GitHub archive tarballs.
* Dependency on libsysfs was removed in 3.0.1
* Remove upstreamed patch fixing musl support and refresh remaining
  patches
* Remove unnecessary conditional on systemd. The update-rc.d and systemd
  classes handle placement of these files properly.
---
 ...s-detect-print-a-special-message-whe.patch | 12 +--
 ...t-sys-io.h-header-include-to-just-gl.patch | 88 -------------------
 ...nsors-detect-can-t-read-the-cpu-inf.patch} | 16 ++--
 ...{lmsensors_3.4.0.bb => lmsensors_3.5.0.bb} | 47 ++++------
 4 files changed, 33 insertions(+), 130 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch
 rename meta-oe/recipes-bsp/lm_sensors/lmsensors/{0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch => 0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch} (86%)
 rename meta-oe/recipes-bsp/lm_sensors/{lmsensors_3.4.0.bb => lmsensors_3.5.0.bb} (72%)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
index abf6e752a..337fb11dd 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
@@ -1,8 +1,8 @@
-From c4428260e7685ebaf5c26c6ecaae5a56849853e8 Mon Sep 17 00:00:00 2001
+From 05a4d54e2adc4caed507baca529089ec01f48340 Mon Sep 17 00:00:00 2001
 From: Li Zhou <li.zhou@windriver.com>
 Date: Tue, 6 Sep 2016 14:04:29 +0800
-Subject: [PATCH] lmsensors: sensors-detect: print a special message when there
- isn't enough cpu info
+Subject: [PATCH 1/2] lmsensors: sensors-detect: print a special message when
+ there isn't enough cpu info
 
 When running sensors-detect, if there isn't enough information in
 /proc/cpuinfo for this arch (e.g. ppc64), "Use of uninitialized value
@@ -18,10 +18,10 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/prog/detect/sensors-detect b/prog/detect/sensors-detect
-index 3c2b44f..5f62405 100755
+index 0b3b0ff2..68594cd7 100755
 --- a/prog/detect/sensors-detect
 +++ b/prog/detect/sensors-detect
-@@ -2864,7 +2864,12 @@ sub initialize_cpu_list
+@@ -3119,7 +3119,12 @@ sub initialize_cpu_list
  sub print_cpu_info
  {
  	my $cpu = $cpu[0];
@@ -36,5 +36,5 @@ index 3c2b44f..5f62405 100755
  
  # @i2c_adapters is a list of references to hashes, one hash per I2C/SMBus
 -- 
-1.9.1
+2.21.0
 
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch
deleted file mode 100644
index fb3878dc3..000000000
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 727524453f115ddc05109e9bbb3d0e60a7db9185 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Jul 2017 15:05:50 -0700
-Subject: [PATCH] prog: Do not limit sys/io.h header include to just glibc
-
-musl provides it too.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- prog/dump/isadump.c | 6 ------
- prog/dump/isaset.c  | 6 ------
- prog/dump/superio.c | 5 -----
- prog/dump/util.c    | 5 -----
- 4 files changed, 22 deletions(-)
-
-diff --git a/prog/dump/isadump.c b/prog/dump/isadump.c
-index e0e6f00..8794537 100644
---- a/prog/dump/isadump.c
-+++ b/prog/dump/isadump.c
-@@ -36,13 +36,7 @@
- #include "util.h"
- #include "superio.h"
- 
--
--/* To keep glibc2 happy */
--#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
- #include <sys/io.h>
--#else
--#include <asm/io.h>
--#endif
- 
- #ifdef __powerpc__
- unsigned long isa_io_base = 0; /* XXX for now */
-diff --git a/prog/dump/isaset.c b/prog/dump/isaset.c
-index e743755..85a4f64 100644
---- a/prog/dump/isaset.c
-+++ b/prog/dump/isaset.c
-@@ -32,13 +32,7 @@
- #include <string.h>
- #include "util.h"
- 
--
--/* To keep glibc2 happy */
--#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
- #include <sys/io.h>
--#else
--#include <asm/io.h>
--#endif
- 
- #ifdef __powerpc__
- unsigned long isa_io_base = 0; /* XXX for now */
-diff --git a/prog/dump/superio.c b/prog/dump/superio.c
-index 64ef27b..906fe55 100644
---- a/prog/dump/superio.c
-+++ b/prog/dump/superio.c
-@@ -20,12 +20,7 @@
- */
- 
- #include <stdlib.h>
--
--#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
- #include <sys/io.h>
--#else
--#include <asm/io.h>
--#endif
- 
- #include "superio.h"
- 
-diff --git a/prog/dump/util.c b/prog/dump/util.c
-index 874c1b9..197fa64 100644
---- a/prog/dump/util.c
-+++ b/prog/dump/util.c
-@@ -11,12 +11,7 @@
- #include <stdio.h>
- #include "util.h"
- 
--/* To keep glibc2 happy */
--#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
- #include <sys/io.h>
--#else
--#include <asm/io.h>
--#endif
- 
- /* Return 1 if we should continue, 0 if we should abort */
- int user_ack(int def)
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
similarity index 86%
rename from meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors/0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
index 2d5709f3f..68f51f5a6 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
@@ -1,8 +1,8 @@
-From dd9b40c54f160a44f1d78e5946d4cd00a8852802 Mon Sep 17 00:00:00 2001
+From 26742544bc9f136093b6be78259f4a891870aa3c Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Wed, 21 Sep 2016 03:17:32 -0400
-Subject: [PATCH] lm-sensors: fix sensors-detect can't read the cpu information
- on fsl-t4xxx
+Subject: [PATCH 2/2] lm-sensors: fix sensors-detect can't read the cpu
+ information on fsl-t4xxx
 
 This is because two reasons:
 
@@ -28,10 +28,10 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
  1 file changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/prog/detect/sensors-detect b/prog/detect/sensors-detect
-index 5f62405..ae4def1 100755
+index 68594cd7..efe2c1af 100755
 --- a/prog/detect/sensors-detect
 +++ b/prog/detect/sensors-detect
-@@ -2833,6 +2833,7 @@ sub kernel_version_at_least
+@@ -3088,6 +3088,7 @@ sub kernel_version_at_least
  # model name and stepping, directly taken from /proc/cpuinfo.
  use vars qw(@cpu);
  
@@ -39,7 +39,7 @@ index 5f62405..ae4def1 100755
  sub initialize_cpu_list
  {
  	local $_;
-@@ -2848,7 +2849,7 @@ sub initialize_cpu_list
+@@ -3103,7 +3104,7 @@ sub initialize_cpu_list
  			};
  			next;
  		}
@@ -48,7 +48,7 @@ index 5f62405..ae4def1 100755
  			my $k = $1;
  			my $v = $2;
  			$v =~ s/\s+/ /g;	# Merge multiple spaces
-@@ -2861,12 +2862,20 @@ sub initialize_cpu_list
+@@ -3116,12 +3117,20 @@ sub initialize_cpu_list
  	push @cpu, $entry if scalar keys(%{$entry}); # Last entry
  }
  
@@ -70,5 +70,5 @@ index 5f62405..ae4def1 100755
  		print "# Processor: There isn't enough cpu info for this arch!!!\n";
  	}
 -- 
-2.8.1
+2.21.0
 
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
similarity index 72%
rename from meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
index 4dbef73b9..c8e4565c1 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
@@ -1,29 +1,23 @@
-SUMMARY = "lm_sensors"
-DESCRIPTION = "Hardware health monitoring applications"
-HOMEPAGE = "http://www.lm-sensors.org/"
+SUMMARY = "Hardware health monitoring applications"
+HOMEPAGE = "https://hwmon.wiki.kernel.org/"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native rrdtool"
+DEPENDS = " \
+    bison-native \
+    flex-native \
+    rrdtool \
+    virtual/libiconv \
+"
 
-SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
+SRC_URI = "git://github.com/lm-sensors/lm-sensors.git;protocol=https \
            file://fancontrol.init \
            file://sensord.init \
            file://0001-lmsensors-sensors-detect-print-a-special-message-whe.patch \
-           file://0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch \
-           file://0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch \
+           file://0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch \
 "
-SRC_URI[md5sum] = "1e9f117cbfa11be1955adc96df71eadb"
-SRC_URI[sha256sum] = "e334c1c2b06f7290e3e66bdae330a5d36054701ffd47a5dde7a06f9a7402cb4e"
-
-# It is using '-' but not '.' as delimiter for the version in the releases page,
-# which causes the version comparison unmatched.
-#UPSTREAM_CHECK_URI = "https://github.com/groeck/lm-sensors/releases"
-
-RECIPE_UPSTREAM_VERSION = "3.4.0"
-RECIPE_UPSTREAM_DATE = "Jun 25, 2015"
-CHECK_DATE = "May 28, 2018"
+SRCREV = "e8afbda10fba571c816abddcb5c8180afc435bba"
 
 inherit update-rc.d systemd
 
@@ -39,7 +33,7 @@ SYSTEMD_PACKAGES = "${PN}-sensord"
 SYSTEMD_SERVICE_${PN}-sensord = "sensord.service lm_sensors.service fancontrol.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-S = "${WORKDIR}/lm-sensors-3-4-0"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = 'EXLDFLAGS="${LDFLAGS}" \
         MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \
@@ -61,20 +55,17 @@ do_install() {
     install -m 0644 ${S}/prog/sensord/sensord.8 ${D}${mandir}/man8
 
     # Install directory
-    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${INIT_D_DIR}
 
     # Install fancontrol init script
-    install -m 0755 ${WORKDIR}/fancontrol.init \
-        ${D}${sysconfdir}/init.d/fancontrol
+    install -m 0755 ${WORKDIR}/fancontrol.init ${D}${INIT_D_DIR}/fancontrol
 
     # Install sensord init script
-    install -m 0755 ${WORKDIR}/sensord.init ${D}${sysconfdir}/init.d/sensord
+    install -m 0755 ${WORKDIR}/sensord.init ${D}${INIT_D_DIR}/sensord
 
     # Insall sensord service script
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${S}/prog/init/*.service ${D}${systemd_unitdir}/system
-    fi
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${S}/prog/init/*.service ${D}${systemd_system_unitdir}
 }
 
 RPROVIDES_${PN}-dbg += "${PN}-libsensors-dbg ${PN}-sensors-dbg ${PN}-sensord-dbg ${PN}-isatools-dbg"
@@ -117,13 +108,13 @@ FILES_${PN}-sensors-doc = "${mandir}/man1 ${mandir}/man5"
 RDEPENDS_${PN}-sensors = "${PN}-libsensors"
 
 # sensord logging daemon
-FILES_${PN}-sensord = "${sbindir}/sensord ${sysconfdir}/init.d/sensord ${systemd_unitdir}/system/sensord.service"
+FILES_${PN}-sensord = "${sbindir}/sensord ${INIT_D_DIR}/sensord ${systemd_system_unitdir}/sensord.service"
 FILES_${PN}-sensord-doc = "${mandir}/man8/sensord.8"
 RDEPENDS_${PN}-sensord = "${PN}-sensors rrdtool"
 RRECOMMENDS_${PN}-sensord = "lmsensors-config-sensord"
 
 # fancontrol script files
-FILES_${PN}-fancontrol = "${sbindir}/fancontrol ${sysconfdir}/init.d/fancontrol"
+FILES_${PN}-fancontrol = "${sbindir}/fancontrol ${INIT_D_DIR}/fancontrol"
 FILES_${PN}-fancontrol-doc = "${mandir}/man8/fancontrol.8"
 RDEPENDS_${PN}-fancontrol = "bash"
 RRECOMMENDS_${PN}-fancontrol = "lmsensors-config-fancontrol"
-- 
2.21.0


