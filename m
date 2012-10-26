Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TReM6-0005a6-Px
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 09:29:23 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so2357491pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=R2u8ixUNIWKVvx+2wlSo12x+KMmWUsnM08HjfkJauKc=;
	b=n8LXzHHs1GqXsdKcsII/ZKfApsuwNxyQBfnv9SGXYlPPDoYLtHgOOBtc2x1UuSxp8+
	jdVg4K/KaJMmOdwle2RAJMz1XaoVSULwqyk4lTZSzyp36pEzXxULRV6LCaZ70MNHKiLv
	gEyTLKe9iqjB8BIJGTgKI9DzakHYVSsnvBumRgWo/y0Aehrilwe/7iOtj3kU8wGdbJRM
	l387k+tS/UpTo/1Jol8pJuRiGVHn3ikp2P6NYWb0qd0hb+2q4QIAvvadNi5OR/BN+gmk
	90w8o0PiK2JHHASyQsdSkch7kIpcV6k6KQyVEUY2VRNigjXHiG3GB12VcaUJU0z8+jiE
	cjrg==
Received: by 10.66.78.104 with SMTP id a8mr59608170pax.38.1351235752407;
	Fri, 26 Oct 2012 00:15:52 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ht5sm740308pbc.18.2012.10.26.00.15.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2012 00:15:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2012 00:14:49 -0700
