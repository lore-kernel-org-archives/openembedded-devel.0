Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9a4-0007uh-Sa
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:53:29 +0200
Received: by fxg11 with SMTP id 11so877785fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=hUMU020YZFWoSr26denQz4167be+3PXwufbA58pKmFw=;
	b=OfUFS25njsLQEzGx/QER5SBl99usiMy/iOA60db32UwEkKJFodtr+VO+fll+VyUq+g
	RQZdQ1tTGsjFu+CwP9fAPKv8zU5nwk/Z0a5utm4IIuaOzksoJri1SEue2dUcYuzQmvmO
	EvXkWsSfJmZWogOUucalCpFyTTzbn9V0XEv+k=
Received: by 10.223.44.8 with SMTP id y8mr489093fae.129.1314892113021;
	Thu, 01 Sep 2011 08:48:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i16sm131257faa.21.2011.09.01.08.48.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:48:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:48:20 +0200
Message-Id: <1314892100-18478-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH] zaurusd: switch from svn.o-hand.com to git.yoctoproject.org
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
X-List-Received-Date: Thu, 01 Sep 2011 15:53:29 -0000

* bump PE for upgrade path
* fix LICENSE and add LIC_FILES_CHKSUM
* move files from directory files to zaurusd for faster lookup

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../zaurusd/files/01-check-toggle-landscape        |    9 -
 recipes-bsp/zaurusd/files/01-check-toggle-portait  |    9 -
 recipes-bsp/zaurusd/files/add-poodle.patch         |   15 -
 .../zaurusd/files/alsa-6000x-default.state.patch   |  769 --------------------
 .../zaurusd/files/alsa-cxx00-default.state.patch   |  240 ------
 .../zaurusd/files/avoid-rotated-server.patch       |  123 ----
 .../zaurusd/files/disable-alsa-handling.patch      |   16 -
 recipes-bsp/zaurusd/files/new-make.patch           |   11 -
 .../use-ts-symlink-instead-of-hardcoding.diff      |   88 ---
 recipes-bsp/zaurusd/files/zaurus-hinge.bl-off      |   19 -
 recipes-bsp/zaurusd/files/zaurus-hinge.bl-on       |   63 --
 recipes-bsp/zaurusd/files/zaurus-hinge.in          |   66 --
 .../zaurusd/files/zaurus-hinge.matchbox-landscape  |   25 -
 .../zaurusd/files/zaurus-hinge.matchbox-portrait   |   29 -
 .../zaurusd/zaurusd/01-check-toggle-landscape      |    9 +
 .../zaurusd/zaurusd/01-check-toggle-portait        |    9 +
 recipes-bsp/zaurusd/zaurusd/add-poodle.patch       |   15 +
 .../zaurusd/zaurusd/alsa-6000x-default.state.patch |  769 ++++++++++++++++++++
 .../zaurusd/zaurusd/alsa-cxx00-default.state.patch |  240 ++++++
 .../zaurusd/zaurusd/avoid-rotated-server.patch     |  123 ++++
 .../zaurusd/zaurusd/disable-alsa-handling.patch    |   16 +
 recipes-bsp/zaurusd/zaurusd/new-make.patch         |   11 +
 .../use-ts-symlink-instead-of-hardcoding.diff      |   88 +++
 recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-off    |   19 +
 recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-on     |   63 ++
 recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in        |   66 ++
 .../zaurusd/zaurus-hinge.matchbox-landscape        |   25 +
 .../zaurusd/zaurusd/zaurus-hinge.matchbox-portrait |   29 +
 recipes-bsp/zaurusd/zaurusd_git.bb                 |   58 ++
 recipes-bsp/zaurusd/zaurusd_svn.bb                 |   56 --
 30 files changed, 1540 insertions(+), 1538 deletions(-)
 delete mode 100644 recipes-bsp/zaurusd/files/01-check-toggle-landscape
 delete mode 100644 recipes-bsp/zaurusd/files/01-check-toggle-portait
 delete mode 100644 recipes-bsp/zaurusd/files/add-poodle.patch
 delete mode 100644 recipes-bsp/zaurusd/files/alsa-6000x-default.state.patch
 delete mode 100644 recipes-bsp/zaurusd/files/alsa-cxx00-default.state.patch
 delete mode 100644 recipes-bsp/zaurusd/files/avoid-rotated-server.patch
 delete mode 100644 recipes-bsp/zaurusd/files/disable-alsa-handling.patch
 delete mode 100644 recipes-bsp/zaurusd/files/new-make.patch
 delete mode 100644 recipes-bsp/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff
 delete mode 100644 recipes-bsp/zaurusd/files/zaurus-hinge.bl-off
 delete mode 100644 recipes-bsp/zaurusd/files/zaurus-hinge.bl-on
 delete mode 100644 recipes-bsp/zaurusd/files/zaurus-hinge.in
 delete mode 100644 recipes-bsp/zaurusd/files/zaurus-hinge.matchbox-landscape
 delete mode 100644 recipes-bsp/zaurusd/files/zaurus-hinge.matchbox-portrait
 create mode 100644 recipes-bsp/zaurusd/zaurusd/01-check-toggle-landscape
 create mode 100644 recipes-bsp/zaurusd/zaurusd/01-check-toggle-portait
 create mode 100644 recipes-bsp/zaurusd/zaurusd/add-poodle.patch
 create mode 100644 recipes-bsp/zaurusd/zaurusd/alsa-6000x-default.state.patch
 create mode 100644 recipes-bsp/zaurusd/zaurusd/alsa-cxx00-default.state.patch
 create mode 100644 recipes-bsp/zaurusd/zaurusd/avoid-rotated-server.patch
 create mode 100644 recipes-bsp/zaurusd/zaurusd/disable-alsa-handling.patch
 create mode 100644 recipes-bsp/zaurusd/zaurusd/new-make.patch
 create mode 100644 recipes-bsp/zaurusd/zaurusd/use-ts-symlink-instead-of-hardcoding.diff
 create mode 100644 recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-off
 create mode 100644 recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-on
 create mode 100644 recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in
 create mode 100644 recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-landscape
 create mode 100644 recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-portrait
 create mode 100644 recipes-bsp/zaurusd/zaurusd_git.bb
 delete mode 100644 recipes-bsp/zaurusd/zaurusd_svn.bb

