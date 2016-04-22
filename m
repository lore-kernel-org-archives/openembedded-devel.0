Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id BD4BB731C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:49:04 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id n3so41997508wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JeSpu9z+9ye04BAB1Y2CPd85lstulcEm9UeQ4sWbGl0=;
	b=qU02Mv2tiCFKNOPmAy+pSx2V/Oq2JZaimLTKOAAlrOMJa1aguFDhEB9EiLo8Sp13QO
	PwJYLWNJ7ZHVx2twsMFg9/urc/DSBaG4CbjdBWncE6k+OvMnHHPcXT/nRVtDifKtSx7j
	WnImGtqWdl2IgXwLPmjiv9xICyBySMWtrRKNQaUw/W9B62RTKPIctnOUN2zUrhed1qI1
	uXu8Q4YYHeXiUEUJmjfsuFiVYpLkyh173e5NM0fNWb10HxXe1GaIYezZhe0Wi/v+wY1y
	mV9eHQVFy654hGkW3F0VOhRkgJoA4f0/xZo9ZyU4z8EOHhHQ2RcIIJnVHD0Jb+VK5lpN
	ffOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JeSpu9z+9ye04BAB1Y2CPd85lstulcEm9UeQ4sWbGl0=;
	b=lkNZwW96mts4s5xLVTm1+XrV2cgmO07FrOKVJYR+DCw2ZGbu+ADruIWlXFZvoXzEry
	pyNRxWe688RAEZtWwi1JFsxul41dCNK0aFAGa4EZDq1ZKZCAFRAMwWWylcjRNmjhymHk
	n80zCZaT65razog2DpLLEMcm7kBG/QaYemtEoWPG8JFZE/2O42xc93X6VcqtNtrAGhs3
	p4hVu5pOwhCz1VZJvhdZm09wNL/4n8xSYkHxfrMTlBjxZN45zfKuOJb+OK/wqLnaPe4Z
	avK1W18SDDFep4rOoEJxdbPH7HLkGsheE7fp/+fQzQPRbgdXl6OWYIrc2fc7NV1xs4JS
	Y2Aw==
X-Gm-Message-State: AOPr4FWIRayOCTV+HkFxtlS3LdnyhqP5FAubm4Gy/I0rFgk75FtidnP/Vd6u6BDHfj340tkd
X-Received: by 10.28.149.205 with SMTP id x196mr5805509wmd.67.1461354544027;
	Fri, 22 Apr 2016 12:49:04 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm4875842wmf.8.2016.04.22.12.49.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:49:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 20:48:49 +0100
Message-Id: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/8] meta-oe: use bb.utils.contains() instead of base_contains()
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
X-List-Received-Date: Fri, 22 Apr 2016 19:49:06 -0000

