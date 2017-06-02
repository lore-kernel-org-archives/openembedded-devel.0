Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF3A877E88
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 08:05:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v52852TV001227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jun 2017 01:05:06 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 2 Jun 2017 01:05:05 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Jun 2017 16:04:57 +0800
Message-ID: <5a2df0a943307252298ea8d2d6d6ba47882f3a45.1496390474.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496390474.git.jackie.huang@windriver.com>
References: <cover.1496390474.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] umip: add systemd and sysvinit support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Jun 2017 08:05:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add systemd service and and sysvinit script
so it's easy to manage the mip6d daemon.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-connectivity/umip/files/mip6d      | 112 +++++++++++++++++++++
 .../recipes-connectivity/umip/files/mip6d.service  |  10 ++
 meta-oe/recipes-connectivity/umip/umip_1.0.bb      |  18 +++-
 3 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100755 meta-oe/recipes-connectivity/umip/files/mip6d
 create mode 100644 meta-oe/recipes-connectivity/umip/files/mip6d.service

diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d b/meta-oe/recipes-connectivity/umip/files/mip6d
new file mode 100755
index 000000000..ebd70a6cc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/umip/files/mip6d
@@ -0,0 +1,112 @@
+#!/bin/sh
+#
+# mip6d		Start script for the Mobile IPv6 daemon
+#
+# chkconfig:	- 55 25
+# description:	The mobile IPv6 daemon allows nodes to remain \
+#		reachable while moving around in the IPv6 Internet.
+# processname:	mip6d
+# config:	/etc/mip6d.conf
+# config:	/etc/sysconfig/mip6d
+#
+### BEGIN INIT INFO
+# Provides: mipv6-daemon
+# Required-Start: $local_fs $remote_fs $network $named
+# Required-Stop: $local_fs $remote_fs $network
+# Should-Start: $syslog
+# Should-Stop: $network $syslog
+# Default-Start:
+# Default-Stop: 0 1 6
+# Short-Description: Start and stop Mobile IPV6 daemon
+# Description:	The mobile IPv6 daemon allows nodes to remain
+#		reachable while moving around in the IPv6 Internet.
+### END INIT INFO
+
+# Source function library.
+. /etc/init.d/functions
+
+if [ -f /etc/sysconfig/mip6d ]; then
+	. /etc/sysconfig/mip6d
+fi
+
+mip6d=/usr/sbin/mip6d
+prog="mip6d"
+lockfile=/var/lock/subsys/$prog
+
+start() {
+	[ -x $mip6d ] || exit 5
+	echo -n $"Starting $prog: "
+	start-stop-daemon -S -x ${mip6d} && success || failure
+	retval=$?
+	echo
+	[ $retval -eq 0 ] && touch ${lockfile}
+	return $retval
+}
+
+stop() {
+	echo -n $"Stopping $prog: "
+	start-stop-daemon -K -x $mip6d
+	retval=$?
+	echo
+	[ $retval -eq 0 ] && rm -f ${lockfile}
+	return $retval
+}
+
+restart() {
+	stop
+	start
+}
+
+reload()
+{
+	echo -n $"Reloading $prog configuration: "
+	killproc $mip6d -HUP
+	retval=$?
+	echo
+	return $retval
+}
+
+force_reload() {
+	restart
+}
+
+rh_status() {
+	status $prog
+}
+
+rh_status_q() {
+	rh_status > /dev/null 2>&1
+}
+
+case "$1" in
+  start)
+	rh_status_q && exit 0
+	$1
+	;;
+  stop)
+	rh_status_q || exit 0
+	$1
+	;;
+  restart)
+	$1
+	;;
+  reload)
+	rh_status_q || exit 7
+	$1
+	;;
+  force-reload)
+	force_reload
+	;;
+  status)
+	rh_status
+	;;
+  condrestart|try-restart)
+	rh_status_q || exit 0
+	restart
+	;;
+  *)
+	echo $"Usage: $prog {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
+	exit 2
+esac
+
+exit $?
diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d.service b/meta-oe/recipes-connectivity/umip/files/mip6d.service
new file mode 100644
index 000000000..2b5a5b9f1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/umip/files/mip6d.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=MIPL Mobile IPv6
+After=network.target
+
+[Service]
+EnvironmentFile=-@SYSCONFDIR@/sysconfig/mip6d
+ExecStart=@SBINDIR@/mip6d $ARGS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index e97dd48f6..b8b90eb81 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -11,10 +11,26 @@ DEPENDS = "rpm indent-native"
 
 SRC_URI = "git://git.umip.org/umip.git \
     file://add-dependency-to-support-parallel-compilation.patch \
+    file://mip6d \
+    file://mip6d.service \
 "
 SRCREV = "428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"
 
 S = "${WORKDIR}/git"
 EXTRA_OE_CONF = "--enable-vt"
 
-inherit autotools-brokensep
+inherit autotools-brokensep systemd update-rc.d
+
+INITSCRIPT_NAME = "mip6d"
+INITSCRIPT_PARAMS = "start 64 . stop 36 0 1 2 3 4 5 6 ."
+
+SYSTEMD_SERVICE_${PN} = "mip6d.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install_append() {
+	install -D -m 0755 ${WORKDIR}/mip6d ${D}${sysconfdir}/init.d/mip6d
+	install -D -m 0644 ${WORKDIR}/mip6d.service ${D}${systemd_system_unitdir}/mip6d.service
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+	    -e 's,@SBINDIR@,${sbindir},g' \
+	    ${D}${systemd_system_unitdir}/mip6d.service
+}
-- 
2.11.0


