Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D589372782
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:09:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45411894"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Dec 2014 16:06:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBI89AJo024206
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 16:09:10 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Dec 2014 16:09:47 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Dec 2014 16:09:21 +0800
Message-ID: <1418890161-30095-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-networking][PATCH] dnrd: Add new recipe
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
X-List-Received-Date: Thu, 18 Dec 2014 08:09:44 -0000
Content-Type: text/plain

dnrd is a proxying nameserver. It forwards DNS queries to the appropriate
nameserver, but can also act as the primary nameserver for a subnet behind
a firewall. It also has features such as caching DNS requests, support for
DNS servers, cache poisoning prevention, TCP support, etc.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/dnrd/dnrd/dnrd.conf.sample     | 21 +++++
 .../recipes-daemons/dnrd/dnrd/dnrd.init            | 94 ++++++++++++++++++++++
 .../recipes-daemons/dnrd/dnrd/dnrd.service         | 12 +++
 .../recipes-daemons/dnrd/dnrd_2.20.3.bb            | 39 +++++++++
 4 files changed, 166 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample
 create mode 100644 meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init
 create mode 100644 meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service
 create mode 100644 meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb

diff --git a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample
new file mode 100644
index 0000000..d9f6b3d
--- /dev/null
+++ b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample
@@ -0,0 +1,21 @@
+# options to dnrd
+
+# example: two default dns servers and dns servers for exampledomain.com. The
+# latter are load balanced (-b)
+#
+# 
+
+# DNRD_OPTS="
+# -s XXX.XXX.XX.XXX 
+# -s XXX.XXX.XX.XXX
+# -b
+# -s XXX.XXX.XX.XXX:exampledomain.com
+# -s XXX.XXX.XX.XXX:exampledomain.com"
+
+# example: dnrd user
+#
+
+# DNRD_USER="user"
+#
+
+
diff --git a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init
new file mode 100644
index 0000000..73289a9
--- /dev/null
+++ b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init
@@ -0,0 +1,94 @@
+#!/bin/sh
+#
+# Startup script for dnrd
+#
+#       Copyright 2008, Rakesh Pandit <rakesh.pandit@gmail.com>
+# 
+#       This source is free software; you can redistribute it and/or modify
+#       it under the terms of the GNU General Public License as published by
+#       the Free Software Foundation; either version 2, or (at your option)
+#       any later version.
+
+#       This source is distributed in the hope that it will be useful,
+#       but WITHOUT ANY WARRANTY; without even the implied warranty of
+#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#       GNU General Public License for more details.
+
+#       You should have received a copy of the GNU General Public License
+#       along with this program; if not, write to the Free Software
+#       Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+#
+# chkconfig: - 85 15
+# description: dnrd is a proxying nameserver. It forwards DNS queries to the
+# appropriate nameserver, but can also act as the primary nameserver for
+# a subnet behind a firewall. It also has features such as caching DNS
+# requests, support for DNS servers, cache poisoning prevention, TCP
+# support, etc..
+
+# processname: dnrd
+# pidfile: /var/run/dnrd.pid
+# config: /etc/dnrd/dnrd.conf
+
+# Provides:          dnrd
+# Required-Start:
+# Should-Start:
+# Required-Stop:
+# Default-Stop:      0 1 2 6
+# Short-Description: Start dnrd daemon
+# Description:       Domain Name Relay Daemon
+# END INIT INFO
+
+exe=/usr/sbin/dnrd
+pfile=/etc/passwd
+
+# Source function library.
+. /etc/init.d/functions
+
+# Source conf file
+. /etc/dnrd/dnrd.conf
+
+[ -x $exe ] || exit 1 
+[ -r "/etc/dnrd/dnrd.conf" ] || exit 1
+if [ $DNRD_USER ]
+then
+         grep "^${LOGIN}:" $pfile >/dev/null 2>&1
+         if [ $? -eq 0 ];then
+                 echo "$DNRD_USER specified in /etc/dnrd/dnrd.conf does not exist!"
+         fi
+else
+        echo "DNRD_USER not set at /etc/dnrd/dnrd.conf!"
+        exit 1
+fi
+
+case "$1" in
+  start)
+        echo -n "Starting  dnrd: "
+        daemon  dnrd $DNRD_OPTS -u $DNRD_USER
+        echo
+        touch /var/lock/subsys/dnrd
+        ;;
+  stop)
+        echo -n "Shutting down dnrd: "
+        killproc dnrd
+        echo
+        rm -f /var/lock/subsys/dnrd
+        rm -f /var/run/dnrd.pid
+        ;;
+  status)
+        status dnrd
+        ;;
+  restart)
+        $0 stop
+        $0 start
+        ;;
+  reload)
+        echo -n "Reloading dnrd: "
+        killproc dnrd -HUP
+        echo
+        ;;
+  *)
+        echo "Usage: $0 {start|stop|restart|reload|status}"
+        exit 1
+esac
+
+exit 0
diff --git a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service
new file mode 100644
index 0000000..9c9fa66
--- /dev/null
+++ b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Domain Name Relay Daemon
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/dnrd.pid
+EnvironmentFile=/etc/dnrd/dnrd.conf
+ExecStart=/usr/sbin/dnrd $DNRD_OPTS -u $DNRD_USER
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
new file mode 100644
index 0000000..85a58cc
--- /dev/null
+++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
@@ -0,0 +1,39 @@
+SUMMARY = "A caching, forwarding DNS proxy server"
+DESCRIPTION = "\
+dnrd is a proxying nameserver. It forwards DNS queries to the appropriate \
+nameserver, but can also act as the primary nameserver for a subnet behind \
+a firewall. It also has features such as caching DNS requests, support for \
+DNS servers, cache poisoning prevention, TCP support, etc.."
+HOMEPAGE = "http://dnrd.sourceforge.net/"
+SECTION = "System Environment/Daemons"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0be67017f1c770313ad7b40e18d568f1"
+
+SRC_URI = "http://ncu.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz \
+           file://dnrd.service \
+           file://dnrd.conf.sample \
+           file://dnrd.init"
+SRC_URI[md5sum] = "41c9b070aae8ed403fc8c2aac7ab157c"
+SRC_URI[sha256sum] = "aa46e7f8736b88c1d752cf606b3990041221ce91d014e955c6b02eb2167db015"
+
+SYSTEMD_SERVICE_${PN} = "dnrd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+inherit autotools
+inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+
+do_install() {
+    oe_runmake install DESTDIR=${D} INSTALL="install -p"
+
+    sed -i -e 's:/etc/rc.d/init.d/functions:/etc/init.d/functions:g' \
+        ${WORKDIR}/dnrd.init
+    install -d -m 0755 ${D}${sysconfdir}/init.d
+    install -d -m 0755 ${D}${sysconfdir}/dnrd
+    install -p -m 0644 ${WORKDIR}/dnrd.conf.sample ${D}${sysconfdir}/dnrd/dnrd.conf
+    install -p -m 0755 ${WORKDIR}/dnrd.init ${D}${sysconfdir}/init.d/dnrd
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d -m 0755 ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/dnrd.service ${D}${systemd_unitdir}/system
+    fi
+}
-- 
1.8.3.1


