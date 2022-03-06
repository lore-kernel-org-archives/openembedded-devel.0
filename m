Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3312C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 06:49:16 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.13534.1646549355529454820
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 22:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p6HPoTk+;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id t187so6708056pgb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 22:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7HzP5Ukif77uH8KohYmZhutb5KDpqgTWWKcVSFEclLQ=;
        b=p6HPoTk+ExbNTtfpRGYcsCJ8DULWl0pq7KvE+LtLOq1gcKLbWqp0WH6YbDFcuqdcR4
         ku9F1gRGJQCN/NXB7dQgy/9Xq+gQ9MYrJas05mS8rXhfAnrfV8ROqw19YjCe4JbmRvg9
         Nn+UPc+j7+zZdtbfBPkt58vJvYYa4EEg5LVBodMTnjeywzuu0p5OsWd4CGOu5XhhTTeX
         Bwug2IVDuzJeWEqrq9lxnt4w+QtFoYqLu/RSuCEaLTbpYUFe7+sfpY68PAJHgOZvKoMV
         hqpfLLHHTWW//VRaKHv7RtggoI6mpYfhTLjD4+XwmSc/O8kEemqbyNjuorLo1x2ohbtt
         q3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7HzP5Ukif77uH8KohYmZhutb5KDpqgTWWKcVSFEclLQ=;
        b=UKuELWbniygD3E+6nFJ3neVwEnPtj7RDF1yUoMlnlbwZbe0qwITD4fr60exhLhKm6X
         1603nZjUJpTtiQ5PAG7ffiBZo37qgC5yFu8AcGTKhovcnIwyuPJw7r/+pQDhKaF/c5ud
         +8+ZfdjAW+oigz1jhUh/8TTGIqS1xOGm8tEYb5feTocS6p6k++JC+7DlAGs2gMjNMQ64
         ifkrCg+i2DYHj9MIw/d7aTuzqPzZLKApv+mmTFqBQBboWNR6IWyNPRIm6pV85CgW6QNZ
         5PKHDV7s985Vr5ap5WpWh5BlVU5RTL7en5hRYHHYjrI4gY+2hZOda845MfGATIMfKesv
         Q4TQ==
X-Gm-Message-State: AOAM533DRq226Fr+uPOh8UOAzLBgKTGNuBo5W90PufJgKtSllkn3v646
	eHvhksVvJFNO+tCY0dJsjyCB7hkrEu2lHQ==
X-Google-Smtp-Source: 
 ABdhPJzvoy313LOe4Upu42KnmyHHXONzntOzs4gPTJF1IR0/kTKkcjCRPGG0qzPstX1h7JiqvFU/oQ==
X-Received: by 2002:a05:6a02:193:b0:375:65a5:2fcd with SMTP id
 bj19-20020a056a02019300b0037565a52fcdmr5171032pgb.288.1646549354660;
        Sat, 05 Mar 2022 22:49:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm8272052pgb.73.2022.03.05.22.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 22:49:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pyruvate: Fix build on riscv32
Date: Sat,  5 Mar 2022 22:49:11 -0800
Message-Id: <20220306064911.1309642-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 06:49:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95811

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Define-consts-for-rv32-architecture.patch |  26 +++++
 .../0001-riscv32-Define-O_LARGEFILE.patch     |  29 +++++
 .../0001-statfs-Exclude-riscv32.patch         | 108 ++++++++++++++++++
 .../python/python3-pyruvate_1.1.2.bb          |   6 +-
 4 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-linux.rs-Define-consts-for-rv32-architecture.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv32-Define-O_LARGEFILE.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-statfs-Exclude-riscv32.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-linux.rs-Define-consts-for-rv32-architecture.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-linux.rs-Define-consts-for-rv32-architecture.patch
