Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10668.1794762001129411769
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tZdSxqTv;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2947305c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762000; x=1795366800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jgh0Mq+cTnI2EEhcyUdLewB6Zcx70IsZ3zKmORr03aU=;
        b=tZdSxqTvR1JywJD/rK7XPIVBYgANzNcbqDsSvIHS0eQKL2u29hPFRJN2F772Lv43Xf
         AKqyPayBMp/Mt6ZbVENkDY7/B15R0aVow0QSsN4/YH25BTvHeW5Lq0ni1s7tZ8LkaOdE
         qBEwxUoIZpB03TkKT4ol0v7yGXRxeAUCTKPU2gljot126kAu3NJECOBZrRe0i5Jsh0GN
         2ZN48m/aM2Fob6lH8fMMQUya2RWJHRgxH8x5b9og9wYDc9XurdEdIjEctwGhxPEw1z/M
         Iq9ainJsMDhNCc3aSHaJHkFgPSmdc1jwlLmhCwNlZGHpP1sFCY0EARq3iD7ccxiOUHvf
         tQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762000; x=1795366800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jgh0Mq+cTnI2EEhcyUdLewB6Zcx70IsZ3zKmORr03aU=;
        b=DN5I2v8dylzECGrGfxBLgEyfyekpA+yG+2xbl91KKcmpZ1WT3VVd82lthLMkqT6EuI
         KmkZz6BV9dNxet2Q/FAM7m1A7vPOxYyNHJ+V+s0VAt8arrh7vUU9hyyvWj8W7NbSTQ0r
         UAZRR3BRMeFToubttFXC7F2d+612LO2NWdAVLPrSGnYlpls91v+eQZ9zsE9tSvtytxvO
         7cFDWf4wz1q0RizYmG+7kVjb1oqvGAv6UE51BI6pnL4314gLBx65WXc3Mw27LkbAZ1/l
         ioWkJqaw7x3ARAMTpU3B6+bCNrUuqKCg5U4UU8Cj4jt7jsFo7UZscYeH0EtqKN4EXMOn
         IyVw==
X-Gm-Message-State: APuU4Z9TCdBaMdx5qwm3wtXm9Px7BOR0GqbB+bRFIk+dDfca8ZLRSDUL
	OpL3Avf4iqYebtkMe4kRKcD6t6oLp4/AOc1/eOl1Fra7PphQIeWqfcnGa4xoH9Rs
X-Gm-Gg: AYBFou20HsmhmQGgwxYUqQAoGmpTruxE1dunyq8Cv2BBTcmmnA5b4N33UTgLYgMi1uD
	BM9tDCFaZxdJmzR2NhkmNQsNSq/tZFnlyz4mlC4xPq/IsPsEWjEfkP0oRZY03XPtIYTN8NRx4Ny
	T9URSmyoIvDOY8szTP6Yr+E5VxIT3jQR1DPcAbScGHX0NWP4yXHOMm4OH32OuH20om0RNcrcG4y
	8GUqgaIQVc50a37LuS5md0YamA7TpukgP3XufkRUkNSS5LTRm7T74I3HJ14MvFBtOPHp7JhDFl8
	/gKgE7w2HfLOboIjbJ4qgyAEKRVEW7Bd0626rxpl7sr4jdCXpJHw6ZGh97pGJRv/pt0W/mmi+78
	2Hwft92YA3EJal5+roJIRl2LLGjtFlze9aRicIudz8XNUEA2YbR0d3NQBRZif4U2mYSDeax+way
	INfoVYVyi4SHJgk8jb8EC4d94UhmBYpw1ZP8Z9JaXoq52EVEsQMkmhZvoTvlxi9EzRn2MEG5eVe
	slVHcmQge/Nh2YOPltcHj9GQFinx6a7ijRmSYo0nRvRQpyhuK+e7aklLpMMjduGK1PinhusXkUD
	oDfRfh+hWn9czE0cWMNugyR901SZ3/hDaS978QAg0uMiCOF1MI1tuEKy60zH+Iu6aWuj7F0bx4r
	AwoDHzMYC9Tv7+YNRNIvsM3vkLUAP9BQUJbIaRyA/zSDydVoqe3aWAKL1PSVrUN3Y+2l7bCz686
	c/wWeWzniUc6R9oUKLuodm7I+DKuLeAj8CCmELwOFuDDlJBt0YG3AwPweJVGIFqhFexlQEYPmxs
	KHLxLgIUTcvEOS+U33UWxnJ9QPUavlKKnrDS5UXTLoxClhMkJz2YHIDuctcotCC8Q7PxkCSV/1p
	GMYCLn9TR4Bv8e+Q0BtIt6zuKg==
