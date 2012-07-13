Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSk-0007zC-On
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:59 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247498bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=VlTN8AAEFgmVYWPiZIDhmd0GWK21VlfnQ86PSzwOo5M=;
	b=IzUm9xugBWnx9wgmZcNDp2d55mxcQILkmUmhRXwhBwBaz8ddGI0qkhOTqVeWYtdt27
	DPCKbFKLCdPMDvKlBndoej24P4eldoEU/ta+Y8UX34n32NNK1Ib+nSc9TM3vVxSWzByb
	H/48x8L4UczaO7mgfr3V56HVdE7iMZcbLA43T8qd1xiGThFuJQkdmBWcOczdxcreGLUP
	zZgOVvGUtYQSXNDJ6UOy/SrScYGmqlIxVlc/V/x2HKRIqlanuIiL6aBYaUqhZNyhaC0Q
	DQb96GADh6TeflnxFgyBHYgWFMpWOdoq4c59elgDR8HgMjyggfQWuq4SLDP4OhlXOq3C
	L/ZA==
Received: by 10.205.122.147 with SMTP id gg19mr141506bkc.73.1342168306771;
	Fri, 13 Jul 2012 01:31:46 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:34 +0200
Message-Id: <1342168240-7760-27-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 26/32] xinput-calibrator: : move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:43:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    8 ++------
 .../xinput-calibrator/xinput-calibrator.service    |    0
 .../xinput-calibrator_0.7.5.bbappend               |   10 ++++++++++
 3 files changed, 12 insertions(+), 6 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
index fc5da49..edc10bd 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -4,13 +4,12 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
 DEPENDS = "virtual/libx11 libxi"
 
-PR = "r7"
+PR = "r8"
 
-inherit autotools systemd
+inherit autotools
 
 SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz \
            file://0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch \
-           file://xinput-calibrator.service \
            file://xinput-calibrator-autostart.desktop \
 "
 SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
@@ -29,9 +28,6 @@ do_install_append() {
         install -m 0644 ${WORKDIR}/xinput-calibrator-autostart.desktop ${D}${sysconfdir}/xdg/autostart
 }
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
-
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
 RDEPENDS_${PN} = "xinput xterm"
 RRECOMMENDS_${PN} = "pointercal-xinput"
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
similarity index 100%
rename from meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
rename to meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend
new file mode 100644
index 0000000..e12abec
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://xinput-calibrator.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
-- 
1.7.6.5



