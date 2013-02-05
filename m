Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2r7u-0002BN-WF
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 23:36:32 +0100
Received: by mail-ea0-f179.google.com with SMTP id d12so328887eaa.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 14:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PZh4rns+9ZQRBEVp3vZCf8WRl5A60L7+koFlL4GSaaA=;
	b=QfhY63BorronaSo1X5Z4mCmKzbPsSCcCpU2AF30MyUD0rmhf264Y61lTYM4zxAv2A3
	TltcA36gsb27EcxYmV0QVmop+5l4tbta4qPDflFFaEvaVomva4XMs5wECEPdDCTZojsb
	v/86+Nmvdz2ix0Jgx9qF3OG80xbtLzwgmAmifcbvE027Nna5J7NRtzC712gJ+hcz0SB4
	aK2wxE/9RfEVeR0Oa56cliO3X4U2oWp4BEpL1jgZAPHxk5I0TX4wTlF2afgSjsDnnGGS
	4TiDmkXuiCiTkOnVjt160RpRZLIZEy4QNBecOQGcdTJRJwSynx0ZiJjbsIZ71fbU0aqG
	NNZQ==
X-Received: by 10.14.221.9 with SMTP id q9mr89970848eep.3.1360102841099;
	Tue, 05 Feb 2013 14:20:41 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q5sm33901931eep.11.2013.02.05.14.20.39
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 14:20:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2013 23:18:41 +0100
Message-Id: <1360102723-27891-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe-meta-systemd 3/5] xinput-calibrator: rework
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
X-List-Received-Date: Tue, 05 Feb 2013 22:36:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* poll xinput_calibrator to avoid touchscreen not yet detected by xserver
* handling for multiple touch devices prepared by storing device specific
  calibration in ${sysconfdir}/X11/xorg.conf.d/99-<device-name>.conf. By using
  conf files, xserver takes care and no call of xinput is required and the
  rdependency can be removed (tested).
* udev/systemd: plug/play / script is only called for devices with touchscreen
  connected
* fallback for non systemd systems with ${sysconfdir}/xdg/autostart. After
  once stored this fallback also works for display-managers not using
  ${sysconfdir}/xdg/autostart. Since the script is called on every user session,
  it is not called in an extra terminal window to avoid window flickering.
* follow oe-core's systemd switching upon DISTRO_FEATURES
* permanent recalibration for users with sufficient rights

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../99-xf86-xinput-calibrator.rules                |    6 +
 .../xinput-calibrator/xinput-calibrator@.service   |    8 +
 .../xinput_calibrator_pointercal2.sh               |  151 ++++++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |   39 ++++--
 .../xinput-calibrator/xinput-calibrator.service    |   11 --
 .../xinput-calibrator_git.bbappend                 |   10 --
 6 files changed, 195 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/99-xf86-xinput-calibrator.rules
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator@.service
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal2.sh
 delete mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
 delete mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/99-xf86-xinput-calibrator.rules b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/99-xf86-xinput-calibrator.rules