X-Received: by 2002:a05:7022:371a:b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b50313d82fmr8500476c88.35.1794762000280;
        Sun, 15 Nov 2026 09:00:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.08.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:59:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 02/15] bluealsa: upgrade 4.3.1 -> 5.0.0
Date: Sun, 15 Nov 2026 08:59:41 -0800
Message-ID: <20261115165955.3485789-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132368
Content-Type: text/plain; charset="utf-8"

BlueALSA 5.0.0 renames bluealsa to bluealsad and bluealsa-cli to
bluealsactl, without backward compatibility.

- Rename the cli PACKAGECONFIG to ctl (--enable-ctl) and pass
  --with-systemdbluealsadargs instead of --with-systemdbluealsaargs.
- Backport an upstream fix for building with dependency tracking
  disabled, otherwise the dbus code generator fails because src/dbus
  does not exist in the build directory.
- Package the ALSA configuration snippet and the D-Bus interface
  description which are now installed.
- LICENSE checksum changed due to the copyright year.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ild-with-disable-dependency-checking.patch | 159 ++++++++++++++++++
 .../{bluealsa_4.3.1.bb => bluealsa_5.0.0.bb}  |  19 ++-
 2 files changed, 170 insertions(+), 8 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Fix-build-with-disable-dependency-checking.patch
 rename meta-multimedia/recipes-multimedia/bluealsa/{bluealsa_4.3.1.bb => bluealsa_5.0.0.bb} (80%)

diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Fix-build-with-disable-dependency-checking.patch b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Fix-build-with-disable-dependency-checking.patch
new file mode 100644
index 0000000000..c396d76384
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Fix-build-with-disable-dependency-checking.patch
@@ -0,0 +1,159 @@
+From 722886d22243488f9a8e0145050f05fcac3e8997 Mon Sep 17 00:00:00 2001
+From: borine <32966433+borine@users.noreply.github.com>
+Date: Sun, 4 Oct 2026 15:11:32 +0100
+Subject: [PATCH] Fix build with --disable-dependency-checking
+
+The directory src/dbus in the build tree was created only by the
+automake automatic dependency checking rules; so that if automatic
+dependency checking is disabled by configure (as is commonly done
+for one-time builds) then that directory did not exist and so the
+dbus-codegen commands all failed. This commit re-factors the
+automake files such that the src/dbus directory is now an explicit
+automake sub-directory, so that it is always created in the build
+by the configure command.
+
+Fixes #814
+
+Upstream-Status: Backport [https://github.com/arkq/bluez-alsa/commit/722886d22243488f9a8e0145050f05fcac3e8997]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure.ac         |  1 +
+ src/Makefile.am      | 30 ++++--------------------------
+ src/dbus/Makefile.am | 36 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 41 insertions(+), 26 deletions(-)
+ create mode 100644 src/dbus/Makefile.am
+
+diff --git a/configure.ac b/configure.ac
+index cd413ae..3e3ab7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -498,6 +498,7 @@ AC_CONFIG_FILES([
+ 	src/Makefile
+ 	src/asound/Makefile
+ 	src/bluealsactl/Makefile
++	src/dbus/Makefile
+ 	src/dumper/Makefile
+ 	src/shared/Makefile
+ 	utils/Makefile
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 8b68826..1ae04e3 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -4,26 +4,14 @@
+
+ SUBDIRS = shared
+ # Make sure that shared library is built before anything else.
+-SUBDIRS += asound bluealsactl dumper
++SUBDIRS += asound bluealsactl dbus dumper
+
+ bin_PROGRAMS = bluealsad
+ noinst_LTLIBRARIES = libbluealsad.la
+
+ dbusconfdir = @DBUS_CONF_DIR@
+-dbusifacedir = @DBUS_IFACE_DIR@
+ dbusbluealsauser = @BLUEALSAD_USER@
+ dist_dbusconf_DATA = org.bluealsa.conf
+-dist_dbusiface_DATA = dbus/org.bluealsa.xml
+-
+-BUILT_SOURCES = \
+-	dbus/org.bluealsa.h \
+-	dbus/org.bluealsa.c \
+-	dbus/org.bluez.h \
+-	dbus/org.bluez.c \
+-	dbus/org.ofono.h \
+-	dbus/org.ofono.c
+-
+-CODEGEN_DEFS =
+
+ MOSTLYCLEANFILES = \
+ 	$(dist_dbusconf_DATA) \
+@@ -50,8 +38,8 @@ libbluealsad_la_SOURCES = \
+ 	bluez.c \
+ 	codec-sbc.c \
+ 	dbus.c \
+-	dbus/org.bluealsa.xml \
+-	dbus/org.bluez.xml \
++	dbus/org.bluealsa.c \
++	dbus/org.bluez.c \
+ 	error.c \
+ 	hci.c \
+ 	io.c \
+@@ -82,7 +70,6 @@ libbluealsad_la_SOURCES += \
+ endif
+
+ if ENABLE_ASHA
+-CODEGEN_DEFS += --define=ENABLE_GATT
+ libbluealsad_la_SOURCES += \
+ 	asha-g722.c \
+ 	asha.c \
+@@ -113,7 +100,6 @@ libbluealsad_la_SOURCES += \
+ endif
+
+ if ENABLE_MIDI
+-CODEGEN_DEFS += --define=ENABLE_GATT
+ libbluealsad_la_SOURCES += \
+ 	bt-midi.c \
+ 	bt-advertising.c \
+@@ -145,7 +131,7 @@ endif
+ if ENABLE_OFONO
+ libbluealsad_la_SOURCES += \
+ 	ofono.c \
+-	dbus/org.ofono.xml
++	dbus/org.ofono.c
+ endif
+
+ if ENABLE_UPOWER
+@@ -203,11 +189,3 @@ DBUSCONF_SUBS = \
+
+ .conf.in.conf:
+ 	$(SED) -e '$(DBUSCONF_SUBS)' < $< > $@
+-
+-.xml.h:
+-	$(srcdir)/dbus/dbus-codegen.py --output $@ $(CODEGEN_DEFS) \
+-		--interface-info-header --interface-skeleton-header $<
+-
+-.xml.c:
+-	$(srcdir)/dbus/dbus-codegen.py --output $@ $(CODEGEN_DEFS) \
+-		--interface-info-body --interface-skeleton-body $<
+diff --git a/src/dbus/Makefile.am b/src/dbus/Makefile.am
+new file mode 100644
+index 0000000..ee77c9c
+--- /dev/null
++++ b/src/dbus/Makefile.am
+@@ -0,0 +1,36 @@
++# BlueALSA - Makefile.am
++# SPDX-FileCopyrightText: 2016-2026 BlueALSA developers
++# SPDX-License-Identifier: MIT
++
++dbusifacedir = @DBUS_IFACE_DIR@
++dist_dbusiface_DATA = org.bluealsa.xml
++
++CODEGEN_DEFS =
++
++if ENABLE_ASHA
++CODEGEN_DEFS += --define=ENABLE_GATT
++endif
++
++if ENABLE_MIDI
++CODEGEN_DEFS += --define=ENABLE_GATT
++endif
++
++LOCAL_TARGETS = \
++	org.bluealsa.h \
++	org.bluealsa.c \
++	org.bluez.h \
++	org.bluez.c \
++	org.ofono.h \
++	org.ofono.c
++
++MOSTLYCLEANFILES = $(LOCAL_TARGETS)
++
++all-local: $(LOCAL_TARGETS)
++
++.xml.h:
++	$(srcdir)/dbus-codegen.py --output $@ $(CODEGEN_DEFS) \
++		--interface-info-header --interface-skeleton-header $<
++
++.xml.c:
++	$(srcdir)/dbus-codegen.py --output $@ $(CODEGEN_DEFS) \
++		--interface-info-body --interface-skeleton-body $<
diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.1.bb b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_5.0.0.bb
similarity index 80%
rename from meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.1.bb
rename to meta-multimedia/recipes-multimedia/bluealsa/bluealsa_5.0.0.bb
index f94600e8b2..7ac758a0fa 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.1.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_5.0.0.bb
@@ -12,20 +12,22 @@ BUGTRACKER = "https://github.com/arkq/bluez-alsa/issues"
 SECTION = "libs"

 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=143bc4e73f39cc5e89d6e096ac0315ba"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8e621f51a0d6b9221389a66da5118183"

 DEPENDS += "alsa-lib bluez5 dbus glib-2.0-native python3-packaging-native sbc"

-SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-Fix-build-with-disable-dependency-checking.patch \
+           "

-SRCREV = "f11569451b98a765adf9abc081632bb013f89f57"
+SRCREV = "1935d6dcb8975f2d7a51aaafe61538d157224623"


-PACKAGECONFIG ??= "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "aplay ctl hcitop ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[a2dpconf] = "--enable-a2dpconf,--disable-a2dpconf"
 PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,fdk-aac"
 PACKAGECONFIG[aplay] = "--enable-aplay,--disable-aplay"
-PACKAGECONFIG[cli] = "--enable-cli,--disable-cli"
+PACKAGECONFIG[ctl] = "--enable-ctl,--disable-ctl"
 PACKAGECONFIG[coverage] = "--with-coverage,--without-coverage,lcov-native"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[debug-time] = "--enable-debug-time,--disable-debug-time"
@@ -40,7 +42,7 @@ PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono,ofono"
 PACKAGECONFIG[payloadcheck] = "--enable-payloadcheck,--disable-payloadcheck"
 PACKAGECONFIG[rfcomm] = "--enable-rfcomm,--disable-rfcomm"
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir} \
-                          --with-systemdbluealsaargs='${SYSTEMD_BLUEALSA_ARGS}' --with-systemdbluealsaaplayargs='${SYSTEMD_BLUEALSA_APLAY_ARGS}',--disable-systemd,systemd"
+                          --with-systemdbluealsadargs='${SYSTEMD_BLUEALSA_ARGS}' --with-systemdbluealsaaplayargs='${SYSTEMD_BLUEALSA_APLAY_ARGS}',--disable-systemd,systemd"
 PACKAGECONFIG[test] = "--enable-test,--disable-test,libcheck libsndfile1"
 PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,,upower"

@@ -58,7 +60,8 @@ PACKAGE_BEFORE_PN = "${PN}-aplay"

 FILES:${PN}-aplay += "${bindir}/bluealsa-aplay"
 FILES:${PN}-staticdev += "${libdir}/alsa-lib/*.a"
-FILES:${PN} += "${libdir}/alsa-lib/* ${datadir}/dbus-1/system.d"
+FILES:${PN} += "${libdir}/alsa-lib/* ${datadir}/alsa ${datadir}/dbus-1/system.d"
+FILES:${PN}-dev += "${datadir}/dbus-1/interfaces"

 RRECOMMENDS:${PN} = "${PN}-aplay"

@@ -68,7 +71,7 @@ SYSTEMD_SERVICE:${PN}-aplay = "bluealsa-aplay.service"

 SYSTEMD_AUTO_ENABLE:${PN}-aplay = "disable"

-# Choose bluez-alsa arguments to be used in bluealsa systemd service
+# Choose bluealsad arguments to be used in bluealsa systemd service
 # Usually could choose profiles with it: a2dp-source a2dp-sink hfp-hf hfp-ag hsp-hs hsp-ag hfp-ofono
 # Enable bluez-alsa arguments by default:
 SYSTEMD_BLUEALSA_ARGS ?= "-p a2dp-source -p a2dp-sink"
