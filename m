Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RoB9O-0008Cg-IY
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 10:52:50 +0100
Received: by wgbdt11 with SMTP id dt11so297314wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 01:45:09 -0800 (PST)
Received: by 10.180.93.193 with SMTP id cw1mr50631368wib.5.1327052709898;
	Fri, 20 Jan 2012 01:45:09 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fd1sm32833977wib.0.2012.01.20.01.45.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 01:45:09 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2012 10:44:52 +0100
Message-Id: <1327052692-27694-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2][meta-oe] udev: add 177
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
X-List-Received-Date: Fri, 20 Jan 2012 09:52:51 -0000

* 'blkid' isn't needed anymore, since 176 udev links against libblkid
* 'modprobe' and 'depmod' aren't needed anymore, udev now links against libkmod
* The entire source including the license files were re-indented hence the LIC_FILES_CHKSUM changes

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...-generation-it-depends-on-a-working-docto.patch |   45 ++++++++++
 meta-oe/recipes-core/udev/udev_177.bb              |   90 ++++++++++++++++++++
 2 files changed, 135 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-core/udev/udev-177/0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch
 create mode 100644 meta-oe/recipes-core/udev/udev_177.bb

diff --git a/meta-oe/recipes-core/udev/udev-177/0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch b/meta-oe/recipes-core/udev/udev-177/0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch
new file mode 100644
index 0000000..26a4c67
--- /dev/null
+++ b/meta-oe/recipes-core/udev/udev-177/0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch
@@ -0,0 +1,45 @@
+From bd4622e8bf5a4b4838ba58d9f9d6132265a3b709 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 16 May 2011 14:11:01 +0200
+Subject: [PATCH] rip put doc generation, it depends on a working doctools setup
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ Makefile.am |   21 +--------------------
+ 1 files changed, 1 insertions(+), 20 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3271bdb..9c8f0e2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -264,26 +264,7 @@ if HAVE_XSLTPROC
+ # ------------------------------------------------------------------------------
+ # udev man pages
+ # ------------------------------------------------------------------------------
+-dist_man_MANS += \
+-	src/udev.7 \
+-	src/udevadm.8 \
+-	src/udevd.8
+-
+-dist_noinst_DATA = \
+-	src/udev.html \
+-	src/udevadm.html \
+-	src/udevd.html
+-
+-EXTRA_DIST += \
+-	src/udev.xml \
+-	src/udevadm.xml \
+-	src/udevd.xml
+-
+-src/%.7 src/%.8 : src/%.xml
+-	$(AM_V_GEN)$(XSLTPROC) -o $@ -nonet http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl $<
+-
+-src/%.html : src/%.xml
+-	$(AM_V_GEN)$(XSLTPROC) -o $@ -nonet http://docbook.sourceforge.net/release/xsl/current/xhtml-1_1/docbook.xsl $<
++dist_man_MANS =
+ endif
+ 
+ # ------------------------------------------------------------------------------
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-core/udev/udev_177.bb b/meta-oe/recipes-core/udev/udev_177.bb
new file mode 100644
index 0000000..55a9ea3
--- /dev/null
+++ b/meta-oe/recipes-core/udev/udev_177.bb
@@ -0,0 +1,90 @@
+DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
+/dev/, handles hotplug events and loads drivers at boot time."
+
+DEFAULT_PREFERENCE = "-1"
+
+# udev 169 and up require kernel 2.6.36 for ARM: 
+# http://git.kernel.org/?p=linux/hotplug/udev.git;a=commit;h=67a77c8bf299f6264f001677becd056316ebce2f
+
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE_${PN} = "GPLv2+"
+LICENSE_libudev = "LGPLv2.1+"
+LICENSE_libgudev = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://src/COPYING;md5=17c4e5fb495e6707ac92a3864926f979 \
+                    file://src/extras/gudev/COPYING;md5=fb494485a7d0505308cb68e4997cc266"
+
+# glib-2.0: Needed for udev-extras
+# util-linux: Needed for libblkid
+# kmod: needed for libkmod
+DEPENDS = "gperf-native usbutils acl glib-2.0 util-linux kmod"
+
+# 1305ffe0456cc016a78c1fc7ca17645cfef39778 -> 177 tag
+SRCREV = "1305ffe0456cc016a78c1fc7ca17645cfef39778"
+
+# version specific SRC_URI
+SRC_URI = "git://git.kernel.org/pub/scm/linux/hotplug/udev.git;protocol=git \
+           file://0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch \
+           file://gtk-doc.make"
+
+# generic SRC_URI
+SRC_URI += " \
+       file://touchscreen.rules \
+       file://modprobe.rules \
+"
+
+S = "${WORKDIR}/git"
+
+# Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
+
+inherit autotools
+
+EXTRA_OECONF += " \
+                  --disable-introspection \
+                  --with-pci-ids-path=/usr/share/misc \
+                  ac_cv_file__usr_share_pci_ids=no \
+                  ac_cv_file__usr_share_hwdata_pci_ids=no \
+                  ac_cv_file__usr_share_misc_pci_ids=yes \
+                  --sbindir=${base_sbindir} \
+                  --libexecdir=${base_libdir} \
+                  --with-rootlibdir=${base_libdir} \
+                  --with-rootprefix= \
+                  --disable-gtk-doc-html \
+                  --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+"
+
+do_configure_prepend() {
+	cp ${WORKDIR}/gtk-doc.make ${S}
+}
+
+PACKAGES =+ "${PN}-systemd libudev libgudev udev-consolekit udev-utils"
+
+FILES_${PN}-systemd = "${base_libdir}/systemd"
+RDEPENDS_${PN}-systemd += "udev"
+
+FILES_libudev = "${base_libdir}/libudev.so.*"
+FILES_libgudev = "${base_libdir}/libgudev*.so.*"
+
+RDEPENDS_${PN} += "udev-utils"
+RPROVIDES_${PN} = "hotplug"
+FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
+FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
+
+# udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
+# is ${prefix}/lib64
+FILES_${PN} += "/lib/udev*"
+FILES_${PN}-dbg += "/lib/udev/.debug"
+
+FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
+RDEPENDS_${PN}-consolekit += "consolekit"
+
+FILES_udev-utils = "${bindir}/udevadm"
+
+do_install () {
+	install -d ${D}${usrsbindir} \
+		   ${D}${sbindir}
+	oe_runmake 'DESTDIR=${D}' INSTALL=install install
+
+	install -m 0644 ${WORKDIR}/*.rules         ${D}${sysconfdir}/udev/rules.d/
+}
+
-- 
1.7.2.5



