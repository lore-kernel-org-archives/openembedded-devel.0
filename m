Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B79FC369C9
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 10:51:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.8840.1744973486321403052
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 03:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I8++ldMA;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe574976so12445345e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744973484; x=1745578284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=obsgWbN3uuJs5MVB8CRWBiPG5C4O0atFWNREqMklAHw=;
        b=I8++ldMA/hN1f+19FjUhaAlKP6flvo2EOSmTd6KOF1eDlMHBUO334yGsjdhD05VGx0
         tbkXMODObg/ko9aGH43dTYcTsrioG4a6SJ/8pZn6lmO3RV2V8oHSFT0sStUO5PFibjAa
         udkMa/tAGNzWJ38/saSW2WICLQBIOxdoZ4cws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744973484; x=1745578284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obsgWbN3uuJs5MVB8CRWBiPG5C4O0atFWNREqMklAHw=;
        b=tC54AQA4GIS4U50peB+Vq/IsTB+jw2hF0lotQ/FCXbEGmN6P172Tw8s5+M9NuOaMHS
         UX2pSRR/IrPR0v8kj5f8xXUf9S266IQSCg1VxwS8eVCo+jwUy+pOym7iFGmdX3xn6dqf
         UTH72565BWnVADLieXywV+8frIRllAQLRZyoYQ0wY5gUX0TzeDbgTxZxFohgcMvvjr53
         umldm/wGmhjsp2ElX+PVAY1Hhwg/mmWQai8kStZa7Gule+peaSrUpeyaeRzLCp609gmn
         Kk9hUNQKkgriFchrqxjo/S0LnMM4eXTpUYRT6RSKV4WmkV3SsS+8geW2lSRIbBCnfwsh
         hCPQ==
X-Gm-Message-State: AOJu0Yy0wbqIAbeSrlu9i9cjQkKzpUpPv6As+HoGPVObjV67ABQErfRB
	m9nOqdxC+LBNegN1alDbBvus6A/wBjcjZppOhay7QXhF/d2TU1zh4DjKVelUjZpysqNb0H8BX99
	I
X-Gm-Gg: ASbGnctSv8YaIDOw1ccRsb4XLVWUO7AK6uMTeSKeBMr1HYS/Tkv8RssSKePF7CCNQ2W
	mOt8I1THdTDZZSP4Spz2UUR/v46TNOMShgZvDfNNd3uXZeCoKZx8FlX01U77zoPESJ1eQIPhaYF
	SOp4/gqHGjJkiH0ES7lWotHFFLdlkQ7I7q34nV9KJ4RLE3tugAzmkMs0b3ZnfXp66KjkeP2Y3hB
	KxFXMEbBx5SD/eqwFL8Os1Keu8R1ixmye5GMLief3gCdqVflv5BMaszE9uv9Ue2CtkbYDJwaPRM
	tH95WygSASsWgwH0Us2hwYHDwtEFOa54Jgfs9+ZDdQpGS7iIEMFH+t8=
X-Google-Smtp-Source: AGHT+IGseOh+taHYusU5cdgDUqfAU+Udxq7CRGBs6dr9OzlEp+/KopIFHmg7HlJ/xIH0mBL9k6a4pQ==
X-Received: by 2002:a05:600c:54c1:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-440711cce0emr2604655e9.11.1744973484394;
        Fri, 18 Apr 2025 03:51:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43beb4sm2361401f8f.42.2025.04.18.03.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:51:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-eth-utils: Upgrade 5.2.0 -> 5.3.0
Date: Fri, 18 Apr 2025 13:51:19 +0300
Message-Id: <20250418105119.3211549-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 10:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116947

Upgrade to release 5.3.0:

- Replace arg["name"] with arg.get("name") to correctly handle
  optional names
- Add new methods: to_wei_decimals, and from_wei_decimals which
  take a number instead of a string
- Add CamelModel pydantic model for validating objects and
  serializing to camelCase when used with by_alias=True, with
  the general expectation of a well-formed JSON-RPC object.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-eth-utils_5.2.0.bb => python3-eth-utils_5.3.0.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_5.2.0.bb => python3-eth-utils_5.3.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
index 435d032a84..3b71684820 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"
 
-SRC_URI[sha256sum] = "17e474eb654df6e18f20797b22c6caabb77415a996b3ba0f3cc8df3437463134"
+SRC_URI[sha256sum] = "1f096867ac6be895f456fa3acb26e9573ae66e753abad9208f316d24d6178156"
 
 PYPI_PACKAGE = "eth_utils"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
@@ -16,4 +16,7 @@ RDEPENDS:${PN} += " \
     python3-eth-typing \
     python3-setuptools \
     python3-toolz \
+    python3-pydantic \
 "
+
+COMPATIBLE_HOST:riscv32 = "null"
-- 
2.39.5


