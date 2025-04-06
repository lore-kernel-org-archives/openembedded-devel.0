Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B794C3601A
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 02:14:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.18441.1743905692954084153
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Apr 2025 19:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=idD23OUs;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22409077c06so41059545ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 19:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743905692; x=1744510492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo5yDVv6kKZtMNxlqBEsgxhWed3M5jkgcf9bpy8EXnY=;
        b=idD23OUsUI/VsSGpDXShMkzBTfHpt2YKCFEIe6Tye0ysif5e2m7dALWum4H1EbeBBB
         eTYkGerZxMsddtc7RZzm9m8VXDdNhsu8pVBNOLITWiYAlpkqii7d63NUvXW+K2mZqpH7
         KxNC/u6/4hdrBBYauYk7LTdZlWI64IXRL1oLOKlq+GNpligYMAHFO57cpoXdRHWKiCpI
         nKH0mPrjds4E57kNetC7wi1oelj0vRXHJUWu4Gl8Iwxa2a+Oq6JTNsPPjZCUPq6x+ZwQ
         2JxNgGYgZtlLm3pWUACqlnIq416si/MfM5EVkkxMNiwfEzGXBv6m0tiO0DUClvaRoCAY
         l7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743905692; x=1744510492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fo5yDVv6kKZtMNxlqBEsgxhWed3M5jkgcf9bpy8EXnY=;
        b=g0YhScosDa2oedEpgB4cmTBAnoxiNZjMBUvGyqpNRthvyGNwpWFMSOyrQDWT75qOCL
         hCacEoLS1akImwwc1nmjuJu8Xb1SPICyNLnkj5NBrBvjgwey1ifJdE9CclfIFTrb1wov
         XKZ7g/FyMBGYu44LfGTGnrTpZoZDWXKIGgsbEdLF0odrpQzzf4+HSA5rif6ZU6sK5VQY
         HroS0ms5QHb5gGponoNs00CFNmfuVxvt9nyVn+JtRCXXH81vcZaZhi3MQYRZpkrjaWAh
         a62Wk1YvrmOMQXM5vaYhgpjU66AZffxIobVDYYXWdr+eSFi0zOyk2TUL95fpYuwosmj7
         a42w==
X-Gm-Message-State: AOJu0Yy1f3gbNZ2kuPRqPUE+Y9ldffHwF+97/1py4dLz9ftnfNWDz075
	qfWd4VJ5EBeYgpz2sO5LK3qj0cdb17uwKOvU2QvXx/SFHb0j+d7An8s4co6I
X-Gm-Gg: ASbGnct+7gdlUhs2emdtpYRkc8GkhNzsIufiTXujsyfZC16tpm80mqKuepb1/kdwNk9
	hKok1dNXi7mlPzMJIOtW9jz/FpxN7e7dOrBfjX9fB05eXiGRqtpFzRJrjt8OlYQgUB/O0wJ+Pz9
	70UxUXTCEIVPNyVIQvAEJtpmUm5j3cLa7qs31316+VdejDZFB4U4D3+1TAYDPxbsZazcV1I71Ru
	XacIoARvp9Xdf96QQ4Ig3i2ER4y/ZUNT9S+a3Fhv3148HXKjYVMsrHZrFtZUgmBkjOxWIcICufE
	Dm8G0kPt32zqkJ+vip53Dh9X9EqlRIpTc9uP
X-Google-Smtp-Source: AGHT+IHEcBgzCr/r1lM2hAYQHElRPEwYo60OyuSDXVp8yY9pun10Ri++mBocpi1qCXirKjVIEfsaKQ==
X-Received: by 2002:a17:902:e552:b0:220:c813:dfcc with SMTP id d9443c01a7336-22a8a8b80a3mr111634395ad.40.1743905691598;
        Sat, 05 Apr 2025 19:14:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41c6desm5036749a12.77.2025.04.05.19.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 19:14:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] thin-provisioning-tools: Fix build on riscv32
Date: Sat,  5 Apr 2025 19:14:44 -0700
Message-ID: <20250406021446.183928-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 02:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116603

