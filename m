Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1654.1792738468449510841
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nycpPuzM;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso321780b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738468; x=1793343268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djeTRLsgTMonT5sUts5WwuNXDHob1ql34+uf95eHp6A=;
        b=nycpPuzMgr8EZc5uRmMEp12UH0mRTsbICpWvkQiMNwF1A5wfK6N4nlJGnR9Uelri9O
         yzrKje9EQns+FZdaDT5calafr8aoKF8zFqqY8U6ZY6pyjndVJjfFFn61UBhWkWJlkqcP
         fy4uphHZG9dEbq7/3V0XwhRJoFc4G37D+cg1Foge6e8kkxVeDnjyC4KV+kg/qX69kWsg
         h4PbB/2OHrWSGuUi4RI14g9uuOC14vU0AdKgF7iATqcZZNNnKPS6W3g1Vg9hwLrvCuRB
         xCgKEEESsyOiDQ+09JfvGxcnL1+Uq3JDzO5iML3q001SHnZFavgJhkzvzu22u4WZD0ZS
         oNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738468; x=1793343268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=djeTRLsgTMonT5sUts5WwuNXDHob1ql34+uf95eHp6A=;
        b=qzPcHvcQ9tGVMTnCUSKuUW+AHcLxz7z0vmjMG1yds3OlqxsS/fAZij9SDUkJ0K1ZfC
         vS6B4A+m6cXo8218iFu9JeOIvONGAdcTPyOu2WZW5X1dunWC4yjADV+xQEYN1UsQc7iH
         waI45ylTqB5RjUr/L3QNbvj/3C8LckLBx31NT3ToBkU52FiTcbJcVwlEwQKPjqbr0V/y
         OrL6kI7PF2VTlP2Y3t47KMzrE9NIuN+5pvg/V9MCHiV7MneyZSaSHurkys2Rx3Fg06Qy
         Zc+gShxfE5SKHR6hDsugrreL46QO8ViohieyK0lyZCMx3gmRfXPSWOC0/FHFBDHG99v8
         dqQw==
X-Gm-Message-State: AFq9FYKszU+hB+on4rr5ZXwsRemLeCxfxDCMMbq+w1CLCkLUYQYF6M8d
	ZTokz0d3z5jSRsKsekC84SvINBesm/XiVwEylXIbpRrlbzNRZInBIpbE+52Wf3rMDXM=
X-Gm-Gg: AYBFou3gK/p6NeyXKAYET5cX358gIkHTZimhmFQO2oeoutCZfJCYQk7wTRm/iTyaSoL
	M0BlsIGN6LKcsR7YTlii9muokC83ed0XUQzUfzXi0vaKnwA4M8t/PLiHPEc5GnLu7geXcDtxinw
	yXHmskV+Jgs/xiJ4r/dnb9CkdSAeXJa5rrl+Uco5kHB0oIxed7YlmgXdhXWoSVdkBqTVgxkcmxW
	tiNJJdWmLHtZlOS8Fj7UNocIjHLNZ3Y1BLBOqUNAZF1x9LqibOr3eM+hb3QFU//UFqgPU4m2qqF
	1JuGGrGFZoLMtK3pj9trcQsaKyHU6I+nYtIMsalPom4uHcoU499Ni8LVn5/ULpSJDAkJSrhKGGr
	4nQUVBUJzoQEtFWxAJx67e7nDkXa3EVvijZSeqjM9GT+eQxXlcxnAOHS3xCO9F+bJqd9VBgqmVE
	xe77zHJdxeldtpBiaVQq/CO0JsmJ4SRbMGr04/b+1Pg7BnAu9JuPrnaaq0ohmpoyjVvX15ZeYhH
	9EqNnWbE8RO4o/zxQmRaobVu6LK+sfmqnbGSQqNwLCzs46N+xtL7aLMVR3PB3IcUZOr8S9gcRxI
	r7+V+E30/yPhIPgN9t88kCv8zI9S/Xa8dtykk2WtaWTt3a2+0WtVIITs1mIY0EZnqhwI2A+Iiwx
	l+aN1SJBisA8CMVdOUsRzcKzi1oN1Zw//meeoXO1PvHZmqQmASrZB3BXEg4atMoe+Qh1r1ZP8pt
	oARrSmErUdWuJSshlokioSGdNDLEiFYriQnV5+DK9WE53Zjy9xKLleK6uEQ0n5L0iHYA1wecOMR
	sfBX8PfW+Ckml9SEn2wOiMaXKa5eow=