diff --git a/recipes-bsp/zaurusd/files/01-check-toggle-landscape b/recipes-bsp/zaurusd/files/01-check-toggle-landscape
deleted file mode 100644
index 13ae9a4..0000000
--- a/recipes-bsp/zaurusd/files/01-check-toggle-landscape
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-# Try to determine and ignore false rotation signals caused by
-# headphones removal or remote removal remembering the old state.
-# OE#3390
-if test "`cat /var/run/last-screen-rotation`" = landscape ; then
-    exit
-fi
-echo landscape > /var/run/last-screen-rotation
diff --git a/recipes-bsp/zaurusd/files/01-check-toggle-portait b/recipes-bsp/zaurusd/files/01-check-toggle-portait
deleted file mode 100644
index 4c3b7f1..0000000
--- a/recipes-bsp/zaurusd/files/01-check-toggle-portait
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-# Try to determine and ignore false rotation signals caused by                                                              
-# headphones removal or remote removal remembering the old state.
-# OE#3390
-if test "`cat /var/run/last-screen-rotation`" = portait ; then
-    exit
-fi
-echo portait > /var/run/last-screen-rotation
diff --git a/recipes-bsp/zaurusd/files/add-poodle.patch b/recipes-bsp/zaurusd/files/add-poodle.patch
deleted file mode 100644
index 3793faf..0000000
--- a/recipes-bsp/zaurusd/files/add-poodle.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- zaurusd/config/mach-config/mach-poodle-vars.in	(revision 418)
-+++ zaurusd/config/mach-config/mach-poodle-vars.in	(working copy)
-@@ -1,3 +1,9 @@
- MACHINE=poodle
- 
--ALSA_MIXER_INIT=@appconfdir@/alsa/5600-default.state
-\ No newline at end of file
-+export SWITCH_EVENT_ZMIXER=1
-+SWITCH_EVENT_DEVICE=/dev/input/event0
-+
-+#TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
-+#TSKEYS_DEVICE=/dev/input/event1
-+
-+ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
-\ No newline at end of file
diff --git a/recipes-bsp/zaurusd/files/alsa-6000x-default.state.patch b/recipes-bsp/zaurusd/files/alsa-6000x-default.state.patch
deleted file mode 100644
index 29c98f7..0000000
--- a/recipes-bsp/zaurusd/files/alsa-6000x-default.state.patch
+++ /dev/null
@@ -1,769 +0,0 @@
---- zaurusd/config/alsa/6000x-default.state	2009-04-25 22:57:30.000000000 +0100
-+++ zaurusd/config/alsa/6000x-default.state	2009-05-14 10:41:29.000000000 +0100
-@@ -6,8 +6,8 @@
- 		comment.range '0 - 31'
- 		iface MIXER
- 		name 'Speaker Playback Volume'
--		value.0 27
--		value.1 27
-+		value.0 25
-+		value.1 25
- 	}
- 	control.2 {
- 		comment.access 'read write'
-@@ -24,8 +24,8 @@
- 		comment.range '0 - 31'
- 		iface MIXER
- 		name 'Headphone Playback Volume'
--		value.0 26
--		value.1 26
-+		value.0 20
-+		value.1 20
- 	}
- 	control.4 {
- 		comment.access 'read write'
-@@ -37,13 +37,23 @@
- 	}
- 	control.5 {
- 		comment.access 'read write'
-+		comment.type INTEGER
-+		comment.count 2
-+		comment.range '0 - 31'
-+		iface MIXER
-+		name 'PCM Playback Volume'
-+		value.0 23
-+		value.1 23
-+	}
-+	control.6 {
-+		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
- 		iface MIXER
- 		name 'Speaker Playback ZC Switch'
- 		value true
- 	}
--	control.6 {
-+	control.7 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -51,7 +61,7 @@
- 		name 'Speaker Playback Invert Switch'
- 		value true
- 	}
--	control.7 {
-+	control.8 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -59,7 +69,7 @@
- 		name 'Headphone Playback ZC Switch'
- 		value true
- 	}
--	control.8 {
-+	control.9 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -67,7 +77,7 @@
- 		name 'Mono Playback ZC Switch'
- 		value false
- 	}
--	control.9 {
-+	control.10 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -76,7 +86,7 @@
- 		name 'Mono Playback Volume'
- 		value 0
- 	}
--	control.10 {
-+	control.11 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -85,16 +95,16 @@
- 		name 'ALC Target Volume'
- 		value 11
- 	}
--	control.11 {
-+	control.12 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
- 		comment.range '0 - 15'
- 		iface MIXER
- 		name 'ALC Hold Time'
--		value 0
-+		value 2
- 	}
--	control.12 {
-+	control.13 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -103,7 +113,7 @@
- 		name 'ALC Decay Time'
- 		value 3
- 	}
--	control.13 {
-+	control.14 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -112,7 +122,7 @@
- 		name 'ALC Attack Time'
- 		value 2
- 	}
--	control.14 {
-+	control.15 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -124,7 +134,7 @@
- 		name 'ALC Function'
- 		value None
- 	}
--	control.15 {
-+	control.16 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -133,16 +143,16 @@
- 		name 'ALC Max Volume'
- 		value 7
- 	}
--	control.16 {
-+	control.17 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
- 		comment.range '0 - 3'
- 		iface MIXER
- 		name 'ALC ZC Timeout'
--		value 1
-+		value 0
- 	}
--	control.17 {
-+	control.18 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -150,7 +160,7 @@
- 		name 'ALC ZC Switch'
- 		value false
- 	}
--	control.18 {
-+	control.19 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -158,7 +168,7 @@
- 		name 'ALC NG Switch'
- 		value false
- 	}
--	control.19 {
-+	control.20 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -168,7 +178,7 @@
- 		name 'ALC NG Type'
- 		value 'Constant Gain'
- 	}
--	control.20 {
-+	control.21 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -177,16 +187,16 @@
- 		name 'ALC NG Threshold'
- 		value 31
- 	}
--	control.21 {
-+	control.22 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
- 		comment.range '0 - 7'
- 		iface MIXER
- 		name 'Mic Headphone  Volume'
--		value 3
-+		value 7
- 	}
--	control.22 {
-+	control.23 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -195,7 +205,7 @@
- 		name 'ALC Headphone Volume'
- 		value 5
- 	}
--	control.23 {
-+	control.24 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -203,7 +213,7 @@
- 		name 'Out3 Switch'
- 		value false
- 	}
--	control.24 {
-+	control.25 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -211,7 +221,7 @@
- 		name 'Out3 ZC Switch'
- 		value true
- 	}
--	control.25 {
-+	control.26 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -220,7 +230,7 @@
- 		name 'Out3 Volume'
- 		value 0
- 	}
--	control.26 {
-+	control.27 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -229,7 +239,7 @@
- 		name 'PCBeep Bypass Headphone Volume'
- 		value 0
- 	}
--	control.27 {
-+	control.28 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -238,7 +248,7 @@
- 		name 'PCBeep Bypass Speaker Volume'
- 		value 0
- 	}
--	control.28 {
-+	control.29 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -247,16 +257,16 @@
- 		name 'PCBeep Bypass Phone Volume'
- 		value 0
- 	}
--	control.29 {
-+	control.30 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
- 		comment.range '0 - 7'
- 		iface MIXER
- 		name 'Aux Playback Headphone Volume'
--		value 6
-+		value 5
- 	}
--	control.30 {
-+	control.31 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -265,7 +275,7 @@
- 		name 'Aux Playback Speaker Volume'
- 		value 0
- 	}
--	control.31 {
-+	control.32 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -274,7 +284,7 @@
- 		name 'Aux Playback Phone Volume'
- 		value 0
- 	}
--	control.32 {
-+	control.33 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -283,7 +293,7 @@
- 		name 'Phone Volume'
- 		value 0
- 	}
--	control.33 {
-+	control.34 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 2
-@@ -293,7 +303,7 @@
- 		value.0 23
- 		value.1 23
- 	}
--	control.34 {
-+	control.35 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -301,7 +311,7 @@
- 		name 'Capture 20dB Boost Switch'
- 		value true
- 	}
--	control.35 {
-+	control.36 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -309,7 +319,7 @@
- 		name 'Capture to Phone 20dB Boost Switch'
- 		value true
- 	}
--	control.36 {
-+	control.37 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -317,7 +327,7 @@
- 		name '3D Upper Cut-off Switch'
- 		value false
- 	}
--	control.37 {
-+	control.38 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -325,7 +335,7 @@
- 		name '3D Lower Cut-off Switch'
- 		value false
- 	}
--	control.38 {
-+	control.39 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -334,7 +344,7 @@
- 		name '3D Playback Volume'
- 		value 0
- 	}
--	control.39 {
-+	control.40 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -344,7 +354,7 @@
- 		name 'Bass Control'
- 		value 'Adaptive Boost'
- 	}
--	control.40 {
-+	control.41 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -352,7 +362,7 @@
- 		name 'Bass Cut-off Switch'
- 		value true
- 	}
--	control.41 {
-+	control.42 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -360,7 +370,7 @@
- 		name 'Tone Cut-off Switch'
- 		value false
- 	}
--	control.42 {
-+	control.43 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -368,7 +378,7 @@
- 		name 'Playback Attenuate (-6dB) Switch'
- 		value false
- 	}
--	control.43 {
-+	control.44 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -377,7 +387,7 @@
- 		name 'Bass Volume'
- 		value 8
- 	}
--	control.44 {
-+	control.45 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -386,7 +396,7 @@
- 		name 'Treble Volume'
- 		value 5
- 	}
--	control.45 {
-+	control.46 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -394,7 +404,7 @@
- 		name 'Capture ADC Switch'
- 		value false
- 	}
--	control.46 {
-+	control.47 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 2
-@@ -405,17 +415,17 @@
- 		value.0 '+0.75dB Steps'
- 		value.1 '+0.75dB Steps'
- 	}
--	control.47 {
-+	control.48 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 2
- 		comment.range '0 - 63'
- 		iface MIXER
- 		name 'Capture Volume'
--		value.0 63
--		value.1 63
-+		value.0 0
-+		value.1 0
- 	}
--	control.48 {
-+	control.49 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -423,7 +433,7 @@
- 		name 'Capture ZC Switch'
- 		value false
- 	}
--	control.49 {
-+	control.50 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -432,7 +442,7 @@
- 		name 'Mic 1 Volume'
- 		value 23
- 	}
--	control.50 {
-+	control.51 {
- 		comment.access 'read write'
- 		comment.type INTEGER
- 		comment.count 1
-@@ -441,7 +451,7 @@
- 		name 'Mic 2 Volume'
- 		value 23
- 	}
--	control.51 {
-+	control.52 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -449,7 +459,7 @@
- 		name 'Mic 20dB Boost Switch'
- 		value false
- 	}
--	control.52 {
-+	control.53 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -457,7 +467,7 @@
- 		name 'Speaker Mixer PCBeep Bypass Swi'
- 		value false
- 	}
--	control.53 {
-+	control.54 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -465,7 +475,7 @@
- 		name 'Speaker Mixer Aux Playback Swit'
- 		value false
- 	}
--	control.54 {
-+	control.55 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -473,7 +483,7 @@
- 		name 'Speaker Mixer Phone Bypass Swit'
- 		value false
- 	}
--	control.55 {
-+	control.56 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -481,7 +491,7 @@
- 		name 'Speaker Mixer Line Bypass Switc'
- 		value false
- 	}
--	control.56 {
-+	control.57 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -489,7 +499,7 @@
- 		name 'Speaker Mixer PCM Playback Swit'
- 		value true
- 	}
--	control.57 {
-+	control.58 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -497,7 +507,7 @@
- 		name 'Phone Mixer PCBeep Bypass Switc'
- 		value false
- 	}
--	control.58 {
-+	control.59 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -505,7 +515,7 @@
- 		name 'Phone Mixer Aux Playback Switch'
- 		value false
- 	}
--	control.59 {
-+	control.60 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -513,7 +523,7 @@
- 		name 'Phone Mixer Line Bypass Switch'
- 		value false
- 	}
--	control.60 {
-+	control.61 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -521,7 +531,7 @@
- 		name 'Phone Mixer PCM Playback Switch'
- 		value false
- 	}
--	control.61 {
-+	control.62 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -529,7 +539,7 @@
- 		name 'Phone Mixer Mic 1 Sidetone Swit'
- 		value false
- 	}
--	control.62 {
-+	control.63 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -537,7 +547,7 @@
- 		name 'Phone Mixer Mic 2 Sidetone Swit'
- 		value false
- 	}
--	control.63 {
-+	control.64 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -545,7 +555,7 @@
- 		name 'Right HP Mixer PCBeep Bypass Sw'
- 		value false
- 	}
--	control.64 {
-+	control.65 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -553,7 +563,7 @@
- 		name 'Right HP Mixer Aux Playback Swi'
- 		value false
- 	}
--	control.65 {
-+	control.66 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -561,7 +571,7 @@
- 		name 'Right HP Mixer Phone Bypass Swi'
- 		value false
- 	}
--	control.66 {
-+	control.67 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -569,7 +579,7 @@
- 		name 'Right HP Mixer Line Bypass Swit'
- 		value false
- 	}
--	control.67 {
-+	control.68 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -577,7 +587,7 @@
- 		name 'Right HP Mixer PCM Playback Swi'
- 		value true
- 	}
--	control.68 {
-+	control.69 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -585,7 +595,7 @@
- 		name 'Right HP Mixer Mic Sidetone Swi'
- 		value false
- 	}
--	control.69 {
-+	control.70 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -593,7 +603,7 @@
- 		name 'Left HP Mixer PCBeep Bypass Swi'
- 		value false
- 	}
--	control.70 {
-+	control.71 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -601,7 +611,7 @@
- 		name 'Left HP Mixer Aux Playback Swit'
- 		value false
- 	}
--	control.71 {
-+	control.72 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -609,7 +619,7 @@
- 		name 'Left HP Mixer Phone Bypass Swit'
- 		value false
- 	}
--	control.72 {
-+	control.73 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -617,7 +627,7 @@
- 		name 'Left HP Mixer Line Bypass Switc'
- 		value false
- 	}
--	control.73 {
-+	control.74 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -625,7 +635,7 @@
- 		name 'Left HP Mixer PCM Playback Swit'
- 		value true
- 	}
--	control.74 {
-+	control.75 {
- 		comment.access 'read write'
- 		comment.type BOOLEAN
- 		comment.count 1
-@@ -633,7 +643,7 @@
- 		name 'Left HP Mixer Mic Sidetone Swit'
- 		value false
- 	}
--	control.75 {
-+	control.76 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -641,9 +651,9 @@
- 		comment.item.1 Line
- 		iface MIXER
- 		name 'Differential Source'
--		value Line
-+		value Mic
- 	}
--	control.76 {
-+	control.77 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -653,9 +663,9 @@
- 		comment.item.3 Stereo
- 		iface MIXER
- 		name 'Mic Select Source'
--		value 'Mic 1'
-+		value Differential
- 	}
--	control.77 {
-+	control.78 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -671,7 +681,7 @@
- 		name 'Right Capture Select'
- 		value Mic
- 	}
--	control.78 {
-+	control.79 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -687,7 +697,7 @@
- 		name 'Left Capture Select'
- 		value Mic
- 	}
--	control.79 {
-+	control.80 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -699,7 +709,7 @@
- 		name 'Capture Phone Mux'
- 		value Mute
- 	}
--	control.80 {
-+	control.81 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -709,7 +719,7 @@
- 		name 'Speaker Mux'
- 		value 'Speaker Mix'
- 	}
--	control.81 {
-+	control.82 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -721,7 +731,7 @@
- 		name 'Out3 Mux'
- 		value Left
- 	}
--	control.82 {
-+	control.83 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -733,7 +743,7 @@
- 		name 'ALC Sidetone Mux'
- 		value Stereo
- 	}
--	control.83 {
-+	control.84 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
-@@ -746,7 +756,7 @@
- 		name 'Jack Function'
- 		value Off
- 	}
--	control.84 {
-+	control.85 {
- 		comment.access 'read write'
- 		comment.type ENUMERATED
- 		comment.count 1
diff --git a/recipes-bsp/zaurusd/files/alsa-cxx00-default.state.patch b/recipes-bsp/zaurusd/files/alsa-cxx00-default.state.patch
deleted file mode 100644
index d65ed4a..0000000
--- a/recipes-bsp/zaurusd/files/alsa-cxx00-default.state.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-NOTE: Patch slightly modified from original; unmodified comments from 
-original patch copied below.
-=============================================================================
-http://bugs.openembedded.net/show_bug.cgi?id=2617
-- Fixes default ALSA state for SL-Cxx00.
-  * Treble level reflects kernel fix alsa-wm8750-treble.patch (>2.6.24).
-  * Increased Mic Levels and Boost.
-  * Enabled Capture Switch.
-  * Improved Headphones / Speaker volume balance.
-  * 3D Mode changed to "Playback" (still Off by default).
-  * Disabled all bypasses.
-  * All Mono signals decreased to 0 (not connected).
-  * Line Mux changed to differential, keeping PGA unused.
-  * Using Digital mono for recording (jack supports ony mono).
-  * Enabled Automatic Level Control, optimized for voice recording.
-  * Enabled Zero Cross volume changes.
-- Do not alter incorrect mixer levels by zaurus-mixer-callback.
-
---- zaurusd/config/alsa/cxx00-default.state	2009-04-25 22:57:30.000000000 +0100
-+++ zaurusd/config/alsa/cxx00-default.state	2009-05-14 10:41:29.000000000 +0100
-@@ -6,8 +6,8 @@
- 		comment.range '0 - 63'
- 		iface MIXER
- 		name 'Capture Volume'
--		value.0 23
--		value.1 23
-+		value.0 48
-+		value.1 48
- 	}
- 	control.2 {
- 		comment.access 'read write'
-@@ -15,8 +15,8 @@
- 		comment.count 2
- 		iface MIXER
- 		name 'Capture ZC Switch'
--		value.0 false
--		value.1 false
-+		value.0 true
-+		value.1 true
- 	}
- 	control.3 {
- 		comment.access 'read write'
-@@ -24,8 +24,8 @@
- 		comment.count 2
- 		iface MIXER
- 		name 'Capture Switch'
--		value.0 false
--		value.1 false
-+		value.0 true
-+		value.1 true
- 	}
- 	control.4 {
- 		comment.access 'read write'
-@@ -33,8 +33,8 @@
- 		comment.count 2
- 		iface MIXER
- 		name 'Headphone Playback ZC Switch'
--		value.0 false
--		value.1 false
-+		value.0 true
-+		value.1 true
- 	}
- 	control.5 {
- 		comment.access 'read write'
-@@ -42,8 +42,8 @@
- 		comment.count 2
- 		iface MIXER
- 		name 'Speaker Playback ZC Switch'
--		value.0 false
--		value.1 false
-+		value.0 true
-+		value.1 true
- 	}
- 	control.6 {
- 		comment.access 'read write'
-@@ -92,8 +92,8 @@
- 		comment.range '0 - 255'
- 		iface MIXER
- 		name 'PCM Volume'
--		value.0 255
--		value.1 255
-+		value.0 220
-+		value.1 220
- 	}
- 	control.11 {
- 		comment.access 'read write'
-@@ -131,7 +131,7 @@
- 		comment.range '0 - 15'
- 		iface MIXER
- 		name 'Treble Volume'
--		value 15
-+		value 0
- 	}
- 	control.15 {
- 		comment.access 'read write'
-@@ -188,7 +188,7 @@
- 		comment.item.1 Playback
- 		iface MIXER
- 		name '3D Mode'
--		value Capture
-+		value Playback
- 	}
- 	control.21 {
- 		comment.access 'read write'
-@@ -226,7 +226,7 @@
- 		comment.count 1
- 		iface MIXER
- 		name 'ALC Capture ZC Switch'
--		value false
-+		value true
- 	}
- 	control.25 {
- 		comment.access 'read write'
-@@ -235,7 +235,7 @@
- 		comment.range '0 - 15'
- 		iface MIXER
- 		name 'ALC Capture Hold Time'
--		value 0
-+		value 9
- 	}
- 	control.26 {
- 		comment.access 'read write'
-@@ -244,7 +244,7 @@
- 		comment.range '0 - 15'
- 		iface MIXER
- 		name 'ALC Capture Decay Time'
--		value 3
-+		value 9
- 	}
- 	control.27 {
- 		comment.access 'read write'
-@@ -253,7 +253,7 @@
- 		comment.range '0 - 15'
- 		iface MIXER
- 		name 'ALC Capture Attack Time'
--		value 2
-+		value 3
- 	}
- 	control.28 {
- 		comment.access 'read write'
-@@ -306,7 +306,7 @@
- 		comment.count 1
- 		iface MIXER
- 		name 'ZC Timeout Switch'
--		value false
-+		value true
- 	}
- 	control.34 {
- 		comment.access 'read write'
-@@ -331,8 +331,8 @@
- 		comment.range '0 - 3'
- 		iface MIXER
- 		name 'Mic Boost'
--		value.0 2
--		value.1 2
-+		value.0 3
-+		value.1 3
- 	}
- 	control.37 {
- 		comment.access 'read write'
-@@ -341,8 +341,8 @@
- 		comment.range '0 - 7'
- 		iface MIXER
- 		name 'Bypass Left Playback Volume'
--		value.0 2
--		value.1 2
-+		value.0 0
-+		value.1 0
- 	}
- 	control.38 {
- 		comment.access 'read write'
-@@ -361,8 +361,8 @@
- 		comment.range '0 - 7'
- 		iface MIXER
- 		name 'Bypass Mono Playback Volume'
--		value.0 2
--		value.1 2
-+		value.0 0
-+		value.1 0
- 	}
- 	control.40 {
- 		comment.access 'read write'
-@@ -379,8 +379,8 @@
- 		comment.range '0 - 127'
- 		iface MIXER
- 		name 'Headphone Playback Volume'
--		value.0 70
--		value.1 70
-+		value.0 105
-+		value.1 105
- 	}
- 	control.42 {
- 		comment.access 'read write'
-@@ -389,8 +389,8 @@
- 		comment.range '0 - 127'
- 		iface MIXER
- 		name 'Speaker Playback Volume'
--		value.0 70
--		value.1 70
-+		value.0 127
-+		value.1 127
- 	}
- 	control.43 {
- 		comment.access 'read write'
-@@ -399,7 +399,7 @@
- 		comment.range '0 - 127'
- 		iface MIXER
- 		name 'Mono Playback Volume'
--		value 121
-+		value 0
- 	}
- 	control.44 {
- 		comment.access 'read write'
-@@ -411,7 +411,7 @@
- 		comment.item.3 'Digital Mono'
- 		iface MIXER
- 		name 'Right ADC Mux'
--		value 'Mono (Left)'
-+		value 'Digital Mono'
- 	}
- 	control.45 {
- 		comment.access 'read write'
-@@ -423,7 +423,7 @@
- 		comment.item.3 'Digital Mono'
- 		iface MIXER
- 		name 'Left ADC Mux'
--		value 'Mono (Left)'
-+		value 'Digital Mono'
- 	}
- 	control.46 {
- 		comment.access 'read write'
-@@ -471,7 +471,7 @@
- 		comment.item.4 Differential
- 		iface MIXER
- 		name 'Left Line Mux'
--		value PGA
-+		value Differential
- 	}
- 	control.50 {
- 		comment.access 'read write'
diff --git a/recipes-bsp/zaurusd/files/avoid-rotated-server.patch b/recipes-bsp/zaurusd/files/avoid-rotated-server.patch
deleted file mode 100644
index 8d72401..0000000
--- a/recipes-bsp/zaurusd/files/avoid-rotated-server.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-Index: zaurusd/config/mach-config/mach-akita-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-akita-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-akita-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
- TSKEYS_DEVICE=/dev/input/event1
- 
--ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-\ No newline at end of file
-+ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-+
-+export XRANDR_LANDSCAPE=right
-+export XRANDR_PORTRAIT=normal
-Index: zaurusd/config/mach-config/mach-borzoi-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-borzoi-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-borzoi-vars.in	2009-06-22 20:51:00.000000000 +0000
-@@ -7,4 +7,7 @@
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
- TSKEYS_DEVICE=/dev/input/event1
- 
--ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-\ No newline at end of file
-+ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-+
-+export XRANDR_LANDSCAPE=right
-+export XRANDR_PORTRAIT=normal
-Index: zaurusd/config/mach-config/mach-corgi-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-corgi-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-corgi-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
- TSKEYS_DEVICE=/dev/input/event1
- 
--ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-\ No newline at end of file
-+ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-+
-+export XRANDR_LANDSCAPE=normal
-+export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-htcuniversal-vars
-===================================================================
---- zaurusd.orig/config/mach-config/mach-htcuniversal-vars	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-htcuniversal-vars	2009-06-22 20:49:01.000000000 +0000
-@@ -2,3 +2,6 @@
- 
- export SWITCH_EVENT_ZHINGE=1
- SWITCH_EVENT_DEVICE=/dev/input/event3
-+
-+export XRANDR_LANDSCAPE=normal
-+export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-husky-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-husky-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-husky-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
- TSKEYS_DEVICE=/dev/input/event1
- 
--ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-\ No newline at end of file
-+ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-+
-+export XRANDR_LANDSCAPE=normal
-+export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-poodle-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-poodle-vars.in	2009-06-22 20:49:01.000000000 +0000
-+++ zaurusd/config/mach-config/mach-poodle-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -6,4 +6,7 @@
- #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
- #TSKEYS_DEVICE=/dev/input/event1
- 
--ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
-\ No newline at end of file
-+ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
-+
-+export XRANDR_LANDSCAPE=normal
-+export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-shepherd-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-shepherd-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-shepherd-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
- TSKEYS_DEVICE=/dev/input/event1
- 
--ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-\ No newline at end of file
-+ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-+
-+export XRANDR_LANDSCAPE=normal
-+export XRANDR_PORTRAIT=left
-Index: zaurusd/config/mach-config/mach-spitz-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-spitz-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-spitz-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -7,4 +7,7 @@
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
- TSKEYS_DEVICE=/dev/input/event1
- 
--ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-\ No newline at end of file
-+ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-+
-+export XRANDR_LANDSCAPE=right
-+export XRANDR_PORTRAIT=normal
-Index: zaurusd/config/mach-config/mach-tosa-vars.in
-===================================================================
---- zaurusd.orig/config/mach-config/mach-tosa-vars.in	2009-03-07 11:04:43.000000000 +0000
-+++ zaurusd/config/mach-config/mach-tosa-vars.in	2009-06-22 20:51:47.000000000 +0000
-@@ -6,4 +6,7 @@
- #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
- #TSKEYS_DEVICE=/dev/input/event1
- 
--ALSA_MIXER_INIT=@appconfdir@/alsa/6000x-default.state
-\ No newline at end of file
-+ALSA_MIXER_INIT=@appconfdir@/alsa/6000x-default.state
-+
-+export XRANDR_LANDSCAPE=normal
-+export XRANDR_PORTRAIT=left
diff --git a/recipes-bsp/zaurusd/files/disable-alsa-handling.patch b/recipes-bsp/zaurusd/files/disable-alsa-handling.patch
deleted file mode 100644
index 8f1879d..0000000
--- a/recipes-bsp/zaurusd/files/disable-alsa-handling.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- zaurusd/config/config.in.orig	2007-05-21 21:58:14.000000000 +0000
-+++ zaurusd/config/config.in	2007-05-21 22:10:26.000000000 +0000
-@@ -11,11 +11,5 @@
- . @appconfdir@/mach-config-vars
- . @appconfdir@/mach-config-funcs
- 
--if [ "x$HAVE_ALSA_MIXER" != "x" -a "x$ALSA_MIXER_INIT" != "x" ]; then
--  if [ ! -e /etc/asound.state ]; then
--    cp $ALSA_MIXER_INIT /etc/asound.state
--    @sbindir@/alsactl restore
--  fi
--fi
- 
--export SWITCHEVD_EVENT_SCRIPT=@appconfdir@/scripts/switch-event
-\ No newline at end of file
-+export SWITCHEVD_EVENT_SCRIPT=@appconfdir@/scripts/switch-event
diff --git a/recipes-bsp/zaurusd/files/new-make.patch b/recipes-bsp/zaurusd/files/new-make.patch
deleted file mode 100644
index dcc83fe..0000000
--- a/recipes-bsp/zaurusd/files/new-make.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: zaurusd/Makefile.am
-===================================================================
---- zaurusd.orig/Makefile.am
-+++ zaurusd/Makefile.am
-@@ -4,5 +4,4 @@ SUBDIRS = apps config scripts
- MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
--
-+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
diff --git a/recipes-bsp/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff b/recipes-bsp/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff
deleted file mode 100644
index 9c418ec..0000000
--- a/recipes-bsp/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff
+++ /dev/null
@@ -1,88 +0,0 @@
---- /tmp/mach-akita-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-akita-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
- SWITCH_EVENT_DEVICE=/dev/input/event0
- 
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
--TSKEYS_DEVICE=/dev/input/event1
-+TSKEYS_DEVICE=/dev/input/touchscreen0
- 
- ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-\ No newline at end of file
---- /tmp/mach-borzoi-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-borzoi-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
- SWITCH_EVENT_DEVICE=/dev/input/event0
- 
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
--TSKEYS_DEVICE=/dev/input/event1
-+TSKEYS_DEVICE=/dev/input/touchscreen0
- 
- ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-\ No newline at end of file
---- /tmp/mach-corgi-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-corgi-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
- SWITCH_EVENT_DEVICE=/dev/input/event0
- 
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
--TSKEYS_DEVICE=/dev/input/event1
-+TSKEYS_DEVICE=/dev/input/touchscreen0
- 
- ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-\ No newline at end of file
---- /tmp/mach-husky-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-husky-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
- SWITCH_EVENT_DEVICE=/dev/input/event0
- 
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
--TSKEYS_DEVICE=/dev/input/event1
-+TSKEYS_DEVICE=/dev/input/touchscreen0
- 
- ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-\ No newline at end of file
---- /tmp/mach-poodle-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-poodle-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -4,6 +4,6 @@
- SWITCH_EVENT_DEVICE=/dev/input/event0
- 
- #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
--#TSKEYS_DEVICE=/dev/input/event1
-+#TSKEYS_DEVICE=/dev/input/touchscreen0
- 
- ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
-\ No newline at end of file
---- /tmp/mach-shepherd-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-shepherd-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
- SWITCH_EVENT_DEVICE=/dev/input/event0
- 
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
--TSKEYS_DEVICE=/dev/input/event1
-+TSKEYS_DEVICE=/dev/input/touchscreen0
- 
- ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
-\ No newline at end of file
---- /tmp/mach-spitz-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-spitz-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -5,6 +5,6 @@
- SWITCH_EVENT_DEVICE=/dev/input/event0
- 
- TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
--TSKEYS_DEVICE=/dev/input/event1
-+TSKEYS_DEVICE=/dev/input/touchscreen0
- 
- ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
-\ No newline at end of file
---- /tmp/mach-tosa-vars.in	2009-04-28 16:39:58.000000000 +0200
-+++ zaurusd/config/mach-config/mach-tosa-vars.in	2009-04-28 16:40:06.000000000 +0200
-@@ -4,6 +4,6 @@
- SWITCH_EVENT_DEVICE=/dev/input/event0
- 
- #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
--#TSKEYS_DEVICE=/dev/input/event1
-+#TSKEYS_DEVICE=/dev/input/touchscreen0
- 
- ALSA_MIXER_INIT=@appconfdir@/alsa/6000x-default.state
-\ No newline at end of file
diff --git a/recipes-bsp/zaurusd/files/zaurus-hinge.bl-off b/recipes-bsp/zaurusd/files/zaurus-hinge.bl-off
deleted file mode 100644
index ba6746c..0000000
--- a/recipes-bsp/zaurusd/files/zaurus-hinge.bl-off
+++ /dev/null
@@ -1,19 +0,0 @@
-#! /bin/sh
-#
-# Copyright Matthias Hentges <devel@hentges.net> (c) 2006
-# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
-#
-# Filename: zaurus-hinge.bl-off
-# Date: 04-Jun-06
-
-DRIVER="`ls /sys/class/backlight/|head -n 1`"
-BRIGHTNESS_FILE="/sys/class/backlight/$DRIVER/brightness"
-
-if mkdir /var/run/display_brightness.lock
-then
-	cat "$BRIGHTNESS_FILE" > /var/run/display_brightness.tmp
-	echo 0 > "$BRIGHTNESS_FILE"
-	rm -rf /var/run/display_brightness.lock
-else
-	echo "BRIGHTNESS IS LOCKED"
-fi
diff --git a/recipes-bsp/zaurusd/files/zaurus-hinge.bl-on b/recipes-bsp/zaurusd/files/zaurus-hinge.bl-on
deleted file mode 100644
index 58227e8..0000000
--- a/recipes-bsp/zaurusd/files/zaurus-hinge.bl-on
+++ /dev/null
@@ -1,63 +0,0 @@
-#! /bin/sh
-#
-# Copyright Matthias Hentges <devel@hentges.net> (c) 2006
-# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
-#
-# Filename: zaurus-hinge.bl-on
-# Date: 04-Jun-06
-
-test -z "${ZD_BINDIR}" && ZD_BINDIR="/usr/bin"
-test -x ${ZD_BINDIR}/bl && ${ZD_BINDIR}/bl on
-
-
-BL="fakeBl"
-
-fakeBl() {
-
-	
-	case "$1" in
-	on)	test -n "$2" && echo "$2" > "$BL_DRIVER" ;;
-	"")	echo "on `cat "$BL_DRIVER"`";;	
-	*)	echo "$1" > "$BL_DRIVER" ;;
-	esac
-	
-}
-
-for dir in `ls -1 /sys/class/backlight/`
-do
-	if test -e /sys/class/backlight/$dir/brightness
-	then
-		echo "Using [$dir] backlight driver"
-		BL_DRIVER="/sys/class/backlight/$dir/brightness"
-		break
-	fi
-done
-
-
-echo "### `$BL` ###"
-( if test "`$BL | awk '{print $2}'`" = "0"
-then
-
-	$BL 20
-
-	if mkdir /var/run/display_brightness.lock
-	then
-		if test -e /var/run/display_brightness.tmp
-		then
-			OLD_VALUE="`cat /var/run/display_brightness.tmp`"
-			echo "OLD BRIGHTNESS SETTING FOUND: $OLD_VALUE"
-
-			if test "$OLD_VALUE" -gt 1
-			then
-				echo "SETTING $OLD_VALUE!"
-				$BL "$OLD_VALUE"
-				rm /var/run/display_brightness.tmp
-				echo "FINISH!"
-			fi
-		fi
-		rm -rf /var/run/display_brightness.lock
-	else
-		echo "BRIGHTNESS IS LOCKED"
-	fi
-fi ) &
-
diff --git a/recipes-bsp/zaurusd/files/zaurus-hinge.in b/recipes-bsp/zaurusd/files/zaurus-hinge.in
deleted file mode 100644
index 0fcad38..0000000
--- a/recipes-bsp/zaurusd/files/zaurus-hinge.in
+++ /dev/null
@@ -1,66 +0,0 @@
-#!/bin/sh
-#
-# Quick handler for chkhinge26 and X. 
-#
-
-killproc() {            # kill the named process(es)
-        pid=`/bin/ps -e x |
-             /bin/grep $1 |
-             /bin/grep -v grep |
-             /bin/sed -e 's/^  *//' -e 's/ .*//'`
-        [ "$pid" != "" ] && kill $pid
-}
-
-ZD_BINDIR="@bindir@"
-export DISPLAY=:0
-
-if [ -z "$1" ]; then
-   echo "Usage: hinge-handler <state> ( 3 = closed, 0 = landscape, 2 = portrait )"
-   exit 1
-fi
-
-panel_user="`ps aux|grep matchbox-panel|grep -v grep | awk '{print $1}'`"
-
-STATE=$1
-
-# touch ~/.norot can disable rotation.
-if test -f /home/$panel_user/.norot ; then
-  if [ $STATE = "3" ]; then
-	. /etc/zaurusd/hinge-close.d/00-backlight-off
-  else
-	. /etc/zaurusd/hinge-landscape.d/00-backlight-on
-  fi
-  exit
-fi
-
-if [ $STATE = "3" ]; then
-
-  for script in `ls -1 /etc/zaurusd/hinge-close.d`
-  do
-  	. /etc/zaurusd/hinge-close.d/$script
-  done
-
-  exit 0
-fi
-
-if [ $STATE = "0" ]; then
-  #echo "landscape"
-
-  for script in `ls -1 /etc/zaurusd/hinge-landscape.d`
-  do
-  	. /etc/zaurusd/hinge-landscape.d/$script
-  done
-
-  exit 0
-fi
-
-if [ $STATE = "2" ]; then
-  #echo "portrait"
-
-  for script in `ls -1 /etc/zaurusd/hinge-portrait.d`
-  do
-  	. /etc/zaurusd/hinge-portrait.d/$script
-  done
-
-  exit 0
-fi
diff --git a/recipes-bsp/zaurusd/files/zaurus-hinge.matchbox-landscape b/recipes-bsp/zaurusd/files/zaurus-hinge.matchbox-landscape
deleted file mode 100644
index 32710b2..0000000
--- a/recipes-bsp/zaurusd/files/zaurus-hinge.matchbox-landscape
+++ /dev/null
@@ -1,25 +0,0 @@
-  #!/bin/sh
-  
-  # As matchbox-panel updates its written configuration right after an applet dies / is killed, we can not be sure
-  # whether the user had gpe-panel in his preferences after rotating to portrait. And since there is a slim chance
-  # that a user changes his preferences from time to time, we renew that dumped configuration every now and then ;)
-
-  if ! test -e "/tmp/gpe-panel.session-$panel_user"
-  then
-    test -e /home/$panel_user/.matchbox/mbdock.session && cp /home/$panel_user/.matchbox/mbdock.session "/tmp/gpe-panel.session-$panel_user"
-    test -e "/tmp/gpe-panel.session-$panel_user" && cat "/tmp/gpe-panel.session-$panel_user" | grep -q panel || killproc ${ZD_BINDIR}/mbinputmgr
-  else
-    cat "/tmp/gpe-panel.session-$panel_user" | grep -q panel || killproc ${ZD_BINDIR}/mbinputmgr
-    rm "/tmp/gpe-panel.session-$panel_user"
-  fi
-   
-  # urg mbinputmgr should kill below
-  killproc ${ZD_BINDIR}/matchbox-keyboard
-  killproc ${ZD_BINDIR}/matchbox-stroke
-  
-  if [ -x ${ZD_BINDIR}/xrandr ]; then
-  	if ! ( xrandr | awk '{print $4}' | grep -q $XRANDR_LANDSCAPE )
-	then
-		${ZD_BINDIR}/xrandr -o $XRANDR_LANDSCAPE
-	fi
-  fi
diff --git a/recipes-bsp/zaurusd/files/zaurus-hinge.matchbox-portrait b/recipes-bsp/zaurusd/files/zaurus-hinge.matchbox-portrait
deleted file mode 100644
index e540e66..0000000
--- a/recipes-bsp/zaurusd/files/zaurus-hinge.matchbox-portrait
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/sh
-
-  if [ -x ${ZD_BINDIR}/xrandr ]; then
-  	if ! ( xrandr | awk '{print $4}' | grep -q $XRANDR_PORTRAIT )
-	then
-		${ZD_BINDIR}/xrandr -o $XRANDR_PORTRAIT
-	fi
-  fi
-  # just to be extra safe
-  sleep 1
-      
-  echo "panel_user = [$panel_user]"
-
-  if ! test -e "/tmp/gpe-panel.session-$panel_user"
-  then
-    cp /home/$panel_user/.matchbox/mbdock.session "/tmp/gpe-panel.session-$panel_user"
-  else
-    rm "/tmp/gpe-panel.session-$panel_user"
-  fi
-  
-  if test -n "$panel_user"
-  then
-    echo "Running panel as user [$panel_user]"
-    ps aux | grep "$panel_user" | grep -q "mbinputmgr " || su $panel_user -c ${ZD_BINDIR}/mbinputmgr &
-  else
-     # A failsafe can't hurt
-     echo "Warning: Running mbinputmgr as root!"
-     ps aux | grep -q "mbinputmgr " || ${ZD_BINDIR}/mbinputmgr &
-  fi
diff --git a/recipes-bsp/zaurusd/zaurusd/01-check-toggle-landscape b/recipes-bsp/zaurusd/zaurusd/01-check-toggle-landscape
new file mode 100644
index 0000000..13ae9a4
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/01-check-toggle-landscape
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+# Try to determine and ignore false rotation signals caused by
+# headphones removal or remote removal remembering the old state.
+# OE#3390
+if test "`cat /var/run/last-screen-rotation`" = landscape ; then
+    exit
+fi
+echo landscape > /var/run/last-screen-rotation
diff --git a/recipes-bsp/zaurusd/zaurusd/01-check-toggle-portait b/recipes-bsp/zaurusd/zaurusd/01-check-toggle-portait
new file mode 100644
index 0000000..4c3b7f1
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/01-check-toggle-portait
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+# Try to determine and ignore false rotation signals caused by                                                              
+# headphones removal or remote removal remembering the old state.
+# OE#3390
+if test "`cat /var/run/last-screen-rotation`" = portait ; then
+    exit
+fi
+echo portait > /var/run/last-screen-rotation
diff --git a/recipes-bsp/zaurusd/zaurusd/add-poodle.patch b/recipes-bsp/zaurusd/zaurusd/add-poodle.patch
new file mode 100644
index 0000000..3793faf
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/add-poodle.patch
@@ -0,0 +1,15 @@
+--- zaurusd/config/mach-config/mach-poodle-vars.in	(revision 418)
++++ zaurusd/config/mach-config/mach-poodle-vars.in	(working copy)
+@@ -1,3 +1,9 @@
+ MACHINE=poodle
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/5600-default.state
+\ No newline at end of file
++export SWITCH_EVENT_ZMIXER=1
++SWITCH_EVENT_DEVICE=/dev/input/event0
++
++#TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
++#TSKEYS_DEVICE=/dev/input/event1
++
++ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
+\ No newline at end of file
diff --git a/recipes-bsp/zaurusd/zaurusd/alsa-6000x-default.state.patch b/recipes-bsp/zaurusd/zaurusd/alsa-6000x-default.state.patch
new file mode 100644
index 0000000..29c98f7
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/alsa-6000x-default.state.patch
@@ -0,0 +1,769 @@
+--- zaurusd/config/alsa/6000x-default.state	2009-04-25 22:57:30.000000000 +0100
++++ zaurusd/config/alsa/6000x-default.state	2009-05-14 10:41:29.000000000 +0100
+@@ -6,8 +6,8 @@
+ 		comment.range '0 - 31'
+ 		iface MIXER
+ 		name 'Speaker Playback Volume'
+-		value.0 27
+-		value.1 27
++		value.0 25
++		value.1 25
+ 	}
+ 	control.2 {
+ 		comment.access 'read write'
+@@ -24,8 +24,8 @@
+ 		comment.range '0 - 31'
+ 		iface MIXER
+ 		name 'Headphone Playback Volume'
+-		value.0 26
+-		value.1 26
++		value.0 20
++		value.1 20
+ 	}
+ 	control.4 {
+ 		comment.access 'read write'
+@@ -37,13 +37,23 @@
+ 	}
+ 	control.5 {
+ 		comment.access 'read write'
++		comment.type INTEGER
++		comment.count 2
++		comment.range '0 - 31'
++		iface MIXER
++		name 'PCM Playback Volume'
++		value.0 23
++		value.1 23
++	}
++	control.6 {
++		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+ 		iface MIXER
+ 		name 'Speaker Playback ZC Switch'
+ 		value true
+ 	}
+-	control.6 {
++	control.7 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -51,7 +61,7 @@
+ 		name 'Speaker Playback Invert Switch'
+ 		value true
+ 	}
+-	control.7 {
++	control.8 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -59,7 +69,7 @@
+ 		name 'Headphone Playback ZC Switch'
+ 		value true
+ 	}
+-	control.8 {
++	control.9 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -67,7 +77,7 @@
+ 		name 'Mono Playback ZC Switch'
+ 		value false
+ 	}
+-	control.9 {
++	control.10 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -76,7 +86,7 @@
+ 		name 'Mono Playback Volume'
+ 		value 0
+ 	}
+-	control.10 {
++	control.11 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -85,16 +95,16 @@
+ 		name 'ALC Target Volume'
+ 		value 11
+ 	}
+-	control.11 {
++	control.12 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+ 		comment.range '0 - 15'
+ 		iface MIXER
+ 		name 'ALC Hold Time'
+-		value 0
++		value 2
+ 	}
+-	control.12 {
++	control.13 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -103,7 +113,7 @@
+ 		name 'ALC Decay Time'
+ 		value 3
+ 	}
+-	control.13 {
++	control.14 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -112,7 +122,7 @@
+ 		name 'ALC Attack Time'
+ 		value 2
+ 	}
+-	control.14 {
++	control.15 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -124,7 +134,7 @@
+ 		name 'ALC Function'
+ 		value None
+ 	}
+-	control.15 {
++	control.16 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -133,16 +143,16 @@
+ 		name 'ALC Max Volume'
+ 		value 7
+ 	}
+-	control.16 {
++	control.17 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+ 		comment.range '0 - 3'
+ 		iface MIXER
+ 		name 'ALC ZC Timeout'
+-		value 1
++		value 0
+ 	}
+-	control.17 {
++	control.18 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -150,7 +160,7 @@
+ 		name 'ALC ZC Switch'
+ 		value false
+ 	}
+-	control.18 {
++	control.19 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -158,7 +168,7 @@
+ 		name 'ALC NG Switch'
+ 		value false
+ 	}
+-	control.19 {
++	control.20 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -168,7 +178,7 @@
+ 		name 'ALC NG Type'
+ 		value 'Constant Gain'
+ 	}
+-	control.20 {
++	control.21 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -177,16 +187,16 @@
+ 		name 'ALC NG Threshold'
+ 		value 31
+ 	}
+-	control.21 {
++	control.22 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+ 		comment.range '0 - 7'
+ 		iface MIXER
+ 		name 'Mic Headphone  Volume'
+-		value 3
++		value 7
+ 	}
+-	control.22 {
++	control.23 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -195,7 +205,7 @@
+ 		name 'ALC Headphone Volume'
+ 		value 5
+ 	}
+-	control.23 {
++	control.24 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -203,7 +213,7 @@
+ 		name 'Out3 Switch'
+ 		value false
+ 	}
+-	control.24 {
++	control.25 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -211,7 +221,7 @@
+ 		name 'Out3 ZC Switch'
+ 		value true
+ 	}
+-	control.25 {
++	control.26 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -220,7 +230,7 @@
+ 		name 'Out3 Volume'
+ 		value 0
+ 	}
+-	control.26 {
++	control.27 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -229,7 +239,7 @@
+ 		name 'PCBeep Bypass Headphone Volume'
+ 		value 0
+ 	}
+-	control.27 {
++	control.28 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -238,7 +248,7 @@
+ 		name 'PCBeep Bypass Speaker Volume'
+ 		value 0
+ 	}
+-	control.28 {
++	control.29 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -247,16 +257,16 @@
+ 		name 'PCBeep Bypass Phone Volume'
+ 		value 0
+ 	}
+-	control.29 {
++	control.30 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+ 		comment.range '0 - 7'
+ 		iface MIXER
+ 		name 'Aux Playback Headphone Volume'
+-		value 6
++		value 5
+ 	}
+-	control.30 {
++	control.31 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -265,7 +275,7 @@
+ 		name 'Aux Playback Speaker Volume'
+ 		value 0
+ 	}
+-	control.31 {
++	control.32 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -274,7 +284,7 @@
+ 		name 'Aux Playback Phone Volume'
+ 		value 0
+ 	}
+-	control.32 {
++	control.33 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -283,7 +293,7 @@
+ 		name 'Phone Volume'
+ 		value 0
+ 	}
+-	control.33 {
++	control.34 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 2
+@@ -293,7 +303,7 @@
+ 		value.0 23
+ 		value.1 23
+ 	}
+-	control.34 {
++	control.35 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -301,7 +311,7 @@
+ 		name 'Capture 20dB Boost Switch'
+ 		value true
+ 	}
+-	control.35 {
++	control.36 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -309,7 +319,7 @@
+ 		name 'Capture to Phone 20dB Boost Switch'
+ 		value true
+ 	}
+-	control.36 {
++	control.37 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -317,7 +327,7 @@
+ 		name '3D Upper Cut-off Switch'
+ 		value false
+ 	}
+-	control.37 {
++	control.38 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -325,7 +335,7 @@
+ 		name '3D Lower Cut-off Switch'
+ 		value false
+ 	}
+-	control.38 {
++	control.39 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -334,7 +344,7 @@
+ 		name '3D Playback Volume'
+ 		value 0
+ 	}
+-	control.39 {
++	control.40 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -344,7 +354,7 @@
+ 		name 'Bass Control'
+ 		value 'Adaptive Boost'
+ 	}
+-	control.40 {
++	control.41 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -352,7 +362,7 @@
+ 		name 'Bass Cut-off Switch'
+ 		value true
+ 	}
+-	control.41 {
++	control.42 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -360,7 +370,7 @@
+ 		name 'Tone Cut-off Switch'
+ 		value false
+ 	}
+-	control.42 {
++	control.43 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -368,7 +378,7 @@
+ 		name 'Playback Attenuate (-6dB) Switch'
+ 		value false
+ 	}
+-	control.43 {
++	control.44 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -377,7 +387,7 @@
+ 		name 'Bass Volume'
+ 		value 8
+ 	}
+-	control.44 {
++	control.45 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -386,7 +396,7 @@
+ 		name 'Treble Volume'
+ 		value 5
+ 	}
+-	control.45 {
++	control.46 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -394,7 +404,7 @@
+ 		name 'Capture ADC Switch'
+ 		value false
+ 	}
+-	control.46 {
++	control.47 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 2
+@@ -405,17 +415,17 @@
+ 		value.0 '+0.75dB Steps'
+ 		value.1 '+0.75dB Steps'
+ 	}
+-	control.47 {
++	control.48 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 2
+ 		comment.range '0 - 63'
+ 		iface MIXER
+ 		name 'Capture Volume'
+-		value.0 63
+-		value.1 63
++		value.0 0
++		value.1 0
+ 	}
+-	control.48 {
++	control.49 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -423,7 +433,7 @@
+ 		name 'Capture ZC Switch'
+ 		value false
+ 	}
+-	control.49 {
++	control.50 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -432,7 +442,7 @@
+ 		name 'Mic 1 Volume'
+ 		value 23
+ 	}
+-	control.50 {
++	control.51 {
+ 		comment.access 'read write'
+ 		comment.type INTEGER
+ 		comment.count 1
+@@ -441,7 +451,7 @@
+ 		name 'Mic 2 Volume'
+ 		value 23
+ 	}
+-	control.51 {
++	control.52 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -449,7 +459,7 @@
+ 		name 'Mic 20dB Boost Switch'
+ 		value false
+ 	}
+-	control.52 {
++	control.53 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -457,7 +467,7 @@
+ 		name 'Speaker Mixer PCBeep Bypass Swi'
+ 		value false
+ 	}
+-	control.53 {
++	control.54 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -465,7 +475,7 @@
+ 		name 'Speaker Mixer Aux Playback Swit'
+ 		value false
+ 	}
+-	control.54 {
++	control.55 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -473,7 +483,7 @@
+ 		name 'Speaker Mixer Phone Bypass Swit'
+ 		value false
+ 	}
+-	control.55 {
++	control.56 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -481,7 +491,7 @@
+ 		name 'Speaker Mixer Line Bypass Switc'
+ 		value false
+ 	}
+-	control.56 {
++	control.57 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -489,7 +499,7 @@
+ 		name 'Speaker Mixer PCM Playback Swit'
+ 		value true
+ 	}
+-	control.57 {
++	control.58 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -497,7 +507,7 @@
+ 		name 'Phone Mixer PCBeep Bypass Switc'
+ 		value false
+ 	}
+-	control.58 {
++	control.59 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -505,7 +515,7 @@
+ 		name 'Phone Mixer Aux Playback Switch'
+ 		value false
+ 	}
+-	control.59 {
++	control.60 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -513,7 +523,7 @@
+ 		name 'Phone Mixer Line Bypass Switch'
+ 		value false
+ 	}
+-	control.60 {
++	control.61 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -521,7 +531,7 @@
+ 		name 'Phone Mixer PCM Playback Switch'
+ 		value false
+ 	}
+-	control.61 {
++	control.62 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -529,7 +539,7 @@
+ 		name 'Phone Mixer Mic 1 Sidetone Swit'
+ 		value false
+ 	}
+-	control.62 {
++	control.63 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -537,7 +547,7 @@
+ 		name 'Phone Mixer Mic 2 Sidetone Swit'
+ 		value false
+ 	}
+-	control.63 {
++	control.64 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -545,7 +555,7 @@
+ 		name 'Right HP Mixer PCBeep Bypass Sw'
+ 		value false
+ 	}
+-	control.64 {
++	control.65 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -553,7 +563,7 @@
+ 		name 'Right HP Mixer Aux Playback Swi'
+ 		value false
+ 	}
+-	control.65 {
++	control.66 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -561,7 +571,7 @@
+ 		name 'Right HP Mixer Phone Bypass Swi'
+ 		value false
+ 	}
+-	control.66 {
++	control.67 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -569,7 +579,7 @@
+ 		name 'Right HP Mixer Line Bypass Swit'
+ 		value false
+ 	}
+-	control.67 {
++	control.68 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -577,7 +587,7 @@
+ 		name 'Right HP Mixer PCM Playback Swi'
+ 		value true
+ 	}
+-	control.68 {
++	control.69 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -585,7 +595,7 @@
+ 		name 'Right HP Mixer Mic Sidetone Swi'
+ 		value false
+ 	}
+-	control.69 {
++	control.70 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -593,7 +603,7 @@
+ 		name 'Left HP Mixer PCBeep Bypass Swi'
+ 		value false
+ 	}
+-	control.70 {
++	control.71 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -601,7 +611,7 @@
+ 		name 'Left HP Mixer Aux Playback Swit'
+ 		value false
+ 	}
+-	control.71 {
++	control.72 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -609,7 +619,7 @@
+ 		name 'Left HP Mixer Phone Bypass Swit'
+ 		value false
+ 	}
+-	control.72 {
++	control.73 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -617,7 +627,7 @@
+ 		name 'Left HP Mixer Line Bypass Switc'
+ 		value false
+ 	}
+-	control.73 {
++	control.74 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -625,7 +635,7 @@
+ 		name 'Left HP Mixer PCM Playback Swit'
+ 		value true
+ 	}
+-	control.74 {
++	control.75 {
+ 		comment.access 'read write'
+ 		comment.type BOOLEAN
+ 		comment.count 1
+@@ -633,7 +643,7 @@
+ 		name 'Left HP Mixer Mic Sidetone Swit'
+ 		value false
+ 	}
+-	control.75 {
++	control.76 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -641,9 +651,9 @@
+ 		comment.item.1 Line
+ 		iface MIXER
+ 		name 'Differential Source'
+-		value Line
++		value Mic
+ 	}
+-	control.76 {
++	control.77 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -653,9 +663,9 @@
+ 		comment.item.3 Stereo
+ 		iface MIXER
+ 		name 'Mic Select Source'
+-		value 'Mic 1'
++		value Differential
+ 	}
+-	control.77 {
++	control.78 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -671,7 +681,7 @@
+ 		name 'Right Capture Select'
+ 		value Mic
+ 	}
+-	control.78 {
++	control.79 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -687,7 +697,7 @@
+ 		name 'Left Capture Select'
+ 		value Mic
+ 	}
+-	control.79 {
++	control.80 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -699,7 +709,7 @@
+ 		name 'Capture Phone Mux'
+ 		value Mute
+ 	}
+-	control.80 {
++	control.81 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -709,7 +719,7 @@
+ 		name 'Speaker Mux'
+ 		value 'Speaker Mix'
+ 	}
+-	control.81 {
++	control.82 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -721,7 +731,7 @@
+ 		name 'Out3 Mux'
+ 		value Left
+ 	}
+-	control.82 {
++	control.83 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -733,7 +743,7 @@
+ 		name 'ALC Sidetone Mux'
+ 		value Stereo
+ 	}
+-	control.83 {
++	control.84 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
+@@ -746,7 +756,7 @@
+ 		name 'Jack Function'
+ 		value Off
+ 	}
+-	control.84 {
++	control.85 {
+ 		comment.access 'read write'
+ 		comment.type ENUMERATED
+ 		comment.count 1
diff --git a/recipes-bsp/zaurusd/zaurusd/alsa-cxx00-default.state.patch b/recipes-bsp/zaurusd/zaurusd/alsa-cxx00-default.state.patch
new file mode 100644
index 0000000..d65ed4a
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/alsa-cxx00-default.state.patch
@@ -0,0 +1,240 @@
+NOTE: Patch slightly modified from original; unmodified comments from 
+original patch copied below.
+=============================================================================
+http://bugs.openembedded.net/show_bug.cgi?id=2617
+- Fixes default ALSA state for SL-Cxx00.
+  * Treble level reflects kernel fix alsa-wm8750-treble.patch (>2.6.24).
+  * Increased Mic Levels and Boost.
+  * Enabled Capture Switch.
+  * Improved Headphones / Speaker volume balance.
+  * 3D Mode changed to "Playback" (still Off by default).
+  * Disabled all bypasses.
+  * All Mono signals decreased to 0 (not connected).
+  * Line Mux changed to differential, keeping PGA unused.
+  * Using Digital mono for recording (jack supports ony mono).
+  * Enabled Automatic Level Control, optimized for voice recording.
+  * Enabled Zero Cross volume changes.
+- Do not alter incorrect mixer levels by zaurus-mixer-callback.
+
+--- zaurusd/config/alsa/cxx00-default.state	2009-04-25 22:57:30.000000000 +0100
++++ zaurusd/config/alsa/cxx00-default.state	2009-05-14 10:41:29.000000000 +0100
+@@ -6,8 +6,8 @@
+ 		comment.range '0 - 63'
+ 		iface MIXER
+ 		name 'Capture Volume'
+-		value.0 23
+-		value.1 23
++		value.0 48
++		value.1 48
+ 	}
+ 	control.2 {
+ 		comment.access 'read write'
+@@ -15,8 +15,8 @@
+ 		comment.count 2
+ 		iface MIXER
+ 		name 'Capture ZC Switch'
+-		value.0 false
+-		value.1 false
++		value.0 true
++		value.1 true
+ 	}
+ 	control.3 {
+ 		comment.access 'read write'
+@@ -24,8 +24,8 @@
+ 		comment.count 2
+ 		iface MIXER
+ 		name 'Capture Switch'
+-		value.0 false
+-		value.1 false
++		value.0 true
++		value.1 true
+ 	}
+ 	control.4 {
+ 		comment.access 'read write'
+@@ -33,8 +33,8 @@
+ 		comment.count 2
+ 		iface MIXER
+ 		name 'Headphone Playback ZC Switch'
+-		value.0 false
+-		value.1 false
++		value.0 true
++		value.1 true
+ 	}
+ 	control.5 {
+ 		comment.access 'read write'
+@@ -42,8 +42,8 @@
+ 		comment.count 2
+ 		iface MIXER
+ 		name 'Speaker Playback ZC Switch'
+-		value.0 false
+-		value.1 false
++		value.0 true
++		value.1 true
+ 	}
+ 	control.6 {
+ 		comment.access 'read write'
+@@ -92,8 +92,8 @@
+ 		comment.range '0 - 255'
+ 		iface MIXER
+ 		name 'PCM Volume'
+-		value.0 255
+-		value.1 255
++		value.0 220
++		value.1 220
+ 	}
+ 	control.11 {
+ 		comment.access 'read write'
+@@ -131,7 +131,7 @@
+ 		comment.range '0 - 15'
+ 		iface MIXER
+ 		name 'Treble Volume'
+-		value 15
++		value 0
+ 	}
+ 	control.15 {
+ 		comment.access 'read write'
+@@ -188,7 +188,7 @@
+ 		comment.item.1 Playback
+ 		iface MIXER
+ 		name '3D Mode'
+-		value Capture
++		value Playback
+ 	}
+ 	control.21 {
+ 		comment.access 'read write'
+@@ -226,7 +226,7 @@
+ 		comment.count 1
+ 		iface MIXER
+ 		name 'ALC Capture ZC Switch'
+-		value false
++		value true
+ 	}
+ 	control.25 {
+ 		comment.access 'read write'
+@@ -235,7 +235,7 @@
+ 		comment.range '0 - 15'
+ 		iface MIXER
+ 		name 'ALC Capture Hold Time'
+-		value 0
++		value 9
+ 	}
+ 	control.26 {
+ 		comment.access 'read write'
+@@ -244,7 +244,7 @@
+ 		comment.range '0 - 15'
+ 		iface MIXER
+ 		name 'ALC Capture Decay Time'
+-		value 3
++		value 9
+ 	}
+ 	control.27 {
+ 		comment.access 'read write'
+@@ -253,7 +253,7 @@
+ 		comment.range '0 - 15'
+ 		iface MIXER
+ 		name 'ALC Capture Attack Time'
+-		value 2
++		value 3
+ 	}
+ 	control.28 {
+ 		comment.access 'read write'
+@@ -306,7 +306,7 @@
+ 		comment.count 1
+ 		iface MIXER
+ 		name 'ZC Timeout Switch'
+-		value false
++		value true
+ 	}
+ 	control.34 {
+ 		comment.access 'read write'
+@@ -331,8 +331,8 @@
+ 		comment.range '0 - 3'
+ 		iface MIXER
+ 		name 'Mic Boost'
+-		value.0 2
+-		value.1 2
++		value.0 3
++		value.1 3
+ 	}
+ 	control.37 {
+ 		comment.access 'read write'
+@@ -341,8 +341,8 @@
+ 		comment.range '0 - 7'
+ 		iface MIXER
+ 		name 'Bypass Left Playback Volume'
+-		value.0 2
+-		value.1 2
++		value.0 0
++		value.1 0
+ 	}
+ 	control.38 {
+ 		comment.access 'read write'
+@@ -361,8 +361,8 @@
+ 		comment.range '0 - 7'
+ 		iface MIXER
+ 		name 'Bypass Mono Playback Volume'
+-		value.0 2
+-		value.1 2
++		value.0 0
++		value.1 0
+ 	}
+ 	control.40 {
+ 		comment.access 'read write'
+@@ -379,8 +379,8 @@
+ 		comment.range '0 - 127'
+ 		iface MIXER
+ 		name 'Headphone Playback Volume'
+-		value.0 70
+-		value.1 70
++		value.0 105
++		value.1 105
+ 	}
+ 	control.42 {
+ 		comment.access 'read write'
+@@ -389,8 +389,8 @@
+ 		comment.range '0 - 127'
+ 		iface MIXER
+ 		name 'Speaker Playback Volume'
+-		value.0 70
+-		value.1 70
++		value.0 127
++		value.1 127
+ 	}
+ 	control.43 {
+ 		comment.access 'read write'
+@@ -399,7 +399,7 @@
+ 		comment.range '0 - 127'
+ 		iface MIXER
+ 		name 'Mono Playback Volume'
+-		value 121
++		value 0
+ 	}
+ 	control.44 {
+ 		comment.access 'read write'
+@@ -411,7 +411,7 @@
+ 		comment.item.3 'Digital Mono'
+ 		iface MIXER
+ 		name 'Right ADC Mux'
+-		value 'Mono (Left)'
++		value 'Digital Mono'
+ 	}
+ 	control.45 {
+ 		comment.access 'read write'
+@@ -423,7 +423,7 @@
+ 		comment.item.3 'Digital Mono'
+ 		iface MIXER
+ 		name 'Left ADC Mux'
+-		value 'Mono (Left)'
++		value 'Digital Mono'
+ 	}
+ 	control.46 {
+ 		comment.access 'read write'
+@@ -471,7 +471,7 @@
+ 		comment.item.4 Differential
+ 		iface MIXER
+ 		name 'Left Line Mux'
+-		value PGA
++		value Differential
+ 	}
+ 	control.50 {
+ 		comment.access 'read write'
diff --git a/recipes-bsp/zaurusd/zaurusd/avoid-rotated-server.patch b/recipes-bsp/zaurusd/zaurusd/avoid-rotated-server.patch
new file mode 100644
index 0000000..8d72401
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/avoid-rotated-server.patch
@@ -0,0 +1,123 @@
+Index: zaurusd/config/mach-config/mach-akita-vars.in
+===================================================================
+--- zaurusd.orig/config/mach-config/mach-akita-vars.in	2009-03-07 11:04:43.000000000 +0000
++++ zaurusd/config/mach-config/mach-akita-vars.in	2009-06-22 20:51:47.000000000 +0000
+@@ -7,4 +7,7 @@
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
+ TSKEYS_DEVICE=/dev/input/event1
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
+\ No newline at end of file
++ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
++
++export XRANDR_LANDSCAPE=right
++export XRANDR_PORTRAIT=normal
+Index: zaurusd/config/mach-config/mach-borzoi-vars.in
+===================================================================
+--- zaurusd.orig/config/mach-config/mach-borzoi-vars.in	2009-03-07 11:04:43.000000000 +0000
++++ zaurusd/config/mach-config/mach-borzoi-vars.in	2009-06-22 20:51:00.000000000 +0000
+@@ -7,4 +7,7 @@
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
+ TSKEYS_DEVICE=/dev/input/event1
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
+\ No newline at end of file
++ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
++
++export XRANDR_LANDSCAPE=right
++export XRANDR_PORTRAIT=normal
+Index: zaurusd/config/mach-config/mach-corgi-vars.in
+===================================================================
+--- zaurusd.orig/config/mach-config/mach-corgi-vars.in	2009-03-07 11:04:43.000000000 +0000
++++ zaurusd/config/mach-config/mach-corgi-vars.in	2009-06-22 20:51:47.000000000 +0000
+@@ -7,4 +7,7 @@
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
+ TSKEYS_DEVICE=/dev/input/event1
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
+\ No newline at end of file
++ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
++
++export XRANDR_LANDSCAPE=normal
++export XRANDR_PORTRAIT=left
+Index: zaurusd/config/mach-config/mach-htcuniversal-vars
+===================================================================
+--- zaurusd.orig/config/mach-config/mach-htcuniversal-vars	2009-03-07 11:04:43.000000000 +0000
++++ zaurusd/config/mach-config/mach-htcuniversal-vars	2009-06-22 20:49:01.000000000 +0000
+@@ -2,3 +2,6 @@
+ 
+ export SWITCH_EVENT_ZHINGE=1
+ SWITCH_EVENT_DEVICE=/dev/input/event3
++
++export XRANDR_LANDSCAPE=normal
++export XRANDR_PORTRAIT=left
+Index: zaurusd/config/mach-config/mach-husky-vars.in
+===================================================================
+--- zaurusd.orig/config/mach-config/mach-husky-vars.in	2009-03-07 11:04:43.000000000 +0000
++++ zaurusd/config/mach-config/mach-husky-vars.in	2009-06-22 20:51:47.000000000 +0000
+@@ -7,4 +7,7 @@
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
+ TSKEYS_DEVICE=/dev/input/event1
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
+\ No newline at end of file
++ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
++
++export XRANDR_LANDSCAPE=normal
++export XRANDR_PORTRAIT=left
+Index: zaurusd/config/mach-config/mach-poodle-vars.in
+===================================================================
+--- zaurusd.orig/config/mach-config/mach-poodle-vars.in	2009-06-22 20:49:01.000000000 +0000
++++ zaurusd/config/mach-config/mach-poodle-vars.in	2009-06-22 20:51:47.000000000 +0000
+@@ -6,4 +6,7 @@
+ #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
+ #TSKEYS_DEVICE=/dev/input/event1
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
+\ No newline at end of file
++ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
++
++export XRANDR_LANDSCAPE=normal
++export XRANDR_PORTRAIT=left
+Index: zaurusd/config/mach-config/mach-shepherd-vars.in
+===================================================================
+--- zaurusd.orig/config/mach-config/mach-shepherd-vars.in	2009-03-07 11:04:43.000000000 +0000
++++ zaurusd/config/mach-config/mach-shepherd-vars.in	2009-06-22 20:51:47.000000000 +0000
+@@ -7,4 +7,7 @@
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
+ TSKEYS_DEVICE=/dev/input/event1
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
+\ No newline at end of file
++ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
++
++export XRANDR_LANDSCAPE=normal
++export XRANDR_PORTRAIT=left
+Index: zaurusd/config/mach-config/mach-spitz-vars.in
+===================================================================
+--- zaurusd.orig/config/mach-config/mach-spitz-vars.in	2009-03-07 11:04:43.000000000 +0000
++++ zaurusd/config/mach-config/mach-spitz-vars.in	2009-06-22 20:51:47.000000000 +0000
+@@ -7,4 +7,7 @@
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
+ TSKEYS_DEVICE=/dev/input/event1
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
+\ No newline at end of file
++ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
++
++export XRANDR_LANDSCAPE=right
++export XRANDR_PORTRAIT=normal
+Index: zaurusd/config/mach-config/mach-tosa-vars.in
+===================================================================
+--- zaurusd.orig/config/mach-config/mach-tosa-vars.in	2009-03-07 11:04:43.000000000 +0000
++++ zaurusd/config/mach-config/mach-tosa-vars.in	2009-06-22 20:51:47.000000000 +0000
+@@ -6,4 +6,7 @@
+ #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
+ #TSKEYS_DEVICE=/dev/input/event1
+ 
+-ALSA_MIXER_INIT=@appconfdir@/alsa/6000x-default.state
+\ No newline at end of file
++ALSA_MIXER_INIT=@appconfdir@/alsa/6000x-default.state
++
++export XRANDR_LANDSCAPE=normal
++export XRANDR_PORTRAIT=left
diff --git a/recipes-bsp/zaurusd/zaurusd/disable-alsa-handling.patch b/recipes-bsp/zaurusd/zaurusd/disable-alsa-handling.patch
new file mode 100644
index 0000000..8f1879d
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/disable-alsa-handling.patch
@@ -0,0 +1,16 @@
+--- zaurusd/config/config.in.orig	2007-05-21 21:58:14.000000000 +0000
++++ zaurusd/config/config.in	2007-05-21 22:10:26.000000000 +0000
+@@ -11,11 +11,5 @@
+ . @appconfdir@/mach-config-vars
+ . @appconfdir@/mach-config-funcs
+ 
+-if [ "x$HAVE_ALSA_MIXER" != "x" -a "x$ALSA_MIXER_INIT" != "x" ]; then
+-  if [ ! -e /etc/asound.state ]; then
+-    cp $ALSA_MIXER_INIT /etc/asound.state
+-    @sbindir@/alsactl restore
+-  fi
+-fi
+ 
+-export SWITCHEVD_EVENT_SCRIPT=@appconfdir@/scripts/switch-event
+\ No newline at end of file
++export SWITCHEVD_EVENT_SCRIPT=@appconfdir@/scripts/switch-event
diff --git a/recipes-bsp/zaurusd/zaurusd/new-make.patch b/recipes-bsp/zaurusd/zaurusd/new-make.patch
new file mode 100644
index 0000000..dcc83fe
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/new-make.patch
@@ -0,0 +1,11 @@
+Index: zaurusd/Makefile.am
+===================================================================
+--- zaurusd.orig/Makefile.am
++++ zaurusd/Makefile.am
+@@ -4,5 +4,4 @@ SUBDIRS = apps config scripts
+ MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
+ 
+ snapshot:
+-        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
+-
++	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
diff --git a/recipes-bsp/zaurusd/zaurusd/use-ts-symlink-instead-of-hardcoding.diff b/recipes-bsp/zaurusd/zaurusd/use-ts-symlink-instead-of-hardcoding.diff
new file mode 100644
index 0000000..9c418ec
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/use-ts-symlink-instead-of-hardcoding.diff
@@ -0,0 +1,88 @@
+--- /tmp/mach-akita-vars.in	2009-04-28 16:39:58.000000000 +0200
++++ zaurusd/config/mach-config/mach-akita-vars.in	2009-04-28 16:40:06.000000000 +0200
+@@ -5,6 +5,6 @@
+ SWITCH_EVENT_DEVICE=/dev/input/event0
+ 
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
+-TSKEYS_DEVICE=/dev/input/event1
++TSKEYS_DEVICE=/dev/input/touchscreen0
+ 
+ ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
+\ No newline at end of file
+--- /tmp/mach-borzoi-vars.in	2009-04-28 16:39:58.000000000 +0200
++++ zaurusd/config/mach-config/mach-borzoi-vars.in	2009-04-28 16:40:06.000000000 +0200
+@@ -5,6 +5,6 @@
+ SWITCH_EVENT_DEVICE=/dev/input/event0
+ 
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
+-TSKEYS_DEVICE=/dev/input/event1
++TSKEYS_DEVICE=/dev/input/touchscreen0
+ 
+ ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
+\ No newline at end of file
+--- /tmp/mach-corgi-vars.in	2009-04-28 16:39:58.000000000 +0200
++++ zaurusd/config/mach-config/mach-corgi-vars.in	2009-04-28 16:40:06.000000000 +0200
+@@ -5,6 +5,6 @@
+ SWITCH_EVENT_DEVICE=/dev/input/event0
+ 
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
+-TSKEYS_DEVICE=/dev/input/event1
++TSKEYS_DEVICE=/dev/input/touchscreen0
+ 
+ ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
+\ No newline at end of file
+--- /tmp/mach-husky-vars.in	2009-04-28 16:39:58.000000000 +0200
++++ zaurusd/config/mach-config/mach-husky-vars.in	2009-04-28 16:40:06.000000000 +0200
+@@ -5,6 +5,6 @@
+ SWITCH_EVENT_DEVICE=/dev/input/event0
+ 
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
+-TSKEYS_DEVICE=/dev/input/event1
++TSKEYS_DEVICE=/dev/input/touchscreen0
+ 
+ ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
+\ No newline at end of file
+--- /tmp/mach-poodle-vars.in	2009-04-28 16:39:58.000000000 +0200
++++ zaurusd/config/mach-config/mach-poodle-vars.in	2009-04-28 16:40:06.000000000 +0200
+@@ -4,6 +4,6 @@
+ SWITCH_EVENT_DEVICE=/dev/input/event0
+ 
+ #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
+-#TSKEYS_DEVICE=/dev/input/event1
++#TSKEYS_DEVICE=/dev/input/touchscreen0
+ 
+ ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
+\ No newline at end of file
+--- /tmp/mach-shepherd-vars.in	2009-04-28 16:39:58.000000000 +0200
++++ zaurusd/config/mach-config/mach-shepherd-vars.in	2009-04-28 16:40:06.000000000 +0200
+@@ -5,6 +5,6 @@
+ SWITCH_EVENT_DEVICE=/dev/input/event0
+ 
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
+-TSKEYS_DEVICE=/dev/input/event1
++TSKEYS_DEVICE=/dev/input/touchscreen0
+ 
+ ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
+\ No newline at end of file
+--- /tmp/mach-spitz-vars.in	2009-04-28 16:39:58.000000000 +0200
++++ zaurusd/config/mach-config/mach-spitz-vars.in	2009-04-28 16:40:06.000000000 +0200
+@@ -5,6 +5,6 @@
+ SWITCH_EVENT_DEVICE=/dev/input/event0
+ 
+ TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
+-TSKEYS_DEVICE=/dev/input/event1
++TSKEYS_DEVICE=/dev/input/touchscreen0
+ 
+ ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
+\ No newline at end of file
+--- /tmp/mach-tosa-vars.in	2009-04-28 16:39:58.000000000 +0200
++++ zaurusd/config/mach-config/mach-tosa-vars.in	2009-04-28 16:40:06.000000000 +0200
+@@ -4,6 +4,6 @@
+ SWITCH_EVENT_DEVICE=/dev/input/event0
+ 
+ #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
+-#TSKEYS_DEVICE=/dev/input/event1
++#TSKEYS_DEVICE=/dev/input/touchscreen0
+ 
+ ALSA_MIXER_INIT=@appconfdir@/alsa/6000x-default.state
+\ No newline at end of file
diff --git a/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-off b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-off
new file mode 100644
index 0000000..ba6746c
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-off
@@ -0,0 +1,19 @@
+#! /bin/sh
+#
+# Copyright Matthias Hentges <devel@hentges.net> (c) 2006
+# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
+#
+# Filename: zaurus-hinge.bl-off
+# Date: 04-Jun-06
+
+DRIVER="`ls /sys/class/backlight/|head -n 1`"
+BRIGHTNESS_FILE="/sys/class/backlight/$DRIVER/brightness"
+
+if mkdir /var/run/display_brightness.lock
+then
+	cat "$BRIGHTNESS_FILE" > /var/run/display_brightness.tmp
+	echo 0 > "$BRIGHTNESS_FILE"
+	rm -rf /var/run/display_brightness.lock
+else
+	echo "BRIGHTNESS IS LOCKED"
+fi
diff --git a/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-on b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-on
new file mode 100644
index 0000000..58227e8
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.bl-on
@@ -0,0 +1,63 @@
+#! /bin/sh
+#
+# Copyright Matthias Hentges <devel@hentges.net> (c) 2006
+# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
+#
+# Filename: zaurus-hinge.bl-on
+# Date: 04-Jun-06
+
+test -z "${ZD_BINDIR}" && ZD_BINDIR="/usr/bin"
+test -x ${ZD_BINDIR}/bl && ${ZD_BINDIR}/bl on
+
+
+BL="fakeBl"
+
+fakeBl() {
+
+	
+	case "$1" in
+	on)	test -n "$2" && echo "$2" > "$BL_DRIVER" ;;
+	"")	echo "on `cat "$BL_DRIVER"`";;	
+	*)	echo "$1" > "$BL_DRIVER" ;;
+	esac
+	
+}
+
+for dir in `ls -1 /sys/class/backlight/`
+do
+	if test -e /sys/class/backlight/$dir/brightness
+	then
+		echo "Using [$dir] backlight driver"
+		BL_DRIVER="/sys/class/backlight/$dir/brightness"
+		break
+	fi
+done
+
+
+echo "### `$BL` ###"
+( if test "`$BL | awk '{print $2}'`" = "0"
+then
+
+	$BL 20
+
+	if mkdir /var/run/display_brightness.lock
+	then
+		if test -e /var/run/display_brightness.tmp
+		then
+			OLD_VALUE="`cat /var/run/display_brightness.tmp`"
+			echo "OLD BRIGHTNESS SETTING FOUND: $OLD_VALUE"
+
+			if test "$OLD_VALUE" -gt 1
+			then
+				echo "SETTING $OLD_VALUE!"
+				$BL "$OLD_VALUE"
+				rm /var/run/display_brightness.tmp
+				echo "FINISH!"
+			fi
+		fi
+		rm -rf /var/run/display_brightness.lock
+	else
+		echo "BRIGHTNESS IS LOCKED"
+	fi
+fi ) &
+
diff --git a/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in
new file mode 100644
index 0000000..0fcad38
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in
@@ -0,0 +1,66 @@
+#!/bin/sh
+#
+# Quick handler for chkhinge26 and X. 
+#
+
+killproc() {            # kill the named process(es)
+        pid=`/bin/ps -e x |
+             /bin/grep $1 |
+             /bin/grep -v grep |
+             /bin/sed -e 's/^  *//' -e 's/ .*//'`
+        [ "$pid" != "" ] && kill $pid
+}
+
+ZD_BINDIR="@bindir@"
+export DISPLAY=:0
+
+if [ -z "$1" ]; then
+   echo "Usage: hinge-handler <state> ( 3 = closed, 0 = landscape, 2 = portrait )"
+   exit 1
+fi
+
+panel_user="`ps aux|grep matchbox-panel|grep -v grep | awk '{print $1}'`"
+
+STATE=$1
+
+# touch ~/.norot can disable rotation.
+if test -f /home/$panel_user/.norot ; then
+  if [ $STATE = "3" ]; then
+	. /etc/zaurusd/hinge-close.d/00-backlight-off
+  else
+	. /etc/zaurusd/hinge-landscape.d/00-backlight-on
+  fi
+  exit
+fi
+
+if [ $STATE = "3" ]; then
+
+  for script in `ls -1 /etc/zaurusd/hinge-close.d`
+  do
+  	. /etc/zaurusd/hinge-close.d/$script
+  done
+
+  exit 0
+fi
+
+if [ $STATE = "0" ]; then
+  #echo "landscape"
+
+  for script in `ls -1 /etc/zaurusd/hinge-landscape.d`
+  do
+  	. /etc/zaurusd/hinge-landscape.d/$script
+  done
+
+  exit 0
+fi
+
+if [ $STATE = "2" ]; then
+  #echo "portrait"
+
+  for script in `ls -1 /etc/zaurusd/hinge-portrait.d`
+  do
+  	. /etc/zaurusd/hinge-portrait.d/$script
+  done
+
+  exit 0
+fi
diff --git a/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-landscape b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-landscape
new file mode 100644
index 0000000..32710b2
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-landscape
@@ -0,0 +1,25 @@
+  #!/bin/sh
+  
+  # As matchbox-panel updates its written configuration right after an applet dies / is killed, we can not be sure
+  # whether the user had gpe-panel in his preferences after rotating to portrait. And since there is a slim chance
+  # that a user changes his preferences from time to time, we renew that dumped configuration every now and then ;)
+
+  if ! test -e "/tmp/gpe-panel.session-$panel_user"
+  then
+    test -e /home/$panel_user/.matchbox/mbdock.session && cp /home/$panel_user/.matchbox/mbdock.session "/tmp/gpe-panel.session-$panel_user"
+    test -e "/tmp/gpe-panel.session-$panel_user" && cat "/tmp/gpe-panel.session-$panel_user" | grep -q panel || killproc ${ZD_BINDIR}/mbinputmgr
+  else
+    cat "/tmp/gpe-panel.session-$panel_user" | grep -q panel || killproc ${ZD_BINDIR}/mbinputmgr
+    rm "/tmp/gpe-panel.session-$panel_user"
+  fi
+   
+  # urg mbinputmgr should kill below
+  killproc ${ZD_BINDIR}/matchbox-keyboard
+  killproc ${ZD_BINDIR}/matchbox-stroke
+  
+  if [ -x ${ZD_BINDIR}/xrandr ]; then
+  	if ! ( xrandr | awk '{print $4}' | grep -q $XRANDR_LANDSCAPE )
+	then
+		${ZD_BINDIR}/xrandr -o $XRANDR_LANDSCAPE
+	fi
+  fi
diff --git a/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-portrait b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-portrait
new file mode 100644
index 0000000..e540e66
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-portrait
@@ -0,0 +1,29 @@
+#!/bin/sh
+
+  if [ -x ${ZD_BINDIR}/xrandr ]; then
+  	if ! ( xrandr | awk '{print $4}' | grep -q $XRANDR_PORTRAIT )
+	then
+		${ZD_BINDIR}/xrandr -o $XRANDR_PORTRAIT
+	fi
+  fi
+  # just to be extra safe
+  sleep 1
+      
+  echo "panel_user = [$panel_user]"
+
+  if ! test -e "/tmp/gpe-panel.session-$panel_user"
+  then
+    cp /home/$panel_user/.matchbox/mbdock.session "/tmp/gpe-panel.session-$panel_user"
+  else
+    rm "/tmp/gpe-panel.session-$panel_user"
+  fi
+  
+  if test -n "$panel_user"
+  then
+    echo "Running panel as user [$panel_user]"
+    ps aux | grep "$panel_user" | grep -q "mbinputmgr " || su $panel_user -c ${ZD_BINDIR}/mbinputmgr &
+  else
+     # A failsafe can't hurt
+     echo "Warning: Running mbinputmgr as root!"
+     ps aux | grep -q "mbinputmgr " || ${ZD_BINDIR}/mbinputmgr &
+  fi
diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/zaurusd_git.bb
new file mode 100644
index 0000000..9bae6f7
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -0,0 +1,58 @@
+DESCRIPTION = "Daemon to handle device specific features."
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "tslib"
+RDEPENDS_${PN} = "procps"
+PE = "1"
+PV = "0.0+gitr${SRCPV}"
+PR = "r24"
+
+SRCREV = "82b30c7865f007fff81372c3cdc71b2ff6843ccc"
+SRC_URI = "git://git.yoctoproject.org/zaurusd;protocol=git \
+           file://zaurus-hinge.in \
+	   file://add-poodle.patch \
+	   file://alsa-cxx00-default.state.patch \
+	   file://alsa-6000x-default.state.patch \
+	   file://disable-alsa-handling.patch \
+	   file://avoid-rotated-server.patch \
+	   file://new-make.patch \
+	   file://zaurus-hinge.matchbox-portrait \
+	   file://zaurus-hinge.matchbox-landscape \
+	   file://zaurus-hinge.bl-on \
+	   file://zaurus-hinge.bl-off \
+	   file://01-check-toggle-landscape \
+	   file://01-check-toggle-portait \
+       file://use-ts-symlink-instead-of-hardcoding.diff "
+
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_configure_prepend () {
+	cp ${WORKDIR}/zaurus-hinge.in ${S}/scripts
+}
+
+do_install_append() {
+	install -d "${D}/etc/zaurusd/hinge-landscape.d"
+	install -d "${D}/etc/zaurusd/hinge-portrait.d"
+	install -d "${D}/etc/zaurusd/hinge-close.d"
+	install -d ${D}/etc/apm/resume.d
+
+	install -m 0755 "${WORKDIR}/zaurus-hinge.bl-on" "${D}/etc/apm/resume.d/00-backlight-on"
+	install -m 0755 "${WORKDIR}/zaurus-hinge.bl-on" "${D}/etc/zaurusd/hinge-landscape.d/00-backlight-on"
+	install -m 0755 "${WORKDIR}/zaurus-hinge.bl-on" "${D}/etc/zaurusd/hinge-portrait.d/00-backlight-on"
+	install -m 0755 "${WORKDIR}/zaurus-hinge.bl-off" "${D}/etc/zaurusd/hinge-close.d/00-backlight-off"
+
+	install -m 0755 "${WORKDIR}/01-check-toggle-landscape" "${D}/etc/zaurusd/hinge-landscape.d/01-check-toggle"
+	install -m 0755 "${WORKDIR}/01-check-toggle-portait" "${D}/etc/zaurusd/hinge-portrait.d/01-check-toggle"
+
+	install -m 0755 "${WORKDIR}/zaurus-hinge.matchbox-landscape" "${D}/etc/zaurusd/hinge-landscape.d/20-matchbox-landscape"
+	install -m 0755 "${WORKDIR}/zaurus-hinge.matchbox-portrait" "${D}/etc/zaurusd/hinge-portrait.d/20-matchbox-portrait"
+}
+
+inherit autotools pkgconfig update-rc.d
+
+INITSCRIPT_NAME = "zaurusd"
+INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
diff --git a/recipes-bsp/zaurusd/zaurusd_svn.bb b/recipes-bsp/zaurusd/zaurusd_svn.bb
deleted file mode 100644
index af58831..0000000
--- a/recipes-bsp/zaurusd/zaurusd_svn.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-DESCRIPTION = "Daemon to handle device specific features."
-SECTION = "base"
-LICENSE = "GPL"
-DEPENDS = "tslib"
-RDEPENDS_${PN} = "procps"
-SRCDATE = "20090501"
-PV = "0.0+svn${SRCDATE}"
-PR = "r24"
-
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http \
-           file://zaurus-hinge.in \
-	   file://add-poodle.patch \
-	   file://alsa-cxx00-default.state.patch \
-	   file://alsa-6000x-default.state.patch \
-	   file://disable-alsa-handling.patch \
-	   file://avoid-rotated-server.patch \
-	   file://new-make.patch \
-	   file://zaurus-hinge.matchbox-portrait \
-	   file://zaurus-hinge.matchbox-landscape \
-	   file://zaurus-hinge.bl-on \
-	   file://zaurus-hinge.bl-off \
-	   file://01-check-toggle-landscape \
-	   file://01-check-toggle-portait \
-       file://use-ts-symlink-instead-of-hardcoding.diff "
-
-
-S = "${WORKDIR}/${PN}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-do_configure_prepend () {
-	cp ${WORKDIR}/zaurus-hinge.in ${S}/scripts
-}
-
-do_install_append() {
-	install -d "${D}/etc/zaurusd/hinge-landscape.d"
-	install -d "${D}/etc/zaurusd/hinge-portrait.d"
-	install -d "${D}/etc/zaurusd/hinge-close.d"
-	install -d ${D}/etc/apm/resume.d
-
-	install -m 0755 "${WORKDIR}/zaurus-hinge.bl-on" "${D}/etc/apm/resume.d/00-backlight-on"
-	install -m 0755 "${WORKDIR}/zaurus-hinge.bl-on" "${D}/etc/zaurusd/hinge-landscape.d/00-backlight-on"
-	install -m 0755 "${WORKDIR}/zaurus-hinge.bl-on" "${D}/etc/zaurusd/hinge-portrait.d/00-backlight-on"
-	install -m 0755 "${WORKDIR}/zaurus-hinge.bl-off" "${D}/etc/zaurusd/hinge-close.d/00-backlight-off"
-
-	install -m 0755 "${WORKDIR}/01-check-toggle-landscape" "${D}/etc/zaurusd/hinge-landscape.d/01-check-toggle"
-	install -m 0755 "${WORKDIR}/01-check-toggle-portait" "${D}/etc/zaurusd/hinge-portrait.d/01-check-toggle"
-
-	install -m 0755 "${WORKDIR}/zaurus-hinge.matchbox-landscape" "${D}/etc/zaurusd/hinge-landscape.d/20-matchbox-landscape"
-	install -m 0755 "${WORKDIR}/zaurus-hinge.matchbox-portrait" "${D}/etc/zaurusd/hinge-portrait.d/20-matchbox-portrait"
-}
-
-inherit autotools pkgconfig update-rc.d
-
-INITSCRIPT_NAME = "zaurusd"
-INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
-- 
1.7.6.1



