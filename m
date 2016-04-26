Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id A8ED96E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:15:59 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id y84so4807425lfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 23:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/M+cGpeWYEkDs8H4DCzsdNOTnKFWP1dMyv3J1uBHUBY=;
	b=aBQutYJZNC+/RJgiThCaVXnT/ZaVq08WEFXqXvdGPjwLWWQqVmPCYbOcbJ5ms3HvEM
	oBaf2jpnSoHfyrwfqkiExVF9v9zLjEl6zWFhIMZnwblFFLFFuRjTNRIwJ3K8RTRbG+7Q
	dtFypjw4a/qcp15H1rnnVwkFA+P+kHklhzR8kkhYninMW9jsObvRVQYuVE0wqnqcm+OU
	bbBIo4lgF0Sn0Dw1mmt06bQQpIAnAfEdJzczA2YixFOgT2+LyeWVI6Wodl4UmPuhWNj5
	eAayKiLkUPx1tqWf/KORWKMT9eNxMD4lp6GcepcOU5KSh+w/CCVr5yqWFU+lK9Otw5Zr
	AxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/M+cGpeWYEkDs8H4DCzsdNOTnKFWP1dMyv3J1uBHUBY=;
	b=d/hgfkTalWQzOl+M4GxVbUMBxovhTeZxAPn5e+hLKlhlRL6dUEUs4yLxh24+KHBE7R
	3SJnajhHTDAlD9IvXwqIOUyEZhdkgkuWBk22RonnFWO8QmKfxRKfqLZzDhp3RRWpEnu3
	T0XJf5aokLUW4/Iv0TOS2gDF9b5FCr2IkaxwDIZwsO1IIBIX8+monkQBc5nfw9XIb+rw
	5+0uBojWwWZJl2aQru1jjLQSw9DLakC7pigjoBzQ8vQTQ1N0XbO8xRaXJ9UK/ae3R1IR
	aIlZlp8e6JWJL4c+gA3Q03jbFm4HSo4vP566kpFivi7pyBZ34X6TLlxX4V7uvR4qUErI
	4qCw==
X-Gm-Message-State: AOPr4FUl7MWBlTReGKfPNe+BpBMkdmZoMev+WM2IX/JZzamZUjbA3W5Ha3eVbxUPX0efYA==
X-Received: by 10.25.145.136 with SMTP id t130mr467398lfd.4.1461651358879;
	Mon, 25 Apr 2016 23:15:58 -0700 (PDT)
Received: from localhost (213-64-218-130-no126.business.telia.com.
	[213.64.218.130])
	by smtp.gmail.com with ESMTPSA id b4sm1356624lfe.35.2016.04.25.23.15.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Apr 2016 23:15:57 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue, 26 Apr 2016 08:15:44 +0200
Message-Id: <1461651344-31145-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 2.8.1
Cc: Mark Asselstine <mark.asselstine@windriver.com>
Subject: [meta-networking][krogoth][PATCH] dnsmasq: get systemd only working again
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
X-List-Received-Date: Tue, 26 Apr 2016 06:16:00 -0000

From: Mark Asselstine <mark.asselstine@windriver.com>

