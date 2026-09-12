Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13863C88E56
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:51:51 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16570.1789257107494546893
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BLJN4fbt;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304833so614204a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257107; x=1789861907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yt0ZkcTB8+KY6wrYbeR/lTqcsPrmKVSQbsW/wv2YXL4=;
        b=BLJN4fbtATtlNxx9omhz6I2FvW1a/hNUfj0ohITTt+eE5rB5IYDBRaJz0e8pUsT+PF
         m364FQRXpdaGm8htVC+3hgdWA+ofhs3VclOS/YrHnuPdICwfRNrcY/msGoPux6Dx2GLh
         Qq2JEps5hEs0CrCPrL6ghHHnCuOYIpcvfBGUJen+jrwUFBuFzCqZxIQ21r3LnKGg8n/4
         V3Kb8NnAqPRqhSGg7o9yAzP8ji9EEpj46XoHNW8RzBiNZHNGFweHEdRotEZkqcTwIQMR
         BY7WiBc77exm53SSZ0Sujx9/1LeNL48JNP8qefEu4wGjibMZSC5vVgRActihxKfGx3MU
         mLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257107; x=1789861907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yt0ZkcTB8+KY6wrYbeR/lTqcsPrmKVSQbsW/wv2YXL4=;
        b=LYdUqCSl/F4PRco/FZbzGRWXjSy46VLRTzPl0L62upwotRZ67iaKNaKZfH0ddwQyW2
         JoehkQvyYMBx0y3/n1PvH2JAkvChoIegxAEyUuUBdrH7af0J6sFTubyp1MVcy7AgqB9h
         PPHW6joWd/3ofkaPqd72g80wsPpZslqQSj9n2U0Lhmud8EQ2zTQRNvEavQJJAeM2TBg9
         MCezoWaVU6SPsbixCN9Up8SNr0N2eFzvD6q7SJSoFY20arM8cN+1gDjixGkAzlrWDPFS
         R/3VbGMJWCpTZUGIhSGo3Nh0PDel51BwvJGyV86GBCGuWcVkLEPctk9lHNUj/twpxKWO
         8uEQ==
X-Gm-Message-State: AFuF++kuuqeC4s26ZQzw6io7kVG3A7Lk7R+SaCFrdm0TWEdk7qAKIKtt
	d3HdrjC+EfRCqr/M+YSnC0o1MiDcgeU7aw7Rf5iO86iey/7JQ0yJZgVHkwETuQ==
X-Gm-Gg: AYBFou1OOp1zwLJDs3TU5ikWpTZIkmX8NbcKAls1oURD6n1UBCTbEyVfls50v9fe4dS
	LoLgxf4m+w/obYrndDGaMcdP3+lrLs7xib+ZFJLLRkiht17iVimKaOaVPuhOcW66TqMPSGFwtK8
	RVPoNAZm69Fqtq9DN6KkTFP87J58x38ImN3SytWxEzBev44otg3zKCdeF4Bey83FXlN1yJuQT4d
	CODt761xE69SDofkEoqLmnwNDtBEffYQAtGhyTdki4OhgnqqWRVUvFpU8x+gZLOOJPyBRS/78sa
	JhPNniNfN/8LDeKtTXp5PucjR0geghxgSj3K5uReBYVXqwV8KlmKY9t8lNvc3/3YK37+EAoAdaI
	el5+I1+Hh57mPS5bBvDnSdXegh+2r0oqC9FMiyf3Xe2KK1soa2SX/xpPxn27coeXI+tI1jN7U1S
	X2HjJs/JaC0LFNAVapUNpuyq7lMlsMDqfOPkX3yEc1SETBMJtwGSUt4MSgXvFYlq7l0zkvYmIzd
	tDjh9kJwDkqYMjYrJCz85G9uLHRaXbMP0Soh6D3/3Gk8JmEsRt4/FYuAOJ4A1VU1gbiCoH9FOfq
	Voe1W25XQ1SbBx+BvsIM7HREx0lQlsdoULrMGkpnIuEYGxSqTbJycTW6FINIRy4baDi52RlsrA5
	TuGCiXlgamMtzBoSGIrUCcjdV9/6TUmMVvldU6S83Uf+hH2kzVqZm3oqo
