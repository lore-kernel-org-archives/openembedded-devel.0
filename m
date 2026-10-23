Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1649.1792738457368054399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UG3aUmz7;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso235586a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738457; x=1793343257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZewNLYDXUV2ycsRCXgt9JiGJDyxbVinfa+ggFS29a00=;
        b=UG3aUmz7GGhqjYFQCQa0u6smVPjRgVI2soN/Pc+9lmVVpfDplJo8sEtp28AW3623I7
         qCyxdXLD5T+0WP8aVmKzxA69hpjJ5NafP5c2iub1AvVP1Q0Xi9cIyMHDfr2KvdrL839x
         1n3aDxix5u3WPwSW7BHNwpokVtR4ZV536a5TgkFa3ltOzAES05XC7je80yLCt0UBqYbm
         VcllaTVE/BbBMVoH937ggEZ09PMmDPzDmAW2eDEiwFEOB/sJtquAQUljemMr4uSzggPL
         YEUUTZ0dsk4PZXluGa99enqhRCf1dkHyz7ZLen1GXFac8i+NwQZ+nfMySel8CHFrlKag
         eCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738457; x=1793343257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZewNLYDXUV2ycsRCXgt9JiGJDyxbVinfa+ggFS29a00=;
        b=wTGmvb7I96oz9m8Tee7cB/T7v6Y8hP/0mZZTrtK9YdHc5etclkRlmsoezqUqsm7Cyh
         niJMKRGtsLWtrutfZYQh1uZuxvtvEFh63LbmTmIJFPECsh1JrN8tZBvwIEKKv9m57Xf5
         YiXMJGRXZkjSx2Z7PzsLxXDNg3yujom+1DzMFr5gSbaMQ8HnOes5A3kuXyFbrOvx3pEK
         Ug8TnleaObiGz69ByQz6clI5KeEiuDlWKWZS//INNCDyq/owCCIXv5D4/9Z39YquRSPP
         TTxfoNlB1GK7HV2OjOp+1QM6w/JPuP2DBmwIKmBl/f94+yrPxePKd2Pbi/p/uEWiTHKl
         8uHA==
X-Gm-Message-State: AFq9FYKfmCDrf+9WA5cXPUAr5p9GhrgW0s4VQCzfoHepFBQvCE6cUyHV
	ut7TkqOteV/ak2Zvo04c7Yab95GfPYUFLqbqNpYtbRqwkRAJ+5/P08KHrKW0M6TrbCQ=
X-Gm-Gg: AYBFou3bvkDBtLfBypLV8SW+3LHrmapp2ZQ85h8dHnHJXjd1jPYsO7ZvUxlHlC8vP+L
	+3LCPdSPkfDios1W3j55/r9mfvl86wOxki8oYSYuM1eiWl8y9CRSOvNFHlEl3bL7NwI9WvqNrJP
	K0YXeJqJYtOdJwe4/YDP3CiDaiTXjSLKH6xX0Cir4WQnO7VHVbSklI8sFMRW1BXCzu8bwRaCPOD
	EwBB/+dRWb25Y6HcXXn07mqlZrxHEA7AxAO6eoaLWIRPK3bnXhnyUUvpP43qSMzUI91QHw68JLe
	5RZr9dU+xcbC+U3QIwU0KZ2B2aOQZjFc61yeAHmvHOMLC4D4gg0XHuf2efzP8XUgWhOnXZzxWXI
	/VgPdl93WzgSpYcnaMZHMlir3EE2L1H1VF8o/cMv2Rc839Oebpa8eRMP3d+rNDGYeuXK9W71xQ5
	lzHF4sxtsr5QfXowvNRpsNEFm+QT0hYDzQBTEHoVns9vsnQvEFM0o0WOo504Uchrx5+owTQ76Xk
	ZirxHoRLDxSwSEkgxh7YbbfWeV+nAnYiPSq5wMzENo2YkLpskrGyM0sPWji1Fqe4XdefNNx5U0e
	JaGo0MPbV6mnszFaxngs1E2BHnrbVZNx4VRqVO+ZCDGz7BUVNsUIB2jUfRkCTzlINfQzNboz6To
	pPQhyVRbhahLFbVwC6s2zNbJdHAvNLWHTzCLi084DQToxrsZCvLPKAhC2dlfyw6rSeqFDVKBOij
	qDw+P9HhyKroqIrwDW6o+NGrREYDqI5MHwpP3Q6Y/DCCicXuU38kA6CkzAV+QZ/+1GJyS9VSw0U
	OkPh+rFx4Zy3U48ixlCEBYkQQC9tryOeMdDlviK9DnxU93TqoXZ
