Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1651.1792738459669934556
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OFHLi9Pp;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd623dfe420so410644a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738459; x=1793343259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxBmsm1HhvlZUn2itb6JxjERlgl6Kmwy2pOixhTUDUc=;
        b=OFHLi9PpCz0LEnJ/55APQXhXQ0JiLhX9D/kxN3KEmLH+XDycfGFJBCyqv7/AVOtQcf
         0rXRGlhlWLd8HJDUyE6tYzfyol8tq1ydzS3Zsf5dda/E/omXuox1/xb7f5/Cj/iZyXoB
         NFjI6dCxu3bPx4nzxV+l7OwDWUmNtn+XBLSAgkadBwKQ8KHeOecLHjnJe3+DhO4kHTiw
         XvlygTV/+H2I6Z3kAz4/u18Zexag4b2D5I2EtCnjWC3jnkiftCH6Q/fu49nnaacWTB4Y
         tHJ1kGlx+tfd/Muknw1ZsKij7x2IywvlZXAuloWWD3dzgxgCt8BtOahJLd5KVaNqhNX+
         j8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738459; x=1793343259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxBmsm1HhvlZUn2itb6JxjERlgl6Kmwy2pOixhTUDUc=;
        b=i2Z6J1ouxeTggtvxu1x8n1efh0rwXhE8WMdxkqVcx+lcIQ3N7GFbjJAp8huOq4TSn/
         F+aBH6AvCFEXZnrq34ix2EDYhiFumkb1Sh6SVRBWmevaU7uuim5/67/sGPe3WiEuyWf6
         iNxEqAY3ExsAwj+eq3xnANCo3bOwEoF6VHJIgwNC2fgqUaYyCUggaM5iOysvQWKCm4UM
         J/rLaXXiexOlBaYlowbNtpKNK+q0+miJ4p54kjFVOkN+s1bd8mLtfibEjHx7FSDgoChh
         5MoeYXqh+YyJVupCXHaMHkOtrJjH0ZqRVWr8y3PYtJ6vAgVpJn3k0UbOxCt6Wb5OTASU
         15/w==
X-Gm-Message-State: AFq9FYJX4LJjLBg6IB0hpb9mTI5198AcB0uR5c4A0O2uPJfkHPI6yFo1
	e8uFgES05RnjR6Rp8bk6+bI0GhI+CK87v4ZlyH8yDuoc1L729rPQRQIn8uR1WGmYu4o=
X-Gm-Gg: AYBFou2IrF0IaTZnEir/sCKbPdcyskFj3/HJnQc2Ukpk7SSI6NtN4p/3tdUPVZ5rFQq
	1KZqNyyjrZJuItUOX/2SBSUL4kf5h1b3uE2An2yiUP3nH6vlNKcHOTd8oVCwBb3j/gVPQneC65W
	yG8MPHkky0BJC3vDHnl1BcgeYihtyOqesJlbzUBbKRwu8RIfmgGGmjwPhCBPs/sI7JVQ0SImV17
	d+IRczo+0ZpAFyxpNJTLm384pridBHyYOs/TeGMBaYie/QkoADhRoeBSRsIzWvPjAJIaJecUzrN
	HpMPCfCMj5iOB3Qe8q7zvGivYLpwvACnM0Fty3Lm1FfSnhtRxO5Nli5P/62PtdyzIQjVi3aKIbM
	ExF7yIr0IKK4a7YtfdheOijR3EvLSYXF8LlKeu62900sqMDde6pGwhcMQ5gH2mDFsFJv/M+NSZ8
	I5iKdgrOzqt+ZQdoAgZxhwZG954gHup3h68vShkUv73+kAGV6n4lwL0cU2xE5/s5F+gALqoZRIF
	9++uZa+J5GFMU5qSUgl/jmq/wEpF7+WiuYqVLnGQp3RL6SNw/ubX7OyZH9WRfHS1xw5rwu69UiB
	iP/xp/gTLM8YCZqZ2BEj8svHSjMGLp9SVbcPUltXnjwy2Ehj0lny5c2JjyMBEDifnMYZRAexV6v
	C4wjHYxBt/HazFauiGqU+bCF3yK3L7EEkQghdSYnfg7WhNdU0v+Xn3pOwE4TCNDVcxRLbTnrk/T
	LFxCZvAOHekFbw1Scllfmx9Q9xtag91NCKXET+SwjOI7SfBS5nOwl0V/pIvGw84jNgfC5yvhaAh
	Vg4Y2DdVUYPUdaV9QHbQlN7YT2b/Ikc2UbZjPI8EjTe7YYVXj9P