X-Received: by 2002:a05:6a00:882:b0:899:e80c:1ec1 with SMTP id d2e1a72fcca58-8a2c63d12camr1291879b3a.18.1792738467814;
        Thu, 22 Oct 2026 23:54:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 29/29] gnome-commander: Fix build on targets without 64-bit atomics
Date: Thu, 22 Oct 2026 23:53:50 -0700
Message-ID: <20261023065350.3228996-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131353
Content-Type: text/plain; charset="utf-8"

The object id counter in src/weak_ref.rs is a std AtomicU64, which is
not available on targets without 64-bit atomics, so the build fails
for riscv32:

  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`

Add a patch that keeps the 64-bit counter in a Mutex instead. The code
has since been removed upstream.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...se-a-Mutex-for-the-object-id-counter.patch | 59 +++++++++++++++++++
 .../gnome-commander/gnome-commander_2.0.3.bb  |  4 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0002-weak_ref-Use-a-Mutex-for-the-object-id-counter.patch

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0002-weak_ref-Use-a-Mutex-for-the-object-id-counter.patch b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0002-weak_ref-Use-a-Mutex-for-the-object-id-counter.patch
new file mode 100644
index 0000000000..eb253d9dc4
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0002-weak_ref-Use-a-Mutex-for-the-object-id-counter.patch
@@ -0,0 +1,59 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 20:00:00 -0700
+Subject: [PATCH] weak_ref: Use a Mutex for the object id counter
+
+std only provides AtomicU64 on targets with 64-bit atomics, so
+gnome-commander fails to build for e.g. riscv32:
+
+  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
+   --> src/weak_ref.rs:8:14
+
+The counter hands out the ids IdentityWeakRef uses for equality and
+hashing, so it has to stay 64-bit and must not wrap. Keep it in a
+Mutex<u64>, which works on every target. Ids are only allocated when an
+object gets its first weak reference, so the lock is uncontended in
+practice.
+
+Upstream-Status: Inappropriate [the code was removed upstream after 2.0.3]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/weak_ref.rs | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+--- a/src/weak_ref.rs
++++ b/src/weak_ref.rs
+@@ -3,10 +3,7 @@
+ // SPDX-License-Identifier: GPL-3.0-or-later
+
+ use gtk::{glib, glib::prelude::*};
+-use std::sync::{
+-    LazyLock,
+-    atomic::{AtomicU64, Ordering},
+-};
++use std::sync::{LazyLock, Mutex};
+
+ #[derive(Clone, Debug)]
+ pub struct IdentityWeakRef<T: ObjectType> {
+@@ -24,13 +21,20 @@
+ }
+
+ fn set_object_id<T: ObjectType>(obj: &T) -> u64 {
+-    static SEQ: AtomicU64 = AtomicU64::new(1);
++    // A Mutex rather than an AtomicU64, which std only provides on targets
++    // with 64-bit atomics. The id has to stay 64-bit so it does not wrap.
++    static SEQ: Mutex<u64> = Mutex::new(1);
+
+     unsafe {
+         match obj.qdata::<u64>(*ID_QUARK) {
+             Some(existing_id) => *(existing_id.as_ref()),
+             None => {
+-                let new_id = SEQ.fetch_add(1, Ordering::SeqCst);
++                let new_id = {
++                    let mut seq = SEQ.lock().unwrap();
++                    let id = *seq;
++                    *seq += 1;
++                    id
++                };
+                 obj.set_qdata(*ID_QUARK, new_id);
+                 new_id
+             }
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.0.3.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.0.3.bb
index 0be81a7290..c4c674b421 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.0.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.0.3.bb
@@ -24,7 +24,9 @@ REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 GIR_MESON_OPTION = ""

 SRC_URI[archive.sha256sum] = "e51178f3256de45324ffd928a4a144fa859a865662bf295129f0188d8d243b57"
-SRC_URI += "file://0001-meson-Support-cross-compilation-via-a-rust_target-cr.patch"
+SRC_URI += "file://0001-meson-Support-cross-compilation-via-a-rust_target-cr.patch \
+            file://0002-weak_ref-Use-a-Mutex-for-the-object-id-counter.patch \
+"

 require ${BPN}-crates.inc