new file mode 100644
index 0000000..d25a849
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/99-xf86-xinput-calibrator.rules
@@ -0,0 +1,6 @@
+ACTION!="add", GOTO=xinput_calibrator_end
+
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", TAG+="systemd", ENV{SYSTEMD_WANTS}="xinput-calibrator@%k.service"
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="ads7846", TAG+="systemd", ENV{SYSTEMD_WANTS}="xinput-calibrator@%k.service"
+
+LABEL="xinput_calibrator_end"
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator@.service b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator@.service
new file mode 100644
index 0000000..839d868
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator@.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Xinput-calibration for %I
+After=graphical.target
+
+[Service]
+Type=simple
+TimeoutSec=0
+ExecStart=/bin/sh -c "exec /usr/bin/xinput_calibrator_pointercal2.sh %I 1>>/var/log/xinput-calibration.log 2>&1"
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal2.sh b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal2.sh
new file mode 100644
index 0000000..0f24ba4
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal2.sh
@@ -0,0 +1,151 @@
+#!/bin/sh
+###############################################################################
+#
+# Script to make the changes permanent. For each device a single configuration
+# is stored in /etc/X11/xorg.conf.d/
+#
+# The first parameter is either
+#   - the the device name in sysfs e.g 'event0' (when called from systemd) - or
+#   - 'xdg-autostart' when called from /etc/xdg/autostart/*.desktop - or
+#   - empty when called for manual recalibration
+#
+# initial version by Andreas Müller <schnitzeltony@googlemail.com>, 2013-02-05
+#
+###############################################################################
+
+
+# Uncomment the following line to reduce log output
+#debug='false &&'
+
+# xserver might not be up yet or has yet not detected touchsreen device yet.
+# To work around we try several times. If xserver+device are not up within
+# <max_try_systemd>seconds something is wrong
+max_try_systemd=30
+
+# xserver might not have detected devices yet. To work around wait for
+# <max_delay_autostart>seconds
+max_delay_autostart=10
+
+
+BINARY='xinput_calibrator'
+CALFILE=
+TOUCHNAME=
+CMDOPTION=
+
+
+set_device_vars() {
+	DEVICEID=`echo $TOUCHNAME | tr -s ' -/\\|\t\n\r' '_'`
+	CALFILE="/etc/X11/xorg.conf.d/99-$DEVICEID.conf"
+	CMDOPTION="--output-filename $CALFILE"
+}
+
+
+extract_next_dev() {
+	DEVICENO="$((DEVICENO+1))"
+	ENDPOS="$((DEVICENO*2))"
+	TOUCHNAME=`echo $DEVICELIST | cut -s -d'"' -f$ENDPOS`
+}
+
+
+if [ x$1 != x ]; then
+	# called by systemd for a specific device - no recalibration
+	if [ x$1 != xxdg-autostart ]; then
+		$debug echo "----- $0 started by systemd for device $1 -----"
+
+		# TBD?: unique ID for multiple touchscreens of same type
+		# TBD?: DISPLAY != default
+		export DISPLAY=:0
+		TOUCHNAME=`cat /sys/class/input/$1/device/name`
+		$debug echo "Device: '$TOUCHNAME'"
+		set_device_vars
+		$debug echo "Checking for stored calibration in $CALFILE"
+		if grep "\"$TOUCHNAME\"" $CALFILE ; then
+			echo "Using calibration data stored in $CALFILE"
+			exit 0
+		fi
+	# called by: /etc/xdg/autostart/*.desktop check all devices - no recalibration
+	else
+		$debug echo "----- $0 started by autostart ----- "
+		$debug echo `date -u` ": delay ${max_delay_autostart}s ..."
+		sleep $max_delay_autostart
+
+		DEVICELIST=`$BINARY --list`
+		$debug $BINARY --list
+		# no devices?
+		if [ "x`echo $DEVICELIST | grep Device`" = "x" ]; then
+			exit 0
+		fi
+		DEVICECOUNT=`$BINARY --list | wc -l`
+		# for multiple devices the first uncalibrated is calibrated (TBD?)
+		DEVICENO=0
+		while [ "$DEVICENO" -ne "$DEVICECOUNT" ]; do
+			extract_next_dev
+			set_device_vars
+			$debug echo "Checking for stored calibration in $CALFILE"
+			if grep "\"$TOUCHNAME\"" $CALFILE ; then
+				$debug echo "Using calibration data stored in $CALFILE"
+				TOUCHNAME=
+			else
+				$debug echo "No calibration data found for '$TOUCHNAME'"
+				break
+			fi
+		done
+		if [ "x$TOUCHNAME" = "x" ]; then
+			echo 'All devices calibrated - exiting.'
+			exit 0
+		fi
+	fi
+# called manual: check all available devices - force recalibration
+else
+	echo "----- $0 started manually -----"
+	echo "auto detect touchscreen devices..."
+	# we are in a terminal so max output below is OK
+	debug=
+	DEVICELIST=`$BINARY --list`
+	$BINARY --list
+	# no devices?
+	if [ "x`echo $DEVICELIST | grep Device`" = "x" ]; then
+		exit 0
+	fi
+	DEVICECOUNT=`$BINARY --list | wc -l`
+	DEVICENO=0
+	# one device
+	if [ "$DEVICECOUNT" -eq "1" ]; then
+		extract_next_dev
+	# multiple devices
+	else
+		echo 'Multiple devices were found. Select the one to calibrate:'
+		while [ "$DEVICENO" -ne "$DEVICECOUNT" ]; do
+			extract_next_dev
+			echo -n "Calibrate '$TOUCHNAME' <y>? "
+			read YESNO
+			if [ "x$YESNO" = "xy" ]; then
+				break
+			else
+				TOUCHNAME=
+			fi
+		done
+		if [ "x$TOUCHNAME" = "x" ]; then
+			echo 'No device selected - exiting without calibration.'
+			exit 0
+		fi
+	fi
+	set_device_vars
+fi
+
+
+# wait for xserver to calibrate
+i=1
+while [ "$i" -ne "$max_try_systemd" ]; do
+	$debug echo `date -u` ": starting calibration"
+	$BINARY --device "$TOUCHNAME" --no-timeout --output-type xorg.conf.d $CMDOPTION
+	if [ $? = 0 ]; then
+		exit 0
+	fi
+	sleep 1
+	i="$((i+1))"
+done
+
+# when reaching here something went wrong
+echo "Could not calibrate '$TOUCHNAME'"
+exit 1
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 6781e86..199ee34 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi"
 
 PV = "0.7.5+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 inherit autotools
 
