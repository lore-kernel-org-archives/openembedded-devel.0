Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E4DC2A088
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:47:40 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61630.1767610051890727181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JXWqhVeN;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8052725de4so1435772066b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767610050; x=1768214850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgtAr4GQbUk0hXfAowDghGl4McLsA/09S0wJSssmFEY=;
        b=JXWqhVeNqw+DY0wc3SKfcIk06uKKooqCloDu4WncoowNJqWWyOrS1lmeVGRgaIogQD
         SdxXD+Gh61fKk6tkHFeygVCKt07fQVxCdPbCep/FxOv04DBUiYjpojN9njW5uSCqiWY3
         JPUdoKs1rEyzefIOcYCnPaqF0dRLpW04ihBEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610050; x=1768214850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JgtAr4GQbUk0hXfAowDghGl4McLsA/09S0wJSssmFEY=;
        b=C3LQ7lrM0pzmemZ3SVkRU5PHJ74r+CTwHU6MBTPu8rbos8mcJ7hWOcOhFKDu28b+dH
         PjmLkEPO1GXr43fJSXv5bQBUedmN0xAGpOk+awIqiAAqtKym82mVoxjnOSeZkDObzs36
         kZ5QvlbHhGDfMZN1mLiuQhjVy1T/gvqe4YdWwAujUCJfRpkRVu9HtHIAIMP4uw8AoW6a
         twLwoWGx8+ApyGPBKn5LCx3XZ4NYn7CKe6Yh1+AtvRRUI9HITtnQ/pc2sj7lAsurKbKT
         Tzwb53acD7tky6C8y9rb6ZFtsF8GmVjPhx1MD+Sn0qmtUAfmAeqnttZT+XDCkyh//IFr
         L8/Q==
X-Gm-Message-State: AOJu0YzaOXTsGf72ph7Fie2Yst4RyPDZIWGd87xFfc+Xin5Y0tP6U6WQ
	UWDv9IMEBaHSbS5namh2qruNEEd1vKWAj9VlQgR9SCvadYdKv00B6H/JadbGcg6KG4DkwhzPfOa
	H1ueS
X-Gm-Gg: AY/fxX6HLKxlS9A0h0X1Mm5Oz9g1orzuWW+qyIvNCO7Sz8DbsLEKSCWQXUyQwhWoqlU
	FzwmT/mndQ7eEjiwZN1xSntTAbkpVHRQvCiX2ncu6LCM/+3oYkffcQjd0CwOsl4LE9bf6hLkcnb
	49WCcAwMekFqOfWTTzEyxFkN6HLeWJjsgF8JU1X73pKIddsZu0hte1toQOW0AgKBe09RMzQ01y9
	DYITqPYM/qmbktwbeHdnQRogFP57aLu2ldVdUqPCaNZ1+TgW+KYvJoHk7VHi2Zmq8+UCH3VbZVT
	Sl4Fg3BeRjqTEqbmH2s2nU5MYj7kFhtO1rEFTgUWvK/r3ARaTAfyWomvup4YHVo63FrMrqWz95v
	3OcMOHpJhoijIFdrgdMfBUxg7wvS6ynvqEyUiCpAlVZ9cX+MOYv2SaWdudwCAHK79Sz44/hsU5B
	mDETqpO0yHmLGV/16JTCMBxpae
X-Google-Smtp-Source: AGHT+IG+EnFIpfmLeVIQrvTiq8Ak5isEG7sJIHPTBf73vBCKc70V6TsLBQ+UZM36AgtFkotmuDNhEg==
X-Received: by 2002:a17:907:6e9f:b0:b73:8cea:62b3 with SMTP id a640c23a62f3a-b803704ffd7mr4841523166b.41.1767610049854;
        Mon, 05 Jan 2026 02:47:29 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de1421sm5591905666b.41.2026.01.05.02.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:47:29 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-autobahn: Upgrade 25.11.1 -> 25.12.2
Date: Mon,  5 Jan 2026 12:47:25 +0200
Message-ID: <20260105104725.3914225-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105104725.3914225-1-leon.anavi@konsulko.com>
References: <20260105104725.3914225-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123151

Upgrade to release 25.12.2:

Build & CI/CD:

- Synchronize CI/CD, FlatBuffers vendoring, and wamp-ai/wamp-cicd
  submodules between autobahn-python and zlmdb
- Switch manylinux container from 2_34 to 2_28 for x86_64 ISA
  compatibility (fixes auditwheel flatc bundling)
- Increase ARM64 build timeout to 60 minutes for QEMU emulation
- Add .github/workflows/README.md documenting CI/CD architecture
- Consolidate download-github-release and download-release-artifacts
  recipes
- Add checksum verification to artifact download workflow

FlatBufers:

- Simplify vendored FlatBuffers - use upstream as-is
- Track vendored FlatBuffers in git (like zlmdb approach)
- Add version() function to vendored FlatBuffers runtime
- Add check_zlmdb_flatbuffers_version_in_sync() for cross-project
  compatibility
- Generate .bfbs files for WAMP schemas during wheel build

Other:

- Rename install-flatc to install-flatc-system with prominent warning
- Remove legacy readthedocs.yml to activate .readthedocs.yaml
- Remove dev-latest optional dependency (PyPI rejects direct URLs)

License-Update: Standardize LICENSE with SPDX header

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-autobahn_25.11.1.bb => python3-autobahn_25.12.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_25.11.1.bb => python3-autobahn_25.12.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_25.12.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_25.12.2.bb
index 922252e83d..4a25d0fa88 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_25.12.2.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
 HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=49165a577911c4178e915dc26e2802a3"
 
-SRC_URI[sha256sum] = "52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1"
+SRC_URI[sha256sum] = "754c06a54753aeb7e8d10c5cbf03249ad9e2a1a32bca8be02865c6f00628a98c"
 
 CVE_PRODUCT = "autobahn"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling python_setuptools_build_meta
 
 DEPENDS += " \
     python3-cffi-native \
-- 
2.47.3


