Return-Path: <henry@kittyhawk.aero>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id CC55D6E668
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 19:06:41 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id y124so15601141pfy.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 12:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kittyhawk-aero.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8adXe1pfkri5xZn52BHDA0rMHA8kt1nA7meVzdTwi7s=;
	b=PUPn8zEpONnq9/h8GVZ5oOGtIlW109TUTGurs5/MAhbFilMz58+KPDCMQ6xAwVHfWF
	9GWOcNKJSHa0gJbWFtReovwTZDj1++sGQ5c1/4YDwXKhP9KUEQlyu7xLh3zOuo77srD3
	4Fpa0XvZY1voCARn808aNqLAi8V7EPJQT1bNfbZWew38K5DcI8QwKxHl62LIxVtBbvM/
	ADBsRSKH30QX3heeZpfkSMuZxktIDueu7XyE/V40vVbMqF6+FyDF7knK7fNVwbVwShBa
	EnjN04ujHsrOk2ZWgleoeojXdxgVHJ5n1tsBB8x2trkgA5cLQ+9c56OlC3i0IuSpiHOf
	so4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8adXe1pfkri5xZn52BHDA0rMHA8kt1nA7meVzdTwi7s=;
	b=EoqSfIdgKWSDmtMSuVRa1DvrNNr22K/61LZEBKVdQkIKqJbdWfdUkBduhtPTKAoW8P
	0C9gNian09q3X6mvdhNowmeVT43E207FeSIubnIDUDjGr7JQN/wOnfzBlh2yqiABsXlD
	pHAZOqUJkw9HO/QKu4x/XVvysWi8/uke0PCk3mOPjVPvQCnDpI0lk2kQQJf6SmP78dL4
	EK/e3Qjv/T4WAcfOwXxFfQnZWNpJH+YF/ouBB1CbXSh1SAiMZNwCVQH+weE0AT+d2+uW
	zadJDEGr5w5YSV0UPeasVDTkot3XCqzocuw9ndOuRO1u74MhGI+ZoPaAwN1rW2uvn7x9
	9Zqg==
X-Gm-Message-State: ALyK8tLCy27p5RxOhCRoo0stR+8+GNbWj3a4kqR0GZ1ZWId69+v5z1Axw7tJGK0d2q/DkuPO
X-Received: by 10.98.34.210 with SMTP id p79mr5909407pfj.107.1465499202155;
	Thu, 09 Jun 2016 12:06:42 -0700 (PDT)
Received: from hhz440.kittyhawk.aero ([66.201.63.226])
	by smtp.gmail.com with ESMTPSA id
	n10sm11840181pax.18.2016.06.09.12.06.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jun 2016 12:06:41 -0700 (PDT)
From: Henry Hallam <henry@kittyhawk.aero>
X-Google-Original-From: Henry Hallam <henry@pericynthion.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jun 2016 12:06:38 -0700
Message-Id: <1465499198-340-1-git-send-email-henry@pericynthion.org>
X-Mailer: git-send-email 2.8.1
Subject: [meta-networking][PATCH] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Thu, 09 Jun 2016 19:06:41 -0000

chrony is an alternative to ntpd.  In particular it may be useful
for quasi-realtime embedded systems that have a pulse-per-second
time reference available and need to rapidly synchronize to it after
boot, which appears to be unachievable with ntpd.

Signed-off-by: Henry Hallam <henry@pericynthion.org>
---
 .../recipes-support/chrony/chrony/chrony.conf      | 40 +++++++++++
 .../recipes-support/chrony/chrony/chronyd          | 58 +++++++++++++++
 .../recipes-support/chrony/chrony_2.4.bb           | 83 ++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 meta-networking/recipes-support/chrony/chrony/chrony.conf
 create mode 100644 meta-networking/recipes-support/chrony/chrony/chronyd
 create mode 100644 meta-networking/recipes-support/chrony/chrony_2.4.bb

