Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PBwS6-0007F7-6e
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 23:25:36 +0200
Received: (qmail 2190 invoked by uid 503); 29 Oct 2010 21:03:50 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 29 Oct 2010 21:03:49 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Oct 2010 23:24:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Oct 2010 23:24:45 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Oct 2010 23:25:37 +0200
Message-Id: <1288387543-1277-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4295589621277896009
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/7] busybox: factorize recipes
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
X-List-Received-Date: Fri, 29 Oct 2010 21:25:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.13.2.bb |   45 ++-------------------------
 recipes/busybox/busybox_1.14.3.bb |   47 ++---------------------------
 recipes/busybox/busybox_1.15.3.bb |   48 +++---------------------------
 recipes/busybox/busybox_1.16.2.bb |   59 ++-----------------------------------
 recipes/busybox/busybox_1.17.1.bb |   55 +---------------------------------
 recipes/busybox/busybox_1.1x.inc  |   53 +++++++++++++++++++++++++++++++++
 6 files changed, 69 insertions(+), 238 deletions(-)
 create mode 100644 recipes/busybox/busybox_1.1x.inc

diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
index a3acceb..0ffcb7f 100644
--- a/recipes/busybox/busybox_1.13.2.bb
+++ b/recipes/busybox/busybox_1.13.2.bb
@@ -1,8 +1,8 @@
 require busybox.inc
+require busybox_1.1x.inc
 PR = "${INC_PR}.3"
 
-SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
+SRC_URI += "\
   file://busybox-1.13.2-awk.patch \
   file://busybox-1.13.2-depmod.patch \
   file://busybox-1.13.2-init.patch \
@@ -16,45 +16,8 @@ SRC_URI = "\
   file://busybox-1.13.2-unzip.patch \
   file://busybox-1.13.2-wget.patch \
   file://busybox-1.13.2-make382.patch \
-  file://fdisk_nios2.patch \
-  \
-  file://udhcpscript.patch \
-  file://udhcpc-fix-nfsroot.patch \
   file://udhcpc-background.patch \
-  file://B921600.patch \
-  file://get_header_tar.patch \
-  file://busybox-appletlib-dependency.patch \
-  file://find-touchscreen.sh \
-  file://busybox-cron \
-  file://busybox-httpd \
-  file://busybox-udhcpd \
-  file://default.script file://simple.script \
-  file://hwclock.sh \
-  file://hwclock-default \
-  file://mount.busybox \
-  file://mountall \
-  file://syslog \
-  file://syslog.conf \
-  file://umount.busybox \
-  file://defconfig \
-  file://mdev \
-  file://mdev.conf \
 "
-SRC_URI[tarball.md5sum] = "9e2a604d18bef219a5a6bf3acf78b9e1"
-SRC_URI[tarball.sha256sum] = "927774408bd982dd246fb716bb2e646ab0708ce321b42c5e271dc98c1f5d1dc8"
 
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
-
-do_configure_prepend () {
-	if [ "${TARGET_ARCH}" = "avr32" ] ; then
-		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
-	fi
-}
-
-do_install_append() {
-    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
-    install -d ${D}${sysconfdir}/init.d/
-    install -d ${D}${sysconfdir}/mdev
-    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
-    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
-}
+SRC_URI[md5sum] = "9e2a604d18bef219a5a6bf3acf78b9e1"
+SRC_URI[sha256sum] = "927774408bd982dd246fb716bb2e646ab0708ce321b42c5e271dc98c1f5d1dc8"
diff --git a/recipes/busybox/busybox_1.14.3.bb b/recipes/busybox/busybox_1.14.3.bb
index ff706f4..2fac528 100644
--- a/recipes/busybox/busybox_1.14.3.bb
+++ b/recipes/busybox/busybox_1.14.3.bb
@@ -1,49 +1,8 @@
 require busybox.inc
+require busybox_1.1x.inc
 PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
