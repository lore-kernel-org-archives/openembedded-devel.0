Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 28CEC75CF1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 21:24:05 +0000 (UTC)
Received: by qgez77 with SMTP id z77so15621006qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 14:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BAESuQlU4xrAbon436Ri+zNYF19haPjqvX4iM6I2Hag=;
	b=VvR+7r/farkNMS++GyPA0wY1yvdxt6TbYz3EmY9rysRj+3q1FAychde2p8GhKlGxp8
	yIK/7m+/RvuurHwal8DY9b+xinPJ8v9RNuigeCW8916s4H2+YZKmGMikzkCZgHXcoBuK
	c64AyNQNSFHF0QZAMUxjz4yKiU2StNwD8fmdIk5yXIX7cnkPiUGJHJRoQQeL/G9umUAP
	6iHD2uwqvG1v9Ix4aL7uRyqlt+C8DTxvykS6xYjfGEDBsh8k3IONM6q5mwLJrOHb682c
	Qjhs5kEokdlu2Pq5OEtllxJMDArIxKgIRNy5t8oQjtl+43Fg64h25ZJTu5MFs4kJKjbQ
	IBzw==
X-Gm-Message-State: ALoCoQm2zJTC8cbM2SBeXyZSJv5GMsaSFbLszoz1k17tQGKOHTGCVl7cQiX72KlDK4lkQhgW5NKt
X-Received: by 10.140.234.195 with SMTP id f186mr38323682qhc.25.1442352245882; 
	Tue, 15 Sep 2015 14:24:05 -0700 (PDT)
Received: from localhost.localdomain ([201.22.227.56])
	by smtp.gmail.com with ESMTPSA id
	n82sm8748825qkh.31.2015.09.15.14.24.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Sep 2015 14:24:04 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Sep 2015 18:23:40 -0300
Message-Id: <1442352220-16868-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-networking][PATCH v2] lldpd: Add recipe
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
X-List-Received-Date: Tue, 15 Sep 2015 21:24:09 -0000

lldpd is a 802.1AB implementation, a L2 network discovery protocol.
It also supports CDP, EDP and various other protocols.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-daemons/lldpd/files/lldpd.default      |   2 +
 .../recipes-daemons/lldpd/files/lldpd.init.d       | 130 +++++++++++++++++++++
 .../recipes-daemons/lldpd/lldpd_0.7.15.bb          |  65 +++++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/lldpd.default
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/lldpd.init.d
 create mode 100644 meta-networking/recipes-daemons/lldpd/lldpd_0.7.15.bb

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
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.15.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.15.bb
new file mode 100644
index 0000000..f68dae3
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.15.bb
@@ -0,0 +1,65 @@
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
+"
+
+SRC_URI[md5sum] = "46f7ad97fc1d04084ab11b32fc0ed708"
+SRC_URI[sha256sum] = "c891d6d4480a6a890561ac43d8cc923bd027deb82a3999d65f37d96ca368c246"
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
+FILES_${PN} += "${datadir}/zsh ${libdir}/sysusers.d"
+RDEPENDS_${PN} += "os-release"
+
+FILES_${PN}-bash-completion += "${sysconfdir}/bash_completion.d/"
+RDEPENDS_${PN}-bash-completion += "bash"
+
+FILES_${PN}-zsh-completion += "${datadir}/zsh/vendor-completions/"
+# FIXME: zsh is broken in meta-oe so this cannot be enabled for now
+#RDEPENDS_${PN}-zsh-completion += "zsh"
-- 
2.1.4


