Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwHnY-0001C0-HR
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:08:05 +0200
Received: by pbbrq2 with SMTP id rq2so10617093pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nsDdMkfIx2WUcuYePr+KuudfbRFYJKwBBrtqsWWef6Y=;
	b=x+m6bz6llvpFuNgyM8onQN2jGU+qxABfMMzS74ikGA5srL5B68YUFqCK20t7MAdPuK
	b7e7rLpQIXWntN0CAcXOqhvqdqG6hR9GYA6Rn/XutOZnlUd7Yzo15MmpDFcWGUBxbX43
	rp80YYKAXytw8t4GD2ZdE3nV+lCpVQG5xdr6FOvm3C+90xqUd8Wz8dizG5g5/Ag/PpKI
	EV3bKIBS9xdiDkA4ogR0GqXiLyLlJZNJikES5D9Ws8Dy+rbdK1350s05TLFjVADHdnJ6
	I/6r5vbIZVsltdO7qxlxLMR7TfDYFMNphud8136CSjlDjGmMZRuolV75Op1RTUAsKwIx
	FRWA==
Received: by 10.68.228.193 with SMTP id sk1mr25601423pbc.97.1343760986143;
	Tue, 31 Jul 2012 11:56:26 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id hw6sm798801pbc.73.2012.07.31.11.56.24
	(version=SSLv3 cipher=OTHER); Tue, 31 Jul 2012 11:56:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:56:11 -0700
Message-Id: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Tue, 31 Jul 2012 19:08:05 -0000

Dont inherit vala and gitpkgv not needed anymore

Along with upgrade use the release tarballs instead of git

Fix build for ppc64

Consider /lib64 and /usr/lib64

Some 64bit architectures chose lib64 instead of lib
for default library dirnames. So we dig this from metadata
vars base_libdir and libdir instead of hardcoding 'lib'

ppc64 in OE uses lib64 for default libdir
and this leaves lot of udev/systemd
files unpackaged since 'lib' was hardcoded

