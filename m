Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 04F1B73EFD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 01:24:57 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so87918356igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 18:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=l0CjLF/c2wW3G54Vw3rSxcx/wcoSMhEJjxRzEO0b3os=;
	b=qlCMoJBL1bVuxKEmWKPbhtzd/P59wyvDmGoH+ez1OySeEF2VfS4JDDK7lgZvXUekeu
	brQwi+pcmt2sZsxUQsT/y+gYVHkP9wJfAq2NFnysUaWVc3ivcGWR7n73c3QMSFlzpWDZ
	oYz8nujX4uFXqQMn7eDqG87piUTniY6xRsvbBS7uoqIOutqxXHhC1wIOa/Rf/k+c06vT
	fjnQdGKhPTJ6CmDms+1YbjyNRkBlcR1LKeG11vw1x1BCSgDqd8im/N2e4iJGRSwHAMho
	inIFYaTHWmbNWI45GvSQNcjTNYA1orDvsbi3nqKHg/9HF3+wDgG6WEhVSgTwq+I1lJei
	ZNuw==
X-Received: by 10.107.18.19 with SMTP id a19mr781898ioj.48.1431393899210;
	Mon, 11 May 2015 18:24:59 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id o15sm260770igw.11.2015.05.11.18.24.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 May 2015 18:24:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2015 18:24:53 -0700
Message-Id: <1431393894-20809-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 7/9 V2] obex, gnome-bluetooth: Make bluez{4, 5} dep conditional on DISTRO_FEATURE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 01:25:00 -0000

bluez4 is removed from oe-core

This helps in compiling them when distro features are either set to use
bluez4 or bluez5

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb                 | 6 ++----
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb | 5 ++---
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb        | 6 ++----
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb                  | 6 +++---
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index 6058b04..6096bed 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -1,13 +1,11 @@
 SUMMARY = "OBEX Server and Client"
 # obexd was integrated into bluez5
-DEPENDS = "glib-2.0 dbus bluez4 libical"
-RCONFLICTS_${PN} = "bluez5"
+DEPENDS = "glib-2.0 dbus libical"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-PNBLACKLIST[obexd] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
            file://ssize_t_definition.patch \
 "
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 9a63b38..9edceb5 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 PR = "r1"
 
 SECTION = "x11/gnome"
-DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi intltool-native"
-
-PNBLACKLIST[gnome-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify gnome-keyring virtual/libx11 libxi intltool-native"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 
 inherit gnomebase gtk-icon-cache
 
diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index 99448d0..c2c284e 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -2,10 +2,8 @@ DESCRIPTION = "obex-data-server is a D-Bus service providing high-level OBEX cli
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ bluez4 dbus-glib imagemagick openobex"
-RCONFLICTS_${PN} = "bluez5"
-
-PNBLACKLIST[obex-data-server] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+DEPENDS = "gtk+ dbus-glib imagemagick openobex"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 
 SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
 SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
index ed3d6b2..6ac7905 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "The Openobex project is an open source implementation of the \
 Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
-DEPENDS = "virtual/libusb0 bluez4"
+DEPENDS = "virtual/libusb0"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
 
-PNBLACKLIST[openobex] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
            file://disable-cable-test.patch \
            file://libusb_crosscompile_check.patch \
-- 
2.1.4


