Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E95CA1002
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 21:16:54 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.7062.1757193410044405312
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Sep 2025 14:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cJjQ2x6n;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-249406d5878so30315085ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 14:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757193409; x=1757798209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUEwpQ27EkTsEi/ryceo2VWr0DpyNrAh1RVepRWAGB0=;
        b=cJjQ2x6nocJuD+RLb3s8uxpbV6FwoPye8IfFO5Zk113BBo6pHsYObmf7rPCrLFXX0h
         vnv0jaPgcUQTPUxyEHxOWXYzifOz6gnXrTVt7LkTfRYvA4dxGdZrpPEkIB3+XaUtnnA/
         a1kzVDWvt2yUOyMzZEBsGokWGJNhir++4+NPCDLVOKz1tnVPMZspldPhplMUvPKOw2w/
         bpcTP6tGROJ8FEHFHSm8eAJr/DIbiWOwSIJk9ruOlkRNum8AkV4oVsz8nKwoyHsFd0r4
         qDIhfxOyEfRRVbrriQGv6DTo03WmI1Sqa1tt6XPRVhVQtHxrPPW4DUuAVn9KUOASEOGo
         sMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757193409; x=1757798209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUEwpQ27EkTsEi/ryceo2VWr0DpyNrAh1RVepRWAGB0=;
        b=j7ih6IQDn/Hq3Va0nW9IM21QDQN6MqMb8KcJeJ4xsy3hU1kV2BGJTNPs+P+Hl+WPIw
         vy41BXXcQJmAmlJ0+U+zueZ0TX/h3s//2FezB+9qpwkQaK2xvN8EYSIb3hes4Zlt7jXt
         9+dzf/djTIj2oGezQe5CrgxS6bMKM93TuGwaLvmol4l2/qnxVNlNHXEcd+osNo11QFvM
         XuN5iXHxOWQeioHzbNy9vQID5z1uKN6AhxDR823skljR2Nuy40YeWd1Ay4Qw2cTqqrgh
         wgThKoAc4vztMEqTlhzf8c6pmERtK+3vQWP1AXev9FRJ0aQhYfNEsJy5I7pZMUHEy5ro
         78dQ==
X-Gm-Message-State: AOJu0YxJKVgFUSTZCCQ+bHi3sQuNY7urUvz7RwwHE4DVwLrSDSRmB6q1
	57l1YY/6i002VTPZ3gY5EDVDXyfEgusRKUerlg381L+QvVJcnfoUO6VlwXTAzlza
X-Gm-Gg: ASbGncuQIa2/VW7J/HoiJ9KkhA+IyM9HucMfS4EcsDwPTvSOLy0aUByt2GuXyUPRurp
	7hieeOcdxJmyLdBkxao+es5uhbFcPRrD+XqaMUDGoOpez54a5rSNQhTcXuu2NJW6vW0y4pGP1JY
	0JQS/I232rE3DiDA6TxuTx36N4drZoRcV8NOOHwAdc7yvaU2Yyj3i9ixTPpDgng4BiYlBn34CRs
	fm46x/0CKIDWADuqV+dP5KqpSHDFug0g39aJgewQxbEMe2nUVHiP/Z48SO0szGuNfT8EKtPxF33
	8jbJ/x8WK87MNrerEQ2aC1wMNe2XonKoAgQ9cA0zd/USVF899FuzCzaHZt47xBlSR3L+Y2KPW6c
	+m7pRh4TzbXZE31GpXV/qHTxhmJNJKtb1Ht5UcAuHakI6rge6rCVjj7KoH1ofdXO91nbOAarWbe
	o+XK51ZJkwSumuSYe0cEownYXL0+rwa2Vyw5HxHoJSXSwBHw52IePOd7PWIs9S7w==
X-Google-Smtp-Source: AGHT+IGpQRUuH1B7gjr84+2ocqXnhh9yeTAND8EkP+pfiEl3cqi8BhMBH+G22xGRGoDg3ARNkSoi9w==
X-Received: by 2002:a17:902:f78f:b0:24c:da3b:7379 with SMTP id d9443c01a7336-2516e1bdcf8mr41772855ad.16.1757193409073;
        Sat, 06 Sep 2025 14:16:49 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ecee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b168157b6sm130903255ad.13.2025.09.06.14.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 14:16:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] bpftool,bpftool-native: Separate out native recipe
