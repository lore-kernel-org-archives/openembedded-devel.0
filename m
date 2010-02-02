Received: from mail-fx0-f215.google.com ([209.85.220.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nc7BV-0006Ib-1f
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 02:04:08 +0100
Received: by fxm7 with SMTP id 7so5698550fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2010 17:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=iOhLzCJ8lgOMR/Z+cdgw7VpcjY+/4uzc4R6x4ze9Q9g=;
	b=jXnCaRq2SkFJybESh0vRTPaIixMQIUv76iCT/2bSNhDo9WuuRXgJFjX90q+thiZaW+
	trWa4IYn5Tr8/38GUZKzGDLiBDfY3RA45f41aDxPeTNr4+axMqdXzMfBMckPBBp8SLci
	33gjEryn9vbWQmyneCl9ziYEvWEo0aia2WU+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=wvVeJARVib1zrDAuSQiqohDiBmHbwtugosaqm9oAWTEgtldbA6d6ToZGYLxlSRAR4U
	qnLGXz/N0/Uk21Z+R76snvOCsQ/2VmAs3r/v9oHPtXWb8YzSYCemULt9ju+o5Fc5mNJA
	a04DG6Mm7+MRWjgkmiw5tCyHGWwsuMnmc939I=
Received: by 10.223.74.154 with SMTP id u26mr5238540faj.88.1265072495723;
	Mon, 01 Feb 2010 17:01:35 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm2231006fxm.13.2010.02.01.17.01.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Feb 2010 17:01:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Feb 2010 02:01:21 +0100
Message-Id: <1265072481-30872-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 209.85.220.215
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] freesmartphone: bump SRCREVs to HEAD, drop configs and use configs provided with source
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
X-List-Received-Date: Tue, 02 Feb 2010 01:04:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/sane-srcrevs-fso.inc           |   20 ++--
 recipes/freesmartphone/cornucopia.inc              |    2 +-
 recipes/freesmartphone/fsodatad/fsodatad.conf      |   19 ----
 recipes/freesmartphone/fsodatad_git.bb             |   10 --
 recipes/freesmartphone/fsodeviced/fsodeviced.conf  |   83 ------------------
 .../fsodeviced/om-gta02/fsodeviced.conf            |   88 --------------------
 recipes/freesmartphone/fsodeviced_git.bb           |   14 +---
 recipes/freesmartphone/fsogsmd/fsogsmd.conf        |   57 -------------
 recipes/freesmartphone/fsogsmd_git.bb              |   10 --
 .../freesmartphone/fsonetworkd/fsonetworkd.conf    |   19 ----
 recipes/freesmartphone/fsonetworkd_git.bb          |   10 --
 recipes/freesmartphone/fsotdld/fsotdld.conf        |   43 ----------
 recipes/freesmartphone/fsotdld_git.bb              |   10 --
 recipes/freesmartphone/fsousaged/fsousaged.conf    |   32 -------
 .../fsousaged/om-gta02/fsousaged.conf              |   32 -------
 recipes/freesmartphone/fsousaged_git.bb            |   10 --
 16 files changed, 12 insertions(+), 447 deletions(-)
 delete mode 100644 recipes/freesmartphone/fsodatad/fsodatad.conf
 delete mode 100644 recipes/freesmartphone/fsodeviced/fsodeviced.conf
 delete mode 100644 recipes/freesmartphone/fsodeviced/om-gta02/fsodeviced.conf
 delete mode 100644 recipes/freesmartphone/fsogsmd/fsogsmd.conf
 delete mode 100644 recipes/freesmartphone/fsonetworkd/fsonetworkd.conf
 delete mode 100644 recipes/freesmartphone/fsotdld/fsotdld.conf
 delete mode 100644 recipes/freesmartphone/fsousaged/fsousaged.conf
 delete mode 100644 recipes/freesmartphone/fsousaged/om-gta02/fsousaged.conf

diff --git a/conf/distro/include/sane-srcrevs-fso.inc b/conf/distro/include/sane-srcrevs-fso.inc
index b858d81..4b9dbee 100644
--- a/conf/distro/include/sane-srcrevs-fso.inc
+++ b/conf/distro/include/sane-srcrevs-fso.inc
@@ -1,19 +1,19 @@
 # To be included from sane-srcrevs.inc
 
 # FSO Projects -- Cornucopia
-FSO_CORNUCOPIA_SRCREV ?= "70b87d6e8b04f0bf0078702f6467e037eb4fdb28"
+FSO_CORNUCOPIA_SRCREV ?= "57d2d93b3472f9d35b09a346dac52cddf6d7c9b6"
 SRCREV_pn-fso-apm ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-fsodatad ?= "${FSO_CORNUCOPIA_SRCREV}"
-SRCREV_pn-fsodeviced ?= "44a4aabf382995c9f3141ec09b202f0e569a484d"
+SRCREV_pn-fsodeviced ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-fsogsmd ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-fsolocationd ?= "${FSO_CORNUCOPIA_SRCREV}"
-SRCREV_pn-fsomusicd ?= "3233c80585dfbc0e77ee5549f9d7fb1a60b5a0f9"
+SRCREV_pn-fsomusicd ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-fsonetworkd ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-fsotimed ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-fsotdld ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-fsousaged ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-libfsobasics ?= "${FSO_CORNUCOPIA_SRCREV}"
-SRCREV_pn-libfsoframework ?= "c227502c59f4d1de3b3097b3329c2461d6cfa2a2"
+SRCREV_pn-libfsoframework ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-libfsotransport ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-libfsoresource ?= "${FSO_CORNUCOPIA_SRCREV}"
 SRCREV_pn-mickeydbus2 ?= "${FSO_CORNUCOPIA_SRCREV}"
@@ -28,13 +28,13 @@ SRCREV_pn-fso-gpsd ?= "39e810899110a9bb302cf2064e1c0f73541fb4e6"
 SRCREV_pn-fso-gsm0710muxd ?= "abcbcd7cc532a8834906de3fc24c8f8fe7643cd4"
 SRCREV_pn-fso-monitord ?= "b4ae1e9b10e710042624c2cf1a15b91a7d5b1d44"
 SRCREV_pn-fso-sounds ?= "3a4767ec01988bd0fd8f72f0c35d6d36e5fbc815"
-SRCREV_pn-fso-specs ?= "60580a3fc3e8b2c036f9734c59994a5175bfcc1e"
+SRCREV_pn-fso-specs ?= "af3e18e5183ccce29a03eea9fc5f5a0098003cc6"
 SRCREV_pn-gsmd2 ?= "c16883a079aeff8780e5d461ec4e8348537ab4d8"
-SRCREV_pn-libeflvala ?= "707ca862f11feb4fa6945c222a34272b8fd3aebb"
-SRCREV_pn-libfso-glib ?= "4016a7ff20cf53403ab22877eef3a706607f25a3"
-SRCREV_pn-libframeworkd-glib ?= "bdea2ad33bb5c5aa2b996712b99e8dd9b58aed7d"
+SRCREV_pn-libeflvala ?= "294f250f5c20a058f5016aaf674c57d0498070fd"
+SRCREV_pn-libfso-glib ?= "d7d9045b806744bdedf409874009cfde16c2de39"
+SRCREV_pn-libframeworkd-glib ?= "f68fe525c20aa8ef6c6cff70a80e60b91bed89a9"
 SRCREV_pn-libgsm0710 ?= "cd564c8782f018e0d65fb8716c99a6040b5bd166"
-SRCREV_pn-libgsm0710mux ?= "b6793a8191f20adba31b93b2f337cc5451270cf9"
+SRCREV_pn-libgsm0710mux ?= "7934196c47eb80e77105a92cb684656b3614a9fc"
 SRCREV_pn-libpersistence ?= "217ad803745f8ac1f3c72c6715e2c0faefb3fd06"
 FSO_PYTHONHELPERS_SRCREV ?= "63b1dff1bc8ac22efabcee8a90e957c3b2423317"
 SRCREV_pn-mickeydbus ?= "${FSO_PYTHONHELPERS_SRCREV}"
@@ -43,7 +43,7 @@ SRCREV_pn-msmcommd ?= "072226ac1e0f21735cb3bc26cdb87cd87e347afb"
 SRCREV_pn-multicat ?= "${FSO_PYTHONHELPERS_SRCREV}"
 SRCREV_pn-python-pyrtc ?= "${FSO_PYTHONHELPERS_SRCREV}"
 SRCREV_pn-pycd ?= "${FSO_PYTHONHELPERS_SRCREV}" 
-SRCREV_pn-vala-dbus-binding-tool-native ?= "11e5b817f569e3ce81fa94ed77ed529101368b7f"
+SRCREV_pn-vala-dbus-binding-tool-native ?= "8df9b5aab50066d3f5a525518f902dd26f77bbd7"
 SRCREV_pn-vala-terminal ?= "932285d72e26b965c488f8aa99fe51f7a34231ad"
 SRCREV_pn-vala-native ?= "a8aa50a80bcdc5f6c8183507f87b6c6fdfac8d9f"
 SRCREV_pn-zhone ?= "d654b3d15500a56c8e987e4d2cc2f8eef70b78c0"
diff --git a/recipes/freesmartphone/cornucopia.inc b/recipes/freesmartphone/cornucopia.inc
index bfc461e..4962263 100644
--- a/recipes/freesmartphone/cornucopia.inc
+++ b/recipes/freesmartphone/cornucopia.inc
@@ -5,7 +5,7 @@ SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib libfso-glib libgee"
 DEPENDS += "${@['libfsoframework', ''][(bb.data.getVar('PN', d, 1) in 'libfsoframework libfsobasics'.split())]}"
 PV = "invalid, please override"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia;protocol=git;branch=master"
 S = "${WORKDIR}/git/${PN}"
diff --git a/recipes/freesmartphone/fsodatad/fsodatad.conf b/recipes/freesmartphone/fsodatad/fsodatad.conf
deleted file mode 100644
index 85919cf..0000000
--- a/recipes/freesmartphone/fsodatad/fsodatad.conf
+++ /dev/null
@@ -1,19 +0,0 @@
-#######################################################################################
-# FSO Data Daemon Configuration File -- for SYSTEM INTEGRATORS only
-########################################################################################
-[logging]
-# Log level: DEBUG, INFO (default), WARNING, ERROR
-# Override via environment as FSO_LOG_LEVEL
-log_level = INFO
-# Where to log to: none (default), stderr, stderr:colors, file, syslog
-# Override via environment as FSO_LOG_TO
-log_to = file
-# Log Destination (valid only for log_to = file)
-# Override via environment as FSO_LOG_DESTINATION
-log_destination = /var/log/fsodatad.log
-
-[fsodata]
-# No settings yet
-
-[fsodata.world]
-# No settings yet
diff --git a/recipes/freesmartphone/fsodatad_git.bb b/recipes/freesmartphone/fsodatad_git.bb
index 95f50ee..f591066 100644
--- a/recipes/freesmartphone/fsodatad_git.bb
+++ b/recipes/freesmartphone/fsodatad_git.bb
@@ -4,13 +4,3 @@ PR = "${INC_PR}.2"
 PV = "0.0.0+gitr${SRCREV}"
 
 DEPENDS += "libxml2 mobile-broadband-provider-info"
-
-SRC_URI += "file://fsodatad.conf"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/freesmartphone/
-	install -m 0644 ${WORKDIR}/fsodatad.conf ${D}${sysconfdir}/freesmartphone/
-}
-
-FILES_${PN} += "${sysconfdir}/freesmartphone/fsodatad.conf"
-CONFFILES_${PN} += "${sysconfdir}/freesmartphone/fsodatad.conf"
diff --git a/recipes/freesmartphone/fsodeviced/fsodeviced.conf b/recipes/freesmartphone/fsodeviced/fsodeviced.conf
deleted file mode 100644
index de04ece..0000000
--- a/recipes/freesmartphone/fsodeviced/fsodeviced.conf
+++ /dev/null
@@ -1,83 +0,0 @@
-#######################################################################################
-# FSO Device Daemon Configuration File -- for SYSTEM INTEGRATORS only
-########################################################################################
-[logging]
-# Log level: DEBUG, INFO (default), WARNING, ERROR
-# Override via environment as FSO_LOG_LEVEL
-log_level = DEBUG
-# Where to log to: none (default), stderr, stderr:colors, file, syslog
-# Override via environment as FSO_LOG_TO
-log_to = stderr:colors
-# Log Destination (valid only for log_to = file)
-# Override via environment as FSO_LOG_DESTINATION
-log_destination = /var/log/fsodeviced.log
-
-[fsodevice]
-# No settings yet
-
-[fsodevice.accelerometer]
-# Which accelerometer variant plugin to use: none (default), lis302
-device_type = lis302
-
-[fsodevice.accelerometer_lis302]
-# Which input node to read from
-inputnode = /input/event2
-# How many samples to process, when in use
-sample_rate = 100
-# Threshhold to program, when in use
-threshold = 100
-# Scale to program, when in use
-full_scale = 2.3
-
-[fsodevice.player_alsa]
-# No settings yet
-
-[fsodevice.player_canberra]
-# No settings yet
-
-[fsodevice.player_gstreamer]
-# No settings yet
-
-[fsodevice.alsa_audio]
-# Which Audio Player variant plugin to use: none (default), alsa, canberra, gstreamer
-player_type = alsa
-
-[fsodevice.kernel26_display]
-# No settings yet
-
-[fsodevice.kernel26_leds]
-# No settings yet
-
-[fsodevice.kernel26_powersupply]
-# No settings yet
-
-[fsodevice.kernel26_rfkill]
-# No settings yet
-
-[fsodevice.kernel26_rtc]
-# No settings yet
-
-[fsodevice.kernel_info]
-# No settings yet
-
-[fsodevice.kernel_input]
-# Which input objects to ignore (by product id substring)
-#ignore_by_id = Microsoft;Macintosh
-# Which input objects to ignore (by physical path substring)
-#ignore_by_path = usb
-# Which buttons/switches to report.
-# Format: <name>,<type>,<keycode>,<report hold events as well>
-#report1 = AUX,key,169,1
-#report4 = HEADSET,switch,2,0
-
-[fsodevice.kernel_idle]
-# Which input objects to ignore (by product id substring)
-#ignore_by_id = Microsoft;Macintosh
-# Which input objects to ignore (by physical path substring)
-#ignore_by_path = usb
-
-# Enable this on openmoko devices
-#[fsodevice.openmoko_powercontrol]
-
-# Enable this on thinkpad devices
-#[fsodevice.thinkpad_powercontrol]
diff --git a/recipes/freesmartphone/fsodeviced/om-gta02/fsodeviced.conf b/recipes/freesmartphone/fsodeviced/om-gta02/fsodeviced.conf
deleted file mode 100644
index 79ba873..0000000
--- a/recipes/freesmartphone/fsodeviced/om-gta02/fsodeviced.conf
+++ /dev/null
@@ -1,88 +0,0 @@
-#######################################################################################
-# FSO Device Daemon Configuration File -- for SYSTEM INTEGRATORS only
-########################################################################################
-[logging]
-# Log level: DEBUG, INFO (default), WARNING, ERROR
-# Override via environment as FSO_LOG_LEVEL
-log_level = INFO
-# Where to log to: none (default), stderr, stderr:colors, file, syslog
-# Override via environment as FSO_LOG_TO
-log_to = file
-# Log Destination (valid only for log_to = file)
-# Override via environment as FSO_LOG_DESTINATION
-log_destination = /var/log/fsodeviced.log
-
-[fsodevice]
-# No settings yet
-
-[fsodevice.accelerometer_lis302]
-# Which input node to read from
-inputnode = /input/event2
-# How many samples to process, when in use
-sample_rate = 100
-# Threshhold to program, when in use
-threshold = 100
-# Scale to program, when in use
-full_scale = 2.3
-
-[fsodevice.accelerometer]
-# Which accelerometer variant plugin to use: none (default), lis302
-device_type = lis302
-
-[fsodevice.player_alsa]
-# No settings yet
-
-[fsodevice.player_canberra]
-# No settings yet
-
-[fsodevice.player_gstreamer]
-# No settings yet
-
-[fsodevice.alsa_audio]
-# Which Audio Player variant plugin to use: none (default), alsa, canberra, gstreamer
-player_type = alsa
-
-[fsodevice.kernel26_display]
-# No settings yet
-
-[fsodevice.kernel26_leds]
-# No settings yet
-
-[fsodevice.kernel26_powersupply]
-# No settings yet
-
-#[fsodevice.kernel26_rfkill]
-# No settings yet
-
-[fsodevice.kernel26_rtc]
-# No settings yet
-
-[fsodevice.kernel_info]
-# No settings yet
-
-[fsodevice.kernel_input]
-# Which input objects to ignore (by product id substring)
-ignore_by_id = lis302
-# Which input objects to ignore (by physical path substring)
-#ignore_by_path = usb
-# Which buttons/switches to report.
-# Format: <name>,<type>,<keycode>,<report hold events as well>
-report4 = HEADSET,switch,2,0
-report1 = AUX,key,169,1
-report3 = USB,key,356,0
-report2 = POWER,key,116,1
-
-[fsodevice.kernel_idle]
-# Which input objects to ignore (by product id substring)
-ignore_by_id = lis302
-# Which input objects to ignore (by physical path substring)
-#ignore_by_path = usb
-idle = 5
-idle_dim = 15
-idle_prelock = 9
-idle_lock = 1
-suspend = 30
-
-# Enable this on openmoko devices
-[fsodevice.openmoko_powercontrol]
-
diff --git a/recipes/freesmartphone/fsodeviced_git.bb b/recipes/freesmartphone/fsodeviced_git.bb
index ed9308e..39433ee 100644
--- a/recipes/freesmartphone/fsodeviced_git.bb
+++ b/recipes/freesmartphone/fsodeviced_git.bb
@@ -18,21 +18,9 @@ inherit update-rc.d
 INITSCRIPT_NAME = "fsodeviced"
 INITSCRIPT_PARAMS = "defaults 27"
 