-  file://fdisk_nios2.patch \
-\
-  file://udhcpscript.patch \
-  file://udhcpc-fix-nfsroot.patch \
-  file://B921600.patch \
-  file://get_header_tar.patch \
-  file://busybox-appletlib-dependency.patch \
-  file://find-touchscreen.sh \
-  file://busybox-cron \
-  file://busybox-httpd \
-  file://busybox-udhcpd \
-  file://default.script file://simple.script \
-  file://hwclock.sh \
-  file://hwclock-default \
-  file://mount.busybox \
-  file://mountall \
-  file://syslog \
-  file://syslog.conf \
-  file://umount.busybox \
-  file://defconfig \
-  file://mdev \
-  file://mdev.conf \
-"
-
-SRC_URI[tarball.md5sum] = "d170bf5f97a41aec3a505eab690d5699"
-SRC_URI[tarball.sha256sum] = "e94df4f9063a1951b4e94e76148ed80e921737a89d97bc2c310a2a8927982e90"
-
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
-
-do_configure_prepend () {
-	if [ "${TARGET_ARCH}" = "avr32" ] ; then
-		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
-	fi
-}
-
-do_install_append() {
-    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
-    install -d ${D}${sysconfdir}/init.d/
-    install -d ${D}${sysconfdir}/mdev
-    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
-    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
-}
+SRC_URI[md5sum] = "d170bf5f97a41aec3a505eab690d5699"
+SRC_URI[sha256sum] = "e94df4f9063a1951b4e94e76148ed80e921737a89d97bc2c310a2a8927982e90"
diff --git a/recipes/busybox/busybox_1.15.3.bb b/recipes/busybox/busybox_1.15.3.bb
index 0924d3d..5106a58 100644
--- a/recipes/busybox/busybox_1.15.3.bb
+++ b/recipes/busybox/busybox_1.15.3.bb
@@ -1,55 +1,17 @@
 require busybox.inc
+require busybox_1.1x.inc
 PR = "${INC_PR}.4"
 
-SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
-  file://fdisk_nios2.patch \
-  \
-  file://udhcpscript.patch \
-  file://udhcpc-fix-nfsroot.patch \
-  file://B921600.patch \
-  file://get_header_tar.patch \
-  file://busybox-appletlib-dependency.patch \
+SRC_URI += "\
   file://0000-wget-no-check-certificate.patch \
-  file://find-touchscreen.sh \
-  file://busybox-cron \
-  file://busybox-httpd \
-  file://busybox-udhcpd \
-  file://default.script file://simple.script \
-  file://hwclock.sh \
-  file://hwclock-default \
-  file://mount.busybox \
-  file://mountall \
-  file://syslog \
-  file://syslog.conf \
-  file://umount.busybox \
-  file://defconfig \
-  file://mdev \
-  file://mdev.conf \
 "
-SRC_URI[tarball.md5sum] = "6059ac9456de6fb18dc8ee4cd0ec9240"
-SRC_URI[tarball.sha256sum] = "d74020ad2cc5a4dcc5109c44dbd0e22582d6ce42954b0f1ff29763c8c0ff03cb"
+
+SRC_URI[md5sum] = "6059ac9456de6fb18dc8ee4cd0ec9240"
+SRC_URI[sha256sum] = "d74020ad2cc5a4dcc5109c44dbd0e22582d6ce42954b0f1ff29763c8c0ff03cb"
 
 # gcc 4.5 has this bug on thumb
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44557
 # so add -fomit-frame-pointer
 # this will be removed once the above bug is fixed.
 
-
 CFLAGS_append = " -fomit-frame-pointer"
-
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
-
-do_configure_prepend () {
-	if [ "${TARGET_ARCH}" = "avr32" ] ; then
-		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
-	fi
-}
-
-do_install_append() {
-    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
-    install -d ${D}${sysconfdir}/init.d/
-    install -d ${D}${sysconfdir}/mdev
-    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
-    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
-}
diff --git a/recipes/busybox/busybox_1.16.2.bb b/recipes/busybox/busybox_1.16.2.bb
index b3fee02..b4aaa74 100644
--- a/recipes/busybox/busybox_1.16.2.bb
+++ b/recipes/busybox/busybox_1.16.2.bb
@@ -1,62 +1,9 @@
 require busybox.inc
+require busybox_1.1x.inc
 PR = "${INC_PR}.3"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_shr = "1"
 
-SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
-  file://fdisk_nios2.patch \
-  \
-  file://udhcpscript.patch \
-  file://udhcpc-fix-nfsroot.patch \
-  file://B921600.patch \
-  file://get_header_tar.patch \
-  file://busybox-appletlib-dependency.patch \
-#  file://0000-wget-no-check-certificate.patch \
-  file://find-touchscreen.sh \
-  file://busybox-cron \
-  file://busybox-httpd \
-  file://busybox-udhcpd \
-  file://default.script file://simple.script \
-  file://hwclock.sh \
-  file://hwclock-default \
-  file://mount.busybox \
-  file://mountall \
-  file://syslog \
-  file://syslog.conf \
-  file://umount.busybox \
-  file://defconfig \
-  file://mdev \
-  file://mdev.conf \
-"
-
-SRC_URI[tarball.md5sum] = "2ba980f720a5bdce4ec05423519acc35"
-SRC_URI[tarball.sha256sum] = "3bf1b1a41294d25335abdd10c65cffdb01c36337ca011f1b38c6ad89590115ba"
-
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
-
-do_configure_prepend () {
-	if [ "${TARGET_ARCH}" = "avr32" ] ; then
-		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
-	fi
-}
-
-do_install_append() {
-    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
-    install -d ${D}${sysconfdir}/init.d/
-    install -d ${D}${sysconfdir}/mdev
-    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
-    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
-
-    if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
-          install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
-    fi
-
-    if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
-          install -d ${D}${sysconfdir}/udhcpc.d
-          install -d ${D}${datadir}/udhcpc
-          install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
-          install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
-    fi
-}
+SRC_URI[md5sum] = "2ba980f720a5bdce4ec05423519acc35"
+SRC_URI[sha256sum] = "3bf1b1a41294d25335abdd10c65cffdb01c36337ca011f1b38c6ad89590115ba"
diff --git a/recipes/busybox/busybox_1.17.1.bb b/recipes/busybox/busybox_1.17.1.bb
index 5a475b2..c16251c 100644
--- a/recipes/busybox/busybox_1.17.1.bb
+++ b/recipes/busybox/busybox_1.17.1.bb
@@ -1,61 +1,8 @@
 require busybox.inc
+require busybox_1.1x.inc
 PR = "${INC_PR}"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2 \
-  file://fdisk_nios2.patch \
-  \
-  file://udhcpscript.patch \
-  file://udhcpc-fix-nfsroot.patch \
-  file://B921600.patch \
-  file://get_header_tar.patch \
-  file://busybox-appletlib-dependency.patch \
-#  file://0000-wget-no-check-certificate.patch \
-  file://find-touchscreen.sh \
-  file://busybox-cron \
-  file://busybox-httpd \
-  file://busybox-udhcpd \
-  file://default.script file://simple.script \
-  file://hwclock.sh \
-  file://hwclock-default \
-  file://mount.busybox \
-  file://mountall \
-  file://syslog \
-  file://syslog.conf \
-  file://umount.busybox \
-  file://defconfig \
-  file://mdev \
-  file://mdev.conf \
-"
-
 SRC_URI[md5sum] = "c7fe7533b7fc4018b0b49a05ee0ee601"
 SRC_URI[sha256sum] = "bf9177810d7e151b0e662477c33b9afd062570e6298ec46f2a8397a6a839d164"
-
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
-
-do_configure_prepend () {
-	if [ "${TARGET_ARCH}" = "avr32" ] ; then
-		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
-	fi
-}
-
-do_install_append() {
-    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
-    install -d ${D}${sysconfdir}/init.d/
-    install -d ${D}${sysconfdir}/mdev
-    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
-    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
-
-    if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
-          install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
-    fi
-
-    if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
-          install -d ${D}${sysconfdir}/udhcpc.d
-          install -d ${D}${datadir}/udhcpc
-          install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
-          install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
-    fi
-}
diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
new file mode 100644
index 0000000..df536f6
--- /dev/null
+++ b/recipes/busybox/busybox_1.1x.inc
@@ -0,0 +1,53 @@
+require busybox.inc
+
+SRC_URI = "\
+  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2 \
+  file://fdisk_nios2.patch \
+  file://udhcpscript.patch \
+  file://udhcpc-fix-nfsroot.patch \
+  file://B921600.patch \
+  file://get_header_tar.patch \
+  file://busybox-appletlib-dependency.patch \
+  file://find-touchscreen.sh \
+  file://busybox-cron \
+  file://busybox-httpd \
+  file://busybox-udhcpd \
+  file://default.script file://simple.script \
+  file://hwclock.sh \
+  file://hwclock-default \
+  file://mount.busybox \
+  file://mountall \
+  file://syslog \
+  file://syslog.conf \
+  file://umount.busybox \
+  file://defconfig \
+  file://mdev \
+  file://mdev.conf \
+"
+
+EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
+
+do_configure_prepend () {
+	if [ "${TARGET_ARCH}" = "avr32" ] ; then
+		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
+	fi
+}
+
+do_install_append() {
+    install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
+    install -d ${D}${sysconfdir}/init.d/
+    install -d ${D}${sysconfdir}/mdev
+    install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
+    install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
+
+    if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
+          install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
+    fi
+
+    if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
+          install -d ${D}${sysconfdir}/udhcpc.d
+          install -d ${D}${datadir}/udhcpc
+          install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
+          install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
+    fi
+}
-- 
1.6.3.3