Date: Sat,  6 Sep 2025 14:16:45 -0700
Message-ID: <20250906211646.3814323-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 21:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119326

build uses prepared sourcedir for kernel and relying
on target kernel recipe to prepare this is not the correct
thing for native package. Since the kernel will need target
dependencies cross-compiler etc. to build/prepare the kernel sourcedir

This issue is revealed when bpftool-native is built for riscv64
it ends up in build errors

ERROR: bpftool-native-1.0-r0 do_configure: The sstate manifest for task 'linux-libc-headers:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: qemuriscv64, allarch, x86_64_x86_64-nativesdk.
But none of these manifests exists:
    /mnt/b/yoe/master/sources/poky/build/tmp/sstate-control/manifest-qemuriscv64-linux-libc-headers.populate_sysroot
    /mnt/b/yoe/master/sources/poky/build/tmp/sstate-control/manifest-allarch-linux-libc-headers.populate_sysroot
    /mnt/b/yoe/master/sources/poky/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-linux-libc-headers.populate_sysroot
ERROR: Logfile of failure stored in: /mnt/b/yoe/master/sources/poky/build/tmp/work/x86_64-linux/bpftool-native/1.0/temp/log.do_configure.2509356

Therefore separate it out into independent recipe and use latest stable
kernel to build it.

Enable musl builds as well for bpftool, it works now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{bpftool.bb => bpftool-native_6.16.bb}    | 30 ++++++-------------
 meta-oe/recipes-kernel/bpftool/bpftool.bb     |  3 +-
 2 files changed, 10 insertions(+), 23 deletions(-)
 copy meta-oe/recipes-kernel/bpftool/{bpftool.bb => bpftool-native_6.16.bb} (55%)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
similarity index 55%
copy from meta-oe/recipes-kernel/bpftool/bpftool.bb
copy to meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
index d19746184c..bc7712ce4d 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
@@ -2,12 +2,17 @@ SUMMARY = "Inspect and manipulate eBPF programs and maps"
 DESCRIPTION = "bpftool is a kernel tool for inspection and simple manipulation \
 of eBPF programs and maps."
 LICENSE = "GPL-2.0-only"
-DEPENDS = "binutils elfutils elfutils-native"
-PROVIDES = "virtual/bpftool"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+UPSTREAM_CHECK_URI = "https://www.kernel.org/"
 
-inherit bash-completion kernelsrc kernel-arch
+DEPENDS = "binutils-native elfutils-native"
 
-do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
+inherit native bash-completion
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz"
+SRC_URI[sha256sum] = "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83"
+
+S = "${UNPACKDIR}/linux-${PV}"
 
 EXTRA_OEMAKE = "\
     V=1 \
@@ -22,13 +27,6 @@ EXTRA_OEMAKE = "\
     bash_compdir=${prefix}/share/bash-completion \
 "
 
-SECURITY_CFLAGS = ""
-
-do_configure[depends] += "virtual/kernel:do_shared_workdir"
-
-COMPATIBLE_HOST = "(x86_64|aarch64|riscv64).*-linux"
-COMPATIBLE_HOST:libc-musl = 'null'
-
 do_compile() {
     oe_runmake
 }
@@ -37,14 +35,4 @@ do_install() {
     oe_runmake DESTDIR=${D} install
 }
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-python do_package:prepend() {
-    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
-}
-
-B = "${WORKDIR}/${BPN}-${PV}"
-
 FILES:${PN} += "${exec_prefix}/sbin/*"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index d19746184c..4f4d4a8670 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -27,7 +27,6 @@ SECURITY_CFLAGS = ""
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
 COMPATIBLE_HOST = "(x86_64|aarch64|riscv64).*-linux"
-COMPATIBLE_HOST:libc-musl = 'null'
 
 do_compile() {
     oe_runmake
@@ -47,4 +46,4 @@ B = "${WORKDIR}/${BPN}-${PV}"
 
 FILES:${PN} += "${exec_prefix}/sbin/*"
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "nativesdk"

