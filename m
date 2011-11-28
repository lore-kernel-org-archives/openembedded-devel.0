Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RV0ny-0007jc-RZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 13:59:33 +0100
Received: by yenl4 with SMTP id l4so611471yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 04:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=BdKQsaFHiL2byEPSVoFSnV0U601buT0skFNsIYE6ZC4=;
	b=NNIiPDaMKzUqf1GqxhdywCanqFShAvRbugMLSdrS69x1rB3kwP6tcYZf1+ZsmOY/me
	jawLlKeUS+PB7XB0MVCv8tR5qqpt1pMS3htyaSGpYtnfNIOXeHTnS30yb01A2C19obEY
	BuYTidEajb512cXLqNNNQC9nsRdnx3knf6AoA=
Received: by 10.236.72.167 with SMTP id t27mr60517802yhd.127.1322484772166;
	Mon, 28 Nov 2011 04:52:52 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm50577181yhk.1.2011.11.28.04.52.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 04:52:51 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 12:52:39 +0000
Message-Id: <e32fd0221c36927758fffdda5b4235c39fb5b3d0.1322484731.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1322484731.git.otavio@ossystems.com.br>
References: <cover.1322484731.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1322484731.git.otavio@ossystems.com.br>
References: <cover.1322484731.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] systemd-serialgetty: use a wrapper script to find getty
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
X-List-Received-Date: Mon, 28 Nov 2011 12:59:33 -0000

The following binaries are checked:

  /sbin/agetty
  /sbin/mingetty
  /sbin/getty

So this works out of box in most cases and doesn't enforce one getty
as dependency.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-core/systemd/systemd-serialgetty.bb    |   13 ++++++++++---
 .../systemd-serialgetty/serial-getty@.service      |    2 +-
 .../systemd-serialgetty/systemd-serialgetty        |   13 +++++++++++++
 3 files changed, 24 insertions(+), 4 deletions(-)
 create mode 100755 meta-oe/recipes-core/systemd/systemd-serialgetty/systemd-serialgetty

diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
index 2b88d0c..c79ae84 100644
--- a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
@@ -2,12 +2,13 @@ DESCRIPTION = "Systemd serial config"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
+PR = "r2"
 
 SERIAL_CONSOLE ?= "115200 ttyS0"
 
 SRC_URI = "file://LICENSE \
-           file://serial-getty@.service"
+           file://serial-getty@.service \
+           file://systemd-serialgetty"
 
 def get_baudrate(bb, d):
     return bb.data.getVar('SERIAL_CONSOLE', d, 1).split()[0]
@@ -22,6 +23,9 @@ do_install() {
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
 		install ${WORKDIR}/serial-getty@.service ${D}${base_libdir}/systemd/system/
 
+		# Install wrapper that looks for available getty binary
+		install -m 755 ${WORKDIR}/systemd-serialgetty ${D}${base_libdir}/systemd/
+
 		# enable the service
 		ln -sf ${base_libdir}/systemd/system/serial-getty@.service \
 			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@get_console(bb, d)}.service
@@ -34,5 +38,8 @@ RRECOMMENDS_${PN} = ""
 RDEPENDS_${PN} = "systemd"
 
 # This is a machine specific file
-FILES_${PN} = "${base_libdir}/systemd/system/serial-getty@.service ${sysconfdir}"
+FILES_${PN} = "${base_libdir}/systemd/systemd-serialgetty \
+               ${base_libdir}/systemd/system/serial-getty@.service \
+               ${sysconfdir} \
+               "
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta-oe/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index daf0dac..ee60a37 100644
--- a/meta-oe/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta-oe/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -17,7 +17,7 @@ Before=getty.target
 
 [Service]
 Environment=TERM=vt100
-ExecStart=-/sbin/getty @BAUDRATE@ %I
+ExecStart=-/lib/systemd/systemd-serialgetty @BAUDRATE@ %I
 Restart=always
 RestartSec=0
 UtmpIdentifier=%I
diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty/systemd-serialgetty b/meta-oe/recipes-core/systemd/systemd-serialgetty/systemd-serialgetty
new file mode 100755
index 0000000..688b4b4
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd-serialgetty/systemd-serialgetty
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+for g in /sbin/agetty \
+         /sbin/mingetty \
+         /sbin/getty; do
+	if [ -x "$g" ]; then
+		$g $@
+		exit 0
+	fi
+done
+
+echo "Failed to find the getty binary to use."
+exit 1
-- 
1.7.2.5



