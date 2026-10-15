Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75CECC6B35
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:39:09 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32487.1792039145761645744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 21:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mBdcv40s;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30b6dad2382so11305854eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 21:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792039145; x=1792643945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XG0FNqCV4Kc5k0Zwjzl4Mi4wICWHSm+B444RgDNVQSA=;
        b=mBdcv40s/TjbFxtCm766LQ3SQ4C2f/PZUdaJ53gDW36S9YEvx9aJ1GQ2BJNzG5X+Wo
         GatUbGLHJx5f9W+uw7Z4yibNKsG3MAk7TQccHl88APsMZdyyJkA3Cg4/tyoUexmWzzXh
         qWHcZ1k+nlIl7UR+xSmwD6c7R5UAJmGMMqrbBkpDNrdSkAaNlhTTnhQxcc0ozalsIW8r
         CuptKvznDP2WeMl3niUGZK7PmOo6qEJ0nd6jMXzub4NleCwgsPATY+nzYguHylHYCKqH
         B8u5PLSu9pm/tZ03y0v2ADCCpPE1tElQ0OXwQJwJsHiTz5T/lPzdTGFA0qXunWeGlzOS
         CuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792039145; x=1792643945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XG0FNqCV4Kc5k0Zwjzl4Mi4wICWHSm+B444RgDNVQSA=;
        b=UB176IlgM2aTrwYpGkcAgFqeT+H9ydW/mvvEH/2WBnEckBZ8viTse7TPfR0cl0Qny3
         MDlxgqaibYX2SsIo8BYx5Zl8O1eF78mrC7x8783twBxStt2ulwFRt5B/nt+0sic9tV4I
         fN/o36QjfTnTYGIAFp1N1QWsDc87t+xdIs2dfh+Nm77Pw+zTAVU2iz8xOIZRLXOxW8HZ
         4YncWcxkMJ43LWYwrGaivP9Z3ISEC3v/awMlF0KPDQh8kn0lrhdIlBQ0IF8QOvKMiZvw
         ZuuHoO4j+PEJ6kpDowoWGJtsf8s2t9uzewdEsE8ETSto3EidsO40l14X4vC6hs1v89c+
         5CBA==
X-Gm-Message-State: AFq9FYLRfSypWNVhr19StlyJYe7sgKuftWFH5Kmxx4jJ3nbyL5fPRNr0
	Co2e9pM0V86FovSzwkilQAVNP5qB6LgNWHDgYuGEMaP0WicEB4V+THC4roKZFXsmUNA=
X-Gm-Gg: AYBFou1CxOiLn4Z25KRE3gH+bsRcKR1RweLgDiBUANdElcXxuK/8+gUds/n62QWljwo
	lFE668sqwB3FkMnRjXRIMtO0O1s1c6t3KHfvV+ebqD1WelJOS0EmjvQ38E/+/7vw4adqjjkiKSY
	TILyuBaoDWoBdFWBoAY2MGPMUyO22BfvQPTNtIMl4hhQWO79Ol0zWuUKWsQNBleB7tWmf6F9eu0
	RG47N/yYD+vUQIuQm3YTHzpHGybclMxq1lXQrV4atROTjf/pFfnpC1VyAS+SSWDfOd+SqHyr6d1
	b6sdienJlZM9y6qFThLq7t7+YtXXtbfIUnunoRAYqfJoFGrIuMrnDIlESsfFCnppNn0YuY5zcBZ
	xYxOQRp13gE3TXjIz1pz8RleBXsaVW30uLxBi++blxd1qN7hPCtiFB8P0H00EE5griVJjs001l0
	Eqxcn2MzpIO3OXQVlZhwtTTnqhVxOYThEdP0EiV6XqSPfxQr/Ms9HAr2pJt6pa7RmtmwkUy961N
	rARZM1XH3jsSgk/zgO847W7FTxZ0S/lfy0Z8Wz7EmjAofx06BKPtpPyrrg+yD1/NuLZsV6gZFgR
	2C0X3PYv6yVPSGKUFtTJ9LZzk1F9DO9eN/X/1LPcS9T7aNeCBFsnGnbbr+ft0YtUFYQu2RgLB6e
	IT9/OxwUTLE6ONG7QfMnHdSRMN8u8AFegmbWzHNo4mt/aVt6drlnQudAVQHkJGK0gtnUO+dHYBn
	RR+iqDyNCAS5MnIAMKLaaSMzBOa72+6B53RXNeDBeiClh8Zw==
