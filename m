Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-yk0-f194.google.com (mail-yk0-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id D52CC75F3A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 00:18:47 +0000 (UTC)
Received: by ykdg206 with SMTP id g206so18481433ykd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 17:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Srgdx0Zl3FOUUteirnEG3FWxJlapBvXnlgKUxCR7Zxs=;
	b=LE5Po4WA+1E5A8jFPYsWfGrpBmleKNfkNWgLmcWlvSmXcySY1hiG+TmychC8FDrIkQ
	XxO5ROEfd+pUnpm9BlClIjuioApkW7GdZ8gy0PTZxhNrZwokuaLxpuaG4Lob8/t6TUwd
	/Vo6eH7qz0K7NRYj/Fon40ICJUVXEdpKeNW5f4i8wDEADhCUum1jcrFWCzCPtaCG6O1X
	iEnLCxARn/5s6ZDjigzTQiqFL2mXh2pIy3WXPHge4iyV9K2K1aFM/OG+jWUuFZzeQJyw
	twPtGVTt99gTPF5Xm1s5kzGDk1wLn2ErO8GOCkFVOpVrfIBcFF0zJ/MkE3ekBl7TzY31
	3Wog==
X-Gm-Message-State: ALoCoQnbhu6LeG41CbTFOckxrxiGdJKCuHcwTeT6u9JnvOm9ge07TMg9ElCl/08VkqZLPKOLY2rM
X-Received: by 10.170.216.87 with SMTP id i84mr22762520ykf.91.1442362727173;
	Tue, 15 Sep 2015 17:18:47 -0700 (PDT)
Received: from localhost.localdomain ([201.22.227.56])
	by smtp.gmail.com with ESMTPSA id
	y2sm14431600ywf.51.2015.09.15.17.18.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Sep 2015 17:18:46 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Sep 2015 21:11:59 -0300
Message-Id: <1442362319-21396-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-networking][PATCH v3] lldpd: Add recipe
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
X-List-Received-Date: Wed, 16 Sep 2015 00:18:51 -0000

lldpd is a 802.1AB implementation, a L2 network discovery protocol.
It also supports CDP, EDP and various other protocols.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../lldpd/files/fix-libevent-configure.patch       |  39 +++++++
 .../recipes-daemons/lldpd/files/lldpd.default      |   2 +
 .../recipes-daemons/lldpd/files/lldpd.init.d       | 130 +++++++++++++++++++++
 .../recipes-daemons/lldpd/lldpd_0.7.17.bb          |  68 +++++++++++
 4 files changed, 239 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/lldpd.default
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/lldpd.init.d
 create mode 100644 meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb

diff --git a/meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch b/meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch
new file mode 100644
index 0000000..42d6b29
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Submitted [https://github.com/vincentbernat/lldpd/issues/133]
+
+Subject: [PATCH] fix libevent configure
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ m4/libevent.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/libevent.m4 b/m4/libevent.m4
+index 275e5a5..dcd3309 100644
+--- a/m4/libevent.m4
++++ b/m4/libevent.m4
+@@ -45,13 +45,11 @@ AC_DEFUN([lldp_CHECK_LIBEVENT], [
+         AC_MSG_ERROR([*** libevent not found])
+       fi
+     ])
+-  fi
+ 
+   if test x"$LIBEVENT_EMBEDDED" != x; then
+     unset LIBEVENT_LIBS
+     LIBEVENT_CFLAGS="-I\$(top_srcdir)/libevent/include -I\$(top_builddir)/libevent/include"
+     LIBEVENT_LDFLAGS="\$(top_builddir)/libevent/libevent.la"
+-  fi
+ 
+   # Call ./configure in libevent. Need it for make dist...
+   libevent_configure_args="$libevent_configure_args --disable-libevent-regress"
+@@ -64,6 +62,8 @@ AC_DEFUN([lldp_CHECK_LIBEVENT], [
+   libevent_configure_args="$libevent_configure_args --with-pic"
+   libevent_configure_args="$libevent_configure_args --enable-static"
+   lldp_CONFIG_SUBDIRS([libevent], [$libevent_configure_args])
++  fi
++  fi
+ 
+   AM_CONDITIONAL([LIBEVENT_EMBEDDED], [test x"$LIBEVENT_EMBEDDED" != x])
+   AC_SUBST([LIBEVENT_LIBS])
+-- 
+2.1.4
+
diff --git a/meta-networking/recipes-daemons/lldpd/files/lldpd.default b/meta-networking/recipes-daemons/lldpd/files/lldpd.default
new file mode 100644
index 0000000..3acacfd
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/lldpd.default
@@ -0,0 +1,2 @@
+# Uncomment to start SNMP subagent and enable CDP, SONMP and EDP protocol
+#DAEMON_ARGS="-x -c -s -e"
diff --git a/meta-networking/recipes-daemons/lldpd/files/lldpd.init.d b/meta-networking/recipes-daemons/lldpd/files/lldpd.init.d
new file mode 100644
index 0000000..2d88d25
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/lldpd.init.d
@@ -0,0 +1,130 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          lldpd
+# Required-Start:    $remote_fs $network $syslog
+# Required-Stop:     $network $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: LLDP daemon
+# Description:       lldpd is a 802.1AB implementation, a L2 network
+#                    discovery protocol. It also supports CDP, EDP and
+#                    various other protocols.
+### END INIT INFO
+
+# Do NOT "set -e"
+
+log_daemon_msg() {
+    echo $*
+}
+
+log_end_msg() {
+    if [ $1 -eq 0 ]; then
+        success $*
+    else
+        failure $*
+    fi
+}
+
+log_failure_msg() {
+    echo $*
+}
+
+log_success_msg() {
+    echo $*
+}
+
+
+# PATH should only include /usr/* if it runs after the mountnfs.sh script
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+DESC="LLDP daemon"
+NAME=lldpd
+DAEMON=/usr/sbin/$NAME
+DAEMON_ARGS=""
+PIDFILE=/var/run/$NAME.pid
+SCRIPTNAME=/etc/init.d/$NAME
+CHROOT=/var/run/$NAME
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+
+# LSB log_* functions
+. /etc/init.d/functions
+
+do_start()
+{
+	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --test > /dev/null \
+		|| return 1
+	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- \
+		$DAEMON_ARGS \
+		|| return 2
+}
+
+do_stop()
+{
+	start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --name $NAME
+	RETVAL="$?"
+	[ "$RETVAL" = 2 ] && return 2
+	start-stop-daemon --stop --quiet --oknodo --retry=0/30/KILL/5 --exec $DAEMON
+	[ "$?" = 2 ] && return 2
+	rm -f $PIDFILE
+	return "$RETVAL"
+}
+
+do_reload() {
+	start-stop-daemon --stop --signal 1 --quiet --pidfile $PIDFILE --name $NAME
+	return 0
+}
+
+case "$1" in
+  start)
+	[ "$VERBOSE" != no ] && log_daemon_msg "Starting $DESC" "$NAME"
+	do_start
+	case "$?" in
+		0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
+		2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
+	esac
+	;;
+  stop)
+	[ "$VERBOSE" != no ] && log_daemon_msg "Stopping $DESC" "$NAME"
+	do_stop
+	case "$?" in
+		0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
+		2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
+	esac
+	;;
+  reload)
+	log_daemon_msg "Reloading $DESC" "$NAME"
+	do_reload
+	log_end_msg $?
+	;;
+  restart|force-reload)
+	log_daemon_msg "Restarting $DESC" "$NAME"
+	do_stop
+	case "$?" in
+	  0|1)
+		do_start
+		case "$?" in
+			0) log_end_msg 0 ;;
+			1) log_end_msg 1 ;; # Old process is still running
+			*) log_end_msg 1 ;; # Failed to start
+		esac
+		;;
+	  *)
+	  	# Failed to stop
+		log_end_msg 1
+		;;
+	esac
+	;;
+  status)
+	status_of_proc $DAEMON $NAME -p $PIDFILE && exit 0 || exit $?
+	;;
+  *)
+	echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload|status}" >&2
+	exit 3
+	;;
+esac
+
+:
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
new file mode 100644
index 0000000..47d3c38
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
@@ -0,0 +1,68 @@
+SUMMARY = "A 802.1ab implementation (LLDP) to help you locate neighbors of all your equipments"
+SECTION = "net/misc"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e78ea0cffb20bf5cca7947a896d"
+
+DEPENDS = "libbsd libevent"
+
+SRC_URI = "\
+    http://media.luffy.cx/files/${PN}/${PN}-${PV}.tar.gz \
+    file://lldpd.init.d \
+    file://lldpd.default \
+    file://fix-libevent-configure.patch \
+    "
+
+SRC_URI[md5sum] = "8cb74065956bc32a575ee5203b0e0fb5"
+SRC_URI[sha256sum] = "6b50b8aa47d1424a93ba3df55af26da41f7d5718db8d25e99291c4a6cd09c20e"
+
+inherit autotools update-rc.d useradd systemd pkgconfig
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system -g lldpd --shell /bin/false lldpd"
+GROUPADD_PARAM_${PN} = "--system lldpd"
+
+EXTRA_OECONF += "--without-embedded-libevent \
+                 --disable-oldies \
+                 --with-privsep-user=lldpd \
+                 --with-privsep-group=lldpd"
+
+PACKAGECONFIG ??= "cdp fdp edp sonmp lldpmed dot1 dot3"
+PACKAGECONFIG[json] = "--with-json,--without-json,jansson"
+PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxm2"
+PACKAGECONFIG[snmp] = "--with-snmp,--without-snmp,net-snmp"
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+PACKAGECONFIG[seccomp] = "--with-seccomp,--without-seccomp,libseccomp"
+PACKAGECONFIG[cdp] = "--enable-cdp,--disable-cdp"
+PACKAGECONFIG[fdp] = "--enable-fdp,--disable-fdp"
+PACKAGECONFIG[edp] = "--enable-edp,--disable-edp"
+PACKAGECONFIG[sonmp] = "--enable-sonmp,--disable-sonmp"
+PACKAGECONFIG[lldpmed] = "--enable-lldpmed,--disable-lldpmed"
+PACKAGECONFIG[dot1] = "--enable-dot1,--disable-dot1"
+PACKAGECONFIG[dot3] = "--enable-dot3,--disable-dot3"
+PACKAGECONFIG[custom] = "--enable-custom,--disable-custom"
+
+INITSCRIPT_NAME = "lldpd"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_SERVICE_${PN} = "lldpd.service"
+
+do_install_append() {
+    install -Dm 0755 ${WORKDIR}/lldpd.init.d ${D}${sysconfdir}/init.d/lldpd
+    install -Dm 0644 ${WORKDIR}/lldpd.default ${D}${sysconfdir}/default/lldpd
+    # Make an empty configuration file
+    touch ${D}${sysconfdir}/lldpd.conf
+}
+
+PACKAGES =+ "${PN}-bash-completion ${PN}-zsh-completion"
+
+FILES_${PN} += "${libdir}/sysusers.d"
+RDEPENDS_${PN} += "os-release"
+
+FILES_${PN}-bash-completion += "${sysconfdir}/bash_completion.d/ \
+                                ${datadir}/bash-completion/ \
+                                "
+RDEPENDS_${PN}-bash-completion += "bash"
+
+FILES_${PN}-zsh-completion += "${datadir}/zsh/"
+# FIXME: zsh is broken in meta-oe so this cannot be enabled for now
+#RDEPENDS_${PN}-zsh-completion += "zsh"
-- 
2.1.4


