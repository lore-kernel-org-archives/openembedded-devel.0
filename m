Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-yk0-f196.google.com (mail-yk0-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2CAAE75E80
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:23:59 +0000 (UTC)
Received: by ykdt18 with SMTP id t18so4832396ykd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6GGK4NKa5jmBkTd7yQbcP4jpQHmwqqWUfGKRonyia/s=;
	b=idhSelwKBs7C9M125DQnw4vgOXeZMZ1g0yr3G+6iAtRARp2WgTs8jDU8kTCNdQRQKq
	hu1Mxnu+A0CR/L14JwQOgN1fB5KkUBxwwjUVXabsBjT9SIEPEla0qR92BNcLgnGG/7+d
	oCrzjlyTKFEX3p2m85gvBDmwbLUj+JbgigcrQM2+Vq4uutm6FNSvPN9s0n4+HCpByST2
	AFtY6xqisjsxIc5uds+oSYO4g1XORBbK31E2mXIvFCJZ4+g2xo+WXG48FMgH7tlBa/Il
	Aj6RT3GOJKapNxq+EmrHAuJeCzR1mbd1BAQtrpQN0DPE0IMC1Vn8UAhSQahKh+1A1/cb
	mALQ==
X-Gm-Message-State: ALoCoQmU8OtUQ/u5DYYPfpxmmYcRjkHILUIpguk9mKkd05hOIHuKbd6HWdznbVeSHRGM63Iniw2F
X-Received: by 10.13.236.204 with SMTP id v195mr5171569ywe.75.1442597039693;
	Fri, 18 Sep 2015 10:23:59 -0700 (PDT)
Received: from localhost.localdomain ([201.22.227.56])
	by smtp.gmail.com with ESMTPSA id p6sm6161886ywe.44.2015.09.18.10.23.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Sep 2015 10:23:58 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Sep 2015 14:23:35 -0300
Message-Id: <1442597015-25648-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-networking][PATCH v4] lldpd: Add recipe
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
X-List-Received-Date: Fri, 18 Sep 2015 17:24:00 -0000

lldpd is a 802.1AB implementation, a L2 network discovery protocol.
It also supports CDP, EDP and various other protocols.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../lldpd/files/fix-libevent-configure.patch       |  39 +++++++
 .../recipes-daemons/lldpd/files/lldpd.default      |   2 +
 .../recipes-daemons/lldpd/files/lldpd.init.d       | 128 +++++++++++++++++++++
 .../recipes-daemons/lldpd/lldpd_0.7.17.bb          |  68 +++++++++++
 4 files changed, 237 insertions(+)
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
index 0000000..88bf958
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/lldpd.init.d
@@ -0,0 +1,128 @@
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


