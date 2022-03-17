Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E779C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 02:27:38 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.5661.1647484057235487114
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 19:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jA9lA427;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d19so5656468pfv.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 19:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VLLkzxJqAdhhSNnPK7J1jV+1yuuTsI846E6lL3UNocg=;
        b=jA9lA427rquSUVZ20YG0L2S3Nutm0PA2+najOetsWLM3wZAj56zJ7D90LY5nvIunnP
         XlPxqFO/JiBeInReiPSlAw1dKou7kUstGTZxUhRngoc9TVY79X8/DgXlpP1mjiJc0mf6
         gP9d8duUnQ8/hEctArQQXcpZaLB7unJdHJlL4EyLwfsptL4jyEBoqf+EeEgkMyEWXw6c
         1D0K0d2HMBQXNrl7+z0GjTO047qvIeTPOs8j7P7+A/hRd7lioZBWBeBKJaxlyoA0nVSw
         8lR/+/kszM08O4yRw8I2w2X5nRu5EWIIzDEjPHmXr/N29KOxTt62k2H3C5LivllIBnrR
         H9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VLLkzxJqAdhhSNnPK7J1jV+1yuuTsI846E6lL3UNocg=;
        b=TrSHZxwqFa+WoxjzN2opkylzh+YY8U5sujib9LdPtf7SmvlcqRFcs5Nbn+sZ3pFriJ
         qSIy4uo7QaAykwNSTBM2ap/Qp9JLoxJPaj/Se6Fnq8rGGeAh8RAgFLjLNAIJGrt69p2N
         1zaOLxn4l7DkvlpTr7VpGyuuEs6TA80+Wvi17ckcULURL07ytNvqPi9mB8zO2OOTnGy6
         IwvnBZDcQyvpkbYVnJ0pvEAjHETVndY9pgPTB60BfMEKQWon2LieWSlj+yvNTnLgO0OK
         CwB6ZJ97Vt5yor83zI0hj+mzXI57BtHGt1a+t0/EWfQil8vDOUYTXg7Qvw62lj4OLL6R
         /+gA==
X-Gm-Message-State: AOAM5304Scr60dAzMLq4/H/0Ng/XtmX9fMJg2te1Q2LNf3ZLYR1k4Ufv
	cJW3KU+T6iG8tcKlRa0kXcdk/P42JMShnw==
X-Google-Smtp-Source: 
 ABdhPJwcw5xapTqv/D7ZGq51WGiwKiAZq/vi+yFD/5Qogo5q+7KeyzWurO5SKnwSO6/5ZE0cV5BZxw==
X-Received: by 2002:a05:6a00:24cd:b0:4f7:2340:a6cf with SMTP id
 d13-20020a056a0024cd00b004f72340a6cfmr2477213pfv.36.1647484056266;
        Wed, 16 Mar 2022 19:27:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 pc13-20020a17090b3b8d00b001c62a846311sm8511253pjb.6.2022.03.16.19.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 19:27:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pyruvate: Update libc to 0.2.120
Date: Wed, 16 Mar 2022 19:27:33 -0700
Message-Id: <20220317022733.376468-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 02:27:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96029

Drop upstreamed patches
Move riscv32/musl patches to meta-riscv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-riscv32-Define-O_LARGEFILE.patch     |  29 -----
 ...scv64-mod.rs-Add-missing-error-codes.patch |  32 ------
 .../0001-statfs-Exclude-riscv32.patch         | 108 ------------------
 .../python/python3-pyruvate_1.1.2.bb          |   6 +-
 4 files changed, 2 insertions(+), 173 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv32-Define-O_LARGEFILE.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv64-mod.rs-Add-missing-error-codes.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-statfs-Exclude-riscv32.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv32-Define-O_LARGEFILE.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv32-Define-O_LARGEFILE.patch
