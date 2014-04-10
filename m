Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 311D465E54
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:54:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3A2sju2003865
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 9 Apr 2014 19:54:45 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 9 Apr 2014 19:54:44 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Apr 2014 10:54:34 +0800
Message-ID: <1397098475-17901-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1397098475-17901-1-git-send-email-kai.kang@windriver.com>
References: <1397098475-17901-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 2/3] smartmontools: add init script
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
X-List-Received-Date: Thu, 10 Apr 2014 02:54:45 -0000
Content-Type: text/plain

Add init script smartd for smartmontools. Thought smartmontools provides
init script itself, but it checks distribution version that is not usable
for oe.

So add an init script for smartmontools which removes distribution
version check.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../smartmontools/files/initd.smartd               | 108 +++++++++++++++++++++
 .../smartmontools/smartmontools_6.2.bb             |  14 ++-
 2 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100755 meta-oe/recipes-extended/smartmontools/files/initd.smartd

diff --git a/meta-oe/recipes-extended/smartmontools/files/initd.smartd b/meta-oe/recipes-extended/smartmontools/files/initd.smartd
new file mode 100755
index 0000000..29c27e4
--- /dev/null
+++ b/meta-oe/recipes-extended/smartmontools/files/initd.smartd
@@ -0,0 +1,108 @@
+#! /bin/sh
+
+# smartmontools init file for smartd
+# Copyright (C) 2002-8 Bruce Allen <smartmontools-support@lists.sourceforge.net>
+# $Id: smartd.initd.in 3360 2011-06-06 19:25:36Z chrfranke $
+
+# For RedHat and cousins:
+# chkconfig: - 60 60
+# description: Self Monitoring and Reporting Technology (SMART) Daemon
+# processname: smartd 
+
+# For SuSE and cousins
+### BEGIN INIT INFO
+# Provides:                   smartd
+# Required-Start:             $syslog $remote_fs
+# Should-Start:               sendmail
+# Required-Stop:              $syslog $remote_fs
+# Should-Stop:                sendmail
+# Default-Start:              
+# Default-Stop:	              0 1 2 3 4 5 6
+# Short-Description:          Monitors disk and tape health via S.M.A.R.T.
+# Description:                Start S.M.A.R.T. disk and tape monitor.
+### END INIT INFO
+
+# This program is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License as published by the Free
+# Software Foundation; either version 2, or (at your option) any later
+# version. 
+# You should have received a copy of the GNU General Public License (for
+# example COPYING); if not, write to the Free Software Foundation, Inc., 675
+# Mass Ave, Cambridge, MA 02139, USA.
+# This code was originally developed as a Senior Thesis by Michael Cornwell
+# at the Concurrent Systems Laboratory (now part of the Storage Systems
+# Research Center), Jack Baskin School of Engineering, University of
+# California, Santa Cruz. http://ssrc.soe.ucsc.edu/.
+
+# Uncomment the line below to pass options to smartd on startup. 
+# Note that distribution specific configuration files like
+# /etc/{default,sysconfig}/smartmontools might override these
+#smartd_opts="--interval=1800"
+
+SMARTD_BIN=/usr/sbin/smartd
+SMARTDPID=/var/run/smartd.pid
+[ -x $SMARTD_BIN ] || exit 0
+RET=0
+
+# source configuration file
+[ -r /etc/default/rcS ] && . /etc/default/rcS
+[ -r /etc/default/smartmontools ] && . /etc/default/smartmontools
+
+smartd_opts="--pidfile $SMARTDPID $smartd_opts"
+
+case "$1" in
+	start)
+		echo -n "Starting S.M.A.R.T. daemon: smartd"
+		if start-stop-daemon --start --quiet --pidfile $SMARTDPID \
+			--exec $SMARTD_BIN -- $smartd_opts; then
+			echo "."
+		else
+			echo " (failed)"
+			RET=1
+		fi
+		;;
+	stop)
+		echo -n "Stopping S.M.A.R.T. daemon: smartd"
+		start-stop-daemon --stop --quiet --oknodo --pidfile $SMARTDPID
+		echo "."
+		;;
+	restart)
+		$0 stop
+		$0 start
+		;;
+	force-reload)
+		$0 reload || $0 restart
+		;;
+	reload)
+		echo -n "Reload S.M.A.R.T. daemon: smartd"
+		if start-stop-daemon --stop --quiet --signal 1 \
+			--pidfile $SMARTDPID; then
+			echo "."
+		else
+			echo " (failed)"
+			RET=1
+		fi
+		;;
+	report)
+		echo -n "Checking SMART devices now"
+		if start-stop-daemon --stop --quiet --signal 10 \
+			--pidfile $SMARTDPID; then
+			echo "."
+		else
+			echo " (failed)"
+			RET=1
+		fi
+		;;
+	status)
+		if pidof $SMARTD_BIN >/dev/null; then
+			echo "$SMARTD_BIN is running."
+		else
+			echo "$SMARTD_BIN is not running."
+			RET=1
+		fi
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|force-reload|reload|report|status}"
+		exit 1
+esac
+exit $RET
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
index 83ff028..66fdb4d 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
@@ -12,10 +12,20 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
+           file://initd.smartd \
+          "
 
 SRC_URI[md5sum] = "d44f84081a12cef79cd17f78044351fc"
 SRC_URI[sha256sum] = "486f660579bb0fb4f6b927ded7531cb1f99685c666397377761c5b04dd96065b"
 
-inherit autotools
+inherit autotools update-rc.d
 
+do_install_append () {
+	#install the init.d/smartd
+	install -d ${D}${sysconfdir}/init.d
+	install -p -m 0755 ${WORKDIR}/initd.smartd ${D}${sysconfdir}/init.d/smartd
+}
+
+INITSCRIPT_NAME = "smartd"
+INITSCRIPT_PARAMS = "start 60 . stop 60 0 1 2 3 4 5 6 ."
-- 
1.8.4


