Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEBE7CC38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 01:19:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1R1Iw4a001764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2019 17:19:14 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 26 Feb 2019 17:18:48 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 20:18:37 -0500
Message-ID: <20190227011837.84692-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190227011837.84692-1-kai.kang@windriver.com>
References: <20190227011837.84692-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/1] lvm2/libdevmapper: 2.03.01 -> 2.03.02
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
X-List-Received-Date: Wed, 27 Feb 2019 01:19:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade lvm2/libdevmapper from 2.03.01 to 2.03.02.

* update SRC_URI back to use ftp url
  - 2.03.02 has been removed but no such tag in git repo
  - subdir 'releases' on ftp site should be a persistent place for tarballs
* drop 0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
  which is not needed any longer
* remove backpoort patch
* update patch contexts

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...h-for-O_-defines-and-fcntl-signature.patch | 30 -----------------
 .../lvm2/files/0005-do-not-build-manual.patch | 13 +++++---
 ...lvm2-monitor.service-after-tmp.mount.patch | 13 +++++---
 ...per_2.03.01.bb => libdevmapper_2.03.02.bb} |  0
 meta-oe/recipes-support/lvm2/lvm2.inc         |  7 ++--
 ...0001-explicitly-do-not-install-libdm.patch | 32 ++++++++++++-------
 ...g-service-shouldn-t-refer-to-lvmetad.patch | 31 ------------------
 .../lvm2/{lvm2_2.03.01.bb => lvm2_2.03.02.bb} |  3 +-
 8 files changed, 44 insertions(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.01.bb => libdevmapper_2.03.02.bb} (100%)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch
 rename meta-oe/recipes-support/lvm2/{lvm2_2.03.01.bb => lvm2_2.03.02.bb} (92%)

diff --git a/meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch b/meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
deleted file mode 100644
index 9ab1c06d2..000000000
--- a/meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b1ad91a059d99afd1ce25823b7c0a8d3ac63d2fd Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Tue, 25 Oct 2016 11:55:49 +0000
-Subject: [PATCH 3/4] include fcntl.h for O_* defines and fcntl() signature
-
-On glibc _somehow_ this header gets pulled in indirectly
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
-Upstream-Status: Pending
----
- libdaemon/server/daemon-server.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
-index 6af6de9..a9590e7 100644
---- a/libdaemon/server/daemon-server.c
-+++ b/libdaemon/server/daemon-server.c
-@@ -18,6 +18,7 @@
- #include "daemon-server.h"
- #include "daemon-log.h"
- 
-+#include <fcntl.h>
- #include <dlfcn.h>
- #include <errno.h>
- #include <pthread.h>
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
index 2124ebafe..7117d99a3 100644
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -14,6 +14,11 @@ Do not build man to workaround the issue.
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+
+Update context for lvm2 2.03.02.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  Makefile.in  | 6 +++---
  configure.ac | 1 -
@@ -41,7 +46,7 @@ index 6a1a990..80cba91 100644
      libdaemon lib tools daemons libdm \
      udev po
  tools.distclean: test.distclean
-@@ -59,7 +59,7 @@ libdm.device-mapper: include.device-mapper
+@@ -65,7 +65,7 @@ libdm.device-mapper: include.device-mapper
  daemons.device-mapper: libdm.device-mapper
  tools.device-mapper: libdm.device-mapper
  scripts.device-mapper: include.device-mapper
@@ -51,17 +56,17 @@ index 6a1a990..80cba91 100644
  ifeq ("@INTL@", "yes")
  lib.pofile: include.pofile
 diff --git a/configure.ac b/configure.ac
-index 9c45745..8fee4c4 100644
+index 7fd0561..4154dc0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1806,7 +1806,6 @@ libdaemon/server/Makefile
+@@ -1812,7 +1812,6 @@ libdaemon/server/Makefile
  libdm/Makefile
  libdm/dm-tools/Makefile
  libdm/libdevmapper.pc
 -man/Makefile
  po/Makefile
+ scripts/lvm2-pvscan.service
  scripts/blkdeactivate.sh
- scripts/blk_availability_init_red_hat
 -- 
 2.7.4
 
diff --git a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
index 0e68d62fc..e5ad4eaf2 100644
--- a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
+++ b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
@@ -10,20 +10,25 @@ So start lvm2-monitor.service after tmp.mount
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+
+Update context for lvm2 2.03.02.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  scripts/lvm2_monitoring_systemd_red_hat.service.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in b/scripts/lvm2_monitoring_systemd_red_hat.service.in
-index 22238b7..93b2bee 100644
+index 7ec4e4e..3282a95 100644
 --- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
 +++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
 @@ -2,7 +2,7 @@
  Description=Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling
  Documentation=man:dmeventd(8) man:lvcreate(8) man:lvchange(8) man:vgchange(8)
- Requires=dm-event.socket lvm2-lvmetad.socket
--After=dm-event.socket dm-event.service lvm2-lvmetad.socket lvm2-activation.service lvm2-lvmetad.service
-+After=dm-event.socket dm-event.service lvm2-lvmetad.socket lvm2-activation.service lvm2-lvmetad.service tmp.mount
+ Requires=dm-event.socket
+-After=dm-event.socket dm-event.service lvm2-activation.service
++After=dm-event.socket dm-event.service lvm2-activation.service tmp.mount
  Before=local-fs-pre.target
  DefaultDependencies=no
  Conflicts=shutdown.target
diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.01.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.02.bb
similarity index 100%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.01.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.02.bb
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 1961dca1e..8617f25cb 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -7,18 +7,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
 
 DEPENDS += "util-linux libaio"
 
-SRC_URI = "git://github.com/lvmteam/lvm2.git;protocol=https;branch=master \
+SRC_URI = "ftp://sources.redhat.com/pub/lvm2/releases/LVM2.${PV}.tgz \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
-           file://0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch \
            file://0004-tweak-MODPROBE_CMD-for-cross-compile.patch \
            file://0001-Avoid-bashisms-in-init-scripts.patch \
            file://0005-do-not-build-manual.patch \
            file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
            "
+SRC_URI[md5sum] = "5fc07da5461a3794a751dcfc355827d5"
+SRC_URI[sha256sum] = "550ba750239fd75b7e52c9877565cabffef506bbf6d7f6f17b9700dee56c720f"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/LVM2.${PV}"
 
 inherit autotools-brokensep pkgconfig systemd license
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
index 8b805fc1a..24160b405 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
@@ -9,16 +9,21 @@ explicitly do not do the installation here.
 Upstream-Status: Inappropriate [meta-oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+
+Update context for lvm2 2.03.02.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  libdm/Makefile.in          | 6 ++++--
  libdm/dm-tools/Makefile.in | 6 ++++--
  2 files changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/libdm/Makefile.in b/libdm/Makefile.in
-index 8c8334a..effcf25 100644
+index e9bb5ae..4e9ae3f 100644
 --- a/libdm/Makefile.in
 +++ b/libdm/Makefile.in
-@@ -81,9 +81,11 @@ ifeq ("@PKGCONFIG@", "yes")
+@@ -82,9 +82,11 @@ ifeq ("@PKGCONFIG@", "yes")
    INSTALL_TYPE += install_pkgconfig
  endif
  
@@ -31,25 +36,30 @@ index 8c8334a..effcf25 100644
 +	echo "Do not install device mapper in lvm2"
  
  install_include: $(srcdir)/libdevmapper.h
- 	$(INSTALL_DATA) -D $< $(includedir)/$(<F)
+ 	@echo "    [INSTALL] $<"
 diff --git a/libdm/dm-tools/Makefile.in b/libdm/dm-tools/Makefile.in
-index 39d411d..4a0f61a 100644
+index 15a9d8e..65e1306 100644
 --- a/libdm/dm-tools/Makefile.in
 +++ b/libdm/dm-tools/Makefile.in
-@@ -60,9 +60,11 @@ install_dmsetup_static: dmsetup.static
- 	$(Q) $(INSTALL_PROGRAM) -D $< $(staticdir)/$(<F)
- 	$(Q) $(LN_S) -f $(<F) $(staticdir)/dmstats
+@@ -20,7 +20,8 @@ all: device-mapper
  
--install_device-mapper: $(INSTALL_DMSETUP_TARGETS)
+ SOURCES2 = dmsetup.c
+ TARGETS_DM = dmsetup
+-install_device-mapper: install_dmsetup_dynamic
 +install_device-mapper:
 +	echo "Do not install device mapper in lvm2"
  
--install: install_device-mapper
+ ifeq ("@STATIC_LINK@", "yes")
+   TARGETS_DM += dmsetup.static
+@@ -93,6 +94,7 @@ install_dmfilemapd_static: dmfilemapd.static
+ .PHONY: install_dmsetup_dynamic install_dmsetup_static
+ .PHONY: install_dmfilemapd install_dmfilemapd_static
+ 
+-install: install_device-mapper install_dmfilemapd
 +install:
 +	echo "Do not install device mapper in lvm2"
  
- # dmfilemapd support
- ifeq ("@BUILD_DMFILEMAPD@", "yes")
+ device-mapper: $(TARGETS_DM)
 -- 
 2.7.4
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch
deleted file mode 100644
index 4eeac1c57..000000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b922f4a4e7e1c6c64a235bae4c575540bc4a12df Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 21 Feb 2019 14:00:34 +0800
-Subject: [PATCH] lvm2-monitoring service shouldn't refer to lvmetad
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=lvm2.git;
-a=commit;h=df2fa88e631b13f0f2cfff4aeab80f12bd93ab72]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- scripts/lvm2_monitoring_systemd_red_hat.service.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in b/scripts/lvm2_monitoring_systemd_red_hat.service.in
-index 2b87479..3282a95 100644
---- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
-+++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
-@@ -1,8 +1,8 @@
- [Unit]
- Description=Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling
- Documentation=man:dmeventd(8) man:lvcreate(8) man:lvchange(8) man:vgchange(8)
--Requires=dm-event.socket lvm2-lvmetad.socket
--After=dm-event.socket dm-event.service lvm2-lvmetad.socket lvm2-activation.service lvm2-lvmetad.service tmp.mount
-+Requires=dm-event.socket
-+After=dm-event.socket dm-event.service lvm2-activation.service tmp.mount
- Before=local-fs-pre.target
- DefaultDependencies=no
- Conflicts=shutdown.target
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
similarity index 92%
rename from meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
index 0df624b73..35c46f0d8 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
@@ -3,8 +3,7 @@ require lvm2.inc
 SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
 
 SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch \
-            file://0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch \
-	    file://0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch \
+            file://0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch \
            "
 
 DEPENDS += "autoconf-archive-native"
-- 
2.20.0


