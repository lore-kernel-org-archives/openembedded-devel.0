Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S2N4T-0008E6-TE
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 14:26:25 +0100
Received: by wibhq12 with SMTP id hq12so929301wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 05:17:58 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.101.37 as permitted sender)
	client-ip=10.180.101.37; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.101.37 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.101.37])
	by 10.180.101.37 with SMTP id fd5mr8638658wib.1.1330435078656 (num_hops
	= 1); Tue, 28 Feb 2012 05:17:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.101.37 with SMTP id fd5mr6785623wib.1.1330435078485;
	Tue, 28 Feb 2012 05:17:58 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id p10sm29258497wic.0.2012.02.28.05.17.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 05:17:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 14:17:50 +0100
Message-Id: <1330435070-30907-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQn2maCV/ZtWpcCJI3v+0KousBTCTmv1od/Bz1YyhdhcCm0NRrOZqzFoc0gbk7uA0+Ri6JpG
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] xinput-calibrator 0.7.5: fix calibration script
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
X-List-Received-Date: Tue, 28 Feb 2012 13:26:26 -0000

The 'auto' format switched to 'xorg.conf.d' which broke the script. The pointercal package also installed an 'empty' pointercal by default, which also broke the script. Fix these 2 in one go.

Also remove the hal script since hal isn't supported in the oe-core universe anymore

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...brator_pointercal.sh-specify-output-type-.patch |   56 ++++++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    6 +-
 2 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
new file mode 100644
index 0000000..8e6d949
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
@@ -0,0 +1,56 @@
+From e73eb2c343006865ff3faf7777ab93ccfd1762d6 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 28 Feb 2012 14:09:08 +0100
+Subject: [PATCH] xinput_calibrator_pointercal.sh: specify output type since 'auto' doesn't always pick 'xinput'
+
+Also deal with pointercal files that contain '# replace with valid machine specific pointercal.xinput'
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+
+Upstream-status: Submitted
+
+ scripts/xinput_calibrator_pointercal.sh |   22 +++++++++++++++-------
+ 1 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
+index 579509c..fccb197 100755
+--- a/scripts/xinput_calibrator_pointercal.sh
++++ b/scripts/xinput_calibrator_pointercal.sh
+@@ -6,18 +6,26 @@
+ #
+ # original script: Martin Jansa <Martin.Jansa@gmail.com>, 2010-01-31
+ # updated by Tias Guns <tias@ulyssis.org>, 2010-02-15
++# updated by Koen Kooi <koen@dominion.thruhere.net>, 2012-02-28
++
++PATH="/usr/bin:$PATH"
+ 
+ BINARY="xinput_calibrator"
+ CALFILE="/etc/pointercal.xinput"
+ LOGFILE="/var/log/xinput_calibrator.pointercal.log"
+ 
+ if [ -e $CALFILE ] ; then
+-  echo "Using calibration data stored in $CALFILE"
+-  . $CALFILE
+-else
+-  CALDATA=`$BINARY -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
+-  if [ ! -z "$CALDATA" ] ; then
+-    echo $CALDATA > $CALFILE
+-    echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
++  if grep replace $CALFILE ; then
++    echo "Empty calibration file found, removing it"
++    rm $CALFILE
++  else
++    echo "Using calibration data stored in $CALFILE"
++    . $CALFILE && exit 0
+   fi
+ fi
++
++CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
++if [ ! -z "$CALDATA" ] ; then
++  echo $CALDATA > $CALFILE
++  echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
++fi
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
index f0e85cf..e39cc44 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -4,11 +4,12 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
 DEPENDS = "virtual/libx11 libxi"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools
 
-SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz"
+SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz \
+           file://0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch"
 SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
 SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
 
@@ -20,7 +21,6 @@ EXTRA_OECONF += "--with-gui=x11"
 do_install_append() {
         install -d ${D}${bindir}
         install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
-        install -m 0755 scripts/xinput_calibrator_get_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
 }
 
 RDEPENDS_${PN} = "xinput"
-- 
1.7.2.5