deleted file mode 100644
index 0ecb50478e..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv32-Define-O_LARGEFILE.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8c1251b57827c7e757079d6e9304570643e8e80a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 5 Mar 2022 22:18:49 -0800
-Subject: [PATCH] riscv32: Define O_LARGEFILE
-
-Some applications (e.g. nix) use this define and expect it to come from libc
-
-Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2710]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs b/src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs
-index 4d551eb..feaa00a 100644
---- a/src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs
-+++ b/src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs
-@@ -490,6 +490,8 @@ pub const FIONREAD: ::c_ulong = 21531;
- pub const __SIZEOF_PTHREAD_MUTEX_T: usize = 40;
- pub const __SIZEOF_PTHREAD_RWLOCK_T: usize = 56;
- 
-+pub const O_LARGEFILE: ::c_int = 0;
-+
- pub const SYS_read: ::c_long = 63;
- pub const SYS_write: ::c_long = 64;
- pub const SYS_close: ::c_long = 57;
--- 
-2.35.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv64-mod.rs-Add-missing-error-codes.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv64-mod.rs-Add-missing-error-codes.patch
deleted file mode 100644
index 6143342178..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv64-mod.rs-Add-missing-error-codes.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a6f5bb3e7fe51733144497a3b5962b300f922a2d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Mar 2022 11:02:46 -0800
-Subject: [PATCH] riscv64/mod.rs: Add missing error codes
-
-These are flagged by apps e.g. python3-pyruvate
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/commit/c711fb215de54f960a35cdc48cd506b6b5db4918]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/linux_like/linux/musl/b64/riscv64/mod.rs | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs b/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-index 48fee4e..7c88abe 100644
---- a/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-+++ b/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-@@ -551,6 +551,11 @@ pub const EHOSTUNREACH: ::c_int = 113;
- pub const EALREADY: ::c_int = 114;
- pub const EINPROGRESS: ::c_int = 115;
- pub const ESTALE: ::c_int = 116;
-+pub const EUCLEAN: ::c_int = 117;
-+pub const ENOTNAM: ::c_int = 118;
-+pub const ENAVAIL: ::c_int = 119;
-+pub const EISNAM: ::c_int = 120;
-+pub const EREMOTEIO: ::c_int = 121;
- pub const EDQUOT: ::c_int = 122;
- pub const ENOMEDIUM: ::c_int = 123;
- pub const EMEDIUMTYPE: ::c_int = 124;
--- 
-2.35.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-statfs-Exclude-riscv32.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-statfs-Exclude-riscv32.patch
deleted file mode 100644
index b482d7c0db..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyruvate/0001-statfs-Exclude-riscv32.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From ccdc974dc10c83e29d551492fb2d17a2ff8c2b84 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 5 Mar 2022 22:30:15 -0800
-Subject: [PATCH] statfs: Exclude riscv32
-
-Upstream-Status: Submitted [https://github.com/nix-rust/nix/pull/1669]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/sys/statfs.rs | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/src/sys/statfs.rs b/src/sys/statfs.rs
-index 829be57..6b88dad 100644
---- a/src/sys/statfs.rs
-+++ b/src/sys/statfs.rs
-@@ -292,7 +292,7 @@ impl Statfs {
-     }
- 
-     /// Total data blocks in filesystem
--    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-+    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-     pub fn blocks(&self) -> u64 {
-         self.0.f_blocks
-     }
-@@ -305,7 +305,7 @@ impl Statfs {
-         target_os = "freebsd",
-         target_os = "openbsd",
-         target_os = "dragonfly",
--        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
-+        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
-     )))]
-     pub fn blocks(&self) -> libc::c_ulong {
-         self.0.f_blocks
-@@ -330,7 +330,7 @@ impl Statfs {
-     }
- 
-     /// Free blocks in filesystem
--    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-+    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-     pub fn blocks_free(&self) -> u64 {
-         self.0.f_bfree
-     }
-@@ -343,7 +343,7 @@ impl Statfs {
-         target_os = "freebsd",
-         target_os = "openbsd",
-         target_os = "dragonfly",
--        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
-+        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
-     )))]
-     pub fn blocks_free(&self) -> libc::c_ulong {
-         self.0.f_bfree
-@@ -368,7 +368,7 @@ impl Statfs {
-     }
- 
-     /// Free blocks available to unprivileged user
--    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-+    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-     pub fn blocks_available(&self) -> u64 {
-         self.0.f_bavail
-     }
-@@ -381,7 +381,7 @@ impl Statfs {
-         target_os = "freebsd",
-         target_os = "openbsd",
-         target_os = "dragonfly",
--        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
-+        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
-     )))]
-     pub fn blocks_available(&self) -> libc::c_ulong {
-         self.0.f_bavail
-@@ -406,7 +406,7 @@ impl Statfs {
-     }
- 
-     /// Total file nodes in filesystem
--    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-+    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-     pub fn files(&self) -> libc::fsfilcnt_t {
-         self.0.f_files
-     }
-@@ -419,7 +419,7 @@ impl Statfs {
-         target_os = "freebsd",
-         target_os = "openbsd",
-         target_os = "dragonfly",
--        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
-+        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
-     )))]
-     pub fn files(&self) -> libc::c_ulong {
-         self.0.f_files
-@@ -449,7 +449,7 @@ impl Statfs {
-     }
- 
-     /// Free file nodes in filesystem
--    #[cfg(all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-+    #[cfg(all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32"))))]
-     pub fn files_free(&self) -> libc::fsfilcnt_t {
-         self.0.f_ffree
-     }
-@@ -462,7 +462,7 @@ impl Statfs {
-         target_os = "freebsd",
-         target_os = "openbsd",
-         target_os = "dragonfly",
--        all(target_os = "linux", any(target_env = "musl", all(target_arch = "x86_64", target_pointer_width = "32")))
-+        all(target_os = "linux", any(target_env = "musl", target_arch = "riscv32", all(target_arch = "x86_64", target_pointer_width = "32")))
-     )))]
-     pub fn files_free(&self) -> libc::c_ulong {
-         self.0.f_ffree
--- 
-2.35.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
index 97fce690ec..1f1c186d31 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -63,7 +63,7 @@ SRC_URI += " \
     crate://crates.io/humantime/2.1.0 \
     crate://crates.io/instant/0.1.12 \
     crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.112 \
+    crate://crates.io/libc/0.2.120 \
     crate://crates.io/libsystemd/0.4.1 \
     crate://crates.io/log/0.4.14 \
     crate://crates.io/memchr/2.4.1 \
@@ -115,10 +115,8 @@ SRC_URI += " \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi/0.3.9 \
 "
-SRC_URI += "file://0001-riscv64-mod.rs-Add-missing-error-codes.patch;patchdir=../cargo_home/bitbake/libc-0.2.112/ \
-            file://0001-riscv32-Define-O_LARGEFILE.patch;patchdir=../cargo_home/bitbake/libc-0.2.112/ \
+SRC_URI += "\
             file://0001-linux.rs-Define-consts-for-rv32-architecture.patch;patchdir=../cargo_home/bitbake/nix-0.23.1/ \
-            file://0001-statfs-Exclude-riscv32.patch;patchdir=../cargo_home/bitbake/nix-0.23.1/ \
             "
 SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=../cargo_home/bitbake/libsystemd-0.4.1/"
 
-- 
2.35.1


