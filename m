Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 811A76011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 17:27:22 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id hh10so8431684pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JuaXdOblEhWnC4mNFg+5lmoZUr+yk0OF+mWQ/bdOggM=;
	b=rnpWqIkV/9er8PAKOwYEBlz2t/BIDLetWHGUqGoa2Orz5n+95E7A3exxWR7vHT5QLe
	VDD/YhOI5imd70uAsopejN3q1AmWf2VRji3Ar5InYWCHRrsgO7we9zb0LrvsOXT6nrUX
	NRuA3F8F92GqHNXAai2fBDGs2i/JuzCrqyDiURCY+eoKyxzaVJ0T8u3LRfjd26ap/u7D
	9fJzYpZ/0PwM+IeQTAHSbKXGj/wBAtywPns5mEBlM3TWRgnJLTeiPQuppok33+TCHaxl
	2TXLyzbdGvO6Ap33mVNs2XP7mE1qGLIqQuIGg3nnqyQjkE+rB2UdiXyA5zDy3Pej6Tqk
	Y/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JuaXdOblEhWnC4mNFg+5lmoZUr+yk0OF+mWQ/bdOggM=;
	b=GuPdn1kk3/Va19nwKipVZFDhXyJqe2gvSH7sgekTelZgnAmMaWoZtwQj4si/5SmBTG
	AxRfqTlJ4WMPcAWdCuvXrM+YLsGCbYH6hLuX3en8eF5TP6j0Ncb1MFsfwMbu6tUHnYCZ
	dax9rneeXFfHBfNAjr1/hCcJkxzScCrmXrXb6nZSHNKa31WNIBmy+N4Tz2+lVpfLz2oe
	/CJW6ALk7dgmiH69VuYkH05C6x/NF2sz9YOPZ5bHXXw/kei4WMxRUfjksY6RITT7C7c+
	7qyV0Ev46WaCmhwu/fST20id92ZMqapl/s2GyF2vSdSSwVVT1x+tY7zw5caJQcquhdqr
	Ojuw==
X-Gm-Message-State: AEkoouuHS74bOqjDqpiQ28s9oZAVRw89PZer+47Nz1i7CTb6q7x6WSzOjUZXfYIZQdrVug==
X-Received: by 10.66.87.6 with SMTP id t6mr43917019paz.141.1471886843594;
	Mon, 22 Aug 2016 10:27:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	l81sm28644144pfi.50.2016.08.22.10.27.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Aug 2016 10:27:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 10:27:16 -0700
Message-Id: <20160822172717.4479-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][PATCH 1/2] vboxguestdrivers: Add recipe for vbox 5.x
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
X-List-Received-Date: Mon, 22 Aug 2016 17:27:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../vboxguestdrivers/Makefile.utils                |  6 +-
 .../vboxguestdrivers/vboxguestdrivers_5.1.4.bb     | 65 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils
index 3749b95..495601f 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils
@@ -10,8 +10,10 @@
 ##
 ## -----------------------------------------------------------------------
 
-INCLUDES = -I. -I../vboxsf
-CFLAGS	 = ${INCLUDES}
+INCLUDES = -I. -I../vboxsf -I../vboxsf/include
+MOD_DEFS = -DRT_OS_LINUX -DIN_RING0 -DIN_RT_R0 \
+           -DIN_SUP_R0 -DVBOX -DVBOX_WITH_HGCM -DIN_MODULE -DIN_GUEST_R0
+CFLAGS	 = ${INCLUDES} ${MOD_DEFS}
 LDFLAGS	 =
 
 SRCS     = mount.vboxsf.c \
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
new file mode 100644
index 0000000..66068d1
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
@@ -0,0 +1,65 @@
+SUMMARY = "VirtualBox Linux Guest Drivers"
+SECTION = "core"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/${VBOX_NAME}/COPYING;md5=e197d5641bb35b29d46ca8c4bf7f2660"
+
+DEPENDS = "virtual/kernel"
+
+inherit module kernel-module-split
+
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
+
+VBOX_NAME = "VirtualBox-${PV}"
+
+SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
+           file://Makefile.utils \
+"
+SRC_URI[md5sum] = "e25a6a1f3c113c373dc0433f9c2526f3"
+SRC_URI[sha256sum] = "b9a14a7771059c55c44b97f8d4eef9bea84544f3e215e0caa563bc35e2f16aaf"
+
+S = "${WORKDIR}/vbox_module"
+
+export BUILD_TARGET_ARCH="${ARCH}"
+export BUILD_TARGET_ARCH_x86-64="amd64"
+export KERN_DIR="${STAGING_KERNEL_DIR}"
+
+addtask export_sources before do_patch after do_unpack
+
+do_export_sources() {
+    mkdir -p "${S}"
+    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules ${T}/vbox_modules.tar.gz
+    tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
+
+    # add a mount utility to use shared folder from VBox Addition Source Code
+    mkdir -p "${S}/utils"
+    install ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/sharedfolders/mount.vboxsf.c ${S}/utils
+    install ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/sharedfolders/vbsfmount.c ${S}/utils
+    install ${S}/../Makefile.utils ${S}/utils/Makefile
+
+}
+
+# compile and install mount utility
+do_compile_append() {
+    oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
+}
+
+module_do_install() {
+    MODULE_DIR=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/misc
+    install -d $MODULE_DIR
+    install -m 644 vboxguest.ko $MODULE_DIR
+    install -m 644 vboxsf.ko $MODULE_DIR
+    install -m 644 vboxvideo.ko $MODULE_DIR
+}
+
+do_install_append() {
+    install -d ${D}${base_sbindir}
+    install -m 755 ${S}/utils/mount.vboxsf ${D}${base_sbindir}
+}
+
+PACKAGES += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
+RRECOMMENDS_${PN} += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
+
+FILES_${PN} = "${base_sbindir}"
+
+# autoload if installed
+KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
-- 
2.9.3


