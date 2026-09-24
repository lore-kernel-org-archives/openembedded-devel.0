Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D72CC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 12:58:55 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7281.1790254732845229517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2026 05:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=THf7BTNe;
 spf=pass (domain: konsulko.com, ip: 74.125.225.141, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so15601275e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790254731; x=1790859531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AEwlkOUsI2WyDx+TsdGP6vEL/F6Zd6CAEA27XbYbg8=;
        b=THf7BTNe/a9vCOs7PD132AQgAYc9YOMhxDllvXJWYUCZ1jYdGs4uBDMzlctvV6NAeR
         MDeJmygUyQ9aiPhHsEk36zsIhMztVwtOONsifWqhEVywwpsYMXaVOb+M0cYNro2DtZXn
         QNekPC3tr+danTEViqjyMBg8eSoFpNt7FdgoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254731; x=1790859531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AEwlkOUsI2WyDx+TsdGP6vEL/F6Zd6CAEA27XbYbg8=;
        b=AixruOUOpNQ5lUAfenwNCy4kULhda/gHDh80XeLlcBJuykAXy3tL0DCh9CC0UDcLw7
         iHlPPegULR42kVKeYVfAYhwhvT5bZs3y0cSgr5253src5Q9cW4iu4OiGFQw1bBOByvy4
         E3lKeg8tzTPG7Dws97LKTCTa6eCS7+hkVWSzzHIh+VW1zeBT75uCa62i//QNKAthTb1C
         je9ZDbdVZZyLwfZ1z3oBMdUUTYAK6cqDWFcLw6rAkNz0totAWqIIOviCXxuzuerELLRI
         YsvXFFTOMMNVCuNo4J5Pz/TvMl8k56qnElFcx/S1d+SJ3dLs8gwGa8hktotWbUawU5E0
         cg1A==
X-Gm-Message-State: AFuF++mHUkNEwRFpGWpcLH9O7uHVgTvtSmHoSZAe5Cd4rq6HPYbZPVgT
	DMA4xYetiGxu55QsaHr0ufiiXi0llYNUNlXrvxd/FihRQUZWXNmGA6EtSFQ9xiUa/3JL2y2coZk
	CsFIz
X-Gm-Gg: AYBFou2LFKHeSm+O0WptK9Q8LZ3h96Q632XVm7fj8yWJhYE8zHWdQRgasmk2EOJEhlr
	FO46NQn/uxPgqNyQvpss0qf9p2NxPlcbYF8yZOceZKWCzGpKz1/jLUvEvTKDmw2XU1tdxXALBL4
	dHycumE3b8a9sxbypQPWWGsRQDPuBoXGYr8jFMFbe/jLbT7BJQL4KAJj8VP3yRuvfpMs395Ojyv
	eQL1qHGXZqrtZBztgnj+abVlT8QjyHxEx1sUuk+CYtp4YuaR6M0vZxq6B3GuQExWhUUIEUNgAfi
	WggRXaUZrRSZIqARtwYsr2zANlAnpMvhtUcFeevsYPl8GJNvdHzes7r6SQxWr4wOflGcPykIATy
	h95hrnNwAg1PTcPVAYh57+4WNp7lPSfTn3tcIhpPdBDvXSW8NR3Z7RwWBKigmB4Rw3wRYL+mZMH
	E/z7bC5Nwr/R7N4sDaAo9QKeJzHxbhTIPxHoLoeTQ4b7qVH3fMGdDDgBI7B2+Wx1ut7Apx+hUif
	RBrWXUVXzb1OE8pFLAKgEFSvwiVv+fRJipwR5N0MG5gYX9yzhfempr5uCm7+MV+7xy5/tKI+YyD
	9+bUfXebMN0MRsH9IuohKS4=
X-Received: by 2002:a05:600c:628b:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49fe66d1134mr38185975e9.9.1790254730824;
        Thu, 24 Sep 2026 05:58:50 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ded2b7sm63956605e9.10.2026.09.24.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:58:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pydantic-core: Upgrade 2.46.4 -> 2.46.5
Date: Thu, 24 Sep 2026 15:58:46 +0300
Message-ID: <20260924125848.526537-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 12:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130284

Upgrade to release 2.46.5 and keep all crates encapsulated in file
python3-pydantic-core-crates.inc. Drop the patch that enables
getrandom on all musl platforms because it has been merged in the
upstrea.

Release 2.46.5 brings the following changes:
- Fix missing GC traversal in pydantic-core for
  GeneralFieldsSerializer
- Fix missing GC traversal on some pydantic-core struct fields
- Count validated model fields once in smart unions

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pydantic-core-crates.inc   |  23 +--
 ...toml-Update-bitvec-to-use-radium-1.x.patch |   9 +-
 ...able-getrandom-on-all-musl-platforms.patch |  81 ---------
 .../python/python3-pydantic-core_2.46.4.bb    | 154 ------------------
 .../python/python3-pydantic-core_2.46.5.bb    |  51 ++++++
 5 files changed, 56 insertions(+), 262 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-musl-enable-getrandom-on-all-musl-platforms.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core_2.46.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 44c19ac76a..d475222253 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -60,7 +60,7 @@ SRC_URI += " \
     crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.44 \
     crate://crates.io/r-efi/5.2.0 \
-    crate://crates.io/radium/0.7.0 \
+    crate://crates.io/radium/1.1.0 \
     crate://crates.io/regex/1.12.3 \
     crate://crates.io/regex-automata/0.4.13 \
     crate://crates.io/regex-syntax/0.8.5 \
@@ -165,7 +165,7 @@ SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078a
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
-SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
+SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
 SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
 SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
@@ -210,22 +210,3 @@ SRC_URI[zerofrom-derive-0.1.4.sha256sum] = "0ea7b4a3637ea8669cedf0f1fd5c286a17f3
 SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
 SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
 SRC_URI[zmij-1.0.6.sha256sum] = "aac060176f7020d62c3bcc1cdbcec619d54f48b07ad1963a3f80ce7a0c17755f"
-SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
-SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
-SRC_URI[jiter-0.11.1.sha256sum] = "8e805fb15a8249d25213202b9098f7b9ad00f8042ccc6f0063d2ae7b33f3d7da"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
-SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
-SRC_URI[pyo3-build-config-0.26.0.sha256sum] = "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
-SRC_URI[pyo3-ffi-0.26.0.sha256sum] = "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
-SRC_URI[pyo3-macros-0.26.0.sha256sum] = "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
-SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
-SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
-SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
-SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
-SRC_URI[serde_json-1.0.145.sha256sum] = "402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
-SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
-SRC_URI[uuid-1.18.1.sha256sum] = "2f87b8aa10b915a06587d0dec516c282ff295b475d94abf425d62b57710070a2"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
index 53fd2a4785..80f0e840ee 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
@@ -1,4 +1,4 @@
-From ca6400743a86fa334936d9984dcd40e90bb06e60 Mon Sep 17 00:00:00 2001
+From d75df9ca49a825b67b53db9505b2aef2a79e3c76 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 19 Apr 2025 00:09:42 -0700
 Subject: [PATCH] cargo.toml: Update bitvec to use radium 1.x
@@ -13,7 +13,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  2 files changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/Cargo.lock b/Cargo.lock
-index 6f26c8a..91ceade 100644
+index 22a8524..1f97c2d 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
 @@ -55,7 +55,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
@@ -49,7 +49,7 @@ index 6f26c8a..91ceade 100644
  [[package]]
  name = "regex"
 diff --git a/Cargo.toml b/Cargo.toml
-index 1fb5dcc..4949c8a 100644
+index dd453c5..d120608 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -25,6 +25,8 @@ include = [
@@ -61,6 +61,3 @@ index 1fb5dcc..4949c8a 100644
  # TODO it would be very nice to remove the "py-clone" feature as it can panic,
  # but needs a bit of work to make sure it's not used in the codebase
  pyo3 = { version = "0.28", features = ["generate-import-lib", "num-bigint", "py-clone", "smallvec"] }
--- 
-2.47.3
-
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-musl-enable-getrandom-on-all-musl-platforms.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-musl-enable-getrandom-on-all-musl-platforms.patch
deleted file mode 100644
index fd94526686..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-musl-enable-getrandom-on-all-musl-platforms.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 4253e25b7f31d207c69b9997f403b6e4e560e258 Mon Sep 17 00:00:00 2001
-From: Tamir Duberstein <tamird@gmail.com>
-Date: Thu, 20 Mar 2025 11:45:08 -0400
-Subject: [PATCH] musl: enable `getrandom` on all musl platforms
-
-The existing bindings were added in #1399 and limited to targets where
-rustc used musl version >= 1.1.20 which was not all musl targets at that
-time. Since https://github.com/rust-lang/rust/pull/107129 all musl
-targets use musl 1.2.3. Hence, move the binding to the module root so it
-is available for all musl targets.
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/4346]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/linux_like/linux/musl/b32/arm/mod.rs | 4 ----
- src/unix/linux_like/linux/musl/b32/powerpc.rs | 4 ----
- src/unix/linux_like/linux/musl/b32/x86/mod.rs | 4 ----
- src/unix/linux_like/linux/musl/b64/mod.rs     | 4 ----
- src/unix/linux_like/linux/musl/mod.rs         | 2 ++
- 5 files changed, 2 insertions(+), 16 deletions(-)
-
---- a/src/unix/linux_like/linux/musl/b32/arm/mod.rs
-+++ b/src/unix/linux_like/linux/musl/b32/arm/mod.rs
-@@ -841,10 +841,6 @@ pub const SYS_process_mrelease: ::c_long
- pub const SYS_futex_waitv: ::c_long = 449;
- pub const SYS_set_mempolicy_home_node: ::c_long = 450;
- 
--extern "C" {
--    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
--}
--
- cfg_if! {
-     if #[cfg(libc_align)] {
-         mod align;
---- a/src/unix/linux_like/linux/musl/b32/powerpc.rs
-+++ b/src/unix/linux_like/linux/musl/b32/powerpc.rs
-@@ -796,7 +796,3 @@ pub const SYS_memfd_secret: ::c_long = 4
- pub const SYS_process_mrelease: ::c_long = 448;
- pub const SYS_futex_waitv: ::c_long = 449;
- pub const SYS_set_mempolicy_home_node: ::c_long = 450;
--
--extern "C" {
--    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
--}
---- a/src/unix/linux_like/linux/musl/b32/x86/mod.rs
-+++ b/src/unix/linux_like/linux/musl/b32/x86/mod.rs
-@@ -956,10 +956,6 @@ pub const EFL: ::c_int = 14;
- pub const UESP: ::c_int = 15;
- pub const SS: ::c_int = 16;
- 
--extern "C" {
--    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
--}
--
- cfg_if! {
-     if #[cfg(libc_align)] {
-         mod align;
---- a/src/unix/linux_like/linux/musl/b64/mod.rs
-+++ b/src/unix/linux_like/linux/musl/b64/mod.rs
-@@ -134,10 +134,6 @@ pub const __SIZEOF_PTHREAD_RWLOCK_T: usi
- pub const __SIZEOF_PTHREAD_MUTEX_T: usize = 40;
- pub const __SIZEOF_PTHREAD_BARRIER_T: usize = 32;
- 
--extern "C" {
--    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
--}
--
- cfg_if! {
-     if #[cfg(target_arch = "aarch64")] {
-         mod aarch64;
---- a/src/unix/linux_like/linux/musl/mod.rs
-+++ b/src/unix/linux_like/linux/musl/mod.rs
-@@ -885,6 +885,8 @@ extern "C" {
- 
-     pub fn dirname(path: *mut ::c_char) -> *mut ::c_char;
-     pub fn basename(path: *mut ::c_char) -> *mut ::c_char;
-+    // Addded in `musl` 1.1.20
-+    pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
- }
- 
- // Alias <foo> to <foo>64 to mimic glibc's LFS64 support
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
deleted file mode 100644
index bc9f0e2ad3..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
+++ /dev/null
@@ -1,154 +0,0 @@
-SUMMARY = "Provides the core functionality for pydantic validation and serialization."
-DESCRIPTION = "This package provides the core functionality for \
-pydantic validation and serialization.\
-\
-Pydantic-core is currently around 17x faster than pydantic V1."
-HOMEPAGE = "https://github.com/pydantic/pydantic-core"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
-
-require ${BPN}-crates.inc
-
-SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
-SRC_URI += "file://atomic.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/radium-1.1.0/"
-SRC_URI += "file://0001-musl-enable-getrandom-on-all-musl-platforms.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.155/"
-SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
-SRC_URI += "crate://crates.io/ahash/0.8.12 \
-           crate://crates.io/aho-corasick/1.1.3 \
-           crate://crates.io/autocfg/1.3.0 \
-           crate://crates.io/base64/0.22.1 \
-           crate://crates.io/bitflags/2.9.1 \
-           crate://crates.io/bitvec/1.0.1 \
-           crate://crates.io/bumpalo/3.19.0 \
-           crate://crates.io/cc/1.0.101 \
-           crate://crates.io/cfg-if/1.0.0 \
-           crate://crates.io/displaydoc/0.2.5 \
-           crate://crates.io/enum_dispatch/0.3.13 \
-           crate://crates.io/form_urlencoded/1.2.1 \
-           crate://crates.io/funty/2.0.0 \
-           crate://crates.io/getrandom/0.3.3 \
-           crate://crates.io/heck/0.5.0 \
-           crate://crates.io/hex/0.4.3 \
-           crate://crates.io/icu_collections/1.5.0 \
-           crate://crates.io/icu_locid/1.5.0 \
-           crate://crates.io/icu_locid_transform/1.5.0 \
-           crate://crates.io/icu_locid_transform_data/1.5.0 \
-           crate://crates.io/icu_normalizer/1.5.0 \
-           crate://crates.io/icu_normalizer_data/1.5.0 \
-           crate://crates.io/icu_properties/1.5.1 \
-           crate://crates.io/icu_properties_data/1.5.0 \
-           crate://crates.io/icu_provider/1.5.0 \
-           crate://crates.io/icu_provider_macros/1.5.0 \
-           crate://crates.io/idna/1.1.0 \
-           crate://crates.io/idna_adapter/1.2.0 \
-           crate://crates.io/indoc/2.0.5 \
-           crate://crates.io/itoa/1.0.11 \
-           crate://crates.io/jiter/0.11.1 \
-           crate://crates.io/js-sys/0.3.77 \
-           crate://crates.io/lexical-parse-float/1.0.5 \
-           crate://crates.io/lexical-parse-integer/1.0.5 \
-           crate://crates.io/lexical-util/1.0.6 \
-           crate://crates.io/libc/0.2.155 \
-           crate://crates.io/litemap/0.7.3 \
-           crate://crates.io/log/0.4.27 \
-           crate://crates.io/memchr/2.7.4 \
-           crate://crates.io/memoffset/0.9.1 \
-           crate://crates.io/num-bigint/0.4.6 \
-           crate://crates.io/num-integer/0.1.46 \
-           crate://crates.io/num-traits/0.2.19 \
-           crate://crates.io/once_cell/1.21.3 \
-           crate://crates.io/percent-encoding/2.3.2 \
-           crate://crates.io/portable-atomic/1.6.0 \
-           crate://crates.io/proc-macro2/1.0.86 \
-           crate://crates.io/pyo3/0.26.0 \
-           crate://crates.io/pyo3-build-config/0.26.0 \
-           crate://crates.io/pyo3-ffi/0.26.0 \
-           crate://crates.io/pyo3-macros/0.26.0 \
-           crate://crates.io/pyo3-macros-backend/0.26.0 \
-           crate://crates.io/python3-dll-a/0.2.14 \
-           crate://crates.io/quote/1.0.36 \
-           crate://crates.io/r-efi/5.2.0 \
-           crate://crates.io/radium/1.1.0 \
-           crate://crates.io/regex/1.12.2 \
-           crate://crates.io/regex-automata/0.4.13 \
-           crate://crates.io/regex-syntax/0.8.5 \
-           crate://crates.io/rustversion/1.0.17 \
-           crate://crates.io/ryu/1.0.18 \
-           crate://crates.io/serde/1.0.228 \
-           crate://crates.io/serde_core/1.0.228 \
-           crate://crates.io/serde_derive/1.0.228 \
-           crate://crates.io/serde_json/1.0.145 \
-           crate://crates.io/smallvec/1.15.1 \
-           crate://crates.io/speedate/0.17.0 \
-           crate://crates.io/stable_deref_trait/1.2.0 \
-           crate://crates.io/static_assertions/1.1.0 \
-           crate://crates.io/strum/0.27.2 \
-           crate://crates.io/strum_macros/0.27.2 \
-           crate://crates.io/syn/2.0.82 \
-           crate://crates.io/synstructure/0.13.1 \
-           crate://crates.io/tap/1.0.1 \
-           crate://crates.io/target-lexicon/0.13.2 \
-           crate://crates.io/tinystr/0.7.6 \
-           crate://crates.io/unicode-ident/1.0.12 \
-           crate://crates.io/unindent/0.2.3 \
-           crate://crates.io/url/2.5.4 \
-           crate://crates.io/utf16_iter/1.0.5 \
-           crate://crates.io/utf8_iter/1.0.4 \
-           crate://crates.io/uuid/1.18.1 \
-           crate://crates.io/version_check/0.9.5 \
-           crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
-           crate://crates.io/wasm-bindgen/0.2.100 \
-           crate://crates.io/wasm-bindgen-backend/0.2.100 \
-           crate://crates.io/wasm-bindgen-macro/0.2.100 \
-           crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
-           crate://crates.io/wasm-bindgen-shared/0.2.100 \
-           crate://crates.io/wit-bindgen-rt/0.39.0 \
-           crate://crates.io/write16/1.0.0 \
-           crate://crates.io/writeable/0.5.5 \
-           crate://crates.io/wyz/0.5.1 \
-           crate://crates.io/yoke/0.7.4 \
-           crate://crates.io/yoke-derive/0.7.4 \
-           crate://crates.io/zerocopy/0.8.25 \
-           crate://crates.io/zerocopy-derive/0.8.25 \
-           crate://crates.io/zerofrom/0.1.4 \
-           crate://crates.io/zerofrom-derive/0.1.4 \
-           crate://crates.io/zerovec/0.10.4 \
-           crate://crates.io/zerovec-derive/0.10.3 \
-           "
-SRC_URI[sha256sum] = "62f875393d7f270851f20523dd2e29f082bcc82292d66db2b64ea71f64b6e1c1"
-
-DEPENDS = "python3-maturin-native python3-typing-extensions"
-
-inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pytest
-
-PYPI_PACKAGE = "pydantic_core"
-
-RDEPENDS:${PN} += " \
-    python3-compression \
-    python3-typing-extensions \
-"
-
-INSANE_SKIP:${PN} = "already-stripped"
-
-# python3-misc is for Lib/timeit.py which is not split out elsewhere
-RDEPENDS:${PN}-ptest += "\
-	python3-dateutil \
-    python3-dirty-equals \
-    python3-hypothesis \
-    python3-inline-snapshot \
-    python3-misc \
-    python3-pytest-mock \
-    python3-pytest-timeout \
-    python3-pytest-benchmark \
-    python3-typing-inspection \
-	python3-tzdata \
-	python3-zoneinfo \
-"
-
-do_install_ptest:append () {
-    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
-    sed -i -e "/--automake/ s/$/ -k 'not test_model_class_root_validator_wrap and not test_model_class_root_validator_before and not test_model_class_root_validator_after'/" ${D}${PTEST_PATH}/run-ptest
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.5.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.5.bb
new file mode 100644
index 0000000000..38340cf547
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.5.bb
@@ -0,0 +1,51 @@
+SUMMARY = "Provides the core functionality for pydantic validation and serialization."
+DESCRIPTION = "This package provides the core functionality for \
+pydantic validation and serialization.\
+\
+Pydantic-core is currently around 17x faster than pydantic V1."
+HOMEPAGE = "https://github.com/pydantic/pydantic-core"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
+
+require ${BPN}-crates.inc
+
+SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
+SRC_URI += "file://atomic.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/radium-1.1.0/"
+SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
+SRC_URI[sha256sum] = "10416c15b8839ecc4ef4d0885da76da6fd0f67333a0eb8aff6d93c4b8f2910fc"
+
+DEPENDS = "python3-maturin-native python3-typing-extensions"
+
+inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pytest
+
+PYPI_PACKAGE = "pydantic_core"
+
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-typing-extensions \
+"
+
+INSANE_SKIP:${PN} = "already-stripped"
+
+# python3-misc is for Lib/timeit.py which is not split out elsewhere
+RDEPENDS:${PN}-ptest += "\
+	python3-dateutil \
+    python3-dirty-equals \
+    python3-hypothesis \
+    python3-inline-snapshot \
+    python3-misc \
+    python3-pytest-mock \
+    python3-pytest-timeout \
+    python3-pytest-benchmark \
+    python3-typing-inspection \
+	python3-tzdata \
+	python3-zoneinfo \
+"
+
+do_install_ptest:append () {
+    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+    sed -i -e "/--automake/ s/$/ -k 'not test_model_class_root_validator_wrap and not test_model_class_root_validator_before and not test_model_class_root_validator_after'/" ${D}${PTEST_PATH}/run-ptest
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


