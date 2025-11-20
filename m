Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6147ACF9C51
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 16:59:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1377.1763657941857241955
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 08:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tCAm7k+r;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477a219db05so7752365e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 08:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763657940; x=1764262740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxJiOH+UznjxWl2cUSmOHlCsnIEijztgOUiT7JFGEQI=;
        b=tCAm7k+rUjo6wWoFAZSTVcENC3ESMOhSbCkCBunKyRJB3xhIAL1qa1vKTKPBGYghsS
         FOPshTN/kKTcEGR999xhvFRnVdybiqEQHlmPCza4Ba1e3qpIoDYxo+AuczGNsqZwQgzu
         wpzRjtJhanu4aImMwTyXSNxQbPHCVCin3hGiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763657940; x=1764262740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JxJiOH+UznjxWl2cUSmOHlCsnIEijztgOUiT7JFGEQI=;
        b=Q1ISrsqNM+fBclET51mBiNDHEViU9JJNFPGOnrfVcCGWYYnwTYJjdyJcpJddnhFpiq
         N5xpyAhTgf5LvhbStoYw4nKF0Odr+Hc34x1oVQKOYrFRhaM062Z2HE09SKoGeNxAKdiw
         0yCfcmIr0YKCZyEmalZcDkpJ5EpPd8CttjI4Oj74pp/u0Ugl62d4uLWt5zYc4YSOE161
         TGZ5aspWvQrVjod1/qAtVb/x9KbFNzjkOptzuk1m+ePh61H/xqHMJZo5jj8zHx/cUQT6
         Qu980VG1b1f3ghEeC9ATio6ZGjmJMSmRD474Il0k7ziphavD5/vy5rSi6RNqZSHdLSKf
         FxMg==
X-Gm-Message-State: AOJu0YzaQgtY/QfRbVMhxSnEr4fFRUK+/Wws2YH9kGgP/mY4DNZyGm8b
	VDrom0oT1lX5tx3CnSWFxonGEUVvxZtnYV60zCqjlHims1t2st2ySuZ9qXsNyWThxYmH/BZ2nnE
	bXLKW
X-Gm-Gg: ASbGncsqaedbn7J+oVK6J14pMSliKRDOdD1AgFlwF/JiEzKiajjHzHHfT1OP4qmy6dP
	1o7MasumwNAhMb3KDe9mz+6J6gzg5ZN3e08yAK5ZhNCiwUs/az8MEjXvrdLz/ZcL1vQWhYjouQ0
	itMRrjrXEgj+xB7iFMoBAomiqYe6TH8SvFBsc8bk6aHxN1UNkkVuZ1mZ497jMm7TH1dir62GjwG
	a8rUVJGSRW3rNP3W7YaDJju8SdNR22D/RwJf/GGT2c1k2jlQQxPWdijT2lwudWS5FQRNTdeGjvc
	khVieVSg8TsEXnNKv2WpEhSHN/7yqBcocUUvW+tkQ0TzxzGxsXbETU2BP0k4yyUQI/xOjI6Mb3S
	DV1lvyAurc7imdCNlAA1XDV8XgjQIK6kVYDxxZL4lx/4Zrs2R6HA3yfs7CE9nGO2/MQ02xfo5IO
	7SXLED+UvCGwOMLwPnSDkC2DobktMT6zJvInA=
X-Google-Smtp-Source: AGHT+IGNwLreu8avpNoUt/pARq7lXQycRPMI/5JoE2hUNvyjrmgz19qb1tfx1wZCsbiB6FvgRQU2lA==
X-Received: by 2002:a05:600c:548d:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-477b8671c96mr41854015e9.5.1763657940055;
        Thu, 20 Nov 2025 08:59:00 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b106a9b0sm117946095e9.11.2025.11.20.08.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 08:58:59 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pillow: Upgrade 11.3.0 -> 12.0.0
Date: Thu, 20 Nov 2025 18:58:54 +0200
Message-ID: <20251120165854.2763894-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120165854.2763894-1-leon.anavi@konsulko.com>
References: <20251120165854.2763894-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 16:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121953

Upgrade to release 12.0.0:

- Fix issue with forward references in parent TypedDict classes
- Exclude fields with exclude_if from JSON Schema required fields
- Revert URL percent-encoding of credentials in the build() method
  of the AnyUrl and Dsn types
- Add type inference for IP address types
- Avoid getting default values from defaultdict
- Fix issue with field serializers on nested typed dictionaries

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pillow_11.3.0.bb => python3-pillow_12.0.0.bb}     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_11.3.0.bb => python3-pillow_12.0.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_11.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pillow_11.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
index de88160e25..4db5db1572 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_11.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "89f1f4626a2aaf5f3d5ca6437f41def2998fbe09"
+SRCREV = "693df7b42c666f88c719f9973be0ad71607328e0"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
@@ -34,6 +34,7 @@ DEPENDS += " \
     freetype \
     lcms \
     openjpeg \
+    python3-pybind11-native \
 "
 
 RDEPENDS:${PN} += " \
-- 
2.47.3


