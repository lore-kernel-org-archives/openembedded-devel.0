Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A38E87879C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vANC9SpA025836
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 04:09:28 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:28 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:05 -0500
Message-ID: <085f6c2ff1f4ee1a8c14658a687b1df10039fa8d.1511437793.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/15] meta-installer: add systemd/systemd-serialgetty bbappend
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:27 -0000
Content-Type: text/plain

Use screen for text install, the serail console and tty1
will have the same input/output.

The bbappend works only if DISTRO = "anaconda".

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../systemd/files/serial-getty@.service            | 40 ++++++++++++++++++++++
 .../systemd/files/serial-screen-anaconda.sh        |  5 +++
 .../systemd/systemd-serialgetty.bbappend           | 12 +++++++
 .../recipes-core/systemd/systemd_%.bbappend        |  6 ++++
 4 files changed, 63 insertions(+)
 create mode 100644 meta-installer/recipes-core/systemd/files/serial-getty@.service
 create mode 100644 meta-installer/recipes-core/systemd/files/serial-screen-anaconda.sh
 create mode 100644 meta-installer/recipes-core/systemd/systemd-serialgetty.bbappend
 create mode 100644 meta-installer/recipes-core/systemd/systemd_%.bbappend

diff --git a/meta-installer/recipes-core/systemd/files/serial-getty@.service b/meta-installer/recipes-core/systemd/files/serial-getty@.service
new file mode 100644
index 0000000..52530a3
--- /dev/null
+++ b/meta-installer/recipes-core/systemd/files/serial-getty@.service
@@ -0,0 +1,40 @@
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU Lesser General Public License as published by
+#  the Free Software Foundation; either version 2.1 of the License, or
+#  (at your option) any later version.
+
+[Unit]
+Description=Serial Getty on %I
+Documentation=man:agetty(8) man:systemd-getty-generator(8)
+Documentation=http://0pointer.de/blog/projects/serial-console.html
+BindsTo=dev-%i.device
+Requires=anaconda-init.service
+After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service
+After=rc-local.service
+After=anaconda-init.target anaconda-init.service
+
+# If additional gettys are spawned during boot then we should make
+# sure that this is synchronized before getty.target, even though
+# getty.target didn't actually pull it in.
+Before=getty.target
+IgnoreOnIsolate=yes
+
+[Service]
+Environment=TERM=xterm HOME=@ROOT_HOME@ PATH=/usr/bin:/bin:/sbin:/usr/sbin LANG=en_US.UTF-8
+ExecStart=-/sbin/agetty -8 --keep-baud  -n -l /bin/bash -o '--login' %I @BAUDRATE@ $TERM
+WorkingDirectory=@ROOT_HOME@
+Type=idle
+Restart=always
+RestartSec=0
+UtmpIdentifier=%I
+TTYPath=/dev/%I
+TTYReset=yes
+TTYVHangup=yes
+KillMode=process
+IgnoreSIGPIPE=no
+SendSIGHUP=yes
+
+[Install]
+WantedBy=getty.target
diff --git a/meta-installer/recipes-core/systemd/files/serial-screen-anaconda.sh b/meta-installer/recipes-core/systemd/files/serial-screen-anaconda.sh
new file mode 100644
index 0000000..8ab9471
--- /dev/null
+++ b/meta-installer/recipes-core/systemd/files/serial-screen-anaconda.sh
@@ -0,0 +1,5 @@
+# Detect if it is serial tty, if yes, we need to invoke
+# screen to attach anaconda
+console=`/usr/bin/tty`
+[ "${console##/dev/ttyS}" != "${console}" ] && /usr/bin/screen -x anaconda-init
+
diff --git a/meta-installer/recipes-core/systemd/systemd-serialgetty.bbappend b/meta-installer/recipes-core/systemd/systemd-serialgetty.bbappend
new file mode 100644
index 0000000..afbd9b6
--- /dev/null
+++ b/meta-installer/recipes-core/systemd/systemd-serialgetty.bbappend
@@ -0,0 +1,12 @@
+FILESEXTRAPATHS_prepend_anaconda := "${THISDIR}/files:"
+
+SRC_URI_append_anaconda = " file://serial-getty@.service \
+           file://serial-screen-anaconda.sh \
+"
+
+do_install_append_anaconda() {
+	install -d ${D}${sysconfdir}/profile.d
+	install -m 644 ${WORKDIR}/serial-screen-anaconda.sh ${D}${sysconfdir}/profile.d/
+
+	sed -i -e 's,@ROOT_HOME@,${ROOT_HOME},g' ${D}${systemd_unitdir}/system/serial-getty@.service
+}
diff --git a/meta-installer/recipes-core/systemd/systemd_%.bbappend b/meta-installer/recipes-core/systemd/systemd_%.bbappend
new file mode 100644
index 0000000..3145f68
--- /dev/null
+++ b/meta-installer/recipes-core/systemd/systemd_%.bbappend
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS_prepend_anaconda := "${THISDIR}/files:"
+
+do_install_append_anaconda() {
+	ln -nsf ${systemd_unitdir}/system/anaconda-init-screen@.service \
+		${D}${sysconfdir}/systemd/system/getty.target.wants/getty@tty1.service
+}
-- 
2.8.1


