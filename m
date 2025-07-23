Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E57C83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 05:39:04 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.7304.1753249140654985937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 22:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAjKAZ7P;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234b440afa7so58435765ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 22:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753249140; x=1753853940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVDlmbmSgDpUc5sCMBsQDSVSQlCXnVCpZpCqHdtqNEw=;
        b=lAjKAZ7PPv1AaiAX2BmekQjPFR9z59nO8hZiwsGyWXhXnYAAFdZZ8tXMe3CTgAnR7/
         rifsqz2U2zClpw2S3dArOrdcZW5pEKQVsvHzMiN8qf5s43UbG7ATjOXFTVeMdpUKaMq0
         QCeTNHAUZMmWtT+NgBq5gWaOFd8CPOQgJOMEvc1PMbIQ0Bhtfxb46WIfdgRNUrYqckHy
         Q4GBhvbYd9tdfBaMQ6+VcLdLEAmdsZ426xzJ39fuaN92muKAxJfuKgPQeIz4tw5woHHK
         IjDyl/zxKoySHr1E9tVOnmZwH+JvgNc+zPBb78lAbkI1jLPy2qOzO5h7jNVh+1+856d1
         k++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753249140; x=1753853940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVDlmbmSgDpUc5sCMBsQDSVSQlCXnVCpZpCqHdtqNEw=;
        b=e5SEDW9yGkJjmNPuA7qxfGkV9A4p5SJibqK4lKoswGNiEQwgjS9Uq0KP5D6QS5Ialv
         ogghcmaKSFcaIGhENxW7sqzQPVC5Nk3BTl65XteNVyOaIpff9+UfWXICMk39ofI/LFHt
         PBKqpij+nIhXDR3eR8qSWX8IM5zq/yVAkxUfywx6ipyY1TZIVeWKkRkfPNZcxoUmnXPK
         sAZo4gEhjdVP/DqkyrMSw5zlVQy6LAGPr4jPamlpBWtrzurDPGP6V9qLujkquxHwVUV6
         fQmpxvVhKEKI4VLGmhM6qAOuKtF4gvnOu/D7EkWKN4WGUaNtPmwigCd1PgyuMrges/0q
         uHpw==
X-Gm-Message-State: AOJu0YxfDiguuPC3tCYEobWfdJUtewrpV1wgiWLYvOPUP6xgiBm08GB5
	klw0duRAwAbYdK38TlIawViVz/0DDR3NASv30UCEufCKybYe5QsZ1JfEK38d2XY/3Bc=
X-Gm-Gg: ASbGncvVyhSWFdUkmDCLUgurAUN8r/c0GRtUlQMeD4ZDVCvWDpSufV24/fgvzfa197B
	hJU9wzVrf6N0hl+YFv9L5MJnxuLiij4sAhg8v2E14FqzYRunSjqgEIpnlfIUXg59RoylXtwIKpg
	4oZKYAATY+pwJ+IUEful6mcaBsCxEKK5QehWWRb26q+BVTRaH60Q5F9oMi5+hr8Lug41WFKFGCF
	TwsmM1wUGkKQ/1I3knsKN39sqCIEn7SLKQCRGlhSviKc/kwhOka7xaHQgFOrkM4pwRgY/hOQTXl
	0/2a/Me+Uq1b14yz6tsssxEmWguaNCmvOZiklNqinwOMfymmsTG9eMvYrczuLVx8IrU324XkFch
	LyvKJG0iWRFw2EQ==
X-Google-Smtp-Source: AGHT+IEUPCl6oGTD40avCYNneRqJbSFICShvt+CK/Di1idwer+XeiV5GXC18OyJf9lobvJfR1UPoiA==
X-Received: by 2002:a17:903:2352:b0:234:986c:66d4 with SMTP id d9443c01a7336-23f98194e19mr22490185ad.26.1753249139659;
        Tue, 22 Jul 2025 22:38:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4949sm87662745ad.122.2025.07.22.22.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 22:38:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pydantic-core: Fix build on rv32
Date: Tue, 22 Jul 2025 22:38:56 -0700
Message-ID: <20250723053856.3854170-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 05:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118713

version needs getrandom from musl libc on musl targets but
rust libc locked in for this target is older than the change
needed for this to work on newer architectures

