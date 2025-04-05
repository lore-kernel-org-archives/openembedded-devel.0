Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADDBC36010
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 20:58:16 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.13781.1743886692797376001
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Apr 2025 13:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k7QGFCmI;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af52a624283so2438787a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743886692; x=1744491492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVXyN/HEdRct9bgjJsNzl/dWuV/XVTWu38ZQoUQHc4g=;
        b=k7QGFCmI409JDOPjshmUESoaf+6sYOmaWunpN5brgbj63Z6KHRyYiOPJrQ3X1QRSB0
         PxVOJV/zzlBIaHvsPkX0GpgRYBCXSjYQ3kdShlbyOju+i/+FcsIfXaHjhf0jL7DZKtbx
         OrJkt6pmz4yMuyyCHrkUe8r2BtBj+L56knKPmWBX//GKRBydmeP0SPZMyVO+DVpX0ik5
         i4PF72/O3rcVl0kS+arC5RncIz8dWTuwzKs+e0ccZhentzEJ/bXbMbH0Mve7OpHPI4Md
         2FRkxGQj7GfbRw+Lil55xIZ/vatukbVOFSnKqRdxFZTWSwHtO6ZSwJjcMfdKE48PPSFw
         P9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743886692; x=1744491492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVXyN/HEdRct9bgjJsNzl/dWuV/XVTWu38ZQoUQHc4g=;
        b=EVgdQPd0Jw334VcSHWbgIRj2MSHpqmSDRVookJ/xtA9sQwtQlH98dJeuS/2pCA9dZ6
         dIwVFuQ67aflWjjTg5Rur6EUFq0z5InlRipnefQ27HjeUekCoicDN8u8qdwwGPyplSMI
         07M7JVtGbcy+gGqKV+UFBQydFQyYKaJP7PstBHHgk9kuNOZlKjMqdPzQxY3KhZAwLsS1
         b457f8yXT03mk6Jzh5tf4qsY/4ZqiXNM0IZPSC0qKBVj09aFw4YxBHRlWka3xjc66LyL
         ETUoikq7hqUsGKu6+gkaUB1dM7eyjG73angEYlp0Vb5HgPqCSL9k57brsGkxjAnFPUP5
         WA4g==
X-Gm-Message-State: AOJu0YxGxx9gpdtQ7nVqGKLByHMqxSbwq4rXUsGqRV0eyjzbuw1gLntz
	CCuhdEzUfweEMCNgUeEmYX0vWACrp+euSySkNpYQCg5eLeCcctCXylCdzmHt
X-Gm-Gg: ASbGnctZuBXAm+mo59WA9Bpv7p9LhzUpsE+1cwsDcpzLXSnbZ172z3+uGKCg+woUVBj
	WJsPZVCaozfzjsugt6TBbd4kZmvfGDjUy8WynwQ9X3gZm1TABnflXduoSNBWo3fPoOMO8zcOLpB
	yqqoBxbYldMV/8gAqvCmXpoH3igeTFelFygXRtnhLVG9f80yHYU74wCXY1pCHqJMUnZoko067Ik
	0ULGxeuGMrqd5vzquTFvVtTYwPtL9KsJt0YLQvccMEwAMtQOuKj7dIkzIW/w/bcQZz1G+rtQArT
	n7ctuI7adFpBEz9UsGW6kegHrmlNogv8DCyG
X-Google-Smtp-Source: AGHT+IEjsvZyvO9k0L/BK8A52iYwQm6CIFoW2woNauvfiiw5VRV1Rky1BgNnctGEPS1pb3Bkan6OMQ==
X-Received: by 2002:a05:6a20:12cf:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-2010504f1a0mr12308831637.3.1743886691482;
        Sat, 05 Apr 2025 13:58:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41aba7sm4847075a12.71.2025.04.05.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 13:58:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] cbindgen: Fix build on riscv32
Date: Sat,  5 Apr 2025 13:58:09 -0700
Message-ID: <20250405205809.1482819-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 20:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116602

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Fix-rustix-0.38.x-build-on-riscv32.patch | 72 +++++++++++++++++++
 .../cbindgen/cbindgen_0.28.0.bb               |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Fix-rustix-0.38.x-build-on-riscv32.patch

diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Fix-rustix-0.38.x-build-on-riscv32.patch b/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Fix-rustix-0.38.x-build-on-riscv32.patch
new file mode 100644
index 0000000000..951a6ee03c
--- /dev/null
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Fix-rustix-0.38.x-build-on-riscv32.patch
@@ -0,0 +1,72 @@
+From 03b4becfbd094be8e28c9f0cd84011d62780316c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 2 Apr 2025 20:01:24 -0700
+Subject: [PATCH] Fix rustix 0.38.x build on riscv32
+
+Upstream-Status: Submitted [https://github.com/bytecodealliance/rustix/pull/1435]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/fs/ioctl.rs | 27 ++++++++++++++++++++++++---
+ 1 file changed, 24 insertions(+), 3 deletions(-)
+
+diff --git a/src/fs/ioctl.rs b/src/fs/ioctl.rs
+index 490f183..068b3c7 100644
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
+@@ -79,7 +87,8 @@ unsafe impl ioctl::Ioctl for Ficlone<'_> {
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
+@@ -152,8 +166,15 @@ pub fn ioctl_getflags<Fd: AsFd>(fd: Fd) -> io::Result<IFlags> {
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
diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
index 40436ef035..1ca9b35c4d 100644
--- a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "https://github.com/mozilla/cbindgen"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=master"
+SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=master \
+            file://0001-Fix-rustix-0.38.x-build-on-riscv32.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/rustix-0.38.34"
 SRCREV = "bd78bbe59b10eda6ef1255e4acda95c56c6d0279"
 S = "${WORKDIR}/git"
 

