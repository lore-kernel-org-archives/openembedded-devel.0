Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id BEEF671AD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 09:38:04 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id c7so96237868itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 01:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rse9l4YJuJdZ2RmEkO21XzM96N1k2FXyJCrNPTFrh1A=;
	b=i14D9s++ZaQqqTfmRx1Pz4MLaiPkr6Ic5UcyWjMpx5tMRXoWBEyGfxWLwkeFBH6fk1
	EjFEM4BT6wqhGkDOSP/oDk0Vyp3E9m5x+4uBTBV4kxDC1PACDklH9eHiN/P1EnwGzilP
	It3XESIBXeRGkvq5agjCNZC/ry0mkEITkw9Lci2L114CgIkirJiJSu/HBfPBlEsYbiks
	8KxVGT7tMWmDYIVVX1t/9WpLS43wg+4kS0hdumv8TXPGd36jtpETp6kp4/YGIdYeSGGy
	nnLLl7i/00tRBkmSB5HfnFUMdonLajF380/ZtpOrWOW2IU4ZHb6kTq/U/4mibDxRRqmJ
	Dasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rse9l4YJuJdZ2RmEkO21XzM96N1k2FXyJCrNPTFrh1A=;
	b=sIncONLy5SJFT1Vq/Pjsg4cJlVC5RZFiBnWk/Rduufy1fxdRrAHGysWc9FvYgFVgZX
	K2cWnXBYhAknbauN42IJ3e644O9Ax54tQFYtQyQfBCdPogFJxPBsXTJPXwfYzCTugRkB
	xIFFm/FC8mqhu2b6AkWA+5rpclt8mvSB2TO4khNE7vwtizfGV5yJB5B5kzJncxcVBY/S
	fzTSUD7RklYrKIy65EjpkhxldmUoCpF5fW4M1GYPvZcV1ayJZAhchqgq40yxUsk8q6a+
	m73Z4qjfm+9msP7EFArp+hl/g9n8A1Eml/znXMNfGFb291mwNyDFKeF4wuG82aeya8eR
	vQxA==
X-Gm-Message-State: AIkVDXIyQwp0TTx+tivPCFbmhAbKu0v7mDwH0RMRzSX1IrwGT6Vrf4rroUP3M59lhESVc1D6
X-Received: by 10.36.84.148 with SMTP id t142mr16388408ita.90.1486546684830;
	Wed, 08 Feb 2017 01:38:04 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DEB3.dip0.t-ipconnect.de.
	[93.232.222.179]) by smtp.gmail.com with ESMTPSA id
	x67sm11039035iod.22.2017.02.08.01.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 01:38:03 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 10:37:40 +0100
Message-Id: <31f647eda771fc7917c91de6d9d10f5ed41722ed.1486546542.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
Subject: [meta-oe][PATCH 3/4] lvm2: enable native compilation
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
X-List-Received-Date: Wed, 08 Feb 2017 09:38:04 -0000

Required for cryptsetup-native, which useful for setting up dm-verity
during a build.

"native-sdk" gets added just in case that this may also be used in an
SDK.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc         | 28 ++++++++++++++++----
 meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb |  2 +-
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 7bd26c0..333223a 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -1,6 +1,6 @@
 SECTION = "utils"
 DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
-DEPENDS = "udev"
+DEPENDS_append_class-target = " udev"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
@@ -16,11 +16,20 @@ S = "${WORKDIR}/LVM2.${PV}"
 
 inherit autotools-brokensep pkgconfig systemd
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+PACKAGECONFIG_class-target ??= " \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                    thin-provisioning-tools \
                    odirect \
 "
 
+# odirect is enabled by default also for native compilation because
+# there's currently a bug in lib/device/dev-io.c which prevents
+# compiling without it. It is better to stick to configurations that
+# were actually tested by upstream...
+PACKAGECONFIG ??= " \
+                   odirect \
+"
+
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
@@ -32,12 +41,9 @@ EXTRA_OECONF = "--with-user= \
                 --enable-realtime \
                 --enable-applib \
                 --enable-cmdlib \
-                --enable-udev_sync \
-                --enable-udev_rules \
                 --enable-pkgconfig \
                 --enable-dmeventd \
                 --enable-lvmetad \
-                --with-udev-prefix= \
                 --with-usrlibdir=${libdir} \
                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
                 --disable-thin_check_needs_check \
@@ -45,12 +51,24 @@ EXTRA_OECONF = "--with-user= \
                 --with-thin-dump=${sbindir}/thin_dump \
                 --with-thin-repair=${sbindir}/thin_repair \
                 --with-thin-restore=${sbindir}/thin_restore \
+                ${EXTRA_OECONF_UDEV} \
+"
+
+EXTRA_OECONF_UDEV = " \
+                --disable-udev_sync \
+                --disable-udev_rules \
+"
+EXTRA_OECONF_UDEV_class-target = " \
+                --enable-udev_sync \
+                --enable-udev_rules \
+                --with-udev-prefix= \
 "
 
 CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
 
 do_install_append() {
     # Install machine specific configuration file
+    install -d ${D}${sysconfdir}/lvm
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
     sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
index 8476b01..6983bca 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
@@ -4,3 +4,5 @@ SRC_URI[md5sum] = "c5a54ee0b86703daaad6e856439e115a"
 SRC_URI[sha256sum] = "e120b066b85b224552efda40204488c5123de068725676fd6e5c8bc655051b94"
 
 DEPENDS += "autoconf-archive"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
git-series 0.9.1

