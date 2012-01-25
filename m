Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq0dP-00030F-2B
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:03:23 +0100
Received: by bkaq10 with SMTP id q10so4059907bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KfNO0033FJLUTaDJBxLv0StrRzo3F2JU7tE/zL1XR0Q=;
	b=p1M9y9Ij1wRNBZYePtY5+4w9aRmFyVF+q/T65Lgm3zN5bo5X7BxBh46sonu6T/FDSs
	SW2xmQwMZ1MmtV1r8I3oB0GIqZc9JqkrEGktgUup5h2CpOTBFtyG2Ff/4CSauBug9cUF
	mRvU4VYly8mhtH0DtYzV0EBqLaFcAto7K+9YA=
Received: by 10.205.120.138 with SMTP id fy10mr4461859bkc.118.1327488936822;
	Wed, 25 Jan 2012 02:55:36 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id cz3sm125912bkb.3.2012.01.25.02.55.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:55:36 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0Vq-0007KL-Gv; Wed, 25 Jan 2012 13:55:34 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 13:55:28 +0300
Message-Id: <1327488928-28127-3-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <1327488928-28127-1-git-send-email-yauhen.kharuzhy@promwad.com>
References: <1327488928-28127-1-git-send-email-yauhen.kharuzhy@promwad.com>
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
Subject: [PATCH 05/10] Add recipe for conntrack-tools 1.0.0
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
X-List-Received-Date: Wed, 25 Jan 2012 11:03:23 -0000

Recipe for this package has been taken from Openembedded-classic project.

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 .../conntrack-tools/conntrack-tools_1.0.0.bb       |   27 +++++++
 .../conntrack-tools/files/conntrack-failover       |   77 ++++++++++++++++++++
 .../conntrack-tools/files/init                     |   77 ++++++++++++++++++++
 3 files changed, 181 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/conntrack-tools/conntrack-tools_1.0.0.bb
 create mode 100644 meta/recipes-connectivity/conntrack-tools/files/conntrack-failover
 create mode 100644 meta/recipes-connectivity/conntrack-tools/files/init

