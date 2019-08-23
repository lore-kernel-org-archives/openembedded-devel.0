Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 65AB67F371
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 10:06:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7NA5IMr019837
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 03:05:55 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 23 Aug 2019 03:05:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 23 Aug 2019 18:05:07 +0800
Message-ID: <1566554709-22088-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] libdevmapper/lvm2: force recipe libdevmapper to populate sysroot only
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
X-List-Received-Date: Fri, 23 Aug 2019 10:06:20 -0000
Content-Type: text/plain

Previously, in order to fix circular dependencies, we split
libdm from lvm2 as a new recipe libdevmapper, and as running result
proved, we need to keep both of them built with the same configuration
option

With new configuration options added, it is hard to keep them the same,
so we make recipe libdevmapper to populate libdevmapper sysroot only,
and make lvm2 to provide package libdevmapper.

In this situation, option differ does not affect header and library API
between lvm2 and libdevmapper, although lvm2 and libdevmapper are different
at build time, but there is only one lvm2 at run time

Side effect:
- If one recipe DEPENDS on libdevmapper, it has to add libdevmapper to
  its RDEPENDS or add lvm2 to DEPENDS, otherwise, there will be a
  [file-rdeps] or [build-deps] QA warning

- It has to add `PREFERRED_RPROVIDER_libdevmapper = "lvm2"' to local.conf
  to workaound 'Multiple providers' NOTE

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-support/lvm2/libdevmapper_2.03.02.bb   |  6 +-
 .../0001-explicitly-do-not-install-libdm.patch     | 65 ----------------------
 meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb       | 18 +++++-
 3 files changed, 22 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.02.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.02.bb
index 2c4febb..32bc13d 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.02.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.02.bb
@@ -1,3 +1,6 @@
+# Break circular dependencies, only populate sysroot (header,
+# libraries) to other recipe for compiling, recipe lvm2
+# generates package libdevmapper
 require lvm2.inc
 
 SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
@@ -10,6 +13,7 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' -C libdm install
 }
 
-RRECOMMENDS_${PN}_append_class-target = " lvm2-udevrules"
+# Do not generate package libdevmapper
+PACKAGES = ""
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
deleted file mode 100644
index 24160b4..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 3c16d9aaa46602e7594d717d86e7f02066d21134 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 26 Nov 2018 17:20:20 +0800
-Subject: [PATCH] explicitly do not install libdm
-
-Already have package libdevmapper which split from lvm2,
-explicitly do not do the installation here.
-
-Upstream-Status: Inappropriate [meta-oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-
-Update context for lvm2 2.03.02.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- libdm/Makefile.in          | 6 ++++--
- libdm/dm-tools/Makefile.in | 6 ++++--
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/libdm/Makefile.in b/libdm/Makefile.in
-index e9bb5ae..4e9ae3f 100644
---- a/libdm/Makefile.in
-+++ b/libdm/Makefile.in
-@@ -82,9 +82,11 @@ ifeq ("@PKGCONFIG@", "yes")
-   INSTALL_TYPE += install_pkgconfig
- endif
- 
--install: $(INSTALL_TYPE) install_include
-+install:
-+	echo "Do not install device mapper in lvm2"
- 
--install_device-mapper: install
-+install_device-mapper:
-+	echo "Do not install device mapper in lvm2"
- 
- install_include: $(srcdir)/libdevmapper.h
- 	@echo "    [INSTALL] $<"
-diff --git a/libdm/dm-tools/Makefile.in b/libdm/dm-tools/Makefile.in
-index 15a9d8e..65e1306 100644
---- a/libdm/dm-tools/Makefile.in
-+++ b/libdm/dm-tools/Makefile.in
-@@ -20,7 +20,8 @@ all: device-mapper
- 
- SOURCES2 = dmsetup.c
- TARGETS_DM = dmsetup
--install_device-mapper: install_dmsetup_dynamic
-+install_device-mapper:
-+	echo "Do not install device mapper in lvm2"
- 
- ifeq ("@STATIC_LINK@", "yes")
-   TARGETS_DM += dmsetup.static
-@@ -93,6 +94,7 @@ install_dmfilemapd_static: dmfilemapd.static
- .PHONY: install_dmsetup_dynamic install_dmsetup_static
- .PHONY: install_dmfilemapd install_dmfilemapd_static
- 
--install: install_device-mapper install_dmfilemapd
-+install:
-+	echo "Do not install device mapper in lvm2"
- 
- device-mapper: $(TARGETS_DM)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
index 9922ef7..785c696 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
@@ -2,7 +2,7 @@ require lvm2.inc
 
 SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
 
-SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch \
+SRC_URI += " \
             file://0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch \
            "
 
@@ -46,6 +46,13 @@ LVM2_PACKAGECONFIG_append_class-target = " \
 "
 PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev"
 
+PACKAGES =+ "libdevmapper"
+FILES_libdevmapper = " \
+    ${libdir}/libdevmapper.so.* \
+    ${sbindir}/dmsetup \
+    ${sbindir}/dmstats \
+"
+
 FILES_${PN} += "${libdir}/device-mapper/*.so"
 FILES_${PN}-scripts = " \
     ${sbindir}/blkdeactivate \
@@ -65,4 +72,13 @@ RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
 
 CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
 
+SYSROOT_PREPROCESS_FUNCS_append = " remove_libdevmapper_sysroot_preprocess"
+remove_libdevmapper_sysroot_preprocess() {
+    rm -f ${SYSROOT_DESTDIR}${libdir}/libdevmapper.so* \
+       ${SYSROOT_DESTDIR}${sbindir}/dmsetup \
+       ${SYSROOT_DESTDIR}${sbindir}/dmstats \
+       ${SYSROOT_DESTDIR}${includedir}/libdevmapper.h \
+       ${SYSROOT_DESTDIR}${libdir}/pkgconfig/devmapper.pc
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


