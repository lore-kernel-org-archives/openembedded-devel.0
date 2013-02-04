Received: from mail-ye0-f171.google.com ([209.85.213.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1U2Lo2-0005FB-FW
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 14:09:59 +0100
Received: by mail-ye0-f171.google.com with SMTP id m8so1514869yen.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 04:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=3sOAJCs6o7NACZJ6gy2zsqlZEemuIPQhvaldlqgfqrM=;
	b=tIwsLzGlUhaHsLDBASsDG6i3kr4Qnfpi+TRQjszjy5MY1oVCuO/scBPQvvT3gnpJfo
	CYIe907k8cuFrpf32z4nA4bSIhPvKVw302CZoPV7qE57zXlkAMw0gUOO8ixBTvBSSrb9
	Yom3mg/FniE/ZPwEUOwvst9nVNQT2SJsQuig1a1menQtskY8CRuasT1vE7VeIL4/EIUC
	PXEmZYrrgTK27ScWZSmpq207aY21DIYMeMQD5Ok08HbELVAeNXJlFhoubegUn+1trJ10
	IG35qlkDOa9RxMUetsDPnAPE7lewG5da1i12Fmo/c9DzKzYZNmJoOM01B03+hFHb+5YP
	p/wQ==
X-Received: by 10.236.131.211 with SMTP id m59mr25602833yhi.49.1359982445883; 
	Mon, 04 Feb 2013 04:54:05 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id s3sm28839628yhm.10.2013.02.04.04.54.03
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 04:54:04 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 10:53:46 -0200
Message-Id: <1359982426-9836-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] xinput-calibrator: add --boot-mode comand line option to wrapper script
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
X-List-Received-Date: Mon, 04 Feb 2013 13:10:05 -0000

xinput_calibrator_once.sh has been renamed to
run-xinput-calibrator.sh, which now also handles the --boot-mode
command line option.

When in boot mode (i.e., when --boot-mode is provided on the command
line), the script exits if calibration data is found in the
calibration data file.  When not in boot mode (i.e., no command line
option), the script runs xinput-calibrator and creates/overwrites the
calibration data file.

This change allows other applications to use a common wrapper
(run-xinput-calibrator.sh) for xinput-calibrator.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../xinput-calibrator/boot-mode.patch              |   35 ++++++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |    9 +++--
 2 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/boot-mode.patch

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/boot-mode.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/boot-mode.patch
new file mode 100644
index 0000000..8af9fc4
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/boot-mode.patch
@@ -0,0 +1,35 @@
+diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
+index fccb197..253455b 100755
+--- a/scripts/xinput_calibrator_pointercal.sh
++++ b/scripts/xinput_calibrator_pointercal.sh
+@@ -7,6 +7,7 @@
+ # original script: Martin Jansa <Martin.Jansa@gmail.com>, 2010-01-31
+ # updated by Tias Guns <tias@ulyssis.org>, 2010-02-15
+ # updated by Koen Kooi <koen@dominion.thruhere.net>, 2012-02-28
++# updated by Mario Domenech Goulart <mario@ossystems.com.br>, 2013-02-01
+ 
+ PATH="/usr/bin:$PATH"
+ 
+@@ -14,13 +15,21 @@ BINARY="xinput_calibrator"
+ CALFILE="/etc/pointercal.xinput"
+ LOGFILE="/var/log/xinput_calibrator.pointercal.log"
+ 
++# In boot mode, this script exits if calibration data is found in
++# $CALFILE.  If not in boot-mode, it runs the calibrator and
++# creates/overwrites $CALFILE (in other words: it always recalibrate).
++if [ "$1" = "--boot-mode" ]; then
++    BOOT_MODE=1
++fi
++
+ if [ -e $CALFILE ] ; then
+   if grep replace $CALFILE ; then
+     echo "Empty calibration file found, removing it"
+     rm $CALFILE
+   else
+     echo "Using calibration data stored in $CALFILE"
+-    . $CALFILE && exit 0
++    . $CALFILE
++    [ -z "$BOOT_MODE" ] || exit 0
+   fi
+ fi
+ 
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 97f9343..21fd382 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,12 +5,13 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi"
 
 PV = "0.7.5+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 inherit autotools
 
 SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
+SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git \
+           file://boot-mode.patch"
 
 S = "${WORKDIR}/git"
 
@@ -19,10 +20,10 @@ EXTRA_OECONF += "--with-gui=x11"
 
 do_install_append() {
         install -d ${D}${bindir}
-        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/run-xinput-calibrator.sh
 
         install -d ${D}${sysconfdir}/xdg/autostart
-        sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
+        sed -i -e 's,^Exec=.*,Exec=${bindir}/run-xinput-calibrator.sh --boot-mode,' scripts/xinput_calibrator.desktop
         install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
 }
 
-- 
1.7.2.5



