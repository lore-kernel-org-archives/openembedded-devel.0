Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2617276FF2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2015 17:39:24 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so60185477wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2015 10:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cG1Zjps0RlIApWaDMlBJZjqX/thESYdn6QQjfQcNsSM=;
	b=QswP5AghnomOX699GRBmwzpVbf5XNJDRWx/JDCOP/KsQhTPC/Z+4Fz+kDSBktTN+MH
	JgUDC7fjUfAjRkBGAcuMpFXYcI5InFLinFvzctqSWTuKmY9MzblZlWB0NJXPK4OtnN/I
	Vv0yan+dFb4G9x86hQHEY1+ySMRoCZcPqxuijp5hfoQjBzL0plM+IoaSnLQpnT83AGQP
	2Klyjvkgjcr9EIIkPl6SP8klVNP/Gr2d/lVaSmVW79uOU2kCJwNqX8GbxSTnkBiZ7IIi
	vMLICL3Ij+2Qy8QLIBw5NZ1okfow4T6t5S0/z2LoI7ccHyBe24X5gEle78MzbZX/PVON
	3stg==
X-Gm-Message-State: ALoCoQkrxFZdXFjZJfEB7TN0rJeqADD/glZ9/omIn7u+bYxshtaNV0cWB4dbDGmPwJCvKTsJpQ2Q
X-Received: by 10.180.72.35 with SMTP id a3mr16002146wiv.21.1441301963936;
	Thu, 03 Sep 2015 10:39:23 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by smtp.gmail.com with ESMTPSA id
	wo2sm38816947wjb.2.2015.09.03.10.39.22
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 03 Sep 2015 10:39:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Sep 2015 19:39:16 +0200
Message-Id: <1441301956-12792-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH] sshguard 1.6.1+git: add recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 17:39:27 -0000

SSHguard protects hosts from brute-force attacks against SSH and other
services.

This recipe uses iptables as blocker backend and journald as log backend.

When it's working it will look like this in syslog:

Sep 03 19:35:29 soekris sshguard[27044]: Started with danger threshold=40 ; minimum block=420 seconds
Sep 03 19:35:29 soekris sshguard[27044]: Blocking 24.234.171.90:4 for >630secs: 40 danger in 4 attacks over 0 seconds (all: 40d in 1 abuses over 0s).
Sep 03 19:35:29 soekris sshguard[27044]: Blocking 61.182.15.194:4 for >630secs: 40 danger in 4 attacks over 0 seconds (all: 40d in 1 abuses over 0s).
Sep 03 19:35:29 soekris sshguard[27044]: Blocking 115.58.38.53:4 for >630secs: 40 danger in 4 attacks over 0 seconds (all: 40d in 1 abuses over 0s).

And the iptable rules:

root@soekris:~# iptables -L sshguard --line-numbers
Chain sshguard (1 references)
num  target     prot opt source               destination
1    DROP       all  --  hn.kd.ny.adsl        anywhere
2    DROP       all  --  61.182.15.194        anywhere
3    DROP       all  --  wsip-24-234-171-90.lv.lv.cox.net  anywhere

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-support/sshguard/sshguard/firewall     | 48 ++++++++++++++++++++++
 .../sshguard/sshguard/sshguard-journalctl          |  2 +
 .../sshguard/sshguard/sshguard.service             | 12 ++++++
 .../recipes-support/sshguard/sshguard_git.bb       | 38 +++++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 meta-networking/recipes-support/sshguard/sshguard/firewall
 create mode 100644 meta-networking/recipes-support/sshguard/sshguard/sshguard-journalctl
 create mode 100644 meta-networking/recipes-support/sshguard/sshguard/sshguard.service
 create mode 100644 meta-networking/recipes-support/sshguard/sshguard_git.bb

