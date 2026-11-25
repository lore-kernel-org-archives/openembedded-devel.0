Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41235.1795611512202489063
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HTohx06I;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3594592f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795611510; x=1796216310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JK19U1XR7h3ACXtoiDVlFuvWJSIOzvtkv24jNxMZUqs=;
        b=HTohx06IuH9y4zeWS9/wl8xp9Dmxm3pz7VAWZLYjEwAB3cJws8R4Ka5KBIC1/xXg3F
         1V4ZKd0LudMw2fb1y+RLIjpoCl17VEpRVDleWaS8jJvXIt7shoZ3hmQ/+NCkS2lwDf4j
         2pnHWlujbGsNJfQuLhBXyL8rjTHCgcwUA3jSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611510; x=1796216310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JK19U1XR7h3ACXtoiDVlFuvWJSIOzvtkv24jNxMZUqs=;
        b=BNe8L25xXv4SIv94V/mKKqLmBtjHnvQ613WyjRXKIRPpNB0OoP9UI8ap0eNEFr/8lk
         /Sp8YEA3au1TSG71kvS7J5FpR4Xu4wIrByv9WOiof6QXG1HhNvu5SAMK9Nfbdiwyab3r
         lXRNg14lzoTZSIPeyreo5iEsEXNpuwkfzax8NeR6m3jZzKnf7wNiJWd+vInK4OQGOn3q
         2NcjotgJMbKx8YEi0lQneG3jwaywZoutORZGSaER6VvunA8yIfD5pO4KVrl58SuBqYgb
         kz3yK7QFaZKA+W5pWSGItnjicfgACNZyXocXj88jdpdER0sLat565H1vcmpOG59VN+J+
         bzZA==
X-Gm-Message-State: APuU4Z8S+ewYg46+jlQArI8kupXcUiZLBcPKxSNRQw3z7Mr+9C2IN03i
	JLtaDLoTlqfxAnP99r9n7YoXwuDejT9iiJAa8OeBwiTrSQlO4sS/iyV8hQ8HQLyc+vzHStOxgIg
	7mlQ3
X-Gm-Gg: AZFdTZe1BWywHv2ptXugX6ljFXzLcqJ0VM/IU5LrAA78JQQoF331TVGgu2afNX51c12
	zq501evxfDf5GTOzgALsARYIo5vRaheAQI/OH0JC8ipm89LvZhX7tR8TdHr4KumEUHipOpwpylx
	5vQANhi70bsof4CAIXIwA0n9xYMAOyL3QjvMIhLVcmAOKtxp2dnecc10y5FWeq58rP89A/pH+ZC
	jfucdynPw2edTmdq8lAUZZnFANNoVWWrWykOubeDDMfzq3SzHxD4+NfRcDGBjJHvi1nrhLehDtr
	zXuDTRFLru9qW1HedMYAEBDsOtA4xZoC6qGtq/yC0ZbGh46b6UnkePbiPwqtamJlUW5O+CW22UV
	/rHfPHFtEUv+QKYVwyeY7l6I3tY75jMJce4ynjkdCWRetxFTNysZETkEgFFS60fsyyPlEl77393
	fZgpw+XOkiyu3bbOdjcgw8qAY9tGxFCLpkdr/22Q8eBddD8lkE6tGokG7bnV2WgOruzc7riYmiI
	xcjKHl7Sg01Wz0xMArv28FCC3n/4oG26hY05c2hn8P2NiAWCQzxlEAhCWfiD7DYywpVdFxw3rCx
	mPlpLzaPQkbUlx2Z38E/ogFkfbG6c2yPry95toiSFC2bCIe7eOmWbDTH3mlMwqvNcUekzrM7tEN
	zaYtTG8k0GCjadReG0QNwq1kJwCSZb5EF284oK8IY3BOeGMpl3fClS40MeHdj6jI/tJ2bGWIG6R
	Q=
X-Received: by 2002:a05:6000:2c04:b0:4ad:2699:74ec with SMTP id ffacd0b85a97d-4ad269975e8mr37272514f8f.39.1795611510379;
        Wed, 25 Nov 2026 04:58:30 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm32919300f8f.40.2026.11.25.04.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:58:29 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/8] python3-grpcio-tools: Upgrade 1.85.3 -> 1.85.4
Date: Wed, 25 Nov 2026 14:58:20 +0200
Message-ID: <20261125125824.1799066-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125125824.1799066-1-leon.anavi@konsulko.com>
References: <20261125125824.1799066-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 12:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133077
Content-Type: text/plain; charset="utf-8"

Upgrade for the released gRPC Core 1.85.4 (googol).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...1-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch | 2 +-
 ...n3-grpcio-tools_1.85.3.bb => python3-grpcio-tools_1.85.4.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.85.3.bb => python3-grpcio-tools_1.85.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
index 26324cd840..9a2868a17b 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
@@ -1,4 +1,4 @@
-From f97638e64eb1deeb599ed33237adb71625789ed5 Mon Sep 17 00:00:00 2001
+From 4612086b090cb25bb6504dd6faad8c67b9803a93 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 24 Jun 2026 00:00:00 +0000
 Subject: [PATCH] abseil: raw_hash_set: include <immintrin.h> instead of
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.3.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.3.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.4.bb
index 82ae3cdd16..7d96e3a11c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.3.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.85.4.bb
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta cython
 DEPENDS += "python3-grpcio python3-wheel-native"
 
 SRC_URI += "file://0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch"
-SRC_URI[sha256sum] = "9439be3cfae21974656abf0c07d0e203535162069f2d786667ad6f618c83b5be"
+SRC_URI[sha256sum] = "85a46eb8b59c208138c36a936a7407b27d466130053ed35957b39f13a939f24b"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.47.3