-SRC_URI += "file://fsodeviced file://fsodeviced.conf"
+SRC_URI += "file://fsodeviced"
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/fsodeviced ${D}${sysconfdir}/init.d/
-	install -d ${D}${sysconfdir}/freesmartphone/
-	install -m 0644 ${WORKDIR}/fsodeviced.conf ${D}${sysconfdir}/freesmartphone/
 }
-
-FILES_${PN} += "\
-  ${sysconfdir}/init.d/fsodeviced \
-  ${sysconfdir}/freesmartphone \
-"
-
-CONFFILES_${PN} += "\
-  ${sysconfdir}/freesmartphone/fsodeviced.conf \
-"
-
diff --git a/recipes/freesmartphone/fsogsmd/fsogsmd.conf b/recipes/freesmartphone/fsogsmd/fsogsmd.conf
deleted file mode 100644
index 0da34cf..0000000
--- a/recipes/freesmartphone/fsogsmd/fsogsmd.conf
+++ /dev/null
@@ -1,57 +0,0 @@
-#######################################################################################
-# FSO GSM Daemon Configuration File -- for SYSTEM INTEGRATORS only
-########################################################################################
-[logging]
-# Log level: DEBUG, INFO (default), WARNING, ERROR
-# Override via environment as FSO_LOG_LEVEL
-log_level = INFO
-# Where to log to: none (default), stderr, stderr:colors, file, syslog
-# Override via environment as FSO_LOG_TO
-log_to = file
-# Log Destination (valid only for log_to = file)
-# Override via environment as FSO_LOG_DESTINATION
-log_destination = /var/log/fsogsmd.log
-
-[fsogsm]
-# Combined modem access string, prefered over individual configs below
-modem_access = serial:/dev/ttyUSB0:115200
-
-# Which modem to use: singleline, ti_calypso, freescale_neptune, cinterion_mc75, qualcomm_msm
-modem_type = singleline
-# Which transport channel: serial, pty
-modem_transport = serial
-# Which port to communicate with: <serial port> or <filename>
-modem_port = /dev/ttyUSB0
-# Which speed to use for the transport/port
-modem_speed = 115200
-
-# Global modem init sequence; this is the first sequence that gets sent to the modem after power cycling
-modem_init = E0V1;+CMEE=1;+CRC=1;+CSCS="UCS2"
-
-# Following configuration options are in the form channel_<state>_<name>, with state being one of
-# "init", "unlocked", "registered", "suspend", "resume", and name being the channel name (modem specific)
-# Whether these strings override, append, or are honored at all depends on the actual modem plugin
-# Example usage for one channel named 'main':
-channel_init_main = +CSNS=0;+CMGF=0;+CLIP=1
-channel_unlocked_main = +SIM_NOW_UNLOCKED;+CSDH=1;+COLP=1;+CCWA=1;+CNMI=2,1,2,2,1
-channel_registered_main = +NET_NOW_REGISTERED
-channel_suspend_main = +PREPARE_FOR_SUSPEND
-channel_resume_main = +RECOVER_AFTER_RESUME
-
-# Where to store SMS: <path> (default=/tmp/fsogsmd/sms/)
-sms_storage_dir = /tmp/fsogsmd/sms/
-
-[fsogsm.modem_singleline]
-# No settings yet
-
-[fsogsm.modem_cinterion_mc75]
-# No settings yet
-
-[fsogsm.modem_ti_calypso]
-# No settings yet
-
-[fsogsm.modem_qualcomm_msm]
-# No settings yet
-
-[fsogsm.dbus_service]
-# No settings yet
diff --git a/recipes/freesmartphone/fsogsmd_git.bb b/recipes/freesmartphone/fsogsmd_git.bb
index f6adeeb..8056f4b 100644
--- a/recipes/freesmartphone/fsogsmd_git.bb
+++ b/recipes/freesmartphone/fsogsmd_git.bb
@@ -5,17 +5,7 @@ PV = "0.2.0+gitr${SRCREV}"
 
 DEPENDS += "libfsoresource libgsm0710mux"
 
