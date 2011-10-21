Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH5y0-00056h-Is
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 05:40:20 +0200
Received: by mail-gy0-f175.google.com with SMTP id 15so3365232gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=p7t+/a36hxZUf7MXQJj86wJegJKmRHnExKG3hMwrcCY=;
	b=OHncHfta0FITr01KMWog3DkdVAUZ3rU4K7fLnv1B+Hsd4ZYzrWeTBNNvYFLl1x18dI
	UFueie4GGHrcqLo1DiQPqpnUIRvu7sVZFy4spylldYBGB5IVjaEMOI4LrL8bo4MFDbja
	lGvcKvqVoLVskzws/wtr6BujsTEDb28c5Y5JE=
Received: by 10.236.117.132 with SMTP id j4mr831450yhh.7.1319168068403;
	Thu, 20 Oct 2011 20:34:28 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t7sm31947517anh.15.2011.10.20.20.34.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 20:34:27 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 03:34:13 +0000
Message-Id: <b9bb7aa6a838bfad2d268907d0af7820cfd46618.1319168013.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319168013.git.otavio@ossystems.com.br>
References: <cover.1319168013.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319168013.git.otavio@ossystems.com.br>
References: <cover.1319168013.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/4] systemd-serialgetty: don't require systemd_git.bb
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
X-List-Received-Date: Fri, 21 Oct 2011 03:40:20 -0000

Avoids the recompile of this package every time systemd is change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-core/systemd/systemd-serialgetty.bb    |   22 ++++++-------------
 1 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
index d7e8571..b4c6880 100644
--- a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
@@ -1,19 +1,10 @@
-require systemd_git.bb
-
-SRC_URI = "git://anongit.freedesktop.org/systemd;protocol=git \
-           file://serial-getty@.service \
-          "
-
 DESCRIPTION = "Systemd serial config"
-SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-do_configure() {
-	:
-}
+SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
 
-do_compile() {
-	:
-}
+SRC_URI = "file://serial-getty@.service"
 
 def get_baudrate(bb, d):
     return bb.data.getVar('SERIAL_CONSOLE', d, 1).split()[0]
@@ -27,9 +18,11 @@ do_install() {
 		install -d ${D}${base_libdir}/systemd/system/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
 		install ${WORKDIR}/serial-getty@.service ${D}${base_libdir}/systemd/system/
+
+		# enable the service
 		ln -sf ${base_libdir}/systemd/system/serial-getty@.service \
 			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@get_console(bb, d)}.service
-		fi
+	fi
 }
 
 PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-doc"
@@ -40,4 +33,3 @@ RDEPENDS_${PN} = "systemd"
 # This is a machine specific file
 FILES_${PN} = "${base_libdir}/systemd/system/serial-getty@.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-- 
1.7.2.5



