Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.683.1793419079742353140
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Vi82JcBA;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550c917fd3so1845184eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419079; x=1794023879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6KKR9yswwOrkttn/B13N8pCX335pVZPIG9/orq2SPE=;
        b=Vi82JcBAZAAy7369DKB3jZUqDGhml7Wd6c8Mbb+0RFovpwITchWnufGAnQyJwa0nUM
         7ttV5l0ywdXAmbqRtE65Z4kPAP4FQjv9D3anlj6eig77t4i0yD9hhYJniZAbmwIZTtO6
         gLwy5NPujATZejLrArvHQFFnJnfQz3AnMD3xVY2x0ZDrBjwULf7s3JT0A7MOCnMEpI4M
         Edqytg+XdcpTyZPOBtPF7H2iG0AkyGL0dYH6QnLFCbeYatBmj3sIraIiyHjY/NpbDJDz
         zQ3i59W5wb4HWFdp8f3ylsWE9GnbKADKmEm6TxUwu+YWW+0pPTBhPJluFfl2Yet+WpXq
         m1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419079; x=1794023879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6KKR9yswwOrkttn/B13N8pCX335pVZPIG9/orq2SPE=;
        b=YyD1CmLjGXVrzxmjYxda3yMcMAwvAHXv5Iz2V30ZoZCQiMqTBFYTc50Zkn94DkUuhe
         cZa1lmwX9TLPMuiCG4MuYi8fJ2Ebv+OSWYgBVVK9OTeidLq5qwOLR05hj8xeTbhlcMcm
         NPQtW91fj9Avz3CQdDTqT3uoe8X1p3UgS0MnzEW8prb2qHbj5glNJRYzJaeMD/lXOdYf
         Oah0DnuDDNmTM+/IP46OqkBBIfM887oPoMDDAEZ76iQ5OSGqBozGcXoyoZTmzoLTlwoj
         iO13oc0rQgLwgg+TSDnz8qsixMalJY1FUUNBMpu1C6qpTLbgdUf8iMKTKwouAM3Us3t/
         gC8w==
X-Gm-Message-State: AFq9FYI3A7ViMVgNDPpUMI2Pi2+B3pTIEYg7ndm5QXp3JnLFIoSyJBww
	E6fJ1duJJH/djp1BFeaouH56bRUMi9dkt5vi4jS96I8McJis/23dtWcjiABMeNV/BJ8=
X-Gm-Gg: AYBFou1A7SLyaIQUbzVamvKcgavu1i3HDow8oof8+XYTPIIRXwsrzYh3YPF6nWAV9Q1
	BVwhZh+Q5BJth8iABRryBd1BDOYmCcPc1b1a3XVpQWOW4dER8MH6odMhwEU4V0+LRwfmUo6P/Kh
	gPwCqdrl1ibkwvmMTdDVFY8J4fUKGk5XoU4PmqLBZxFxROWOCzkqxNgnJpj1o5Z8Z2sjyeR5UfJ
	zP4EWbzD/bIQWtmDlW7BfNKgVhOS+5x5KUfXH0PKDVK4bB5EHUZI2PK5RMDR/Xi/X354zYqiv3G
	0P05LKRzx6hJAVPD1Uam5MY1FRU+YIWWBFuc3eOttNcu9cOakjesldwMRdoEs2z6YaeH/PgFIHw
	xJiIYtX9nUBgnj9NbVkyJ1DQ74L89wcFIuvIpH5C4BvJM0DAKyWs16ZJhe3EOrxYqzw8r9iNmuN
	v/bojrG3GmbasVvzY1sMZ7gEh0u3vG/s4A0/EoQffT73LYqLB3zoDjlp4poqXg3HxBvqJZ0FPvJ
	fibRVQwabw/4W+Wvg0y9fQ0vYXUbAG5XvMp7c51hvTN+PfIZDHHFbi+GiIwiFTE2bO4ftG97iuR
	HiTArCO4tGehhN4JScqTZqfx2BFiG4djm6pqjQPrkMkShvZmPW51U4W/UMt73BNOoqgli7vY2n7
	xxT5hn1f5XFYTx0ll/bEHbWY3y00a9oUFMv9sGp+/LtBd9Q6tlLtFRKr2BCiH3Tr9His4uz3tx3
	7RQIm6kfwiuD9IaSnHoEWjySoMOU05yWJnMYqem1HNl6fs7BEdtdw/LUuiwx2zbRo5K/8n3CSjs
	D73FR4BeYhBYboaBoQD80dXaTp87qK/JyjOnD9UsoahGEueysP55Xn1YbzwLfGxWqPytAEcaSOw
	Jkwg