base_contains() is a compatibility wrapper and may warn in the future, so
replace all instances with bb.utils.contains().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb |  2 +-
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |  2 +-
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb   |  2 +-
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb       |  2 +-
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb    |  2 +-
 meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb    |  2 +-
 .../recipes-core/packagegroups/packagegroup-basic.bb   | 10 +++++-----
 .../recipes-core/packagegroups/packagegroup-boot.bb    |  2 +-
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb          |  2 +-
 meta-oe/recipes-extended/corosync/corosync_2.3.5.bb    |  2 +-
 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb              |  2 +-
 .../konkretcmpi/konkretcmpi-native_0.9.2.bb            |  2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb      |  2 +-
 .../openlmi/openlmi-providers_0.6.0.bb                 |  2 +-
 meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb  |  4 ++--
 meta-oe/recipes-extended/polkit/polkit_0.113.bb        |  6 +++---
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb       |  4 ++--
 meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb      |  6 +++---
 .../recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb    |  6 +++---
 .../smartmontools/smartmontools_6.4.bb                 |  4 ++--
 meta-oe/recipes-graphics/fbida/fbida_2.10.bb           | 14 +++++++-------
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb           |  2 +-
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb            | 18 +++++++++---------
 meta-oe/recipes-graphics/slim/slim_1.3.2.bb            |  4 ++--
 .../terminus-font/terminus-font_4.38.bb                |  8 ++++----
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb         |  2 +-
 meta-oe/recipes-kernel/ktap/ktap.inc                   |  4 ++--
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb     |  2 +-
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb |  2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb           |  4 ++--
 meta-oe/recipes-support/emacs/emacs.inc                |  4 ++--
 meta-oe/recipes-support/espeak/espeak_1.37.bb          |  2 +-
 meta-oe/recipes-support/fftw/fftwf_3.3.4.bb            |  2 +-
 meta-oe/recipes-support/gradm/gradm_3.1.bb             |  4 ++--
 .../recipes-support/libcanberra/libcanberra_0.30.bb    |  6 +++---
 meta-oe/recipes-support/libee/libee.inc                |  2 +-
 .../libmicrohttpd/libmicrohttpd_0.9.34.bb              |  2 +-
 meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb  |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc                  |  4 ++--
 meta-oe/recipes-support/openct/openct_0.6.20.bb        |  4 ++--
 meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb     |  4 ++--
 meta-oe/recipes-support/postgresql/postgresql.inc      |  2 +-
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc        |  6 +++---
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb        |  2 +-
 meta-oe/recipes-support/udisks/udisks_1.0.5.bb         |  2 +-
 meta-oe/recipes-support/vim/vim_7.4.769.bb             |  4 ++--
 46 files changed, 89 insertions(+), 89 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index b7cc416..015d446 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -37,7 +37,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 #The CUSTOM_LDSCRIPTS doesn't work with the gold linker
 do_configure() {
-    if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
       sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile
     fi
 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 24cd0b0..5459bf9 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -46,7 +46,7 @@ do_install () {
 
     echo "d root root 0755 ${localstatedir}/run/${BPN} none" \
            > ${D}${sysconfdir}/default/volatiles/99_lmbench
-    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /run/${BPN} - - - -" \
               > ${D}${sysconfdir}/tmpfiles.d/lmbench.conf
diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index acae868..cfd794d 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2"
 DEPENDS = "glib-2.0"
 X11DEPENDS = " libxpm gtk+"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 PACKAGECONFIG[libical] = "--enable-libical,--disable-libical,libical"
 PACKAGECONFIG[pcsc-lite] = "--enable-libpcsclite,--disable-libpcsclite,pcsc-lite"
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
index 34c2969..1165b11 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
@@ -85,7 +85,7 @@ do_install_append() {
     mkdir -p ${D}/${sysconfdir}/default/volatiles
     echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
            > ${D}${sysconfdir}/default/volatiles/87_krb5
-    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /run/krb5kdc - - - -" \
               > ${D}${sysconfdir}/tmpfiles.d/krb5.conf
diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index 857895b..b5df8e0 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -39,7 +39,7 @@ inherit autotools pkgconfig lib_package
 EXTRA_OECONF += "--disable-rpath"
 
 PACKAGECONFIG ?= "\
-    ${@base_contains('DISTRO_FEATURES', 'largefile$', 'largefile', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile$', 'largefile', '', d)} \
 "
 PACKAGECONFIG[doxygen] = "--enable-doxygen,--disable-doxygen"
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile"
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
index e55c377..c2c4eae 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
@@ -60,7 +60,7 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/zabbix-agent.service ${D}${systemd_unitdir}/system/
         sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/zabbix-agent.service
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 4f2992c..21dd1de 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -42,12 +42,12 @@ RDEPENDS_${PN} = "\
 #
 RRECOMMENDS_${PN} = "\
     ${MACHINE_EXTRA_RRECOMMENDS} \
-    ${@base_contains("MACHINE_FEATURES", "usbhost", "usbutils", "", d)} \
-    ${@base_contains("MACHINE_FEATURES", "alsa", "alsa-utils-alsamixer", "", d)} \
-    ${@base_contains("MACHINE_FEATURES", "usbgadget", "kernel-module-g-ether kernel-module-g-serial kernel-module-g-mass-storage", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "usbhost", "usbutils", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "alsa-utils-alsamixer", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "kernel-module-g-ether kernel-module-g-serial kernel-module-g-mass-storage", "", d)} \
     \
-    ${@base_contains("DISTRO_FEATURES", "bluetooth", "${BLUEZ}", "", d)} \
-    ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "${BLUEZ}", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)} \
     \
     tzdata \
     \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index f50443d..a542ae4 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -24,7 +24,7 @@ RDEPENDS_${PN} = "\
     base-passwd \
     busybox \
     netbase \
-    ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS} \
 "
 
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index d8d037e..bc4e271 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -24,7 +24,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 
diff --git a/meta-oe/recipes-extended/corosync/corosync_2.3.5.bb b/meta-oe/recipes-extended/corosync/corosync_2.3.5.bb
index 08c0893..508277e 100644
--- a/meta-oe/recipes-extended/corosync/corosync_2.3.5.bb
+++ b/meta-oe/recipes-extended/corosync/corosync_2.3.5.bb
@@ -41,7 +41,7 @@ do_install_append() {
     install -m 0644 ${S}/init/corosync.in ${D}${sysconfdir}/init.d/corosync
     install -m 0644 ${S}/init/corosync-notifyd.in ${D}${sysconfdir}/init.d/corosync-notifyd
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${S}/init/corosync.service.in ${D}${systemd_unitdir}/system/corosync.service
         install -m 0644 ${S}/init/corosync-notifyd.service.in ${D}${systemd_unitdir}/system/corosync-notifyd.service
diff --git a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
index 560630c..ff37305 100644
--- a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
+++ b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
@@ -37,7 +37,7 @@ do_install_append (){
     install -m 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
 
     # install systemd unit files
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${S}/init/dlm.service ${D}${systemd_unitdir}/system
     fi
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
index 2582a77..9b2ace9 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
@@ -16,7 +16,7 @@ SRCREV = "460e6421c16a8216d29ccd1b7490f814dab8b769"
 S = "${WORKDIR}/git"
 
 inherit native cmake
-LDFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 EXTRA_OECMAKE = "-DWITH_PYTHON=ON \
                  ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb
index 4761ef7..f57e9df 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb
@@ -7,7 +7,7 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG[g15] = ",,libg15 g15daemon libg15render,"
 PACKAGECONFIG[hid] = "--enable-libhid,--disable-libhid,libhid"
 
-LCD_DRIVERS_append = "${@base_contains('PACKAGECONFIG', 'g15', '', ',!g15', d)}"
+LCD_DRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'g15', '', ',!g15', d)}"
 
 do_install_append () {
     # binaries
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb b/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
index f74fb77..6048888 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
@@ -17,7 +17,7 @@ SRC_URI[md5sum] = "5904f23cf494946237cfbbdbe644a3cd"
 SRC_URI[sha256sum] = "e2b2fbeaec45a83905d0da3b87da83904d9cd94c1b86312f844587b3fff11f56"
 
 inherit cmake
-LDFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 EXTRA_OECMAKE = " \
                  -DWITH-DEVASSISTANT=OFF \
                  -DWITH-JOURNALD=OFF \
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
index bdb7ced..52b271c 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
@@ -29,7 +29,7 @@ inherit systemd cmake pkgconfig pythonnative perlnative
 SYSTEMD_SERVICE_${PN} = "openwsmand.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-LDFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', " -fuse-ld=bfd ", '', d)}"
+LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', " -fuse-ld=bfd ", '', d)}"
 
 EXTRA_OECMAKE = "-DBUILD_BINDINGS=NO \
                  -DBUILD_LIBCIM=NO \
@@ -50,7 +50,7 @@ do_install_append() {
     install -m 755 ${B}/etc/init/openwsmand.sh ${D}/${sysconfdir}/init.d/openwsmand
     ln -sf ${sysconfdir}/init.d/openwsmand ${D}/${sbindir}/rcopenwsmand
     chmod 755 ${D}/${sysconfdir}/openwsman/owsmangencert.sh
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}/${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/openwsmand.service ${D}/${systemd_unitdir}/system
 
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
index aab4f54..fdd198a 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
@@ -9,8 +9,8 @@ DEPENDS = "expat glib-2.0 intltool-native mozjs"
 
 inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection
 
-PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                 ${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                 ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
 
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
 PACKAGECONFIG[systemd] = "--enable-libsystemd-login=yes --with-systemdsystemunitdir=${systemd_unitdir}/system/,--enable-libsystemd-login=no --with-systemdsystemunitdir=,systemd"
@@ -20,7 +20,7 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            file://0001-make-netgroup-support-configurable.patch \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
 "
 SRC_URI[md5sum] = "4b77776c9e4f897dcfe03b2c34198edf"
 SRC_URI[sha256sum] = "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81"
diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
index 8cc4aaa..a112168 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -38,13 +38,13 @@ do_install() {
     install -m 644 rarpd.8 ${D}${mandir}/man8/rarpd.8
     install -m 644 ${WORKDIR}/ethers.sample ${D}${sysconfdir}/ethers
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/rarpd.service ${D}${systemd_unitdir}/system/
     fi
 }
 
-inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','',d)}
+inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','',d)}
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "rarpd.service"
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
index 0f6b6cf..c1d923c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
@@ -41,9 +41,9 @@ EXTRA_OECONF += "--enable-cached-man-pages"
 PACKAGECONFIG ??= " \
     zlib rsyslogd rsyslogrt klog inet regexp uuid libgcrypt \
     imdiag gnutls imfile \
-    ${@base_contains('DISTRO_FEATURES', 'snmp', 'snmp', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'ptest', 'testbench ${VALGRIND}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'snmp', 'snmp', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench ${VALGRIND}', '', d)} \
 "
 
 # default yes in configure
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index efd4295..ed5382e 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -25,13 +25,13 @@ SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
 inherit autotools
-inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "sblim-sfcb.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
-LDFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 EXTRA_OECONF = '--enable-debug \
                 --enable-ssl \
@@ -50,7 +50,7 @@ do_install() {
 
     oe_runmake DESTDIR=${D} install
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/sfcb.service ${D}${systemd_unitdir}/system/sblim-sfcb.service
     fi
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
index 4e51876..86e6d9e 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
            file://smartd.service \
           "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'libcap-ng', 'libcap-ng', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'libcap-ng', 'libcap-ng', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                   "
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index 8a4c083..8d3da69 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -31,25 +31,25 @@ do_compile() {
 
     # Be sure to respect preferences (force to "no")
     # Also avoid issues when ${BUILD_ARCH} == ${HOST_ARCH}
-    if [ -z "${@base_contains('PACKAGECONFIG', 'curl', 'curl', '', d)}" ]; then
+    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'curl', 'curl', '', d)}" ]; then
         sed -i -e '/^HAVE_LIBCURL/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@base_contains('PACKAGECONFIG', 'gif', 'gif', '', d)}" ]; then
+    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'gif', 'gif', '', d)}" ]; then
         sed -i -e '/^HAVE_LIBGIF/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@base_contains('PACKAGECONFIG', 'png', 'png', '', d)}" ]; then
+    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'png', 'png', '', d)}" ]; then
         sed -i -e '/^HAVE_LIBPNG/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@base_contains('PACKAGECONFIG', 'tiff', 'tiff', '', d)}" ]; then