Rustix crate needs to be patched

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-cargo-build-on-riscv32.patch     | 75 +++++++++++++++++++
 .../thin-provisioning-tools_1.1.0.bb          |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Fix-cargo-build-on-riscv32.patch

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Fix-cargo-build-on-riscv32.patch b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Fix-cargo-build-on-riscv32.patch
new file mode 100644
index 0000000000..6a706a3e9b
--- /dev/null
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Fix-cargo-build-on-riscv32.patch
@@ -0,0 +1,75 @@
+From b85c7b406f017589eb959cd619ba442837ada470 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Apr 2025 00:29:22 -0700
+Subject: [PATCH] Fix cargo build on riscv32
+
+riscv32 support is added to latest rustix already
+therefore this patch is limited to rustix-0.38.19
+once cargo/rust moves beyond rustix-0.38.19 as dependency
+we can remove this patch
+
+Upstream-Status: Inappropriate [Specific to rustix-0.38.19]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/fs/ioctl.rs | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+--- a/src/fs/ioctl.rs
++++ b/src/fs/ioctl.rs
+@@ -11,6 +11,14 @@ use {
+ 
+ use bitflags::bitflags;
+ 
++/// The datatype used for the ioctl number
++#[cfg(any(target_os = "android", target_env = "musl"))]
++#[doc(hidden)]
++pub type ioctl_num_type = c::c_int;
++#[cfg(not(any(target_os = "android", target_env = "musl")))]
++#[doc(hidden)]
++pub type ioctl_num_type = c::c_ulong;
++
+ #[cfg(all(linux_kernel, not(any(target_arch = "sparc", target_arch = "sparc64"))))]
+ use crate::fd::{AsRawFd, BorrowedFd};
+ 
+@@ -79,7 +87,8 @@ unsafe impl ioctl::Ioctl for Ficlone<'_>
+     type Output = ();
+ 
+     const IS_MUTATING: bool = false;
+-    const OPCODE: ioctl::Opcode = ioctl::Opcode::old(c::FICLONE as ioctl::RawOpcode);
++    const OPCODE: ioctl::Opcode =
++        ioctl::Opcode::old(linux_raw_sys::ioctl::FICLONE as ioctl::RawOpcode);
+ 
+     fn as_ptr(&mut self) -> *mut c::c_void {
+         self.0.as_raw_fd() as *mut c::c_void
+@@ -136,7 +145,12 @@ bitflags! {
+ #[doc(alias = "FS_IOC_GETFLAGS")]
+ pub fn ioctl_getflags<Fd: AsFd>(fd: Fd) -> io::Result<IFlags> {
+     unsafe {
+-        #[cfg(target_pointer_width = "32")]
++        #[cfg(target_arch = "riscv32")]
++        let ctl = ioctl::Getter::<
++            ioctl::BadOpcode<{ linux_raw_sys::ioctl::FS_IOC32_GETFLAGS as ioctl_num_type }>,
++            u32,
++        >::new();
++        #[cfg(all(target_pointer_width = "32", not(target_arch = "riscv32")))]
+         let ctl = ioctl::Getter::<ioctl::BadOpcode<{ c::FS_IOC32_GETFLAGS }>, u32>::new();
+         #[cfg(target_pointer_width = "64")]
+         let ctl = ioctl::Getter::<ioctl::BadOpcode<{ c::FS_IOC_GETFLAGS }>, u32>::new();
+@@ -152,8 +166,15 @@ pub fn ioctl_getflags<Fd: AsFd>(fd: Fd)
+ #[inline]
+ #[doc(alias = "FS_IOC_SETFLAGS")]
+ pub fn ioctl_setflags<Fd: AsFd>(fd: Fd, flags: IFlags) -> io::Result<()> {
++    use crate::ioctl::Ioctl;
++
+     unsafe {
+-        #[cfg(target_pointer_width = "32")]
++        #[cfg(target_arch = "riscv32")]
++        let ctl = ioctl::Setter::<
++            ioctl::BadOpcode<{ linux_raw_sys::ioctl::FS_IOC32_SETFLAGS as ioctl_num_type }>,
++            u32,
++        >::new(flags.bits());
++        #[cfg(all(target_pointer_width = "32", not(target_arch = "riscv32")))]
+         let ctl =
+             ioctl::Setter::<ioctl::BadOpcode<{ c::FS_IOC32_SETFLAGS }>, u32>::new(flags.bits());
+ 
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
index 1981a35934..5f685f3749 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
@@ -9,6 +9,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = " \
     git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
+    file://0001-Fix-cargo-build-on-riscv32.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/rustix-0.38.34 \
     "
 
 # v1.1.0

