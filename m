Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SA2qT-0008E5-Li
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 18:27:41 +0100
Received: by wera1 with SMTP id a1so268005wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 10:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Dggxv5et5Mx3bld1baw4Grr9N75BwmDWqqL5u2Uvf+M=;
	b=QR4HVJEQ2pzUqFnOmTZXgZwHOxQ5sigLLvpD73rSzg/QAOs+F1M1Y8Ei4iI+txfAWR
	hylnAWN5prXRehpETmhxDSrFyFrSktjO5ARpfLf/1Y7M/VHczo/j4z65rh+o+G1yCBMY
	Rt4TSH8IOTDY5VqPVXdRjKG/oas09QNZGObM8a7h3QTA2ycz5opf2CqK4uqlF51vLtp7
	WM4FY/G+E7TrwAI9mRGVF68Kpb9WXC4CbIbINWIvCn9ICIL2ALue7dJPJYv7duQrvAlb
	xZrNP+b6v5k5ATg3gbRVdgEBuRJd4aTyJigVLxpvB1jbbfxYcBOPYpjJ+6Og3H+g3wpG
	NwJg==
Received: by 10.180.80.35 with SMTP id o3mr1658718wix.5.1332263928917;
	Tue, 20 Mar 2012 10:18:48 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n15sm35425107wiw.6.2012.03.20.10.18.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 10:18:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2012 18:18:37 +0100
Message-Id: <1332263919-19283-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmMPiEn93zZ5CpNLtWIUc6MlisUbJ5C9Ov+MR6WtMkyvOz31WAT/Jw90USV88jUgk1ufSUB
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 2/4] udev: update to 182
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
X-List-Received-Date: Tue, 20 Mar 2012 17:27:41 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/udev/udev_181.bb |   89 ---------------------------------
 meta-oe/recipes-core/udev/udev_182.bb |   84 +++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 89 deletions(-)
 delete mode 100644 meta-oe/recipes-core/udev/udev_181.bb
 create mode 100644 meta-oe/recipes-core/udev/udev_182.bb

diff --git a/meta-oe/recipes-core/udev/udev_181.bb b/meta-oe/recipes-core/udev/udev_181.bb
deleted file mode 100644
index 9ca91bf..0000000
--- a/meta-oe/recipes-core/udev/udev_181.bb
+++ /dev/null
@@ -1,89 +0,0 @@
-DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
-/dev/, handles hotplug events and loads drivers at boot time."
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
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/COPYING;md5=17c4e5fb495e6707ac92a3864926f979 \
-                    file://src/extras/gudev/COPYING;md5=fb494485a7d0505308cb68e4997cc266"
-
-# glib-2.0: Needed for udev-extras
-# util-linux: Needed for libblkid
-# kmod: needed for libkmod
-DEPENDS = "gperf-native usbutils acl glib-2.0 util-linux kmod"
-
-PR = "r1"
-
-# version specific SRC_URI
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/${P}.tar.gz \
-           file://gtk-doc.make"
-
-SRC_URI[md5sum] = "86fed9d76060c8157e550ca1b4ee3250"
-SRC_URI[sha256sum] = "b4b0fb6553926bb83ff43b65df44f29a3bce0980a970bcc4a80d5e4f81946f30"
-
-# generic SRC_URI
-SRC_URI += " \
-       file://touchscreen.rules \
-       file://modprobe.rules \
-"
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
-                  --libexecdir=${base_libdir} \
-                  --with-rootlibdir=${base_libdir} \
-                  --with-rootprefix= \
-                  --disable-gtk-doc-html \
-                  --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
-"
-
-do_configure_prepend() {
-	cp ${WORKDIR}/gtk-doc.make ${S}
-}
-
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-consolekit udev-utils"
-
-FILES_${PN}-systemd = "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "udev"
-
-FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libgudev = "${base_libdir}/libgudev*.so.*"
-
-RDEPENDS_${PN} += "udev-utils"
-RPROVIDES_${PN} = "hotplug"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
-FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
-
-# udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
-# is ${prefix}/lib64
-FILES_${PN} += "/lib/udev*"
-FILES_${PN}-dbg += "/lib/udev/.debug"
-
-FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
-
-FILES_udev-utils = "${bindir}/udevadm"
-
-do_install () {
-	install -d ${D}${usrsbindir} \
-		   ${D}${sbindir}
-	oe_runmake 'DESTDIR=${D}' INSTALL=install install
-
-	install -m 0644 ${WORKDIR}/*.rules         ${D}${sysconfdir}/udev/rules.d/
-}
-
diff --git a/meta-oe/recipes-core/udev/udev_182.bb b/meta-oe/recipes-core/udev/udev_182.bb
new file mode 100644
index 0000000..a7bf068
--- /dev/null
+++ b/meta-oe/recipes-core/udev/udev_182.bb
@@ -0,0 +1,84 @@
+DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
+/dev/, handles hotplug events and loads drivers at boot time."
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
+                    file://src/gudev/COPYING;md5=fb494485a7d0505308cb68e4997cc266"
+
+# glib-2.0: Needed for udev-extras
+# util-linux: Needed for libblkid
+# kmod: needed for libkmod
+DEPENDS = "gperf-native usbutils acl glib-2.0 util-linux kmod"
+
+# version specific SRC_URI
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/${P}.tar.gz \
+           file://gtk-doc.make"
+SRC_URI[md5sum] = "1b964456177fbf48023dfee7db3a708d"
+SRC_URI[sha256sum] = "7857ed19fafd8f3ca8de410194e8c7336e9eb8a20626ea8a4ba6449b017faba4"
+
+# generic SRC_URI
+SRC_URI += " \
+       file://touchscreen.rules \
+       file://modprobe.rules \
+"
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
+RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
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