X-Received: by 2002:a05:693c:88c8:20b0:369:f2d6:4108 with SMTP id 5a478bee46e88-36a42401233mr6136931eec.10.1793419079090;
        Fri, 30 Oct 2026 20:57:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:57:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 06/10] python3-fastapi: Upgrade 0.141.1 -> 0.162.0
Date: Fri, 30 Oct 2026 20:57:43 -0700
Message-ID: <20261031035748.2130261-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
References: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131716
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

Release notes: https://github.com/fastapi/fastapi/releases

* opentelemetry-api is now a runtime dependency
* Add opentelemetry-sdk and git to ptest dependencies, used by the new
  telemetry and translation script tests
* Ignore telemetry tests that need logfire, the opentelemetry OTLP
  exporter and the opentelemetry fastapi instrumentation, which are not
  packaged in meta-python
* Fixes the ptest hang in
  test_frontend_dependency_restores_existing_dependency_stacks with
  starlette 1.10, fixed upstream in 0.142.0

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-fastapi/run-ptest  | 10 +++++++++-
 ...3-fastapi_0.141.1.bb => python3-fastapi_0.162.0.bb} |  5 ++++-
 2 files changed, 13 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.141.1.bb => python3-fastapi_0.162.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi/run-ptest b/meta-python/recipes-devtools/python/python3-fastapi/run-ptest
index b4d99ee36b..4a8a5b7a87 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-fastapi/run-ptest
@@ -2,4 +2,12 @@
 
 # ignore the test from the tutorial
 # those depends on python packages that are not part of OE
-pytest --automake --ignore tests/test_tutorial
+# the ignored telemetry tests need logfire, the opentelemetry otlp exporter
+# and the opentelemetry fastapi instrumentation, which are not part of OE
+pytest --automake --ignore tests/test_tutorial \
+       --ignore tests/test_telemetry/test_background.py \
+       --ignore tests/test_telemetry/test_data.py \
+       --ignore tests/test_telemetry/test_environment_integrations.py \
+       --ignore tests/test_telemetry/test_integrations.py \
+       --ignore tests/test_telemetry/test_native_integrations.py \
+       --ignore tests/test_telemetry/test_runtime.py
diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.162.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.162.0.bb
index 38a691953c..4c5a5b5dc8 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.162.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "e8822fc40db1e1858054d7a949a888695bc9bdce70139178e33bd2871a453ca1"
+SRC_URI[sha256sum] = "6a22c1e2e6e32e0633ee7e170f00009a29b8228b16feb219ee42f32fd8d88a8f"
 
 SRC_URI += "file://run-ptest"
 
@@ -22,14 +22,17 @@ RDEPENDS:${PN} += "\
     python3-annotated-doc \
     python3-fastapi-cli \
     python3-json \
+    python3-opentelemetry-api \
     python3-pydantic \
     python3-starlette \
     python3-typing-extensions \
 "
 
 RDEPENDS:${PN}-ptest += "\
+                        git \
                         python3-coverage \
                         python3-httpx \
+                        python3-opentelemetry-sdk \
                         python3-orjson \
                         python3-dirty-equals \
                         python3-pytest-httpx \
