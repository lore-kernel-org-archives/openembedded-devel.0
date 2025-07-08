Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ABEC83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:59 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.5610.1752004673433103935
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rnm4GCtL;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso48004201fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004671; x=1752609471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3VjQYX3km3jT7oM+eDsu+3p9y36BTDVHptJgF2PIOw=;
        b=Rnm4GCtLrmp8XpedbspKhyAr+h8NNAQnSCjhYuKCi8pT+p9SCf6OcwFdbPav8atV87
         qJko/lr5kAi3eGgnn0Ws/APDc16s8Wya3MfdaFDii+ma3DYuDtbrmY97khm2wZODK9xf
         Bh8K9eJmg/sOeQEiDfVVRGh05gbyI9jBcPicJFV3kSGj24gMnyLkw8lwhKFZMlVqXxcP
         YH/4xzEYQEcdkHacSoTJDxyJP7YE5Q2rG8eXu+X2MFyzWyCu/+KVfA34j4Lldwx7Zq5r
         gf76Hky++Vng+suDDqWEu0BbqSS7oWAlbfvBDYury4eE8KdDuamW/v8GaxrYYovkI8cc
         fBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004671; x=1752609471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3VjQYX3km3jT7oM+eDsu+3p9y36BTDVHptJgF2PIOw=;
        b=gH3FFujmr0WX2Ze4RxPPAC/gdh4XulOp9tWLwxlZ7C7NblHEMJrUsdkhQOChSQ9Us9
         5tbaZMaaJjM4K4yUagbqfYlpqHIxjBqsWxhXDXC8h2zpFLua9CYZMIeprqspcnSdKCBl
         IpqdE3w/uClsGeKQT/VYo/bHC3UKrgEIbxi8vvbXbYtCM4BVhdBYylUbWgND5AmTtDo2
         y4mtfiBzVTABBQ2W36372OtByJwEPvNUdFXpJVts4v7QNg/rMxdAgQgMsi8bmc5fizht
         PK7Pw/wU6lvsRvEVEJC+7pwmvT6AC2k3xFjCGNrUQ7s4AfCFZXwlNGemSyRPecKDvYgM
         5Itw==
X-Gm-Message-State: AOJu0YxUvyx7tHtqvnsfQYJPQRQudr8NPFJTWDNe2yJkHQuj+pA6uXEp
	ueVaUlmuwqOT88yFDrg626KdmLkuKIEt+4baKuKHAtqvrBo3ekqkNWdssxT3+A==
X-Gm-Gg: ASbGncsJdymuDPNmd9plcJWQJ6qGD1DEmiYuX6Qrr3P27NGLmnDLWa+28XCh4hrnfOT
	PeyXxVcrAZWGNWD0PZ26y3yPMKB2FJ3Sz296mn/0dd/iNuApLTnVuc5wmZ4YvJFa9+CgCygG+pJ
	LlWgs+cbj47mBNDy0dWGxHguqbfse1OcdQKxBwWNP5Mx3QwT2sjrYl//cGtTWsLaXTnXF4D3ewJ
	Dj4agIOdC3eDYPfaX9S+QqAhNTf2AJSXBfW40SiQCwq3etobuQDn+NTrbhMblAS/h007U7R2ToT
	uXibQ3yG3mbH+yIHEh02PZSy/y35NEn7qepOAHul0bOUNVpBT/g9Gczj9qL7bFc29CLvZateDbW
	aiHU=
X-Google-Smtp-Source: AGHT+IEi0Ao5UhgUWhWdm4e0DXWlMGsCB3cDOd7vxV019XXMeMPeK4+h99kMiUmY1L7d+HxYa2rAUA==
X-Received: by 2002:a05:651c:550:b0:30b:ecfc:78bf with SMTP id 38308e7fff4ca-32f39a95da9mr13799371fa.5.1752004670968;
        Tue, 08 Jul 2025 12:57:50 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:50 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 19/20] snappy: Upgrade 1.1.10 -> 1.2.2 to to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:35 +0300
Message-ID: <20250708195636.1678606-19-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118341

- Dropped patch because already fixed in the newer version.

Changelog:

- We fixed a very old issue of data corruption when compressed size exceeds 4GB.
This can happen when you compress data close to 4GB and it's incompressible, for example, random data.
- Started to use minimum CMake 3.10 because older ones are not planned to be supported.
- Various other small fixes
- We restored old functions/symbols after reports of ABI incompatibility apache/arrow#41058 conda-forge/snappy-feedstock#35 #183
- Level API was added with level 2 support. Compresses 5-10% denser and decompresses 5-10% faster. The compression speed drop is about 20-30%
- Minor fixes

Fix:

| CMake Error at CMakeLists.txt:29 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../snappy/fix-build-on-32bit-arm.patch       | 33 -------------------
 .../{snappy_1.1.10.bb => snappy_1.2.2.bb}     |  7 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/snappy/snappy/fix-build-on-32bit-arm.patch
 rename meta-oe/recipes-extended/snappy/{snappy_1.1.10.bb => snappy_1.2.2.bb} (87%)

diff --git a/meta-oe/recipes-extended/snappy/snappy/fix-build-on-32bit-arm.patch b/meta-oe/recipes-extended/snappy/snappy/fix-build-on-32bit-arm.patch
deleted file mode 100644
index b6ab149e19..0000000000
--- a/meta-oe/recipes-extended/snappy/snappy/fix-build-on-32bit-arm.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ecb3bcc283ce740a34d6342cbcda569f3193ade9 Mon Sep 17 00:00:00 2001
-From: David Michael <fedora.dm0@gmail.com>
-Date: Mon, 1 May 2023 11:14:32 -0400
-Subject: [PATCH] Specifically check for NEON for ARMv8 CPUs.
-
-The actual NEON implementation uses instructions that are not
-supported on 32-bit CPUs.  Make the CMake test reflect this so that
-ARMv7 builds succeed again.
-
-Upstream-Status: Submitted [https://github.com/google/snappy/pull/169]
-
-Signed-off-by: David Michael <fedora.dm0@gmail.com>
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 85afe58e..e8775859 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -207,9 +207,9 @@ int main() {
- check_cxx_source_compiles("
- #include <arm_neon.h>
- int main() {
--  uint8_t val = 3, dup[8];
-+  uint8_t val = 3;
-   uint8x16_t v = vld1q_dup_u8(&val);
--  vst1q_u8(dup, v);
-+  val = vmaxvq_u8(v);
-   return 0;
- }" SNAPPY_HAVE_NEON)
- 
diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb b/meta-oe/recipes-extended/snappy/snappy_1.2.2.bb
similarity index 87%
rename from meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
rename to meta-oe/recipes-extended/snappy/snappy_1.2.2.bb
index 2a49ba99b0..7601fdde50 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.2.2.bb
@@ -10,11 +10,8 @@ compression ratio."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main \
-	   file://fix-build-on-32bit-arm.patch"
-
-SRCREV = "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
-
+SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main"
+SRCREV = "6af9287fbdb913f0794d0148c6aa43b58e63c8e3"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