X-Received: by 2002:a05:7301:1a0c:b0:359:c212:a4b6 with SMTP id 5a478bee46e88-359c212a4fdmr16395274eec.7.1792039144872;
        Wed, 14 Oct 2026 21:39:04 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm49199424eec.15.2026.10.14.21.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:39:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/5] python3-parse-type: fix test_numbered ptest with parse 1.22.2
Date: Wed, 14 Oct 2026 21:38:57 -0700
Message-ID: <20261015043859.3073445-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015043859.3073445-1-khem.raj@oss.qualcomm.com>
References: <20261015043859.3073445-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 04:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130910

parse 1.22.2 made {:f} also accept nan/inf, which changed the generated
regex. Update the copied parse test expectation to match.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-1.22.2-float-pattern-in-test_numbe.patch | 37 +++++++++++++++++++
 .../python/python3-parse-type_0.6.6.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-parse-type/0002-tests-match-parse-1.22.2-float-pattern-in-test_numbe.patch

diff --git a/meta-python/recipes-devtools/python/python3-parse-type/0002-tests-match-parse-1.22.2-float-pattern-in-test_numbe.patch b/meta-python/recipes-devtools/python/python3-parse-type/0002-tests-match-parse-1.22.2-float-pattern-in-test_numbe.patch
new file mode 100644
index 0000000000..8860080c38
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parse-type/0002-tests-match-parse-1.22.2-float-pattern-in-test_numbe.patch
@@ -0,0 +1,37 @@
+From d3ba98005ddf52d739d2e9056b53ec2f7884ef8b Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 1 Oct 2026 07:00:36 +0000
+Subject: [PATCH] tests: match parse 1.22.2 float pattern in test_numbered
+
+tests/parse_tests/ is a copy of the test suite of the external parse
+module, run against whichever parse is installed. parse 1.22.2 (issue249)
+made {:f} also accept nan/inf, so the generated regex for "{0:f} {1:f}"
+changed and the copied test_numbered expectation no longer matches.
+
+Update the expectation to the one parse 1.22.2's own tests/test_pattern.py
+uses.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/parse_tests/test_pattern.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/parse_tests/test_pattern.py b/tests/parse_tests/test_pattern.py
+index abc19d6..039ebde 100644
+--- a/tests/parse_tests/test_pattern.py
++++ b/tests/parse_tests/test_pattern.py
+@@ -33,7 +33,10 @@ def test_named_typed():
+ def test_numbered():
+     _test_expression("{0}", r"(.+?)")
+     _test_expression("{0} {1}", r"(.+?) (.+?)")
+-    _test_expression("{0:f} {1:f}", r"([-+ ]?\d*\.\d+) ([-+ ]?\d*\.\d+)")
++    _test_expression(
++        "{0:f} {1:f}",
++        r"([-+ ]?(?:\d*\.\d+|nan|NAN|inf|INF)) ([-+ ]?(?:\d*\.\d+|nan|NAN|inf|INF))",
++    )
+
+
+ def test_bird():
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
index 86f01f12db..075d32de1a 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "513a3784104839770d690e04339a8b4d33439fcd5dd99f2e4580f9fc10
 SRC_URI += " \
     file://run-ptest \
     file://0001-drop-the-six-dependency.patch \
+    file://0002-tests-match-parse-1.22.2-float-pattern-in-test_numbe.patch \
 "

 inherit pypi ptest python_setuptools_build_meta