X-Received: by 2002:a05:6300:14d:b0:3de:4c08:174 with SMTP id adf61e73a8af0-3e3766520cemr1118537637.33.1792738458842;
        Thu, 22 Oct 2026 23:54:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 21/29] nushell: Fix build for riscv32 musl
Date: Thu, 22 Oct 2026 23:53:42 -0700
Message-ID: <20261023065350.3228996-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131345
Content-Type: text/plain; charset="utf-8"

Add patches to the vendored crates:

- libc: Add the syscall numbers 443 to 450, which riscv32 musl lacks
  and rustix needs for SYS_futex_waitv.
- fff-search, rmcp, nu-command and nu-dap: Use the 64-bit atomics from
  portable-atomic on targets without 64-bit atomics, where std does not
  provide them, and record the dependency in Cargo.lock since the build
  uses --frozen.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...scv32-Add-syscall-numbers-443-to-450.patch |  39 +++++++
 ...mic-for-AtomicU64-on-targets-without.patch | 108 ++++++++++++++++++
 ...mic-for-AtomicU64-on-targets-without.patch |  97 ++++++++++++++++
 ...ortable-atomic-for-AtomicU64-on-targ.patch |  66 +++++++++++
 ...ble-atomic-for-64-bit-atomics-on-tar.patch |  77 +++++++++++++
 ...dd-portable-atomic-to-patched-crates.patch |  49 ++++++++
 .../nushell/nushell_0.116.1.bb                |   8 ++
 7 files changed, 444 insertions(+)
 create mode 100644 meta-oe/recipes-extended/nushell/nushell/0001-musl-risc=
v32-Add-syscall-numbers-443-to-450.patch
 create mode 100644 meta-oe/recipes-extended/nushell/nushell/0002-Use-porta=
ble-atomic-for-AtomicU64-on-targets-without.patch
 create mode 100644 meta-oe/recipes-extended/nushell/nushell/0003-Use-porta=
ble-atomic-for-AtomicU64-on-targets-without.patch
 create mode 100644 meta-oe/recipes-extended/nushell/nushell/0004-nu-comman=
d-Use-portable-atomic-for-AtomicU64-on-targ.patch
 create mode 100644 meta-oe/recipes-extended/nushell/nushell/0005-nu-dap-Us=
e-portable-atomic-for-64-bit-atomics-on-tar.patch
 create mode 100644 meta-oe/recipes-extended/nushell/nushell/0006-Cargo.loc=
k-Add-portable-atomic-to-patched-crates.patch