X-Received: by 2002:a05:6a21:4849:b0:3e2:1a3e:395c with SMTP id adf61e73a8af0-3e37675d01emr964886637.59.1792738456633;
        Thu, 22 Oct 2026 23:54:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 19/29] python3-ruff: Fix build on targets without 64-bit atomics
Date: Thu, 22 Oct 2026 23:53:40 -0700
Message-ID: <20261023065350.3228996-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131343
Content-Type: text/plain; charset="utf-8"

std only provides AtomicU64 on targets with 64-bit atomics, so ruff
fails to build for riscv32:

  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
   --> crates/ruff/src/cache.rs:7:25

Add a patch that uses portable-atomic's AtomicU64 for the cache
timestamp on such targets, archived in the same on-disk format.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-atomic-for-AtomicU64-on-targets-wi.patch | 162 ++++++++++++++++++
 .../python/python3-ruff_0.17.1.bb             |   2 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch

diff --git a/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
new file mode 100644
index 0000000000..f2708bb6b0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
@@ -0,0 +1,162 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 18:00:00 -0700
+Subject: [PATCH] ruff: Use portable-atomic for AtomicU64 on targets without
+ 64-bit atomics
+
+std only provides AtomicU64 on targets with 64-bit atomics, so ruff
+fails to build for e.g. riscv32:
+
+  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
+   --> crates/ruff/src/cache.rs:7:25
+    |
+  7 | use std::sync::atomic::{AtomicU64, Ordering};
+    |                         ^^^^^^^^^ no `AtomicU64` in `sync::atomic`
+
+FileCache::last_seen holds milliseconds since the Unix epoch, so it has
+to stay 64-bit. On targets without 64-bit atomics, use the AtomicU64
+from portable-atomic, which is already in the dependency tree, instead.
+rkyv's AtomicLoad wrapper only supports the std atomics, so add an
+equivalent wrapper that archives it as an ArchivedU64, which keeps the
+on-disk cache format the same on all targets. Targets with 64-bit
+atomics keep using std's AtomicU64 unchanged.
+
+Upstream-Status: Submitted [https://github.com/astral-sh/ruff/pull/29627]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Cargo.toml               |  1 +
+ Cargo.lock               |  1 +
+ crates/ruff/Cargo.toml   |  3 +++
+ crates/ruff/src/cache.rs | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++----
+ 4 files changed, 58 insertions(+), 4 deletions(-)
+
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -170,6 +170,7 @@
+ phf = { version = "0.11.3", default-features = false }
+ phf_codegen = { version = "0.11.3", default-features = false }
+ pep440_rs = { version = "0.7.1", default-features = false }
++portable-atomic = { version = "1.13.1", default-features = false, features = ["fallback"] }
+ pretty_assertions = { version = "1.3.0", default-features = false, features = ["std"] }
+ proc-macro2 = { version = "1.0.79", default-features = false, features = ["proc-macro"] }
+ pyproject-toml = { version = "0.13.4", default-features = false }
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -2523,6 +2523,7 @@
+  "mimalloc",
+  "notify",
+  "path-absolutize",
++ "portable-atomic",
+  "rayon",
+  "regex",
+  "rkyv",
+--- a/crates/ruff/Cargo.toml
++++ b/crates/ruff/Cargo.toml
+@@ -77,6 +77,9 @@
+ [target.'cfg(target_os = "windows")'.dependencies]
+ mimalloc = { workspace = true }
+
++[target.'cfg(not(target_has_atomic = "64"))'.dependencies]
++portable-atomic = { workspace = true }
++
+ [dev-dependencies]
+ # Enable test rules during development
+ ruff_linter = { workspace = true, features = ["clap", "test-rules"] }
+--- a/crates/ruff/src/cache.rs
++++ b/crates/ruff/src/cache.rs
+@@ -4,7 +4,9 @@
+ use std::io::{self, Write};
+ use std::path::{Path, PathBuf};
+ use std::sync::Mutex;
+-use std::sync::atomic::{AtomicU64, Ordering};
++#[cfg(target_has_atomic = "64")]
++use std::sync::atomic::AtomicU64;
++use std::sync::atomic::Ordering;
+ use std::time::{Duration, SystemTime};
+
+ use anyhow::{Context, Result};
+@@ -23,6 +25,10 @@
+ use ruff_workspace::Settings;
+ use ruff_workspace::resolver::Resolver;
+
++// `std` only provides `AtomicU64` on targets with 64-bit atomics.
++#[cfg(not(target_has_atomic = "64"))]
++use portable_atomic::AtomicU64;
++
+ /// [`Path`] that is relative to the package root in [`PackageCache`].
+ pub(crate) type RelativePath = Path;
+ /// [`PathBuf`] that is relative to the package root in [`PackageCache`].
+@@ -341,12 +347,56 @@
+     ///
+     /// Represented as the number of milliseconds since Unix epoch. This will
+     /// break in 1970 + ~584 years (~2554).
+-    #[rkyv(with = rkyv::with::AtomicLoad<rkyv::with::Relaxed>)]
++    #[cfg_attr(
++        target_has_atomic = "64",
++        rkyv(with = rkyv::with::AtomicLoad<rkyv::with::Relaxed>)
++    )]
++    #[cfg_attr(not(target_has_atomic = "64"), rkyv(with = AtomicU64LoadRelaxed))]
+     last_seen: AtomicU64,
+
+     data: FileCacheData,
+ }
+
++/// Archives a [`portable_atomic::AtomicU64`] as its value, like
++/// [`rkyv::with::AtomicLoad`] with [`rkyv::with::Relaxed`] does for the `std`
++/// one, so the on-disk format is the same on all targets.
++#[cfg(not(target_has_atomic = "64"))]
++struct AtomicU64LoadRelaxed;
++
++#[cfg(not(target_has_atomic = "64"))]
++impl rkyv::with::ArchiveWith<AtomicU64> for AtomicU64LoadRelaxed {
++    type Archived = rkyv::primitive::ArchivedU64;
++    type Resolver = ();
++
++    fn resolve_with(field: &AtomicU64, (): Self::Resolver, out: rkyv::Place<Self::Archived>) {
++        out.write(rkyv::primitive::ArchivedU64::from_native(
++            field.load(Ordering::Relaxed),
++        ));
++    }
++}
++
++#[cfg(not(target_has_atomic = "64"))]
++impl<S: rkyv::rancor::Fallible + ?Sized> rkyv::with::SerializeWith<AtomicU64, S>
++    for AtomicU64LoadRelaxed
++{
++    fn serialize_with(_: &AtomicU64, _: &mut S) -> std::result::Result<Self::Resolver, S::Error> {
++        Ok(())
++    }
++}
++
++#[cfg(not(target_has_atomic = "64"))]
++impl<D: rkyv::rancor::Fallible + ?Sized>
++    rkyv::with::DeserializeWith<rkyv::primitive::ArchivedU64, AtomicU64, D>
++    for AtomicU64LoadRelaxed
++{
++    fn deserialize_with(
++        field: &rkyv::primitive::ArchivedU64,
++        _: &mut D,
++    ) -> std::result::Result<AtomicU64, D::Error> {
++        Ok(AtomicU64::new(field.to_native()))
++    }
++}
++
+ impl FileCache {
+     /// Return whether or not the file in the cache was linted and found to have no diagnostics.
+     pub(crate) fn linted(&self) -> bool {
+@@ -503,7 +553,6 @@
+     use std::io;
+     use std::io::Write;
+     use std::path::{Path, PathBuf};
+-    use std::sync::atomic::AtomicU64;
+     use std::time::SystemTime;
+
+     use anyhow::Result;
+@@ -522,7 +571,7 @@
+     use ruff_workspace::Settings;
+
+     use crate::cache::{self, ChangeData, FileCache, FileCacheData, FileCacheKey};
+-    use crate::cache::{Cache, RelativePathBuf};
++    use crate::cache::{AtomicU64, Cache, RelativePathBuf};
+     use crate::commands::format::{FormatCommandError, FormatMode, FormatResult, format_path};
+     use crate::diagnostics::{Diagnostics, lint_path};
+
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb b/meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb
index 0028b6ede3..84da446937 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"

 DEPENDS += "python3-maturin-native"

+SRC_URI += "file://0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch"
+
 SRC_URI[sha256sum] = "5bb796c5112e9fb9527f2ef2faa0a130d6312d19de92bcfaddd70dbb2d41020f"

 inherit pypi python_setuptools3_rust cargo-update-recipe-crates
