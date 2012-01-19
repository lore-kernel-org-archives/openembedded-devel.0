Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnroC-0003Rd-1e
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 14:13:40 +0100
Received: by wibhr14 with SMTP id hr14so1427147wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 05:06:00 -0800 (PST)
Received: by 10.180.100.100 with SMTP id ex4mr16194474wib.19.1326978360610;
	Thu, 19 Jan 2012 05:06:00 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id df2sm20263985wib.4.2012.01.19.05.05.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jan 2012 05:05:59 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2012 14:05:52 +0100
Message-Id: <1326978353-5558-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] udev: add 177
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
X-List-Received-Date: Thu, 19 Jan 2012 13:13:40 -0000

* 'udevadm' moved to ${PN} avoiding the need for the udev-utils package to be installed, so 'udev' has all the needed programs by itself.
* 'blkid' isn't needed anymore, since 176 udev links against libblkid
* 'modprobe' and 'depmod' aren't needed anymore, udev now links against libkmod
* The entire source including the license files were re-indented hence the LIC_FILES_CHKSUM changes

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/udev/udev_177.bb |   88 +++++++++++++++++++++++++++++++++
 1 files changed, 88 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-core/udev/udev_177.bb

diff --git a/meta-oe/recipes-core/udev/udev_177.bb b/meta-oe/recipes-core/udev/udev_177.bb
new file mode 100644
index 0000000..de1ea6c
--- /dev/null
+++ b/meta-oe/recipes-core/udev/udev_177.bb
@@ -0,0 +1,88 @@
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
+                  --disable-gtk-doc-html \
+                  --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+"
+
+do_configure_prepend() {
+	cp ${WORKDIR}/gtk-doc.make ${S}
+}
+
+PACKAGES =+ "${PN}-systemd libudev libgudev udev-consolekit"
+
+FILES_${PN}-systemd = "${base_libdir}/systemd"
+RDEPENDS_${PN}-systemd += "udev"
+# udev-adm is now in ${PN}
+RREPLACES_${PN} = "udev-utils"
+
+FILES_libudev = "${base_libdir}/libudev.so.*"
+FILES_libgudev = "${base_libdir}/libgudev*.so.*"
+
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



