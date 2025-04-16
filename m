Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC84BC369C4
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 10:16:03 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.15764.1744798560836238399
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 03:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qgJ4zxGE;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abbd96bef64so1264436266b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744798559; x=1745403359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpBSmI0z8TlNUDONzaecPMxOhC0ru286UYhR1DCx+n4=;
        b=qgJ4zxGE5De/BXBFfwbvHAarozVZruIyd/UxMpp0Iy+RRabkZWGK3VSeg/INM+IDw0
         TKnHUn169HfvgAnpsCzvFBYLGXu+vEKrYETyKEzFolslR6GWGnOWq8wZOSpcgpMLPMJj
         pHVOoEl+1nXoXlL1fFrA9rYlBlM1/9ENjf5XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798559; x=1745403359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpBSmI0z8TlNUDONzaecPMxOhC0ru286UYhR1DCx+n4=;
        b=jyC2GFA6w8GdfRhVTt3Sk0eqE7fWBtikSxi2TSMf3uioaxAVnmzMCqPuKk0ZAhsWis
         63zrorSTfLN6H3eM2c5ENF78/cHiy3GZgPNlOahRYCo6f0DYjOFx16foHbMLvivSyhNm
         q2jwvoFHXCp7aZRjx0jiCBQ57h5tfNV5GM5Pr1zD8xVaEr4I6Lc0Mzhc/JbT6RIdnbRI
         GbEQTxA6YfRvV2Hozz6xBNq843sZjrTlpZuEn1bXyflPnZtb/JEV2t1X0AsmirtmcGHP
         xIbOD8MrCV/Kt+6eJJy86+0VP2GCk/Dr+ZTCT+ytbN6hcMku2PJt1cT411u7d1cWsQem
         9zVw==
X-Gm-Message-State: AOJu0YyhYxXV6b+hkgC0ajr1Pda3UCYZiFIVnuRGQKZE9BadpWv9btrC
	SgmjNswKwWchESYcMSTw8moA19Ps4+N9D9h+SN9U9UdpGfB7CxXeDgaYhBczNeljru66pq2Sfa8
	7
X-Gm-Gg: ASbGncsDYNXovPmeHO/MMYh8yZx5PQ6+JkkOOw0PjDXEYE0esFJlyeRut91gFf0krnf
	Q7n7qWbfBCqNtsFb8/t8koz+mEOwiI+JnxNyica29c9a6I5uMOfKVKvBpEHU8s0V1r5v/rKvL65
	SWbvTyYuqkq31xWFkMkgKZI2KZsdc6FgxRBvYkKFJV/5RigHg2NCanrzn7k51VsK+voOzKxQLEx
	s/6+RnfGNviIfpAYOQrj/5lnL+cmmaCl8LkEkefZwD5nFfuPLKLgww1pd38MFTCpsr2rlVLh/qm
	RLY+XMtcgiTWw1ZRj6Pm00tmT4fT6hJ9sI7Q27+kHtrgu4ZyzuP/OMs=
X-Google-Smtp-Source: AGHT+IGICfWP67WjpBnQwp9VCr12HicBv1knExLxYxp/clOddoMp4DUfWYDDRYMh5FKflIoEfASJYA==
X-Received: by 2002:a17:907:7f28:b0:ac4:3d0:8bc6 with SMTP id a640c23a62f3a-acb428db38cmr120856866b.13.1744798558697;
        Wed, 16 Apr 2025 03:15:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d32dca8sm97823366b.164.2025.04.16.03.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:15:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pymodbus: Upgrade 3.8.6 -> 3.9.1
Date: Wed, 16 Apr 2025 13:15:53 +0300
Message-Id: <20250416101555.1679536-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 10:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116903

Upgrade to release 3.9.1:

- Correct byte order in bits.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymodbus_3.8.6.bb => python3-pymodbus_3.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.8.6.bb => python3-pymodbus_3.9.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
index 200e75748d..d969165a54 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "7689b56cc3ad05a594e1486e772abb9d9646c01737935df492db04455680baf6"
+SRC_URI[sha256sum] = "ec6216f218dd7e370fa43692535ee5268adb6b1cf7037dda6c78ac92c9a43a84"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


