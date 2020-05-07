Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.3310.1588847838903950653
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 03:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d0v33754;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id y4so5719848wrm.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2020 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmuGU6BG2Oi30ff/UaFmqaXYLWpPfii6jaI13PePgXI=;
        b=d0v33754VDNPYHQBR7aObCRKLNmgwlXRzuhj4F3RWwbSyaLeVgNl7WZyeD/m0SjZUT
         2ibkvMz3pHV8bJAuBc6QMV0h3GQx0lrBQx8hNyY8EP+BpUT3Rfp7KQNp/5GPzznC3UH1
         K+RGFYxdGA1r8Wbq0p7NH3XU822NWvzO4cWm3yZXFoiVGkdQBkDeQamDgw+WzoV0SlfX
         UxPMmtLkqdVg2tNXKvqR+uC/o1xAKqII7Tx0YH3HB9dI2ryiRohnhVHvl0BGLMowwrZQ
         QI/91+HZMMArq4IldKpC0E9amJprT5gPXX+uuDYSZ0v9xrjVEnruVH/m6BFD1pOWFhlT
         c2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmuGU6BG2Oi30ff/UaFmqaXYLWpPfii6jaI13PePgXI=;
        b=SMLg0ziDg33giCL0lskFNqeZhl5wGMdw9KwtXMgQHalzTTdeTRi9PP0KlRwfvyWXNR
         GmD22MqdWOSRyHK0YP4azX59rOmyYepsxccmAsSh7fWlR1e8El+RiaqsjTsi+bPGNgQ2
         WnctfqnOrbSijhNpvgNC4kmyCq2oc43frDdr/qBu7kvkGhDC19f0Byliw86Zej7ROpaT
         F3NDpaajUwKVktxaUFw+K/Eh3HDlrmLbg1ghfnQOsE75CSvQs3UOxSpi9FhzIjuuH1ao
         XJ4EGBUirHd6g9IjFpXdPnxvZndKX85BFjHfhjUsQlV96JD5M0msVS+qGvPAmZU5eOri
         XN2w==
X-Gm-Message-State: AGi0PuZAd8iUdRcmogncyKJXZtYYleup5Js1YSVJV5Zb5Fg2peag8dmk
	1rgwz+4BV3MihtVr9NM768xvlg2yFks=
X-Google-Smtp-Source: APiQypK++hq9gC85Zl3wYQFKqIvjcEI2SFAqeLN/7QCUYgYxRyKhqTtOW902+i2CIeYQsAOk3vr/Vg==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr14391246wrv.3.1588847837071;
        Thu, 07 May 2020 03:37:17 -0700 (PDT)
Return-Path: <beniaminsandu@gmail.com>
Received: from beni-pc.corp.ad.wrs.com ([188.24.217.80])
        by smtp.gmail.com with ESMTPSA id 88sm7758092wrq.77.2020.05.07.03.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 03:37:16 -0700 (PDT)
From: "Beni" <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] rasdaemon: create recipe for version 0.6.5
Date: Thu,  7 May 2020 13:37:12 +0300
Message-Id: <20200507103712.3356068-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 meta-oe/recipes-support/rasdaemon/files/init  | 43 ++++++++++++++++
 .../rasdaemon/files/rasdaemon.service         | 12 +++++
 .../rasdaemon/rasdaemon_0.6.5.bb              | 51 +++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 meta-oe/recipes-support/rasdaemon/files/init
 create mode 100644 meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
 create mode 100644 meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb

