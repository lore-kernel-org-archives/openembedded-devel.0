Return-Path: <debrabander@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCB7C52D7C
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 08:45:46 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.55283.1723106738892568934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 01:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZuYnTdYw;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: debrabander@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52efbb55d24so1203065e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 01:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723106737; x=1723711537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJztW58+T1iMCB7pIzDPPwrWGKMpM0P/GCJp3jyJNCs=;
        b=ZuYnTdYwjgMwmGABFIjOK3YQSOAfhW36zbDvC3n/S8yP2PUITx3PKrERMbPUwAEu4Z
         BeXv9swxF2T3dl6hKDkVC1ntK3B9Wc0W/Q/zPUNjymmJCspbWVEx5lJ2IAyDQAg/5wKC
         xOs0hVunwCsxYfCWVuSOqN2O0lEbCDRxw0f6YJzzZzddVFexhYPNQUdaLFlYgT62/BM6
         dKkDfVpXHfFLQ7k9bcjl2Wtg1j4c1b2UBYSoc4aWw2MpNbR5s6AK+8SI71AIqdz53BVI
         /GKbQ0Tsz0CgI1aizTCGzMk6W58hFYc31oLJmSI7voMq1K0CLNI8RYfD3GJzdta4peZD
         KEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723106737; x=1723711537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJztW58+T1iMCB7pIzDPPwrWGKMpM0P/GCJp3jyJNCs=;
        b=MooL71BBnXlDYtTnFuQN8nf+u2I9cnWkizqrFvVens1s4wWhkm3XR402Cckm19Pf6H
         y/Rd2qNlRuaQvJ4GwS+sV7DhTmj68aYuHcc6OCkmp5jd0eEzFgm6KavLmytESR0DvcWi
         Sk4Uz5ucSqr/MD1zXAtiPhwqnfurKNji4ABownF+F2vIVWAZdeGWhY92jCCLu8c6Y2LG
         M1+pM3eDnhnwLmFBNDdX9iO+ytqSpj4gIU3f2liMB7LIJ+okhja4ys0z4YhVYATqSYd+
         TipoK6vWmgBz2LsP2+vjaA8qmGYXErv/V/Ev9HTSZl+fELgAc9e1p1rYetaAu3mjWEMC
         lTrQ==
X-Gm-Message-State: AOJu0Yxd2UTKy7ca25cYuMCcdcUM0cP954fKvx75AxjKpnIZfgP6Mb1Z
	Oj0tPsYKiCEkA3pIrLcWvF/cildRQB72AYjWq9eMY8alf865CbI6SCEGNQ==
X-Google-Smtp-Source: AGHT+IHScPXnILQIoij6gTDmvTTqLmDPXP0G0DUevu5T4hYx90ZWpRGmArIBrEDE93wITxwzqJO9eQ==
X-Received: by 2002:a05:6512:ac6:b0:52c:e17c:cd7b with SMTP id 2adb3069b0e04-530e582085cmr1094281e87.22.1723106736500;
        Thu, 08 Aug 2024 01:45:36 -0700 (PDT)
Received: from win95.FOX.local ([89.205.132.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d437d4sm715764666b.132.2024.08.08.01.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 01:45:36 -0700 (PDT)
From: Frank de Brabander <debrabander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frank de Brabander <debrabander@gmail.com>
Subject: [meta-python][master][PATCH] python3-pydantic-core: fix TMPDIR path reference
Date: Thu,  8 Aug 2024 10:44:58 +0200
Message-Id: <20240808084458.1316-1-debrabander@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 08:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111648

Backport a new upstream fix to remove the TMPDIR
reference from the rust code.

Signed-off-by: Frank de Brabander <debrabander@gmail.com>
---
 ...Dont-embed-RUSTFLAGS-in-final-binary.patch | 47 +++++++++++++++++++
 .../python/python3-pydantic-core_2.18.4.bb    |  4 +-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch
new file mode 100644
index 000000000..1c195e294
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch
@@ -0,0 +1,47 @@
+From b3282b301096253a11b1f887f915d0a2a2183597 Mon Sep 17 00:00:00 2001
+From: Frank de Brabander <debrabander@gmail.com>
+Date: Thu, 8 Aug 2024 08:04:48 +0200
+Subject: [PATCH] Dont embed RUSTFLAGS in final binary
+
+Upstream-Status: Backport [https://github.com/pydantic/pydantic-core/commit/e07c41b3bad75948201a2201387225694c2fb501]
+---
+ build.rs   | 9 +++++++++
+ src/lib.rs | 5 ++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/build.rs b/build.rs
+index 7f59e1f..7fe6490 100644
+--- a/build.rs
++++ b/build.rs
+@@ -35,6 +35,15 @@ fn main() {
+     if let Some(true) = version_check::supports_feature("coverage_attribute") {
+         println!("cargo:rustc-cfg=has_coverage_attribute");
+     }
++
++    if std::env::var("RUSTFLAGS")
++        .unwrap_or_default()
++        .contains("-Cprofile-use=")
++    {
++        println!("cargo:rustc-cfg=specified_profile_use");
++    }
++    println!("cargo:rustc-check-cfg=cfg(specified_profile_use)");
++
+     generate_self_schema();
+     println!("cargo:rustc-env=PROFILE={}", std::env::var("PROFILE").unwrap());
+ }
+diff --git a/src/lib.rs b/src/lib.rs
+index d55e836..206a7a1 100644
+--- a/src/lib.rs
++++ b/src/lib.rs
+@@ -111,7 +111,10 @@ pub fn build_info() -> String {
+     format!(
+         "profile={} pgo={}",
+         env!("PROFILE"),
+-        option_env!("RUSTFLAGS").unwrap_or("").contains("-Cprofile-use="),
++        // We use a `cfg!` here not `env!`/`option_env!` as those would
++        // embed `RUSTFLAGS` into the generated binary which causes problems
++        // with reproducable builds.
++        cfg!(specified_profile_use),
+     )
+ }
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
index eb5599199..0ab1873a0 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
@@ -8,7 +8,8 @@ HOMEPAGE = "https://github.com/pydantic/pydantic-core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
-SRC_URI += "file://0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch"
+SRC_URI += "file://0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch \
+            file://0002-Dont-embed-RUSTFLAGS-in-final-binary.patch"
 SRC_URI[sha256sum] = "ec3beeada09ff865c344ff3bc2f427f5e6c26401cc6113d77e372c3fdac73864"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
@@ -25,7 +26,6 @@ RDEPENDS:${PN} += " \
 "
 
 INSANE_SKIP:${PN} = "already-stripped"
-INSANE_SKIP:${PN} += "buildpaths"
 
 inherit ptest
 SRC_URI += "file://run-ptest"
-- 
2.39.2