-SRC_URI += "file://fsogsmd.conf"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/freesmartphone/
-	install -m 0644 ${WORKDIR}/fsogsmd.conf ${D}${sysconfdir}/freesmartphone/
-}
-
 do_install_append_shr() {
 	# remove .service file to disable fsogsmd autostart
 	rm -f ${D}${datadir}/dbus-1/system-services/org.freesmartphone.ogsmd.service
 }
-
-FILES_${PN} += "${sysconfdir}/freesmartphone/fsogsmd.conf"
-CONFFILES_${PN} += "${sysconfdir}/freesmartphone/fsogsmd.conf"
diff --git a/recipes/freesmartphone/fsonetworkd/fsonetworkd.conf b/recipes/freesmartphone/fsonetworkd/fsonetworkd.conf
deleted file mode 100644
index d8e5cee..0000000
--- a/recipes/freesmartphone/fsonetworkd/fsonetworkd.conf
+++ /dev/null
@@ -1,19 +0,0 @@
-#######################################################################################
-# FSO Network Daemon Configuration File -- for SYSTEM INTEGRATORS only
-########################################################################################
-[logging]
-# Log level: DEBUG, INFO (default), WARNING, ERROR
-# Override via environment as FSO_LOG_LEVEL
-log_level = INFO
-# Where to log to: none (default), stderr, stderr:colors, file, syslog
-# Override via environment as FSO_LOG_TO
-log_to = file
-# Log Destination (valid only for log_to = file)
-# Override via environment as FSO_LOG_DESTINATION
-log_destination = /var/log/fsonetworkd.log
-
-[fsonetwork]
-# No settings yet
-
-[fsonetwork.sharing]
-# No settings yet
diff --git a/recipes/freesmartphone/fsonetworkd_git.bb b/recipes/freesmartphone/fsonetworkd_git.bb
index c0b8696..551245a 100644
--- a/recipes/freesmartphone/fsonetworkd_git.bb
+++ b/recipes/freesmartphone/fsonetworkd_git.bb
@@ -2,13 +2,3 @@ require cornucopia.inc
 inherit fso-plugin
 PV = "0.1.0.0+gitr${SRCREV}"
 PR = "${INC_PR}.2"
