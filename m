Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE486AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 22:30:40 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so185893011wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 15:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Qjy4LIlo03l+p5sw7TxBcBnPjvmbKGvk0TORHeHInoE=;
	b=V8PlpQq3p1SFh5s7HHb5Qyo8ygmNc0K5mI1r8VD6Fe6/d/c5OfYvIUPGYoELfc6bF/
	yI5mRGIRAYBU9myqzjw3QvVIYVlhTYsmjbUzGOxLd+IXUZ+dXR/0yBQ2wOfvjZ/waZaA
	l5G7nufy7lwtuTGjruW2zdglyjh9K407smoxuDX0f2hCH8+r05MHgkmjJ+aSPN877JQe
	NBboLxcqXFgKcl5MNNPs1m09ux+5L+yI5xG2Wdnx+U6O5PgUCDeTVOh2hBXi0K/AEi6L
	QyvyAloBBvYu2mDk1g2FMWsA2AqgU4f3ijxvqYUP1+NDFWyRTu8QNBKqvdEgex0CTuCi
	ZIIA==
X-Received: by 10.194.103.194 with SMTP id fy2mr37592829wjb.10.1444170640772; 
	Tue, 06 Oct 2015 15:30:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lb10sm35142431wjc.9.2015.10.06.15.30.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 15:30:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2015 00:30:37 +0200
Message-Id: <1444170642-23088-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 3/8] Revert "gnome-terminal, system-tools-backends, slim, benchfft, syslog-ng: move to nonworking directories"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Oct 2015 22:30:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* use PNBLACKLIST instead

This reverts commit 92ea562bafda6b201fae91c2bc13a404da4d581c.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../add-angstrom-distro.patch                      |  41 ---
 .../system-tools-backends                          |  74 -----
 .../system-tools/system-tools-backends_2.10.2.bb   |  52 ----
 .../add-angstrom-distro.patch                      |  41 +++
 .../system-tools-backends                          |  74 +++++
 .../system-tools/system-tools-backends_2.10.2.bb   |  54 ++++
 ...0002-Fix-image-handling-integer-overflows.patch | 343 ---------------------
 .../0003-Fix-build-failure-with-ld-as-needed.patch |  37 ---
 .../slim/slim/0004-Add-support-libpng15.patch      |  50 ---
 ...Remove-path-of-gcc-amd-g-and-version-of-g.patch |  30 --
 ...emove-localhost-from-Authenticator-of-pam.patch |  32 --
 .../slim/slim/0007-Fix-tty-slowness.patch          |  47 ---
 .../slim/slim/0008-restart-Xserver-if-killed.patch | 161 ----------
 .../nonworking/slim/slim/Makefile.oe               |  64 ----
 .../nonworking/slim/slim/slim-dynwm                |   8 -
 .../nonworking/slim/slim/slim.pamd                 |  19 --
 .../nonworking/slim/slim/slim.service              |  11 -
 .../nonworking/slim/slim/update_slim_wmlist        |  76 -----
 .../recipes-graphics/nonworking/slim/slim_1.3.2.bb |  81 -----
 ...0002-Fix-image-handling-integer-overflows.patch | 343 +++++++++++++++++++++
 .../0003-Fix-build-failure-with-ld-as-needed.patch |  37 +++
 .../slim/slim/0004-Add-support-libpng15.patch      |  50 +++
 ...Remove-path-of-gcc-amd-g-and-version-of-g.patch |  30 ++
 ...emove-localhost-from-Authenticator-of-pam.patch |  32 ++
 .../slim/slim/0007-Fix-tty-slowness.patch          |  47 +++
 .../slim/slim/0008-restart-Xserver-if-killed.patch | 161 ++++++++++
 meta-oe/recipes-graphics/slim/slim/Makefile.oe     |  64 ++++
 meta-oe/recipes-graphics/slim/slim/slim-dynwm      |   8 +
 meta-oe/recipes-graphics/slim/slim/slim.pamd       |  19 ++
 meta-oe/recipes-graphics/slim/slim/slim.service    |  11 +
 .../recipes-graphics/slim/slim/update_slim_wmlist  |  76 +++++
 meta-oe/recipes-graphics/slim/slim_1.3.2.bb        |  82 +++++
 meta-oe/recipes-support/fftw/benchfft_3.1.bb       |  21 ++
 .../nonworking/fftw/benchfft_3.1.bb                |  19 --
 34 files changed, 1150 insertions(+), 1145 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
 delete mode 100644 meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/system-tools-backends
 delete mode 100644 meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
 create mode 100644 meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
 create mode 100644 meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
 create mode 100644 meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/0002-Fix-image-handling-integer-overflows.patch
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/0004-Add-support-libpng15.patch
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/0007-Fix-tty-slowness.patch
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/0008-restart-Xserver-if-killed.patch
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/Makefile.oe
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/slim-dynwm
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/slim.pamd
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/slim.service
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim/update_slim_wmlist
 delete mode 100644 meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
 create mode 100644 meta-oe/recipes-graphics/slim/slim/0002-Fix-image-handling-integer-overflows.patch
 create mode 100644 meta-oe/recipes-graphics/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch
 create mode 100644 meta-oe/recipes-graphics/slim/slim/0004-Add-support-libpng15.patch
 create mode 100644 meta-oe/recipes-graphics/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch
 create mode 100644 meta-oe/recipes-graphics/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch
 create mode 100644 meta-oe/recipes-graphics/slim/slim/0007-Fix-tty-slowness.patch
 create mode 100644 meta-oe/recipes-graphics/slim/slim/0008-restart-Xserver-if-killed.patch
 create mode 100644 meta-oe/recipes-graphics/slim/slim/Makefile.oe
 create mode 100644 meta-oe/recipes-graphics/slim/slim/slim-dynwm
 create mode 100644 meta-oe/recipes-graphics/slim/slim/slim.pamd
 create mode 100644 meta-oe/recipes-graphics/slim/slim/slim.service
 create mode 100644 meta-oe/recipes-graphics/slim/slim/update_slim_wmlist
 create mode 100644 meta-oe/recipes-graphics/slim/slim_1.3.2.bb
 create mode 100644 meta-oe/recipes-support/fftw/benchfft_3.1.bb
 delete mode 100644 meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb

diff --git a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
deleted file mode 100644
index cb03fd8..0000000
--- a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b5084616a3bc2a0d485f43aeae69c6025f3f857e Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 10 Jun 2011 18:44:21 +0200
-Subject: [PATCH] add support for the angstrom distribtion
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- Utils/Platform.pm |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
-
-diff --git a/Utils/Platform.pm b/Utils/Platform.pm
-index fc76360..8b8c770 100644
---- a/Utils/Platform.pm
-+++ b/Utils/Platform.pm
-@@ -92,6 +92,7 @@ my $PLATFORM_INFO = {
-   "nexenta-1.0"     => [ "Nexenta GNU/Solaris", "1.0", "Ellate" ],
-   "yellowdog-4.1"   => [ "Yellow Dog Linux", "4.1", "Sagitta" ],
-   "guadalinex-v4"   => [ "Guadalinex", "v4", "Toro" ],
-+  "angstrom"        => [ "Angstrom", "", "" ],
- };
- 
- sub get_platform_info
-@@ -143,6 +144,7 @@ sub ensure_distro_map
-      "vine-3.1"         => "vine-3.0",
-      "vlos-1.2"         => "gentoo",
-      "nexenta-1.0"      => "solaris-2.11",
-+     "angstrom"         => "debian",
-      );
- 
-   return $metamap{$distro} if ($metamap{$distro});
-@@ -375,6 +377,7 @@ sub guess
-                   [ \&check_ark ],
-                   [ \&check_yoper ],
-                   [ \&check_distro_file, "/etc/yellowdog-release", "yellowdog", "^Yellow Dog Linux release (\\S+)" ],
-+                  [ \&check_file_exists, "/etc/angstrom-version", "angstrom" ],
-                  ],
-     "FreeBSD" => [[ \&check_freebsd ]],
-     "SunOS"   => [[ \&check_solaris ]]
--- 
-1.6.6.1
-
diff --git a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/system-tools-backends b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/system-tools-backends
deleted file mode 100644
index 704c36d..0000000
--- a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends-2.10.2/system-tools-backends
+++ /dev/null
@@ -1,74 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          system-tools-backends
-# Required-Start:    $local_fs dbus
-# Required-Stop:     $local_fs dbus
-# Should-Start:	     $syslog
-# Should-Stop:       $syslog
-# Default-Start:     2 3 4 5
-# Default-Stop:      1
-# Short-Description: Gnome System Tools Backends
-# Description:       The Gnome System Tools Backends daemon handles root-needed
-#                    operations to configure your machine with the Gnome System
-#		     Tools.
-### END INIT INFO
-
-PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
-DAEMON=/usr/bin/system-tools-backends
-PIDDIR=/var/run
-PIDFILE=$PIDDIR/system-tools-backends.pid
-NAME=system-tools-backends
-DESC="System Tools Backends"
-
-test -x $DAEMON || exit 0
-
-set -e
-
-do_start() {
-    echo "Starting $DESC"
-    start-stop-daemon --start --startas $DAEMON --quiet --pidfile $PIDFILE
-}
-
-do_stop() {
-    echo "Stopping $DESC"
-    start-stop-daemon --stop --oknodo --quiet --pidfile $PIDFILE --startas $DAEMON
-}
-
-case "$1" in
-  start)
-    do_start
-    ;;
-  stop)
-    do_stop
-    ;;
-  #reload)
-    #
-    # If the daemon can reload its config files on the fly
-    # for example by sending it SIGHUP, do it here.
-    #
-    # If the daemon responds to changes in its config file
-    # directly anyway, make this a do-nothing entry.
-    #
-    # echo "Reloading $DESC configuration files."
-    # start-stop-daemon --stop --signal 1 --quiet --pidfile \
-    #   /var/run/$NAME.pid --exec $DAEMON
-  #;;
-  restart|force-reload)
-    #
-    #   If the "reload" option is implemented, move the "force-reload"
-    #   option to the "reload" entry above. If not, "force-reload" is
-    #   just the same as "restart".
-    #
-    do_stop
-    sleep 5
-    do_start
-    ;;
-  *)
-    N=/etc/init.d/$NAME
-    echo "Usage: $N {start|stop|restart|reload|force-reload|status}" >&2
-    exit 1
-    ;;
-esac
-
-exit 0
-
diff --git a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
deleted file mode 100644
index 584d796..0000000
--- a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-SUMMARY = "gnome system tools backends"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "dbus dbus-glib glib-2.0 polkit"
-
-inherit gnome pkgconfig update-rc.d gettext
-
-SRC_URI[archive.md5sum] = "edae148b31342aecae035051adc70c74"
-SRC_URI[archive.sha256sum] = "1dbe5177df46a9c7250735e05e77129fe7ec04840771accfa87690111ca2c670"
-
-SRC_URI += " \
-            file://system-tools-backends \
-"
-
-# This needs to move to meta-angstrom
-SRC_URI_append_angstrom = " \
-            file://add-angstrom-distro.patch \
-"
-
-EXTRA_OECONF = " --with-net-dbus=${libdir}/perl5 "
-
-do_configure() {
-    rm missing || true
-    automake --add-missing
-    sed -i -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.am
-    sed -i -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.in
-    libtoolize --force --install
-    aclocal
-    gnu-configize
-    oe_runconf
-    cp ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S}
-}
-
-do_install_append () {
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/system-tools-backends ${D}/${sysconfdir}/init.d/    
-}
-
-INITSCRIPT_NAME = "system-tools-backends"
-INITSCRIPT_PARAMS = "start 50 2 3 4 5 . stop 70 1 ."
-
-# Shadow added so there is a full adduser/deluser
-# (Gnome images tend to pull in shadow anyway)
-RDEPENDS_${PN} = "shadow"
-
-FILES_${PN} += " ${sysconfdir}/dbus-1/system.d"
-FILES_${PN} += " ${libdir}/pkgconfig"
-FILES_${PN} += " ${datadir}/dbus-1/system-services"
-FILES_${PN} += " ${datadir}/system-tools-backends-2.0/files"
-FILES_${PN} += " ${datadir}/system-tools-backends-2.0/scripts"
-FILES_${PN} += " ${datadir}/polkit*"
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch b/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
new file mode 100644
index 0000000..cb03fd8
--- /dev/null
+++ b/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
@@ -0,0 +1,41 @@
+From b5084616a3bc2a0d485f43aeae69c6025f3f857e Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 10 Jun 2011 18:44:21 +0200
+Subject: [PATCH] add support for the angstrom distribtion
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ Utils/Platform.pm |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/Utils/Platform.pm b/Utils/Platform.pm
+index fc76360..8b8c770 100644
+--- a/Utils/Platform.pm
++++ b/Utils/Platform.pm
+@@ -92,6 +92,7 @@ my $PLATFORM_INFO = {
+   "nexenta-1.0"     => [ "Nexenta GNU/Solaris", "1.0", "Ellate" ],
+   "yellowdog-4.1"   => [ "Yellow Dog Linux", "4.1", "Sagitta" ],
+   "guadalinex-v4"   => [ "Guadalinex", "v4", "Toro" ],
++  "angstrom"        => [ "Angstrom", "", "" ],
+ };
+ 
+ sub get_platform_info
+@@ -143,6 +144,7 @@ sub ensure_distro_map
+      "vine-3.1"         => "vine-3.0",
+      "vlos-1.2"         => "gentoo",
+      "nexenta-1.0"      => "solaris-2.11",
++     "angstrom"         => "debian",
+      );
+ 
+   return $metamap{$distro} if ($metamap{$distro});
+@@ -375,6 +377,7 @@ sub guess
+                   [ \&check_ark ],
+                   [ \&check_yoper ],
+                   [ \&check_distro_file, "/etc/yellowdog-release", "yellowdog", "^Yellow Dog Linux release (\\S+)" ],
++                  [ \&check_file_exists, "/etc/angstrom-version", "angstrom" ],
+                  ],
+     "FreeBSD" => [[ \&check_freebsd ]],
+     "SunOS"   => [[ \&check_solaris ]]
+-- 
+1.6.6.1
+
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends b/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
new file mode 100644
index 0000000..704c36d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
@@ -0,0 +1,74 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          system-tools-backends
+# Required-Start:    $local_fs dbus
+# Required-Stop:     $local_fs dbus
+# Should-Start:	     $syslog
+# Should-Stop:       $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      1
+# Short-Description: Gnome System Tools Backends
+# Description:       The Gnome System Tools Backends daemon handles root-needed
+#                    operations to configure your machine with the Gnome System
+#		     Tools.
+### END INIT INFO
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/bin/system-tools-backends
+PIDDIR=/var/run
+PIDFILE=$PIDDIR/system-tools-backends.pid
+NAME=system-tools-backends
+DESC="System Tools Backends"
+
+test -x $DAEMON || exit 0
+
+set -e
+
+do_start() {
+    echo "Starting $DESC"
+    start-stop-daemon --start --startas $DAEMON --quiet --pidfile $PIDFILE
+}
+
+do_stop() {
+    echo "Stopping $DESC"
+    start-stop-daemon --stop --oknodo --quiet --pidfile $PIDFILE --startas $DAEMON
+}
+
+case "$1" in
+  start)
+    do_start
+    ;;
+  stop)
+    do_stop
+    ;;
+  #reload)
+    #
+    # If the daemon can reload its config files on the fly
+    # for example by sending it SIGHUP, do it here.
+    #
+    # If the daemon responds to changes in its config file
+    # directly anyway, make this a do-nothing entry.
+    #
+    # echo "Reloading $DESC configuration files."
+    # start-stop-daemon --stop --signal 1 --quiet --pidfile \
+    #   /var/run/$NAME.pid --exec $DAEMON
+  #;;
+  restart|force-reload)
+    #
+    #   If the "reload" option is implemented, move the "force-reload"
+    #   option to the "reload" entry above. If not, "force-reload" is
+    #   just the same as "restart".
+    #
+    do_stop
+    sleep 5
+    do_start
+    ;;
+  *)
+    N=/etc/init.d/$NAME
+    echo "Usage: $N {start|stop|restart|reload|force-reload|status}" >&2
+    exit 1
+    ;;
+esac
+
+exit 0
+
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb b/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
new file mode 100644
index 0000000..1693f37
--- /dev/null
+++ b/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
@@ -0,0 +1,54 @@
+SUMMARY = "gnome system tools backends"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "dbus dbus-glib glib-2.0 polkit"
+
+inherit gnome pkgconfig update-rc.d gettext
+
+SRC_URI[archive.md5sum] = "edae148b31342aecae035051adc70c74"
+SRC_URI[archive.sha256sum] = "1dbe5177df46a9c7250735e05e77129fe7ec04840771accfa87690111ca2c670"
+
+SRC_URI += " \
+            file://system-tools-backends \
+"
+
+# This needs to move to meta-angstrom
+SRC_URI_append_angstrom = " \
+            file://add-angstrom-distro.patch \
+"
+
+EXTRA_OECONF = " --with-net-dbus=${libdir}/perl5 "
+
+do_configure() {
+    rm missing || true
+    automake --add-missing
+    sed -i -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.am
+    sed -i -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.in
+    libtoolize --force --install
+    aclocal
+    gnu-configize
+    oe_runconf
+    cp ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S}
+}
+
+do_install_append () {
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/system-tools-backends ${D}/${sysconfdir}/init.d/    
+}
+
+INITSCRIPT_NAME = "system-tools-backends"
+INITSCRIPT_PARAMS = "start 50 2 3 4 5 . stop 70 1 ."
+
+# Shadow added so there is a full adduser/deluser
+# (Gnome images tend to pull in shadow anyway)
+RDEPENDS_${PN} = "shadow"
+
+FILES_${PN} += " ${sysconfdir}/dbus-1/system.d"
+FILES_${PN} += " ${libdir}/pkgconfig"
+FILES_${PN} += " ${datadir}/dbus-1/system-services"
+FILES_${PN} += " ${datadir}/system-tools-backends-2.0/files"
+FILES_${PN} += " ${datadir}/system-tools-backends-2.0/scripts"
+FILES_${PN} += " ${datadir}/polkit*"
+
+PNBLACKLIST[system-tools-backends] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/0002-Fix-image-handling-integer-overflows.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0002-Fix-image-handling-integer-overflows.patch
deleted file mode 100644
index de82d63..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/0002-Fix-image-handling-integer-overflows.patch
+++ /dev/null
@@ -1,343 +0,0 @@
-From 24e548a222f0aab4313d5ba8b04f0840b173000f Mon Sep 17 00:00:00 2001
-From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
-Date: Mon, 30 Aug 2010 01:24:54 +0000
-Subject: [PATCH 2/8] Fix image handling integer overflows
-
-Image loading memory allocation is based on the image width and height:
- malloc(heigth * width * 3).  Providing an image with large height and
-width values can cause the result of this calculation to exceed the
-maximum value of an unsigned int and thus causes an integer overflow.
-The result: too little memory is allocated and an heap overflow occurs.
-
-This patch was based by Niels Heinen <niels@freebsd.org>
-Thanks!
-
-Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
-
-git-svn-id: svn://svn.berlios.de/slim/trunk@176 7c53e7cc-98ea-0310-8f1f-a0b24da60408
----
- const.h |    3 ++
- jpeg.c  |   51 +++++++++++++++-----------
- png.c   |  122 ++++++++++++++++++++++++++++++++------------------------------
- 3 files changed, 96 insertions(+), 80 deletions(-)
-
-diff --git a/const.h b/const.h
-index df0989c..a18c6f3 100644
---- a/const.h
-+++ b/const.h
-@@ -42,4 +42,7 @@
- // variables replaced in pre-session_cmd and post-session_cmd
- #define USER_VAR       "%user"
- 
-+// max height/width for images
-+#define MAX_DIMENSION 10000
-+
- #endif
-diff --git a/jpeg.c b/jpeg.c
-index 1cf106c..e1f8352 100644
---- a/jpeg.c
-+++ b/jpeg.c
-@@ -22,16 +22,22 @@
- #include <string.h>
- 
- #include <jpeglib.h>
-+#include "const.h"
- 
- int
- read_jpeg(const char *filename, int *width, int *height, unsigned char **rgb)
- {
-+    int ret = 0;
-     struct jpeg_decompress_struct cinfo;
-     struct jpeg_error_mgr jerr;
-     unsigned char *ptr = NULL;
-     unsigned int i, ipos;
- 
-     FILE *infile = fopen(filename, "rb");
-+    if (infile == NULL) {
-+        fprintf(stderr, "Can not fopen file: %s\n",filename);
-+        return ret;
-+    }
- 
-     cinfo.err = jpeg_std_error(&jerr);
-     jpeg_create_decompress(&cinfo);
-@@ -39,43 +45,39 @@ read_jpeg(const char *filename, int *width, int *height, unsigned char **rgb)
-     jpeg_read_header(&cinfo, TRUE);
-     jpeg_start_decompress(&cinfo);
- 
-+    /* Prevent against integer overflow */
-+    if(cinfo.output_width >= MAX_DIMENSION || cinfo.output_height >= MAX_DIMENSION) {
-+        fprintf(stderr, "Unreasonable dimension found in file: %s\n",filename);
-+        goto close_file;
-+    }
-+
-     *width = cinfo.output_width;
-     *height = cinfo.output_height;
- 
-     rgb[0] = malloc(3 * cinfo.output_width * cinfo.output_height);
--    if (rgb[0] == NULL)
--    {
-+    if (rgb[0] == NULL) {
-         fprintf(stderr, "Can't allocate memory for JPEG file.\n");
--    fclose(infile);
--        return(0);
-+        goto close_file;
-     }
- 
--    if (cinfo.output_components == 3)
--    {
-+    if (cinfo.output_components == 3) {
-         ptr = rgb[0];
--        while (cinfo.output_scanline < cinfo.output_height) 
--        {
-+        while (cinfo.output_scanline < cinfo.output_height) {
-             jpeg_read_scanlines(&cinfo, &ptr, 1);
-             ptr += 3 * cinfo.output_width;
-         }
--    }
--    else if (cinfo.output_components == 1)
--    {
-+    } else if (cinfo.output_components == 1) {
-         ptr = malloc(cinfo.output_width);
--        if (ptr == NULL)
--        {
-+        if (ptr == NULL) {
-             fprintf(stderr, "Can't allocate memory for JPEG file.\n");
--        fclose(infile);
--            return(0);
-+            goto rgb_free;
-         }
- 
-         ipos = 0;
--        while (cinfo.output_scanline < cinfo.output_height) 
--        {
-+        while (cinfo.output_scanline < cinfo.output_height) {
-             jpeg_read_scanlines(&cinfo, &ptr, 1);
- 
--            for (i = 0; i < cinfo.output_width; i++)
--            {
-+            for (i = 0; i < cinfo.output_width; i++) {
-                 memset(rgb[0] + ipos, ptr[i], 3);
-                 ipos += 3;
-             }
-@@ -85,9 +87,16 @@ read_jpeg(const char *filename, int *width, int *height, unsigned char **rgb)
-     }
- 
-     jpeg_finish_decompress(&cinfo);
--    jpeg_destroy_decompress(&cinfo);
- 
-+    ret = 1;
-+    goto close_file;
-+
-+rgb_free:
-+    free(rgb[0]);
-+
-+close_file:
-+    jpeg_destroy_decompress(&cinfo);
-     fclose(infile);
- 
--    return(1);
-+    return(ret);
- }
-diff --git a/png.c b/png.c
-index a2661c6..5c086c6 100644
---- a/png.c
-+++ b/png.c
-@@ -22,12 +22,13 @@
- #include <stdlib.h>
- 
- #include <png.h>
-+#include "const.h"
- 
- int
- read_png(const char *filename, int *width, int *height, unsigned char **rgb, 
-      unsigned char **alpha)
- {
--    FILE *infile = fopen(filename, "rb");
-+    int ret = 0;
- 
-     png_structp png_ptr;
-     png_infop info_ptr;
-@@ -38,31 +39,27 @@ read_png(const char *filename, int *width, int *height, unsigned char **rgb,
-     int bit_depth, color_type, interlace_type;
-     int i;
- 
-+    FILE *infile = fopen(filename, "rb");
-+    if (infile == NULL) {
-+        fprintf(stderr, "Can not fopen file: %s\n",filename);
-+        return ret;
-+    }
-+
-     png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, 
-                                      (png_voidp) NULL, 
-                                      (png_error_ptr) NULL, 
-                                      (png_error_ptr) NULL);
--    if (!png_ptr) 
--    {
--        fclose(infile);
--        return(0);
--    }
-+    if (!png_ptr)
-+        goto file_close;
-   
-     info_ptr = png_create_info_struct(png_ptr);
--    if (!info_ptr)
--    {
-+    if (!info_ptr) {
-         png_destroy_read_struct(&png_ptr, (png_infopp) NULL, 
-                                 (png_infopp) NULL);
--        fclose(infile);
--        return(0);
-     }
-   
-     if (setjmp(png_ptr->jmpbuf))
--    {
--        png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp) NULL);
--        fclose(infile);
--        return(0);
--    }
-+        goto png_destroy;
-   
-     png_init_io(png_ptr, infile);
-     png_read_info(png_ptr, info_ptr);
-@@ -70,18 +67,23 @@ read_png(const char *filename, int *width, int *height, unsigned char **rgb,
-     png_get_IHDR(png_ptr, info_ptr, &w, &h, &bit_depth, &color_type,
-                  &interlace_type, (int *) NULL, (int *) NULL);
- 
-+    /* Prevent against integer overflow */
-+    if(w >= MAX_DIMENSION || h >= MAX_DIMENSION) {
-+        fprintf(stderr, "Unreasonable dimension found in file: %s\n",filename);
-+        goto png_destroy;
-+    }
-+
-     *width = (int) w;
-     *height = (int) h;
-     
-     if (color_type == PNG_COLOR_TYPE_RGB_ALPHA
--    || color_type == PNG_COLOR_TYPE_GRAY_ALPHA)
--    {
--    alpha[0] = malloc(*width * *height);
--    if (alpha[0] == NULL)
--    {
--        fprintf(stderr, "Can't allocate memory for alpha channel in PNG file.\n");
--        return(0); 
--    }
-+        || color_type == PNG_COLOR_TYPE_GRAY_ALPHA) {
-+        alpha[0] = malloc(*width * *height);
-+        if (alpha[0] == NULL)
-+        {
-+            fprintf(stderr, "Can't allocate memory for alpha channel in PNG file.\n");
-+            goto png_destroy;
-+        }
-     }
- 
-     /* Change a paletted/grayscale image to RGB */
-@@ -94,68 +96,70 @@ read_png(const char *filename, int *width, int *height, unsigned char **rgb,
-         png_set_gray_to_rgb(png_ptr);
- 
-     /* If the PNG file has 16 bits per channel, strip them down to 8 */
--    if (bit_depth == 16) png_set_strip_16(png_ptr);
-+    if (bit_depth == 16)
-+        png_set_strip_16(png_ptr);
- 
-     /* use 1 byte per pixel */
-     png_set_packing(png_ptr);
- 
-     row_pointers = malloc(*height * sizeof(png_bytep));
--    if (row_pointers == NULL)
--    {
-+    if (row_pointers == NULL) {
-         fprintf(stderr, "Can't allocate memory for PNG file.\n");
--        return(0);
-+        goto png_destroy;
-     }
- 
--    for (i = 0; i < *height; i++)
--    {
-+    for (i = 0; i < *height; i++) {
-         row_pointers[i] = malloc(4 * *width);
--        if (row_pointers == NULL)
--        {
-+        if (row_pointers == NULL) {
-             fprintf(stderr, "Can't allocate memory for PNG line.\n");
--            return(0);
-+            goto rows_free;
-         }
-     }
- 
-     png_read_image(png_ptr, row_pointers);
- 
-     rgb[0] = malloc(3 * *width * *height);
--    if (rgb[0] == NULL)
--    {
-+    if (rgb[0] == NULL) {
-         fprintf(stderr, "Can't allocate memory for PNG file.\n");
--        return(0);
-+        goto rows_free;
-     }
- 
-     if (alpha[0] == NULL)
-     {
--    ptr = rgb[0];
--    for (i = 0; i < *height; i++)
--    {
--        memcpy(ptr, row_pointers[i], 3 * *width);
--        ptr += 3 * *width;
--    }
--    }
--    else
--    {
--    int j;
--    ptr = rgb[0];
--    for (i = 0; i < *height; i++)
--    {
--        int ipos = 0;
--        for (j = 0; j < *width; j++)
--        {
--        *ptr++ = row_pointers[i][ipos++];
--        *ptr++ = row_pointers[i][ipos++];
--        *ptr++ = row_pointers[i][ipos++];
--        alpha[0][i * *width + j] = row_pointers[i][ipos++];
-+        ptr = rgb[0];
-+        for (i = 0; i < *height; i++) {
-+            memcpy(ptr, row_pointers[i], 3 * *width);
-+            ptr += 3 * *width;
-+        }
-+    } else {
-+        int j;
-+        ptr = rgb[0];
-+        for (i = 0; i < *height; i++) {
-+            int ipos = 0;
-+            for (j = 0; j < *width; j++) {
-+                *ptr++ = row_pointers[i][ipos++];
-+                *ptr++ = row_pointers[i][ipos++];
-+                *ptr++ = row_pointers[i][ipos++];
-+                alpha[0][i * *width + j] = row_pointers[i][ipos++];
-+            }
-         }
--    }
-     }
- 
--    png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp) NULL);
-+    ret = 1; /* data reading is OK */
-+
-+rows_free:
-+    for (i = 0; i < *height; i++) {
-+        if (row_pointers[i] != NULL ) {
-+            free(row_pointers[i]);
-+        }
-+    }
- 
--    for (i = 0; i < *height; i++) free(row_pointers[i]);
-     free(row_pointers);
- 
-+png_destroy:
-+    png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp) NULL);
-+
-+file_close:
-     fclose(infile);
--    return(1);
-+    return(ret);
- }
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch
deleted file mode 100644
index 471c4f5..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6aad913ddd5cdb473db9fa21a5e8ecec58de172b Mon Sep 17 00:00:00 2001
-From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
-Date: Wed, 12 Jan 2011 04:41:02 +0000
-Subject: [PATCH 3/8] Fix build failure with ld --as-needed.
-
-Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
-
-git-svn-id: svn://svn.berlios.de/slim/trunk@177 7c53e7cc-98ea-0310-8f1f-a0b24da60408
----
- Makefile |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 1219de4..fafa0ef 100644
---- a/Makefile
-+++ b/Makefile
-@@ -4,7 +4,7 @@
- # to fit into your operating system / distribution
- #######################################################
- CXX=/usr/bin/g++
--CC=/usr/bin/gcc
-+CC=/usr/bin/gcc-4.5
- CFLAGS=-Wall -I. -I/usr/include/freetype2 -I/usr/include/freetype2/config -I/usr/include/libpng12 -I/usr/include
- CXXFLAGS=$(CFLAGS)
- LDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng12 -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt
-@@ -33,7 +33,7 @@ endif
- all: slim
- 
- slim: $(OBJECTS)
--	$(CXX) $(LDFLAGS) $(OBJECTS) -o $(NAME)
-+	$(CXX) $(OBJECTS) $(LDFLAGS) -o $(NAME)
- 
- .cpp.o:
- 	$(CXX) $(CXXFLAGS) $(DEFINES) $(CUSTOM) -c $< -o $@
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/0004-Add-support-libpng15.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0004-Add-support-libpng15.patch
deleted file mode 100644
index f2087c0..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/0004-Add-support-libpng15.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From c2067e8c16bfb721d339718ae0c99c70a994936b Mon Sep 17 00:00:00 2001
-From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
-Date: Fri, 17 Jun 2011 20:35:07 +0000
-Subject: [PATCH 4/8] Add support libpng15
-
-Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
-
-git-svn-id: svn://svn.berlios.de/slim/trunk@178 7c53e7cc-98ea-0310-8f1f-a0b24da60408
----
- Makefile |    4 ++--
- png.c    |    6 +++++-
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index fafa0ef..1202614 100644
---- a/Makefile
-+++ b/Makefile
-@@ -5,9 +5,9 @@
- #######################################################
- CXX=/usr/bin/g++
- CC=/usr/bin/gcc-4.5
--CFLAGS=-Wall -I. -I/usr/include/freetype2 -I/usr/include/freetype2/config -I/usr/include/libpng12 -I/usr/include
-+CFLAGS=-Wall -I. -I/usr/include/freetype2 -I/usr/include/freetype2/config -I/usr/include
- CXXFLAGS=$(CFLAGS)
--LDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng12 -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt
-+LDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt
- CUSTOM=-DHAVE_SHADOW
- ifdef USE_PAM
- LDFLAGS+= -lpam
-diff --git a/png.c b/png.c
-index 5c086c6..aa0f5e5 100644
---- a/png.c
-+++ b/png.c
-@@ -57,8 +57,12 @@ read_png(const char *filename, int *width, int *height, unsigned char **rgb,
-         png_destroy_read_struct(&png_ptr, (png_infopp) NULL, 
-                                 (png_infopp) NULL);
-     }
--  
-+
-+#if PNG_LIBPNG_VER_MAJOR >= 1 && PNG_LIBPNG_VER_MINOR >= 4
-+	if (setjmp(png_jmpbuf((data->png_ptr))))
-+#else
-     if (setjmp(png_ptr->jmpbuf))
-+#endif
-         goto png_destroy;
-   
-     png_init_io(png_ptr, infile);
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch
deleted file mode 100644
index 566ae35..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4f69eb1aa85fbb395a0474b1f376505fab81ee22 Mon Sep 17 00:00:00 2001
-From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
-Date: Fri, 17 Jun 2011 20:35:10 +0000
-Subject: [PATCH 5/8] Remove path of gcc amd g++, and version of g++
-
-Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
-
-git-svn-id: svn://svn.berlios.de/slim/trunk@179 7c53e7cc-98ea-0310-8f1f-a0b24da60408
----
- Makefile |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 1202614..5c5fde1 100644
---- a/Makefile
-+++ b/Makefile
-@@ -3,8 +3,8 @@
- # Edit the following section to adjust the options
- # to fit into your operating system / distribution
- #######################################################
--CXX=/usr/bin/g++
--CC=/usr/bin/gcc-4.5
-+CXX=g++
-+CC=gcc
- CFLAGS=-Wall -I. -I/usr/include/freetype2 -I/usr/include/freetype2/config -I/usr/include
- CXXFLAGS=$(CFLAGS)
- LDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch
deleted file mode 100644
index a5b8125..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e188d5fd3e3c0e40c3e35729fd8b81b138191a75 Mon Sep 17 00:00:00 2001
-From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
-Date: Fri, 17 Jun 2011 20:35:13 +0000
-Subject: [PATCH 6/8] Remove localhost from Authenticator of pam
-
-http://bugs.gentoo.org/346037
-https://developer.berlios.de/bugs/?func=detailbug&bug_id=17757&group_id=2663
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-misc/slim/files/346037-stop_setting_host_for_pam_ck_connector_so.patch?view=log
-
-Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
-
-git-svn-id: svn://svn.berlios.de/slim/trunk@180 7c53e7cc-98ea-0310-8f1f-a0b24da60408
----
- app.cpp |    2 --
- 1 files changed, 0 insertions(+), 2 deletions(-)
-
-diff --git a/app.cpp b/app.cpp
-index c80a73e..7177363 100644
---- a/app.cpp
-+++ b/app.cpp
-@@ -236,8 +236,6 @@ void App::Run() {
-         pam.start("slim");
-         pam.set_item(PAM::Authenticator::TTY, DisplayName);
-         pam.set_item(PAM::Authenticator::Requestor, "root");
--        pam.set_item(PAM::Authenticator::Host, "localhost");
--
-     }
-     catch(PAM::Exception& e){
-         cerr << APPNAME << ": " << e << endl;
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/0007-Fix-tty-slowness.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0007-Fix-tty-slowness.patch
deleted file mode 100644
index fa2502b..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/0007-Fix-tty-slowness.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From da172fd6234b3b2b487ab36d63da72758829cb1d Mon Sep 17 00:00:00 2001
-From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
-Date: Fri, 17 Jun 2011 20:35:15 +0000
-Subject: [PATCH 7/8] Fix tty slowness
-
-Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
-
-git-svn-id: svn://svn.berlios.de/slim/trunk@181 7c53e7cc-98ea-0310-8f1f-a0b24da60408
----
- app.cpp |   10 ++++++----
- 1 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/app.cpp b/app.cpp
-index 7177363..44ab099 100644
---- a/app.cpp
-+++ b/app.cpp
-@@ -278,21 +278,23 @@ void App::Run() {
-         signal(SIGALRM, AlarmSignal);
- 
- #ifndef XNEST_DEBUG
--        OpenLog();
--        
-         if (!force_nodaemon && cfg->getOption("daemon") == "yes") {
-             daemonmode = true;
-         }
- 
-         // Daemonize
-         if (daemonmode) {
--            if (daemon(0, 1) == -1) {
-+            if (daemon(0, 0) == -1) {
-                 cerr << APPNAME << ": " << strerror(errno) << endl;
-                 exit(ERR_EXIT);
-             }
--            UpdatePid();
-         }
- 
-+        OpenLog();
-+
-+        if (daemonmode)
-+            UpdatePid();
-+
-         CreateServerAuth();
-         StartServer();
-         alarm(2);
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/0008-restart-Xserver-if-killed.patch b/meta-oe/recipes-graphics/nonworking/slim/slim/0008-restart-Xserver-if-killed.patch
deleted file mode 100644
index 0c5cfb7..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/0008-restart-Xserver-if-killed.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From ee77a3d154443d2823ecbf2141daa1b5924f629f Mon Sep 17 00:00:00 2001
-From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
-Date: Fri, 17 Jun 2011 20:38:34 +0000
-Subject: [PATCH 8/8] restart Xserver if killed
-
-Patch from http://developer.berlios.de/patch/?func=detailpatch&patch_id=2378&group_id=2663.
-
-Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
-
-git-svn-id: svn://svn.berlios.de/slim/trunk@182 7c53e7cc-98ea-0310-8f1f-a0b24da60408
----
- app.cpp |   36 +++++++++---------------------------
- app.h   |    2 +-
- 2 files changed, 10 insertions(+), 28 deletions(-)
-
-diff --git a/app.cpp b/app.cpp
-index 44ab099..358a98f 100644
---- a/app.cpp
-+++ b/app.cpp
-@@ -104,6 +104,11 @@ int conv(int num_msg, const struct pam_message **msg,
- 
- extern App* LoginApp;
- 
-+int xioerror(Display *disp) {
-+	LoginApp->RestartServer();
-+    return 0;
-+}
-+
- void CatchSignal(int sig) {
-     cerr << APPNAME << ": unexpected signal " << sig << endl;
- 
-@@ -114,19 +119,6 @@ void CatchSignal(int sig) {
-     exit(ERR_EXIT);
- }
- 
--
--void AlarmSignal(int sig) {
--    int pid = LoginApp->GetServerPID();
--    if(waitpid(pid, NULL, WNOHANG) == pid) {
--        LoginApp->StopServer();
--        LoginApp->RemoveLock();
--        exit(OK_EXIT);
--    }
--    signal(sig, AlarmSignal);
--    alarm(2);
--}
--
--
- void User1Signal(int sig) {
-     signal(sig, User1Signal);
- }
-@@ -275,7 +267,6 @@ void App::Run() {
-         signal(SIGHUP, CatchSignal);
-         signal(SIGPIPE, CatchSignal);
-         signal(SIGUSR1, User1Signal);
--        signal(SIGALRM, AlarmSignal);
- 
- #ifndef XNEST_DEBUG
-         if (!force_nodaemon && cfg->getOption("daemon") == "yes") {
-@@ -297,7 +288,6 @@ void App::Run() {
- 
-         CreateServerAuth();
-         StartServer();
--        alarm(2);
- #endif
- 
-     }
-@@ -613,6 +603,8 @@ void App::Login() {
-     int status;
-     while (wpid != pid) {
-         wpid = wait(&status);
-+		if (wpid == ServerPID)
-+			xioerror(Dpy);	// Server died, simulate IO error
-     }
-     if (WIFEXITED(status) && WEXITSTATUS(status)) {
-         LoginPanel->Message("Failed to execute login command");
-@@ -658,9 +650,6 @@ void App::Login() {
- 
- 
- void App::Reboot() {
--    // Stop alarm clock
--    alarm(0);
--
- #ifdef USE_PAM
-     try{
-         pam.end();
-@@ -683,9 +672,6 @@ void App::Reboot() {
- 
- 
- void App::Halt() {
--    // Stop alarm clock
--    alarm(0);
--
- #ifdef USE_PAM
-     try{
-         pam.end();
-@@ -771,6 +757,7 @@ void App::RestartServer() {
- 
-     StopServer(); 
-     RemoveLock();
-+	while (waitpid(-1, NULL, WNOHANG) > 0); // Collects all dead childrens
-     Run();
- } 
- 
-@@ -841,6 +828,7 @@ int App::WaitForServer() {
- 
-     for(cycles = 0; cycles < ncycles; cycles++) {
-         if((Dpy = XOpenDisplay(DisplayName))) {
-+            XSetIOErrorHandler(xioerror);
-             return 1;
-         } else {
-             if(!ServerTimeout(1, (char *) "X server to begin accepting connections"))
-@@ -925,9 +913,6 @@ int App::StartServer() {
-             ServerPID = -1;
-             break;
-         }
--        alarm(15);
--        pause();
--        alarm(0);
- 
-         // Wait for server to start up
-         if(WaitForServer() == 0) {
-@@ -962,15 +947,12 @@ int IgnoreXIO(Display *d) {
- 
- 
- void App::StopServer() {
--    // Stop alars clock and ignore signals
--    alarm(0);
-     signal(SIGQUIT, SIG_IGN);
-     signal(SIGINT, SIG_IGN);
-     signal(SIGHUP, SIG_IGN);
-     signal(SIGPIPE, SIG_IGN);
-     signal(SIGTERM, SIG_DFL);
-     signal(SIGKILL, SIG_DFL);
--    signal(SIGALRM, SIG_DFL);
- 
-     // Catch X error
-     XSetIOErrorHandler(IgnoreXIO);
-diff --git a/app.h b/app.h
-index dd7c281..2db1038 100644
---- a/app.h
-+++ b/app.h
-@@ -34,6 +34,7 @@ public:
-     ~App();
-     void Run();
-     int GetServerPID();
-+    void RestartServer();
-     void StopServer();
- 
- 	bool serverStarted;
-@@ -49,7 +50,6 @@ private:
-     void Console();
-     void Exit();
-     void KillAllClients(Bool top);
--    void RestartServer();
-     void ReadConfig();
-     void OpenLog();
-     void CloseLog();
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/Makefile.oe b/meta-oe/recipes-graphics/nonworking/slim/slim/Makefile.oe
deleted file mode 100644
index 2ee6934..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/Makefile.oe
+++ /dev/null
@@ -1,64 +0,0 @@
-# Makefile for slim - OpenEmbedded
-#######################################################
-
-
-SLIMLDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng12 -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt -lpthread
-CUSTOM=-DHAVE_SHADOW
-
-USE_PAM=1
-ifdef USE_PAM
-SLIMLDFLAGS+= -lpam
-CUSTOM+= -DUSE_PAM
-endif
-
-#######################################################
-
-NAME=slim
-VERSION=1.3.2
-
-DEFINES=-DPACKAGE=\"$(NAME)\" -DVERSION=\"$(VERSION)\" \
-		-DPKGDATADIR=\"$(PREFIX)/share/slim\" -DSYSCONFDIR=\"$(CFGDIR)\"
-
-OBJECTS=jpeg.o png.o main.o image.o numlock.o cfg.o switchuser.o app.o \
-	panel.o util.o
-ifdef USE_PAM
-OBJECTS+=PAM.o
-endif
-
-all: slim
-
-slim: $(OBJECTS)
-	$(CXX) $(OBJECTS) $(LDFLAGS) $(SLIMLDFLAGS) -o $(NAME)
-
-.cpp.o:
-	$(CXX) $(CXXFLAGS) $(DEFINES) $(CUSTOM) -c $< -o $@
-
-.c.o:
-	$(CC) $(CFLAGS) $(DEFINES) $(CUSTOM) -c $< -o $@
-
-install: slim install-theme
-	install -D -m 755 slim $(DESTDIR)$(PREFIX)/bin/slim
-	install -D -m 644 slim.1 $(DESTDIR)$(MANDIR)/man1/slim.1
-	test -e $(DESTDIR)$(CFGDIR)/slim.conf || \
-		install -D -m 644 slim.conf $(DESTDIR)$(CFGDIR)/slim.conf
-
-clean:
-	@rm -f slim *.o
-
-dist:
-	@rm -rf $(NAME)-$(VERSION)
-	@mkdir $(NAME)-$(VERSION)
-	@cp -r *.cpp *.h *.c Makefile Makefile.* COPYING ChangeLog INSTALL README TODO \
-		xinitrc.sample slim.1 THEMES themes slim.conf $(NAME)-$(VERSION)
-	@rm -rf $(NAME)-$(VERSION)/themes/.svn	$(NAME)-$(VERSION)/themes/default/.svn
-	@tar cvzf $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
-	@rm -rf $(NAME)-$(VERSION)
-
-
-install-theme:
-	install -D -m 644 themes/default/slim.theme \
-		 $(DESTDIR)$(PREFIX)/share/slim/themes/default/slim.theme
-	install -D -m 644 themes/default/panel.png \
-		 $(DESTDIR)$(PREFIX)/share/slim/themes/default/panel.png
-	install -D -m 644 themes/default/background.jpg \
-		 $(DESTDIR)$(PREFIX)/share/slim/themes/default/background.jpg
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/slim-dynwm b/meta-oe/recipes-graphics/nonworking/slim/slim/slim-dynwm
deleted file mode 100644
index 49c9d47..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/slim-dynwm
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-update_slim_wmlist
-if [ "x$1" = "x-nodaemon" ]; then
-  shift
-  exec slim "$@"
-else
-  slim -d "$@"
-fi
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/slim.pamd b/meta-oe/recipes-graphics/nonworking/slim/slim/slim.pamd
deleted file mode 100644
index 80c34b1..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/slim.pamd
+++ /dev/null
@@ -1,19 +0,0 @@
-# Begin /etc/pam.d/slim
-
-auth       required     pam_shells.so
-auth       include      common-auth
-auth       optional     pam_securetty.so
-auth       optional     pam_gnome_keyring.so
-
-account    required     pam_nologin.so
-account    include      common-account
-
-password   include      common-password
-
-session    include      common-session
-session    required     pam_mkhomedir.so skel=/etc/skel/ umask=0022
-session    optional     pam_lastlog.so nowtmp
-session    optional     pam_mail.so dir=/var/mail standard
-session    optional     pam_gnome_keyring.so  auto_start
-
-# End /etc/pam.d/slim
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/slim.service b/meta-oe/recipes-graphics/nonworking/slim/slim/slim.service
deleted file mode 100644
index 341351a..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/slim.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=SLiM Simple Login Manager
-Requires=dev-tty7.device
-After=dev-tty7.device systemd-user-sessions.service
-
-[Service]
-ExecStart=/usr/bin/slim -nodaemon
-StandardOutput=syslog
-
-[Install]
-WantedBy=graphical.target
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim/update_slim_wmlist b/meta-oe/recipes-graphics/nonworking/slim/slim/update_slim_wmlist
deleted file mode 100644
index 0f11653..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim/update_slim_wmlist
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/usr/bin/perl -w
-#
-# update_slim_wmlist, based on:
-# update_wdm_wmlist, (c) 1998 Marcelo Magallón <mmagallo@debian.org>
-# rewriten to use the x-window-manager alternative
-# modified to also use the x-session-manager alternative by Arthur Korn
-# Copyright 2000 Wichert Akkerman <wakkerma@debian.org>
-# Modified to use the freedesktop.org .desktop like kdm and gdm
-#
-# This script will read the list of installed window managers from
-# the freedesktop .desktop files in <etc>/X11/sessions/:<etc>/dm/Sessions/:
-# <share>/xsessions/
-# and update the sessions line in /etc/slim.conf.
-# BEWARE: It doesn't ask any questions about this. It just does it. It
-# takes an optional list of window managers.
-
-use strict;
-use File::DesktopEntry;
-
-my $wm_list='';
-my %desktop_files;
-
-unless (@ARGV) {
-    #my @wm_list = ('default');
-    my @wm_list;
-    foreach my $dir ('/etc/X11/sessions/','/etc/dm/Sessions/','/usr/share/xsessions/') {
-	    next unless (opendir DIR, $dir);
-	    my @files;
-	    @files = grep { /\.desktop$/ && -r "$dir/$_" } readdir(DIR);
-	    foreach my $file (@files) {
-		   push @{$desktop_files{$file}}, "$dir/$file";
-	    }
-    }
-    DESKTOP: foreach my $desktop_file (keys(%desktop_files)) {
-	    foreach my $file (@{$desktop_files{$desktop_file}}) {
-		    my $entry = File::DesktopEntry->new_from_file($file);
-		    next DESKTOP if (defined($entry->get_value('Hidden'))
-			and $entry->get_value('Hidden') eq 'true');
-		    if ($entry->get_value('Name') =~ /^gnome$/i) {
-			    push (@wm_list, 'gnome');
-		    }
-		    elsif ($entry->get_value('Name') =~ /^kde$/i) {
-			    push (@wm_list, 'kde');
-		    }
-		    elsif (defined($entry->get_value('Exec'))) {
-			    push (@wm_list, $entry->get_value('Exec'));
-		    }
-		    else { # not found, go to next file
-			    next;
-		    }
-		    # found, proceed to next destop file
-		    next DESKTOP;
-	    }
-    }
-   $wm_list = join (',', sort @wm_list) . ',custom';
-} else {
-    $wm_list = join (',', sort @ARGV);
-}
-
-open (SLIM_CONFIG_FILE, '</etc/slim.conf')
-    or die "Can't open /etc/slim.conf for reading: $!";
-open (NEW_SLIM_CONFIG_FILE, '>/etc/slim.conf.new')
-    or die "Can't open /etc/slim.conf.new for writing: $!";
-
-while (<SLIM_CONFIG_FILE>) {
-    s|^(sessions\s*).*|$1$wm_list|;
-    print NEW_SLIM_CONFIG_FILE;
-}
-
-close(SLIM_CONFIG_FILE);
-close(NEW_SLIM_CONFIG_FILE);
-
-rename '/etc/slim.conf.new', '/etc/slim.conf'
-    or die "Can't rename /etc/slim.conf.new: $!";
-
-exit 0;
diff --git a/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb b/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
deleted file mode 100644
index 5519b0e..0000000
--- a/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
+++ /dev/null
@@ -1,81 +0,0 @@
-DESCRIPTION="Simple Login Manager"
-HOMEPAGE="http://slim.berlios.de"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-PR = "r1"
-
-DEPENDS = "virtual/libx11 libxmu libpng jpeg freetype sessreg ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SRC_URI = " \
-    http://download.berlios.de/${BPN}/${BP}.tar.gz \
-    file://0002-Fix-image-handling-integer-overflows.patch \
-    file://0003-Fix-build-failure-with-ld-as-needed.patch \
-    file://0004-Add-support-libpng15.patch \
-    file://0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch \
-    file://0006-Remove-localhost-from-Authenticator-of-pam.patch \
-    file://0007-Fix-tty-slowness.patch \
-    file://0008-restart-Xserver-if-killed.patch \
-    file://slim-dynwm \
-    file://update_slim_wmlist \
-    file://Makefile.oe \
-    file://slim.pamd \
-    file://slim.service \
-"
-
-SRC_URI[md5sum] = "ca1ae6120e6f4b4969f2d6cf94f47b42"
-SRC_URI[sha256sum] = "f1560125005f253b9b88220598fed7a9575ef405716862c6ca3fcc72dbd482b8"
-
-
-EXTRA_OEMAKE += " \
-    USE_PAM=${@base_contains('DISTRO_FEATURES', 'pam', '1', '0', d)} \
-    PREFIX=${prefix} \
-    CFGDIR=${sysconfdir} \
-    MANDIR=${mandir} \
-    DESTDIR=${D} \
-    CFLAGS+=-I${STAGING_INCDIR}/freetype2 \
-    CXXFLAGS+=-I${STAGING_INCDIR}/freetype2 \
-"
-
-do_compile_prepend() {
-    cp -pP ${WORKDIR}/Makefile.oe ${S}/Makefile
-}
-
-do_install() {
-    oe_runmake install
-    install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/slim-dynwm ${D}${bindir}/
-    install -m 0755 ${WORKDIR}/update_slim_wmlist ${D}${bindir}/
-    install -d ${D}${sysconfdir}/pam.d/
-    install -m 0644 ${WORKDIR}/slim.pamd ${D}${sysconfdir}/pam.d/slim
-
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system/
-
-    echo 'sessionstart_cmd    /usr/bin/sessreg -a -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf
-    echo 'sessionstop_cmd     /usr/bin/sessreg -d -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf
-}
-
-
-RDEPENDS_${PN} = "perl xauth freetype sessreg "
-FILES_${PN} += "${systemd_unitdir}/system/"
-
-pkg_postinst_${PN} () {
-if test "x$D" != "x"; then
-    exit 1
-fi
-systemctl enable slim.service
-
-# Register SLiM as default DM
-mkdir -p ${sysconfdir}/X11/
-echo "${bindir}/slim" > ${sysconfdir}/X11/default-display-manager
-}
-
-pkg_postrm_${PN} () {
-if test "x$D" != "x"; then
-    exit 1
-fi
-systemctl disable slim.service
-sed -i /slim/d $D${sysconfdir}/X11/default-display-manager || true
-}
-
diff --git a/meta-oe/recipes-graphics/slim/slim/0002-Fix-image-handling-integer-overflows.patch b/meta-oe/recipes-graphics/slim/slim/0002-Fix-image-handling-integer-overflows.patch
new file mode 100644
index 0000000..de82d63
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/0002-Fix-image-handling-integer-overflows.patch
@@ -0,0 +1,343 @@
+From 24e548a222f0aab4313d5ba8b04f0840b173000f Mon Sep 17 00:00:00 2001
+From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
+Date: Mon, 30 Aug 2010 01:24:54 +0000
+Subject: [PATCH 2/8] Fix image handling integer overflows
+
+Image loading memory allocation is based on the image width and height:
+ malloc(heigth * width * 3).  Providing an image with large height and
+width values can cause the result of this calculation to exceed the
+maximum value of an unsigned int and thus causes an integer overflow.
+The result: too little memory is allocated and an heap overflow occurs.
+
+This patch was based by Niels Heinen <niels@freebsd.org>
+Thanks!
+
+Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+git-svn-id: svn://svn.berlios.de/slim/trunk@176 7c53e7cc-98ea-0310-8f1f-a0b24da60408
+---
+ const.h |    3 ++
+ jpeg.c  |   51 +++++++++++++++-----------
+ png.c   |  122 ++++++++++++++++++++++++++++++++------------------------------
+ 3 files changed, 96 insertions(+), 80 deletions(-)
+
+diff --git a/const.h b/const.h
+index df0989c..a18c6f3 100644
+--- a/const.h
++++ b/const.h
+@@ -42,4 +42,7 @@
+ // variables replaced in pre-session_cmd and post-session_cmd
+ #define USER_VAR       "%user"
+ 
++// max height/width for images
++#define MAX_DIMENSION 10000
++
+ #endif
+diff --git a/jpeg.c b/jpeg.c
+index 1cf106c..e1f8352 100644
+--- a/jpeg.c
++++ b/jpeg.c
+@@ -22,16 +22,22 @@
+ #include <string.h>
+ 
+ #include <jpeglib.h>
++#include "const.h"
+ 
+ int
+ read_jpeg(const char *filename, int *width, int *height, unsigned char **rgb)
+ {
++    int ret = 0;
+     struct jpeg_decompress_struct cinfo;
+     struct jpeg_error_mgr jerr;
+     unsigned char *ptr = NULL;
+     unsigned int i, ipos;
+ 
+     FILE *infile = fopen(filename, "rb");
++    if (infile == NULL) {
++        fprintf(stderr, "Can not fopen file: %s\n",filename);
++        return ret;
++    }
+ 
+     cinfo.err = jpeg_std_error(&jerr);
+     jpeg_create_decompress(&cinfo);
+@@ -39,43 +45,39 @@ read_jpeg(const char *filename, int *width, int *height, unsigned char **rgb)
+     jpeg_read_header(&cinfo, TRUE);
+     jpeg_start_decompress(&cinfo);
+ 
++    /* Prevent against integer overflow */
++    if(cinfo.output_width >= MAX_DIMENSION || cinfo.output_height >= MAX_DIMENSION) {
++        fprintf(stderr, "Unreasonable dimension found in file: %s\n",filename);
++        goto close_file;
++    }
++
+     *width = cinfo.output_width;
+     *height = cinfo.output_height;
+ 
+     rgb[0] = malloc(3 * cinfo.output_width * cinfo.output_height);
+-    if (rgb[0] == NULL)
+-    {
++    if (rgb[0] == NULL) {
+         fprintf(stderr, "Can't allocate memory for JPEG file.\n");
+-    fclose(infile);
+-        return(0);
++        goto close_file;
+     }
+ 
+-    if (cinfo.output_components == 3)
+-    {
++    if (cinfo.output_components == 3) {
+         ptr = rgb[0];
+-        while (cinfo.output_scanline < cinfo.output_height) 
+-        {
++        while (cinfo.output_scanline < cinfo.output_height) {
+             jpeg_read_scanlines(&cinfo, &ptr, 1);
+             ptr += 3 * cinfo.output_width;
+         }
+-    }
+-    else if (cinfo.output_components == 1)
+-    {
++    } else if (cinfo.output_components == 1) {
+         ptr = malloc(cinfo.output_width);
+-        if (ptr == NULL)
+-        {
++        if (ptr == NULL) {
+             fprintf(stderr, "Can't allocate memory for JPEG file.\n");
+-        fclose(infile);
+-            return(0);
++            goto rgb_free;
+         }
+ 
+         ipos = 0;
+-        while (cinfo.output_scanline < cinfo.output_height) 
+-        {
++        while (cinfo.output_scanline < cinfo.output_height) {
+             jpeg_read_scanlines(&cinfo, &ptr, 1);
+ 
+-            for (i = 0; i < cinfo.output_width; i++)
+-            {
++            for (i = 0; i < cinfo.output_width; i++) {
+                 memset(rgb[0] + ipos, ptr[i], 3);
+                 ipos += 3;
+             }
+@@ -85,9 +87,16 @@ read_jpeg(const char *filename, int *width, int *height, unsigned char **rgb)
+     }
+ 
+     jpeg_finish_decompress(&cinfo);
+-    jpeg_destroy_decompress(&cinfo);
+ 
++    ret = 1;
++    goto close_file;
++
++rgb_free:
++    free(rgb[0]);
++
++close_file:
++    jpeg_destroy_decompress(&cinfo);
+     fclose(infile);
+ 
+-    return(1);
++    return(ret);
+ }
+diff --git a/png.c b/png.c
+index a2661c6..5c086c6 100644
+--- a/png.c
++++ b/png.c
+@@ -22,12 +22,13 @@
+ #include <stdlib.h>
+ 
+ #include <png.h>
++#include "const.h"
+ 
+ int
+ read_png(const char *filename, int *width, int *height, unsigned char **rgb, 
+      unsigned char **alpha)
+ {
+-    FILE *infile = fopen(filename, "rb");
++    int ret = 0;
+ 
+     png_structp png_ptr;
+     png_infop info_ptr;
+@@ -38,31 +39,27 @@ read_png(const char *filename, int *width, int *height, unsigned char **rgb,
+     int bit_depth, color_type, interlace_type;
+     int i;
+ 
++    FILE *infile = fopen(filename, "rb");
++    if (infile == NULL) {
++        fprintf(stderr, "Can not fopen file: %s\n",filename);
++        return ret;
++    }
++
+     png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, 
+                                      (png_voidp) NULL, 
+                                      (png_error_ptr) NULL, 
+                                      (png_error_ptr) NULL);
+-    if (!png_ptr) 
+-    {
+-        fclose(infile);
+-        return(0);
+-    }
++    if (!png_ptr)
++        goto file_close;
+   
+     info_ptr = png_create_info_struct(png_ptr);
+-    if (!info_ptr)
+-    {
++    if (!info_ptr) {
+         png_destroy_read_struct(&png_ptr, (png_infopp) NULL, 
+                                 (png_infopp) NULL);
+-        fclose(infile);
+-        return(0);
+     }
+   
+     if (setjmp(png_ptr->jmpbuf))
+-    {
+-        png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp) NULL);
+-        fclose(infile);
+-        return(0);
+-    }
++        goto png_destroy;
+   
+     png_init_io(png_ptr, infile);
+     png_read_info(png_ptr, info_ptr);
+@@ -70,18 +67,23 @@ read_png(const char *filename, int *width, int *height, unsigned char **rgb,
+     png_get_IHDR(png_ptr, info_ptr, &w, &h, &bit_depth, &color_type,
+                  &interlace_type, (int *) NULL, (int *) NULL);
+ 
++    /* Prevent against integer overflow */
++    if(w >= MAX_DIMENSION || h >= MAX_DIMENSION) {
++        fprintf(stderr, "Unreasonable dimension found in file: %s\n",filename);
++        goto png_destroy;
++    }
++
+     *width = (int) w;
+     *height = (int) h;
+     
+     if (color_type == PNG_COLOR_TYPE_RGB_ALPHA
+-    || color_type == PNG_COLOR_TYPE_GRAY_ALPHA)
+-    {
+-    alpha[0] = malloc(*width * *height);
+-    if (alpha[0] == NULL)
+-    {
+-        fprintf(stderr, "Can't allocate memory for alpha channel in PNG file.\n");
+-        return(0); 
+-    }
++        || color_type == PNG_COLOR_TYPE_GRAY_ALPHA) {
++        alpha[0] = malloc(*width * *height);
++        if (alpha[0] == NULL)
++        {
++            fprintf(stderr, "Can't allocate memory for alpha channel in PNG file.\n");
++            goto png_destroy;
++        }
+     }
+ 
+     /* Change a paletted/grayscale image to RGB */
+@@ -94,68 +96,70 @@ read_png(const char *filename, int *width, int *height, unsigned char **rgb,
+         png_set_gray_to_rgb(png_ptr);
+ 
+     /* If the PNG file has 16 bits per channel, strip them down to 8 */
+-    if (bit_depth == 16) png_set_strip_16(png_ptr);
++    if (bit_depth == 16)
++        png_set_strip_16(png_ptr);
+ 
+     /* use 1 byte per pixel */
+     png_set_packing(png_ptr);
+ 
+     row_pointers = malloc(*height * sizeof(png_bytep));
+-    if (row_pointers == NULL)
+-    {
++    if (row_pointers == NULL) {
+         fprintf(stderr, "Can't allocate memory for PNG file.\n");
+-        return(0);
++        goto png_destroy;
+     }
+ 
+-    for (i = 0; i < *height; i++)
+-    {
++    for (i = 0; i < *height; i++) {
+         row_pointers[i] = malloc(4 * *width);
+-        if (row_pointers == NULL)
+-        {
++        if (row_pointers == NULL) {
+             fprintf(stderr, "Can't allocate memory for PNG line.\n");
+-            return(0);
++            goto rows_free;
+         }
+     }
+ 
+     png_read_image(png_ptr, row_pointers);
+ 
+     rgb[0] = malloc(3 * *width * *height);
+-    if (rgb[0] == NULL)
+-    {
++    if (rgb[0] == NULL) {
+         fprintf(stderr, "Can't allocate memory for PNG file.\n");
+-        return(0);
++        goto rows_free;
+     }
+ 
+     if (alpha[0] == NULL)
+     {
+-    ptr = rgb[0];
+-    for (i = 0; i < *height; i++)
+-    {
+-        memcpy(ptr, row_pointers[i], 3 * *width);
+-        ptr += 3 * *width;
+-    }
+-    }
+-    else
+-    {
+-    int j;
+-    ptr = rgb[0];
+-    for (i = 0; i < *height; i++)
+-    {
+-        int ipos = 0;
+-        for (j = 0; j < *width; j++)
+-        {
+-        *ptr++ = row_pointers[i][ipos++];
+-        *ptr++ = row_pointers[i][ipos++];
+-        *ptr++ = row_pointers[i][ipos++];
+-        alpha[0][i * *width + j] = row_pointers[i][ipos++];
++        ptr = rgb[0];
++        for (i = 0; i < *height; i++) {
++            memcpy(ptr, row_pointers[i], 3 * *width);
++            ptr += 3 * *width;
++        }
++    } else {
++        int j;
++        ptr = rgb[0];
++        for (i = 0; i < *height; i++) {
++            int ipos = 0;
++            for (j = 0; j < *width; j++) {
++                *ptr++ = row_pointers[i][ipos++];
++                *ptr++ = row_pointers[i][ipos++];
++                *ptr++ = row_pointers[i][ipos++];
++                alpha[0][i * *width + j] = row_pointers[i][ipos++];
++            }
+         }
+-    }
+     }
+ 
+-    png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp) NULL);
++    ret = 1; /* data reading is OK */
++
++rows_free:
++    for (i = 0; i < *height; i++) {
++        if (row_pointers[i] != NULL ) {
++            free(row_pointers[i]);
++        }
++    }
+ 
+-    for (i = 0; i < *height; i++) free(row_pointers[i]);
+     free(row_pointers);
+ 
++png_destroy:
++    png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp) NULL);
++
++file_close:
+     fclose(infile);
+-    return(1);
++    return(ret);
+ }
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-graphics/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch b/meta-oe/recipes-graphics/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch
new file mode 100644
index 0000000..471c4f5
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/0003-Fix-build-failure-with-ld-as-needed.patch
@@ -0,0 +1,37 @@
+From 6aad913ddd5cdb473db9fa21a5e8ecec58de172b Mon Sep 17 00:00:00 2001
+From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
+Date: Wed, 12 Jan 2011 04:41:02 +0000
+Subject: [PATCH 3/8] Fix build failure with ld --as-needed.
+
+Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+git-svn-id: svn://svn.berlios.de/slim/trunk@177 7c53e7cc-98ea-0310-8f1f-a0b24da60408
+---
+ Makefile |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1219de4..fafa0ef 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,7 +4,7 @@
+ # to fit into your operating system / distribution
+ #######################################################
+ CXX=/usr/bin/g++
+-CC=/usr/bin/gcc
++CC=/usr/bin/gcc-4.5
+ CFLAGS=-Wall -I. -I/usr/include/freetype2 -I/usr/include/freetype2/config -I/usr/include/libpng12 -I/usr/include
+ CXXFLAGS=$(CFLAGS)
+ LDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng12 -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt
+@@ -33,7 +33,7 @@ endif
+ all: slim
+ 
+ slim: $(OBJECTS)
+-	$(CXX) $(LDFLAGS) $(OBJECTS) -o $(NAME)
++	$(CXX) $(OBJECTS) $(LDFLAGS) -o $(NAME)
+ 
+ .cpp.o:
+ 	$(CXX) $(CXXFLAGS) $(DEFINES) $(CUSTOM) -c $< -o $@
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-graphics/slim/slim/0004-Add-support-libpng15.patch b/meta-oe/recipes-graphics/slim/slim/0004-Add-support-libpng15.patch
new file mode 100644
index 0000000..f2087c0
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/0004-Add-support-libpng15.patch
@@ -0,0 +1,50 @@
+From c2067e8c16bfb721d339718ae0c99c70a994936b Mon Sep 17 00:00:00 2001
+From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
+Date: Fri, 17 Jun 2011 20:35:07 +0000
+Subject: [PATCH 4/8] Add support libpng15
+
+Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+git-svn-id: svn://svn.berlios.de/slim/trunk@178 7c53e7cc-98ea-0310-8f1f-a0b24da60408
+---
+ Makefile |    4 ++--
+ png.c    |    6 +++++-
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fafa0ef..1202614 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,9 +5,9 @@
+ #######################################################
+ CXX=/usr/bin/g++
+ CC=/usr/bin/gcc-4.5
+-CFLAGS=-Wall -I. -I/usr/include/freetype2 -I/usr/include/freetype2/config -I/usr/include/libpng12 -I/usr/include
++CFLAGS=-Wall -I. -I/usr/include/freetype2 -I/usr/include/freetype2/config -I/usr/include
+ CXXFLAGS=$(CFLAGS)
+-LDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng12 -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt
++LDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt
+ CUSTOM=-DHAVE_SHADOW
+ ifdef USE_PAM
+ LDFLAGS+= -lpam
+diff --git a/png.c b/png.c
+index 5c086c6..aa0f5e5 100644
+--- a/png.c
++++ b/png.c
+@@ -57,8 +57,12 @@ read_png(const char *filename, int *width, int *height, unsigned char **rgb,
+         png_destroy_read_struct(&png_ptr, (png_infopp) NULL, 
+                                 (png_infopp) NULL);
+     }
+-  
++
++#if PNG_LIBPNG_VER_MAJOR >= 1 && PNG_LIBPNG_VER_MINOR >= 4
++	if (setjmp(png_jmpbuf((data->png_ptr))))
++#else
+     if (setjmp(png_ptr->jmpbuf))
++#endif
+         goto png_destroy;
+   
+     png_init_io(png_ptr, infile);
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-graphics/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch b/meta-oe/recipes-graphics/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch
new file mode 100644
index 0000000..566ae35
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch
@@ -0,0 +1,30 @@
+From 4f69eb1aa85fbb395a0474b1f376505fab81ee22 Mon Sep 17 00:00:00 2001
+From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
+Date: Fri, 17 Jun 2011 20:35:10 +0000
+Subject: [PATCH 5/8] Remove path of gcc amd g++, and version of g++
+
+Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+git-svn-id: svn://svn.berlios.de/slim/trunk@179 7c53e7cc-98ea-0310-8f1f-a0b24da60408
+---
+ Makefile |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1202614..5c5fde1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,8 +3,8 @@
+ # Edit the following section to adjust the options
+ # to fit into your operating system / distribution
+ #######################################################
+-CXX=/usr/bin/g++
+-CC=/usr/bin/gcc-4.5
++CXX=g++
++CC=gcc
+ CFLAGS=-Wall -I. -I/usr/include/freetype2 -I/usr/include/freetype2/config -I/usr/include
+ CXXFLAGS=$(CFLAGS)
+ LDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-graphics/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch b/meta-oe/recipes-graphics/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch
new file mode 100644
index 0000000..a5b8125
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/0006-Remove-localhost-from-Authenticator-of-pam.patch
@@ -0,0 +1,32 @@
+From e188d5fd3e3c0e40c3e35729fd8b81b138191a75 Mon Sep 17 00:00:00 2001
+From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
+Date: Fri, 17 Jun 2011 20:35:13 +0000
+Subject: [PATCH 6/8] Remove localhost from Authenticator of pam
+
+http://bugs.gentoo.org/346037
+https://developer.berlios.de/bugs/?func=detailbug&bug_id=17757&group_id=2663
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-misc/slim/files/346037-stop_setting_host_for_pam_ck_connector_so.patch?view=log
+
+Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+git-svn-id: svn://svn.berlios.de/slim/trunk@180 7c53e7cc-98ea-0310-8f1f-a0b24da60408
+---
+ app.cpp |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/app.cpp b/app.cpp
+index c80a73e..7177363 100644
+--- a/app.cpp
++++ b/app.cpp
+@@ -236,8 +236,6 @@ void App::Run() {
+         pam.start("slim");
+         pam.set_item(PAM::Authenticator::TTY, DisplayName);
+         pam.set_item(PAM::Authenticator::Requestor, "root");
+-        pam.set_item(PAM::Authenticator::Host, "localhost");
+-
+     }
+     catch(PAM::Exception& e){
+         cerr << APPNAME << ": " << e << endl;
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-graphics/slim/slim/0007-Fix-tty-slowness.patch b/meta-oe/recipes-graphics/slim/slim/0007-Fix-tty-slowness.patch
new file mode 100644
index 0000000..fa2502b
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/0007-Fix-tty-slowness.patch
@@ -0,0 +1,47 @@
+From da172fd6234b3b2b487ab36d63da72758829cb1d Mon Sep 17 00:00:00 2001
+From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
+Date: Fri, 17 Jun 2011 20:35:15 +0000
+Subject: [PATCH 7/8] Fix tty slowness
+
+Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+git-svn-id: svn://svn.berlios.de/slim/trunk@181 7c53e7cc-98ea-0310-8f1f-a0b24da60408
+---
+ app.cpp |   10 ++++++----
+ 1 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/app.cpp b/app.cpp
+index 7177363..44ab099 100644
+--- a/app.cpp
++++ b/app.cpp
+@@ -278,21 +278,23 @@ void App::Run() {
+         signal(SIGALRM, AlarmSignal);
+ 
+ #ifndef XNEST_DEBUG
+-        OpenLog();
+-        
+         if (!force_nodaemon && cfg->getOption("daemon") == "yes") {
+             daemonmode = true;
+         }
+ 
+         // Daemonize
+         if (daemonmode) {
+-            if (daemon(0, 1) == -1) {
++            if (daemon(0, 0) == -1) {
+                 cerr << APPNAME << ": " << strerror(errno) << endl;
+                 exit(ERR_EXIT);
+             }
+-            UpdatePid();
+         }
+ 
++        OpenLog();
++
++        if (daemonmode)
++            UpdatePid();
++
+         CreateServerAuth();
+         StartServer();
+         alarm(2);
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-graphics/slim/slim/0008-restart-Xserver-if-killed.patch b/meta-oe/recipes-graphics/slim/slim/0008-restart-Xserver-if-killed.patch
new file mode 100644
index 0000000..0c5cfb7
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/0008-restart-Xserver-if-killed.patch
@@ -0,0 +1,161 @@
+From ee77a3d154443d2823ecbf2141daa1b5924f629f Mon Sep 17 00:00:00 2001
+From: iwamatsu <iwamatsu@7c53e7cc-98ea-0310-8f1f-a0b24da60408>
+Date: Fri, 17 Jun 2011 20:38:34 +0000
+Subject: [PATCH 8/8] restart Xserver if killed
+
+Patch from http://developer.berlios.de/patch/?func=detailpatch&patch_id=2378&group_id=2663.
+
+Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+git-svn-id: svn://svn.berlios.de/slim/trunk@182 7c53e7cc-98ea-0310-8f1f-a0b24da60408
+---
+ app.cpp |   36 +++++++++---------------------------
+ app.h   |    2 +-
+ 2 files changed, 10 insertions(+), 28 deletions(-)
+
+diff --git a/app.cpp b/app.cpp
+index 44ab099..358a98f 100644
+--- a/app.cpp
++++ b/app.cpp
+@@ -104,6 +104,11 @@ int conv(int num_msg, const struct pam_message **msg,
+ 
+ extern App* LoginApp;
+ 
++int xioerror(Display *disp) {
++	LoginApp->RestartServer();
++    return 0;
++}
++
+ void CatchSignal(int sig) {
+     cerr << APPNAME << ": unexpected signal " << sig << endl;
+ 
+@@ -114,19 +119,6 @@ void CatchSignal(int sig) {
+     exit(ERR_EXIT);
+ }
+ 
+-
+-void AlarmSignal(int sig) {
+-    int pid = LoginApp->GetServerPID();
+-    if(waitpid(pid, NULL, WNOHANG) == pid) {
+-        LoginApp->StopServer();
+-        LoginApp->RemoveLock();
+-        exit(OK_EXIT);
+-    }
+-    signal(sig, AlarmSignal);
+-    alarm(2);
+-}
+-
+-
+ void User1Signal(int sig) {
+     signal(sig, User1Signal);
+ }
+@@ -275,7 +267,6 @@ void App::Run() {
+         signal(SIGHUP, CatchSignal);
+         signal(SIGPIPE, CatchSignal);
+         signal(SIGUSR1, User1Signal);
+-        signal(SIGALRM, AlarmSignal);
+ 
+ #ifndef XNEST_DEBUG
+         if (!force_nodaemon && cfg->getOption("daemon") == "yes") {
+@@ -297,7 +288,6 @@ void App::Run() {
+ 
+         CreateServerAuth();
+         StartServer();
+-        alarm(2);
+ #endif
+ 
+     }
+@@ -613,6 +603,8 @@ void App::Login() {
+     int status;
+     while (wpid != pid) {
+         wpid = wait(&status);
++		if (wpid == ServerPID)
++			xioerror(Dpy);	// Server died, simulate IO error
+     }
+     if (WIFEXITED(status) && WEXITSTATUS(status)) {
+         LoginPanel->Message("Failed to execute login command");
+@@ -658,9 +650,6 @@ void App::Login() {
+ 
+ 
+ void App::Reboot() {
+-    // Stop alarm clock
+-    alarm(0);
+-
+ #ifdef USE_PAM
+     try{
+         pam.end();
+@@ -683,9 +672,6 @@ void App::Reboot() {
+ 
+ 
+ void App::Halt() {
+-    // Stop alarm clock
+-    alarm(0);
+-
+ #ifdef USE_PAM
+     try{
+         pam.end();
+@@ -771,6 +757,7 @@ void App::RestartServer() {
+ 
+     StopServer(); 
+     RemoveLock();
++	while (waitpid(-1, NULL, WNOHANG) > 0); // Collects all dead childrens
+     Run();
+ } 
+ 
+@@ -841,6 +828,7 @@ int App::WaitForServer() {
+ 
+     for(cycles = 0; cycles < ncycles; cycles++) {
+         if((Dpy = XOpenDisplay(DisplayName))) {
++            XSetIOErrorHandler(xioerror);
+             return 1;
+         } else {
+             if(!ServerTimeout(1, (char *) "X server to begin accepting connections"))
+@@ -925,9 +913,6 @@ int App::StartServer() {
+             ServerPID = -1;
+             break;
+         }
+-        alarm(15);
+-        pause();
+-        alarm(0);
+ 
+         // Wait for server to start up
+         if(WaitForServer() == 0) {
+@@ -962,15 +947,12 @@ int IgnoreXIO(Display *d) {
+ 
+ 
+ void App::StopServer() {
+-    // Stop alars clock and ignore signals
+-    alarm(0);
+     signal(SIGQUIT, SIG_IGN);
+     signal(SIGINT, SIG_IGN);
+     signal(SIGHUP, SIG_IGN);
+     signal(SIGPIPE, SIG_IGN);
+     signal(SIGTERM, SIG_DFL);
+     signal(SIGKILL, SIG_DFL);
+-    signal(SIGALRM, SIG_DFL);
+ 
+     // Catch X error
+     XSetIOErrorHandler(IgnoreXIO);
+diff --git a/app.h b/app.h
+index dd7c281..2db1038 100644
+--- a/app.h
++++ b/app.h
+@@ -34,6 +34,7 @@ public:
+     ~App();
+     void Run();
+     int GetServerPID();
++    void RestartServer();
+     void StopServer();
+ 
+ 	bool serverStarted;
+@@ -49,7 +50,6 @@ private:
+     void Console();
+     void Exit();
+     void KillAllClients(Bool top);
+-    void RestartServer();
+     void ReadConfig();
+     void OpenLog();
+     void CloseLog();
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-graphics/slim/slim/Makefile.oe b/meta-oe/recipes-graphics/slim/slim/Makefile.oe
new file mode 100644
index 0000000..2ee6934
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/Makefile.oe
@@ -0,0 +1,64 @@
+# Makefile for slim - OpenEmbedded
+#######################################################
+
+
+SLIMLDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng12 -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt -lpthread
+CUSTOM=-DHAVE_SHADOW
+
+USE_PAM=1
+ifdef USE_PAM
+SLIMLDFLAGS+= -lpam
+CUSTOM+= -DUSE_PAM
+endif
+
+#######################################################
+
+NAME=slim
+VERSION=1.3.2
+
+DEFINES=-DPACKAGE=\"$(NAME)\" -DVERSION=\"$(VERSION)\" \
+		-DPKGDATADIR=\"$(PREFIX)/share/slim\" -DSYSCONFDIR=\"$(CFGDIR)\"
+
+OBJECTS=jpeg.o png.o main.o image.o numlock.o cfg.o switchuser.o app.o \
+	panel.o util.o
+ifdef USE_PAM
+OBJECTS+=PAM.o
+endif
+
+all: slim
+
+slim: $(OBJECTS)
+	$(CXX) $(OBJECTS) $(LDFLAGS) $(SLIMLDFLAGS) -o $(NAME)
+
+.cpp.o:
+	$(CXX) $(CXXFLAGS) $(DEFINES) $(CUSTOM) -c $< -o $@
+
+.c.o:
+	$(CC) $(CFLAGS) $(DEFINES) $(CUSTOM) -c $< -o $@
+
+install: slim install-theme
+	install -D -m 755 slim $(DESTDIR)$(PREFIX)/bin/slim
+	install -D -m 644 slim.1 $(DESTDIR)$(MANDIR)/man1/slim.1
+	test -e $(DESTDIR)$(CFGDIR)/slim.conf || \
+		install -D -m 644 slim.conf $(DESTDIR)$(CFGDIR)/slim.conf
+
+clean:
+	@rm -f slim *.o
+
+dist:
+	@rm -rf $(NAME)-$(VERSION)
+	@mkdir $(NAME)-$(VERSION)
+	@cp -r *.cpp *.h *.c Makefile Makefile.* COPYING ChangeLog INSTALL README TODO \
+		xinitrc.sample slim.1 THEMES themes slim.conf $(NAME)-$(VERSION)
+	@rm -rf $(NAME)-$(VERSION)/themes/.svn	$(NAME)-$(VERSION)/themes/default/.svn
+	@tar cvzf $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
+	@rm -rf $(NAME)-$(VERSION)
+
+
+install-theme:
+	install -D -m 644 themes/default/slim.theme \
+		 $(DESTDIR)$(PREFIX)/share/slim/themes/default/slim.theme
+	install -D -m 644 themes/default/panel.png \
+		 $(DESTDIR)$(PREFIX)/share/slim/themes/default/panel.png
+	install -D -m 644 themes/default/background.jpg \
+		 $(DESTDIR)$(PREFIX)/share/slim/themes/default/background.jpg
diff --git a/meta-oe/recipes-graphics/slim/slim/slim-dynwm b/meta-oe/recipes-graphics/slim/slim/slim-dynwm
new file mode 100644
index 0000000..49c9d47
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/slim-dynwm
@@ -0,0 +1,8 @@
+#!/bin/sh
+update_slim_wmlist
+if [ "x$1" = "x-nodaemon" ]; then
+  shift
+  exec slim "$@"
+else
+  slim -d "$@"
+fi
diff --git a/meta-oe/recipes-graphics/slim/slim/slim.pamd b/meta-oe/recipes-graphics/slim/slim/slim.pamd
new file mode 100644
index 0000000..80c34b1
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/slim.pamd
@@ -0,0 +1,19 @@
+# Begin /etc/pam.d/slim
+
+auth       required     pam_shells.so
+auth       include      common-auth
+auth       optional     pam_securetty.so
+auth       optional     pam_gnome_keyring.so
+
+account    required     pam_nologin.so
+account    include      common-account
+
+password   include      common-password
+
+session    include      common-session
+session    required     pam_mkhomedir.so skel=/etc/skel/ umask=0022
+session    optional     pam_lastlog.so nowtmp
+session    optional     pam_mail.so dir=/var/mail standard
+session    optional     pam_gnome_keyring.so  auto_start
+
+# End /etc/pam.d/slim
diff --git a/meta-oe/recipes-graphics/slim/slim/slim.service b/meta-oe/recipes-graphics/slim/slim/slim.service
new file mode 100644
index 0000000..341351a
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/slim.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=SLiM Simple Login Manager
+Requires=dev-tty7.device
+After=dev-tty7.device systemd-user-sessions.service
+
+[Service]
+ExecStart=/usr/bin/slim -nodaemon
+StandardOutput=syslog
+
+[Install]
+WantedBy=graphical.target
diff --git a/meta-oe/recipes-graphics/slim/slim/update_slim_wmlist b/meta-oe/recipes-graphics/slim/slim/update_slim_wmlist
new file mode 100644
index 0000000..0f11653
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim/update_slim_wmlist
@@ -0,0 +1,76 @@
+#!/usr/bin/perl -w
+#
+# update_slim_wmlist, based on:
+# update_wdm_wmlist, (c) 1998 Marcelo Magallón <mmagallo@debian.org>
+# rewriten to use the x-window-manager alternative
+# modified to also use the x-session-manager alternative by Arthur Korn
+# Copyright 2000 Wichert Akkerman <wakkerma@debian.org>
+# Modified to use the freedesktop.org .desktop like kdm and gdm
+#
+# This script will read the list of installed window managers from
+# the freedesktop .desktop files in <etc>/X11/sessions/:<etc>/dm/Sessions/:
+# <share>/xsessions/
+# and update the sessions line in /etc/slim.conf.
+# BEWARE: It doesn't ask any questions about this. It just does it. It
+# takes an optional list of window managers.
+
+use strict;
+use File::DesktopEntry;
+
+my $wm_list='';
+my %desktop_files;
+
+unless (@ARGV) {
+    #my @wm_list = ('default');
+    my @wm_list;
+    foreach my $dir ('/etc/X11/sessions/','/etc/dm/Sessions/','/usr/share/xsessions/') {
+	    next unless (opendir DIR, $dir);
+	    my @files;
+	    @files = grep { /\.desktop$/ && -r "$dir/$_" } readdir(DIR);
+	    foreach my $file (@files) {
+		   push @{$desktop_files{$file}}, "$dir/$file";
+	    }
+    }
+    DESKTOP: foreach my $desktop_file (keys(%desktop_files)) {
+	    foreach my $file (@{$desktop_files{$desktop_file}}) {
+		    my $entry = File::DesktopEntry->new_from_file($file);
+		    next DESKTOP if (defined($entry->get_value('Hidden'))
+			and $entry->get_value('Hidden') eq 'true');
+		    if ($entry->get_value('Name') =~ /^gnome$/i) {
+			    push (@wm_list, 'gnome');
+		    }
+		    elsif ($entry->get_value('Name') =~ /^kde$/i) {
+			    push (@wm_list, 'kde');
+		    }
+		    elsif (defined($entry->get_value('Exec'))) {
+			    push (@wm_list, $entry->get_value('Exec'));
+		    }
+		    else { # not found, go to next file
+			    next;
+		    }
+		    # found, proceed to next destop file
+		    next DESKTOP;
+	    }
+    }
+   $wm_list = join (',', sort @wm_list) . ',custom';
+} else {
+    $wm_list = join (',', sort @ARGV);
+}
+
+open (SLIM_CONFIG_FILE, '</etc/slim.conf')
+    or die "Can't open /etc/slim.conf for reading: $!";
+open (NEW_SLIM_CONFIG_FILE, '>/etc/slim.conf.new')
+    or die "Can't open /etc/slim.conf.new for writing: $!";
+
+while (<SLIM_CONFIG_FILE>) {
+    s|^(sessions\s*).*|$1$wm_list|;
+    print NEW_SLIM_CONFIG_FILE;
+}
+
+close(SLIM_CONFIG_FILE);
+close(NEW_SLIM_CONFIG_FILE);
+
+rename '/etc/slim.conf.new', '/etc/slim.conf'
+    or die "Can't rename /etc/slim.conf.new: $!";
+
+exit 0;
diff --git a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
new file mode 100644
index 0000000..1ae8dbb
--- /dev/null
+++ b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
@@ -0,0 +1,82 @@
+DESCRIPTION="Simple Login Manager"
+HOMEPAGE="http://slim.berlios.de"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "r1"
+
+DEPENDS = "virtual/libx11 libxmu libpng jpeg freetype sessreg ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SRC_URI = " \
+    http://download.berlios.de/${BPN}/${BP}.tar.gz \
+    file://0002-Fix-image-handling-integer-overflows.patch \
+    file://0003-Fix-build-failure-with-ld-as-needed.patch \
+    file://0004-Add-support-libpng15.patch \
+    file://0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch \
+    file://0006-Remove-localhost-from-Authenticator-of-pam.patch \
+    file://0007-Fix-tty-slowness.patch \
+    file://0008-restart-Xserver-if-killed.patch \
+    file://slim-dynwm \
+    file://update_slim_wmlist \
+    file://Makefile.oe \
+    file://slim.pamd \
+    file://slim.service \
+"
+
+SRC_URI[md5sum] = "ca1ae6120e6f4b4969f2d6cf94f47b42"
+SRC_URI[sha256sum] = "f1560125005f253b9b88220598fed7a9575ef405716862c6ca3fcc72dbd482b8"
+
+
+EXTRA_OEMAKE += " \
+    USE_PAM=${@base_contains('DISTRO_FEATURES', 'pam', '1', '0', d)} \
+    PREFIX=${prefix} \
+    CFGDIR=${sysconfdir} \
+    MANDIR=${mandir} \
+    DESTDIR=${D} \
+    CFLAGS+=-I${STAGING_INCDIR}/freetype2 \
+    CXXFLAGS+=-I${STAGING_INCDIR}/freetype2 \
+"
+
+do_compile_prepend() {
+    cp -pP ${WORKDIR}/Makefile.oe ${S}/Makefile
+}
+
+do_install() {
+    oe_runmake install
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/slim-dynwm ${D}${bindir}/
+    install -m 0755 ${WORKDIR}/update_slim_wmlist ${D}${bindir}/
+    install -d ${D}${sysconfdir}/pam.d/
+    install -m 0644 ${WORKDIR}/slim.pamd ${D}${sysconfdir}/pam.d/slim
+
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system/
+
+    echo 'sessionstart_cmd    /usr/bin/sessreg -a -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf
+    echo 'sessionstop_cmd     /usr/bin/sessreg -d -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf
+}
+
+
+RDEPENDS_${PN} = "perl xauth freetype sessreg "
+FILES_${PN} += "${systemd_unitdir}/system/"
+
+pkg_postinst_${PN} () {
+if test "x$D" != "x"; then
+    exit 1
+fi
+systemctl enable slim.service
+
+# Register SLiM as default DM
+mkdir -p ${sysconfdir}/X11/
+echo "${bindir}/slim" > ${sysconfdir}/X11/default-display-manager
+}
+
+pkg_postrm_${PN} () {
+if test "x$D" != "x"; then
+    exit 1
+fi
+systemctl disable slim.service
+sed -i /slim/d $D${sysconfdir}/X11/default-display-manager || true
+}
+
+PNBLACKLIST[slim] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
diff --git a/meta-oe/recipes-support/fftw/benchfft_3.1.bb b/meta-oe/recipes-support/fftw/benchfft_3.1.bb
new file mode 100644
index 0000000..d859386
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/benchfft_3.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "FFTW benchmarks"
+SECTION = "libs"
+LICENSE = "GPLv2"
+
+# single precision fftw is called fftwf 
+DEPENDS = "virtual/fftw"
+
+SRC_URI = "http://www.fftw.org/benchfft/benchfft-${PV}.tar.gz"
+
+EXTRA_OECONF = "--disable-fortran --enable-single --enable-shared"
+
+inherit autotools pkgconfig
+
+do_compile_prepend() {
+    sed -i -e 's:all-recursive:$(RECURSIVE_TARGETS):g' ${S}/Makefile
+}
+
+SRC_URI[md5sum] = "9356e5e9dcb3f1481977009720a2ccf8"
+SRC_URI[sha256sum] = "1b4a5b5e48ad5e61a21586b7b59d5c0a88691a981e73e2c6dc5868197461791b"
+
+PNBLACKLIST[benchfft] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
diff --git a/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb b/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
deleted file mode 100644
index feb3c3c..0000000
--- a/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "FFTW benchmarks"
-SECTION = "libs"
-LICENSE = "GPLv2"
-
-# single precision fftw is called fftwf 
-DEPENDS = "virtual/fftw"
-
-SRC_URI = "http://www.fftw.org/benchfft/benchfft-${PV}.tar.gz"
-
-EXTRA_OECONF = "--disable-fortran --enable-single --enable-shared"
-
-inherit autotools pkgconfig
-
-do_compile_prepend() {
-    sed -i -e 's:all-recursive:$(RECURSIVE_TARGETS):g' ${S}/Makefile
-}
-
-SRC_URI[md5sum] = "9356e5e9dcb3f1481977009720a2ccf8"
-SRC_URI[sha256sum] = "1b4a5b5e48ad5e61a21586b7b59d5c0a88691a981e73e2c6dc5868197461791b"
-- 
2.6.0


