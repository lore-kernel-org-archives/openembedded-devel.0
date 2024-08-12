Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469B2C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 03:28:51 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.38432.1723433327669754092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 20:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RixBQCD3;
 spf=pass (domain: konsulko.com, ip: 209.85.216.48, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d1e3381cb1so1831606a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 20:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723433327; x=1724038127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEeHG4pucjel8x7Lu27av00Fr2GsLTvpcQR3e/BESGQ=;
        b=RixBQCD3woK51WoQqRzmlZCC7WDcD8OQwMlS6v3bWAZnNUy+4f5ShfI+mXVt53xaLj
         pZjH6fAJ5V8j4Hd54Q4oLM1A5Lq7dTVzq+EB4CaGj4iRUYyHlPa6lgD1K6KNPQGjYnkT
         54R2TiCrPcYbCZzb6KW9EQArvDj1l8vpPbTzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723433327; x=1724038127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEeHG4pucjel8x7Lu27av00Fr2GsLTvpcQR3e/BESGQ=;
        b=Vjf/fwjvcAlR4llVbtI/SCTfpb25pJWCAF+e/c92KfXfUqWGuxVoX3jYzJLgVMeHvR
         IJ0Psjy30dMInb/xJFbMh249XYOXqCtm4KiCxCFvf8mqf9wVveYUSdL8VUvzOVHGZQw4
         WvUaVs7kj3ie0WCC0RsSPRckKeXG+Sj4YY1M4OCB8vJSxp+n+vLldSV9r4/SGYYPh1CM
         VcDR1PS4p4UhAq45fcIBPA+lpYPOGgXOTsdYEm+/3IAgotavONat5odvASCa92hjh3MB
         yNaC8HEwcYMwH3xrn4gBk+gQXeNZyIgdfJymnpnJNsfxx2446D6fO9QHKhavgy94LPxq
         5avA==
X-Gm-Message-State: AOJu0YyxJQGlOpNUS0s+ZzMz2cxG7WNvzbTfNPWxwF9Bcjl+zlnYZU3S
	zYGaauP8sJDrk2Wgo0NyrEVKAmHxpyxogt/xQbjpjMXPoOi5WeyLcc5UrNKXglQ9b/1XbNEJJCs
	fmt4=
X-Google-Smtp-Source: AGHT+IGYLXoKUxO9yAtcExr5Pgu3sFB3AzVEgl990YgyBktQ5tmPU5Pc5v/1PokDQ77s6oaghy2PIQ==
X-Received: by 2002:a17:90a:3044:b0:2d1:c806:2be9 with SMTP id 98e67ed59e1d1-2d1e805092dmr8628183a91.28.1723433326632;
        Sun, 11 Aug 2024 20:28:46 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9c5e053sm7128215a91.2.2024.08.11.20.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:28:46 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Subject: [scarthgap][meta-python][PATCH 5/6] python3-pydantic-core: fix TMPDIR path reference
Date: Sun, 11 Aug 2024 20:28:13 -0700
Message-ID: <ffc854c54dfdb39cbd7b972b13098e2407c0e9ac.1723432397.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723432397.git.tim.orling@konsulko.com>
References: <cover.1723432397.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 03:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111763

From: Frank de Brabander <debrabander@gmail.com>

Backport a new upstream fix to remove the TMPDIR
reference from the rust code.

Signed-off-by: Frank de Brabander <debrabander@gmail.com>

We've seen TMPDIR [build-paths] contamination in the
built pydantic_core/_pydantic_core.cpython-*-*-linux-gnu.so

See discussion upstream in:
https://github.com/pydantic/pydantic-core/issues/1365

Backport fix from:
https://github.com/pydantic/pydantic-core/commit/e07c41b3bad75948201a2201387225694c2fb501

Similar to Styhead 6f0a41130c0dcf80e22f6f3fd93d39369c235693, but for 2.18.4
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...Dont-embed-RUSTFLAGS-in-final-binary.patch | 47 +++++++++++++++++++
 .../python/python3-pydantic-core_2.18.4.bb    |  4 +-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch
new file mode 100644
index 0000000000..1c195e294b
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
index cd8ebf9c07..58afc6cd1c 100644
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
2.46.0