-
-SRC_URI += "file://fsonetworkd.conf"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/freesmartphone/
-	install -m 0644 ${WORKDIR}/fsonetworkd.conf ${D}${sysconfdir}/freesmartphone/
-}
-
-FILES_${PN} += "${sysconfdir}/freesmartphone/fsonetworkd.conf"
-CONFFILES_${PN} += "${sysconfdir}/freesmartphone/fsonetworkd.conf"
diff --git a/recipes/freesmartphone/fsotdld/fsotdld.conf b/recipes/freesmartphone/fsotdld/fsotdld.conf
deleted file mode 100644
index 07e91b0..0000000
--- a/recipes/freesmartphone/fsotdld/fsotdld.conf
+++ /dev/null
@@ -1,43 +0,0 @@
-#######################################################################################
-# FSO Time Date Location Daemon Configuration File -- for SYSTEM INTEGRATORS only
-########################################################################################
-[logging]
-# Log level: DEBUG, INFO (default), WARNING, ERROR
-# Override via environment as FSO_LOG_LEVEL
-log_level = INFO
-# Where to log to: none (default), stderr, stderr:colors, file, syslog
-# Override via environment as FSO_LOG_TO
-log_to = file
-# Log Destination (valid only for log_to = file)
-# Override via environment as FSO_LOG_DESTINATION
-log_destination = /var/log/fsotdld.log
-
-[fsotdl]
-gps_receiver_transport = serial
-gps_receiver_port = /dev/rfcomm0
-gps_receiver_speed = 9600
-
-[fsotdl.alarm]
-# No settings yet
-
-[fsotdl.source_ntp]
-# Which server to use; default is 'pool.ntp.org'
-server = time.windows.com
-
-[fsotdl.source_gsm]
-# No settings yet
-
-[fsotdl.provider_gps_nmea]
-# No settings yet
-
-[fsotdl.provider_gps]
-provider_type = nmea
-
-[fsotdl.sync_time]
-# Which sources to use; what is available depends on the loaded modules
-sources = ntp;gsm
-# Which current timezone file to use; default is /etc/timezone
-timezone_file = /etc/timezone
-# Path to zoneinfo files, default is /usr/share/zoneinfo
-zoneinfo_dir = /usr/share/zoneinfo
-
diff --git a/recipes/freesmartphone/fsotdld_git.bb b/recipes/freesmartphone/fsotdld_git.bb
index e6b64c3..6ad8d47 100644
--- a/recipes/freesmartphone/fsotdld_git.bb
+++ b/recipes/freesmartphone/fsotdld_git.bb
@@ -4,13 +4,3 @@ PR = "${INC_PR}.2"
 PV = "0.0.0+gitr${SRCREV}"
 
 DEPENDS += "libfsotransport libfsoresource"
