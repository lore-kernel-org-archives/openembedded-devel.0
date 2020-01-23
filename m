Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94FAF7FD7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:31:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00NMVAGB015544
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:31:31 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 23 Jan 2020 14:31:07 -0800
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 55D1EC60148;
	Thu, 23 Jan 2020 14:31:07 -0800 (PST)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jan 2020 14:31:07 -0800
Message-ID: <20200123223107.64233-2-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200123223107.64233-1-jason.wessel@windriver.com>
References: <20200123223107.64233-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC PATCH 2/2] vboxguestdrivers: Add vboxguestclient package
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
X-List-Received-Date: Thu, 23 Jan 2020 22:31:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch adds the vboxguestclient package, which installs all the
VirtualBox services that you would normally get if you inserted the
guest additions ISO and and attempted to run the shell script which
requires kernel module compilation etc...

The VirtualBox guest clients allows for the Xserver to be resized, cut
and paste integration as well as automated focus capture to all work
properly.

By installing the binaries from the ISO, the booted VM doesn't need a
compiler or the kernel headers in order to run the typical guest
additional install process.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../vboxguestdrivers/vboxadd-service.service  | 21 ++++++
 .../vboxguestdrivers/vboxadd.service          | 21 ++++++
 .../vboxguestdrivers_6.1.2.bb                 | 66 +++++++++++++++----
 3 files changed, 95 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/vboxadd-service.service
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/vboxadd.service

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/vboxadd-service.service b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/vboxadd-service.service
new file mode 100644
index 000000000..5949b2ec0
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/vboxadd-service.service
@@ -0,0 +1,21 @@
+[Unit]
+SourcePath=/usr/share/vbox/init/vboxadd-service
+Description=
+Before=runlevel2.target runlevel3.target runlevel4.target runlevel5.target shutdown.target
+After=vboxadd.service
+Conflicts=shutdown.target systemd-timesyncd.service
+
+[Service]
+Environment="INSTALL_NO_MODULE_BUILDS=1"
+Type=forking
+Restart=no
+TimeoutSec=5min
+IgnoreSIGPIPE=no
+KillMode=process
+GuessMainPID=no
+RemainAfterExit=yes
+ExecStart=/usr/share/vbox/init/vboxadd-service start
+ExecStop=/usr/share/vbox/init/vboxadd-service stop
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/vboxadd.service b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/vboxadd.service
new file mode 100644
index 000000000..47ee92c6b
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/vboxadd.service
@@ -0,0 +1,21 @@
+[Unit]
+SourcePath=/usr/share/vbox/init/vboxadd
+Description=
+Before=runlevel2.target runlevel3.target runlevel4.target runlevel5.target shutdown.target display-manager.service
+After=
+Conflicts=shutdown.target
+
+[Service]
+Environment="INSTALL_NO_MODULE_BUILDS=1"
+Type=oneshot
+Restart=no
+TimeoutSec=5min
+IgnoreSIGPIPE=no
+KillMode=process
+GuessMainPID=no
+RemainAfterExit=yes
+ExecStart=/usr/share/vbox/init/vboxadd start
+ExecStop=/usr/share/vbox/init/vboxadd stop
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb
index 62c2b509f..0895b8cde 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb
@@ -3,36 +3,52 @@ SECTION = "core"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/${VBOX_NAME}/COPYING;md5=e197d5641bb35b29d46ca8c4bf7f2660"
 
-DEPENDS = "virtual/kernel"
+DEPENDS = "virtual/kernel xorriso-native"
 
-inherit module kernel-module-split
+inherit module kernel-module-split systemd
+
+INSANE_SKIP_${PN}_append = " already-stripped"
+INSANE_SKIP_vboxguestclient_append = " ldflags"
 
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
 
 VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
+    http://download.virtualbox.org/virtualbox/${PV}/VBoxGuestAdditions_${PV}.iso;name=iso \
     file://Makefile.utils \
+    file://vboxadd.service \
+    file://vboxadd-service.service \
 "
 SRC_URI[md5sum] = "f4f42fd09857556b04b803fb99cc6905"
 SRC_URI[sha256sum] = "4326576e8428ea3626194fc82646347576e94c61f11d412a669fc8a10c2a1e67"
 
+SRC_URI[iso.md5sum] = "85a1ecad6dade9f22ea0b94556b96898"
+SRC_URI[iso.sha256sum] = "d1238cf34b0083264215ccdccfbca3adbbcf6ce7f30e33e04efed17c9260f068"
+
 S = "${WORKDIR}/vbox_module"
 
 export BUILD_TARGET_ARCH="${ARCH}"
 export BUILD_TARGET_ARCH_x86-64="amd64"
 
