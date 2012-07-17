Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sr2Ra-0001dN-IM
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 09:43:42 +0200
Received: by eaal1 with SMTP id l1so24371eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 00:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=EfxDmkUdyCP6F7xnaAc/bFOUjPJ+BKn2Z+bSpS7B9yA=;
	b=NTknEv5J5vb3/lIOxehOMTmeVhN0j1h/PnrnEyO+WwYFb+F74l+iHcnnOWHmSnXzYL
	P+XKe0IYuC6k0WF1PxIwAxDMLJn0BR2z4od9ZLYUdVvHoqQrE43scx+dhKiwsbq5AaDe
	q+L5bWmVAwtUhmwJFoBQ+s5PL1IQx0TI31mEBToPjatet/ix15KiPs1QN3TPJ34tBY9x
	MF2pFsI2f2gI/EtL1Z8s/wv6s1gEKILfohBPRPLlLS5jrpPv52agy2m3gPwc+z5W75hW
	AmgNbU+ohNIGCH2TylGdmpLDs6AgpSbKE92I+qfLsjCPHB6ZkOR5UaFPsohjIjASUFNK
	JBiA==
Received: by 10.14.177.73 with SMTP id c49mr1551554eem.20.1342510343429;
	Tue, 17 Jul 2012 00:32:23 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id d7sm25025748eep.1.2012.07.17.00.32.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 00:32:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 09:32:12 +0200
Message-Id: <1342510333-32367-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmLkHvAvZdfR4Dc+duqo0XYxrJcI2cJv0L5fcYGezk5BtZMDCWg1LfGNwG7EI6ridQYQEqL
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][meta-oe][meta-systemd][PATCH v2 1/2] systemd: update to 186+git
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
X-List-Received-Date: Tue, 17 Jul 2012 07:43:42 -0000

This is a combined udev+systemd recipe: it will build both udev and systemd in one go, but keep the old (sub)package layout:

	udev
	udev-utils
	udev-systemd
	systemd
	systemd-vconsole-setup
	systemd-analyze
	systemd-initramfs

And all libraries are seperated out:

	libgudev-1.0-0
	libsystemd-daemon0
	libsystemd-id128-0
	libsystemd-journal0
	libsystemd-login0
	libudev1

The SRCREV is 94 patches ahead of the v186 tag to drag in compile fixes for 'old' gcc versions like 4.5.x.

Runtime tested with build from scratch and opkg upgrade with angstrom

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb |   93 ++++++++++++++++++----
 1 file changed, 79 insertions(+), 14 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index f4ca72a..8af1aa5 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -1,9 +1,14 @@
 DESCRIPTION = "Systemd a init replacement"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline udev dbus libcap libcgroup tcp-wrappers"
+LICENSE = "GPLv2 & LGPLv2.1 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://LICENSE.LGPL2.1;md5=fb919cc88dbe06ec0b0bd50e001ccf1f \
+                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
+
+PROVIDES = "udev"
+
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -14,20 +19,17 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r27"
+PR = "r0"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-SRCREV = "3eff4208ffecedd778fec260f0d4b18e94dab443"
+SRCREV = "cd96b3b86abb4a88cac2722bdfb6e5d4413f6831"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           ${UCLIBCPATCHES} \
+           file://gtk-doc.make \
+           file://touchscreen.rules \
+           file://modprobe.rules \
           "
-UCLIBCPATCHES = ""
-UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
-                             file://format-replace-m-uclibc.patch \
-                            "
-
 LDFLAGS_libc-uclibc_append = " -lrt"
 
 S = "${WORKDIR}/git"
@@ -39,17 +41,27 @@ SYSTEMDDISTRO_angstrom = "angstrom"
 EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --with-rootprefix=${base_prefix} \
                  --with-rootlibdir=${base_libdir} \
+                 --sbindir=${base_sbindir} \
+                 --libexecdir=${base_libdir} \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
-                 --disable-gtk \
                  --enable-xz \
                  --disable-manpages \
                  --disable-coredump \
