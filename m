Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FA1C5DF98
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 16:41:55 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11529.1787330508949476022
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 09:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C6iS1rLu;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1132587a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787330508; x=1787935308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKkMnKqv/e2ckagyFtsQ/MgUDry1xs3UGbrGL0BDwBE=;
        b=C6iS1rLu1WwnqGHe1H36W5kR9fu3IKfBpB+cRXaHkgi+mPjB5UqXxi/Uene8Pd2D3T
         dudGpn3gOO5vFLXnuXFB8Ue/pd9+oNVPabWNJZbjvJjxQEmgATxWwKjBW3Y4zv9vbKfP
         sm8cC66dLfk0KSKM5ZKWoR30vYvSJAXq44lN7pIIkSypnYpuAmqodYj7URy1uMy89Eo2
         9R8cZCI6yZ5xvL9IAXx58aCkwqeHo2+9LFLipLeLgZTDlTrzrlD8xxP0zAZKYt5+lEiP
         nZb2EueNmo0HIG3EfH1p8GZQIVpDZP0S2ei5zj6AJayq/tv5K9neQ95F4N5VO0x6DoEj
         KBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787330508; x=1787935308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKkMnKqv/e2ckagyFtsQ/MgUDry1xs3UGbrGL0BDwBE=;
        b=T3KZzxk0g97IYG0seXTfXIQWH3+mTPiwXXYGWa6L56IOHkdXaE8XfDzDmLSys5s0aG
         JXhqyeo7LhDj4VKqexeRg6tI3qEY4Ut8NOJ3X77Ksr7XrN3m2Kd5jmQMQxSphsXoZRKL
         lR7GSEk6u1jcF7p+dwK1+dfYvK3Pm4W5rJxfrq1a1TaM7Z9UsmToRH8SBEZ6DasGu4gU
         xTPU1vW7oi9pPAMbxXQdNzfXAatB71TY3I7nIxazirrH21vqfb+vuB3t0H8VrHJ6SIEJ
         matZJZU70RjsGj+vf2zy9ZVnEnBvmxxOWDwTWFYmn/aA8ZUBprftIXUholTj7BAZdAwu
         ARgg==
X-Gm-Message-State: AFuF++lb6x/aw52S5pnSKsVNi7UerYrsYfLuxXTY6ms4GQ69p/7gtFWa
	9QS8I+9ZIroove3S+BpHCyCRfaB6OZzf6zySnpNIaiIXQy85sSJ79keW8L575NPL
X-Gm-Gg: AR+sD137lAy6k6vufzrur3XzAUMGSMNWNTsQ+/h2v5yiYJMwSJq2pszz5SHYiXmUUy4
	QNOP8dB1NBJqO5X2U9j2C+wqYwTS8vMpAKKVI3AMEP7lZtdypm38wV+LAwxsFuVVKkFLWg40hUw
	UDcos8AeETSuiBGhDX6NEsJzSqYonXBJcgN/slaxqIDGIBI4StunJop6MFgnbBkHfjLZVQokU+C
	+0pHPDo0EGWk+xLYkNg+gmF/27wOaW0adefGDFrfoekGouxmPnxLCpuynvXfRAvhv1CS6QEozIM
	3oHJjFZL5au/yc6r0DZEZKjNSr47ulI8e+1IzmlzlUIcD2udqbmym97PKOxoR/gLlVyyXAWvd7c
	R5EMOPqw9og9asSaWgNmbC3neve2xiQKaabHO7Ohj/jIewA18Wox+RR61ziEyjk+8ZjhenJdfya
	0pI5662F1oKLOAo9Kr+kGA4qttnjn+sufOGoHvR12AKoAcj2x4f1CAX5EOt3+fDJy5+b+lB/LFk
	m6+0sVFPvlm+7av4brxSz3J6aGJFkEUnb/UZdS1riPUMXnl2/ESPZeNEEEaX3x1R50f5Ns9HbFJ
	POZIV8QOmUUoPZJOEnwaenTdQgF3O85i24X0qoLdxOrhRN2MAuMLyW8MPceNckWWW4RaFIj3XNt
	r6UXPS0aZqfcSeHScEKumWlHgl4EG3sXahoKWCa5innlC+w==
X-Received: by 2002:a17:90b:394b:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-395c384d95bmr14531805a91.14.1787330508149;
        Fri, 21 Aug 2026 09:41:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae89189sm27634802c88.14.2026.08.21.09.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:41:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] vboxguestdrivers: Only expect vboxvideo on kernels older than 7.x
