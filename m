Return-Path: <kirgene@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id BD2A260F50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 23:47:32 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id w7so4305465lbi.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EuoXLJO3PlWtinh4KJzl2K+MHUCa2cY+6tYSZC/D8Fw=;
	b=RDxaI5o4Fp24BOMcpQCtaXOOxAdhU/5SCFKP4ZvPExmTlLjTAYyzt0HXz3RIKFmVGs
	irw1NBeShm5ChrUH+4tVVp8fb59NMvM4D8RfMpgaTWA/dlkWCHnG5w37dSnITp7R08Xd
	1pj5udmy9A2jD83/4v8eGoahusZ8+cbiMPv1VekzB72wEKUTJouFzQB1U6/+1e7Chz4Y
	0R7ei1YmPjK0PARif5TD7IY7YwrIF5GlEToAOsjsqJJGe9Z20MjQPXsKDR7hOctGfIwP
	ED1zyBY84EoLoQT1pjD82Yf+X6H7LYs3+OXBv7fBFVixCGekljTPJlvYYS+eKb+QPXDF
	obWg==
X-Received: by 10.112.14.102 with SMTP id o6mr8742833lbc.28.1380066453585;
	Tue, 24 Sep 2013 16:47:33 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.4.18])
	by mx.google.com with ESMTPSA id
	ac2sm16911081lbc.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 16:47:32 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2013 02:47:20 +0300
Message-Id: <1380066440-53128-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH] usb-modeswitch: upgrade to upstream version.
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
X-List-Received-Date: Tue, 24 Sep 2013 23:47:33 -0000

Upgrade usb-modeswitch to v2.0.1.
Upgrade usb-modeswitch-data to v20130807.

Two patches were removed because changes that they provide are already exist.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 ...20121109.bb => usb-modeswitch-data_20130807.bb} |  4 +--
 ...usbmodeswitch-leave-stripping-to-packager.patch | 26 ---------------
 ...modeswitch-leave-script-munging-to-recipe.patch | 39 ----------------------
 .../usb-modeswitch/usb-modeswitch_1.2.5.bb         | 20 -----------
 .../usb-modeswitch/usb-modeswitch_2.0.1.bb         | 17 ++++++++++
 5 files changed, 19 insertions(+), 87 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20121109.bb => usb-modeswitch-data_20130807.bb} (74%)
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb
 create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
similarity index 74%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
index de81812..fc0fbfb 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit allarch
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV}.tar.bz2"
-SRC_URI[md5sum] = "a7d23a03157871013a0d708ab2b1b6df"
-SRC_URI[sha256sum] = "a74346a471d540ba9da7d7b332ad35ea05ff7375297c0da87da5be675293d5a5"
+SRC_URI[md5sum] = "91feff51deba6e48e78506b8f4db2274"
+SRC_URI[sha256sum] = "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5d94a4d35651699eb"
 
 do_install() {
     oe_runmake install DESTDIR=${D}
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch
deleted file mode 100644
index e51a89c..0000000
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4d3fb03d89f685e1fe1d4b544bcb1be04cbade6f Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 28 Jan 2012 10:16:24 +0100
-Subject: [PATCH] usbmodeswitch: leave stripping to packager
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
-
-Upstream-Status: Unknown
-
- Makefile |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 2072976..a71780a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -46,7 +46,7 @@
- 	cd jim && $(MAKE) distclean
- 
- install-common: all
--	install -D -s --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
-+	install -D --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
- 	install -D --mode=755 usb_modeswitch.sh $(UDEVDIR)/usb_modeswitch
- 	install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
- 	install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch
deleted file mode 100644
index 4f549fd..0000000
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 86f80442a3fb2b7f9bd1d4ba339fff967c04c3a7 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 28 Jan 2012 12:17:47 +0100
-Subject: [PATCH] usb-modeswitch: leave script munging to recipe
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
-
-Upstream-Status: Unknown
-
- Makefile |   13 +------------
- 1 files changed, 1 insertions(+), 12 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a71780a..a26b8de 100644
---- a/Makefile
-+++ b/Makefile
-@@ -51,20 +51,9 @@
- 	install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
- 	install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
- 	install -d $(DESTDIR)/var/lib/usb_modeswitch
--
--install-script:
--	@SHELL=`which tclsh 2>/dev/null`; \
--	if [ -z $$SHELL ]; then \
--		SHELL="`which jimsh 2>/dev/null`"; \
--		if [ -z $$SHELL ]; then \
--			echo "Warning: no Tcl interpreter found!"; \
--			SHELL="/usr/bin/tclsh"; \
--		fi \
--	fi ; \
--	sed 's_!/usr/bin/tclsh_!'"$$SHELL"'_' <usb_modeswitch.tcl >usb_modeswitch_dispatcher
- 	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
- 
--install: install-common install-script
-+install: install-common
- 
- install-shared: dispatcher-dynamic install-common
- 	install -D -s --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb
deleted file mode 100644
index fe6ea62..0000000
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "virtual/libusb0"
-
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${PV}.tar.bz2 \
-           file://0001-usbmodeswitch-leave-stripping-to-packager.patch \
-           file://0002-usb-modeswitch-leave-script-munging-to-recipe.patch"
-SRC_URI[md5sum] = "c393603908eceab95444c5bde790f6f0"
-SRC_URI[sha256sum] = "ce47a3dec3e4c93e0a2fcea64278d0e289e6e78d8e1381c54f03986e443ab90f"
-
-do_install() {
-    sed 's_!/usr/bin_!'"${bindir}"'_' <usb_modeswitch.tcl >usb_modeswitch_dispatcher
-    oe_runmake install DESTDIR=${D}
-}
-
-FILES_${PN} = "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
-RDEPENDS_${PN} = "tcl"
-RRECOMMENDS_${PN} = "usb-modeswitch-data"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
new file mode 100644
index 0000000..3485523
--- /dev/null
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit autotools
+
+DEPENDS = "libusb1"
+
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${PV}.tar.bz2"
+SRC_URI[md5sum] = "e48d4419d0574d342bb183f7465556d0"
+SRC_URI[sha256sum] = "4706c9cfe825263e189f55730ea3d1d8634aeb15645a1098532e946e770f7f95"
+
+EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
+
+FILES_${PN} = "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
+RDEPENDS_${PN} = "tcl"
+RRECOMMENDS_${PN} = "usb-modeswitch-data"
-- 
1.8.1.2


