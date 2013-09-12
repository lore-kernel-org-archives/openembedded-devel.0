Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id D02FA600A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:27:33 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8CFRW9E022993; 
	Thu, 12 Sep 2013 10:27:34 -0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2013 20:28:52 +0500
Message-Id: <2833ee588a108d99fb999bb8b21b297ec4af97fa.1378998806.git.muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378998806.git.muhammad_shakeel@mentor.com>
References: <cover.1378998806.git.muhammad_shakeel@mentor.com>
Subject: [meta-oe][meta-systemd][PATCH 1/3] openssh: Remove systemd support which is merged in oe-core
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
X-List-Received-Date: Thu, 12 Sep 2013 15:27:34 -0000

OE-Core has been updated to support openssh with systemd. Stuff here is
not required anymore.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../openssh/openssh/sshd.socket                    |   11 -----------
 .../openssh/openssh/sshd@.service                  |    9 ---------
 .../openssh/openssh/sshdgenkeys.service            |   10 ----------
 .../openssh/openssh_6.2p2.bbappend                 |   16 ----------------
 4 files changed, 46 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd.socket
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd@.service
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshdgenkeys.service

diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd.socket b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd.socket
deleted file mode 100644
index 753a33b..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd.socket
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Conflicts=sshd.service
-
-[Socket]
-ExecStartPre=/bin/mkdir -p /var/run/sshd
-ListenStream=22
-Accept=yes
-
-[Install]
-WantedBy=sockets.target
-Also=sshdgenkeys.service
diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd@.service b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd@.service
deleted file mode 100644
index d118490..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshd@.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=OpenSSH Per-Connection Daemon
-After=sshdgenkeys.service
-
-[Service]
-ExecStart=-/usr/sbin/sshd -i
-ExecReload=/bin/kill -HUP $MAINPID
-StandardInput=socket
-StandardError=syslog
diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshdgenkeys.service
deleted file mode 100644
index c717214..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh/sshdgenkeys.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=SSH Key Generation
-
-[Service]
-ExecStart=/usr/bin/ssh-keygen -A
-Type=oneshot
-RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p2.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p2.bbappend
index d9ad9ba..dadbc14 100644
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p2.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p2.bbappend
@@ -1,19 +1,3 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SYSTEMD_PACKAGES = "${PN}-sshd"
-SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
-FILES_${PN}-sshd += "${systemd_unitdir}/system/sshd.socket"
 RPROVIDES_${PN}-sshd += "${PN}-sshd-systemd"
 RREPLACES_${PN}-sshd += "${PN}-sshd-systemd"
 RCONFLICTS_${PN}-sshd += "${PN}-sshd-systemd"
-
-inherit systemd
-
-SRC_URI += "file://sshd.socket file://sshd@.service file://sshdgenkeys.service"
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.7.9.5


