Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlLU-0005rZ-P9
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:43:20 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so4758860fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=mChwgrDWI5i3q/pr9+bLcvzRG6jta4Iae2sdf7QSaVo=;
	b=ayFXA+QAk21j5xQ0tNAq9+Kza2KqZlBggm02M0FPs9/JF99AE7rpENExOvugSTiAf1
	rdofWHpPRxdDKRlpoadSiDOx3b+nFj88WC5XuvEEu9BSKOeUAtoTBeBV0n3ky5Kp6lan
	xM8V14ziRRPR2CBvregnGbXTsA3hx6GGiAB5U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Hu5vEyNyBiZGkhucBLA8+a/xyITa6kiaCa3unvwxFoJ9BZneTepfvlVU/ADvPF/fj9
	VVn5ikQHb7jFUIFgi9dqcePMlrev+fu+IGPBbCdMqBPpAzUZdcKF9s+Tvs09ZQOYP++3
	Kx5zeqn5Cle3YmzW5MC9xqOnwJeUHR4S/eiJY=
Received: by 10.223.83.141 with SMTP id f13mr724520fal.22.1305027637697;
	Tue, 10 May 2011 04:40:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id j12sm2348629fax.9.2011.05.10.04.40.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:40:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:40:30 +0200
Message-Id: <fe1c32740aeeb35847e5da470d9dec1583ba9610.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/9] xinput-calibrator: add new version 0.7.5 and include .inc to recipe directly
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
X-List-Received-Date: Tue, 10 May 2011 11:43:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xinput-calibrator/xinput-calibrator.inc        |   12 ----------
 .../xinput-calibrator/xinput-calibrator_0.6.1.bb   |   17 ---------------
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   22 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.6.1.bb
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
deleted file mode 100644
index 691a45c..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "A generic touchscreen calibration program for X.Org"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
-LICENSE = "MIT/X11"
-DEPENDS = "virtual/libx11 libxi"
-
-INC_PR = "r8"
-
-inherit autotools
-
-RDEPENDS_${PN} = "xinput"
-RRECOMMENDS_${PN} = "pointercal-xinput"
-
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.6.1.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.6.1.bb
deleted file mode 100644
index 2eb3cc9..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.6.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xinput-calibrator.inc
-
-LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
-
-SRCREV = "d2ce98b3f638667dd64b6d718721379b2dc750a7"
-PR = "${INC_PR}.0"
-S = "${WORKDIR}/git/"
-
-do_install_append() {
-        install -d ${D}${bindir}
-        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
-        ln -s ${bindir}/xinput_calibrator_x11 ${D}${bindir}/xinput_calibrator
-        install -d ${D}${datadir}/applications/
-        install -m 0755 scripts/xinput_calibrator.desktop ${D}${datadir}/applications/xinput-calibrator.desktop
-        install -m 0755 scripts/xinput_calibrator_get_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
-}
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
new file mode 100644
index 0000000..4024883
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
+LICENSE = "MIT/X11"
+LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
+DEPENDS = "virtual/libx11 libxi"
+
+inherit autotools
+
+RDEPENDS_${PN} = "xinput"
+RRECOMMENDS_${PN} = "pointercal-xinput"
+
+SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz"
+SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
+SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
+
+S = "${WORKDIR}/xinput_calibrator-${PV}"
+
+do_install_append() {
+        install -d ${D}${bindir}
+        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+        install -m 0755 scripts/xinput_calibrator_get_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
+}
-- 
1.7.5.rc3



