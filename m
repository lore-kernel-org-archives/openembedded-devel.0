Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 29912782C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 17:27:27 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g32so714310wrd.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C0Q6bbdq+Mofx8KLQqHARB6V82LO9vykbOt1FkhPzW4=;
	b=IQA+8gI7l0HoO4ZaMpwhlJP/jIaMSXHtv6h996q5AMiupusQOYpDQ06rs+NfIgHOQp
	WMU241v9U5ATVQLSBBMAqWVu/Rf1ktUtyOYd81dCxKjpwLJ9+TmXpjVa5qKaoF+hfDVy
	p8+y/KpnyaDwYyPjaDoZMkzRNn0963evS8PebGD7AITR39iGo/m5vi7LmpJywUTibSJA
	l/2inlC4foYpDhtzEGdiEzxiaTZdsrKmGxSSWkNZ4yEVVVq2VxMalfFFp8qDEKU+PWwp
	YkIZyw+DgN8mKWjr8Hptx1/2uMT07BmDmeMeliMt0RbvRdcdNrzQFsdYkiVry4eSpCoS
	DTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C0Q6bbdq+Mofx8KLQqHARB6V82LO9vykbOt1FkhPzW4=;
	b=GiSrY5tzXnkfE6noSy8HFWkr1KXvODwPYc9wig2CXZgZihKCpXbVTZdU9Rh/DCzFSC
	PKk8okk89lSnbRr36NJKULqFFbdygmqogYIBcwaYlwhzJjjoGyW8gsheb0tjq4qdjXFV
	j4fvldg/xjpb5OrSIM7YByyWKk6BvCrDw7M8Gdxk/nYk+0jk6Kk1HGtvzUUVMGyiEiPK
	3haXtmaCUuPHbWL1RAO9mc2BeI/RwiVVgXiznc+Sp1mFBnwr9uo3JULQcdTW50keV/mu
	zgrfQ4AKLumg1hAt2+H09GRa7TapffaYVGk2aVxyM0hc7eVrpTl1Qd8OPnsX5IcsyN4W
	KwwA==
X-Gm-Message-State: AIVw113F/YCeRlIltiift5CIBJoJwoe3Gox329g7/RpfQW2iYBBK0Cuk
	jyFXXMqFmgpGEokn
X-Received: by 10.223.167.73 with SMTP id e9mr1803867wrd.205.1500917247957;
	Mon, 24 Jul 2017 10:27:27 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	143sm2225387wmy.12.2017.07.24.10.27.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 10:27:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 19:28:25 +0200
Message-Id: <20170724172825.10560-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH][RFC][meta-oe] bluez4: remove bluez4-only recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 17:27:28 -0000

* remove recipes which support only bluez4 and are blacklisted when
  bluez5 is selected in DISTRO_FEATURES, if someone is still using
  bluez4, then it can be restored in separate meta-bluez4 and
  maintained by people using it.

* there are few recipes which support both bluez5 or bluez4 based on
  selected DISTRO_FEATURES, these can stay in meta-oe repository, but
  now people without bluez5 in DISTRO_FEATURES will need to add
  meta-bluez4 layer to satisfy bluez4 dependency

  meta-gnome/recipes-connectivity/obex/obexd_0.48.bb:DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
  meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb:    ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)} \
  meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb:DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
  meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb:DEPENDS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
  meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb:RDEPENDS_bluez4 = " \
  meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb:# Install bluez4 tools or bluez5 tools depending on what is specified in the distro.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../bluez/bluez-hcidump_2.5.bb                     |  24 -----
 .../bluez/bluez4-4.101/bluetooth.conf              |  16 ---
 .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 -------
 .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 --------------------
 .../bluez/bluez4-4.101/install-test-script.patch   |  26 -----
 ...ork-fix-network-Connect-method-parameters.patch |  30 ------
 .../bluez4-4.101/obsolete_automake_macros.patch    |  14 ---
 .../bluez/bluez4-4.101/sbc_mmx.patch               |  24 -----
 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb |  50 ---------
 .../bluez/gst-plugin-bluetooth_4.101.bb            |  41 --------
 .../foxtrotgps/foxtrotgps_1.1.1.bb                 |  26 -----
 ...g_type_init-is-deprecated-for-glib-2.35.0.patch | 114 ---------------------
 .../recipes-navigation/gypsy/files/fixups.patch    |  21 ----
 meta-oe/recipes-navigation/gypsy/gypsy.inc         |  25 -----
 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb      |  15 ---
 meta-oe/recipes-navigation/gypsy/gypsy_git.bb      |  22 ----
 meta-oe/recipes-navigation/navit/navit-fpu.inc     |   6 --
 meta-oe/recipes-navigation/navit/navit.inc         |  95 -----------------
 .../navit/navit/configure.add.imlib2.option.patch  |  16 ---
 .../navit/navit/freetype-include-path.patch        |  28 -----
 meta-oe/recipes-navigation/navit/navit/maps.xml    |  24 -----
 meta-oe/recipes-navigation/navit/navit/navit.xml   |  45 --------
 meta-oe/recipes-navigation/navit/navit/osd.xml     |  15 ---
 meta-oe/recipes-navigation/navit/navit/plugins.xml |   6 --
 meta-oe/recipes-navigation/navit/navit/speech.xml  |   8 --
 meta-oe/recipes-navigation/navit/navit_svn.bb      |  11 --
 .../recipes-support/opensync/libsyncml_0.5.4.bb    |  21 ----
 27 files changed, 870 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
 delete mode 100644 meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
 delete mode 100644 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
 delete mode 100644 meta-oe/recipes-navigation/gypsy/files/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
 delete mode 100644 meta-oe/recipes-navigation/gypsy/files/fixups.patch
 delete mode 100644 meta-oe/recipes-navigation/gypsy/gypsy.inc
 delete mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
 delete mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_git.bb
 delete mode 100644 meta-oe/recipes-navigation/navit/navit-fpu.inc
 delete mode 100644 meta-oe/recipes-navigation/navit/navit.inc
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/configure.add.imlib2.option.patch
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/freetype-include-path.patch
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/maps.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/navit.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/osd.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/plugins.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/speech.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit_svn.bb
 delete mode 100644 meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb

diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
deleted file mode 100644
index 3a15d64cc..000000000
--- a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Linux Bluetooth Stack HCI Debugger Tool"
-DESCRIPTION = "The hcidump tool reads raw HCI data coming from and going to a Bluetooth device \
-and displays the commands, events and data in a human-readable form."
-
-SECTION = "console"
-# hcidump was integrated into bluez5
-DEPENDS = "bluez4"
-RCONFLICTS_${PN} = "bluez5"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
-PR = "r1"
-
-PNBLACKLIST[bluez-hcidump] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz \
-           file://obsolete_automake_macros.patch \
-"
-
-SRC_URI[md5sum] = "2eab54bbd2b59a2ed4274ebb9390cf18"
-SRC_URI[sha256sum] = "9b7c52b375081883738cf049ecabc103b97d094b19c6544fb241267905d88881"
-S = "${WORKDIR}/bluez-hcidump-${PV}"
-
-inherit autotools
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
deleted file mode 100644
index ca5e9e4f2..000000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-<!-- This configuration file specifies the required security policies
-     for Bluetooth core daemon to work. -->
-
-<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
- "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-<busconfig>
-
-  <!-- ../system.conf have denied everything, so we just punch some holes -->
-
-  <policy context="default">
-    <allow own="org.bluez"/>
-    <allow send_destination="org.bluez"/>
-    <allow send_interface="org.bluez.Agent"/>
-  </policy>
-
-</busconfig>
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
deleted file mode 100644
index 80899148e..000000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Add udevdir/udevrulesdir options
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: bluez-4.101/Makefile.am
-===================================================================
---- bluez-4.101.orig/Makefile.am
-+++ bluez-4.101/Makefile.am
-@@ -395,7 +395,7 @@ EXTRA_DIST += audio/bluetooth.conf
- include Makefile.tools
- 
- if DATAFILES
--rulesdir = @UDEV_DIR@/rules.d
-+rulesdir = @UDEV_RULES_DIR@
- 
- udev_files =
- 
-Index: bluez-4.101/configure.ac
-===================================================================
---- bluez-4.101.orig/configure.ac
-+++ bluez-4.101/configure.ac
-@@ -61,4 +61,14 @@ if (test -n "${path_systemdunit}"); then
- fi
- AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
- 
-+AC_ARG_WITH([udevdir],
-+    AS_HELP_STRING([--with-udevdir=DIR], [udev directory]),
-+    [], [with_udevdir=/lib/udev/])
-+AC_SUBST([UDEV_DIR], [$with_udevdir])
-+
-+AC_ARG_WITH([udevrulesdir],
-+    AS_HELP_STRING([--with-udevrulesdir=DIR], [udev rules directory]),
-+    [], [with_udevrulesdir=/lib/udev/rules.d])
-+AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
-+
- AC_OUTPUT(Makefile doc/version.xml src/bluetoothd.8 src/bluetooth.service bluez.pc)
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
deleted file mode 100644
index 1bc390f35..000000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-Avoid namepspace collision with encrypt function from libc
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: bluez-4.101/test/l2test.c
-===================================================================
---- bluez-4.101.orig/test/l2test.c
-+++ bluez-4.101/test/l2test.c
-@@ -107,7 +107,7 @@ static char *filename = NULL;
- static int rfcmode = 0;
- static int master = 0;
- static int auth = 0;
--static int encrypt = 0;
-+static int encryption_request = 0;
- static int secure = 0;
- static int socktype = SOCK_SEQPACKET;
- static int linger = 0;
-@@ -340,7 +340,7 @@ static int do_connect(char *svr)
- 		opt |= L2CAP_LM_MASTER;
- 	if (auth)
- 		opt |= L2CAP_LM_AUTH;
--	if (encrypt)
-+	if (encryption_request)
- 		opt |= L2CAP_LM_ENCRYPT;
- 	if (secure)
- 		opt |= L2CAP_LM_SECURE;
-@@ -475,7 +475,7 @@ static void do_listen(void (*handler)(in
- 		opt |= L2CAP_LM_MASTER;
- 	if (auth)
- 		opt |= L2CAP_LM_AUTH;
--	if (encrypt)
-+	if (encryption_request)
- 		opt |= L2CAP_LM_ENCRYPT;
- 	if (secure)
- 		opt |= L2CAP_LM_SECURE;
-@@ -1407,7 +1407,7 @@ int main(int argc, char *argv[])
- 			break;
- 
- 		case 'E':
--			encrypt = 1;
-+			encryption_request = 1;
- 			break;
- 
- 		case 'S':
-Index: bluez-4.101/test/rctest.c
-===================================================================
---- bluez-4.101.orig/test/rctest.c
-+++ bluez-4.101/test/rctest.c
-@@ -79,7 +79,7 @@ static char *filename = NULL;
- 
- static int master = 0;
- static int auth = 0;
--static int encrypt = 0;
-+static int encryption_request = 0;
- static int secure = 0;
- static int socktype = SOCK_STREAM;
- static int linger = 0;
-@@ -200,7 +200,7 @@ static int do_connect(const char *svr)
- 		opt |= RFCOMM_LM_MASTER;
- 	if (auth)
- 		opt |= RFCOMM_LM_AUTH;
--	if (encrypt)
-+	if (encryption_request)
- 		opt |= RFCOMM_LM_ENCRYPT;
- 	if (secure)
- 		opt |= RFCOMM_LM_SECURE;
-@@ -291,7 +291,7 @@ static void do_listen(void (*handler)(in
- 		opt |= RFCOMM_LM_MASTER;
- 	if (auth)
- 		opt |= RFCOMM_LM_AUTH;
--	if (encrypt)
-+	if (encryption_request)
- 		opt |= RFCOMM_LM_ENCRYPT;
- 	if (secure)
- 		opt |= RFCOMM_LM_SECURE;
-@@ -701,7 +701,7 @@ int main(int argc, char *argv[])
- 			break;
- 
- 		case 'E':
--			encrypt = 1;
-+			encryption_request = 1;
- 			break;
- 
- 		case 'S':
-Index: bluez-4.101/src/textfile.h
-===================================================================
---- bluez-4.101.orig/src/textfile.h
-+++ bluez-4.101/src/textfile.h
-@@ -24,6 +24,8 @@
- #ifndef __TEXTFILE_H
- #define __TEXTFILE_H
- 
-+#include <sys/types.h>
-+
- int create_dirs(const char *filename, const mode_t mode);
- int create_file(const char *filename, const mode_t mode);
- int create_name(char *buf, size_t size, const char *path,
-Index: bluez-4.101/test/attest.c
-===================================================================
---- bluez-4.101.orig/test/attest.c
-+++ bluez-4.101/test/attest.c
-@@ -34,6 +34,7 @@
- #include <termios.h>
- #include <sys/ioctl.h>
- #include <sys/socket.h>
-+#include <sys/select.h>
- 
- #include <bluetooth/bluetooth.h>
- #include <bluetooth/rfcomm.h>
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
deleted file mode 100644
index 23f7d999b..000000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Inappropriate
-
-Install the bluez's test scripts
-
-Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
-diff -Nurd bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
---- bluez-4.101.orig/Makefile.tools	2013-11-19 15:49:07.688838000 +0800
-+++ bluez-4.101/Makefile.tools	2013-11-19 15:50:09.256837848 +0800
-@@ -227,6 +227,17 @@
- 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
- 		test/simple-player test/test-nap
- 
-+bluez4_testdir = $(libdir)/bluez4/test/
-+dist_bluez4_test_SCRIPTS = test/sap-client test/hsplay test/hsmicro \
-+		test/monitor-bluetooth test/list-devices \
-+		test/test-discovery test/test-manager test/test-adapter \
-+		test/test-device test/test-service test/test-serial \
-+		test/test-telephony test/test-network test/simple-agent \
-+		test/simple-service test/simple-endpoint test/test-audio \
-+		test/test-input test/test-sap-server test/test-oob \
-+		test/test-attrib test/test-proximity test/test-thermometer \
-+		test/test-serial-proxy test/test-health test/test-health-sink \
-+		test/simple-player test/test-nap
- if HIDD
- bin_PROGRAMS += compat/hidd
- 
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
deleted file mode 100644
index 37f919926..000000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
-
-From 57170b311f1468330f4a9961dc0b3ac45f97bc13 Mon Sep 17 00:00:00 2001
-From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
-Date: Sat, 30 Jun 2012 00:39:05 -0300
-Subject: [PATCH] network: fix network Connect() method parameters
-
----
- network/connection.c |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/network/connection.c b/network/connection.c
-index 544ec3a..59423a9 100644
---- a/network/connection.c
-+++ b/network/connection.c
-@@ -554,7 +554,9 @@ static void path_unregister(void *data)
- 
- static const GDBusMethodTable connection_methods[] = {
- 	{ GDBUS_ASYNC_METHOD("Connect",
--			NULL, NULL, connection_connect) },
-+				GDBUS_ARGS({"uuid", "s"}),
-+				GDBUS_ARGS({"interface", "s"}),
-+				connection_connect) },
- 	{ GDBUS_METHOD("Disconnect",
- 			NULL, NULL, connection_disconnect) },
- 	{ GDBUS_METHOD("GetProperties",
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
deleted file mode 100644
index 1068f2482..000000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd bluez-4.101/configure.ac bluez-4.101/configure.ac
---- bluez-4.101/configure.ac	2012-06-22 19:36:49.000000000 +0300
-+++ bluez-4.101/configure.ac	2013-01-07 06:13:18.385888966 +0200
-@@ -2,7 +2,7 @@
- AC_INIT(bluez, 4.101)
-
- AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
deleted file mode 100644
index 98fab458b..000000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-on x86 and x86_64 gcc 4.7 complains
-
-sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
-sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't match constraints [enabled by default]
-sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
-
-This patch is taken from https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/911871
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: bluez-4.98/sbc/sbc_primitives_mmx.c
-===================================================================
---- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.000000000 -0800
-+++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 -0800
-@@ -318,7 +318,7 @@
- 				"movl          %k0, 4(%3)\n"
- 			: "+r" (blk)
- 			: "r" (&sb_sample_f[0][ch][sb]),
--				"i" ((char *) &sb_sample_f[1][0][0] -
-+				"r" ((char *) &sb_sample_f[1][0][0] -
- 					(char *) &sb_sample_f[0][0][0]),
- 				"r" (&scale_factor[ch][sb]),
- 				"r" (&consts),
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
deleted file mode 100644
index d6d16c00f..000000000
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-require bluez4.inc
-
-PNBLACKLIST[bluez4] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
-PR = "r11"
-
-SRC_URI += "file://bluetooth.conf \
-            file://sbc_mmx.patch \
-            file://fix-udev-paths.patch \
-            file://obsolete_automake_macros.patch \
-            file://network-fix-network-Connect-method-parameters.patch \
-            file://install-test-script.patch \
-            file://fix_encrypt_collision.patch \
-"
-
-SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
-SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
-
-RCONFLICTS_${PN} = "bluez5"
-
-do_install_append() {
-    install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-    install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
-    install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
-    # at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
-    install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
-}
-
-RDEPENDS_${PN}-dev = "bluez-hcidump"
-RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
-
-ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez ${PN}-testtools"
-
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
-FILES_${PN}-dev += "\
-    ${libdir}/bluetooth/plugins/*.la \
-    ${libdir}/alsa-lib/*.la \
-"
-
-FILES_${PN}-testtools = "${libdir}/bluez4/test/*"
-
-FILES_${PN}-dbg += "\
-    ${libdir}/bluetooth/plugins/.debug \
-    ${libdir}/*/.debug \
-    */udev/.debug \
-"
-
-SYSTEMD_SERVICE_${PN} = "bluetooth.service"
diff --git a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
deleted file mode 100644
index 822aec4dc..000000000
--- a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-require bluez4.inc
-require recipes-multimedia/gstreamer/gst-plugins-package.inc
-
-PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
-PR = "r1"
-
-SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
-SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
-
-DEPENDS = "bluez4 gst-plugins-base"
-
-EXTRA_OECONF = "\
-    --enable-gstreamer \
-"
-
-# clean unwanted files
-do_install_append() {
-    rm -rf ${D}${bindir}
-    rm -rf ${D}${sbindir}
-    rm -f  ${D}${libdir}/lib*
-    rm -rf ${D}${libdir}/pkgconfig
-    rm -rf ${D}${sysconfdir}
-    rm -rf ${D}${base_libdir}
-    rm -rf ${D}${libdir}/bluetooth
-    rm -rf ${D}${localstatedir}
-    rm -rf ${D}${libdir}/alsa-lib
-    rm -rf ${D}${datadir}
-    rm -rf ${D}${includedir}
-    rm -rf ${D}${nonarch_base_libdir}
-}
-
-FILES_${PN} = "${libdir}/gstreamer-0.10/lib*.so"
-FILES_${PN}-dev += "\
-    ${libdir}/gstreamer-0.10/*.la \
-"
-
-FILES_${PN}-dbg += "\
-    ${libdir}/*/.debug \
-"
-
diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
deleted file mode 100644
index d91cbcbbb..000000000
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "FoxtrotGPS is a map and GPS application using OpenStreetMap"
-AUTHOR = "Joshua Judson Rosen <rozzin@geekspace.com>"
-HOMEPAGE = "http://www.foxtrotgps.org/"
-SECTION = "x11/applications"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "curl gtk+ libglade sqlite3 libexif gpsd bluez4 intltool-native"
-
-PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
-SRC_URI = "http://www.foxtrotgps.org/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "6777d448ee9d3ba195f9d26ea90e3163"
-SRC_URI[sha256sum] = "ae9706285510554cc0813ac92522e0d1672b0ddb065307bfacfcff3c328f6adb"
-
-inherit autotools pkgconfig perlnative gconf
-
-PR = "r2"
-
-do_configure_prepend() {
-    if [ -f ${S}/configure.in ] ; then
-    mv ${S}/configure.in ${S}/configure.ac
-    fi
-}
-
-RDEPENDS_${PN} += "python perl"
-RRECOMMENDS_${PN} = "gpsd"
diff --git a/meta-oe/recipes-navigation/gypsy/files/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch b/meta-oe/recipes-navigation/gypsy/files/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
deleted file mode 100644
index 063bea618..000000000
--- a/meta-oe/recipes-navigation/gypsy/files/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 5b859b6e7c82f49d967c25398a8e75b61af9bcc0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Jun 2013 20:58:51 -0700
-Subject: [PATCH] g_type_init() is deprecated for glib >= 2.35.0
-
-Call it for old versions.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- examples/list-known-gps-devices.c |    4 ++--
- examples/simple-gps-dbus.c        |    3 ++-
- examples/simple-gps-gypsy.c       |    4 ++--
- examples/simple-gps-satellites.c  |    4 ++--
- gypsy/gypsy-marshal.c             |    2 +-
- src/main.c                        |    4 ++--
- 6 files changed, 11 insertions(+), 10 deletions(-)
-
-diff --git a/examples/list-known-gps-devices.c b/examples/list-known-gps-devices.c
-index c7c4059..0a8b04b 100644
---- a/examples/list-known-gps-devices.c
-+++ b/examples/list-known-gps-devices.c
-@@ -20,9 +20,9 @@ main (int argc,
-     GError *error = NULL;
-     GPtrArray *known_devices;
-     int i;
--
-+#if !GLIB_CHECK_VERSION(2,35,0)
-     g_type_init ();
--
-+#endif
-     discovery = gypsy_discovery_new ();
-     known_devices = gypsy_discovery_list_devices (discovery, &error);
- 
-diff --git a/examples/simple-gps-dbus.c b/examples/simple-gps-dbus.c
-index f7044e6..76b18aa 100644
---- a/examples/simple-gps-dbus.c
-+++ b/examples/simple-gps-dbus.c
-@@ -121,8 +121,9 @@ main (int    argc,
- 	DBusConnection *conn;
- 	DBusError error;
- 	GMainLoop *mainloop;
--
-+#if !GLIB_CHECK_VERSION(2,35,0)
- 	g_type_init ();
-+#endif
- 	conn = get_connection ();
- 
- 	dbus_error_init (&error);
-diff --git a/examples/simple-gps-gypsy.c b/examples/simple-gps-gypsy.c
-index 0b6b7a6..86033d9 100644
---- a/examples/simple-gps-gypsy.c
-+++ b/examples/simple-gps-gypsy.c
-@@ -67,9 +67,9 @@ main (int    argc,
- 		g_print ("Usage: %s device\n", argv[0]);
- 		return 0;
- 	}
--
-+#if !GLIB_CHECK_VERSION(2,35,0) 
- 	g_type_init ();
--
-+#endif
- 	control = gypsy_control_get_default ();
- 	path = gypsy_control_create (control, argv[1], &error);
- 	if (path == NULL) {
-diff --git a/examples/simple-gps-satellites.c b/examples/simple-gps-satellites.c
-index 140c98f..9a3f95a 100644
---- a/examples/simple-gps-satellites.c
-+++ b/examples/simple-gps-satellites.c
-@@ -42,9 +42,9 @@ main (int    argc,
- 		g_print ("Usage: %s device\n", argv[0]);
- 		return 0;
- 	}
--
-+#if !GLIB_CHECK_VERSION(2,35,0)
- 	g_type_init ();
--
-+#endif
- 	control = gypsy_control_get_default ();
- 	path = gypsy_control_create (control, argv[1], &error);
- 	if (path == NULL) {
-diff --git a/gypsy/gypsy-marshal.c b/gypsy/gypsy-marshal.c
-index 6964644..9ac0095 100644
---- a/gypsy/gypsy-marshal.c
-+++ b/gypsy/gypsy-marshal.c
-@@ -5,7 +5,7 @@
- 
- #ifdef G_ENABLE_DEBUG
- #define g_marshal_value_peek_boolean(v)  g_value_get_boolean (v)
--#define g_marshal_value_peek_char(v)     g_value_get_char (v)
-+#define g_marshal_value_peek_char(v)     g_value_get_schar (v)
- #define g_marshal_value_peek_uchar(v)    g_value_get_uchar (v)
- #define g_marshal_value_peek_int(v)      g_value_get_int (v)
- #define g_marshal_value_peek_uint(v)     g_value_get_uint (v)
-diff --git a/src/main.c b/src/main.c
-index 3e8a794..ec980e5 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -187,9 +187,9 @@ main (int    argc,
- 	g_option_context_free (context);
- 
- 	umask (022);
--
-+#if !GLIB_CHECK_VERSION(2,35,0)
- 	g_type_init ();
--
-+#endif
- 	mainloop = g_main_loop_new (NULL, FALSE);
- 
- 	conn = dbus_g_bus_get (DBUS_BUS_SYSTEM, &error);
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-navigation/gypsy/files/fixups.patch b/meta-oe/recipes-navigation/gypsy/files/fixups.patch
deleted file mode 100644
index de4d92ea1..000000000
--- a/meta-oe/recipes-navigation/gypsy/files/fixups.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- docs/reference/Makefile.am |    2 ++
- 1 file changed, 2 insertions(+)
-
---- gypsy.orig/docs/reference/Makefile.am
-+++ gypsy/docs/reference/Makefile.am
-@@ -81,10 +81,12 @@ expand_content_files=
- # e.g. GTKDOC_LIBS=$(top_builddir)/gtk/$(gtktargetlib)
- 
- INCLUDES=-I$(top_srcdir) $(GYPSY_CFLAGS)
- GTKDOC_LIBS=$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
- 
-+EXTRA_DIST =
-+CLEANFILES =
- # This includes the standard gtk-doc make rules, copied by gtkdocize.
- include $(top_srcdir)/gtk-doc.make
- 
- # Other files to distribute
- # e.g. EXTRA_DIST += version.xml.in
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
deleted file mode 100644
index 9efd35637..000000000
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "GPS Multiplexing Daemon"
-DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
-multiple clients to access GPS data from multiple GPS sources \
-concurrently.  Gypsy also hides the details of parsing NMEA from the \
-client applications, passing the data as simple values for the clients \
-to use."
-LICENSE = "GPLv2.0 & LGPLv2.1"
-SECTION = "console/network"
-DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native libxslt"
-
-PNBLACKLIST[gypsy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
-inherit autotools pkgconfig gtk-doc
-PACKAGES += "libgypsy"
-
-FILES_${PN} = " \
-  ${sysconfdir}/gypsy.conf \
-  ${sysconfdir}/dbus-1 \
-  ${libexecdir}/gypsy-daemon \
-  ${datadir}/dbus-1 \
-"
-
-FILES_libgypsy = " \
-  ${libdir}/libgypsy${SOLIBS} \
-"
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb b/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
deleted file mode 100644
index 24c8987ef..000000000
--- a/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require gypsy.inc
-
-PR = "r2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
-                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
-
-SRC_URI += "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz \
-           file://0001-g_type_init-is-deprecated-for-glib-2.35.0.patch \
-          "
-
-SRC_URI[md5sum] = "e2d186df9c2cc3b70a027043e22acf1a"
-SRC_URI[sha256sum] = "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e236ddfb271904f154d6"
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_git.bb b/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
deleted file mode 100644
index 6ab16e6be..000000000
--- a/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require gypsy.inc
-
-DEFAULT_PREFERENCE = "-1"
-
-SRCREV = "be8c9c382d2d1d37b51d29b0843045121ec90213"
-PV = "0.9+git${SRCPV}"
-PR = "r2"
-
-S = "${WORKDIR}/git"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
-                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
-
-SRC_URI += "git://anongit.freedesktop.org/gypsy \
-            file://fixups.patch"
-
-do_configure_prepend() {
-  # from patch 563716fc596d53f1085949a9dd11a62f39b2d624
-  test -d ${S}/m4 || mkdir -p ${S}/m4
-}
diff --git a/meta-oe/recipes-navigation/navit/navit-fpu.inc b/meta-oe/recipes-navigation/navit/navit-fpu.inc
deleted file mode 100644
index 54b7a9779..000000000
--- a/meta-oe/recipes-navigation/navit/navit-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_navit_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU') in [ 'soft' ]:
-        return "--enable-avoid-float"
-    return ""
-
diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
deleted file mode 100644
index 1c0bfdaae..000000000
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ /dev/null
@@ -1,95 +0,0 @@
-DESCRIPTION = "Navit is a car navigation system with routing engine."
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ed539d099d6ce08de6ea0dfed9ecb333 \
-                    file://LGPL-2;md5=3214f080875748938ba060314b4f727d \
-                    file://GPL-2;md5=751419260aa954499f7abaabaa882bbe \
-"
-
-SECTION = "x11/applications"
-DEPENDS = "glib-2.0 gd gypsy librsvg-native"
-RDEPENDS_${PN} = " ${PN}-icons ${PN}-config "
-RRECOMMENDS_${PN} = "gpsd ${PN}-dbus ${PN}-speech-cmdline ${PN}-gui-internal ${PN}-graphics-gtk"
-RSUGGESTS_${PN} = "flite-alsa espeak ${PN}-speech-dbus ${PN}-gui-gtk ${PN}-gui-qml ${PN}-graphics-sdl ${PN}-graphics-qt ${PN}-maptool"
-
-PE = "1"
-INC_PR = "r11"
-
-# Depends on gypsy
-PNBLACKLIST[navit] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
-inherit autotools gettext pkgconfig
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[fribidi] = "--enable-fribidi,--disable-fribidi,fribidi"
-PACKAGECONFIG[imlib2] = "--enable-imlib2,--disable-imlib2,imlib2"
-PACKAGECONFIG[sdl] = "--enable-graphics-sdl,--disable-graphics-sdl,libsdl"
-PACKAGECONFIG[gtk] = "--enable-graphics-gtk-drawing-area --enable-gui-gtk,--disable-graphics-gtk-drawing-area --disable-gui-gtk,gtk+"
-PACKAGECONFIG[qt] = "--enable-graphics-qt-qpainter --enable-gui-qml,--disable-graphics-qt-qpainter --disable-gui-qml,qt4-x11-free,qt4-plugin-imageformat-svg"
-
-EXTRA_OECONF += " \
-    --disable-binding-python \
-    --disable-samplemap \
-    --enable-avoid-unaligned \
-    --enable-svg2png-scaling-flag=32 \
-    --disable-speech-speech-dispatcher \
-    --enable-cache-size=20971520 \
-"
-
-#  --enable-avoid-float \
-#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
-require navit-fpu.inc
-EXTRA_OECONF += "${@get_navit_fpu_setting(bb, d)}"
-
-PACKAGES =+ "${PN}-maptool ${PN}-config ${PN}-dbus ${PN}-speech-cmdline ${PN}-speech-dbus ${PN}-gui-gtk ${PN}-gui-internal ${PN}-gui-qml ${PN}-graphics-sdl ${PN}-graphics-gtk ${PN}-graphics-qt ${PN}-icons"
-
-EXTRA_AUTORECONF = " -I m4"
-
-CONFFILES_${PN}-config += "${datadir}/navit/navit.default.xml \
-    ${datadir}/navit/navit.xml \
-    ${datadir}/navit/maps.xml \
-    ${datadir}/navit/osd.xml \
-    ${datadir}/navit/speech.xml \
-    ${datadir}/navit/plugins.xml \
-"
-
-SRC_URI += "file://navit.xml \
-            file://maps.xml \
-            file://osd.xml \
-            file://speech.xml \
-            file://plugins.xml \
-"
-
-FILES_${PN} += "${libdir}/${BPN}/*/*.so ${datadir}/icons"
-FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
-FILES_${PN}-maptool = " ${bindir}/maptool "
-FILES_${PN}-config = " ${datadir}/navit/*.xml "
-FILES_${PN}-dbus = " ${datadir}/dbus-1/services/ ${libdir}/${BPN}/binding/libbinding_dbus.so "
-FILES_${PN}-speech-cmdline = " ${libdir}/${BPN}/speech/libspeech_cmdline.so "
-FILES_${PN}-speech-dbus = " ${libdir}/${BPN}/speech/libspeech_dbus.so "
-FILES_${PN}-gui-gtk = " ${libdir}/${BPN}/gui/libgui_gtk.so "
-FILES_${PN}-gui-qml = " ${libdir}/${BPN}/gui/libgui_qml.so ${datadir}/navit/skins/ "
-FILES_${PN}-gui-internal = " ${libdir}/${BPN}/gui/libgui_internal.so "
-FILES_${PN}-graphics-sdl = " ${libdir}/${BPN}/graphics/libgraphics_sdl.so "
-FILES_${PN}-graphics-qt = " ${libdir}/${BPN}/graphics/libgraphics_qt_qpainter.so "
-FILES_${PN}-graphics-gtk = " ${libdir}/${BPN}/graphics/libgraphics_gtk_drawing_area.so "
-FILES_${PN}-icons = "/usr/share/navit/xpm/"
-
-do_configure_prepend() {
-    # MOC=`$PKG_CONFIG QtGui --variable=moc_location` returns only /usr/bin/moc4 which is not available on hosts without Qt
-    sed -i "s#MOC=#MOC=${STAGING_DIR_NATIVE}#g" ${S}/configure.in
-}
-
-do_install_append() {
-    # fix QA issue
-    sed -i 's#Categories=GTK;Utility;Geography;#Categories=Graphics;#g' ${D}${datadir}/applications/navit.desktop
-
-    rm ${D}${libdir}/${BPN}/*/*.la
-
-    #Use split config
-    mv ${D}${datadir}/navit/navit.xml ${D}${datadir}/navit/navit.default.xml
-    install -m 0644 ${WORKDIR}/navit.xml ${D}${datadir}/navit/navit.xml
-    install -m 0644 ${WORKDIR}/maps.xml ${D}${datadir}/navit/maps.xml
-    install -m 0644 ${WORKDIR}/osd.xml ${D}${datadir}/navit/osd.xml
-    install -m 0644 ${WORKDIR}/speech.xml ${D}${datadir}/navit/speech.xml
-    install -m 0644 ${WORKDIR}/plugins.xml ${D}${datadir}/navit/plugins.xml
-}
diff --git a/meta-oe/recipes-navigation/navit/navit/configure.add.imlib2.option.patch b/meta-oe/recipes-navigation/navit/navit/configure.add.imlib2.option.patch
deleted file mode 100644
index be4179261..000000000
--- a/meta-oe/recipes-navigation/navit/navit/configure.add.imlib2.option.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- a/configure.in.orig	2014-05-10 15:57:18.146362110 +0200
-+++ b/configure.in	2014-05-10 15:59:27.859358845 +0200
-@@ -498,10 +498,13 @@
- AC_SUBST(FRIBIDI_CFLAGS)
- AC_SUBST(FRIBIDI_LIBS)
- 
-+AC_ARG_ENABLE(imlib2, [  --disable-imlib2  disable imlib2 support], imlib2=$enableval;imlib2_reason="configure parameter", imlib2=yes)
-+if test x"${imlib2}" = "xyes"; then
- PKG_CHECK_MODULES(IMLIB2, [imlib2], [imlib2_pkgconfig=yes], [imlib2_pkgconfig=no])
- if test "x$imlib2_pkgconfig" = "xyes"; then
-    AC_DEFINE(HAVE_IMLIB2, 1, [Define to 1 if you have imlib2])
- fi
-+fi
- AC_SUBST(IMLIB2_CFLAGS)
- AC_SUBST(IMLIB2_LIBS)
- 
diff --git a/meta-oe/recipes-navigation/navit/navit/freetype-include-path.patch b/meta-oe/recipes-navigation/navit/navit/freetype-include-path.patch
deleted file mode 100644
index 288997bca..000000000
--- a/meta-oe/recipes-navigation/navit/navit/freetype-include-path.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Description: Fix FTBFS caused by freetype headers path change.
-Author: Gilles Filippini <pini@debian.org>
-Bug-Debian: http://bugs.debian.org/733378
-Index: navit/navit/font/freetype/font_freetype.c
-===================================================================
---- navit.orig/navit/font/freetype/font_freetype.c	2013-09-23 10:43:32.000000000 +0200
-+++ navit/navit/font/freetype/font_freetype.c	2013-12-30 19:54:45.000000000 +0100
-@@ -32,7 +32,7 @@
- #if USE_FRIBIDI
- #include <fribidi.h>
- #endif
--#include <freetype/ftglyph.h>
-+#include <ftglyph.h>
- #include "point.h"
- #include "graphics.h"
- #include "debug.h"
-diff -uNr navit.orig/navit/graphics/sdl/graphics_sdl.c navit/navit/graphics/sdl/graphics_sdl.c
---- navit.orig/navit/graphics/sdl/graphics_sdl.c	2012-06-22 14:16:01.000000000 +0200
-+++ navit/navit/graphics/sdl/graphics_sdl.c	2014-01-01 22:31:10.892948164 +0100
-@@ -84,7 +84,7 @@
- #else
- #include <ft2build.h>
- #include FT_FREETYPE_H
--#include <freetype/ftglyph.h>
-+#include <ftglyph.h>
- #endif
- #include <event.h>
- 
diff --git a/meta-oe/recipes-navigation/navit/navit/maps.xml b/meta-oe/recipes-navigation/navit/navit/maps.xml
deleted file mode 100644
index 6f59f20c3..000000000
--- a/meta-oe/recipes-navigation/navit/navit/maps.xml
+++ /dev/null
@@ -1,24 +0,0 @@
-                <!-- If you have the reiseplaner maps installed, set enabled="yes" in the next line and set the path correctly -->
-                <mapset enabled="no">
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp1.smp"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp2.smp"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp3.smp"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp4.smp"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp5.smp"/>
-                </mapset>
-
-                <!-- If you dont want to use the sample map, either set enabled="no" in the next line or remove the xml file from the maps directory -->
-                <mapset enabled="no">
-                        <xi:include href="$NAVIT_SHAREDIR/maps/*.xml"/>
-                </mapset>
-
-                <!-- Mapset template for openstreetmaps -->
-                <mapset enabled="yes">
-                        <map type="binfile" enabled="yes" data="/media/mmc2/MapsNavit/osm_europe.bin"/>
-                </mapset>
-
-                <!-- Mapset template for garmin maps -->
-                <mapset enabled="no">
-                        <map type="garmin" enabled="yes" data="/path/to/img" debug="4"/>
-                </mapset>
diff --git a/meta-oe/recipes-navigation/navit/navit/navit.xml b/meta-oe/recipes-navigation/navit/navit/navit.xml
deleted file mode 100644
index 58c8c226f..000000000
--- a/meta-oe/recipes-navigation/navit/navit/navit.xml
+++ /dev/null
@@ -1,45 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE config SYSTEM "navit.dtd">
-<config xmlns:xi="http://www.w3.org/2001/XInclude">
-	<xi:include href="/usr/share/navit/plugins.xml"/>
-	<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/debug)"/>
-
-	<navit center="4808 N 1134 E" zoom="256" tracking="1" orientation="-1" recent_dest="10" drag_bitmap="1">
-		<graphics type="gtk_drawing_area"/>
-		<gui type="gtk" enabled="no" menubar="1" toolbar="1" statusbar="1"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/gui[@type='internal'])"/>
-		<!-- or comment gtk version above and try:
-		opkg install navit-graphics-qt
-		opkg install navit-gui-qml
-		<graphics type="qt_qpainter"/>
-		<gui type="qml" enabled="yes" menubar="1" toolbar="1" statusbar="1"/>
-		-->
-		<xi:include href="/usr/share/navit/osd.xml"/>
-		<log enabled="no" type="textfile_debug" data="debug_%Y%m%d-%i.txt" flush_size="1000" flush_time="30"/>
-		<vehicle name="Local GPS" profilename="car" enabled="yes" active="1" source="gpsd://localhost" gpsd_query="w+xj">
-			<!-- <log type="gpx" attr_types="position_time_iso8601,position_direction,position_speed,profilename,position_radius" data="track_%Y%m%d-%i.gpx" flush_size="1000" flush_time="30"/> -->
-		</vehicle>
-
-		<vehicle name="Demo" profilename="car" enabled="no" active="yes" source="demo://"/>
-
-		<!-- For the cumulative displacement filter to be enabled, set cdf_histsize="x" here, with x being an integer somewhere around 4 -->
-		<tracking cdf_histsize="0"/>
-
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/vehicleprofile[@name='car'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/vehicleprofile[@name='bike'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/vehicleprofile[@name='pedestrian'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/vehicleprofile[@name='horse'])"/>
-
-		<route destination_distance="50"/>
-
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/navigation)"/>
-
-		<xi:include href="/usr/share/navit/speech.xml"/>
-		<xi:include href="/usr/share/navit/maps.xml"/>
-
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/layout[@name='Car'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/layout[@name='Car-dark'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/layout[@name='Bike'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/layout[@name='T@H'])"/>
-	</navit>
-</config>
diff --git a/meta-oe/recipes-navigation/navit/navit/osd.xml b/meta-oe/recipes-navigation/navit/navit/osd.xml
deleted file mode 100644
index 2d0f9ffdf..000000000
--- a/meta-oe/recipes-navigation/navit/navit/osd.xml
+++ /dev/null
@@ -1,15 +0,0 @@
-                <!-- osd items allow to position display and control items directly on top of the map: -->
-                <osd enabled="no" type="compass"/>
-                <osd enabled="no" type="eta"/>
-                <osd enabled="no" type="navigation_distance_to_target"/>
-                <osd enabled="no" type="navigation"/>
-                <osd enabled="no" type="navigation_distance_to_next"/>
-                <osd enabled="no" type="navigation_next_turn"/>
-
-                <!-- Commands include gui_internal_menu, gui_internal_fullscreen, zoom_in and zoom_out.
-                         Usage of negative values change the button origins. x="0" y="0" specifies the top left, x="-0" y="-0" the bottom right corner.
-                         It's always the top left corner of the icon, so you need to consider the icon's size when you enter the values. -->
-                <osd enabled="no" type="button" x="0" y="0" command="gui.fullscreen()" src="toggle_fullscreen.xpm"/>
-                <osd enabled="no" type="button" x="-96" y="0" command="gui.menu()" src="menu.xpm"/>
-                <osd enabled="no" type="button" x="-96" y="-96" command="zoom_in()" src="zoom_in.xpm"/>
-                <osd enabled="no" type="button" x="0" y="-96" command="zoom_out()" src="zoom_out.xpm"/>
diff --git a/meta-oe/recipes-navigation/navit/navit/plugins.xml b/meta-oe/recipes-navigation/navit/navit/plugins.xml
deleted file mode 100644
index 015b05517..000000000
--- a/meta-oe/recipes-navigation/navit/navit/plugins.xml
+++ /dev/null
@@ -1,6 +0,0 @@
-<plugins>
-	<plugin path="$NAVIT_LIBDIR/*/${NAVIT_LIBPREFIX}lib*.so" ondemand="yes"/>
-	<plugin path="$NAVIT_LIBDIR/autoload/${NAVIT_LIBPREFIX}lib*.so"/>
-	<plugin path="$NAVIT_LIBDIR/*/${NAVIT_LIBPREFIX}libbinding_dbus.so" active="yes"/>
-	<plugin path="$NAVIT_LIBDIR/*/${NAVIT_LIBPREFIX}libgraphics_null.so" active="no"/>
-</plugins>
diff --git a/meta-oe/recipes-navigation/navit/navit/speech.xml b/meta-oe/recipes-navigation/navit/navit/speech.xml
deleted file mode 100644
index 28c49906d..000000000
--- a/meta-oe/recipes-navigation/navit/navit/speech.xml
+++ /dev/null
@@ -1,8 +0,0 @@
-                <!-- Navit provides speech output in text format.
-                         If you have a speech synthesizer like festival lite installed, you can get turn by turn directions out of navit. Please set the "cps"-value to how many characters your tts engine approximately speaks per second.
-                         The default is text output to the shell -->
-                <!-- <speech type="cmdline" data="echo 'Fix the speech tag in navit.xml to let navit say:' '%s'" cps="15"/> -->
-                <!-- <speech type="cmdline" data="espeak -s 150 -v czech '%s' &amp;"/> -->
-                <!-- <speech type="cmdline" data="flite -t '%s'"/> -->
-                <!-- <speech type="cmdline" data="/usr/local/bin/say.sh '%s'"/> -->
-                <speech type="cmdline" data="espeak '%s' &amp;"/>
diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
deleted file mode 100644
index bdfbb4b62..000000000
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require navit.inc
-
-SRCREV = "5310"
-PV = "0.2.0+svnr${SRCPV}"
-PR = "${INC_PR}.3"
-
-S = "${WORKDIR}/${BPN}"
-SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;protocol=http \
-    file://freetype-include-path.patch \
-    file://configure.add.imlib2.option.patch \
-"
diff --git a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
deleted file mode 100644
index ebf65c7cc..000000000
--- a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Libsyncml is an implementation of the SyncML protocol"
-HOMEPAGE = "https://libsyncml.opensync.org/"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
-
-DEPENDS = "libxml2 glib-2.0 libsoup-2.4 openobex wbxml2"
-
-# Depends on openobex
-PNBLACKLIST[libsyncml] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libsyncml/libsyncml-${PV}.tar.gz"
-SRC_URI[md5sum] = "84879ed7cb94618530fbcb801a1a4f95"
-SRC_URI[sha256sum] = "05d6513637adb1300a3a58b6e29d53ab6373c8f370807d0d925bae72b2920e53"
-
-inherit cmake pkgconfig
-
-PACKAGES += "${PN}-tools"
-
-FILES_${PN}-tools = "${bindir}"
-FILES_${PN} = "${libdir}/*.so.*"
-- 
2.13.3