diff --git a/meta-oe/recipes-extended/nushell/nushell/0001-musl-riscv32-Add=
-syscall-numbers-443-to-450.patch b/meta-oe/recipes-extended/nushell/nushel=
l/0001-musl-riscv32-Add-syscall-numbers-443-to-450.patch
new file mode 100644
index 0000000000..64e8ca3e4b
--- /dev/null
+++ b/meta-oe/recipes-extended/nushell/nushell/0001-musl-riscv32-Add-syscal=
l-numbers-443-to-450.patch
@@ -0,0 +1,39 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 10:00:00 -0700
+Subject: [PATCH] musl/riscv32: Add syscall numbers 443 to 450
+
+The riscv32 musl syscall list stops at SYS_mount_setattr (442), while
+the other musl targets and riscv32 glibc also define the newer generic
+syscalls. rustix uses SYS_futex_waitv, so it fails to build for
+riscv32 musl:
+
+  error[E0425]: cannot find value `SYS_futex_waitv` in this scope
+     --> rustix-1.1.4/src/backend/libc/thread/syscalls.rs:678:15
+
+Add quotactl_fd, landlock_*, memfd_secret, process_mrelease,
+futex_waitv and set_mempolicy_home_node, which use the asm-generic
+numbers on riscv32 as well.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/unix/linux_like/linux/musl/b32/riscv32/mod.rs | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs
+@@ -623,6 +623,14 @@
+ pub const SYS_process_madvise: c_long =3D 440;
+ pub const SYS_epoll_pwait2: c_long =3D 441;
+ pub const SYS_mount_setattr: c_long =3D 442;
++pub const SYS_quotactl_fd: c_long =3D 443;
++pub const SYS_landlock_create_ruleset: c_long =3D 444;
++pub const SYS_landlock_add_rule: c_long =3D 445;
++pub const SYS_landlock_restrict_self: c_long =3D 446;
++pub const SYS_memfd_secret: c_long =3D 447;
++pub const SYS_process_mrelease: c_long =3D 448;
++pub const SYS_futex_waitv: c_long =3D 449;
++pub const SYS_set_mempolicy_home_node: c_long =3D 450;
+=20
+ // Plain syscalls aliased to their time64 variants
+ pub const SYS_clock_gettime: c_long =3D SYS_clock_gettime64;
diff --git a/meta-oe/recipes-extended/nushell/nushell/0002-Use-portable-ato=
mic-for-AtomicU64-on-targets-without.patch b/meta-oe/recipes-extended/nushe=
ll/nushell/0002-Use-portable-atomic-for-AtomicU64-on-targets-without.patch
new file mode 100644
index 0000000000..3798955320
--- /dev/null
+++ b/meta-oe/recipes-extended/nushell/nushell/0002-Use-portable-atomic-for=
-AtomicU64-on-targets-without.patch
@@ -0,0 +1,108 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 11:00:00 -0700
+Subject: [PATCH] Use portable-atomic for AtomicU64 on targets without 64-b=
it
+ atomics
+
+std only provides AtomicU64 on targets with 64-bit atomics, so
+fff-search fails to build for e.g. riscv32:
+
+  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
+   --> src/rescan_throttle.rs:1:25
+    |
+  1 | use std::sync::atomic::{AtomicU64, Ordering};
+    |                         ^^^^^^^^^ no `AtomicU64` in `sync::atomic`
+
+The counters, timestamps and ids kept in AtomicU64 need 64 bits, so
+use the AtomicU64 from portable-atomic on such targets instead,
+through a crate-level import, and keep std's on all other targets.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Cargo.toml             | 5 +++++
+ src/lib.rs             | 6 ++++++
+ src/log.rs             | 3 ++-
+ src/rescan_throttle.rs | 3 ++-
+ src/types.rs           | 4 +++-
+ src/watcher/watch.rs   | 3 ++-
+ 6 files changed, 20 insertions(+), 4 deletions(-)
+
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -320,6 +320,11 @@
+ version =3D "0.3"
+ features =3D ["env-filter"]
+=20
++[target."cfg(not(target_has_atomic =3D \"64\"))".dependencies.portable-at=
omic]
++version =3D "1.13.1"
++features =3D ["fallback"]
++default-features =3D false
++
+ [target."cfg(unix)".dependencies.signal-hook-registry]
+ version =3D "1.4"
+=20
+--- a/src/lib.rs
++++ b/src/lib.rs
+@@ -103,6 +103,12 @@
+      Enable one, e.g. `--features ripgrep` or `--features zlob`."
+ );
+=20
++// std only provides AtomicU64 on targets with 64-bit atomics.
++#[cfg(target_has_atomic =3D "64")]
++pub(crate) use std::sync::atomic::AtomicU64;
++#[cfg(not(target_has_atomic =3D "64"))]
++pub(crate) use portable_atomic::AtomicU64;
++
+ /// Primary entry points with thread-safe [`SharedFilePicker`](shared::Fi=
lePicker) instance
+ pub mod shared;
+ pub use shared::*;
+--- a/src/log.rs
++++ b/src/log.rs
+@@ -135,7 +135,8 @@
+ const DEFAULT_RETAIN_RUNS: usize =3D 20;
+=20
+ pub fn generate_trace_id() -> String {
+-    use std::sync::atomic::{AtomicU64, Ordering};
++    use crate::AtomicU64;
++    use std::sync::atomic::Ordering;
+     static TRACE_COUNTER: AtomicU64 =3D AtomicU64::new(0);
+=20
+     let nanos =3D std::time::SystemTime::now()
+--- a/src/rescan_throttle.rs
++++ b/src/rescan_throttle.rs
+@@ -1,6 +1,7 @@
+-use std::sync::atomic::{AtomicU64, Ordering};
++use std::sync::atomic::Ordering;
+ use std::time::Instant;
+=20
++use crate::AtomicU64;
+ use crate::constants::{
+     LARGE_INDEX_FILE_COUNT, RESCAN_MIN_INTERVAL, RESCAN_MIN_INTERVAL_LARG=
E_INDEX,
+ };
+--- a/src/types.rs
++++ b/src/types.rs
+@@ -2,7 +2,9 @@
+ use std::path::{Path, PathBuf};
+ #[cfg(not(target_os =3D "windows"))]
+ use std::sync::atomic::AtomicPtr;
+-use std::sync::atomic::{AtomicI32, AtomicU8, AtomicU64, AtomicUsize, Orde=
ring};
++use std::sync::atomic::{AtomicI32, AtomicU8, AtomicUsize, Ordering};
++
++use crate::AtomicU64;
+=20
+ #[cfg(not(target_os =3D "windows"))]
+ use crate::constants::{FRESH_MMAP_THRESHOLD, MMAP_THRESHOLD};
+--- a/src/watcher/watch.rs
++++ b/src/watcher/watch.rs
+@@ -1,9 +1,10 @@
+ use crate::error::Error;
+ use crate::index::constraints::{GlobPattern, compile_one, glob_matches_in=
to};
++use crate::AtomicU64;
+ use parking_lot::Mutex;
+ use std::path::{Path, PathBuf};
+ use std::sync::Arc;
+-use std::sync::atomic::{AtomicBool, AtomicU64, Ordering};
++use std::sync::atomic::{AtomicBool, Ordering};
+ use std::sync::mpsc;
+ use tracing::{debug, error};
+=20
diff --git a/meta-oe/recipes-extended/nushell/nushell/0003-Use-portable-ato=
mic-for-AtomicU64-on-targets-without.patch b/meta-oe/recipes-extended/nushe=
ll/nushell/0003-Use-portable-atomic-for-AtomicU64-on-targets-without.patch
new file mode 100644
index 0000000000..2d17e32594
--- /dev/null
+++ b/meta-oe/recipes-extended/nushell/nushell/0003-Use-portable-atomic-for=
-AtomicU64-on-targets-without.patch
@@ -0,0 +1,97 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 11:30:00 -0700
+Subject: [PATCH] Use portable-atomic for AtomicU64 on targets without 64-b=
it
+ atomics
+
+std only provides AtomicU64 on targets with 64-bit atomics, so rmcp
+fails to build for e.g. riscv32:
+
+  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
+     --> src/service.rs:455:17
+      |
+  455 |     sync::{Arc, atomic::AtomicU64},
+      |                 ^^^^^^^^---------
+      |                         |
+      |                         no `AtomicU64` in `sync::atomic`
+
+The request id and control generation counters are 64-bit, so use the
+AtomicU64 from portable-atomic on such targets instead, through a
+crate-level import, and keep std's on all other targets.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Cargo.toml              | 5 +++++
+ src/lib.rs              | 8 ++++++++
+ src/service.rs          | 4 +++-
+ src/transport/worker.rs | 3 ++-
+ 4 files changed, 18 insertions(+), 2 deletions(-)
+
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -930,6 +930,11 @@
+ [dev-dependencies.url]
+ version =3D "2.4"
+=20
++[target.'cfg(not(target_has_atomic =3D "64"))'.dependencies.portable-atom=
ic]
++version =3D "1.13.1"
++features =3D ["fallback"]
++default-features =3D false
++
+ [target.'cfg(all(target_family =3D "wasm", target_os =3D "unknown"))'.dep=
endencies.chrono]
+ version =3D "0.4.38"
+ features =3D [
+--- a/src/lib.rs
++++ b/src/lib.rs
+@@ -2,6 +2,14 @@
+ #![cfg_attr(docsrs, allow(unused_attributes))]
+ #![doc =3D include_str!("../README.md")]
+=20
++// std only provides AtomicU64 on targets with 64-bit atomics.
++#[cfg(target_has_atomic =3D "64")]
++#[allow(unused_imports)]
++pub(crate) use std::sync::atomic::AtomicU64;
++#[cfg(not(target_has_atomic =3D "64"))]
++#[allow(unused_imports)]
++pub(crate) use portable_atomic::AtomicU64;
++
+ mod error;
+ pub use error::{ErrorData, RmcpError};
+=20
+--- a/src/service.rs
++++ b/src/service.rs
+@@ -452,12 +452,14 @@
+ use std::{
+     collections::{HashMap, VecDeque},
+     ops::Deref,
+-    sync::{Arc, atomic::AtomicU64},
++    sync::Arc,
+     time::Duration,
+ };
+=20
+ use tokio::sync::mpsc;
+=20
++use crate::AtomicU64;
++
+ pub trait RequestIdProvider: Send + Sync + 'static {
+     fn next_request_id(&self) -> RequestId;
+ }
+--- a/src/transport/worker.rs
++++ b/src/transport/worker.rs
+@@ -3,7 +3,7 @@
+     collections::HashMap,
+     sync::{
+         Arc, Mutex, PoisonError, Weak,
+-        atomic::{AtomicU64, Ordering},
++        atomic::Ordering,
+     },
+     time::Duration,
+ };
+@@ -12,6 +12,7 @@
+ use tracing::{Instrument, Level};
+=20
+ use super::{IntoTransport, Transport};
++use crate::AtomicU64;
+ use crate::{
+     model::{CancelledNotification, JsonRpcMessage, RequestId},
+     service::{RxJsonRpcMessage, ServiceRole, TxJsonRpcMessage},
diff --git a/meta-oe/recipes-extended/nushell/nushell/0004-nu-command-Use-p=
ortable-atomic-for-AtomicU64-on-targ.patch b/meta-oe/recipes-extended/nushe=
ll/nushell/0004-nu-command-Use-portable-atomic-for-AtomicU64-on-targ.patch
new file mode 100644
index 0000000000..3d6f80977f
--- /dev/null
+++ b/meta-oe/recipes-extended/nushell/nushell/0004-nu-command-Use-portable=
-atomic-for-AtomicU64-on-targ.patch
@@ -0,0 +1,66 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 12:00:00 -0700
+Subject: [PATCH] nu-command: Use portable-atomic for AtomicU64 on targets
+ without 64-bit atomics
+
+std only provides AtomicU64 on targets with 64-bit atomics, so
+nu-command fails to build for e.g. riscv32:
+
+  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
+    --> src/filesystem/idx/state.rs:18:39
+
+The scan duration is kept in nanoseconds and needs 64 bits, so use the
+AtomicU64 from portable-atomic on such targets instead, through a
+crate-level import, and keep std's on all other targets.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Cargo.toml                   | 5 +++++
+ src/filesystem/idx/state.rs  | 3 ++-
+ src/lib.rs                   | 7 +++++++
+ 3 files changed, 14 insertions(+), 1 deletion(-)
+
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -596,6 +596,11 @@
+     "mode",
+ ]
+=20
++[target."cfg(not(target_has_atomic =3D \"64\"))".dependencies.portable-at=
omic]
++version =3D "1.13.1"
++features =3D ["fallback"]
++default-features =3D false
++
+ [target."cfg(unix)".dependencies.nix]
+ version =3D "0.31.3"
+ features =3D [
+--- a/src/filesystem/idx/state.rs
++++ b/src/filesystem/idx/state.rs
+@@ -13,9 +13,10 @@
+ use nu_protocol::shell_error::generic::GenericError;=0D
+ use nu_protocol::{ListStream, PipelineMetadata, Signals};=0D
+ use nu_utils::time::Instant;=0D
++use crate::AtomicU64;=0D
+ use pathdiff::diff_paths;=0D
+ use std::path::{Path, PathBuf};=0D
+-use std::sync::atomic::{AtomicBool, AtomicU64, Ordering};=0D
++use std::sync::atomic::{AtomicBool, Ordering};=0D
+ use std::sync::mpsc::{Receiver, RecvTimeoutError, Sender, channel};=0D
+ use std::sync::{Arc, Mutex, OnceLock};=0D
+ use std::time::Duration;=0D
+--- a/src/lib.rs
++++ b/src/lib.rs
+@@ -1,5 +1,12 @@
+ #![cfg_attr(not(feature =3D "os"), allow(unused))]=0D
+ #![doc =3D include_str!("../README.md")]=0D
++=0D
++// std only provides AtomicU64 on targets with 64-bit atomics.=0D
++#[cfg(target_has_atomic =3D "64")]=0D
++use std::sync::atomic::AtomicU64;=0D
++#[cfg(not(target_has_atomic =3D "64"))]=0D
++use portable_atomic::AtomicU64;=0D
++=0D
+ mod bytes;=0D
+ mod charting;=0D
+ mod conversions;=0D
diff --git a/meta-oe/recipes-extended/nushell/nushell/0005-nu-dap-Use-porta=
ble-atomic-for-64-bit-atomics-on-tar.patch b/meta-oe/recipes-extended/nushe=
ll/nushell/0005-nu-dap-Use-portable-atomic-for-64-bit-atomics-on-tar.patch
new file mode 100644
index 0000000000..1c53dd0a38
--- /dev/null
+++ b/meta-oe/recipes-extended/nushell/nushell/0005-nu-dap-Use-portable-ato=
mic-for-64-bit-atomics-on-tar.patch
@@ -0,0 +1,77 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 12:00:00 -0700
+Subject: [PATCH] nu-dap: Use portable-atomic for 64-bit atomics on targets
+ without them
+
+std only provides AtomicI64 and AtomicU64 on targets with 64-bit
+atomics, so nu-dap fails to build for e.g. riscv32:
+
+  error[E0425]: cannot find type `AtomicU64` in module `std::sync::atomic`
+     --> src/state.rs:428:37
+
+The protocol sequence number and the UI request ids are 64-bit, so use
+the atomics from portable-atomic on such targets instead, through
+crate-level imports, and keep std's on all other targets.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Cargo.toml          | 5 +++++
+ src/dap/protocol.rs | 4 +++-
+ src/lib.rs          | 6 ++++++
+ src/state.rs        | 2 +-
+ 4 files changed, 15 insertions(+), 2 deletions(-)
+
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -101,6 +101,11 @@
+ [dev-dependencies.typetag]
+ version =3D "0.2"
+=20
++[target."cfg(not(target_has_atomic =3D \"64\"))".dependencies.portable-at=
omic]
++version =3D "1.13.1"
++features =3D ["fallback"]
++default-features =3D false
++
+ [target."cfg(unix)".dependencies.libc]
+ version =3D "0.2.185"
+=20
+--- a/src/dap/protocol.rs
++++ b/src/dap/protocol.rs
+@@ -9,7 +9,9 @@
+ use serde_json::Value as Json;=0D
+ use std::io::{BufRead, Write};=0D
+ use std::sync::Arc;=0D
+-use std::sync::atomic::{AtomicI64, Ordering};=0D
++use std::sync::atomic::Ordering;=0D
++=0D
++use crate::AtomicI64;=0D
+ =0D
+ #[derive(Debug, Deserialize)]=0D
+ pub struct Request {=0D
+--- a/src/lib.rs
++++ b/src/lib.rs
+@@ -35,6 +35,12 @@
+ // Tests may `unwrap` (matches nushell); production code stays `unwrap`-f=
ree.=0D
+ #![cfg_attr(test, allow(clippy::unwrap_used))]=0D
+ =0D
++// std only provides 64-bit atomics on targets that support them.=0D
++#[cfg(target_has_atomic =3D "64")]=0D
++use std::sync::atomic::{AtomicI64, AtomicU64};=0D
++#[cfg(not(target_has_atomic =3D "64"))]=0D
++use portable_atomic::{AtomicI64, AtomicU64};=0D
++=0D
+ mod debugger;=0D
+ mod engine;=0D
+ mod eval_scratch;=0D
+--- a/src/state.rs
++++ b/src/state.rs
+@@ -425,7 +425,7 @@
+ pub(crate) struct UiBridge {=0D
+     pub replies: Mutex<HashMap<u64, UiReply>>,=0D
+     pub cv: Condvar,=0D
+-    pub next_id: std::sync::atomic::AtomicU64,=0D
++    pub next_id: crate::AtomicU64,=0D
+ }=0D
+ =0D
+ /// How the client numbers lines and columns, from the `initialize` reque=
st.=0D
diff --git a/meta-oe/recipes-extended/nushell/nushell/0006-Cargo.lock-Add-p=
ortable-atomic-to-patched-crates.patch b/meta-oe/recipes-extended/nushell/n=
ushell/0006-Cargo.lock-Add-portable-atomic-to-patched-crates.patch
new file mode 100644
index 0000000000..48d1706b54
--- /dev/null
+++ b/meta-oe/recipes-extended/nushell/nushell/0006-Cargo.lock-Add-portable=
-atomic-to-patched-crates.patch
@@ -0,0 +1,49 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 12:00:00 -0700
+Subject: [PATCH] Cargo.lock: Add portable-atomic to patched crates
+
+fff-search, rmcp, nu-command and nu-dap are patched to depend on
+portable-atomic on targets without 64-bit atomics. The build uses
+--frozen, so record the dependencies in the lock file. portable-atomic
+1.13.1 is already locked.
+
+Upstream-Status: Inappropriate [OE-specific, follows the crate patches]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Cargo.lock | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -1629,6 +1629,7 @@
+  "notify 9.0.0-rc.4",
+  "parking_lot",
+  "pathdiff",
++ "portable-atomic",
+  "rayon",
+  "regex",
+  "regex-syntax",
+@@ -3732,6 +3733,7 @@
+  "os_pipe",
+  "pathdiff",
+  "percent-encoding",
++ "portable-atomic",
+  "print-positions",
+  "procfs",
+  "pure-rust-locales",
+@@ -3812,6 +3814,7 @@
+  "nu-protocol",
+  "nu-utils",
+  "parking_lot",
++ "portable-atomic",
+  "serde",
+  "serde_json",
+  "windows-sys 0.61.2",
+@@ -5512,6 +5515,7 @@
+  "indexmap",
+  "pastey",
+  "pin-project-lite",
++ "portable-atomic",
+  "rand 0.10.2",
+  "rmcp-macros",
+  "schemars",
diff --git a/meta-oe/recipes-extended/nushell/nushell_0.116.1.bb b/meta-oe/=
recipes-extended/nushell/nushell_0.116.1.bb
index 9cb9ff917d..3d33daaee9 100644
--- a/meta-oe/recipes-extended/nushell/nushell_0.116.1.bb
+++ b/meta-oe/recipes-extended/nushell/nushell_0.116.1.bb
@@ -13,6 +13,14 @@ LIC_FILES_CHKSUM =3D " \
 DEPENDS =3D "libgit2 sqlite3"
=20
 SRC_URI =3D "crate://crates.io/nu/${PV};name=3Dnu"
+SRC_URI +=3D " \
+    file://0001-musl-riscv32-Add-syscall-numbers-443-to-450.patch;patchdir=
=3D${CARGO_VENDORING_DIRECTORY}/libc-0.2.186 \
+    file://0002-Use-portable-atomic-for-AtomicU64-on-targets-without.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/fff-search-0.11.0 \
+    file://0003-Use-portable-atomic-for-AtomicU64-on-targets-without.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/rmcp-3.4.0 \
+    file://0004-nu-command-Use-portable-atomic-for-AtomicU64-on-targ.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/nu-command-0.116.1 \
+    file://0005-nu-dap-Use-portable-atomic-for-64-bit-atomics-on-tar.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/nu-dap-0.116.1 \
+    file://0006-Cargo.lock-Add-portable-atomic-to-patched-crates.patch \
+"
 SRC_URI[nu.sha256sum] =3D "62e21f2d6a14430ae2701a4e6f11be42d40a11204c204be=
f32a8b9879f79e767"
=20
 S =3D "${CARGO_VENDORING_DIRECTORY}/nu-${PV}"