diff --git a/meta-networking/recipes-support/sshguard/sshguard/firewall b/meta-networking/recipes-support/sshguard/sshguard/firewall
new file mode 100644
index 0000000..b683368
--- /dev/null
+++ b/meta-networking/recipes-support/sshguard/sshguard/firewall
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+#
+# Function that enables firewall
+#
+do_enable_firewall()
+{
+	# creating sshguard chain
+	iptables -N sshguard 2> /dev/null
+	ip6tables -N sshguard 2> /dev/null
+	# block traffic from abusers
+	iptables -I INPUT -j sshguard 2> /dev/null
+	ip6tables -I INPUT -j sshguard 2> /dev/null
+}
+#
+# Function that disables firewall
+#
+do_disable_firewall()
+{
+	# flushes list of abusers
+	iptables -F sshguard 2> /dev/null
+	ip6tables -F sshguard 2> /dev/null
+	# removes sshguard firewall rules
+	iptables -D INPUT -j sshguard 2> /dev/null
+	ip6tables -D INPUT -j sshguard 2> /dev/null
+	# removing sshguard chain
+	iptables -X sshguard 2> /dev/null
+	ip6tables -X sshguard 2> /dev/null
+}
+
+case "$1" in
+    enable)
+	do_enable_firewall
+	;;
+    disable)
+	do_disable_firewall
+	;;
+    restart)
+	do_disable_firewall
+	do_enable_firewall
+	;;
+    *)
+	exit 1
+	;;
+esac
+	
+exit 0
+
diff --git a/meta-networking/recipes-support/sshguard/sshguard/sshguard-journalctl b/meta-networking/recipes-support/sshguard/sshguard/sshguard-journalctl
new file mode 100644
index 0000000..e7c615b
--- /dev/null
+++ b/meta-networking/recipes-support/sshguard/sshguard/sshguard-journalctl
@@ -0,0 +1,2 @@
+#!/bin/sh
+/bin/journalctl -fb -t sshd -n100 | /usr/sbin/sshguard -l- "$@"
diff --git a/meta-networking/recipes-support/sshguard/sshguard/sshguard.service b/meta-networking/recipes-support/sshguard/sshguard/sshguard.service
new file mode 100644
index 0000000..e2590fa
--- /dev/null
+++ b/meta-networking/recipes-support/sshguard/sshguard/sshguard.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=SSHGuard
+After=network.service
+
+[Service]
+PIDFile=/run/sshguard.pid
+ExecStartPre=/usr/lib/sshguard/firewall enable
+ExecStopPost=/usr/lib/sshguard/firewall disable
+ExecStart=/usr/lib/sshguard/sshguard-journalctl -i /run/sshguard.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/sshguard/sshguard_git.bb b/meta-networking/recipes-support/sshguard/sshguard_git.bb
new file mode 100644
index 0000000..04435e8
--- /dev/null
+++ b/meta-networking/recipes-support/sshguard/sshguard_git.bb
@@ -0,0 +1,38 @@
+SUMMARY = "SSHguard protects hosts from brute-force attacks against SSH and other services."
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=47a33fc98cd20713882c4d822a57bf4d"
+
+PV = "1.6.1+git${SRCPV}"
+
+SRCREV = "019a0406811a536faf3f90cdd7a0a538ee24d789"
+SRC_URI = "git://bitbucket.org/sshguard/sshguard.git;protocol=https;branch=1.6 \
+           file://firewall \
+           file://sshguard.service \
+           file://sshguard-journalctl \
+          "
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "flex-native"
+
+inherit autotools-brokensep systemd
+
+EXTRA_OECONF += " --with-firewall=iptables \
+                  --with-iptables=${sbindir}/iptables \
+                "
+
+do_install_append() {
+    install -d ${D}${libdir}/sshguard
+    install -m 0755 ${WORKDIR}/firewall ${D}${libdir}/sshguard
+    install -m 0755 ${WORKDIR}/sshguard-journalctl ${D}${libdir}/sshguard
+
+    sed -i -e s:/bin:${base_bindir}:g -e s:/usr/sbin:${sbindir}:g ${D}${libdir}/sshguard/sshguard-journalctl
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/sshguard.service ${D}${systemd_unitdir}/system
+    sed -i -e s:/usr/lib:${libdir}:g ${D}${systemd_unitdir}/system/sshguard.service 
+}
+
+FILES_${PN} += "${systemd_unitdir}"
+RDEPENDS_${PN} += "iptables"
-- 
2.0.1


