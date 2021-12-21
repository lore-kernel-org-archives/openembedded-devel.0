Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F599C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 21:44:25 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.11636.1640123063706031318
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 13:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c8bX8LOY;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id p8so476549ljo.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 13:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7UhNcXJ21FjT1eMiRsOQsd0tlr7NLIC+4vBtFps8T8=;
        b=c8bX8LOY84ag3bxWH65O/k+GrpxDeHC5oQ3pzncXuTDpu+YYUV9LvSwNgIcI8DISIk
         sTl5MxzRBPRrU3/8doBYQnXNiLpmp088KzXYQOyQpvGoPdIStmsc/0XJljNYc3OMl33d
         aY+nnzV38coDDfNBpIyvWui8QrKusAP02q3PAvCuTFVPR7Jw7SKJxw5Z54R0gJPU1zLE
         Kri3F/CY878aaq+p/ioAI3TjpOcoiJ0pejQb8HumrIod515SL9bIzf7WuXG2uVFDMdUR
         BgCrB5SHwvAWS7FrmDrAEK5X1CXPrmzUOs9fAz1uRrgtiJkKCL244ZgttFLEXN06fdTi
         QSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7UhNcXJ21FjT1eMiRsOQsd0tlr7NLIC+4vBtFps8T8=;
        b=Gs7fofQhu+viphRtkoKgSg+gR3oqPEQ2h2pKE+zXcp4W9t5a7QGWpPCigbUEKDFUgo
         3oQJdxmc7l4t3GEtdVjvTz9slWaScAALr2buUN1y2Kun93+tbV7we/3SPp/bY/JC22c8
         Vgv4R0dHXtWgGg4PFhDJwOvVFQuv+NTIej1go7DYdSG4zaBvWnYcqZZdlmiqrDC84ANx
         4L/qPtrt/GP1ziaoDzs9XOxXwmXncLULVw//AzDPAxEDVCCfB5HNQvWJ+XomXC9y61g1
         shR3v8T7mZfWAUNHXjD9D2U0tgS0PFra5UZatdk4QAz9RZPbQosyPN565u0JcfnBOVnw
         7gJw==
X-Gm-Message-State: AOAM5323XoYqQqgrj/q0qwFRptWcPt90JTnaaOdnBQ7tmX1+uHJxIyA+
	UYHS5KnzOn1Ra6TY4dmVVv7gop59CSv9Cw==
X-Google-Smtp-Source: 
 ABdhPJy4cA1dToxDqOQFHoogBTeoMHZnGh/yFQokOE1LBIs/Xuzn44d4egZzwJ6iZZvYcMGSkRcRTA==
X-Received: by 2002:a2e:9056:: with SMTP id n22mr224068ljg.127.1640123061453;
        Tue, 21 Dec 2021 13:44:21 -0800 (PST)
Received: from nova.home (2-108-107-206-static.dk.customer.tdc.net.
 [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id h8sm18867lfu.250.2021.12.21.13.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 13:44:21 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <clst@ambu.com>
Subject: [meta-oe][PATCH] Added usbip-tools for kernel USB/IP
Date: Tue, 21 Dec 2021 22:44:18 +0100
Message-Id: <20211221214418.1877658-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 21:44:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94468

From: Claus Stovgaard <clst@ambu.com>

Userspace tool from the kernel. Used for control the client/server of
USB/IP. The server expect USB devices and the client import them on the
client machine. Making it look like a device is physical connected to
the client, even though it is physical connected to the server.

Signed-off-by: Claus Stovgaard <clst@ambu.com>
---
 .../recipes-kernel/usbip-tools/usbip-tools.bb | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb

diff --git a/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb b/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
new file mode 100644
index 000000000..a2b0dea55
--- /dev/null
+++ b/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
@@ -0,0 +1,69 @@
+# Recipe for building userspace part of USB/IP
+#
+# Started with work from chuck kamas - 2021-11-05
+# https://lists.yoctoproject.org/g/yocto/topic/86249103?p=,,,20,0,0,0::recentpostdate/sticky,,,20,0,0,86249103
+# Though have rewritten all the logic to be much simpler
+#
+# SPDX-License-Identifier: MIT
+#
+# Author(s)
+#   clst@ambu.com (Claus Stovgaard)
+#
+
+SUMMARY = "userspace usbip from Linux kernel tools"
+DESCRIPTION = " USB/IP protocol allows to pass USB device from server to \
+client over the network. Server is a machine which provides (shares) a \
+USB device. Client is a machine which uses USB device provided by server \
+over the network. The USB device may be either physical device connected \
+to a server or software entity created on a server using USB gadget subsystem."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+DEPENDS = "virtual/kernel udev"
+PROVIDES = "virtual/usbip-tools"
+
+inherit kernelsrc autotools-brokensep
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+# We need to set S, for not being set to STAGING_KERNEL_DIR, and by that
+# be wiped when we prune dest below. We just set it to usbip-tools-1.0
+S = "${WORKDIR}/${BP}"
+
+# Copy the source files from KERNEL/tools/usb/usbip to ${S}
+do_configure[prefuncs] += "copy_usbip_source_from_kernel"
+python copy_usbip_source_from_kernel() {
+    dir_in_kernel = "tools/usb/usbip"
+    src_dir = d.getVar("STAGING_KERNEL_DIR")
+    src = oe.path.join(src_dir, dir_in_kernel)
+    dest = d.getVar("S")
+    bb.utils.mkdirhier(dest)
+    bb.utils.prunedir(dest)
+    # copy src to dest folder
+    if not os.path.exists(src):
+        bb.fatal("Path does not exist: %s. Maybe dir_in_kernel does not match the kernel version." % src)
+    if os.path.isdir(src):
+        oe.path.copyhardlinktree(src, dest)
+    else:
+        src_path = os.path.dirname(src)
+        os.makedirs(os.path.join(dest,src_path),exist_ok=True)
+        bb.utils.copyfile(src, dest)
+}
+
+# Use local scripts before relying on inherited autotools
+do_configure () {
+    # We are in ${B} - equal to ${S}, so just run the scripts
+    ./cleanup.sh || bbnote "${PN} failed to cleanup.sh"
+    ./autogen.sh || bbnote "${PN} failed to autogen.sh"
+    oe_runconf
+}
+
+# As usbip integrate with the kernel module, we set this package to be build specific for
+# this machine, and not generally for the architecture
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# Even though the libusbip is set to version 0.0.1, set the package version to match kernel
+# e.g. usbip-tools-5.14.21-r0.qemux86_64.rpm for qemu package using kernel 5.14.21
+python do_package:prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+}
\ No newline at end of file
-- 
2.25.1


