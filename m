Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ra8lk-0006YA-RQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 17:30:24 +0100
Received: by eaal1 with SMTP id l1so1225875eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 08:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=B0wqgl0HzzRl7FgtmdOfOake/lFgBmRz+T+iAY449zQ=;
	b=cUd/zhdeClo0OY0KWq3LHY8SRg/hlEcDVJDwlAOTOdaBD2Cf/usrzPNmc1NkdjzvjF
	YPbG/9tQuq9RX8qTxGl1NxNZ7jS+fRt6O3c1cgHr519KgToJuV0Gedh6JGizlUZMe0k2
	xrqVrOcn4FPY55jSkY3jWpinL1xdQ7H1Z8efU=
Received: by 10.213.3.14 with SMTP id 14mr2099411ebl.110.1323707007211;
	Mon, 12 Dec 2011 08:23:27 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 65sm76988782eeg.8.2011.12.12.08.23.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 08:23:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 17:23:15 +0100
Message-Id: <1323706995-23065-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH][meta-oe] openssh_5.9p1.bbappend: add systemd units
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2011 16:30:24 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../openssh/openssh/sshd.socket                    |   11 ++++++++++
 .../openssh/openssh/sshd@.service                  |    9 ++++++++
 .../openssh/openssh/sshdgenkeys.service            |   10 +++++++++
 .../openssh/openssh_5.9p1.bbappend                 |   22 ++++++++++++++++++++
 4 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/openssh/openssh/sshd.socket
 create mode 100644 meta-oe/recipes-connectivity/openssh/openssh/sshd@.service
 create mode 100644 meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service
 create mode 100644 meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend

diff --git a/meta-oe/recipes-connectivity/openssh/openssh/sshd.socket b/meta-oe/recipes-connectivity/openssh/openssh/sshd.socket
new file mode 100644
index 0000000..753a33b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/openssh/openssh/sshd.socket
@@ -0,0 +1,11 @@
+[Unit]
+Conflicts=sshd.service
+
+[Socket]
+ExecStartPre=/bin/mkdir -p /var/run/sshd
+ListenStream=22
+Accept=yes
+
+[Install]
+WantedBy=sockets.target
+Also=sshdgenkeys.service
diff --git a/meta-oe/recipes-connectivity/openssh/openssh/sshd@.service b/meta-oe/recipes-connectivity/openssh/openssh/sshd@.service
new file mode 100644
index 0000000..d118490
--- /dev/null
+++ b/meta-oe/recipes-connectivity/openssh/openssh/sshd@.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=OpenSSH Per-Connection Daemon
+After=sshdgenkeys.service
+
+[Service]
+ExecStart=-/usr/sbin/sshd -i
+ExecReload=/bin/kill -HUP $MAINPID
+StandardInput=socket
+StandardError=syslog
diff --git a/meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service
new file mode 100644
index 0000000..c717214
--- /dev/null
+++ b/meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=SSH Key Generation
+
+[Service]
+ExecStart=/usr/bin/ssh-keygen -A
+Type=oneshot
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
new file mode 100644
index 0000000..3f68e09
--- /dev/null
+++ b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
@@ -0,0 +1,22 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+SYSTEMD_PACKAGES = "openssh-sshd-systemd"
+SYSTEMD_SERVICE = "sshd.socket"
+
+inherit systemd
+
+SRC_URI += "file://sshd.socket file://sshd@.service file://sshdgenkeys.service"
+
+do_install_append() {
+       install -d ${D}${base_libdir}/systemd/system
+       install -m 644 ${WORKDIR}/sshd.socket ${D}${base_libdir}/systemd/system
+       install -m 644 ${WORKDIR}/sshd@.service ${D}${base_libdir}/systemd/system
+       install -m 644 ${WORKDIR}/sshdgenkeys.service ${D}${base_libdir}/systemd/system
+}
+
+PACKAGES =+ "openssh-sshd-systemd"
+
+FILES_openssh-sshd-systemd += "${base_libdir}/systemd"
+RDEPENDS_openssh-sshd-systemd += "openssh-sshd"
-- 
1.7.8