diff --git a/meta-networking/recipes-support/chrony/chrony/chrony.conf b/meta-networking/recipes-support/chrony/chrony/chrony.conf
new file mode 100644
index 0000000..435a4f9
--- /dev/null
+++ b/meta-networking/recipes-support/chrony/chrony/chrony.conf
@@ -0,0 +1,40 @@
+# Use public NTP servers from the pool.ntp.org project.
+pool pool.ntp.org iburst
+
+# Use a local timeserver in preference to the pool, if it's reachable.
+#server 192.168.22.22 iburst minpoll 2 prefer
+
+# Sync to pulse-per-second from an onboard GPS.
+# refclock PPS /dev/pps0 poll 0 prefer
+# You'll want to enable CONFIG_PPS and CONFIG_PPS_CLIENT_GPIO in your kernel,
+# and an entry something like this in your device tree:
+#	pps {
+#		compatible = "pps-gpio";
+#		gpios = <&ps7_gpio_0 56 0>;
+#	};
+
+# Record the rate at which the system clock gains/loses time,
+# improving accuracy after reboot
+driftfile /var/lib/chrony.drift
+
+# In first three updates step the system clock instead of slew
+# if the adjustment is larger than 1 second.
+makestep 1.0 3
+
+# Enable kernel synchronization of the real-time clock (RTC).
+#rtcsync
+
+# Allow NTP client access from local network.
+#allow 192.168/16
+
+# Serve time even if not synchronized to any NTP server.
+#local stratum 10
+
+# Specify file containing keys for NTP authentication.
+#keyfile /etc/chrony.keys
+
+# Specify directory for log files.
+logdir /var/log/chrony
+
+# Select which information is logged.
+#log measurements statistics tracking
diff --git a/meta-networking/recipes-support/chrony/chrony/chronyd b/meta-networking/recipes-support/chrony/chrony/chronyd
new file mode 100644
index 0000000..04f1b68
--- /dev/null
+++ b/meta-networking/recipes-support/chrony/chrony/chronyd
@@ -0,0 +1,58 @@
+#! /bin/sh
+
+# System V init script for chrony
+# Adapted from the script already in meta-networking for ntpd
+
+### BEGIN INIT INFO
+# Provides:        chrony
+# Required-Start:  $network $remote_fs $syslog
+# Required-Stop:   $network $remote_fs $syslog
+# Default-Start:   2 3 4 5
+# Default-Stop:
+# Short-Description: Start chrony time daemon
+### END INIT INFO
+
+PATH=/sbin:/bin:/usr/bin:/usr/sbin
+
+DAEMON=/usr/sbin/chronyd
+PIDFILE=/var/run/chronyd.pid
+
+test -x $DAEMON -a -r /etc/chrony.conf || exit 0
+
+# Source function library.
+. /etc/init.d/functions
+
+# Functions to do individual actions
+startdaemon(){
+	echo -n "Starting chronyd: "
+	start-stop-daemon --start --quiet --oknodo --pidfile $PIDFILE --startas $DAEMON -- "$@"
+	echo "done"
+}
+stopdaemon(){
+	echo -n "Stopping chronyd: "
+	start-stop-daemon --stop --quiet --oknodo -p $PIDFILE
+	echo "done"
+}
+
+case "$1" in
+  start)
+	startdaemon
+	;;
+  stop)
+  	stopdaemon
+	;;
+  force-reload | restart | reload)
+  	stopdaemon
+	startdaemon
+	;;
+  status)
+	status /usr/sbin/chronyd;
+	exit $?
+	;;
+  *)
+	echo "Usage: chronyd { start | stop | status | restart | reload }" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-support/chrony/chrony_2.4.bb b/meta-networking/recipes-support/chrony/chrony_2.4.bb
new file mode 100644
index 0000000..2b6ae5b
--- /dev/null
+++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
@@ -0,0 +1,83 @@
+SUMMARY = "Versatile implementation of the Network Time Protocol"
+DESCRIPTION = "Chrony can synchronize the system clock with NTP \
+servers, reference clocks (e.g. GPS receiver), and manual input using \
+wristwatch and keyboard. It can also operate as an NTPv4 (RFC 5905) \
+server and peer to provide a time service to other computers in the \
+network. \
+\
+It is designed to perform well in a wide range of conditions, \
+including intermittent network connections, heavily congested \
+networks, changing temperatures (ordinary computer clocks are \
+sensitive to temperature), and systems that do not run continuosly, or \
+run on a virtual machine. \
+\
+Typical accuracy between two machines on a LAN is in tens, or a few \
+hundreds, of microseconds; over the Internet, accuracy is typically \
+within a few milliseconds. With a good hardware reference clock \
+sub-microsecond accuracy is possible. \
+\
+Two programs are included in chrony: chronyd is a daemon that can be \
+started at boot time and chronyc is a command-line interface program \
+which can be used to monitor chronyd's performance and to change \
+various operating parameters whilst it is running."
+
+HOMEPAGE = "http://chrony.tuxfamily.org/"
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "libcap readline"
+# It's probably a bad idea to run chrony and ntpd on the same system.
+RCONFLICTS_${PN} = "ntp"
+
+SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
+	   file://chrony.conf \
+	   file://chronyd"
+
+SRC_URI[md5sum] = "d0598aa8a9be8faccef9386f6fc0d5f2"
+SRC_URI[sha256sum] = "8d04e7cda2333289c2104b731d39c3c1db94816e43bae35d7ee4e7ae8af6391f"
+
+# Note: chrony does not use autotools, although it is built via './configure; make; make install'.
+inherit update-rc.d systemd
+
+CONFFILES_${PN} = "${sysconfdir}/chrony.conf"
+
+INITSCRIPT_NAME = "chronyd"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "chronyd.service"
+
+do_configure() {
+	./configure --sysconfdir=${sysconfdir} --bindir=${bindir} --sbindir=${sbindir} --localstatedir=${localstatedir} --datarootdir=${datadir}
+}
+
+do_compile() {
+	make ${PARALLEL_MAKE}
+}
+
+do_install() {
+	# binaries
+        install -d ${D}${bindir}
+        install -m 0755 ${S}/chronyc ${D}${bindir}
+        install -d ${D}${sbindir}
+        install -m 0755 ${S}/chronyd ${D}${sbindir}
+
+        # config files
+        install -d ${D}${sysconfdir}
+	install -m 644 ${WORKDIR}/chrony.conf ${D}${sysconfdir}
+
+	# System V init scripts
+	install -d ${D}${sysconfdir}/init.d
+	install -m 755 ${WORKDIR}/chronyd ${D}${sysconfdir}/init.d
+	
+	# systemd unit
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/system/
+	
+        # variable data (for drift file)
+        install -d ${D}${localstatedir}/lib/chrony
+
+        # log files
+        install -d ${D}${localstatedir}/log/chrony
+}
-- 
2.8.1