+    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'tiff', 'tiff', '', d)}" ]; then
         sed -i -e '/^HAVE_LIBTIFF/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@base_contains('PACKAGECONFIG', 'motif', 'motif', '', d)}" ]; then
+    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'motif', 'motif', '', d)}" ]; then
         sed -i -e '/^HAVE_MOTIF/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@base_contains('PACKAGECONFIG', 'webp', 'webp', '', d)}" ]; then
+    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'webp', 'webp', '', d)}" ]; then
         sed -i -e '/^HAVE_LIBWEBP/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@base_contains('PACKAGECONFIG', 'lirc', 'lirc', '', d)}" ]; then
+    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'lirc', 'lirc', '', d)}" ]; then
         sed -i -e '/^HAVE_LIBLIRC/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
 
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
index a647911..29ed4d9 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff lcms gegl poppler jasper bzip2 libgudev"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
 inherit gnome gtk-doc
 
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index 2277092..407129d 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.xz \
     file://lxdm.conf \
-    ${@base_contains('DISTRO_FEATURES', 'pam', 'file://lxdm-pam file://lxdm-pam-debug', '', d)} \
-    ${@base_contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://lxdm-pam file://lxdm-pam-debug', '', d)} \
+    ${@bb.utils.contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
     file://0002-let-autotools-create-lxdm.conf.patch \
 "
 SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
@@ -15,10 +15,10 @@ SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93
 PE = "1"
 
 DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes"
-DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
+DEPENDS += "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
 
 # combine oe-core way with angstrom DISTRO_TYPE
-DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
+DISTRO_TYPE ?= "${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
 inherit autotools pkgconfig gettext systemd distro_features_check
 # depends on virtual/libx11
@@ -27,8 +27,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
 
 EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb \
-    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
 "
 
 do_configure_prepend() {
@@ -48,11 +48,11 @@ do_compile_append() {
 do_install_append() {
     install -d ${D}${localstatedir}/lib/lxdm
     install -m 644 ${WORKDIR}/lxdm.conf ${D}${localstatedir}/lib/lxdm
-    if ${@base_contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
         # ArchLinux version of pam config has the following advantages:
         # * simple setup of passwordless login
         # * in XFCE powerdown/restart enabled in logoff dialog
-        install -m 644 ${WORKDIR}/${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)} ${D}${sysconfdir}/pam.d/lxdm
+        install -m 644 ${WORKDIR}/${@bb.utils.contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)} ${D}${sysconfdir}/pam.d/lxdm
     fi
 }
 
@@ -70,7 +70,7 @@ done
 sed -i "s:last_langs=.*$:last_langs=$langs:g" $D${localstatedir}/lib/lxdm/lxdm.conf
 }
 
-RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-loginuid', '', d)} setxkbmap bash librsvg-gtk"
+RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-loginuid', '', d)} setxkbmap bash librsvg-gtk"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
diff --git a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
index 1ae8dbb..71359e0 100644
--- a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
+++ b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 PR = "r1"
 
-DEPENDS = "virtual/libx11 libxmu libpng jpeg freetype sessreg ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "virtual/libx11 libxmu libpng jpeg freetype sessreg ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = " \
     http://download.berlios.de/${BPN}/${BP}.tar.gz \
@@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "f1560125005f253b9b88220598fed7a9575ef405716862c6ca3fcc72db
 
 
 EXTRA_OEMAKE += " \
-    USE_PAM=${@base_contains('DISTRO_FEATURES', 'pam', '1', '0', d)} \
+    USE_PAM=${@bb.utils.contains('DISTRO_FEATURES', 'pam', '1', '0', d)} \
     PREFIX=${prefix} \
     CFGDIR=${sysconfdir} \
     MANDIR=${mandir} \
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
index 337cde4..e5bea97 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
@@ -16,11 +16,11 @@ SRC_URI[sha256sum] = "f6f4876a4dabe6a37c270c20bb9e141e38fb50e0bba200e1b9d0470e5e
 
 inherit allarch fontcache
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = ""
 
 # Don't use font cache mecanism for console packages
-FONT_PACKAGES = "${@base_contains('PACKAGECONFIG', 'x11', '${PN}-pcf', '', d)}"
+FONT_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '${PN}-pcf', '', d)}"
 
 # Hand made configure script. Don't need oe_runconf
 do_configure() {
@@ -32,11 +32,11 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake DESTDIR=${D} psf txt ${@base_contains('PACKAGECONFIG', 'x11', 'pcf', '', d)}
+    oe_runmake DESTDIR=${D} psf txt ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'pcf', '', d)}
 }
 
 do_install() {
-    oe_runmake DESTDIR=${D} install-psf install-acm ${@base_contains('PACKAGECONFIG', 'x11', 'install-pcf', '', d)}
+    oe_runmake DESTDIR=${D} install-psf install-acm ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'install-pcf', '', d)}
 }
 
 PACKAGES += "${PN}-consolefonts ${PN}-consoletrans ${PN}-pcf"
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index b29d075..95a07d1 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -24,7 +24,7 @@ do_install() {
 
     install -d ${D}${sysconfdir}/default
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
         install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
diff --git a/meta-oe/recipes-kernel/ktap/ktap.inc b/meta-oe/recipes-kernel/ktap/ktap.inc
index e2e498f..c214a02 100644
--- a/meta-oe/recipes-kernel/ktap/ktap.inc
+++ b/meta-oe/recipes-kernel/ktap/ktap.inc
@@ -21,6 +21,6 @@ PACKAGECONFIG[libelf] = ",,elfutils"
 PACKAGECONFIG ?= "libelf"
 
 EXTRA_OEMAKE = " \
-    ${@base_contains('PACKAGECONFIG', 'libelf', '', 'NO_LIBELF=1', d)} \
-    ${@base_contains('PACKAGECONFIG', 'ffi', 'FFI=1', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'libelf', '', 'NO_LIBELF=1', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'ffi', 'FFI=1', '', d)} \
 "
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 191d4b9..145497a 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -14,7 +14,7 @@ RCONFLICTS_${PN} = "mplayer"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 # because it depends on libpostproc/libav which has commercial flag
-LICENSE_FLAGS = "${@base_contains('PACKAGECONFIG', 'postproc', 'commercial', '', d)}"
+LICENSE_FLAGS = "${@bb.utils.contains('PACKAGECONFIG', 'postproc', 'commercial', '', d)}"
 
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
index a5c802c..75a42a2 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
 PROVIDES = "libv4l media-ctl"
 
 DEPENDS = "jpeg \
-           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 
 inherit autotools gettext pkgconfig
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index a300595..aef9b13 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -30,12 +30,12 @@ inherit scons update-rc.d python-dir pythonnative systemd bluetooth
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
 
-SYSTEMD_OESCONS = "${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false',d)}"
+SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',d)}"
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
 PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
 EXTRA_OESCONS = " \
diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index e706b18..ffb5c50 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -18,7 +18,7 @@ X11DEPENDS = " \
 
 EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x-toolkit=gtk,--without-x --without-dbus,${X11DEPENDS}"
 
 
@@ -86,7 +86,7 @@ do_compile_prepend() {
     ${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \
     ${STAGING_DIR_TARGET}/${base_libdir}/libpthread* $treedir/${base_libdir}/
 
-    if [ ! -z "${@base_contains('PACKAGECONFIG', 'x11', 'x11', '', d)}" ] ; then
+    if [ ! -z "${@bb.utils.contains('PACKAGECONFIG', 'x11', 'x11', '', d)}" ] ; then
         echo "X11 build enabled"
         # copy only as much stuff as we need
         # before: 5.5G   ../../qemu-treedir/
diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/recipes-support/espeak/espeak_1.37.bb
index cf05d26..273fe34 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.37.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.37.bb
@@ -1,7 +1,7 @@
 require espeak.inc
 inherit siteinfo
 
-EXTRA_PHONEMES = '${@base_contains("SITEINFO_ENDIANNESS", "be",  "espeak-data (= ${PV})", "", d)}'
+EXTRA_PHONEMES = '${@bb.utils.contains("SITEINFO_ENDIANNESS", "be",  "espeak-data (= ${PV})", "", d)}'
 RDEPENDS_${PN} = "portaudio-v19 ${EXTRA_PHONEMES}"
 
 SRC_URI[md5sum] = "5c7b292d0537232868b4ac1317d76c02"
diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
index 7a4fbac..4a65986 100644
--- a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
@@ -4,7 +4,7 @@ require fftw.inc
 EXCLUDE_FROM_WORLD = "1"
 
 EXTRA_OECONF += "--enable-single \
-    ${@base_contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)} \
 "
 
 SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
diff --git a/meta-oe/recipes-support/gradm/gradm_3.1.bb b/meta-oe/recipes-support/gradm/gradm_3.1.bb
index fe36fba..252b19d 100644
--- a/meta-oe/recipes-support/gradm/gradm_3.1.bb
+++ b/meta-oe/recipes-support/gradm/gradm_3.1.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://grsecurity.net/index.php"
 SECTION = "admin"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4641e94ec96f98fabc56ff9cc48be14b"
-DEPENDS = "flex-native bison-native ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "flex-native bison-native ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://grsecurity.net/stable/${BP}-201507191652.tar.gz \
            file://0001-Makefile-remove-strip.patch"
@@ -26,7 +26,7 @@ do_compile() {
                'LLEX=${STAGING_BINDIR_NATIVE}/lex'      \
                'FLEX=${STAGING_BINDIR_NATIVE}/flex'     \
                'BISON=${STAGING_BINDIR_NATIVE}/bison'   \
-               ${@base_contains('DISTRO_FEATURES', 'pam', ' ', 'nopam', d)}
+               ${@bb.utils.contains('DISTRO_FEATURES', 'pam', ' ', 'nopam', d)}
 }
 
 do_install() {
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
index 26638c3..f473775 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
@@ -22,9 +22,9 @@ EXTRA_OECONF = "\
     --disable-lynx \
 "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','alsa','alsa','',d)} \
-                   ${@base_contains('DISTRO_FEATURES','pulseaudio','pulseaudio','',d)} \
-                   ${@base_contains('DISTRO_FEATURES','x11','gtk gtk3','',d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','alsa','alsa','',d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES','pulseaudio','pulseaudio','',d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES','x11','gtk gtk3','',d)} \
 "
 PACKAGECONFIG[alsa] = "--enable-alsa, --disable-alsa, alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse, --disable-pulse, pulseaudio"
diff --git a/meta-oe/recipes-support/libee/libee.inc b/meta-oe/recipes-support/libee/libee.inc
index 5b552ca..256fa05 100644
--- a/meta-oe/recipes-support/libee/libee.inc
+++ b/meta-oe/recipes-support/libee/libee.inc
@@ -18,7 +18,7 @@ inherit autotools ptest pkgconfig
 
 DEPENDS += "libestr"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'ptest', 'testbench', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench', '', d)}"
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
 PACKAGECONFIG[testbench] = "--enable-testbench,--disable-testbench,,"
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
index e3c833b..a4a0f38 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
@@ -16,7 +16,7 @@ EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../ --disable-
 
 PACKAGECONFIG ?= "curl"
 PACKAGECONFIG_append_class-target = "\
-        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
 "
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index 62ea131..857a57b 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -55,7 +55,7 @@ do_install() {
     install -m 0755 ${WORKDIR}/sensord.init ${D}${sysconfdir}/init.d/sensord
 
     # Insall sensord service script
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${S}/prog/init/*.service ${D}${systemd_unitdir}/system
     fi
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index a8d44da..3a5e1c4 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -17,7 +17,7 @@ S = "${WORKDIR}/LVM2.${PV}"
 
 inherit autotools-brokensep pkgconfig systemd
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
@@ -43,7 +43,7 @@ do_install_append() {
     # Install machine specific configuration file
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
     sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         oe_runmake 'DESTDIR=${D}' install install_systemd_units
         sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_system_unitdir}/blk-availability.service
     else
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 3197845..bf1ff57 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
 SYSTEMD_SERVICE_${PN} += "openct.service "
 SYSTEMD_AUTO_ENABLE = "enable"
 
@@ -73,7 +73,7 @@ do_install () {
     install -Dpm 755 ${WORKDIR}/openct.init ${D}/etc/init.d/openct
     install -Dpm 644 ${WORKDIR}/openct.sysconfig ${D}/etc/sysconfig/openct
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}/${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/openct.service ${D}/${systemd_unitdir}/system
     fi
diff --git a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
index 1b18632..ed8ef26 100644
--- a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
+++ b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
@@ -64,7 +64,7 @@ do_install() {
     
     # fix up hardcoded paths
     sed -i -e 's,/usr/sbin/,${sbindir}/,' ${WORKDIR}/owcimomd.service
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}/${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/owcimomd.service ${D}/${systemd_unitdir}/system
         install -m 755 ${WORKDIR}/checkserverkey ${D}${sysconfdir}/openwbem/
@@ -93,7 +93,7 @@ do_install() {
     touch ${D}/var/lib/openwbem/{classassociation,instances,instassociation,namespaces,schema}.{dat,ndx,lock}
 }
 
-inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
 SYSTEMD_SERVICE_${PN} = "owcimomd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 FILES_${PN} += " \
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 806c638..288a2d1 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -55,7 +55,7 @@ pkg_postinst_${PN} () {
     fi
 }
 
-enable_pam = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+enable_pam = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index ed41f01..382dc5e 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -41,8 +41,8 @@ CONFIG_TLS = "--enable-thread-tls"
 CONFIG_TLS_arm = "${@base_conditional( "DEBUG_BUILD", "1", " --disable-thread-tls", " --enable-thread-tls", d )}"
 
 PACKAGECONFIG ??= "openssl \
-    ${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
 "
 PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl,openssl,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
@@ -57,7 +57,7 @@ PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wra
 PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
 
 do_configure_prepend() {
-    eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
+    eval "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
 }
 
 do_install_append() {
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
index 72db886..f365cfa 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
 
 DEPENDS = "acl libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 RDEPENDS_${PN} = "acl"
 
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index 8ddc20d..eec6933 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 DEPENDS = "libatasmart sg3-utils polkit libgudev dbus-glib glib-2.0 intltool-native lvm2"
 # optional dependencies: device-mapper parted
 
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 SRC_URI = " \
     http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
diff --git a/meta-oe/recipes-support/vim/vim_7.4.769.bb b/meta-oe/recipes-support/vim/vim_7.4.769.bb
index c257d90..08e5027 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.769.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.769.bb
@@ -32,8 +32,8 @@ do_configure () {
 
 #Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
 PACKAGECONFIG ??= ""
-PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
-PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 
 PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-- 
2.8.0.rc3