-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1"
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'"
 
-# otherwise 5.2.22 builds just vboxguest
+# otherwise 6.1.x builds just vboxguest
 MAKE_TARGETS = "all"
 
-addtask export_sources after do_patch before do_configure
+addtask export_sources before do_patch after do_unpack
+
+do_export_sources[depends] = "xorriso-native:do_populate_sysroot"
 
 do_export_sources() {
-    mkdir -p "${S}"
-    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules.sh ${T}/vbox_modules.tar.gz
-    tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
+    # allow this to re-run with the rm -rf
+    rm -rf ${WORKDIR}/iso ${WORKDIR}/iso.ex ${S} ${S}.tmp
+    mkdir -p "${S}" "${S}.tmp"
+    xorriso -osirrox on -indev ${WORKDIR}/VBoxGuestAdditions_${PV}.iso -extract / ${WORKDIR}/iso
+    chmod -R u+w ${WORKDIR}/iso
+    ${WORKDIR}/iso/VBoxLinuxAdditions.run --noexec --target ${WORKDIR}/iso.ex
+    tar -C ${S}.tmp -xf ${WORKDIR}/iso.ex/VBoxGuestAdditions-amd64.tar.bz2
+    mv ${S}.tmp/src/vboxguest*/* ${S}
 
     # add a mount utility to use shared folder from VBox Addition Source Code
     mkdir -p "${S}/utils"
@@ -49,9 +65,8 @@ do_configure_prepend() {
     ln -snf ${STAGING_KERNEL_DIR} ${WORKDIR}/${KERNEL_VERSION}/build
 }
 
-# compile and install mount utility
-do_compile() {
-    oe_runmake all
+# compile and install mount utility and VBoxClient
+do_compile_append() {
     oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
     if ! [ -e vboxguest.ko -a -e vboxsf.ko -a -e vboxvideo.ko ] ; then
         echo "ERROR: One of vbox*.ko modules wasn't built"
@@ -70,12 +85,37 @@ module_do_install() {
 do_install_append() {
     install -d ${D}${base_sbindir}
     install -m 755 ${S}/utils/mount.vboxsf ${D}${base_sbindir}
+
+    install -d ${D}${base_bindir}
+    install -d ${D}${datadir}/vbox/init/
+    install -d ${D}${datadir}/vbox/other/
+    install -d ${D}${systemd_unitdir}/system
+    install -m 755 ${S}.tmp/bin/VBoxClient ${D}${base_bindir}
+    install -m 755 ${S}.tmp/bin/VBoxControl ${D}${base_bindir}
+    install -m 755 ${S}.tmp/sbin/VBoxService ${D}${base_sbindir}
+    install -m 755 ${S}.tmp/init/vboxadd ${D}${datadir}/vbox/init/
+    install -m 755 ${S}.tmp/init/vboxadd-service ${D}${datadir}/vbox/init/
+    install -m 755 ${S}.tmp/init/vboxadd-x11 ${D}${datadir}/vbox/init/
+    install -m 644 ${WORKDIR}/vboxadd.service ${D}${systemd_unitdir}/system/
+    install -m 644 ${WORKDIR}/vboxadd-service.service ${D}${systemd_unitdir}/system/
+    cp ${S}.tmp/other/* ${D}${datadir}/vbox/other/
+    install -d ${D}/var/lib/VBoxGuestAdditions
+    echo "INSTALL_VER='${PV}'" > ${D}/var/lib/VBoxGuestAdditions/config
+    echo "INSTALL_DIR='${datadir}/vbox/'" >> ${D}/var/lib/VBoxGuestAdditions/config
 }
 
-PACKAGES += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
+PACKAGES += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo vboxguestclient"
 RRECOMMENDS_${PN} += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
 
-FILES_${PN} = "${base_sbindir}"
+RDEPENDS_vboxguestclient = "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
+
+FILES_vboxguestclient = "${base_bindir}/VBoxClient ${base_bindir}/VBoxControl \
+  ${base_sbindir}/vbox-greeter ${base_sbindir}/VBoxService ${datadir}/vbox \
+  ${systemd_unitdir}/system \
+  /var/lib/VBoxGuestAdditions"
+FILES_${PN} = "${base_sbindir}/mount.vboxsf"
+
+SYSTEMD_SERVICE_${PN} = "vboxadd-service.service vboxadd.service"
 
 # autoload if installed
 KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
-- 
2.23.0