-
-SRC_URI += "file://fsotdld.conf"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/freesmartphone/
-	install -m 0644 ${WORKDIR}/fsotdld.conf ${D}${sysconfdir}/freesmartphone/
-}
-
-FILES_${PN} += "${sysconfdir}/freesmartphone/fsotdld.conf"
-CONFFILES_${PN} += "${sysconfdir}/freesmartphone/fsotdld.conf"
diff --git a/recipes/freesmartphone/fsousaged/fsousaged.conf b/recipes/freesmartphone/fsousaged/fsousaged.conf
deleted file mode 100644
index 542bc75..0000000
--- a/recipes/freesmartphone/fsousaged/fsousaged.conf
+++ /dev/null
@@ -1,32 +0,0 @@
-#######################################################################################
-# FSO Usage Daemon Configuration File -- for SYSTEM INTEGRATORS only
-########################################################################################
-[logging]
-# Log level: DEBUG, INFO (default), WARNING, ERROR
-# Override via environment as FSO_LOG_LEVEL
-log_level = INFO
-# Where to log to: none (default), stderr, stderr:colors, file, syslog
-# Override via environment as FSO_LOG_TO
-log_to = file
-# Log Destination (valid only for log_to = file)
-# Override via environment as FSO_LOG_DESTINATION
-log_destination = /var/log/fsousaged.log
-
-[fsousage]
-# Which low level suspend/resume variant to use: none (default), kernel26, openmoko
-lowlevel_type = kernel26
-# FOR DEBUGGING ONLY: Do not suspend, but instead sleep a couple of seconds
-debug_do_not_suspend = 0
-# FOR DEBUGGING ONLY: Enable every registered resource on startup
-debug_enable_on_startup = 0
-# FOR DEBUGGING ONLY: Whether resource activation should be synchronized with the registration lifecycle: always (default), startup, shutdown, never
-sync_resources_with_lifecycle = always
-
-[fsousage.lowlevel_kernel26]
-# No settings yet
-
-[fsousage.lowlevel_openmoko]
-# No settings yet
-
-[fsousage.dbus_service]
-# No settings yet
diff --git a/recipes/freesmartphone/fsousaged/om-gta02/fsousaged.conf b/recipes/freesmartphone/fsousaged/om-gta02/fsousaged.conf
deleted file mode 100644
index 1e57613..0000000
--- a/recipes/freesmartphone/fsousaged/om-gta02/fsousaged.conf
+++ /dev/null
@@ -1,32 +0,0 @@
-#######################################################################################
-# FSO Usage Daemon Configuration File -- for SYSTEM INTEGRATORS only
-########################################################################################
-[logging]
-# Log level: DEBUG, INFO (default), WARNING, ERROR
-# Override via environment as FSO_LOG_LEVEL
-log_level = INFO
-# Where to log to: none (default), stderr, stderr:colors, file, syslog
-# Override via environment as FSO_LOG_TO
-log_to = file
-# Log Destination (valid only for log_to = file)
-# Override via environment as FSO_LOG_DESTINATION
-log_destination = /var/log/fsousaged.log
-
-[fsousage]
-# Which low level suspend/resume variant to use: none (default), kernel26, openmoko
-lowlevel_type = openmoko
-# FOR DEBUGGING ONLY: Do not suspend, but instead sleep a couple of seconds
-debug_do_not_suspend = 0
-# FOR DEBUGGING ONLY: Enable every registered resource on startup
-debug_enable_on_startup = 0
-# FOR DEBUGGING ONLY: Whether resource activation should be synchronized with the registration lifecycle: always (default), startup, shutdown, never
-sync_resources_with_lifecycle = always
-
-[fsousage.lowlevel_kernel26]
-# No settings yet
-
-[fsousage.lowlevel_openmoko]
-# No settings yet
-
-[fsousage.dbus_service]
-# No settings yet
diff --git a/recipes/freesmartphone/fsousaged_git.bb b/recipes/freesmartphone/fsousaged_git.bb
index 649b9e4..2bbbae8 100644
--- a/recipes/freesmartphone/fsousaged_git.bb
+++ b/recipes/freesmartphone/fsousaged_git.bb
@@ -2,13 +2,3 @@ require cornucopia.inc
 inherit fso-plugin
 PV = "0.9.0.1+gitr${SRCREV}"
 PR = "${INC_PR}.2"
-
-SRC_URI += "file://fsousaged.conf"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/freesmartphone/
-	install -m 0644 ${WORKDIR}/fsousaged.conf ${D}${sysconfdir}/freesmartphone/
-}
-
-FILES_${PN} += "${sysconfdir}/freesmartphone/fsousaged.conf"
-CONFFILES_${PN} += "${sysconfdir}/freesmartphone/fsousaged.conf"
-- 
1.6.6.1