diff --git a/meta-oe/recipes-support/rasdaemon/files/init b/meta-oe/recipes-support/rasdaemon/files/init
new file mode 100644
index 000000000..216677e73
--- /dev/null
+++ b/meta-oe/recipes-support/rasdaemon/files/init
@@ -0,0 +1,43 @@
+#! /bin/sh
+# /etc/init.d/rasdaemon: start rasdaemon service
+
+. /etc/init.d/functions
+
+# Defaults
+PIDFILE=/var/run/rasdaemon.pid
+BINFILE=/usr/sbin/rasdaemon
+SCRIPTNAME=/etc/init.d/rasdaemon
+
+[ -x $BINFILE ] || exit 0
+
+case "$1" in
+	start)
+		echo -n "Starting RASdaemon services: "
+		if [ ! -f "$PIDFILE" ]; then
+			start-stop-daemon --start --quiet --exec $BINFILE -- --enable &> /dev/null
+			start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $BINFILE -- --record
+			pidof $BINFILE > $PIDFILE
+		fi
+		[ -f $PIDFILE ] && echo "done." || echo "fail."
+		;;
+    	stop)
+		echo -n "Stopping RASdaemon services: "
+		if [ -f  "$PIDFILE" ] ; then
+			start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $BINFILE -- --disable &> /dev/null
+			killproc $BINFILE
+			rm $PIDFILE
+		fi
+		[ ! -f $PIDFILE ] && echo "done." || echo "fail."
+		;;
+	restart)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	status)
+		status $BINFILE
+		;;
+	*)
+		echo "Usage: $SCRIPTNAME {start|stop|restart|status}"
+		exit 1
+esac
diff --git a/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service b/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
new file mode 100644
index 000000000..4fbf23142
--- /dev/null
+++ b/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=RAS daemon to log the RAS events
+After=syslog.target
+
+[Service]
+ExecStart=/usr/sbin/rasdaemon -f -r
+ExecStartPost=/usr/sbin/rasdaemon --enable
+ExecStop=/usr/sbin/rasdaemon --disable
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb b/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
new file mode 100644
index 000000000..c1b9fdbaa
--- /dev/null
+++ b/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "Tools to provide a way to get Platform Reliability, Availability and Serviceability (RAS) reports made via the Kernel tracing events"
+HOMEPAGE = "http://git.infradead.org/users/mchehab/rasdaemon.git"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
+
+SRC_URI = "git://git.infradead.org/users/mchehab/rasdaemon.git;branch=master \
+	file://rasdaemon.service \
+	file://init"
+
+SRCREV = "25533c0c55426eeb2ad25dcbdb2b5e4ba4e83d80"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${BPN} = "perl perl-module-file-basename perl-module-file-find perl-module-file-spec perl-module-getopt-long \
+	perl-module-posix perl-module-file-glob libdbi-perl libdbd-sqlite-perl"
+
+inherit autotools pkgconfig update-rc.d systemd
+
+PACKAGECONFIG ??= "sqlite3 mce aer extlog devlink diskerror"
+PACKAGECONFIG[sqlite3] = "--enable-sqlite3,--disable-sqlite3,sqlite3"
+PACKAGECONFIG[mce] = "--enable-mce,--disable-mce"
+PACKAGECONFIG[aer] = "--enable-aer,--disable-aer"
+PACKAGECONFIG[extlog] = "--enable-extlog,--disable-extlog"
+PACKAGECONFIG[devlink] = "--enable-devlink,--disable-devlink"
+PACKAGECONFIG[diskerror] = "--enable-diskerror,--disable-diskerror"
+PACKAGECONFIG[arm] = "--enable-arm,--disable-arm"
+PACKAGECONFIG[hisi-ns-decode] = "--enable-hisi-ns-decode,--disable-hisi-ns-decode"
+PACKAGECONFIG[non-standard] = "--enable-non-standard,--disable-non-standard"
+PACKAGECONFIG[abrt-report] = "--enable-abrt-report,--disable-abrt-report"
+
+do_configure_prepend () {
+	( cd ${S}; autoreconf -vfi )
+}
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rasdaemon
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/rasdaemon.service ${D}${systemd_unitdir}/system
+}
+
+FILES_${PN} += "${sbindir}/rasdaemon \
+		${sysconfdir}/init.d \
+		${systemd_unitdir}/system/rasdaemon.service"
+
+SYSTEMD_SERVICE_${PN} = "rasdaemon.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "rasdaemon"
+INITSCRIPT_PARAMS_${PN} = "defaults 89"
-- 
2.25.1

