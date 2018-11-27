Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C39296C108
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:17:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAR8HPfA018561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:17:35 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:17:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:44 +0800
Message-ID: <e65bdb9a890351cf2a75a994ad87909f93928ce6.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 10/12] lvm2/libdevmapper: 2.02.180 -> 2.03.01
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
X-List-Received-Date: Tue, 27 Nov 2018 08:17:59 -0000
Content-Type: text/plain

- Upddate upstream SRC_URI, use github to replace tarball

- Rebase 0001-Avoid-bashisms-in-init-scripts.patch,
         0005-do-not-build-manual.patch,
         0001-explicitly-do-not-install-libdm.patch

- Remove `--enable-applib' since upstream [0d22b58 liblvm: remove lvmapi]

- Remove `lvmetad' since upstream [117160b Remove lvmetad]

- Remove  `oe_runmake ... -C tools install_device-mapper' since upstream
  [0524829 dmsetup: move to libdm/dm-tools/dmsetup]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Avoid-bashisms-in-init-scripts.patch      | 136 ++++++---------------
 .../lvm2/files/0005-do-not-build-manual.patch      |  30 ++---
 ...vmapper_2.02.180.bb => libdevmapper_2.03.01.bb} |   4 +-
 meta-oe/recipes-support/lvm2/lvm2.inc              |   8 +-
 .../0001-explicitly-do-not-install-libdm.patch     |  33 ++---
 .../lvm2/{lvm2_2.02.180.bb => lvm2_2.03.01.bb}     |   4 +-
 6 files changed, 75 insertions(+), 140 deletions(-)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.02.180.bb => libdevmapper_2.03.01.bb} (55%)
 rename meta-oe/recipes-support/lvm2/{lvm2_2.02.180.bb => lvm2_2.03.01.bb} (88%)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
index 5b55111..3c4a3a1 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
@@ -1,26 +1,27 @@
-From 916ea0c70fd063ab7b81f16fd917a75dc02edf4f Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Fri, 17 Mar 2017 03:18:28 +0100
-Subject: [PATCH] Avoid bashisms in init scripts
+From ea66faf68c93735edb1f2691cd7364b8cab83fef Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Date: Mon, 26 Nov 2018 14:53:09 +0800
+Subject: [PATCH 1/3] Avoid bashisms in init scripts
 
 Upstream-Status: Inappropriate
 
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+
+Rebase to 2.03.01
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- scripts/blk_availability_init_red_hat.in      | 4 ++--
- scripts/clvmd_init_red_hat.in                 | 6 +++---
- scripts/cmirrord_init_red_hat.in              | 4 ++--
- scripts/lvm2_cluster_activation_red_hat.sh.in | 4 ++--
- scripts/lvm2_lvmetad_init_red_hat.in          | 4 ++--
- scripts/lvm2_lvmpolld_init_red_hat.in         | 4 ++--
- scripts/lvm2_monitoring_init_red_hat.in       | 4 ++--
- scripts/lvm2_monitoring_init_rhel4            | 4 ++--
- 8 files changed, 17 insertions(+), 17 deletions(-)
+ scripts/blk_availability_init_red_hat.in | 4 ++--
+ scripts/cmirrord_init_red_hat.in         | 4 ++--
+ scripts/lvm2_lvmpolld_init_red_hat.in    | 4 ++--
+ scripts/lvm2_monitoring_init_red_hat.in  | 4 ++--
+ scripts/lvm2_monitoring_init_rhel4       | 4 ++--
+ 5 files changed, 10 insertions(+), 10 deletions(-)
 
-Index: LVM2.2.02.177/scripts/blk_availability_init_red_hat.in
-===================================================================
---- LVM2.2.02.177.orig/scripts/blk_availability_init_red_hat.in
-+++ LVM2.2.02.177/scripts/blk_availability_init_red_hat.in
+diff --git a/scripts/blk_availability_init_red_hat.in b/scripts/blk_availability_init_red_hat.in
+index 347c395..b2e9cf9 100644
+--- a/scripts/blk_availability_init_red_hat.in
++++ b/scripts/blk_availability_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
@@ -35,38 +36,10 @@ Index: LVM2.2.02.177/scripts/blk_availability_init_red_hat.in
 +	echo "Usage: $0 {start|stop|status}"
  	;;
  esac
-Index: LVM2.2.02.177/scripts/clvmd_init_red_hat.in
-===================================================================
---- LVM2.2.02.177.orig/scripts/clvmd_init_red_hat.in
-+++ LVM2.2.02.177/scripts/clvmd_init_red_hat.in
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- #
- # clvmd - Clustered LVM Daemon init script
- #
-@@ -161,7 +161,7 @@ restart() {
- 	fi
- }
- 
--[ "$EUID" != "0" ] && {
-+[ "$(id -u)" != "0" ] && {
- 	echo "clvmd init script can only be executed as root user"
- 	exit 4
- }
-@@ -206,7 +206,7 @@ case "$1" in
- 	;;
- 
-   *)
--	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
-+	echo "Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
- 	rtrn=2
- 	;;
- esac
-Index: LVM2.2.02.177/scripts/cmirrord_init_red_hat.in
-===================================================================
---- LVM2.2.02.177.orig/scripts/cmirrord_init_red_hat.in
-+++ LVM2.2.02.177/scripts/cmirrord_init_red_hat.in
+diff --git a/scripts/cmirrord_init_red_hat.in b/scripts/cmirrord_init_red_hat.in
+index c82f8f5..a3a321d 100755
+--- a/scripts/cmirrord_init_red_hat.in
++++ b/scripts/cmirrord_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
@@ -82,48 +55,10 @@ Index: LVM2.2.02.177/scripts/cmirrord_init_red_hat.in
  		;;
  esac
  
-Index: LVM2.2.02.177/scripts/lvm2_cluster_activation_red_hat.sh.in
-===================================================================
---- LVM2.2.02.177.orig/scripts/lvm2_cluster_activation_red_hat.sh.in
-+++ LVM2.2.02.177/scripts/lvm2_cluster_activation_red_hat.sh.in
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- 
- sbindir="@SBINDIR@"
- 
-@@ -54,7 +54,7 @@ case "$1" in
- 	rtrn=$?
- 	;;
-   *)
--	echo $"Usage: $0 {activate|deactivate}"
-+	echo "Usage: $0 {activate|deactivate}"
- 	rtrn=3
- 	;;
- esac
-Index: LVM2.2.02.177/scripts/lvm2_lvmetad_init_red_hat.in
-===================================================================
---- LVM2.2.02.177.orig/scripts/lvm2_lvmetad_init_red_hat.in
-+++ LVM2.2.02.177/scripts/lvm2_lvmetad_init_red_hat.in
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- #
- # Copyright (C) 2012-2017 Red Hat, Inc. All rights reserved.
- #
-@@ -103,7 +103,7 @@ case "$1" in
- 	;;
- 
-   *)
--	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
-+	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
- 	;;
- esac
- 
-Index: LVM2.2.02.177/scripts/lvm2_lvmpolld_init_red_hat.in
-===================================================================
---- LVM2.2.02.177.orig/scripts/lvm2_lvmpolld_init_red_hat.in
-+++ LVM2.2.02.177/scripts/lvm2_lvmpolld_init_red_hat.in
+diff --git a/scripts/lvm2_lvmpolld_init_red_hat.in b/scripts/lvm2_lvmpolld_init_red_hat.in
+index 176ff5d..825f6ad 100644
+--- a/scripts/lvm2_lvmpolld_init_red_hat.in
++++ b/scripts/lvm2_lvmpolld_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
@@ -139,10 +74,10 @@ Index: LVM2.2.02.177/scripts/lvm2_lvmpolld_init_red_hat.in
  	;;
  esac
  
-Index: LVM2.2.02.177/scripts/lvm2_monitoring_init_red_hat.in
-===================================================================
---- LVM2.2.02.177.orig/scripts/lvm2_monitoring_init_red_hat.in
-+++ LVM2.2.02.177/scripts/lvm2_monitoring_init_red_hat.in
+diff --git a/scripts/lvm2_monitoring_init_red_hat.in b/scripts/lvm2_monitoring_init_red_hat.in
+index 95e4125..dff89cd 100644
+--- a/scripts/lvm2_monitoring_init_red_hat.in
++++ b/scripts/lvm2_monitoring_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
@@ -158,10 +93,10 @@ Index: LVM2.2.02.177/scripts/lvm2_monitoring_init_red_hat.in
  	;;
  esac
  
-Index: LVM2.2.02.177/scripts/lvm2_monitoring_init_rhel4
-===================================================================
---- LVM2.2.02.177.orig/scripts/lvm2_monitoring_init_rhel4
-+++ LVM2.2.02.177/scripts/lvm2_monitoring_init_rhel4
+diff --git a/scripts/lvm2_monitoring_init_rhel4 b/scripts/lvm2_monitoring_init_rhel4
+index 8eb06c5..2e8d0f7 100644
+--- a/scripts/lvm2_monitoring_init_rhel4
++++ b/scripts/lvm2_monitoring_init_rhel4
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
@@ -177,3 +112,6 @@ Index: LVM2.2.02.177/scripts/lvm2_monitoring_init_rhel4
  	;;
  esac
  
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
index e3ce4c8..2124eba 100644
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -1,7 +1,7 @@
-From 51d661ff33bb254d7b335a9c87acf5c6e7a94192 Mon Sep 17 00:00:00 2001
+From 103ac1c1200df8190372d973e004776cffe8e659 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 31 Jul 2018 15:08:34 +0800
-Subject: [PATCH] do not build manual
+Date: Mon, 26 Nov 2018 14:59:55 +0800
+Subject: [PATCH 2/3] do not build manual
 
 On some host (ubuntu 1404), build manual failed.
 ...
@@ -20,28 +20,28 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 3 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index e2f5a84..acf31e5 100644
+index 6a1a990..80cba91 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -18,7 +18,7 @@ top_builddir = @top_builddir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
  
--SUBDIRS = conf daemons include lib libdaemon libdm man scripts device_mapper tools
-+SUBDIRS = conf daemons include lib libdaemon libdm scripts device_mapper tools
+-SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools
++SUBDIRS = conf daemons include lib libdaemon libdm scripts tools
  
  ifeq ("@UDEV_RULES@", "yes")
    SUBDIRS += udev
-@@ -41,7 +41,7 @@ ifeq ($(MAKECMDGOALS),clean)
+@@ -33,7 +33,7 @@ ifeq ($(MAKECMDGOALS),clean)
  endif
  # FIXME Should use intermediate Makefiles here!
  ifeq ($(MAKECMDGOALS),distclean)
 -  SUBDIRS = conf include man test scripts \
 +  SUBDIRS = conf include test scripts \
      libdaemon lib tools daemons libdm \
-     udev po liblvm python device_mapper
+     udev po
  tools.distclean: test.distclean
-@@ -71,7 +71,7 @@ liblvm.device-mapper: include.device-mapper
+@@ -59,7 +59,7 @@ libdm.device-mapper: include.device-mapper
  daemons.device-mapper: libdm.device-mapper
  tools.device-mapper: libdm.device-mapper
  scripts.device-mapper: include.device-mapper
@@ -51,17 +51,17 @@ index e2f5a84..acf31e5 100644
  ifeq ("@INTL@", "yes")
  lib.pofile: include.pofile
 diff --git a/configure.ac b/configure.ac
-index aa374ea..5a92cba 100644
+index 9c45745..8fee4c4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2124,7 +2124,6 @@ libdm/Makefile
+@@ -1806,7 +1806,6 @@ libdaemon/server/Makefile
+ libdm/Makefile
+ libdm/dm-tools/Makefile
  libdm/libdevmapper.pc
- liblvm/Makefile
- liblvm/liblvm2app.pc
 -man/Makefile
  po/Makefile
- python/Makefile
- python/setup.py
+ scripts/blkdeactivate.sh
+ scripts/blk_availability_init_red_hat
 -- 
 2.7.4
 
diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.01.bb
similarity index 55%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.01.bb
index 26af327..2c4febb 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.01.bb
@@ -1,7 +1,6 @@
 require lvm2.inc
 
-SRC_URI[md5sum] = "bc26da66e96727babbd288bb0f050339"
-SRC_URI[sha256sum] = "24997e26dfc916151707c9da504d38d0473bec3481a8230b676bc079041bead6"
+SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
 
 DEPENDS += "autoconf-archive-native"
 
@@ -9,7 +8,6 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' -C libdm install
-    oe_runmake 'DESTDIR=${D}' -C tools install_device-mapper
 }
 
 RRECOMMENDS_${PN}_append_class-target = " lvm2-udevrules"
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 26a887e..66b0828 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
 
 DEPENDS += "util-linux libaio"
 
-SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
+SRC_URI = "git://github.com/lvmteam/lvm2.git;protocol=https;branch=master \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
@@ -21,11 +21,11 @@ SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
 UPSTREAM_CHECK_URI = "ftp://sources.redhat.com/pub/lvm2/"
 UPSTREAM_CHECK_REGEX = "LVM2\.(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/LVM2.${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig systemd license
 
-LVM2_PACKAGECONFIG = "dmeventd lvmetad"
+LVM2_PACKAGECONFIG = "dmeventd"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
     ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)} \
@@ -39,7 +39,6 @@ LVM2_PACKAGECONFIG_append_class-target = " \
 PACKAGECONFIG ??= "odirect ${LVM2_PACKAGECONFIG}"
 
 PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
-PACKAGECONFIG[lvmetad] = "--enable-lvmetad,--disable-lvmetad"
 PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
@@ -50,7 +49,6 @@ PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${n
 EXTRA_OECONF = "--with-user= \
                 --with-group= \
                 --enable-realtime \
-                --enable-applib \
                 --enable-cmdlib \
                 --enable-pkgconfig \
                 --with-usrlibdir=${libdir} \
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
index 7f5dd93..8b805fc 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
@@ -1,6 +1,6 @@
-From 5a3e13ae94318c2bed60f875bb3852c45ce0113c Mon Sep 17 00:00:00 2001
+From 3c16d9aaa46602e7594d717d86e7f02066d21134 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 25 May 2017 05:27:11 -0400
+Date: Mon, 26 Nov 2018 17:20:20 +0800
 Subject: [PATCH] explicitly do not install libdm
 
 Already have package libdevmapper which split from lvm2,
@@ -9,17 +9,16 @@ explicitly do not do the installation here.
 Upstream-Status: Inappropriate [meta-oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
 ---
- libdm/Makefile.in | 6 ++++--
- tools/Makefile.in | 3 ++-
- 2 files changed, 6 insertions(+), 3 deletions(-)
+ libdm/Makefile.in          | 6 ++++--
+ libdm/dm-tools/Makefile.in | 6 ++++--
+ 2 files changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/libdm/Makefile.in b/libdm/Makefile.in
-index 66ec39513..c779c9d86 100644
+index 8c8334a..effcf25 100644
 --- a/libdm/Makefile.in
 +++ b/libdm/Makefile.in
-@@ -77,9 +77,11 @@ ifeq ("@PKGCONFIG@", "yes")
+@@ -81,9 +81,11 @@ ifeq ("@PKGCONFIG@", "yes")
    INSTALL_TYPE += install_pkgconfig
  endif
  
@@ -33,11 +32,11 @@ index 66ec39513..c779c9d86 100644
  
  install_include: $(srcdir)/libdevmapper.h
  	$(INSTALL_DATA) -D $< $(includedir)/$(<F)
-diff --git a/tools/Makefile.in b/tools/Makefile.in
-index 103b76732..63ba7fc04 100644
---- a/tools/Makefile.in
-+++ b/tools/Makefile.in
-@@ -267,7 +267,8 @@ install_dmsetup_static: dmsetup.static
+diff --git a/libdm/dm-tools/Makefile.in b/libdm/dm-tools/Makefile.in
+index 39d411d..4a0f61a 100644
+--- a/libdm/dm-tools/Makefile.in
++++ b/libdm/dm-tools/Makefile.in
+@@ -60,9 +60,11 @@ install_dmsetup_static: dmsetup.static
  	$(Q) $(INSTALL_PROGRAM) -D $< $(staticdir)/$(<F)
  	$(Q) $(LN_S) -f $(<F) $(staticdir)/dmstats
  
@@ -45,8 +44,12 @@ index 103b76732..63ba7fc04 100644
 +install_device-mapper:
 +	echo "Do not install device mapper in lvm2"
  
- install_lvm2: $(INSTALL_LVM_TARGETS)
+-install: install_device-mapper
++install:
++	echo "Do not install device mapper in lvm2"
  
+ # dmfilemapd support
+ ifeq ("@BUILD_DMFILEMAPD@", "yes")
 -- 
-2.19.0.397.gdd90340f6a-goog
+2.7.4
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
similarity index 88%
rename from meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
index 7bd7b09..b28acf1 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
@@ -1,7 +1,6 @@
 require lvm2.inc
 
-SRC_URI[md5sum] = "bc26da66e96727babbd288bb0f050339"
-SRC_URI[sha256sum] = "24997e26dfc916151707c9da504d38d0473bec3481a8230b676bc079041bead6"
+SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
 
 SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch"
 
@@ -32,7 +31,6 @@ PACKAGE_BEFORE_PN = "${PN}-scripts ${PN}-udevrules"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
-                         ${@bb.utils.contains('PACKAGECONFIG', 'lvmetad', 'lvm2-lvmetad.socket lvm2-pvscan@.service', '', d)} \
                          blk-availability.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-- 
2.7.4


