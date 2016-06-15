Return-Path: <henry@kittyhawk.aero>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 09B46700FD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 18:17:46 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id bz2so9694943pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kittyhawk-aero.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zk9ixjxiHFejTbUREsmWGO/ZD/D+QnUZf8OrAR6cA1g=;
	b=MQNf0up7kRJ8AoJKtAaueUucERCn3Z6ayI+qg/0V2mYxkv6MdUlv/YF/JSlyF6+9CK
	eA/QxKdQr8NAP/7fUFHW64BvgqXoTuBG7BmN5NGQu0ERO/SCMGFsnZYZ5eNM77hPPF0Z
	5L1uphQgEaxC3V7BMJy7nSYBBBsrDBw/hNnmqELRF2yJjohAoGqvbMqrzWD7zJPIDGrs
	dsnTeOhB9hWe5NCcp6GupBw6IQU7T9O+NDzTa/x9zXXJWr7ymI+Y9MutcTdaDLgjT8zF
	SkFV0WbYT3JCqomz1C/+QBOuESFfbfx2xniysYf9EjyAuI8jJlhUkLPWEtVRoClzmy7m
	Qtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zk9ixjxiHFejTbUREsmWGO/ZD/D+QnUZf8OrAR6cA1g=;
	b=eKdR/VvsSmynuog3Kx1P8czoL+MsS+afvRRAOCEoK04+SPtM4K+VL9NaINIdBZNkOd
	E+MFVej7JW2e0isZQNHfV4AaDluA6/qDiGUKxSEEJTvnPxBfQLKq+eOeDCF5+y6YKqwm
	7mJtFhRlB10/cq75jfbfOGvbZifG5ZLHhTtCaokJj69PUUaIKMGJdNMuS7jyJ2oEYIa0
	bKTl7LA8xKEp0+LNE5oC9JQuEP8PSaeY46Z3vvFQhoIF4hctr5S7jeaG9MSEtdHPjiMP
	yjplFG7+4SOTo3RZ7X/N/2amnAGhoamMEY2m7c0L95IXYwfpkX/Zot3diE91KNOJrWqc
	pBaQ==
X-Gm-Message-State: ALyK8tLMOLvYMIQ6pIC6vR6tB4B/kDF39FBr8bG/v0jRMeQ03lRTX2ADJyFremts92REK2c6
X-Received: by 10.66.222.98 with SMTP id ql2mr23469pac.137.1466014667149;
	Wed, 15 Jun 2016 11:17:47 -0700 (PDT)
Received: from hhz440.kittyhawk.aero ([66.201.63.226])
	by smtp.gmail.com with ESMTPSA id
	fj13sm54714780pab.0.2016.06.15.11.17.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jun 2016 11:17:46 -0700 (PDT)
From: Henry Hallam <henry@kittyhawk.aero>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 11:17:27 -0700
Message-Id: <1466014647-56745-2-git-send-email-henry@kittyhawk.aero>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466014647-56745-1-git-send-email-henry@kittyhawk.aero>
References: <D56F5A73-035E-4C81-9CEE-F23311639B42@dominion.thruhere.net>
	<1466014647-56745-1-git-send-email-henry@kittyhawk.aero>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCHv3] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Wed, 15 Jun 2016 18:17:47 -0000

From: Henry Hallam <henry@pericynthion.org>

chrony is an alternative to ntpd.  In particular it may be useful
for quasi-realtime embedded systems that have a pulse-per-second
time reference available and need to rapidly synchronize to it after
boot, which appears to be unachievable with ntpd.

Signed-off-by: Henry Hallam <henry@pericynthion.org>
---
 .../recipes-support/chrony/chrony/chrony.conf      |  44 +++++++
 .../recipes-support/chrony/chrony/chronyd          |  58 ++++++++++
 .../recipes-support/chrony/chrony_2.4.bb           | 127 +++++++++++++++++++++
 3 files changed, 229 insertions(+)
 create mode 100644 meta-networking/recipes-support/chrony/chrony/chrony.conf
 create mode 100644 meta-networking/recipes-support/chrony/chrony/chronyd
 create mode 100644 meta-networking/recipes-support/chrony/chrony_2.4.bb

diff --git a/meta-networking/recipes-support/chrony/chrony/chrony.conf b/meta-networking/recipes-support/chrony/chrony/chrony.conf
new file mode 100644
index 0000000..8d226d3
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
+# In first three updates step the system clock instead of slew
+# if the adjustment is larger than 1 second.
+makestep 1.0 3
+
+# Record the rate at which the system clock gains/loses time,
+# improving accuracy after reboot
+driftfile /var/lib/chrony/drift
+
+# Enable kernel synchronization of the hardware real-time clock (RTC).
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
index 0000000..aa37caa
--- /dev/null
+++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
@@ -0,0 +1,127 @@
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
+sensitive to temperature), and systems that do not run continuously, or \
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
+various operating parameters whilst it is running. \
+\
+This recipe produces two binary packages: 'chrony' which contains chronyd, \
+the configuration file and the init script, and 'chronyc' which contains \
+the client program only."
+
+HOMEPAGE = "http://chrony.tuxfamily.org/"
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
+	   file://chrony.conf \
+	   file://chronyd"
+SRC_URI[md5sum] = "d0598aa8a9be8faccef9386f6fc0d5f2"
+SRC_URI[sha256sum] = "8d04e7cda2333289c2104b731d39c3c1db94816e43bae35d7ee4e7ae8af6391f"
+
+DEPENDS = "pps-tools"
+
+# Note: Despite being built via './configure; make; make install',
+#       chrony does not use GNU Autotools.
+inherit update-rc.d systemd
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
+    # systemd unit configuration file
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/system/
+    
+    # Variable data (for drift and/or rtc file)
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
+
+FILES_${PN} = "${sbindir}/chronyd ${sysconfdir} ${localstatedir}"
+CONFFILES_${PN} = "${sysconfdir}/chrony.conf"
+INITSCRIPT_NAME = "chronyd"
+INITSCRIPT_PARAMS = "defaults"
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "chronyd.service"
+
+# It's probably a bad idea to run chrony and another time daemon on
+# the same system.  systemd includes the SNTP client 'timesyncd', which
+# will be disabled by chronyd.service, however it will remain on the rootfs
+# wasting 150 kB unless you put 'PACKAGECONFIG_remove_pn-systemd = "timesyncd"'
+# in a conf file or bbappend somewhere.
+RCONFLICTS_${PN} = "ntp ntimed"
+
+# Separate the client program into its own package
+PACKAGES =+ "chronyc"
+FILES_chronyc = "${bindir}/chronyc"
-- 
2.8.1