@@ -19,6 +19,9 @@ SRC_URI = " \
     file://0004-CalibratorUsbtouchscreen-overridde-default-file-name.patch \
     file://0005-Make-all-Calibrator-destructors-virtual-to-fix-warni.patch \
     file://0006-Set-up-buffer-size-for-max-line-length-only-once-in-.patch \
+    file://99-xf86-xinput-calibrator.rules \
+    file://xinput-calibrator@.service \
+    file://xinput_calibrator_pointercal2.sh \
 "
 
 S = "${WORKDIR}/git"
@@ -27,14 +30,32 @@ S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-gui=x11"
 
 do_install_append() {
-        install -d ${D}${bindir}
-        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
-
-        install -d ${D}${sysconfdir}/xdg/autostart
-        sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
-        install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/xinput_calibrator_pointercal2.sh ${D}${bindir}
+	install -d ${D}/${sysconfdir}/X11/xorg.conf.d
+
+	# use our script to make calibration permanent (sufficiont rights assumed)
+	sed -i 	-e 's,^Exec=.*,Exec=${base_bindir}/sh -c '\''${bindir}/xinput_calibrator_pointercal2.sh; cat'\'',' \
+		${D}${datadir}/applications/xinput_calibrator.desktop
+
+	# udev/systemd start?
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/xinput-calibrator@.service ${D}${systemd_unitdir}/system
+		install -d ${D}${base_libdir}/udev/rules.d
+		install -m 0644 ${WORKDIR}/99-xf86-xinput-calibrator.rules ${D}${base_libdir}/udev/rules.d
+	# ${sysconfdir}/xdg/autostart?
+	else
+	        install -d ${D}${sysconfdir}/xdg/autostart
+	        install -m 0644 ${D}${datadir}/applications/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
+		# use our script to make calibration permanent (sufficiont rights assumed) / not in Terminal
+		# /var/log is not accessible for all users so use user's home
+	        sed -i 	-e 's,^Exec=.*,Exec=${base_bindir}/sh -c '\''${bindir}/xinput_calibrator_pointercal2.sh xdg-autostart 1>>$HOME/xinput-calibration.log 2>\&1'\'',' \
+			-e 's,^Terminal=true,Terminal=false,' \
+			${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
+	fi
 }
 
-FILES_${PN} += "${sysconfdir}/xdg/autostart"
-RDEPENDS_${PN} = "xinput xterm"
+FILES_${PN} += "${sysconfdir}/xdg/autostart ${systemd_unitdir}/system"
+RDEPENDS_${PN} = "xterm"
 RRECOMMENDS_${PN} = "pointercal-xinput"
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
deleted file mode 100644
index 2301876..0000000
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Loads xinput calibration data
-ConditionPathExists=/etc/pointercal.xinput
-Requires=display-manager.service
-After=display-manager.service
-
-[Service]
-ExecStart=/usr/bin/xinput_calibrator_once.sh
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
deleted file mode 100644
index 5bc5bc3..0000000
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SRC_URI += "file://xinput-calibrator.service"
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
-- 
1.7.6.5