Date: Fri, 21 Aug 2026 09:41:44 -0700
Message-ID: <20260821164145.7081-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 16:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129423

VirtualBox's own top-level Makefile gates the out-of-tree vboxvideo DRM
module on the kernel major version:

  all: vboxguest vboxsf $(if $(shell [ "$(KERN_MAJ)" -lt 7 ] && echo y),vboxvideo,)

From 7.x on the in-tree drivers/gpu/drm/vboxvideo driver is expected to
be used instead, so "make all" builds vboxguest and vboxsf only. Since
cd774fc8b6 ("vboxguestdrivers: Provide target kernel version") KERN_MAJ
reflects the target kernel, so building against linux-yocto 7.2 now hits:

  | ERROR: One of vbox*.ko modules wasn't built

The recipe still hard-required vboxvideo.ko in do_compile,
module_do_install, PACKAGES, RRECOMMENDS and KERNEL_MODULE_AUTOLOAD.
Derive the module list from KERN_MAJ instead so recipe and Makefile agree.
Behaviour on kernels older than 7.x is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../vboxguestdrivers_7.2.14.bb                | 36 +++++++++++++------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
index 45f3f22481..dcffe0475a 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
@@ -32,7 +32,18 @@ S:task-patch = "${UNPACKDIR}/${BP}"
 export VBOX_KBUILD_TARGET_ARCH = "${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64 = "amd64"

-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KERN_MAJ='${@(oe.kernel.get_version_file('${STAGING_KERNEL_BUILDDIR}') or '').split('.')[0]}' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
+# The Makefile uses KERN_MAJ to decide whether vboxvideo is built. It defaults to
+# the *host* kernel version (uname -r), so pass the target one instead.
+KERN_MAJ = "${@(oe.kernel.get_version_file(d.getVar('STAGING_KERNEL_BUILDDIR')) or '').split('.')[0]}"
+
+# VirtualBox only ships the out-of-tree vboxvideo DRM module for kernels older
+# than 7.x - from 7.x on the in-tree drivers/gpu/drm/vboxvideo driver is used
+# instead. Mirror that decision so the compile check, the install step and the
+# packaging stay in sync with what "make all" actually produced.
+VBOX_VIDEO_MODULE = "${@'vboxvideo' if (d.getVar('KERN_MAJ') or '').isdigit() and int(d.getVar('KERN_MAJ')) < 7 else ''}"
+VBOX_MODULES = "vboxguest vboxsf ${VBOX_VIDEO_MODULE}"
+
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KERN_MAJ='${KERN_MAJ}' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"

 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"
@@ -72,18 +83,20 @@ do_configure:prepend() {
 do_compile() {
     oe_runmake all
     oe_runmake 'LD=${CC}' 'EXTRA_CFLAGS=-I${STAGING_KERNEL_BUILDDIR}/include/' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
-    if ! [ -e vboxguest.ko -a -e vboxsf.ko -a -e vboxvideo.ko ] ; then
-        echo "ERROR: One of vbox*.ko modules wasn't built"
-        exit 1
-    fi
+    for m in ${VBOX_MODULES} ; do
+        if ! [ -e $m.ko ] ; then
+            echo "ERROR: kernel module $m.ko wasn't built"
+            exit 1
+        fi
+    done
 }

 module_do_install() {
     MODULE_DIR=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/misc
     install -d $MODULE_DIR
-    install -m 644 vboxguest.ko $MODULE_DIR
-    install -m 644 vboxsf.ko $MODULE_DIR
-    install -m 644 vboxvideo.ko $MODULE_DIR
+    for m in ${VBOX_MODULES} ; do
+        install -m 644 $m.ko $MODULE_DIR
+    done
 }

 do_install:append() {
@@ -91,10 +104,11 @@ do_install:append() {
     install -m 755 ${S}/utils/mount.vboxsf ${D}${base_sbindir}
 }

-PACKAGES += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
-RRECOMMENDS:${PN} += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
+VBOX_MODULE_PACKAGES = "${@' '.join('kernel-module-' + m for m in d.getVar('VBOX_MODULES').split())}"
+PACKAGES += "${VBOX_MODULE_PACKAGES}"
+RRECOMMENDS:${PN} += "${VBOX_MODULE_PACKAGES}"

 FILES:${PN} = "${base_sbindir}"

 # autoload if installed
-KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
+KERNEL_MODULE_AUTOLOAD += "${VBOX_MODULES}"