The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
[dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
dnsmasq runtime. No sysvinit scripts are included in systemd only
builds (and should not be) and the dnsmasq executable has not moved to
/usr/sbin.

Reverting to the previous version of the systemd service file. If
folks want the local dnsmasq instance to be queried before going to
an external DNS they should add 'nameserver 127.0.0.1' to
/etc/resolv.conf. Or submit a change which will work with systemd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Acked-by: Anders Darander <anders@chargestorm.se>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit 237ade5065aee5290288febfbbae90145c2c7764)
---
 .../recipes-support/dnsmasq/dnsmasq.inc            | 21 +++++---
 .../dnsmasq/files/dnsmasq-noresolvconf.service     | 15 ++++++
 .../dnsmasq/files/dnsmasq-resolvconf-helper        | 62 ++++++++++++++++++++++
 .../dnsmasq/files/dnsmasq-resolvconf.service       | 17 ++++++
 .../recipes-support/dnsmasq/files/dnsmasq.service  | 16 ------
 5 files changed, 108 insertions(+), 23 deletions(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq.service

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 622e630..cc7f9e3 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV',1).split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
            file://init \
            file://dnsmasq.conf \
-           file://dnsmasq.service \
+           file://dnsmasq-resolvconf.service \
+           file://dnsmasq-noresolvconf.service \
 "
 
 inherit pkgconfig update-rc.d systemd
@@ -33,7 +34,7 @@ EXTRA_OEMAKE = "\
     'LDFLAGS=${LDFLAGS}' \
 "
 
-SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file://dnsmasq.resolvconf file://99_dnsmasq', '', d)}"
+SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'file://dnsmasq.resolvconf file://99_dnsmasq file://dnsmasq-resolvconf-helper', '', d)}"
 
 do_compile_append() {
     # build dhcp_release
@@ -51,7 +52,12 @@ do_install () {
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
+
+    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
+        install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
+    else
+        install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
+    fi
 
     install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
 
@@ -60,11 +66,12 @@ do_install () {
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
     fi
     if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
-	install -d ${D}${sysconfdir}/resolvconf/update.d/
-	install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
+        install -d ${D}${sysconfdir}/resolvconf/update.d/
+        install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
 
-	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
+        install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindir}
     fi
 }
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service
new file mode 100644
index 0000000..cde2244
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=DNS forwarder and DHCP server
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/run/dnsmasq.pid
+ExecStartPre=/usr/bin/dnsmasq --test
+ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid
+ExecStop=/bin/kill $MAINPID
+ExecReload=/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
new file mode 100644
index 0000000..db54d46
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
@@ -0,0 +1,62 @@
+#!/bin/bash
+#
+# Borrowing heavily from the dnsmasq initscript's version of support for
+# resolvconf, intended for use in systemd-only configurations.
+#
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/sbin/dnsmasq
+NAME=dnsmasq
+
+# Most configuration options in /etc/default/dnsmasq are deprecated
+# but still honoured.
+if [ -r /etc/default/$NAME ]; then
+   . /etc/default/$NAME
+fi
+
+start_resolvconf()
+{
+   # If interface "lo" is explicitly disabled in /etc/default/dnsmasq
+   # Then dnsmasq won't be providing local DNS, so don't add it to
+   # the resolvconf server set.
+   for interface in $DNSMASQ_EXCEPT
+   do
+      [ $interface = lo ] && return
+   done
+
+   if [ -x /sbin/resolvconf ] ; then
+      echo "nameserver 127.0.0.1" |
+      /sbin/resolvconf -a lo.$NAME
+   fi
+   return 0
+}
+
+stop_resolvconf()
+{
+   if [ -x /sbin/resolvconf ] ; then
+      /sbin/resolvconf -d lo.$NAME
+   fi
+   return 0
+}
+
+case "$1" in
+   start)
+      start_resolvconf
+      exit 0
+      ;;
+   stop)
+      stop_resolvconf
+      exit 0
+      ;;
+   restart)
+      stop_resolvconf
+      start_resolvconf
+      exit 0
+      ;;
+   *)
+      echo "Usage: /etc/init.d/$NAME {start|stop|restart}" >&2
+      exit 3
+      ;;
+esac
+
+exit 0
+
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
new file mode 100644
index 0000000..68b175c
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=DNS forwarder and DHCP server
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/run/dnsmasq.pid
+ExecStartPre=/usr/bin/dnsmasq --test
+ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid
+ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start
+ExecStopPre=/usr/bin/dnsmasq-resolvconf-helper stop
+ExecStop=/bin/kill $MAINPID
+ExecReload=/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
deleted file mode 100644
index c3637e1..0000000
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
+++ /dev/null
@@ -1,16 +0,0 @@
-[Unit]
-Description=DNS forwarder and DHCP server
-After=network.target
-
-[Service]
-Type=forking
-PIDFile=/run/dnsmasq.pid
-ExecStartPre=/usr/sbin/dnsmasq --test
-ExecStart=/etc/init.d/dnsmasq systemd-exec
-ExecStartPost=/etc/init.d/dnsmasq systemd-start-resolvconf
-ExecStopPre=/etc/init.d/dnsmasq systemd-stop-resolvconf
-ExecReload=/bin/kill -HUP $MAINPID
-
-[Install]
-WantedBy=multi-user.target
-
-- 
2.8.1