diff --git a/meta/recipes-connectivity/conntrack-tools/conntrack-tools_1.0.0.bb b/meta/recipes-connectivity/conntrack-tools/conntrack-tools_1.0.0.bb
new file mode 100644
index 0000000..06a1f96
--- /dev/null
+++ b/meta/recipes-connectivity/conntrack-tools/conntrack-tools_1.0.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Connection tracking userspace tools for Linux"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libnfnetlink libnetfilter-conntrack"
+
+PR = "r0"
+
+SRC_URI = " \
+	http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar \
+	file://conntrack-failover \
+	file://init \
+	"
+SRC_URI[tar.md5sum] = "5add24d4761baf17af630d5627a71752"
+SRC_URI[tar.sha256sum] = "fe36b044bb494d1810a6d73f0b4ccd25b6e81f72a2fc63c44da79ceebe4817b0"
+
+inherit autotools
+inherit update-rc.d
+
+INITSCRIPT_NAME = "conntrackd"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/conntrackd
+	install -d ${D}/${sysconfdir}/init.d
+	install -m 0644 doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
+	install -m 0755 ${WORKDIR}/conntrack-failover ${D}/${sysconfdir}/init.d/conntrack-failover
+	install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/conntrackd
+}
diff --git a/meta/recipes-connectivity/conntrack-tools/files/conntrack-failover b/meta/recipes-connectivity/conntrack-tools/files/conntrack-failover
new file mode 100644
index 0000000..6d92e63
--- /dev/null
+++ b/meta/recipes-connectivity/conntrack-tools/files/conntrack-failover
@@ -0,0 +1,77 @@
+#!/bin/sh
+# 
+# (C) 2008 by Pablo Neira Ayuso <pablo@netfilter.org>
+# (C) 2009 Roman I Khimov <khimov@altell.ru>
+#
+# This software may be used and distributed according to the terms
+# of the GNU General Public License, incorporated herein by reference.
+#
+# Description:
+#
+# This is the script for primary-backup setups for keepalived
+# (http://www.keepalived.org). You may adapt it to make it work with other
+# high-availability managers.
+#
+# Do not forget to include the required modifications to your keepalived.conf
+# file to invoke this script during keepalived's state transitions.
+#
+# Contributions to improve this script are welcome :).
+#
+## Modified to work as init.d script under pacemaker control
+
+CONNTRACKD_BIN=/usr/sbin/conntrackd
+CONNTRACKD_LOCK=/var/lock/conntrack.lock
+CONNTRACKD_CONFIG=/etc/conntrackd/conntrackd.conf
+
+case "$1" in
+  start)
+    #
+    # commit the external cache into the kernel table
+    #
+    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -c
+    if [ $? -eq 1 ]
+    then
+        logger "ERROR: failed to invoke conntrackd -c"
+    fi
+
+    #
+    # flush the internal and the external caches
+    #
+    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -f
+    if [ $? -eq 1 ]
+    then
+    	logger "ERROR: failed to invoke conntrackd -f"
+    fi
+
+    #
+    # resynchronize my internal cache to the kernel table
+    #
+    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -R
+    if [ $? -eq 1 ]
+    then
+    	logger "ERROR: failed to invoke conntrackd -R"
+    fi
+
+    #
+    # send a bulk update to backups 
+    #
+    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -B
+    if [ $? -eq 1 ]
+    then
+        logger "ERROR: failed to invoke conntrackd -B"
+    fi
+    ;;
+  stop)
+	$CONNTRACKD_BIN -t
+	$CONNTRACKD_BIN -n
+	;;
+  status)
+	;;
+  *)
+    logger "ERROR: unknown command"
+    echo "Usage: conntrack-failover {start|stop|status}"
+    exit 1
+    ;;
+esac
+
+exit 0
diff --git a/meta/recipes-connectivity/conntrack-tools/files/init b/meta/recipes-connectivity/conntrack-tools/files/init
new file mode 100644
index 0000000..6cda750
--- /dev/null
+++ b/meta/recipes-connectivity/conntrack-tools/files/init
@@ -0,0 +1,77 @@
+#!/bin/sh
+#
+# /etc/init.d/conntrackd
+#
+# Maximilian Wilhelm <max@rfc2324.org>
+#  -- Mon, 06 Nov 2006 18:39:07 +0100
+#
+# Roman I Khimov <khimov@altell.ru>
+#  -- Tue, 27 Oct 2009 14:34:00 +0300
+
+export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+
+NAME="conntrackd"
+DAEMON="/usr/sbin/conntrackd"
+CONFIG="/etc/conntrackd/conntrackd.conf"
+PIDFILE="/var/run/${NAME}.pid"
+
+
+# Gracefully exit if there is no daemon (debian way of life)
+if [ ! -x "${DAEMON}" ]; then
+	exit 0
+fi
+
+# Check for config file
+if [ ! -f /etc/conntrackd/conntrackd.conf ]; then
+	echo "Error: There is no config file for $NAME" >&2
+	exit 1;
+fi
+
+case "$1" in
+  start)
+        echo -n "Starting $NAME: "
+	for i in nf_conntrack_netlink nf_conntrack_netbios_ns nf_conntrack_proto_dccp nf_conntrack_tftp \
+		nf_conntrack_sane nf_conntrack_pptp nf_conntrack_irc nf_conntrack_amanda nf_conntrack_h323 \
+		nf_conntrack_proto_udplite nf_conntrack_proto_gre nf_conntrack_proto_sctp nf_conntrack_ftp \
+		nf_conntrack_sip; do
+		modprobe $i >/dev/null 2>/dev/null &
+	done
+	start-stop-daemon --start --quiet --make-pidfile --pidfile "/var/run/${NAME}.pid" --background --exec "${DAEMON}"
+	RET=$?
+	if [ "$?" = "0" ]; then
+		sleep 2
+		# Sync with other server
+		conntrackd -n
+		echo "done."
+	else
+		echo "FAILED!"
+	fi
+	exit $RET
+	;;
+  stop)
+        echo -n "Stopping $NAME:"
+	start-stop-daemon --stop --quiet --oknodo --pidfile "/var/run/${NAME}.pid" && echo "done." || echo "FAILED!"
+	;;
+  status)
+	echo -n "conntrackd "
+	start-stop-daemon -q -K -t -x $DAEMON
+	RET=$?
+	if [ "$RET" = "0" ]; then
+                PID=`cat $PIDFILE`
+		echo "($PID) is running"
+	else
+		echo "is not running"
+		exit $RET
+	fi
+	;;
+  restart)
+	$0 stop
+	$0 start
+	;;
+
+  *)
+	echo "Usage: /etc/init.d/conntrackd {start|stop|restart}"
+	exit 1
+esac
+
+exit 0
-- 
1.7.6.4



