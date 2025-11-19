Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21BFCF257C
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:12:52 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7545.1763525562927912532
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5pd6GTG;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bb2447d11ceso3722721a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525562; x=1764130362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIgKE0FKzMVPuW02iT+F4tc2fXcfi+hUTqO81LrGHqo=;
        b=F5pd6GTGHrkfi2wT+xrBdzsis7p+ZY4kDVo/MTj3xuy41wMlr1K6QYcK9yg+ogTt0C
         OlKQLQjQZgbkSaG8p66y8e7JKmQA+DbTuse8g4YA9l6WqpkKk11x8Upn6lRy5aSmzSbn
         Rcuif1w+h8oa9PEKrMfj1vW9EmayJ+QrxITNAaRPtSwlwlznRU2kMohrAN/1tKvX72zU
         SzmetXG3ri/dqcKnttDaHayL6kaDTrI/fsTBI5ETTvAMFIpWZXOmn3Yg/0xbwxDK/hkO
         M7VL95dMq0dNQiKxV4vuymqo2RIvM4Z7dzO1IyTc+7OVGOcDZAY4rw39wWS8pTaWtzpv
         IOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525562; x=1764130362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VIgKE0FKzMVPuW02iT+F4tc2fXcfi+hUTqO81LrGHqo=;
        b=a/MM12KQwa0HOr9yu9voSyrodZdBDshavjRVI9zxk8zjaYes6aR+dabRyUZ20xj1gx
         9OFwUDU1Sa+EJZy2+ZSMyNV+o4A+Jsp+nOgqBKPOebfvopLiqMaANVD/L2kQf41jS55S
         2iFhwgbO9EtShWEWTHuEAEHJrWky6L4062c9xrTqGNF+6iDgNw9txn4fEpDHMLRpzHqO
         e9/78XfDEZgrxDD7Ptmj30iyUhNEec2yoX/e5Mlgz0hvnyUenI1qHgnwvssrC7FG6Fkl
         cCreTXzzNzCVuWe7lzN22163s6/UQbTexPDCmmfd8+NC21vxcOQUtwVr+C/DC+6U6S5k
         ep4Q==
X-Gm-Message-State: AOJu0Yydn7LboPkCrQrSCHTr6IuAfCJi3E5oSKAwTccnxu+7dJlRQRJ8
	rX+N7OChHsVWTkodoJtuC2bzi+9h+p8ilZsyqo8U1Q+b2hCSkmBdNpX+AUAdkU0hlvU=
X-Gm-Gg: ASbGncvS9X+lO5LBxTsHO2GGpg+JN4Ed9ZykTNfZ/MIFFsQePU9WrrFXsMdMVGehwih
	aid0r75/EmPCs7r7+AKl6l5d8ZV0nmti0kXqO7WzoEq9Z50n8CDQMhBGWxSMJrvvjJcAzblle7o
	f1JX+MCJkFHsvP9k5z9xbLJzZL1/3SfhVipb0Cx94i+Blw9Gx+0+Y/C7EanyUBKyN5AHYmcaNRc
	C+2NJ5uj98opH2EKzRvQ2OBr5IbLPkxp6Ikb0m421ir2gLjN1aGdYhLt63s2FjuEOhKT+LgcQWJ
	ykJfqUrQinWNh3tgVcS4xHf7Wxiv0gmMSt4Vxa+uUGzvPvb5wrZoCPv/FhGn9BZJ6uhR0woPXq6
	hYhwOZcmH/DTJwlMuq9CqvqlEmDc47ZDCutgvwxiRB2fNjxrLoEsE+ZLCYtoS4UnALzWlm2faA3
	AZxyDNnjO2ZX4u080ZIk3GXxQCcbp/QBwfiPX1tZ+b/ZpqtDUutHY664RpaIZNQXm5FhkIgiLX2
	HUy0U6eW/+quBAJR47a5pjLtkbDr+uU
X-Google-Smtp-Source: AGHT+IHvHkv/5AoVe/OXPP22O3dYaFczQv3+yvNEQJAmO1NIzFItwyU2iGD5zzf4s4k3xlwquHR56g==
X-Received: by 2002:a05:7022:688a:b0:119:e56b:9899 with SMTP id a92af1059eb24-11b40b3420cmr10074247c88.0.1763525561684;
        Tue, 18 Nov 2025 20:12:41 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm66819088c88.0.2025.11.18.20.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:12:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 4/9] python3-pylint: Upgrade to 4.0.3 release
Date: Tue, 18 Nov 2025 20:12:30 -0800
Message-ID: <20251119041235.2448193-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119041235.2448193-1-raj.khem@gmail.com>
References: <20251119041235.2448193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121878

Forward patches to avoid fuzz, no functional change

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Adjust-test-expectations-for-ptest.patch         | 4 +---
 ...yproject.toml-Keep-tool.setuptools.license-files.patch | 8 +++-----
 .../{python3-pylint_3.3.8.bb => python3-pylint_4.0.3.bb}  | 4 ++--
 3 files changed, 6 insertions(+), 10 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.3.8.bb => python3-pylint_4.0.3.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
index 0f3e7d45e8..307dc0083b 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
@@ -12,11 +12,9 @@ Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
  tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)
 
-diff --git a/tests/functional/w/wrong_import_order.txt b/tests/functional/w/wrong_import_order.txt
-index 9f143c292..a283467af 100644
 --- a/tests/functional/w/wrong_import_order.txt
 +++ b/tests/functional/w/wrong_import_order.txt
-@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard import ""sys"" should be placed before
+@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard
  wrong-import-order:15:0:15:15::"standard import ""datetime"" should be placed before third party imports ""six"", ""astroid.are_exclusive""":UNDEFINED
  wrong-import-order:18:0:18:22::"third party import ""totally_missing"" should be placed before local import ""package.Class""":UNDEFINED
  wrong-import-order:20:0:20:14::"third party import ""astroid"" should be placed before local imports ""package.Class"", "".package""":UNDEFINED
diff --git a/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch b/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
index d30e852025..9c1d535690 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
@@ -19,8 +19,6 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  pyproject.toml | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/pyproject.toml b/pyproject.toml
-index a3cc3f43b..5eaf5ee5e 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -8,8 +8,7 @@ name = "pylint"
@@ -33,9 +31,9 @@ index a3cc3f43b..5eaf5ee5e 100644
  authors = [
    { name = "Python Code Quality Authority", email = "code-quality@python.org" },
  ]
-@@ -65,6 +64,9 @@ scripts.pylint-config = "pylint:_run_pylint_config"
- scripts.pyreverse = "pylint:run_pyreverse"
- scripts.symilar = "pylint:run_symilar"
+@@ -105,6 +104,9 @@ test-min = [
+   "typing-extensions~=4.15",
+ ]
  
 +[tool.setuptools]
 +license-files = [ "LICENSE", "CONTRIBUTORS.txt" ]
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.8.bb b/meta-python/recipes-devtools/python/python3-pylint_4.0.3.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pylint_3.3.8.bb
rename to meta-python/recipes-devtools/python/python3-pylint_4.0.3.bb
index 9864084355..04144aa7a3 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_4.0.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "98942ba4126a6fe1657bad77027bcc11016d16da"
-SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https \
+SRCREV = "84b6552b86e210097ac29de7ef64b152efb4a454"
+SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https;tag=v${PV} \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
            file://run-ptest \

