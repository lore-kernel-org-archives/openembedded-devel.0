Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8939.1793358209778861995
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C9nionoy;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e3b22e971so265554f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358208; x=1793963008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tfygTFVMeYzmKZKqZJVuVGqthDFrSb5LZLpXiNDNQs=;
        b=C9nionoyw5MSd4N0ldhulsDHSsAo9pU5GiGhPUsghXhkVoYKTENE/2Yw8ioOKFO5bD
         Ozw+pyEkLhUFF0XAUkPKhLGVmB2kGt70SpTi2XmgNorRJu0v7Raedkv/GLdpD4VEeDFZ
         kZzFuTeti1T298srwBPXgD5dmFlewu6C/FBGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358208; x=1793963008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tfygTFVMeYzmKZKqZJVuVGqthDFrSb5LZLpXiNDNQs=;
        b=qaqY3qa84qqZVA9Ro8LFH9Z7iGSKymyT7kwNyE61T2PKOWyPx8Jou+GSoYPDZP7Y2L
         DgbGnR5YqdUT+DInXHyELeuTLQ3dcAMvDM9cGlUvPQQ5oukctmOqnUp6yVL6HK0Qe+x2
         SKd/n2H61kAycQeyp9ZZVnWdjsnh2CyJuh4zhhWuDbyiBBGXfheAAAGJq+Tx2097veoS
         Wy5+9J+QRAfm/6CdTyvC2T6wVcSI7sUa5jfZYmRqrNB5ydRKtHDLSbXireg78pio0mZ2
         8+lxR3AnYTw6ASXdkwcTAE08XZAymTCzhGnZU2wKhhLJyikjkunE0YV0Rkt7IwtcWO/V
         QWBA==
X-Gm-Message-State: AFq9FYJyXw8epyATvz4HQJk5UU6uNg6yyKGpjXRC5ros5P3ZSugsWKHQ
	nS/XfowPL5H9Q2x9ls5k1kNHSpwkgiJZUpKSLBiBx0T/HH7HNgqHxr4Q+KHOpehxPyEFJkCxPpo
	C8K5+
X-Gm-Gg: AYBFou3Al3Tr2voUVO/FSrWBaxjQ+l2BQAoSs6lzEwW6pJ1n6lnyhCoWY18Oxt+lsnP
	i38vL78R/3Lb3BGh7jb/L1gPD+fQz2h2KwgDMwzBXaEP8Us61D27GBSTQ/EZAzxU7DmnptiFqJM
	DcMKktZ5LZpLk4wq2Cu0a5dq564ejgE3Mg2T9bUkJl9BY1jJlV6eTPH0W5c2DL2X+CVT/UoAmMk
	uM8I7jpBUCprXzxAZymJIhExtVm+rdBjVCm5yCitndEomX8SjcTkSLRJJvJF+QxzXUvX7RIj/QM
	UXvyXBF8965A/xb5y6Hh3c+ug3UV2S0mrrbkGn7QMD8PIR2VwubeL1NhEQUjhmJx7iF7I4qww1l
	ipeFeVigzkz3Fgo4pZwkxbz3A2QKiF9NazQtBvbNzShP3ZhI5l5x8EkJlZK8rSD6DVyQTaQ+Dsi
	4djOMZZSXUnp0aFNukRtTBfEZGVNaE/u6bjhSUKkbLH/rt/X3rJhZuS1+cBpoLqOA904tIcK1GP
	5NKlfjMj9cJamafpY5466xP/M5DrI2MTJ6afDZC+T6IdHGwYahIGTz6RMLxsRukUfAEn3ifXYE4
	Qx1NX0tx5x5z43R3RbbCsaQTNnXlM/LpfvuQfmplPMHS/z+1JOZWExsn6Zl3e18TKPgnybSasT2
	rmGj/AiN0eksP8eM3SOEbu6cyibq1Le8Je90UsEqeKQdiKlhNJx+tbfIBEatZfgsxRkbhT5Ir3z
	y5
X-Received: by 2002:a05:6000:46c6:b0:48d:f14a:9173 with SMTP id ffacd0b85a97d-48e6e2c2f5bmr3262288f8f.8.1793358207908;
        Fri, 30 Oct 2026 04:03:27 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 13/25] python3-opentelemetry-sdk: Upgrade 1.45.1 -> 1.45.2
Date: Fri, 30 Oct 2026 13:02:57 +0200
Message-ID: <20261030110309.1124614-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131695
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.45.2:

- opentelemetry-sdk, opentelemetry-configuration,
  opentelemetry-exporter-prometheus: enforce metric cardinality
  limits (default 2000) with the otel.metric.overflow attribute,
  configurable through View(aggregation_cardinality_limit=...),
  reader cardinality_limits and declarative configuration

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...emetry-sdk_1.45.1.bb => python3-opentelemetry-sdk_1.45.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-opentelemetry-sdk_1.45.1.bb => python3-opentelemetry-sdk_1.45.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.1.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.1.bb
rename to meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.2.bb
index 3f7bdd725b..bba2b8bfe8 100644
--- a/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.1.bb
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.2.bb
@@ -4,6 +4,6 @@ observability framework for cloud native software."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "63d24a6ca645019a631e6a51999c73e93adcac1196ca640b8ae78a7cc4762bf3"
+SRC_URI[sha256sum] = "7eec4de13dd21ff3a1670dcb0e02079e692736f94d733dfdce5af461d884248d"
 
 inherit pypi python_hatchling
-- 
2.47.3

