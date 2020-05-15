Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.12108.1589545974869586212
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 05:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39948 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jZZWC-00057Z-6y; Fri, 15 May 2020 15:32:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] transmission: Add version 2.94
Date: Fri, 15 May 2020 15:32:42 +0300
Message-Id: <20200515123242.12162-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Transmission is a fast, easy, and free BitTorrent client. This
recipe provides it as a GTK+ application for X11, headless daemon
and a web user interface (UI).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...onfigure.ac-Fix-no-libsystemd-daemon.patch |  40 +++++
 .../transmission/files/transmission-daemon    | 163 ++++++++++++++++++
 .../transmission/transmission_git.bb          |  73 ++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-configure.ac-Fix-no-libsystemd-daemon.patch
 create mode 100644 meta-oe/recipes-connectivity/transmission/files/transmission-daemon
 create mode 100644 meta-oe/recipes-connectivity/transmission/transmission_git.bb

diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-configure.ac-Fix-no-libsystemd-daemon.patch b/meta-oe/recipes-connectivity/transmission/files/0001-configure.ac-Fix-no-libsystemd-daemon.patch
new file mode 100644
index 000000000..130ead084
--- /dev/null
+++ b/meta-oe/recipes-connectivity/transmission/files/0001-configure.ac-Fix-no-libsystemd-daemon.patch
@@ -0,0 +1,40 @@
+From 73ee7e68402a77287054df779f0e44ae1a4f9f0b Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 11 May 2020 17:01:35 +0000
+Subject: [PATCH] configure.ac: Fix no libsystemd-daemon
+
+Replace libsystemd-daemon with libsystemd.
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ configure.ac | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index df8cb5007..9a6fb9b2e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -249,10 +249,10 @@ AC_ARG_WITH([systemd-daemon], AS_HELP_STRING([--with-systemd-daemon],
+             [Add support for systemd startup notification (default is autodetected)]),
+             [USE_SYSTEMD_DAEMON=$withval], [USE_SYSTEMD_DAEMON=auto])
+ AS_IF([test "x$USE_SYSTEMD_DAEMON" != "xno"], [
+-    PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd-daemon],
++    PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd],
+         [AC_DEFINE(USE_SYSTEMD_DAEMON,1,[Use systemd startup notification])],
+         [AS_IF([test "x$USE_SYSTEMD_DAEMON" = "xyes"],
+-            [AC_MSG_ERROR([systemd startup notification support requested, but libsystemd-daemon not found.])]
++            [AC_MSG_ERROR([systemd startup notification support requested, but libsystemd not found.])]
+         )]
+     )
+ ])
+@@ -558,7 +558,6 @@ if test "x$enable_nls" = "xyes" ; then
+     GETTEXT_PACKAGE=transmission-gtk
+     AC_SUBST(GETTEXT_PACKAGE)
+     AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[Gettext package])
+-    AM_GLIB_GNU_GETTEXT
+     transmissionlocaledir='${prefix}/${DATADIRNAME}/locale'
+     AC_SUBST(transmissionlocaledir)
+ fi
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/transmission/files/transmission-daemon b/meta-oe/recipes-connectivity/transmission/files/transmission-daemon
new file mode 100644
index 000000000..d1ffff58b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/transmission/files/transmission-daemon
@@ -0,0 +1,163 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          transmission-daemon
+# Required-Start:    networking
+# Required-Stop:     networking
+# Default-Start:     2 3 5
+# Default-Stop:      0 1 6
+# Short-Description: Start the transmission BitTorrent daemon client.
+### END INIT INFO
+
+# Original Author: Lennart A. JÃŒtte, based on Rob Howell's script
+# Modified by Maarten Van Coile & others (on IRC)
+
+# Do NOT "set -e"
+
+#
+# ----- CONFIGURATION -----
+#
+# For the default location Transmission uses, visit:
+# http://trac.transmissionbt.com/wiki/ConfigFiles
+# For a guide on how set the preferences, visit:
+# http://trac.transmissionbt.com/wiki/EditConfigFiles
+# For the available environement variables, visit:
+# http://trac.transmissionbt.com/wiki/EnvironmentVariables
+#
+# The name of the user that should run Transmission.
+# It's RECOMENDED to run Transmission in it's own user,
+# by default, this is set to 'transmission'.
+# For the sake of security you shouldn't set a password
+# on this user
+USERNAME=transmission
+
+
+# ----- *ADVANCED* CONFIGURATION -----
+# Only change these options if you know what you are doing!
+#
+# The folder where Transmission stores the config & web files.
+# ONLY change this you have it at a non-default location
+#TRANSMISSION_HOME="/var/config/transmission-daemon"
+#TRANSMISSION_WEB_HOME="/usr/share/transmission/web"
+#
+# The arguments passed on to transmission-daemon.
+# ONLY change this you need to, otherwise use the
+# settings file as per above.
+#TRANSMISSION_ARGS=""
+
+
+# ----- END OF CONFIGURATION -----
+#
+# PATH should only include /usr/* if it runs after the mountnfs.sh script.
+PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
+DESC="bittorrent client"
+NAME=transmission-daemon
+DAEMON=$(which $NAME)
+PIDFILE=/var/run/$NAME.pid
+SCRIPTNAME=/etc/init.d/$NAME
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+
+# Load the VERBOSE setting and other rcS variables
+[ -f /etc/default/rcS ] && . /etc/default/rcS
+
+#
+# Function that starts the daemon/service
+#
+
+do_start()
+{
+    # Export the configuration/web directory, if set
+    if [ -n "$TRANSMISSION_HOME" ]; then
+          export TRANSMISSION_HOME
+    fi
+    if [ -n "$TRANSMISSION_WEB_HOME" ]; then
+          export TRANSMISSION_WEB_HOME
+    fi
+
+    # Return
+    #   0 if daemon has been started
+    #   1 if daemon was already running
+    #   2 if daemon could not be started
+    start-stop-daemon --chuid $USERNAME --start --pidfile $PIDFILE --make-pidfile \
+            --exec $DAEMON --background --test -- -f $TRANSMISSION_ARGS > /dev/null \
+            || return 1
+    start-stop-daemon --chuid $USERNAME --start --pidfile $PIDFILE --make-pidfile \
+            --exec $DAEMON --background -- -f $TRANSMISSION_ARGS \
+            || return 2
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop()
+{
+        # Return
+        #   0 if daemon has been stopped
+        #   1 if daemon was already stopped
+        #   2 if daemon could not be stopped
+        #   other if a failure occurred
+        start-stop-daemon --stop --quiet --retry=TERM/10/KILL/5 --pidfile $PIDFILE --exec $DAEMON 
+        RETVAL="$?"
+        [ "$RETVAL" = 2 ] && return 2
+
+        # Wait for children to finish too if this is a daemon that forks
+        # and if the daemon is only ever run from this initscript.
+        # If the above conditions are not satisfied then add some other code
+        # that waits for the process to drop all resources that could be
+        # needed by services started subsequently.  A last resort is to
+        # sleep for some time.
+
+        start-stop-daemon --stop --quiet --oknodo --retry=0/30/KILL/5 --exec $DAEMON
+        [ "$?" = 2 ] && return 2
+
+        # Many daemons don't delete their pidfiles when they exit.
+        rm -f $PIDFILE
+
+        return "$RETVAL"
+}
+
+case "$1" in
+  start)
+        echo "Starting $DESC" "$NAME..."
+        do_start
+        case "$?" in
+                0|1) echo "   Starting $DESC $NAME succeeded" ;;
+                *)   echo "   Starting $DESC $NAME failed" ;;
+        esac
+        ;;
+  stop)
+        echo "Stopping $DESC $NAME..."
+        do_stop
+        case "$?" in
+                0|1) echo "   Stopping $DESC $NAME succeeded" ;;
+                *)   echo "   Stopping $DESC $NAME failed" ;;
+        esac
+        ;;
+  restart|force-reload)
+        #
+        # If the "reload" option is implemented then remove the
+        # 'force-reload' alias
+        #
+        echo "Restarting $DESC $NAME..."
+        do_stop
+        case "$?" in
+          0|1)
+                do_start
+                case "$?" in
+                    0|1) echo "   Restarting $DESC $NAME succeeded" ;;
+                    *)   echo "   Restarting $DESC $NAME failed: couldn't start $NAME" ;;
+                esac
+                ;;
+          *)
+                echo "   Restarting $DESC $NAME failed: couldn't stop $NAME" ;;
+        esac
+        ;;
+  *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        exit 3
+        ;;
+esac
diff --git a/meta-oe/recipes-connectivity/transmission/transmission_git.bb b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
new file mode 100644
index 000000000..ee5578f8b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
@@ -0,0 +1,73 @@
+DESCRIPTION = "Transmission is a fast, easy, and free BitTorrent client"
+SECTION = "network"
+HOMEPAGE = "https://transmissionbt.com/"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0dd9fcdc1416ff123c41c785192a1895"
+
+DEPENDS = "curl libevent gnutls openssl libtool intltool-native glib-2.0-native"
+RDEPENDS_${PN}-web = "${PN}"
+
+SRC_URI = " \
+	git://github.com/transmission/transmission \
+	file://0001-configure.ac-Fix-no-libsystemd-daemon.patch \
+	file://transmission-daemon \
+"
+
+# Transmission release 2.94
+SRCREV = "d8e60ee44f4295935bd98bf741f85ed19f5a7dfb"
+PV = "2.94"
+
+S = "${WORKDIR}/git"
+
+inherit autotools gettext update-rc.d systemd mime-xdg features_check
+
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
+                 ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+
+PACKAGECONFIG[gtk] = " --with-gtk,--without-gtk,gtk+3,"
+PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd,"
+
+# Weak default values for transmission user and group
+# Change them in bbappend if needed
+TRANSMISSION_USER ??= "root"
+TRANSMISSION_GROUP ??= "root"
+
+# Configure aborts with:
+# config.status: error: po/Makefile.in.in was not created by intltoolize.
+B = "${S}"
+do_configure_prepend() {
+	sed -i /AM_GLIB_GNU_GETTEXT/d ${S}/configure.ac
+	cd ${S}
+	./update-version-h.sh
+	intltoolize --copy --force --automake
+}
+
+do_install_append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		sed -i '/USERNAME=/c\USERNAME=${TRANSMISSION_USER}' ${WORKDIR}/transmission-daemon
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0744 ${WORKDIR}/transmission-daemon ${D}${sysconfdir}/init.d/
+		chown ${TRANSMISSION_USER}:${TRANSMISSION_GROUP} ${D}${sysconfdir}/init.d/transmission-daemon
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		sed -i '/User=/c\User=${TRANSMISSION_USER}' ${S}/daemon/transmission-daemon.service
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${S}/daemon/transmission-daemon.service ${D}${systemd_unitdir}/system
+	fi
+}
+
+PACKAGES += "${PN}-gtk ${PN}-client ${PN}-web"
+
+FILES_${PN}-client = "${bindir}/transmission-remote ${bindir}/transmission-cli ${bindir}/transmission-create ${bindir}/transmission-show ${bindir}/transmission-edit"
+FILES_${PN}-gtk += "${bindir}/transmission-gtk ${datadir}/icons ${datadir}/applications ${datadir}/pixmaps"
+FILES_${PN}-web = "${datadir}/transmission/web"
+FILES_${PN} = "${bindir}/transmission-daemon ${sysconfdir}/init.d/transmission-daemon"
+
+SYSTEMD_SERVICE_${PN} = "transmission-daemon.service"
+
+# Script transmission-daemon following the guidelines in:
+# https://trac.transmissionbt.com/wiki/Scripts/initd
+INITSCRIPT_PACKAGES = "transmission-daemon"
+INITSCRIPT_NAME = "transmission-daemon"
+INITSCRIPT_PARAMS = "start 99 5 3 2 . stop 10 0 1 6 ."
-- 
2.17.1

