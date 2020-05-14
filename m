Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.253.1589478311803065337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 10:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ruceAPUg;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id b8so1526396pgi.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 10:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OozO/j0GZaqnSXuHJChuw3v0yfx7en8z9769fhfDViY=;
        b=ruceAPUgDtYn3c74J3ub72RgA1N0CAFKTcKrLJ9Ac9CTSPoowGyKmWIfVSm1+0SkBb
         S3u879TiaUFgD2j3wM/U+oU4Qa9McW91tFAa2P0mUJ/3qnQ2rkDFjgQ7uv9GCpkn6xmr
         NIzUZ5z1zwNQfsMyrr6QCoUOz8FiGK2+lq3uyGaZkpb0uaZBs4KW8UK4xWhr747AR4d+
         g788JBQExKfkd6aNkvXhTGjsqfXuen5ek29H+iWmJE3h7MQjhL2vNog1aHN3sVEfDDj1
         4kJWDN4338eSipm/VIwxRXrINJ00sHSdavdHtuxjIjH7SQTHpSU8BJuFFL5shEmndGFz
         piVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OozO/j0GZaqnSXuHJChuw3v0yfx7en8z9769fhfDViY=;
        b=nRiWu6YafbDFGVb7iM/s6Gr/9K0PhlpP5P9JIHEMW5tM8bl0FO7YZsWepHtfYkDR1e
         FRUqITVBPcnZdQ80bF4DtaQAcqbgAkLmq67ggoUbt94eBB/6ETpGRtjn4sDMfvzK1IUk
         9ZiE4gA6ZwyV7QgoGYrO4wkVZhaRAmA17NBB5IxQqCvGzubMbcjZu3AXds5RrJDX/RIg
         WolG8tMJJzUil4po8kWs+JsxegeCSpoeEjs2EyyUNFcF4yOSZnTJ6brGe1qDWPA+UF72
         pFHeuVSEqMvyL+PcQvDeNcEnpKHkgLyTwaQYdJOVbSa6eYtKUvlk90EwY0DmkoDOWCcD
         Pq4w==
X-Gm-Message-State: AOAM531ohqEz3qVlbUf98wk/DzxDouEgxFW4AACLVpZWNscHo76rVLD+
	Exn1wE1RgiU14EQ9p8qBLJmAtqwde3E=
X-Google-Smtp-Source: ABdhPJwKegeGXndNIVqh4cgg1MIiPt108smC1FSkwPEkl6yWVhTuH8u9h+C7xb6ZTPYy8ZV25/Chww==
X-Received: by 2002:a63:3503:: with SMTP id c3mr4883750pga.371.1589478310746;
        Thu, 14 May 2020 10:45:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3cf8])
        by smtp.gmail.com with ESMTPSA id v1sm17943524pjs.36.2020.05.14.10.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:45:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH V3] rasdaemon: create recipe for version 0.6.5
Date: Thu, 14 May 2020 10:45:06 -0700
Message-Id: <20200514174506.4676-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Beniamin Sandu <beniaminsandu@gmail.com>

Link with libargp on musl
Include limits.h
Add to packagegroup-meta-oe

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Consolidate musl changes and move under perl dynamic layer setup

 .../packagegroup-meta-oe.bbappend             |  2 +-
 .../0001-Fix-system-header-includes.patch     | 44 +++++++++++++++
 .../recipes-support/rasdaemon/files/init      | 43 +++++++++++++++
 .../rasdaemon/files/rasdaemon.service         | 12 ++++
 .../rasdaemon/rasdaemon_0.6.5.bb              | 55 +++++++++++++++++++
 5 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch
 create mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/init
 create mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service
 create mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.5.bb

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index 69bc788a86..2aee5975d7 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -1 +1 @@
-RDEPENDS_packagegroup-meta-oe-support += "debsums"
+RDEPENDS_packagegroup-meta-oe-support += "debsums rasdaemon"
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch
new file mode 100644
index 0000000000..0164321312
--- /dev/null
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch
@@ -0,0 +1,44 @@
+From 18786db1ad03716267927d983c83275469a1478a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 May 2020 12:27:19 -0700
+Subject: [PATCH] Fix system header includes
+
+Use poll.h instead of sys/poll.h
+Fixes
+warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
+
+Include limits.h for PATH_MAX
+
+Fixes
+ras-events.c:359:16: error: 'PATH_MAX' undeclared (first use in this function)
+  359 |  char pipe_raw[PATH_MAX];
+      |                ^~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ras-events.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/ras-events.c b/ras-events.c
+index 511c93d..400e740 100644
+--- a/ras-events.c
++++ b/ras-events.c
+@@ -18,13 +18,14 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
++#include <poll.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+-#include <sys/poll.h>
+ #include <signal.h>
+ #include <sys/signalfd.h>
+ #include "libtrace/kbuffer.h"
+-- 
+2.26.2
+
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/init b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/init
new file mode 100644
index 0000000000..216677e73e
--- /dev/null
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/init
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
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service
new file mode 100644
index 0000000000..4fbf23142a
--- /dev/null
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service
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
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.5.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
new file mode 100644
index 0000000000..93f624882d
--- /dev/null
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "Tools to provide a way to get Platform Reliability, Availability and Serviceability (RAS) reports made via the Kernel tracing events"
+HOMEPAGE = "http://git.infradead.org/users/mchehab/rasdaemon.git"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
+
+SRC_URI = "git://git.infradead.org/users/mchehab/rasdaemon.git;branch=master \
+        file://0001-Fix-system-header-includes.patch \
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
+DEPENDS_append_libc-musl = " argp-standalone"
+LDFLAGS_append_libc-musl = " -largp"
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
2.26.2