Message-Id: <1351235689-612-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH] systemd: Fix build when base_libdir is not /lib
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
X-List-Received-Date: Fri, 26 Oct 2012 07:29:23 -0000

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
 meta-systemd/classes/systemd.bbclass               |    7 +-
 .../systemd/systemd/use-rootlibdir.patch           |  107 --------------------
 meta-systemd/recipes-core/systemd/systemd_git.bb   |   73 ++++++-------
 3 files changed, 41 insertions(+), 146 deletions(-)
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index 96d7f8f..16f6a48 100644
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
diff --git a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch b/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
deleted file mode 100644
index 4c471b6..0000000
--- a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-Upstream-Status: Undecided
-
-This patch removes some of hardcoded references to /lib
-and /usr/lib since on some architectures it should be
-/lib64 and /usr/lib64 atleast in OE
-
-I am not sure about the intention of hardcoded values
-thats why status is undecided
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am	2012-09-22 11:07:58.811981199 -0700
-+++ git/Makefile.am	2012-09-22 11:09:11.267983956 -0700
-@@ -64,25 +64,25 @@
- 
- # Our own, non-special dirs
- pkgsysconfdir=$(sysconfdir)/systemd
--userunitdir=$(prefix)/lib/systemd/user
--userpresetdir=$(prefix)/lib/systemd/user-preset
--tmpfilesdir=$(prefix)/lib/tmpfiles.d
--sysctldir=$(prefix)/lib/sysctl.d
--usergeneratordir=$(prefix)/lib/systemd/user-generators
-+userunitdir=$(prefix)/$(rootlibdir)/systemd/user
-+userpresetdir=$(prefix)/$(rootlibdir)/systemd/user-preset
-+tmpfilesdir=$(prefix)/$(rootlibdir)/tmpfiles.d
-+sysctldir=$(prefix)/$(rootlibdir)/sysctl.d
-+usergeneratordir=$(prefix)/$(rootlibdir)/systemd/user-generators
- pkgincludedir=$(includedir)/systemd
- systemgeneratordir=$(rootlibexecdir)/system-generators
- systemshutdowndir=$(rootlibexecdir)/system-shutdown
- systemsleepdir=$(rootlibexecdir)/system-sleep
--systemunitdir=$(rootprefix)/lib/systemd/system
--systempresetdir=$(rootprefix)/lib/systemd/system-preset
--udevlibexecdir=$(rootprefix)/lib/udev
-+systemunitdir=$(rootprefix)/$(rootlibdir)/systemd/system
-+systempresetdir=$(rootprefix)/$(rootlibdir)/systemd/system-preset
-+udevlibexecdir=$(rootprefix)/$(rootlibdir)/udev
- udevhomedir = $(udevlibexecdir)
- udevrulesdir = $(udevlibexecdir)/rules.d
- 
- # And these are the special ones for /
- rootprefix=@rootprefix@
- rootbindir=$(rootprefix)/bin
--rootlibexecdir=$(rootprefix)/lib/systemd
-+rootlibexecdir=$(rootprefix)/$(rootlibdir)/systemd
- 
- CLEANFILES = $(BUILT_SOURCES)
- EXTRA_DIST =
-@@ -132,7 +132,7 @@
- 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=\"$(bindir)/systemd-stdio-bridge\" \
- 	-DROOTPREFIX=\"$(rootprefix)\" \
- 	-DRUNTIME_DIR=\"/run\" \
--	-DRANDOM_SEED=\"$(localstatedir)/lib/random-seed\" \
-+	-DRANDOM_SEED=\"$(localstatedir)/$(rootlibdir)/random-seed\" \
- 	-DSYSTEMD_CRYPTSETUP_PATH=\"$(rootlibexecdir)/systemd-cryptsetup\" \
- 	-DSYSTEM_GENERATOR_PATH=\"$(systemgeneratordir)\" \
- 	-DUSER_GENERATOR_PATH=\"$(usergeneratordir)\" \
-@@ -2692,7 +2692,7 @@
- 
- binfmt-install-data-hook:
- 	$(MKDIR_P) -m 0755 \
--		$(DESTDIR)$(prefix)/lib/binfmt.d \
-+		$(DESTDIR)$(prefix)/$(rootlibdir)/binfmt.d \
- 		$(DESTDIR)$(sysconfdir)/binfmt.d \
- 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
- 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
-@@ -3107,7 +3107,7 @@
- 
- timedated-install-data-hook:
- 	$(MKDIR_P) -m 0755 \
--		$(DESTDIR)$(prefix)/lib/systemd/ntp-units.d \
-+		$(DESTDIR)$(prefix)/$(rootlibdir)/systemd/ntp-units.d \
- 		$(DESTDIR)$(sysconfdir)/systemd/ntp-units.d
- 	( cd $(DESTDIR)$(systemunitdir) && \
- 		rm -f dbus-org.freedesktop.timedate1.service  && \
-@@ -3337,7 +3337,7 @@
- logind-install-data-hook:
- 	$(MKDIR_P) -m 0755 \
- 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
--		$(DESTDIR)$(localstatedir)/lib/systemd
-+		$(DESTDIR)$(localstatedir)/$(rootlibdir)/systemd
- 	( cd $(DESTDIR)$(systemunitdir) && \
- 		rm -f dbus-org.freedesktop.login1.service && \
- 		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
-@@ -3494,7 +3494,7 @@
- 		-e 's,@PACKAGE_VERSION\@,$(PACKAGE_VERSION),g' \
- 		-e 's,@PACKAGE_NAME\@,$(PACKAGE_NAME),g' \
- 		-e 's,@PACKAGE_URL\@,$(PACKAGE_URL),g' \
--		-e 's,@RANDOM_SEED\@,$(localstatedir)/lib/random-seed,g' \
-+		-e 's,@RANDOM_SEED\@,$(localstatedir)/$(rootlibdir)/random-seed,g' \
- 		-e 's,@prefix\@,$(prefix),g' \
- 		-e 's,@exec_prefix\@,$(exec_prefix),g' \
- 		-e 's,@libdir\@,$(libdir),g' \
-@@ -3619,9 +3619,9 @@
- 	$(MKDIR_P) -m 0755 \
- 		$(DESTDIR)$(tmpfilesdir) \
- 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
--		$(DESTDIR)$(prefix)/lib/modules-load.d \
-+		$(DESTDIR)$(prefix)/$(rootlibdir)/modules-load.d \
- 		$(DESTDIR)$(sysconfdir)/modules-load.d \
--		$(DESTDIR)$(prefix)/lib/sysctl.d \
-+		$(DESTDIR)$(prefix)/$(rootlibdir)/sysctl.d \
- 		$(DESTDIR)$(sysconfdir)/sysctl.d \
- 		$(DESTDIR)$(systemshutdowndir) \
- 		$(DESTDIR)$(systemsleepdir) \
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 6deda82..c98697a 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,13 +19,12 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r9"
+PR = "r10"
 
 inherit useradd pkgconfig autotools perlnative
 
 SRCREV = "4d92e078e9d7e9a9d346065ea5e4afbafbdadb48"
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           file://use-rootlibdir.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
@@ -83,11 +82,13 @@ do_configure_prepend() {
 
 do_install() {
 	autotools_do_install
+	install -d ${D}/${base_sbindir}
 	# provided by a seperate recipe
 	rm ${D}${systemd_unitdir}/system/serial-getty* -f
 
 	# provide support for initramfs
 	ln -s ${systemd_unitdir}/systemd ${D}/init
+	ln -s ${systemd_unitdir}/systemd-udevd ${D}/${base_sbindir}/udevd
 
 	# create dir for journal
 	install -d ${D}${localstatedir}/log/journal
@@ -143,24 +144,24 @@ FILES_${PN} = " ${base_bindir}/* \
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
 
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
@@ -185,41 +186,41 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
 
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
+FILES_udev += "${base_sbindir}/udevd \
+               /libstemd-udevd \
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



