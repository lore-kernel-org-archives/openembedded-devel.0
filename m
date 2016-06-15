Return-Path: <henry@kittyhawk.aero>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3574960761
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 02:12:55 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id hl6so2307984pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 19:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kittyhawk-aero.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a2eiZcyZobqOEFgi+URTNUp+i2Bk39/OenRowIryPbw=;
	b=IGAZDMklwNqmbTe97/6P9CActdAe5fR8KVj+rujqBAAQpkGbEWh/YmKr2J03rNsGwt
	pFBT7ogNjrr+5xENrnr5u4gkDG+M0GkdHhcnXmSHu2to+QbzeT7nrRKxAUZuRELucQLg
	5XBfyOjpLlRtGb+H91e+hLbpwVxP+4o06TkZsGVYvtSM224hTTNSkTdzmR65y4jiqR8w
	bcMBI249DW28zJSPYNbhiwsMDTjCP0Mjlshqg4eJ7r5VDqEBHLAT/sIoYBR9H/d8V8xt
	GBpBQac80YHay9uQolWO+25v9Kozv4s1sPaY2caX01ykCoVKv5h0giCtXvkLJ3DdkaXs
	i+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a2eiZcyZobqOEFgi+URTNUp+i2Bk39/OenRowIryPbw=;
	b=A1CcxF44ruS08vCcfzehdHH35fqLwohic+NhWCoJViwcIGLDLBwqRMm5WeMfSVrT5R
	lozNTQUcsHi3F6KlhpiGcMk7fpZjELT2jzEH0IZkBWIOgSg8FEr4MfIUG8N5h2j2imQ7
	9LevzetZy5794GdsH+GukeEHmlg8TiRsxfQJ3Uu8dgMVeOt1MoFsIJxFPR2/qXjgBB0a
	S3NYueLWu2Dn1lz5qTPEfEzIkPd3lDutyLKbbGf895CBiQNgHJm94eGdcRMqYHzbOqTJ
	vpg+ebJidMzOqgW+hYlPzXB5EilGqeeUzmj0UY64P3NZdS9Khs59wmLYQXRVkPpsjihC
	/hNA==
X-Gm-Message-State: ALyK8tI6rB5BGZ5s6R/Y5lfG0TvvByKY0XAfkOW55L9tYSAT/f5bQMGjaKUnraBzobbFjN6n
X-Received: by 10.66.189.167 with SMTP id gj7mr997975pac.0.1465956775124;
	Tue, 14 Jun 2016 19:12:55 -0700 (PDT)
Received: from hhz440.kittyhawk.aero ([66.201.63.226])
	by smtp.gmail.com with ESMTPSA id
	vy8sm48301871pab.22.2016.06.14.19.12.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jun 2016 19:12:54 -0700 (PDT)
From: Henry Hallam <henry@kittyhawk.aero>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2016 19:12:20 -0700
Message-Id: <1465956740-84841-2-git-send-email-henry@kittyhawk.aero>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1465956740-84841-1-git-send-email-henry@kittyhawk.aero>
References: <CA+chaQe1rcKeNpny-bpghrLtz8eOpghos9jBPf95obvbC8ucuw@mail.gmail.com>
	<1465956740-84841-1-git-send-email-henry@kittyhawk.aero>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH v2] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Wed, 15 Jun 2016 02:12:56 -0000

From: Henry Hallam <henry@pericynthion.org>

chrony is an alternative to ntpd.  In particular it may be useful
for quasi-realtime embedded systems that have a pulse-per-second
time reference available and need to rapidly synchronize to it after
boot, which appears to be unachievable with ntpd.

Signed-off-by: Henry Hallam <henry@pericynthion.org>
---
 .../recipes-support/chrony/chrony/chrony.conf      |  44 ++++++++
 .../recipes-support/chrony/chrony/chronyd          |  58 ++++++++++
 .../recipes-support/chrony/chrony_2.4.bb           | 120 +++++++++++++++++++++
 3 files changed, 222 insertions(+)
 create mode 100644 meta-networking/recipes-support/chrony/chrony/chrony.conf
 create mode 100644 meta-networking/recipes-support/chrony/chrony/chronyd
 create mode 100644 meta-networking/recipes-support/chrony/chrony_2.4.bb

