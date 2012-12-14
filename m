Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TjUKH-0004or-Ok
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 13:25:18 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1820077eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 04:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=tkPnYR5cF6hS/5wjwpgcuoaAUDH+wgAV4WSiKn+/vOs=;
	b=CI0zhIqjf/5qQXw1jJguhot8+eCUwHZmpcoXZXIxTK4liktZOXg1FW4hqQTazhyc/4
	eZ8zoA+BWbmcBcJQ7jRDcjtH4dIjQsrNbRuSyZ/q+99KAyNOouuoCbtBurlQkDGpEogu
	epvjm3+qMDhLPG6H98TBlBOXYxEr/TRk3U0BWHQ8GKU6kM1gvEtCT+XfTNY7gq8pjNzR
	EBgrsIYEMmEHFrt5//++A3tVtBgNXfk6vayzWCaxwF6zBB8NXlJFpJf/byOYkJVI7ulo
	ycgHwmlEFe+YKrm5fNPX8nqlD98WypPW2i5uMOGfHH7YwcYKwmLSt5fWCkHS6cvSVmlo
	Cf0Q==
Received: by 10.14.221.9 with SMTP id q9mr14965399eep.3.1355487036891;
	Fri, 14 Dec 2012 04:10:36 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id d3sm9087496eeo.13.2012.12.14.04.10.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 04:10:35 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 13:10:32 +0100
Message-Id: <1355487032-24669-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkyzB+q5eP8oVL0IXYVafv6FN9oBpPW4ASY6WE7h+4x61tLH5tkXIe2GLGRwA2+bZoFJ7K9
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-systemd][PATCH v2] systemd: update to v196
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
X-List-Received-Date: Fri, 14 Dec 2012 12:25:21 -0000

Systemd-analyze has 2 reverts to keep it working with the python currently present in OE-core

The LGPLv2.1 was update to the latest text from gnu.org, so match checksum to that.

Runtime tested on beaglebone/angstrom and soekris-net6501/angstrom

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...emd-analyze-use-argparse-instead-of-getop.patch |  103 +++++++++++++++++++
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 +++++++++++++++++
 .../systemd/systemd/use-rootlibdir.patch           |  107 --------------------
 meta-systemd/recipes-core/systemd/systemd_git.bb   |   12 ++-
 4 files changed, 201 insertions(+), 112 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch

diff --git a/meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch b/meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
new file mode 100644
index 0000000..7de2705
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
@@ -0,0 +1,103 @@
+From 2003e63f48cee2f497de7b90b66284f98c1c9919 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 10 Dec 2012 12:24:32 +0100
+Subject: [PATCH 1/2] Revert "systemd-analyze: use argparse instead of getopt"
+
+This reverts commit 0c0271841ab45595f71528c50bcf1904d4b841d5.
+
+Argparse is broken in current OE python
+---
+ src/analyze/systemd-analyze |   60 ++++++++++++++++++++++++++++---------------
+ 1 files changed, 39 insertions(+), 21 deletions(-)
+
+diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
+index 88699d6..87a83dd 100755
+--- a/src/analyze/systemd-analyze
++++ b/src/analyze/systemd-analyze
+@@ -1,7 +1,6 @@
+ #!/usr/bin/python
+ 
+-import sys, os
+-import argparse
++import getopt, sys, os
+ from gi.repository import Gio
+ try:
+         import cairo
+@@ -76,6 +75,20 @@ def draw_text(context, x, y, text, size = 12, r = 0, g = 0, b = 0, vcenter = 0.5
+ 
+         context.restore()
+ 
++def usage():
++        sys.stdout.write("""systemd-analyze [--user] time
++systemd-analyze [--user] blame
++systemd-analyze [--user] plot
++
++Process systemd profiling information
++
++  -h --help         Show this help
++""")
++
++def help():
++        usage()
++        sys.exit()
++
+ def time():
+ 
+         initrd_time, start_time, finish_time = acquire_start_time()
+@@ -266,29 +279,34 @@ def plot():
+ 
+         surface.finish()
+ 
+-parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
+-                                 description='Process systemd profiling information',
+-                                 epilog='''\
+-time - print time spent in the kernel before reaching userspace
+-blame - print list of running units ordered by time to init
+-plot - output SVG graphic showing service initialization
+-''')
+-
+-parser.add_argument('action', choices=('time', 'blame', 'plot'),
+-                    default='time', nargs='?',
+-                    help='action to perform (default: time)')
+-parser.add_argument('--user', action='store_true',
+-                    help='use the session bus')
++def unknown_verb():
++        sys.stderr.write("Unknown verb '%s'.\n" % args[0])
++        usage()
++        sys.exit(1)
+ 
+-args = parser.parse_args()
++bus = Gio.BusType.SYSTEM
+ 
+-if args.user:
+-        bus = Gio.BusType.SESSION
+-else:
+-        bus = Gio.BusType.SYSTEM
++try:
++        opts, args = getopt.gnu_getopt(sys.argv[1:], "h", ["help", "user"])
++except getopt.GetoptError as err:
++        sys.stdout.write(str(err) + "\n")
++        usage()
++        sys.exit(2)
++for o, a in opts:
++        if o in ("-h", "--help"):
++                help()
++        elif o == '--user':
++                bus = Gio.BusType.SESSION
++        else:
++                assert False, "unhandled option"
+ 
+ verb = {'time' : time,
+ 	'blame': blame,
+ 	'plot' : plot,
++	'help' : help,
+ 	}
+-verb.get(args.action)()
++
++if len(args) == 0:
++        time()
++else:
++        verb.get(args[0], unknown_verb)()
+-- 
+1.7.7.6
+
diff --git a/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch b/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
new file mode 100644
index 0000000..e5e8d7d
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
@@ -0,0 +1,91 @@
+From 8079db861b8ffdce69fa10a9ab9ef4740045187f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 10 Dec 2012 12:25:00 +0100
+Subject: [PATCH 2/2] Revert "analyze: use GDBus instead of dbus-python"
+
+This reverts commit 4940c64240541e91411620b7dc0963e012aa6b91.
+
+Python-gobject is too old in current OE
+---
+ src/analyze/systemd-analyze |   31 ++++++++++++++-----------------
+ 1 files changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
+index 87a83dd..636fd74 100755
+--- a/src/analyze/systemd-analyze
++++ b/src/analyze/systemd-analyze
+@@ -1,15 +1,14 @@
+ #!/usr/bin/python
+ 
+-import getopt, sys, os
+-from gi.repository import Gio
++import getopt, dbus, sys, os
+ try:
+         import cairo
+ except ImportError:
+         cairo = None
+ 
+ def acquire_time_data():
+-        manager = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.systemd1.Manager', None)
++
++        manager = dbus.Interface(bus.get_object('org.freedesktop.systemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.systemd1.Manager')
+         units = manager.ListUnits()
+ 
+         l = []
+@@ -18,25 +17,23 @@ def acquire_time_data():
+                 if i[5] != "":
+                         continue
+ 
+-                properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                        None, 'org.freedesktop.systemd1', i[6], 'org.freedesktop.DBus.Properties', None)
++                properties = dbus.Interface(bus.get_object('org.freedesktop.systemd1', i[6]), 'org.freedesktop.DBus.Properties')
+ 
+-                ixt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic')
+-                aet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic')
+-                axt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic')
+-                iet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic')
++                ixt = int(properties.Get('org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic'))
++                aet = int(properties.Get('org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic'))
++                axt = int(properties.Get('org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic'))
++                iet = int(properties.Get('org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic'))
+ 
+                 l.append((str(i[0]), ixt, aet, axt, iet))
+ 
+         return l
+ 
+ def acquire_start_time():
+-        properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.DBus.Properties', None)
++        properties = dbus.Interface(bus.get_object('org.freedesktop.systemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.DBus.Properties')
+ 
+-        initrd_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic')
+-        userspace_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic')
+-        finish_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic')
++        initrd_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic'))
++        userspace_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic'))
++        finish_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic'))
+ 
+         if finish_time == 0:
+                 sys.stderr.write("Bootup is not yet finished. Please try again later.\n")
+@@ -284,7 +281,7 @@ def unknown_verb():
+         usage()
+         sys.exit(1)
+ 
+-bus = Gio.BusType.SYSTEM
++bus = dbus.SystemBus()
+ 
+ try:
+         opts, args = getopt.gnu_getopt(sys.argv[1:], "h", ["help", "user"])
+@@ -296,7 +293,7 @@ for o, a in opts:
+         if o in ("-h", "--help"):
+                 help()
+         elif o == '--user':
+-                bus = Gio.BusType.SESSION
++                bus = dbus.SessionBus()
+         else:
+                 assert False, "unhandled option"
+ 
+-- 
+1.7.7.6
+
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
index 9005abd..7fa7ac6 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 
 LICENSE = "GPLv2 & LGPLv2.1 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
-                    file://LICENSE.LGPL2.1;md5=fb919cc88dbe06ec0b0bd50e001ccf1f \
+                    file://LICENSE.LGPL2.1;md5=f0df8fd67dfa1db3cc0bd431837f0b89 \
                     file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
 PROVIDES = "udev"
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r12"
+PR = "r13"
 
 # need to export these variables for python-config to work
 export BUILD_SYS
@@ -29,9 +29,10 @@ export STAGING_LIBDIR
 
 inherit useradd pkgconfig autotools perlnative pythonnative python-dir
 
-SRCREV = "4d92e078e9d7e9a9d346065ea5e4afbafbdadb48"
+SRCREV = "decd634e801bee2c554edb35383cc9d43417a850"
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           file://use-rootlibdir.patch \
+           file://0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch \
+           file://0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
@@ -119,7 +120,7 @@ USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-RDEPENDS_${PN}-analyze = "python-dbus"
+RDEPENDS_${PN}-analyze = "python-dbus python-argparse python-textutils"
 RRECOMMENDS_${PN}-analyze = "python-pycairo"
 
 FILES_python-${PN}-journal = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
@@ -225,6 +226,7 @@ FILES_udev += "${base_libdir}/udev/udevd \
                ${base_libdir}/udev/rules.d/78*.rules \
                ${base_libdir}/udev/rules.d/8*.rules \
                ${base_libdir}/udev/rules.d/95*.rules \
+               ${base_libdir}/udev/hwdb.d \
                ${sysconfdir}/udev \
               "
 
-- 
1.7.10