Fixes
| error[E0425]: cannot find value `getrandom` in crate `libc`
|   --> /usr/src/debug/python3-pydantic-core/2.35.2/sources/cargo_home/bitbake/getrandom-0.3.3/src/backends/linux_android_with_fallback.rs:34:39

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...able-getrandom-on-all-musl-platforms.patch | 81 +++++++++++++++++++
 .../python/python3-pydantic-core_2.35.2.bb    |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-musl-enable-getrandom-on-all-musl-platforms.patch

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-musl-enable-getrandom-on-all-musl-platforms.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-musl-enable-getrandom-on-all-musl-platforms.patch
new file mode 100644
index 0000000000..fd94526686
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-musl-enable-getrandom-on-all-musl-platforms.patch
@@ -0,0 +1,81 @@
+From 4253e25b7f31d207c69b9997f403b6e4e560e258 Mon Sep 17 00:00:00 2001
+From: Tamir Duberstein <tamird@gmail.com>
+Date: Thu, 20 Mar 2025 11:45:08 -0400
+Subject: [PATCH] musl: enable `getrandom` on all musl platforms
+
+The existing bindings were added in #1399 and limited to targets where
+rustc used musl version >= 1.1.20 which was not all musl targets at that
+time. Since https://github.com/rust-lang/rust/pull/107129 all musl
+targets use musl 1.2.3. Hence, move the binding to the module root so it
+is available for all musl targets.
+
+Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/4346]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/musl/b32/arm/mod.rs | 4 ----
+ src/unix/linux_like/linux/musl/b32/powerpc.rs | 4 ----
+ src/unix/linux_like/linux/musl/b32/x86/mod.rs | 4 ----
+ src/unix/linux_like/linux/musl/b64/mod.rs     | 4 ----
+ src/unix/linux_like/linux/musl/mod.rs         | 2 ++
+ 5 files changed, 2 insertions(+), 16 deletions(-)
+
+--- a/src/unix/linux_like/linux/musl/b32/arm/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/arm/mod.rs
+@@ -841,10 +841,6 @@ pub const SYS_process_mrelease: ::c_long
+ pub const SYS_futex_waitv: ::c_long = 449;
+ pub const SYS_set_mempolicy_home_node: ::c_long = 450;
+ 
+-extern "C" {
+-    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
+-}
+-
+ cfg_if! {
+     if #[cfg(libc_align)] {
+         mod align;
+--- a/src/unix/linux_like/linux/musl/b32/powerpc.rs
++++ b/src/unix/linux_like/linux/musl/b32/powerpc.rs
+@@ -796,7 +796,3 @@ pub const SYS_memfd_secret: ::c_long = 4
+ pub const SYS_process_mrelease: ::c_long = 448;
+ pub const SYS_futex_waitv: ::c_long = 449;
+ pub const SYS_set_mempolicy_home_node: ::c_long = 450;
+-
+-extern "C" {
+-    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
+-}
+--- a/src/unix/linux_like/linux/musl/b32/x86/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/x86/mod.rs
+@@ -956,10 +956,6 @@ pub const EFL: ::c_int = 14;
+ pub const UESP: ::c_int = 15;
+ pub const SS: ::c_int = 16;
+ 
+-extern "C" {
+-    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
+-}
+-
+ cfg_if! {
+     if #[cfg(libc_align)] {
+         mod align;
+--- a/src/unix/linux_like/linux/musl/b64/mod.rs
++++ b/src/unix/linux_like/linux/musl/b64/mod.rs
+@@ -134,10 +134,6 @@ pub const __SIZEOF_PTHREAD_RWLOCK_T: usi
+ pub const __SIZEOF_PTHREAD_MUTEX_T: usize = 40;
+ pub const __SIZEOF_PTHREAD_BARRIER_T: usize = 32;
+ 
+-extern "C" {
+-    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
+-}
+-
+ cfg_if! {
+     if #[cfg(target_arch = "aarch64")] {
+         mod aarch64;
+--- a/src/unix/linux_like/linux/musl/mod.rs
++++ b/src/unix/linux_like/linux/musl/mod.rs
+@@ -885,6 +885,8 @@ extern "C" {
+ 
+     pub fn dirname(path: *mut ::c_char) -> *mut ::c_char;
+     pub fn basename(path: *mut ::c_char) -> *mut ::c_char;
++    // Addded in `musl` 1.1.20
++    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
+ }
+ 
+ // Alias <foo> to <foo>64 to mimic glibc's LFS64 support
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb
index 1d0d1f477b..788cbd2ceb 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 require ${BPN}-crates.inc
 
 SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
+SRC_URI += "file://0001-musl-enable-getrandom-on-all-musl-platforms.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.155/"
 SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
 SRC_URI[sha256sum] = "e010b13ff0d6375ee83f7478fbda42e1fbf55f1b2feef76b673c40861ffd31e6"
 

