Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R136x-0007jG-7A
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 23:23:15 +0200
Received: from mizar.localdomain (87.14.251.43) by smtp207.alice.it
	(8.5.124.08) id 4DFA189A072C63E0; Tue, 6 Sep 2011 23:18:15 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue,  6 Sep 2011 23:17:50 +0200
Message-Id: <38ce025d4c30d4d1ebc8847e9263ec25e15bc5c9.1315343405.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1315343405.git.andrea.adami@gmail.com>
References: <cover.1315343405.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1315343405.git.andrea.adami@gmail.com>
References: <cover.1315343405.git.andrea.adami@gmail.com>
Subject: [meta-oe][PATCH 1/2] klibc_1.5.24: remove nostrip patch and fix packaging of klibc-utils
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
X-List-Received-Date: Tue, 06 Sep 2011 21:23:15 -0000

* follow Debian packaging for klibc-utils
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../klibc/klibc-1.5.24/no_strip.patch              |   36 --------------------
 meta-oe/recipes-devtools/klibc/klibc-utils.inc     |   12 +++++--
 .../recipes-devtools/klibc/klibc-utils_1.5.24.bb   |   17 +++++++++
 meta-oe/recipes-devtools/klibc/klibc.inc           |    3 +-
 meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb     |    7 +---
 5 files changed, 28 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/no_strip.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-utils_1.5.24.bb

diff --git a/meta-oe/recipes-devtools/klibc/klibc-1.5.24/no_strip.patch b/meta-oe/recipes-devtools/klibc/klibc-1.5.24/no_strip.patch
deleted file mode 100644
index f690d98..0000000
--- a/meta-oe/recipes-devtools/klibc/klibc-1.5.24/no_strip.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Do not strip binaries too early. Strip is done before packaging.
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
---- a/scripts/Kbuild.klibc	2011-06-14 17:11:17.000000000 +0200
-+++ b/scripts/Kbuild.klibc	2011-07-15 01:18:58.000000000 +0200
-@@ -332,8 +332,7 @@
-                        $(KLIBCLIBC)				\
- 		       $(KLIBCLIBGCC)				\
- 		       --end-group ;				\
--                      cp -f $@ $@.g ;				\
--                      $(KLIBCSTRIP) $(KLIBCSTRIPFLAGS) $@
-+                       cp -f $@ $@.g
- 
- 
- $(static-y): $(kprog-objs) $(lib-target) $(KLIBCCRT0) $(KLIBCLIBC) FORCE
-@@ -348,8 +347,7 @@
-                        -R $(KLIBCLIBCSHARED)			\
- 	               $(KLIBCLIBGCC)				\
- 		       --end-group ;				\
--                      cp -f $@ $@.g ;				\
--                      $(KLIBCSTRIP) $(KLIBCSTRIPFLAGS) $@
-+                       cp -f $@ $@.g
- 
- 
- $(shared-y): $(kprog-objs) $(lib-target) $(KLIBCCRTSHARED) \
-
---- a/usr/klibc/Kbuild	2011-07-15 01:46:32.000000000 +0200
-+++ b/usr/klibc/Kbuild	2011-07-15 01:47:17.000000000 +0200
-@@ -147,7 +147,6 @@
- 
- quiet_cmd_sohash = GEN     $@
-       cmd_sohash = cat $< > $@;                                           \
--                     $(KLIBCSTRIP) $(KLIBCSTRIPFLAGS) $@;                 \
- 		     chmod a+x $@;					  \
-                      rm -f $(obj)/klibc-???????????????????????????.so;   \
-                      ln -f $@ $(obj)/klibc-$(SOLIBHASH).so
diff --git a/meta-oe/recipes-devtools/klibc/klibc-utils.inc b/meta-oe/recipes-devtools/klibc/klibc-utils.inc
index a360c2e..0f195a3 100644
--- a/meta-oe/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-oe/recipes-devtools/klibc/klibc-utils.inc
@@ -9,9 +9,15 @@ do_install_append() {
         install -d ${D}${base_bindir}
         install -d ${D}${base_sbindir}
 
-        # those 2 are always static
-        install -m 755 usr/dash/sh ${D}${base_bindir}/sh
-        install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
+        # debian packages kinit + kinit.shared but only sh.shared
+        if [ "${KLIBC_UTILS_VARIANT}" = "shared" ]; then
+            install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
+            install -m 755 usr/kinit/kinit.shared ${D}${base_bindir}/kinit.shared
+            install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh.shared
+        else
+            install -m 755 usr/dash/sh ${D}${base_bindir}/sh
+            install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
+        fi
 
         install -m 755 usr/gzip/gzip ${D}${base_bindir}
         install -m 755 usr/kinit/fstype/${KLIBC_UTILS_VARIANT}/fstype ${D}${base_bindir}
diff --git a/meta-oe/recipes-devtools/klibc/klibc-utils_1.5.24.bb b/meta-oe/recipes-devtools/klibc/klibc-utils_1.5.24.bb
new file mode 100644
index 0000000..b26dda4
--- /dev/null
+++ b/meta-oe/recipes-devtools/klibc/klibc-utils_1.5.24.bb
@@ -0,0 +1,17 @@
+PR = "${INC_PR}.0"
+
+KLIBC_UTILS_VARIANT = "shared"
+KLIBC_UTILS_PKGNAME = "klibc-utils"
+
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+
+do_install() {
+        :
+}
+
+PACKAGES_${PN} = "${PN}"
+FILES_${PN} = ""
+
+require klibc-utils.inc
+require klibc.inc
+require klibc-checksums_${PV}.inc
diff --git a/meta-oe/recipes-devtools/klibc/klibc.inc b/meta-oe/recipes-devtools/klibc/klibc.inc
index 62bf1e7..6654123 100644
--- a/meta-oe/recipes-devtools/klibc/klibc.inc
+++ b/meta-oe/recipes-devtools/klibc/klibc.inc
@@ -12,7 +12,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -33,7 +33,6 @@ SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch \
             file://modprobe.patch \
             file://dash_readopt.patch \
             file://wc.patch \
-            file://no_strip.patch \
             file://staging.patch \
             file://socket.h.patch \
             "
diff --git a/meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb b/meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb
index 124a416..a313bfd 100644
--- a/meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb
+++ b/meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb
@@ -15,11 +15,6 @@ do_install() {
         find ${D}${base_libdir}/klibc/include -name '.install' -delete
         find ${D}${base_libdir}/klibc/include -name '..install.cmd' -delete
 
-        # only for sh.shared and kinit.shared
-        install -d ${D}${base_bindir}
-        install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh.shared
-        install -m 755 usr/kinit/kinit.shared ${D}${base_bindir}/kinit.shared
-
         install -d ${D}${base_libdir}
         install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
         (cd  ${D}${base_libdir}; ln -s klibc-*.so klibc.so)
@@ -35,6 +30,6 @@ FILES_libklibc-dev = "${base_libdir}/klibc.so \
 # see above
 # do not package it in -dev
 #                      ${base_bindir}/klcc \
-require klibc-utils.inc
+
 require klibc.inc
 require klibc-checksums_${PV}.inc
-- 
1.7.3.4