diff --git a/meta-networking/recipes-support/chrony/chrony/chrony.conf b/meta-networking/recipes-support/chrony/chrony/chrony.conf
new file mode 100644
index 0000000..95f5f81
--- /dev/null
+++ b/meta-networking/recipes-support/chrony/chrony/chrony.conf
@@ -0,0 +1,44 @@
+# Use public NTP servers from the pool.ntp.org project.
+# Please consider joining the pool project if possible by running your own
+# server(s).
+# If you are a vendor distributing a product using chrony, you *MUST*
+# read and comply with http://www.pool.ntp.org/vendors.html
+pool 0.openembedded.pool.ntp.org iburst
+
+# Use a local timeserver in preference to the pool, if it's reachable.
+#server 192.168.22.22 iburst minpoll 2 prefer
+
+# Sync to pulse-per-second from an onboard GPS.
+#refclock PPS /dev/pps0 poll 0 prefer
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
+rtcsync
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
index 0000000..07d312e
--- /dev/null
+++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
@@ -0,0 +1,120 @@
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
+DEPENDS = "pps-tools"
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
+# Note: Despite being built via './configure; make; make install',
+#       chrony does not use GNU Autotools.
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
+# Configuration options:
+# - For command line editing support in chronyc, you may specify either
+#   'editline' or 'readline' but not both.  editline is smaller, but
+#   many systems already have readline for other purposes so you might want
+#   to choose that instead.  However, beware license incompatibility
+#   since chrony is GPLv2 and readline versions after 6.0 are GPLv3+.
+#   You can of course choose neither, but if you're that tight on space
+#   consider dropping chronyc entirely (you can use it remotely with
+#   appropriate chrony.conf options).
+# - Security-related:
+#   - 'sechash' is omitted by default because it pulls in nss which is huge.
+#   - 'privdrop' allows chronyd to run as non-root; would need changes to
+#     chrony.conf and init script.
+#   - 'scfilter' enables support for system call filtering, but requires the
+#     kernel to have CONFIG_SECCOMP enabled.
+PACKAGECONFIG ??= "editline scfilter"
+PACKAGECONFIG[readline] = "--without-editline,--without-readline,readline"
+PACKAGECONFIG[editline] = ",--without-editline,libedit"
+PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
+PACKAGECONFIG[privdrop] = ",--disable-privdrop,libcap"
+PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp"
+
+# --disable-static isn't supported by chrony's configure script.
+DISABLE_STATIC = ""
+
+PACKAGES += "chronyc"
+FILES_${PN} = "${sbindir}/chronyd ${sysconfdir} ${localstatedir}"
+FILES_chronyc = "${bindir}/chronyc"
+
+do_configure() {
+    ./configure --sysconfdir=${sysconfdir} --bindir=${bindir} --sbindir=${sbindir} \
+                --localstatedir=${localstatedir} --datarootdir=${datadir} \
+                ${EXTRA_OECONF}
+}
+
+do_install() {
+    # Binaries
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/chronyc ${D}${bindir}
+    install -d ${D}${sbindir}
+    install -m 0755 ${S}/chronyd ${D}${sbindir}
+
+    # Config file
+    install -d ${D}${sysconfdir}
+    install -m 644 ${WORKDIR}/chrony.conf ${D}${sysconfdir}
+
+    # System V init script
+    install -d ${D}${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/chronyd ${D}${sysconfdir}/init.d
+    
+    # Systemd unit
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/system/
+    
+    # Variable data (for drift file)
+    install -d ${D}${localstatedir}/lib/chrony
+
+    # Log files
+    install -d ${D}${localstatedir}/log/chrony
+
+    # Fix hard-coded paths in config files and init scripts
+    sed -i -e 's!/var/!${localstatedir}/!g' -e 's!/etc/!${sysconfdir}/!g' \
+           -e 's!/usr/sbin/!${sbindir}/!g' -e 's!/usr/bin/!${bindir}/!g' \
+           ${D}${sysconfdir}/chrony.conf \
+           ${D}${sysconfdir}/init.d/chronyd \
+           ${D}${systemd_unitdir}/system/chronyd.service
+    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/chronyd
+    sed -i 's!^EnvironmentFile=.*!EnvironmentFile=-${sysconfdir}/default/chronyd!' ${D}${systemd_unitdir}/system/chronyd.service
+}
-- 
2.8.1