X-Received: by 2002:a17:90b:580f:b0:39d:b769:3067 with SMTP id 98e67ed59e1d1-39dbbc723bamr8171937a91.0.1789257106807;
        Sat, 12 Sep 2026 16:51:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm16093307eec.6.2026.09.12.16.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:51:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/5] python3-fastnumbers: fix denoise of large floats when built with clang
Date: Sat, 12 Sep 2026 16:51:38 -0700
Message-ID: <20260912235141.2355852-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912235141.2355852-1-khem.raj@oss.qualcomm.com>
References: <20260912235141.2355852-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129983

float_as_int_without_noise() returns early when the floored value fits
in a long, checking it with floor_val == static_cast<long>(floor_val).
For values outside the range of long the conversion is undefined
behavior; clang -O2 folds the round trip into "floor_val is integral",
which is always true, so the denoising is skipped:

  FAIL: tests/test_fastnumbers_examples.py:test_try_real
  FAIL: tests/test_fastnumbers_examples.py:test_try_forceint
  assert 3452999999999999737856 == 3453000000000000000000

Add a patch that only does the conversion when the value is in range.
A reduced reproducer returns the wrong answer with the recipe's clang++
at -O2 and the right one with the fix (and with -O0 or gcc).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...efined-double-to-long-conversion-in-.patch | 46 +++++++++++++++++++
 .../python/python3-fastnumbers_5.2.0.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers/0001-parser-avoid-undefined-double-to-long-conversion-in-.patch

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers/0001-parser-avoid-undefined-double-to-long-conversion-in-.patch b/meta-python/recipes-devtools/python/python3-fastnumbers/0001-parser-avoid-undefined-double-to-long-conversion-in-.patch
new file mode 100644
index 0000000000..52275c1d8e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers/0001-parser-avoid-undefined-double-to-long-conversion-in-.patch
@@ -0,0 +1,46 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 12 Sep 2026 00:00:00 -0700
+Subject: [PATCH] parser: avoid undefined double to long conversion in
+ float_as_int_without_noise
+
+float_as_int_without_noise() returns early when the floored value fits
+in a long:
+
+    if (floor_val == static_cast<long>(floor_val))
+
+For values outside the range of long (e.g. 3.453e21) the conversion is
+undefined behavior. clang (-O2) takes advantage of that and folds the
+round trip into "floor_val is integral", which is always true, so the
+denoising is skipped and try_real(3.453e21, denoise=True) returns
+3452999999999999737856 instead of 3453000000000000000000:
+
+  tests/test_fastnumbers_examples.py::test_try_real FAILED
+  tests/test_fastnumbers_examples.py::test_try_forceint FAILED
+
+Only do the conversion when the value is within the range of long.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/cpp/parser.cpp | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+--- a/src/cpp/parser.cpp
++++ b/src/cpp/parser.cpp
+@@ -92,8 +92,14 @@
+ 
+     // If the given float can fit a C long without loss then no need
+     // to go through the below rounding steps.
++    // Converting a double that is outside the range of long is undefined
++    // behavior, and clang uses that to fold this check into "floor_val is
++    // integral", which is always true and skips the denoising below for large
++    // values. Make sure the value is in range before converting.
+     const double floor_val = std::floor(val);
+-    if (floor_val == static_cast<long>(floor_val)) {
++    constexpr double long_limit = -static_cast<double>(std::numeric_limits<long>::min());
++    if (floor_val >= -long_limit && floor_val < long_limit
++        && floor_val == static_cast<long>(floor_val)) {
+         return val_int;
+     }
+ 
diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb
index 65d7fcea3f..d067e44938 100644
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32431d1b650010945da4e078011c8fa"
 
 
+SRC_URI += "file://0001-parser-avoid-undefined-double-to-long-conversion-in-.patch"
 SRC_URI[sha256sum] = "07266a2fca9e08eeb5a6c70be4c8db3637db9b930ea5198facbbb9b0b31d4d03"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest

