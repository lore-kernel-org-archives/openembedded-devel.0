Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygh-0001yw-Ha
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:26 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so7278016dae.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=zalRrUyD5A1nMuZqufoQEGBlsTYXaEzq5VlLSdnC3mA=;
	b=j7f6TM2E2oZ4eT7nZMCJJxMYg04IPLz5GnX1agKGL3Mkdb9oEEYzKdI37RU4Fr/H0l
	bx4PpYrE8g81cCaizK4myeCr8NgGybp0vLtgeCxjOp3yuf/zJZRep5SH5qfT2GS4KzRm
	4M0Cu3e/Jf+1qgYBbnJsqXH4UF1h2v48g2AV9hWGmE/ga2zb4t5cOLS1K63fbOd8NYp3
	npyTjrDMxIrck0tkw2ByGe+fbCgdrlb6eLXxheQBf2NdC2FUztqpI4krKVViv/jMWKPW
	qereae77K2a6f8Vu3N0M2Mj9pi3DKXX3zaQd5rJRVQ0R5D7pNFOeF92/aN3Xy9+gpaTi
	jg3g==
X-Received: by 10.68.232.200 with SMTP id tq8mr158680074pbc.52.1357272014332; 
	Thu, 03 Jan 2013 20:00:14 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:23 -0800
Message-Id: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH 01/13] systemd: Fix build when base_libdir is not /lib
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
X-List-Received-Date: Fri, 04 Jan 2013 04:15:40 -0000
X-List-Received-Date: Fri, 04 Jan 2013 04:15:40 -0000
X-List-Received-Date: Fri, 04 Jan 2013 04:15:40 -0000
X-List-Received-Date: Fri, 04 Jan 2013 04:15:40 -0000

we were carrying a wrong patch to fix rootlibdir
to adapt systemd to OE's notion of base_libdir
but thats not right and the units dont get initialised
properly when we have base_libdir which is not /lib

This patch fixes the use of base_libdir where
it should have been catering to notions of systemd/udev
for putting unit files and init scripts in /lib
and not in base_libdir

It also ignores the lib32-* packages so that systemd
build works for multilib enabled systems.

Adapt to nativesdk renaming

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/systemd.bbclass             |    7 +-
 meta-systemd/recipes-core/systemd/systemd_git.bb |   76 ++++++++++++----------
 2 files changed, 44 insertions(+), 39 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index f26c6d1..9582492 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -70,7 +70,8 @@ def systemd_after_parse(d):
     bpn = d.getVar('BPN', 1)
     if bpn + "-native" != d.getVar('PN', 1) and \
             bpn + "-cross" != d.getVar('PN', 1) and \
-            bpn + "-nativesdk" != d.getVar('PN', 1):
+            not d.getVar('MLPREFIX', 1) and \
+            "nativesdk-" + bpn != d.getVar('PN', 1):
         systemd_check_vars()
         for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
             systemd_create_package(pkg_systemd)
@@ -158,8 +159,8 @@ python populate_packages_prepend () {
     def systemd_check_services():
         base_libdir = d.getVar('base_libdir', 1)
         searchpaths = '/etc/systemd/system/' + ' '
-        searchpaths += d.getVar('base_libdir', 1) + '/systemd/system/' + ' '
-        searchpaths += d.getVar('libdir', 1) + '/systemd/system/' + ' '
+        searchpaths += '/lib/systemd/system/' + ' '
+        searchpaths += '/usr/lib/systemd/system/' + ' '
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
         has_exactly_one_service = len(systemd_packages.split()) == 1
         if has_exactly_one_service:
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 7fa7ac6..fc2b2a0 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -90,6 +90,7 @@ do_configure_prepend() {
 
 do_install() {
 	autotools_do_install
+	install -d ${D}${base_sbindir}
 	# provided by a seperate recipe
 	rm ${D}${systemd_unitdir}/system/serial-getty* -f
 
@@ -98,7 +99,10 @@ do_install() {
 
 	# create dir for journal
 	install -d ${D}${localstatedir}/log/journal
-
+	# udevd is needed in initramfs which was provided by udev in OE-Core
+	# so we need to provide that otherwise it pulls in both systemd and
+	# udev
+	ln -s ${systemd_unitdir}/systemd-udevd ${D}/${base_sbindir}/udevd
 	# create machine-id
 	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
 	touch ${D}${sysconfdir}/machine-id
@@ -159,24 +163,24 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/init.d/README \
                 ${systemd_unitdir}/* \
                 ${systemd_unitdir}/system/* \
-                ${base_libdir}/udev/rules.d/99-systemd.rules \
+                /lib/udev/rules.d/99-systemd.rules \
                 ${base_libdir}/security/*.so \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/localectl \
                 ${bindir}/hostnamectl \
                 ${bindir}/timedatectl \
-                ${libdir}/tmpfiles.d/*.conf \
-                ${libdir}/systemd \
-                ${libdir}/binfmt.d \
-                ${libdir}/modules-load.d \
-                ${libdir}/sysctl.d \
+                ${exec_prefix}/lib/tmpfiles.d/*.conf \
+                ${exec_prefix}/lib/systemd \
+                ${exec_prefix}/lib/binfmt.d \
+                ${exec_prefix}/lib/modules-load.d \
+                ${exec_prefix}/lib/sysctl.d \
                 ${localstatedir} \
                 ${libexecdir} \
-                ${base_libdir}/udev/rules.d/70-uaccess.rules \
-                ${base_libdir}/udev/rules.d/71-seat.rules \
-                ${base_libdir}/udev/rules.d/73-seat-late.rules \
-                ${base_libdir}/udev/rules.d/99-systemd.rules \
+                /lib/udev/rules.d/70-uaccess.rules \
+                /lib/udev/rules.d/71-seat.rules \
+                /lib/udev/rules.d/73-seat-late.rules \
+                /lib/udev/rules.d/99-systemd.rules \
                "
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd ${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
@@ -200,42 +204,42 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
 
 PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
 
-FILES_udev-dbg += "${base_libdir}/udev/.debug"
+FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
 
-FILES_udev += "${base_libdir}/udev/udevd \
-               ${base_libdir}/systemd/systemd-udevd \
-               ${base_libdir}/udev/accelerometer \
-               ${base_libdir}/udev/ata_id \
-               ${base_libdir}/udev/cdrom_id \
-               ${base_libdir}/udev/collect \
-               ${base_libdir}/udev/findkeyboards \
-               ${base_libdir}/udev/keyboard-force-release.sh \
-               ${base_libdir}/udev/keymap \
-               ${base_libdir}/udev/mtd_probe \
-               ${base_libdir}/udev/scsi_id \
-               ${base_libdir}/udev/v4l_id \
-               ${base_libdir}/udev/keymaps \
-               ${base_libdir}/udev/rules.d/4*.rules \
-               ${base_libdir}/udev/rules.d/5*.rules \
-               ${base_libdir}/udev/rules.d/6*.rules \
-               ${base_libdir}/udev/rules.d/70-power-switch.rules \
-               ${base_libdir}/udev/rules.d/75*.rules \
-               ${base_libdir}/udev/rules.d/78*.rules \
-               ${base_libdir}/udev/rules.d/8*.rules \
-               ${base_libdir}/udev/rules.d/95*.rules \
-               ${base_libdir}/udev/hwdb.d \
+FILES_udev += "/lib/udev/udevd \
+               /lib/systemd/systemd-udevd \
+               /lib/udev/accelerometer \
+               /lib/udev/ata_id \
+               /lib/udev/cdrom_id \
+               /lib/udev/collect \
+               /lib/udev/findkeyboards \
+               /lib/udev/keyboard-force-release.sh \
+               /lib/udev/keymap \
+               /lib/udev/mtd_probe \
+               /lib/udev/scsi_id \
+               /lib/udev/v4l_id \
+               /lib/udev/keymaps \
+               /lib/udev/rules.d/4*.rules \
+               /lib/udev/rules.d/5*.rules \
+               /lib/udev/rules.d/6*.rules \
+               /lib/udev/rules.d/70-power-switch.rules \
+               /lib/udev/rules.d/75*.rules \
+               /lib/udev/rules.d/78*.rules \
+               /lib/udev/rules.d/8*.rules \
+               /lib/udev/rules.d/95*.rules \
+               /lib/udev/hwdb.d \
                ${sysconfdir}/udev \
               "
 
-FILES_udev-consolekit += "${libdir}/ConsoleKit"
+FILES_udev-consolekit += "/lib/ConsoleKit"
 RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 
 FILES_udev-utils = "${bindir}/udevadm"
 
-FILES_udev-systemd = "${base_libdir}/systemd/system/*udev* ${base_libdir}/systemd/system/*.wants/*udev*"
+FILES_udev-systemd = "${systemd_unitdir}/system/*udev* ${systemd_unitdir}/system/*.wants/*udev*"
 RDEPENDS_udev-systemd = "udev"
 
 # TODO:
-- 
1.7.9.5