Additionally use --split-usr option since
in OE-Core now we want to treat /usr mounted
sepatately.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/systemd.bbclass               |    5 +-
 .../systemd/systemd/use-rootlibdir.patch           |   94 ++++++++
 meta-systemd/recipes-core/systemd/systemd_187.bb   |  220 +++++++++++++++++++
 meta-systemd/recipes-core/systemd/systemd_git.bb   |  224 --------------------
 4 files changed, 318 insertions(+), 225 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
 create mode 100644 meta-systemd/recipes-core/systemd/systemd_187.bb
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd_git.bb

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index dd9f326..4036f91 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -154,7 +154,10 @@ python populate_packages_prepend () {
 
     # check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
+        base_libdir = d.getVar('base_libdir', 1)
+        searchpaths = '/etc/systemd/system/' + ' '
+        searchpaths += d.getVar('base_libdir', 1) + '/systemd/system/' + ' '
+        searchpaths += d.getVar('libdir', 1) + '/systemd/system/' + ' '
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
         has_exactly_one_service = len(systemd_packages.split()) == 1
         if has_exactly_one_service:
diff --git a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch b/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
new file mode 100644
index 0000000..2167216
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
@@ -0,0 +1,94 @@
+Upstream-Status: Undecided
+
+This patch removes some of hardcoded references to /lib
+and /usr/lib since on some architectures it should be
+/lib64 and /usr/lib64 atleast in OE
+
+I am not sure about the intention of hardcoded values
+thats why status is undecided
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am	2012-07-22 16:20:38.424405916 -0700
++++ git/Makefile.am	2012-07-22 16:23:21.232406621 -0700
+@@ -61,23 +61,23 @@
+ 
+ # Our own, non-special dirs
+ pkgsysconfdir=$(sysconfdir)/systemd
+-userunitdir=$(prefix)/lib/systemd/user
+-tmpfilesdir=$(prefix)/lib/tmpfiles.d
+-sysctldir=$(prefix)/lib/sysctl.d
+-usergeneratordir=$(prefix)/lib/systemd/user-generators
++userunitdir=$(prefix)/$(rootlibdir)/systemd/user
++tmpfilesdir=$(prefix)/$(rootlibdir)/tmpfiles.d
++sysctldir=$(prefix)/$(rootlibdir)/sysctl.d
++usergeneratordir=$(prefix)/$(rootlibdir)/systemd/user-generators
+ pkgincludedir=$(includedir)/systemd
+ systemgeneratordir=$(rootlibexecdir)/system-generators
+ systemshutdowndir=$(rootlibexecdir)/system-shutdown
+ systemsleepdir=$(rootlibexecdir)/system-sleep
+-systemunitdir=$(rootprefix)/lib/systemd/system
+-udevlibexecdir=$(rootprefix)/lib/udev
++systemunitdir=$(rootprefix)/$(rootlibdir)/systemd/system
++udevlibexecdir=$(rootprefix)/$(rootlibdir)/udev
+ udevhomedir = $(udevlibexecdir)
+ udevrulesdir = $(udevlibexecdir)/rules.d
+ 
+ # And these are the special ones for /
+ rootprefix=@rootprefix@
+ rootbindir=$(rootprefix)/bin
+-rootlibexecdir=$(rootprefix)/lib/systemd
++rootlibexecdir=$(rootprefix)/$(rootlibdir)/systemd
+ 
+ CLEANFILES =
+ EXTRA_DIST =
+@@ -126,7 +126,7 @@
+ 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=\"$(bindir)/systemd-stdio-bridge\" \
+ 	-DROOTPREFIX=\"$(rootprefix)\" \
+ 	-DRUNTIME_DIR=\"/run\" \
+-	-DRANDOM_SEED=\"$(localstatedir)/lib/random-seed\" \
++	-DRANDOM_SEED=\"$(localstatedir)/$(rootlibdir)/random-seed\" \
+ 	-DSYSTEMD_CRYPTSETUP_PATH=\"$(rootlibexecdir)/systemd-cryptsetup\" \
+ 	-DSYSTEM_GENERATOR_PATH=\"$(systemgeneratordir)\" \
+ 	-DUSER_GENERATOR_PATH=\"$(usergeneratordir)\" \
+@@ -2535,7 +2535,7 @@
+ 
+ binfmt-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+-		$(DESTDIR)$(prefix)/lib/binfmt.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/binfmt.d \
+ 		$(DESTDIR)$(sysconfdir)/binfmt.d \
+ 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
+ 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
+@@ -3165,7 +3165,7 @@
+ logind-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
+-		$(DESTDIR)$(localstatedir)/lib/systemd
++		$(DESTDIR)$(localstatedir)/$(rootlibdir)/systemd
+ 	( cd $(DESTDIR)$(systemunitdir) && \
+ 		rm -f dbus-org.freedesktop.login1.service && \
+ 		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
+@@ -3284,7 +3284,7 @@
+ 		-e 's,@PACKAGE_VERSION\@,$(PACKAGE_VERSION),g' \
+ 		-e 's,@PACKAGE_NAME\@,$(PACKAGE_NAME),g' \
+ 		-e 's,@PACKAGE_URL\@,$(PACKAGE_URL),g' \
+-		-e 's,@RANDOM_SEED\@,$(localstatedir)/lib/random-seed,g' \
++		-e 's,@RANDOM_SEED\@,$(localstatedir)/$(rootlibdir)/random-seed,g' \
+ 		-e 's,@prefix\@,$(prefix),g' \
+ 		-e 's,@exec_prefix\@,$(exec_prefix),g' \
+ 		-e 's,@libdir\@,$(libdir),g' \
+@@ -3407,9 +3407,9 @@
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(tmpfilesdir) \
+ 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
+-		$(DESTDIR)$(prefix)/lib/modules-load.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/modules-load.d \
+ 		$(DESTDIR)$(sysconfdir)/modules-load.d \
+-		$(DESTDIR)$(prefix)/lib/sysctl.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/sysctl.d \
+ 		$(DESTDIR)$(sysconfdir)/sysctl.d \
+ 		$(DESTDIR)$(systemshutdowndir) \
+ 		$(DESTDIR)$(systemsleepdir) \
diff --git a/meta-systemd/recipes-core/systemd/systemd_187.bb b/meta-systemd/recipes-core/systemd/systemd_187.bb
new file mode 100644
index 0000000..a6f6281
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd_187.bb
@@ -0,0 +1,220 @@
+DESCRIPTION = "Systemd a init replacement"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
+
+LICENSE = "GPLv2 & LGPLv2.1 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://LICENSE.LGPL2.1;md5=fb919cc88dbe06ec0b0bd50e001ccf1f \
+                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
+
+PROVIDES = "udev"
+
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
+
+SECTION = "base/shell"
+
+inherit useradd pkgconfig autotools perlnative
+
+SRC_URI = "http://www.freedesktop.org/software/systemd/${P}.tar.xz \
+           file://use-rootlibdir.patch \
+           file://gtk-doc.make \
+           file://touchscreen.rules \
+           file://modprobe.rules \
+           file://var-run.conf \
+          "
+
+SRC_URI[md5sum] = "26606e3c84448800ef0b3ffd57e6e8b6"
+SRC_URI[sha256sum] = "1a3b338f00cc1ec8b1dcdafe6ce7928f016f70403190db72960df38731fbeed4"
+
+LDFLAGS_libc-uclibc_append = " -lrt"
+
+SYSTEMDDISTRO ?= "debian"
+SYSTEMDDISTRO_angstrom = "angstrom"
+
+CACHED_CONFIGUREVARS = "ac_cv_file__usr_share_pci_ids=no \
+			ac_cv_file__usr_share_hwdata_pci_ids=no \
+			ac_cv_file__usr_share_misc_pci_ids=yes"
+# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
+EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
+                 --with-rootprefix=${base_prefix} \
+                 --with-rootlibdir=${base_libdir} \
+                 --sbindir=${base_sbindir} \
+                 --libexecdir=${base_libdir} \
+                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+                 --enable-xz \
+                 --disable-manpages \
+                 --disable-coredump \
+                 --disable-introspection \
+                 --with-pci-ids-path=/usr/share/misc \
+                 --disable-gtk-doc-html \ 
+                 --disable-tcpwrap \
+                 --enable-split-usr \
+               "
+
+# There's no docbook-xsl-native, so for the xsltproc check to false
+do_configure_prepend() {
+	sed -i /xsltproc/d configure.ac
+
+	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
+
+	# we only have /home/root, not /root
+	sed -i -e 's:=/root:=/home/root:g' units/*.service*
+}
+
+do_install() {
+	autotools_do_install
+	# provided by a seperate recipe
+	rm ${D}${systemd_unitdir}/system/serial-getty* -f
+
+	# provide support for initramfs
+	ln -s ${systemd_unitdir}/systemd ${D}/init
+
+	# create dir for journal
+	install -d ${D}${localstatedir}/log/journal
+
+	# create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+	touch ${D}${sysconfdir}/machine-id
+
+	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+
+	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
+}
+
+python populate_packages_prepend (){
+    systemdlibdir = d.getVar("base_libdir", True)
+    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+}
+
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r lock"
+
+FILES_${PN}-analyze = "${bindir}/systemd-analyze"
+RDEPENDS_${PN}-analyze = "python-dbus"
+RRECOMMENDS_${PN}-analyze = "python-pycairo"
+
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
+
+FILES_${PN}-gui = "${bindir}/systemadm"
+
+FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
+                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
+                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
+
+RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
+
+FILES_${PN} = " ${base_bindir}/* \
+                ${datadir}/dbus-1/services \
+                ${datadir}/dbus-1/system-services \
+                ${datadir}/polkit-1 \
+                ${datadir}/${PN} \
+                ${sysconfdir}/bash_completion.d/ \
+                ${sysconfdir}/binfmt.d/ \
+                ${sysconfdir}/dbus-1/ \
+                ${sysconfdir}/machine-id \
+                ${sysconfdir}/modules-load.d/ \
+                ${sysconfdir}/sysctl.d/ \
+                ${sysconfdir}/systemd/ \
+                ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/xdg/ \
+                ${systemd_unitdir}/* \
+                ${systemd_unitdir}/system/* \
+                ${base_libdir}/udev/rules.d/99-systemd.rules \
+                ${base_libdir}/security/*.so \
+                /cgroup \
+                ${bindir}/systemd* \
+                ${libdir}/tmpfiles.d/*.conf \
+                ${libdir}/systemd \
+                ${libdir}/binfmt.d \
+                ${libdir}/modules-load.d \
+                ${libdir}/sysctl.d \
+                ${localstatedir} \
+                ${libexecdir} \
+                ${base_libdir}/udev/rules.d/70-uaccess.rules \
+                ${base_libdir}/udev/rules.d/71-seat.rules \
+                ${base_libdir}/udev/rules.d/73-seat-late.rules \
+                ${base_libdir}/udev/rules.d/99-systemd.rules \
+               "
+
+FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
+
+RDEPENDS_${PN} += "dbus-systemd udev-systemd"
+
+# kbd -> loadkeys,setfont
+# systemd calls 'modprobe -sab --', which busybox doesn't support due to lack 
+# of blacklist support, so use proper modprobe from module-init-tools
+# And pull in the kernel modules mentioned in INSTALL
+# swapon -p is also not supported by busybox
+# busybox mount is broken
+RRECOMMENDS_${PN} += "systemd-serialgetty \
+                      util-linux-agetty \
+                      util-linux-swaponoff \
+                      util-linux-fsck e2fsprogs-e2fsck \
+                      module-init-tools \
+                      util-linux-mount util-linux-umount \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+"
+
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
+# TODO:
+# u-a for runlevel and telinit
+
+pkg_postinst_systemd () {
+update-alternatives --install ${base_sbindir}/init init ${systemd_unitdir}/systemd 300
+update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl 300
+update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
+update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
+update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
+}
+
+pkg_prerm_systemd () {
+update-alternatives --remove init ${systemd_unitdir}/systemd
+update-alternatives --remove halt ${base_bindir}/systemctl
+update-alternatives --remove reboot ${base_bindir}/systemctl
+update-alternatives --remove shutdown ${base_bindir}/systemctl
+update-alternatives --remove poweroff ${base_bindir}/systemctl
+}
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
deleted file mode 100644
index 39b883a..0000000
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ /dev/null
@@ -1,224 +0,0 @@
-DESCRIPTION = "Systemd a init replacement"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
-
-LICENSE = "GPLv2 & LGPLv2.1 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
-                    file://LICENSE.LGPL2.1;md5=fb919cc88dbe06ec0b0bd50e001ccf1f \
-                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
-
-PROVIDES = "udev"
-
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
-
-SECTION = "base/shell"
-
-inherit gitpkgv
-PKGV = "v${GITPKGVTAG}"
-
-PV = "git"
-PR = "r4"
-
-inherit useradd pkgconfig autotools vala perlnative
-
-SRCREV = "cd96b3b86abb4a88cac2722bdfb6e5d4413f6831"
-
-SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           file://gtk-doc.make \
-           file://touchscreen.rules \
-           file://modprobe.rules \
-           file://var-run.conf \
-          "
-LDFLAGS_libc-uclibc_append = " -lrt"
-
-S = "${WORKDIR}/git"
-
-SYSTEMDDISTRO ?= "debian"
-SYSTEMDDISTRO_angstrom = "angstrom"
-
-# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
-EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
-                 --with-rootprefix=${base_prefix} \
-                 --with-rootlibdir=${base_libdir} \
-                 --sbindir=${base_sbindir} \
-                 --libexecdir=${base_libdir} \
-                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
-                 --enable-xz \
-                 --disable-manpages \
-                 --disable-coredump \
-                 --disable-introspection \
-                 --with-pci-ids-path=/usr/share/misc \
-                 ac_cv_file__usr_share_pci_ids=no \
-                 ac_cv_file__usr_share_hwdata_pci_ids=no \
-                 ac_cv_file__usr_share_misc_pci_ids=yes \
-                 --disable-gtk-doc-html \ 
-                 --disable-tcpwrap \
-               "
-
-# There's no docbook-xsl-native, so for the xsltproc check to false
-do_configure_prepend() {
-	sed -i /xsltproc/d configure.ac
-
-	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
-
-	# we only have /home/root, not /root
-	sed -i -e 's:=/root:=/home/root:g' units/*.service*
-}
-
-do_install() {
-	autotools_do_install
-	# provided by a seperate recipe
-	rm ${D}${systemd_unitdir}/system/serial-getty* -f
-
-	# provide support for initramfs
-	ln -s ${systemd_unitdir}/systemd ${D}/init
-
-	# create dir for journal
-	install -d ${D}${localstatedir}/log/journal
-
-	# create machine-id
-	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
-	touch ${D}${sysconfdir}/machine-id
-
-	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
-
-	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
-}
-
-python populate_packages_prepend (){
-    systemdlibdir = d.getVar("base_libdir", True)
-    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
-}
-
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "-r lock"
-
-FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-RDEPENDS_${PN}-analyze = "python-dbus"
-RRECOMMENDS_${PN}-analyze = "python-pycairo"
-
-FILES_${PN}-initramfs = "/init"
-RDEPENDS_${PN}-initramfs = "${PN}"
-
-FILES_${PN}-gui = "${bindir}/systemadm"
-
-FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
-                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
-                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
-
-RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
-
-FILES_${PN} = " ${base_bindir}/* \
-                ${datadir}/dbus-1/services \
-                ${datadir}/dbus-1/system-services \
-                ${datadir}/polkit-1 \
-                ${datadir}/${PN} \
-                ${sysconfdir}/bash_completion.d/ \
-                ${sysconfdir}/binfmt.d/ \
-                ${sysconfdir}/dbus-1/ \
-                ${sysconfdir}/machine-id \
-                ${sysconfdir}/modules-load.d/ \
-                ${sysconfdir}/sysctl.d/ \
-                ${sysconfdir}/systemd/ \
-                ${sysconfdir}/tmpfiles.d/ \
-                ${sysconfdir}/xdg/ \
-                ${systemd_unitdir}/* \
-                ${systemd_unitdir}/system/* \
-                ${base_libdir}/udev/rules.d/99-systemd.rules \
-                ${base_libdir}/security/*.so \
-                /cgroup \
-                ${bindir}/systemd* \
-                ${libdir}/tmpfiles.d/*.conf \
-                ${libdir}/systemd \
-                ${libdir}/binfmt.d \
-                ${libdir}/modules-load.d \
-                ${libdir}/sysctl.d \
-                ${localstatedir} \
-                ${libexecdir} \
-                ${base_libdir}/udev/rules.d/70-uaccess.rules \
-                ${base_libdir}/udev/rules.d/71-seat.rules \
-                ${base_libdir}/udev/rules.d/73-seat-late.rules \
-                ${base_libdir}/udev/rules.d/99-systemd.rules \
-               "
-
-FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
-
-RDEPENDS_${PN} += "dbus-systemd udev-systemd"
-
-# kbd -> loadkeys,setfont
-# systemd calls 'modprobe -sab --', which busybox doesn't support due to lack 
-# of blacklist support, so use proper modprobe from module-init-tools
-# And pull in the kernel modules mentioned in INSTALL
-# swapon -p is also not supported by busybox
-# busybox mount is broken
-RRECOMMENDS_${PN} += "systemd-serialgetty \
-                      util-linux-agetty \
-                      util-linux-swaponoff \
-                      util-linux-fsck e2fsprogs-e2fsck \
-                      module-init-tools \
-                      util-linux-mount util-linux-umount \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
-"
-
-PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
-
-FILES_udev-dbg += "${base_libdir}/udev/.debug"
-
-RDEPENDS_udev += "udev-utils"
-RPROVIDES_udev = "hotplug"
-
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
-               ${sysconfdir}/udev \
-              "
-
-FILES_udev-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
-
-FILES_udev-utils = "${bindir}/udevadm"
-
-FILES_udev-systemd = "${base_libdir}/systemd/system/*udev* ${base_libdir}/systemd/system/*.wants/*udev*"
-RDEPENDS_udev-systemd = "udev"
-
-# TODO:
-# u-a for runlevel and telinit
-
-pkg_postinst_systemd () {
-update-alternatives --install ${base_sbindir}/init init ${systemd_unitdir}/systemd 300
-update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl 300
-update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
-update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
-update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
-}
-
-pkg_prerm_systemd () {
-update-alternatives --remove init ${systemd_unitdir}/systemd
-update-alternatives --remove halt ${base_bindir}/systemctl
-update-alternatives --remove reboot ${base_bindir}/systemctl
-update-alternatives --remove shutdown ${base_bindir}/systemctl
-update-alternatives --remove poweroff ${base_bindir}/systemctl
-}
-- 
1.7.5.4



