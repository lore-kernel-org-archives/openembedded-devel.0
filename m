Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C88C433F5
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 11:32:26 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.9000.1651923139557755189
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 04:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iCLrKGTa;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id l18so18706994ejc.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Egv2ro83k/aCk75izC9eTcvJ9qdf9q+3XrZeUElF0uA=;
        b=iCLrKGTapS9HwMWQQoBs+vFcJsXLPfOJbDUFstpUu+rjqCfbNoUv5W4PYKIl70ZEc5
         I9Kl0GHjt9RQfI8/uld8xcD49qrOJGlv4KAHLNGHq7irrpfw4l6iNksq7VbObDameKfG
         TMAPahkKjDZsnVDeSLk3QCl0zIl7wHgPqjiQFJAUPBzjWYspcqRTihABNF9k585Fhp3Y
         hnmsm5+QwHSewMEE2qus9uUdmJyNNbxry/MsxRh1Fspc3dhRwXkoPpQ4BymfJyjpd+kU
         kicOWT7ZSg2HQjVhS1xbPha8zah8S7OSo3ow8imOur+w4F3rEqOqnCOiN9I0mMxCdmRY
         0GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Egv2ro83k/aCk75izC9eTcvJ9qdf9q+3XrZeUElF0uA=;
        b=chZTfxPwbY3pXK8SFM84or+TADnzRKitwOtOVwqFNrUGRv37Mh9q7bg6MaSjdXAerA
         1PH54FSBQ1Bldor+ykSXlMFMfeuc1x5sySlmI8QdqSgqtHKq/3OC6rPEEIgE5J9g5J1K
         nYqoYbklh2N48oj05ewZUKUOxhuK4rvg1R2sxS3N2119OWcU1NBxSLytcK3Zw0P4n+m+
         5y/lR7jYtiJqrLVtOlJMXqUvkxVjp0LMrEzLgG3cxX7e5wJd9khLqzIGiJgf4NZ9sgSq
         YnKYzOy7HnAdDH9BmTr/tZBTxRZhdkKRIZfULv8t8iBf4l+QcE3htBzmcKdcLz97/vnm
         tfGA==
X-Gm-Message-State: AOAM531wZDUSzTXZfffQJwN2PHLwJCWsSrMm28KYTRf8mtfe50Z7atF8
	TLJeLnhKgmJVKeap0VrWRypjIwWVlXQ=
X-Google-Smtp-Source: 
 ABdhPJxy4UvgFJ4r8CE596CLO1iSYvtN6VJFAhHBky0akMQjfdumPvfWO5T1I1l90RsnowUOUSSDKg==
X-Received: by 2002:a17:907:a412:b0:6f4:31e5:5ce with SMTP id
 sg18-20020a170907a41200b006f431e505cemr7228751ejc.237.1651923137546;
        Sat, 07 May 2022 04:32:17 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 b21-20020aa7c915000000b0042617ba6380sm3462994edt.10.2022.05.07.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 04:32:17 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [meta-networking][PATCH 1/2] ulogd2: Add recipe
Date: Sat,  7 May 2022 12:32:03 +0100
Message-Id: <20220507113204.16605-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 May 2022 11:32:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96977

ulogd-2.x provides a flexible, almost universal logging daemon for
netfilter logging.  This encompasses both packet-based logging (logging
of policy violations) and flow-based logging, e.g. for accounting
purpose.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../recipes-filter/ulogd2/ulogd2/ulogd.init   | 180 ++++++++++++++++++
 .../ulogd2/ulogd2/ulogd.service               |  11 ++
 .../recipes-filter/ulogd2/ulogd2_2.0.7.bb     |  80 ++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 meta-networking/recipes-filter/ulogd2/ulogd2/ulogd.init
 create mode 100644 meta-networking/recipes-filter/ulogd2/ulogd2/ulogd.service
 create mode 100644 meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb

diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2/ulogd.init b/meta-networking/recipes-filter/ulogd2/ulogd2/ulogd.init
new file mode 100644
index 000000000000..05d284e72573
--- /dev/null
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2/ulogd.init
@@ -0,0 +1,180 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          ulogd2 ulogd
+# Required-Start:    $local_fs
+# Should-Start:
+# Required-Stop:     $local_fs
+# Should-Stop:
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Userspace logging daemon for netfilter/iptables
+### END INIT INFO
+
+# The definition of actions: (From LSB 3.1.0)
+# start         start the service
+# stop          stop the service
+# restart       stop and restart the service if the service is already running,
+#               otherwise start the service
+# try-restart	restart the service if the service is already running
+# reload	cause the configuration of the service to be reloaded without
+#               actually stopping and restarting the service
+# force-reload	cause the configuration to be reloaded if the service supports
+#               this, otherwise restart the service if it is running
+# status	print the current status of the service
+
+# The start, stop, restart, force-reload, and status actions shall be supported
+# by all init scripts; the reload and the try-restart actions are optional
+
+# PATH should only include /usr/* if it runs after the mountnfs.sh script
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+DESC="Userspace logging daemon for netfilter/iptables"
+NAME="ulogd"
+DAEMON=/usr/sbin/$NAME
+DAEMON_ARGS="-d"
+PIDFILE=/var/run/$NAME.pid
+
+. /etc/init.d/functions || exit 1
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+
+#
+# Function that starts the daemon/service
+#
+do_start() {
+	local status pid
+
+	status=0
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		echo "$DESC already running ($pid)."
+		exit 1
+		;;
+	*)
+		echo "Starting $DESC ..."
+		exec $DAEMON $DAEMON_ARGS >/dev/null 2>&1 || status=$?
+		echo "ERROR: Failed to start $DESC."
+		exit $status
+		;;
+	esac
+
+	# Add code here, if necessary, that waits for the process to be ready
+	# to handle requests from services started subsequently which depend
+	# on this one.  As a last resort, sleep for some time.
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop() {
+	local pid status
+
+	status=0
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		# Exit when fail to stop, the kill would complain when fail
+		kill -s 15 $pid >/dev/null && rm -f $PIDFILE && \
+			echo "Stopped $DESC ($pid)." || exit $?
+		;;
+	*)
+		echo "$DESC is not running; none killed." >&2
+		;;
+	esac
+
+	# Wait for children to finish too if this is a daemon that forks
+	# and if the daemon is only ever run from this initscript.
+	# If the above conditions are not satisfied then add some other code
+	# that waits for the process to drop all resources that could be
+	# needed by services started subsequently.  A last resort is to
+	# sleep for some time.
+	return $status
+}
+
+#
+# Function that sends a SIGHUP to the daemon/service
+#
+do_reload() {
+	local pid status
+
+	status=0
+        # If the daemon can reload its configuration without
+        # restarting (for example, when it is sent a SIGHUP),
+        # then implement that here.
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		echo "Reloading $DESC ..."
+		kill -s 1 $pid || exit $?
+		;;
+	*)
+		echo "$DESC is not running; none reloaded." >&2
+		;;
+	esac
+	exit $status
+}
+
+
+#
+# Function that shows the daemon/service status
+#
+status_of_proc () {
+	local pid status
+
+	status=0
+	# pidof output null when no program is running, so no "2>/dev/null".
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		echo "$DESC is running ($pid)."
+		exit 0
+		;;
+	*)
+		echo "$DESC is not running." >&2
+		exit $status
+		;;
+	esac
+}
+
+case "$1" in
+start)
+	do_start
+	;;
+stop)
+	do_stop || exit $?
+	;;
+status)
+	status_of_proc
+	;;
+restart)
+	# Always start the service regardless the status of do_stop
+	do_stop
+	do_start
+	;;
+try-restart|force-reload)
+	# force-reload is the same as reload or try-restart according
+	# to its definition, the reload is not implemented here, so
+	# force-reload is the alias of try-restart here, but it should
+	# be the alias of reload if reload is implemented.
+	#
+	# Only start the service when do_stop succeeds
+	do_stop && do_start
+	;;
+reload)
+	# If the "reload" action is implemented properly, then let the
+	# force-reload be the alias of reload, and remove it from
+	# try-restart|force-reload)
+	#
+	do_reload
+	;;
+*)
+	echo "Usage: $0 {start|stop|status|restart|try-restart|force-reload}" >&2
+	exit 3
+	;;
+esac
+
diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2/ulogd.service b/meta-networking/recipes-filter/ulogd2/ulogd2/ulogd.service
new file mode 100644
index 000000000000..cf62962a95f1
--- /dev/null
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2/ulogd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Netfilter Ulogd daemon
+Before=network-pre.target
+Wants=network-pre.target
+
+[Service]
+ExecStart=@SBINDIR@/ulogd
+ExecReload=kill -HUP ${MAINPID}
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb
new file mode 100644
index 000000000000..7a307dc292ec
--- /dev/null
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb
@@ -0,0 +1,80 @@
+SUMMARY = "Userspace logging daemon for netfilter/iptables"
+DESCRIPTION = "ulogd-2.x provides a flexible, almost universal logging daemon for \
+netfilter logging. This encompasses both packet-based logging (logging of \
+policy violations) and flow-based logging, e.g. for accounting purpose."
+HOMEPAGE = "https://www.netfilter.org/projects/ulogd/index.html"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+
+DEPENDS = "libnfnetlink"
+PROVIDES = "ulogd"
+
+PV .= "+git${SRCPV}"
+
+SRC_URI = "git://git.netfilter.org/ulogd2;branch=master \
+           file://ulogd.init \
+           file://ulogd.service \
+"
+SRCREV = "5f9628c9273815b6e560603427fe86118e7cb5bb"
+
+S = "${WORKDIR}/git"
+
+inherit autotools manpages pkgconfig systemd update-rc.d
+
+PACKAGECONFIG ?= "dbi json nfacct nfct nflog pcap sqlite3 ulog"
+PACKAGECONFIG[dbi] = "--enable-dbi,--disable-dbi,libdbi"
+PACKAGECONFIG[json] = "--enable-json,--disable-json,jansson"
+PACKAGECONFIG[manpages] = ""
+PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5"
+PACKAGECONFIG[nfacct] = "--enable-nfacct,--disable-nfacct,libnetfilter-acct"
+PACKAGECONFIG[nfct] = "--enable-nfct,--disable-nfct,libnetfilter-conntrack"
+PACKAGECONFIG[nflog] = "--enable-nflog,--disable-nflog,libnetfilter-log"
+PACKAGECONFIG[pcap] = "--enable-pcap,--disable-pcap,libpcap"
+PACKAGECONFIG[pgsql] = "--enable-pgsql,--disable-pgsql,postgresql"
+PACKAGECONFIG[sqlite3] = "--enable-sqlite3,--disable-sqlite3,sqlite3"
+PACKAGECONFIG[ulog] = "--enable-ulog,--disable-ulog"
+
+do_install:append () {
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${B}/ulogd.conf ${D}${sysconfdir}/ulogd.conf
+
+	install -d ${D}${mandir}/man8
+	install -m 0644 ${S}/ulogd.8 ${D}${mandir}/man8/ulogd.8
+
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/ulogd.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/ulogd.service
+
+	install -d ${D}${sysconfdir}/init.d
+	install -m 755 ${WORKDIR}/ulogd.init ${D}${sysconfdir}/init.d/ulogd
+}
+
+PACKAGES += "${PN}-plugins"
+ALLOW_EMPTY:${PN}-plugins = "1"
+
+PACKAGES_DYNAMIC += "^${PN}-plugin-.*$"
+NOAUTOPACKAGEDEBUG = "1"
+
+CONFFILES:${PN} = "${sysconfdir}/ulogd.conf"
+RRECOMMENDS:${PN} += "${PN}-plugins"
+
+FILES:${PN}-dbg += "${sbindir}/.debug"
+
+python split_ulogd_libs () {
+    libdir = d.expand('${libdir}/ulogd')
+    dbglibdir = os.path.join(libdir, '.debug')
+
+    split_packages = do_split_packages(d, libdir, r'^ulogd_.*\_([A-Z0-9]*).so', '${PN}-plugin-%s', 'ulogd2 %s plugin', prepend=True)
+    split_dbg_packages = do_split_packages(d, dbglibdir, r'^ulogd_.*\_([A-Z0-9]*).so', '${PN}-plugin-%s-dbg', 'ulogd2 %s plugin - Debugging files', prepend=True, extra_depends='${PN}-dbg')
+
+    if split_packages:
+        pn = d.getVar('PN')
+        d.setVar('RRECOMMENDS:' + pn + '-plugins', ' '.join(split_packages))
+        d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_dbg_packages))
+}
+PACKAGESPLITFUNCS:prepend = "split_ulogd_libs "
+
+SYSTEMD_SERVICE:${PN} = "ulogd.service"
+
+INITSCRIPT_NAME = "ulogd"
+INITSCRIPT_PARAMS = "defaults"
-- 
2.35.1


