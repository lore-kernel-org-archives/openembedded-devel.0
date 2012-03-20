Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SA2qY-0008Et-EK
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 18:27:46 +0100
Received: by wibhj13 with SMTP id hj13so4789106wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 10:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=e69R8Hfq/+lqGtfX77dnuT4JJlqlYhLOM+7ayYcltQ0=;
	b=PS0Qfav3ku++Z59UuG7miwxuqgs5V1lHa+kUyiV1FTrglfnIt9npRum0MJPfTEh8G8
	M+vLKfabtk5NktqKKVW3E9KlHpR3Rh/F8P/jQF7ppJ2jt6HfOYy1aUQLshTimdmKa8yC
	Fi1k52MUsSVcG72OedBT6ZfGAE5kZXXUXJTi53mLQUJRU09TQxno2fKg+ZbA5ORJxlVE
	js0iiruB5TfWe8Jv7O/Iha1Bd88lWomF6zJbupZIku6sKdx4T1wnJP72ukRwpHxxBbj2
	JYS88xgLpHVASib5LrRC9yiibnlpLlN0JabbLqKRC2mytnoSUWAeB9bpcNmt5WxoJaj8
	LCHg==
Received: by 10.180.8.164 with SMTP id s4mr1640158wia.6.1332263933950;
	Tue, 20 Mar 2012 10:18:53 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id o2sm8777487wiv.11.2012.03.20.10.18.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 10:18:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2012 18:18:39 +0100
Message-Id: <1332263919-19283-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn0wQ+tG4LCTsl+Am1Hi8Q30wod47UOKQPzFZ76UhpZwMWsSOcex5HunfjYGxAn8iy8Wrg1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 4/4] udev: remove 175
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
X-List-Received-Date: Tue, 20 Mar 2012 17:27:46 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/udev/udev_175.bb |   91 ---------------------------------
 1 files changed, 0 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-core/udev/udev_175.bb

diff --git a/meta-oe/recipes-core/udev/udev_175.bb b/meta-oe/recipes-core/udev/udev_175.bb
deleted file mode 100644
index e14dde2..0000000
--- a/meta-oe/recipes-core/udev/udev_175.bb
+++ /dev/null
@@ -1,91 +0,0 @@
-DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
-/dev/, handles hotplug events and loads drivers at boot time. It replaces \
-the hotplug package and requires a kernel not older than 2.6.27."
-
-DEFAULT_PREFERENCE = "-1"
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
-PR = "r1"
-
-# 6f410b81aa6d588b03ae795c9b76468591ef7efa -> 175 tag
-SRCREV = "6f410b81aa6d588b03ae795c9b76468591ef7efa"
-
-# version specific SRC_URI
-SRC_URI = "git://git.kernel.org/pub/scm/linux/hotplug/udev.git;protocol=git \
-           file://0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch \
-           file://gtk-doc.make"
-
-# generic SRC_URI
-SRC_URI += " \
-       file://touchscreen.rules \
-       file://modprobe.rules \
-"
-
-S = "${WORKDIR}/git"
-
-# Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
-
-inherit autotools
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
-
-	install -m 0644 ${WORKDIR}/*.rules         ${D}${sysconfdir}/udev/rules.d/
-}
-
-- 
1.7.2.5



