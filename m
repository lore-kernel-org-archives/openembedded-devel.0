Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049ACC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 13:56:56 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.84615.1723211808155925989
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 06:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o3dLzj0o;
 spf=pass (domain: konsulko.com, ip: 209.85.210.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-710e39961f4so17170b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723211807; x=1723816607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QztOo/mLxeh6SUqqStkqzIBOrfzTiOZbNn9WDLbadr8=;
        b=o3dLzj0oAcxuYD6ULN2muJHxw+toPMPaWk65HoBbynWy+1M5sB5h9RUgrXc/e0h6at
         Y6dF/gp/ha1ogpLjtUrRq2gDU4PLLUvV5CiaUbyt0COK0kd/+Y0ohxfUmodISNAbioAu
         eTo/pH6lV493XjUIk9vdc9ALn24QdjdkkZrd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723211807; x=1723816607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QztOo/mLxeh6SUqqStkqzIBOrfzTiOZbNn9WDLbadr8=;
        b=NfDmjdPLumtHzYnNzhLdBLOmQW9mGnaess9gpIqX7FaHSkeEMxoRyDFG9gRH07JrZi
         7CHfnwSsITQCZV1qEHeVdvTY5mF+95cVMyCxi6GXY0y5axwxEai8UKJa2ILNdtR3oCgZ
         79kqs0bnNs9inABz8bkiTSUJ7CgvBN1yASVfOZHdW7bHKtSpdv58pl5HHA1tI2IIhCdw
         QL/N5tz85FlQf3x98Rj71hqTSUTn2U7eNFyniy0cxow7d3fRHUzY0Z5PTE/z6FsWVPcy
         yWyVJzswDu1Nqv8CHIFu/KTwtF4xCOEkzr2gRdcRP5PMh6WftxWYFv0zsZjjHgUQvCq7
         JbOA==
X-Gm-Message-State: AOJu0Yxr9O/ypFZ/Zxj0CFzNNDhhvNHaRbfXAZI75igbLq8FZtFC/fYu
	gFdK/MuT9NBc1AfDCzQ5QDWtxmX/uBcI89eaFRR5jlOlDNRKgJf2cDR3dDxE83k7HBhshP2VCyU
	UpJU=
X-Google-Smtp-Source: AGHT+IFFxMGjXGtJck9b5klXslEBQhSgNBg9QoWccs1iitbSNgl7CRTNJH/p4+v/jEV4i0ZFkSerGQ==
X-Received: by 2002:a05:6a00:a2a:b0:706:6962:4b65 with SMTP id d2e1a72fcca58-710dc761c05mr1652721b3a.14.1723211806924;
        Fri, 09 Aug 2024 06:56:46 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e94d2sm2718003b3a.172.2024.08.09.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 06:56:46 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH v2 5/5] python3-pydantic-core: backport patch
Date: Fri,  9 Aug 2024 06:56:01 -0700
Message-ID: <20240809135640.1496340-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <b7551f79ae4b124b136b485502c963c62edbafe4.1723134758.git.tim.orling@konsulko.com>
References: <b7551f79ae4b124b136b485502c963c62edbafe4.1723134758.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 13:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111693

From: Tim Orling <tim.orling@konsulko.com>

We've seen TMPDIR [build-paths] contamination in the
built pydantic_core/_pydantic_core.cpython-*-*-linux-gnu.so

See discussion upstream in:
https://github.com/pydantic/pydantic-core/issues/1365

Backport fix from:
https://github.com/pydantic/pydantic-core/commit/e07c41b3bad75948201a2201387225694c2fb501

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
* actually attach the patch

 ...embed-RUSTFLAGS-in-final-binary-1396.patch | 58 +++++++++++++++++++
 .../python/python3-pydantic-core_2.21.0.bb    |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch
new file mode 100644
index 0000000000..5d732d5bee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch
@@ -0,0 +1,58 @@
+From e07c41b3bad75948201a2201387225694c2fb501 Mon Sep 17 00:00:00 2001
+From: Boxy <rust@boxyuwu.dev>
+Date: Wed, 7 Aug 2024 17:11:02 +0100
+Subject: [PATCH] dont embed `RUSTFLAGS` in final binary (#1396)
+
+Upstream-Status: Backport [https://github.com/pydantic/pydantic-core/pull/1396]
+
+See discussion upstream in:
+https://github.com/pydantic/pydantic-core/issues/1365
+
+Backport fix from:
+https://github.com/pydantic/pydantic-core/commit/e07c41b3bad75948201a2201387225694c2fb501
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ build.rs   | 9 +++++++++
+ src/lib.rs | 5 ++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/build.rs b/build.rs
+index d1093c74..f8f66901 100644
+--- a/build.rs
++++ b/build.rs
+@@ -36,6 +36,15 @@ fn main() {
+         println!("cargo:rustc-cfg=has_coverage_attribute");
+     }
+     println!("cargo:rustc-check-cfg=cfg(has_coverage_attribute)");
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
+index eb598424..eb486da6 100644
+--- a/src/lib.rs
++++ b/src/lib.rs
+@@ -98,7 +98,10 @@ pub fn build_info() -> String {
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
+-- 
+2.46.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
index b4ca66a54d..b24e141f60 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 require ${BPN}-crates.inc
 
 SRC_URI += "file://run-ptest"
+SRC_URI += "file://0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch"
 
 SRC_URI[sha256sum] = "79c747f9916e5b6cb588dfd994d9ac15a93e43eb07467d9e6f24d892c176bbf5"
 
-- 
2.46.0


