Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id DC0806017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2015 07:34:01 +0000 (UTC)
Received: by widex7 with SMTP id ex7so19377601wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GL6BCOC6Pv8N6hJL+i/icJC9AXNHec3TMPC/xzprK7M=;
	b=KmDGtPouRcEUJ9MUuHb8rqSq8KhYZxx+HjERxf9miXh4Zed4oRwVI9B2YGJLV65IIc
	lPwMsgIx/fYenI7ZkXtFcz01+yCNY04HCOTF4sHwwe34LVClFiJkjcjwqcvhunFx/z61
	BdqhTg4pmLmnVubkL+kSWa0+w0Z3EVobDZGCjrhKzuHS/aL5N7Tu785qxJggpNkJNQES
	44N8K6IIVvomYa8Vb0oG8BV70gB5mHNzOYiDGYzsiL05IPVgHbd3seCM3b+vWkgGiIAY
	OP5UU36cY4GehoazqCYCDyARQwKf9T+R22VBhXBb2Jwn1BtfL0aaGmq2nTHkmppauFC3
	NHjQ==
X-Received: by 10.194.220.7 with SMTP id ps7mr67858338wjc.84.1425368042392;
	Mon, 02 Mar 2015 23:34:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id q10sm1056wjr.41.2015.03.02.23.34.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 23:34:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Mar 2015 08:34:00 +0100
Message-Id: <1425368040-4427-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-oe][PATCHv2] vboxguestdrivers: import recipe from meta-luneos
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
X-List-Received-Date: Tue, 03 Mar 2015 07:34:08 -0000

* useful to run our qemu* builds inside VirtualBox

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vboxguestdrivers/Makefile.utils                | 43 ++++++++++++++
 .../vboxguestdrivers/vboxguestdrivers_4.3.22.bb    | 65 ++++++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.22.bb

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils
new file mode 100644
index 0000000..3749b95
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils
@@ -0,0 +1,43 @@
+## -----------------------------------------------------------------------
+##
+##   Copyright 2001-2008 H. Peter Anvin - All Rights Reserved
+##
+##   This program is free software; you can redistribute it and/or modify
+##   it under the terms of the GNU General Public License as published by
+##   the Free Software Foundation, Inc., 53 Temple Place Ste 330,
+##   Boston MA 02111-1307, USA; either version 2 of the License, or
+##   (at your option) any later version; incorporated herein by reference.
+##
+## -----------------------------------------------------------------------
+
+INCLUDES = -I. -I../vboxsf
+CFLAGS	 = ${INCLUDES}
+LDFLAGS	 =
+
+SRCS     = mount.vboxsf.c \
+           vbsfmount.c
+
+OBJS	 = $(patsubst %.c,%.o,$(notdir $(SRCS)))
+
+.SUFFIXES: .c .o .i .s .S
+
+
+all: mount.vboxsf
+
+clean:
+	-rm -f *.o mount.vboxsf
+
+spotless: clean
+	-rm -f *~
+
+mount.vboxsf: $(OBJS)
+	$(CC) $(LDFLAGS) -o $@ $^
+
+%.o: %.c
+	$(CC) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
+%.i: %.c
+	$(CC) $(UMAKEDEPS) $(CFLAGS) -E -o $@ $<
+%.s: %.c
+	$(CC) $(UMAKEDEPS) $(CFLAGS) -S -o $@ $<
+
+-include .*.d *.tmp
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.22.bb
new file mode 100644
index 0000000..46a7be1
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.22.bb
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
+SRC_URI[md5sum] = "fc21ecc1044dc13cd6c6b601823c6df3"
+SRC_URI[sha256sum] = "0d41e044589d3371f765a98ddc071d9cf9788289f72b7efbb5db64f5488c8eba"
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
+    oe_runmake -C ${S}/utils
+}
+
+module_do_install() {
+    MODULE_DIR=${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/misc
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
2.3.1


