Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TdnZO-0001lo-CU
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 20:45:18 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so13559894oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=a5E6/21Ms8CmJ3XYJOJlmDsGlHDzXRGdEXeiYqDXnQM=;
	b=CdjXRmrOFyZQ7XarkPHXNYQFbbQQQqcA+t6RY3XLtWGCsCNm124d/LmgrQ2ACEYQ26
	jar5tEq4jeLQVNUW5/qt4OdNJdqpoz1LythCakNVEpa2fQU0h/HJv1gaajTgy46e2sms
	RXu7L/Ey13464CXth/8c7ztzRrQbs/C1+kHZnVm5SAB4ix2OaGbYNP9WYTL24VU4Hm8r
	u5pZdImm4i4of7xDOFTPedZ+Evbp5PhgjeVRXxfDN4PMlnxS1sc6bGxfGhgAkoiSWAgG
	vsbZfulipr2O8Ucxjvy9Cb+SfcvRg3M+EiIxZz8KM8TGOdkpFzsFsPuOnbMLr/3erTQB
	2fwA==
Received: by 10.182.1.72 with SMTP id 8mr5243363obk.61.1354131065663;
	Wed, 28 Nov 2012 11:31:05 -0800 (PST)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h2sm19267644obn.11.2012.11.28.11.31.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 11:31:04 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2012 17:30:38 -0200
Message-Id: <1354131040-9077-4-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 4/6] xinput-calibrator: update to 2012 Aug 2nd's git snapshot
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
X-List-Received-Date: Wed, 28 Nov 2012 19:45:18 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 ...brator_pointercal.sh-specify-output-type-.patch |   56 --------------------
 .../xinput-calibrator-autostart.desktop            |    8 ---
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   33 ------------
 .../xinput-calibrator/xinput-calibrator_git.bb     |   30 +++++++++++
 4 files changed, 30 insertions(+), 97 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
deleted file mode 100644
index 8e6d949..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From e73eb2c343006865ff3faf7777ab93ccfd1762d6 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 28 Feb 2012 14:09:08 +0100
-Subject: [PATCH] xinput_calibrator_pointercal.sh: specify output type since 'auto' doesn't always pick 'xinput'
-
-Also deal with pointercal files that contain '# replace with valid machine specific pointercal.xinput'
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
-
-Upstream-status: Submitted
-
- scripts/xinput_calibrator_pointercal.sh |   22 +++++++++++++++-------
- 1 files changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
-index 579509c..fccb197 100755
---- a/scripts/xinput_calibrator_pointercal.sh
-+++ b/scripts/xinput_calibrator_pointercal.sh
-@@ -6,18 +6,26 @@
- #
- # original script: Martin Jansa <Martin.Jansa@gmail.com>, 2010-01-31
- # updated by Tias Guns <tias@ulyssis.org>, 2010-02-15
-+# updated by Koen Kooi <koen@dominion.thruhere.net>, 2012-02-28
-+
-+PATH="/usr/bin:$PATH"
- 
- BINARY="xinput_calibrator"
- CALFILE="/etc/pointercal.xinput"
- LOGFILE="/var/log/xinput_calibrator.pointercal.log"
- 
- if [ -e $CALFILE ] ; then
--  echo "Using calibration data stored in $CALFILE"
--  . $CALFILE
--else
--  CALDATA=`$BINARY -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
--  if [ ! -z "$CALDATA" ] ; then
--    echo $CALDATA > $CALFILE
--    echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
-+  if grep replace $CALFILE ; then
-+    echo "Empty calibration file found, removing it"
-+    rm $CALFILE
-+  else
-+    echo "Using calibration data stored in $CALFILE"
-+    . $CALFILE && exit 0
-   fi
- fi
-+
-+CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
-+if [ ! -z "$CALDATA" ] ; then
-+  echo $CALDATA > $CALFILE
-+  echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
-+fi
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop
deleted file mode 100644
index 3f3d613..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop
+++ /dev/null
@@ -1,8 +0,0 @@
-[Desktop Entry]
-Name=Calibrate Touchscreen
-Exec=xinput_calibrator_once.sh
-Terminal=false
-Type=Application
-Icon=xinput_calibrator
-StartupNotify=true
-Categories=System;Settings;
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
deleted file mode 100644
index edc10bd..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "A generic touchscreen calibration program for X.Org"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
-LICENSE = "MIT-X"
-LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
-DEPENDS = "virtual/libx11 libxi"
-
-PR = "r8"
-
-inherit autotools
-
-SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz \
-           file://0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch \
-           file://xinput-calibrator-autostart.desktop \
-"
-SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
-SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
-
-S = "${WORKDIR}/xinput_calibrator-${PV}"
-
-# force native X11 ui as we don't have gtk+ in DEPENDS
-EXTRA_OECONF += "--with-gui=x11"
-
-do_install_append() {
-        install -d ${D}${bindir}
-        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
-
-        install -d ${D}${sysconfdir}/xdg/autostart
-        install -m 0644 ${WORKDIR}/xinput-calibrator-autostart.desktop ${D}${sysconfdir}/xdg/autostart
-}
-
-FILES_${PN} += "${sysconfdir}/xdg/autostart"
-RDEPENDS_${PN} = "xinput xterm"
-RRECOMMENDS_${PN} = "pointercal-xinput"
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
new file mode 100644
index 0000000..c16a412
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
+DEPENDS = "virtual/libx11 libxi"
+
+PV = "0.7.5+git${SRCPV}"
+
+inherit autotools
+
+SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
+SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+# force native X11 ui as we don't have gtk+ in DEPENDS
+EXTRA_OECONF += "--with-gui=x11"
+
+do_install_append() {
+        install -d ${D}${bindir}
+        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+
+        install -d ${D}${sysconfdir}/xdg/autostart
+        sed -i -e 's,^Exec=.*,Exec=/usr/bin/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
+        install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
+}
+
+FILES_${PN} += "${sysconfdir}/xdg/autostart"
+RDEPENDS_${PN} = "xinput xterm"
+RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.7.2.5



