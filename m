Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SA2qU-0008E5-3z
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 18:27:42 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so268005wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 10:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=5ySVFwzdvUwZ8oy0mBq5S0QAQlQH2ROjVObpVa6JGAo=;
	b=QrqE8B//5PtKN1/uwdFsDGT5bMQEI0uin4TkmY7VfzXO9X9D0V0E4+2/hGLq4XFqmD
	bPGGrnXydzzHj/Vapm6rzhFAueT9DHLXY1YFqeBvl26TWfPaKwKDpnsczZ0Fhicxpv4D
	kzL1opYs89+dKzZJyeeLp139MLAawhUhLk4ED6XtHQcAyGd1mzMISoLscThXwyT46ghN
	oK87yvTdypRLNx3MXjUk+Zk6UuRI+XhNUomhRQ/6YkI86uNe3HPRVeza22FqBqbjp1Qq
	lEWmt78htV21V/DGl+epCGDEiQfmdltldIR2VlmGFN30IRYzgbzsUjj2jyEyAFWnCrYF
	1kqg==
Received: by 10.216.144.210 with SMTP id n60mr519445wej.5.1332263931639;
	Tue, 20 Mar 2012 10:18:51 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n15sm35425198wiw.6.2012.03.20.10.18.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 10:18:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2012 18:18:38 +0100
Message-Id: <1332263919-19283-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmp3d9ehFNaYs+qQimXcSG1EbQ4CVccb9fZTgXbHSdFVJN9lT6tXwZ7a9AAYqSABM/vl6Ow
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 3/4] udev: remove 173
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
X-List-Received-Date: Tue, 20 Mar 2012 17:27:42 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/udev/udev_173.bb |  116 ---------------------------------
 1 files changed, 0 insertions(+), 116 deletions(-)
 delete mode 100644 meta-oe/recipes-core/udev/udev_173.bb

diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
deleted file mode 100644
index b7d7ed3..0000000
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ /dev/null
@@ -1,116 +0,0 @@
-DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
-/dev/, handles hotplug events and loads drivers at boot time. It replaces \
-the hotplug package and requires a kernel not older than 2.6.27."
-
-# udev 169 and up require kernel 2.6.36 for ARM: 
-# http://git.kernel.org/?p=linux/hotplug/udev.git;a=commit;h=67a77c8bf299f6264f001677becd056316ebce2f
-
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LICENSE_${PN} = "GPLv2+"
-LICENSE_libudev = "LGPLv2.1+"
-LICENSE_libgudev = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-# Needed for udev-extras
-DEPENDS = "gperf-native usbutils acl glib-2.0"
-
-PR = "r4"
-
-# version specific SRC_URI
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-           file://0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch \
-           file://gtk-doc.make"
-
-# generic SRC_URI
-SRC_URI += " \
-       file://touchscreen.rules \
-       file://modprobe.rules \
-       file://default \
-       file://init \
-       file://cache \
-"
-
-SRC_URI[md5sum] = "2afd20ee1c790eac6d7abe0498ebb414"
-SRC_URI[sha256sum] = "0f753ad9c3022a074d1c052bcee9139581db825283771ac78c0be0d1de109d0c"
-
-# Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
-
-inherit update-rc.d autotools
-
-EXTRA_OECONF += " \
-                  --disable-introspection \
-                  --with-pci-ids-path=/usr/share/misc \
-                  ac_cv_file__usr_share_pci_ids=no \
-                  ac_cv_file__usr_share_hwdata_pci_ids=no \
-                  ac_cv_file__usr_share_misc_pci_ids=yes \
-                  --sbindir=${base_sbindir} \
-                  --libexecdir=${base_libdir}/udev \
-                  --with-rootlibdir=${base_libdir} \
-                  --disable-gtk-doc-html \
-                  --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
-"
-
-do_configure_prepend() {
-	cp ${WORKDIR}/gtk-doc.make ${S}
-}
-
-INITSCRIPT_NAME = "udev"
-INITSCRIPT_PARAMS = "start 04 S ."
-
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit"
-
-FILES_${PN}-systemd = "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "udev"
-
-FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libgudev = "${base_libdir}/libgudev*.so.*"
-
-FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
-
-RPROVIDES_${PN} = "hotplug"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
-FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
-RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
-RRECOMMENDS_${PN} += "util-linux-blkid"
-
-# udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
-# is ${prefix}/lib64
-FILES_${PN} += "/lib/udev*"
-FILES_${PN}-dbg += "/lib/udev/.debug"
- 
-FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
-
-do_install () {
-	install -d ${D}${usrsbindir} \
-		   ${D}${sbindir}
-	oe_runmake 'DESTDIR=${D}' INSTALL=install install
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
-	install -m 0755 ${WORKDIR}/cache ${D}${sysconfdir}/init.d/udev-cache
-
-	install -d ${D}${sysconfdir}/default
-	install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/udev
-
-	install -m 0644 ${WORKDIR}/*.rules         ${D}${sysconfdir}/udev/rules.d/
-
-	touch ${D}${sysconfdir}/udev/saved.uname
-	touch ${D}${sysconfdir}/udev/saved.cmdline
-	touch ${D}${sysconfdir}/udev/saved.devices
-	touch ${D}${sysconfdir}/udev/saved.atags
-
-	# disable udev-cache sysv script on systemd installs
-	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/udev-cache.service
-}
-
-# Create the cache after checkroot has run
-pkg_postinst_udev_append() {
-	if test "x$D" != "x"; then
-		OPT="-r $D"
-	else
-		OPT="-s"
-	fi
-	update-rc.d $OPT udev-cache start 36 S .
-}
-- 
1.7.2.5