+                 --disable-introspection \
+                 --with-pci-ids-path=/usr/share/misc \
+                 ac_cv_file__usr_share_pci_ids=no \
+                 ac_cv_file__usr_share_hwdata_pci_ids=no \
+                 ac_cv_file__usr_share_misc_pci_ids=yes \
+                 --disable-gtk-doc-html \ 
+                 --disable-tcpwrap \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
 do_configure_prepend() {
 	sed -i /xsltproc/d configure.ac
 
+	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
+
 	# we only have /home/root, not /root
 	sed -i -e 's:=/root:=/home/root:g' units/*.service*
 }
@@ -68,6 +80,8 @@ do_install() {
 	# create machine-id
 	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
 	touch ${D}${sysconfdir}/machine-id
+
+	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 }
 
 python populate_packages_prepend (){
@@ -100,10 +114,18 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/system-services \
                 ${datadir}/polkit-1 \
                 ${datadir}/${PN} \
-                ${sysconfdir} \
+                ${sysconfdir}/bash_completion.d/ \
+                ${sysconfdir}/binfmt.d/ \
+                ${sysconfdir}/dbus-1/ \
+                ${sysconfdir}/machine-id \
+                ${sysconfdir}/modules-load.d/ \
+                ${sysconfdir}/sysctl.d/ \
+                ${sysconfdir}/systemd/ \
+                ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/xdg/ \
                 ${systemd_unitdir}/* \
                 ${systemd_unitdir}/system/* \
-                ${base_libdir}/udev/rules.d \
+                ${base_libdir}/udev/rules.d/99-systemd.rules \
                 ${base_libdir}/security/*.so \
                 /cgroup \
                 ${bindir}/systemd* \
@@ -114,6 +136,10 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${libdir}/sysctl.d \
                 ${localstatedir} \
                 ${libexecdir} \
+                ${base_libdir}/udev/rules.d/70-uaccess.rules \
+                ${base_libdir}/udev/rules.d/71-seat.rules \
+                ${base_libdir}/udev/rules.d/73-seat-late.rules \
+                ${base_libdir}/udev/rules.d/99-systemd.rules \
                "
 
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
@@ -136,6 +162,45 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
+
+FILES_udev-dbg += "${base_libdir}/udev/.debug"
+
+RDEPENDS_udev += "udev-utils"
+RPROVIDES_udev = "hotplug"
+
+FILES_udev += "${base_libdir}/udev/udevd \
+               ${base_libdir}/systemd/systemd-udevd \
+               ${base_libdir}/udev/accelerometer \
+               ${base_libdir}/udev/ata_id \
+               ${base_libdir}/udev/cdrom_id \
+               ${base_libdir}/udev/collect \
+               ${base_libdir}/udev/findkeyboards \
+               ${base_libdir}/udev/keyboard-force-release.sh \
+               ${base_libdir}/udev/keymap \
+               ${base_libdir}/udev/mtd_probe \
+               ${base_libdir}/udev/scsi_id \
+               ${base_libdir}/udev/v4l_id \
+               ${base_libdir}/udev/keymaps \
+               ${base_libdir}/udev/rules.d/4*.rules \
+               ${base_libdir}/udev/rules.d/5*.rules \
+               ${base_libdir}/udev/rules.d/6*.rules \
+               ${base_libdir}/udev/rules.d/70-power-switch.rules \
+               ${base_libdir}/udev/rules.d/75*.rules \
+               ${base_libdir}/udev/rules.d/78*.rules \
+               ${base_libdir}/udev/rules.d/8*.rules \
+               ${base_libdir}/udev/rules.d/95*.rules \
+               ${sysconfdir}/udev \
+              "
+
+FILES_udev-consolekit += "${libdir}/ConsoleKit"
+RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
+
+FILES_udev-utils = "${bindir}/udevadm"
+
+FILES_udev-systemd = "${base_libdir}/systemd/system/*udev* ${base_libdir}/systemd/system/*.wants/*udev*"
+RDEPENDS_udev-systemd = "udev"
+
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.7.10



