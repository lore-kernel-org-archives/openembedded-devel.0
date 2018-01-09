Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id C60B560123
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 18:31:12 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 23so6479711pfp.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jan 2018 10:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uw4KpUALBTqwj8KajBN6qO6bEjWYczNTeaEmcHoIt7M=;
	b=sWg7BxcxmAs4fX2W/XOyMXexczwbgNSRlYP1A5OiV0adLLnl9l9Y5y84Bcz0a/BbNY
	66IDFTV+iAd2tMGlHqNnd4xAqmj5lUA+z/VfDmf4fawaPJU0T9Dz4g2ld8mQPwqLEhSL
	4RdKQ1h5JY0c2uku/lzIo98KFsy7l8U+QXedweGQZcgiTwKRzleuHHfqhC1FvydBFl2j
	5NNX2ArB7+1iUlngJdvg2TKMU/kDT/0qLA1skw8j6VLSb8E54EJBLu/xttWq+Hoaw2ly
	t7LrKhYjkExtR3xS/CHFdPOJ6dqD8JgHxfDAxBIwgjTFIFc/W8K+hfyD4W6zYVjMvi+s
	ngKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uw4KpUALBTqwj8KajBN6qO6bEjWYczNTeaEmcHoIt7M=;
	b=CioCMPUtPb+BSp3U9JyRVoL7Bqb0F61hTfF+m56DCw9deuLBW/t+G7sAISK2Bhj3Uu
	tDPCseqv7wm16ANr3BYOtUF3WWHf58aodPQnYNKIrUtCKDNaRDiNx/VcD0qQ6zYl/Rdx
	gOBwtLKnIRvppiu7Bz49KbWTuMgkTxgigglcroKX417Zs/OriOaVChKN7xSJZ3r4tYYH
	kTQetZ0X8igK2Fqy9GF+IhFX5rZ8q7nZBOMVe9yYOIvzFlcFNlzoxmcWD4xB1luLrSHG
	DfAi3qSfN6+mpikcrMUZDzZXItL831T7eoRqnlOJmQVa7N57dwrVuAo2J7vb1OkP52+Y
	ILew==
X-Gm-Message-State: AKwxytfX2LlUXkLFdIrSQvL9RnbefBbb79AWErrV7bKx1yn4QwlFJ45P
	cVHrQ2mfMd5pWw9qbg5dEXeSIlsX
X-Google-Smtp-Source: ACJfBotCV1w1Hbtb2qsL8zlGqucf+YDgF65RAsOpg/dul6RNypNMS/KYuW2mKqgUrrDFhjKVnPY7DA==
X-Received: by 10.98.74.133 with SMTP id c5mr2645338pfj.188.1515522673530;
	Tue, 09 Jan 2018 10:31:13 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	o64sm21071837pga.1.2018.01.09.10.31.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jan 2018 10:31:12 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 00:01:06 +0530
Message-Id: <1515522666-15585-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH V2] open-vm-tools: add sysvinit script to start vmtoolsd daemon at boot time
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
X-List-Received-Date: Tue, 09 Jan 2018 18:31:12 -0000

It adds support to start vmtoolsd daemon during system startup,
when init manager is SysVinit.

Patch V2 adds option to store pid file in /var/run/vmtoolsd.pid file,
which is helpful to stop/restart vmtoolsd daemon.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../open-vm-tools/files/vmtoolsd.init              | 66 ++++++++++++++++++++++
 .../open-vm-tools/open-vm-tools_10.1.5.bb          | 17 +++++-
 2 files changed, 80 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init

diff --git a/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init b/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init
new file mode 100644
index 0000000..3828046
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init
@@ -0,0 +1,66 @@
+#!/bin/sh
+#
+#   vmtoolsd          Start/stop the vmware tools daemon
+#
+# chkconfig:  2345 90 60
+# description: vmtoolsd is a daemon that starts up.  for some reason, it
+#              doesn't include a sysv init startup file in the latest release.
+#              so i have to write this
+#
+
+### BEGIN INIT INFO
+# Provides: vmtoolsd
+# Required-Start: $local_fs $syslog
+# Required-Stop: $local_fs $syslog
+# Default-Start: 2345
+# Default-Stop: 90
+# Short-Description: Run vmware tools daemon
+### END INIT INFO
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/bin/vmtoolsd
+NAME=vmtoolsd
+DESC="vmware tools daemon"
+VMTOOLSDARGS=" -b /var/run/vmtoolsd.pid "
+RETVAL="1"
+
+# source function library
+. /etc/init.d/functions
+
+test -f $DAEMON || exit 0
+
+
+case "$1" in
+  start)
+    echo -n "Starting vmware tools daemon: "
+    start-stop-daemon --start --quiet --exec $DAEMON -- $VMTOOLSDARGS
+    RETVAL=$?
+    if [ $RETVAL -eq 0 ] ; then
+        echo "OK"
+    else
+        echo "FAIL"
+    fi
+    ;;
+  stop)
+    echo -n "Stopping vmware tools daemon: "
+    start-stop-daemon --stop --quiet --pidfile /var/run/vmtoolsd.pid
+    RETVAL=$?
+    if [ $RETVAL -eq 0 ] ; then
+        echo "OK"
+    else
+        echo "FAIL"
+    fi
+    ;;
+  status)
+    status vmtoolsd
+    exit $?
+    ;;
+  restart)
+    $0 stop && sleep 1 && $0 start
+    ;;
+  *)
+    echo "Usage: /etc/init.d/vmtoolsd {start|stop|status|restart}"
+    exit 1
+esac
+
+exit $RETVAL
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 81e8e96..c32d2c5 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -24,6 +24,7 @@ LICENSE_modules/solaris = "CDDL-1.0"
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://tools.conf \
            file://vmtoolsd.service \
+           file://vmtoolsd.init \
            file://0001-configure.ac-don-t-use-dnet-config.patch \
            file://0002-add-include-sys-sysmacros.h.patch \
            file://0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch \
@@ -50,7 +51,7 @@ DEPENDS_append_libc-musl = " libtirpc"
 # open-vm-tools is supported only on x86.
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd update-rc.d
 
 SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
 
@@ -85,8 +86,14 @@ RDEPENDS_${PN} = "util-linux libdnet fuse"
 
 do_install_append() {
     ln -sf ${sbindir}/mount.vmhgfs ${D}/sbin/mount.vmhgfs
-    install -d ${D}${systemd_unitdir}/system ${D}${sysconfdir}/vmware-tools
-    install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
+    install -d ${D}${sysconfdir}/vmware-tools
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
+    else
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/vmtoolsd.init ${D}${sysconfdir}/init.d/vmtoolsd
+    fi
     install -m 0644 ${WORKDIR}/tools.conf ${D}${sysconfdir}/vmware-tools/tools.conf
 }
 
@@ -95,6 +102,10 @@ do_configure_prepend() {
     export CUSTOM_DNET_LIBS=-L${STAGING_LIBDIR}/libdnet.so
 }
 
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "vmtoolsd"
+INITSCRIPT_PARAMS_${PN} = "start 90 2 3 4 5 . stop 60 0 1 6 ."
+
 python() {
     if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split() or \
 	'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
-- 
2.7.4