new file mode 100644
index 0000000000..a2d4091a95
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-linux.rs-Define-consts-for-rv32-architecture.patch
@@ -0,0 +1,26 @@
+From 3a3bd8475f93d54cb5bb62d239247fef2e03a733 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Mar 2022 00:37:01 -0800
+Subject: [PATCH] linux.rs: Define consts for rv32 architecture
+
+Upstream-Status: Submitted [https://github.com/nix-rust/nix/pull/1669]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sys/ioctl/linux.rs | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/sys/ioctl/linux.rs b/src/sys/ioctl/linux.rs
+index 68ebaba..08cd0c3 100644
+--- a/src/sys/ioctl/linux.rs
++++ b/src/sys/ioctl/linux.rs
+@@ -34,6 +34,7 @@ mod consts {
+           target_arch = "s390x",
+           target_arch = "x86_64",
+           target_arch = "aarch64",
++          target_arch = "riscv32",
+           target_arch = "riscv64"))]
+ mod consts {
+     #[doc(hidden)]
+-- 
+2.35.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv32-Define-O_LARGEFILE.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv32-Define-O_LARGEFILE.patch
new file mode 100644
index 0000000000..0ecb50478e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv32-Define-O_LARGEFILE.patch
@@ -0,0 +1,29 @@
+From 8c1251b57827c7e757079d6e9304570643e8e80a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Mar 2022 22:18:49 -0800
+Subject: [PATCH] riscv32: Define O_LARGEFILE
+
+Some applications (e.g. nix) use this define and expect it to come from libc
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2710]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs b/src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs
+index 4d551eb..feaa00a 100644
+--- a/src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs
++++ b/src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs
+@@ -490,6 +490,8 @@ pub const FIONREAD: ::c_ulong = 21531;
+ pub const __SIZEOF_PTHREAD_MUTEX_T: usize = 40;
+ pub const __SIZEOF_PTHREAD_RWLOCK_T: usize = 56;
+ 
++pub const O_LARGEFILE: ::c_int = 0;
++
+ pub const SYS_read: ::c_long = 63;
+ pub const SYS_write: ::c_long = 64;
+ pub const SYS_close: ::c_long = 57;
+-- 
+2.35.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-statfs-Exclude-riscv32.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-statfs-Exclude-riscv32.patch
new file mode 100644
index 0000000000..b482d7c0db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-statfs-Exclude-riscv32.patch
@@ -0,0 +1,108 @@
+From ccdc974dc10c83e29d551492fb2d17a2ff8c2b84 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Mar 2022 22:30:15 -0800
+Subject: [PATCH] statfs: Exclude riscv32
+
+Upstream-Status: Submitted [https://github.com/nix-rust/nix/pull/1669]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sys/statfs.rs | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/src/sys/statfs.rs b/src/sys/statfs.rs
+index 829be57..6b88dad 100644
+--- a/src/sys/statfs.rs
++++ b/src/sys/statfs.rs
+@@ -292,7 +292,7 @@ impl Statfs {
+     }
+ 
+     /// Total data blocks in filesystem
+-    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
++    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
+     pub fn blocks(&self) -> u64 {
+         self.0.f_blocks
+     }
+@@ -305,7 +305,7 @@ impl Statfs {
+         target_os = "freebsd",
+         target_os = "openbsd",
+         target_os = "dragonfly",
+-        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
++        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
+     )))]
+     pub fn blocks(&self) -> libc::c_ulong {
+         self.0.f_blocks
+@@ -330,7 +330,7 @@ impl Statfs {
+     }
+ 
+     /// Free blocks in filesystem
+-    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
++    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
+     pub fn blocks_free(&self) -> u64 {
+         self.0.f_bfree
+     }
+@@ -343,7 +343,7 @@ impl Statfs {
+         target_os = "freebsd",
+         target_os = "openbsd",
+         target_os = "dragonfly",
+-        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
++        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
+     )))]
+     pub fn blocks_free(&self) -> libc::c_ulong {
+         self.0.f_bfree
+@@ -368,7 +368,7 @@ impl Statfs {
+     }
+ 
+     /// Free blocks available to unprivileged user
+-    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
++    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
+     pub fn blocks_available(&self) -> u64 {
+         self.0.f_bavail
+     }
+@@ -381,7 +381,7 @@ impl Statfs {
+         target_os = "freebsd",
+         target_os = "openbsd",
+         target_os = "dragonfly",
+-        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
++        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
+     )))]
+     pub fn blocks_available(&self) -> libc::c_ulong {
+         self.0.f_bavail
+@@ -406,7 +406,7 @@ impl Statfs {
+     }
+ 
+     /// Total file nodes in filesystem
+-    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
++    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
+     pub fn files(&self) -> libc::fsfilcnt_t {
+         self.0.f_files
+     }
+@@ -419,7 +419,7 @@ impl Statfs {
+         target_os = "freebsd",
+         target_os = "openbsd",
+         target_os = "dragonfly",
+-        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
++        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
+     )))]
+     pub fn files(&self) -> libc::c_ulong {
+         self.0.f_files
+@@ -449,7 +449,7 @@ impl Statfs {
+     }
+ 
+     /// Free file nodes in filesystem
+-    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
++    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
+     pub fn files_free(&self) -> libc::fsfilcnt_t {
+         self.0.f_ffree
+     }
+@@ -462,7 +462,7 @@ impl Statfs {
+         target_os = "freebsd",
+         target_os = "openbsd",
+         target_os = "dragonfly",
+-        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
++        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
+     )))]
+     pub fn files_free(&self) -> libc::c_ulong {
+         self.0.f_ffree
+-- 
+2.35.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
index 4429e4c32a..36d4165075 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -25,7 +25,11 @@ RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
 
 SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=../cargo_home/bitbake/libsystemd-0.4.1/"
-SRC_URI:append = " file://0001-riscv64-mod.rs-Add-missing-error-codes.patch;patchdir=../cargo_home/bitbake/libc-0.2.112/"
+SRC_URI:append = " file://0001-riscv64-mod.rs-Add-missing-error-codes.patch;patchdir=../cargo_home/bitbake/libc-0.2.112/ \
+                   file://0001-riscv32-Define-O_LARGEFILE.patch;patchdir=../cargo_home/bitbake/libc-0.2.112 \
+                   file://0001-linux.rs-Define-consts-for-rv32-architecture.patch;patchdir=../cargo_home/bitbake/nix-0.23.1/ \
+                   file://0001-statfs-Exclude-riscv32.patch;patchdir=../cargo_home/bitbake/nix-0.23.1/ \
+                 "
 
 SRC_URI += " \
     crate://crates.io/aho-corasick/0.7.18 \
-- 
2.35.1


