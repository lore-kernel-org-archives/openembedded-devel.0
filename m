Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nt-0007XO-VW
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:44 +0200
Received: by mail-ea0-f172.google.com with SMTP id z7so1633553eaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=8+GSUWurQp2PWIrmMFnlPfibk60utATlIKy74rjB0Ko=;
	b=P7iqD1QNJxPrBaeOnxYbFVCI6H26qWylRzl7Ia8eZRozRtKeaxUr3+3zrWgEZ3cIGf
	CrCNn29dXnXM/cW7R3gmT1BKWedpbXhWoMAgAF7L1dtBW8hjrBvsZ8RXr9IIUABN3dTT
	VRCR9wo15hTMoGZrHHb5Et26JmAJyeJQ+wveYAH+iD6UDviht3cxe7L1U/z8RpvVdjvY
	R/npZkfmDlTes1TwrZoqVsnjVIX0HKA05rFXBAOq13YLVLe7BcjeBfMwE3Cd6Mkhu+ya
	zHGLlxkYr2L7s+v+hUJqf4anOT/6hgGpONkeRW3XJdW418WC1Z3fviJc0xV01f3y3sTH
	cdMQ==
X-Received: by 10.14.89.69 with SMTP id b45mr39523103eef.10.1365859816343;
	Sat, 13 Apr 2013 06:30:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r48sm11809522eeg.2.2013.04.13.06.30.15
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:37 +0200
Message-Id: <1365859790-20947-20-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 20/33] xinput-calibrator: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:48:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xinput-calibrator/xinput-calibrator.service        |  0
 .../xinput-calibrator/xinput-calibrator_git.bb         | 15 ++++++++++++---
 .../xinput-calibrator/xinput-calibrator_git.bbappend   | 18 ------------------
 3 files changed, 12 insertions(+), 21 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend

diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
rename to meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 97f9343..b01f62d 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,12 +5,13 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi"
 
 PV = "0.7.5+git${SRCPV}"
-PR = "r1"
+PR = "r5"
 
-inherit autotools
+inherit autotools systemd
 
 SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
+SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git \
+           file://xinput-calibrator.service"
 
 S = "${WORKDIR}/git"
 
@@ -24,8 +25,16 @@ do_install_append() {
         install -d ${D}${sysconfdir}/xdg/autostart
         sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
         install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unitdir}/system
 }
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
 RDEPENDS_${PN} = "xinput xterm"
 RRECOMMENDS_${PN} = "pointercal-xinput"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
deleted file mode 100644
index 5c14346..0000000
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
+++ /dev/null
@@ -1,18 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 3}"
-
-inherit systemd
-
-SRC_URI += "file://xinput-calibrator.service"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.service"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.8.1.5



