Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091E6FEFB66
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:43:53 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99118.1772207028371461647
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YQVjKBGL;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4376de3f128so1516812f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772207026; x=1772811826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xa/Y8bIpxmKqgbMiadyBPam0G14Rt7Ly05oxrfdOPN0=;
        b=YQVjKBGLSE4vqOZlEm9PIeUa+6HYk4CQWRlBK5PjibfjewG+JMSDD0r2qV8SKSXQFk
         /7glrR/TAj7e+79gvVxYnmz9Jk22FpuEFnapmZ9Y8P3yxGt2bPJimN5VNR4rKgUgZsPU
         uoxSiPMCNc/JgdUQ4dnEaTjIi6OACZuTIQW5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207026; x=1772811826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa/Y8bIpxmKqgbMiadyBPam0G14Rt7Ly05oxrfdOPN0=;
        b=VoBAsErAf4C3tliApuOWbEIUHCkqQKwIkxhKIsNo3XSAM9wIltu6YwFhZUN8GZHaMy
         CIOCk6MoVLGqZEPqVFdbJ69z5WjwYZsDYuURtf5yxzZts29cBYX77bAiSELJ0NVDVM0F
         z3SlRN6WC931xrxIHC2m/A9vadLMv8bXVo5wMAfpQX9zUHvOpFd7PczyaQIDKVjH7ofN
         w1uzbtM3yqbyyxKKRMMYpVwb3vyBOIms1Eu/86o5lhZmzb5K0jl3niQp0kp34FID9VWz
         NR9El6OP3WziWURTWZzNEJvFKUFEjFO54R5yWINGheAm7mMrHh0O/0zmNrRQilXbuc1C
         3+CA==
X-Gm-Message-State: AOJu0YxKrepinbwR04iDo3CJaM4SVxqQIeNW1g2Syx04c2k7TkS4JuA3
	jcXnVL5tSaJE/ERADF8a95nyVu4GVRne0VxlUSl3eVQXFj/FhQYw2UBiiP1G/lPDR+5yf2sUnWZ
	HAvoa
X-Gm-Gg: ATEYQzymz48wsRJGzZJDLrN9B9WnwMzu+QC7bnYoGfQMCWG8ybkUzjH9ZOZdXwNlM+F
	AhCg5yyaToWkzu793RKnKH650h2Q/i1Lot0idpEJV5N3ICUAfR7aj39nxMQMGy0Tf3utR1ta3Tf
	AgGsJ5YtixjEkJtUwqMvF2m7do0FVMcmSv8Okwk2IlHHUuKSp5jDOV2+Z8MQEbAlyep8NIMek+0
	Xl8M4fVThmnL7BtI1qIcUXVA4BBwyntg7JQDsyT0/jNdJbnjOQgx2Jhos6ojchQub2QUE0GtRjs
	J6r4JB+KjNLLPKm/LOUazxvM2UGpe9Kqbt1nvKOydZnLw8v2UV6f579/TkLIHPb6hhZKk3pkfhc
	fHrhCfdfAP8a6GoXL3c6x6+Lmb1oiodYbUBSVVZ4YgV0AAnG8GIjMMNJ4fuE6V4ilqZheCZFch5
	7wZJ4HkNy0tWGeSLoTQivscMEHk1ksMcv7+jdF3ZdOP+/byYc=
X-Received: by 2002:a05:600c:818e:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-483c9ba3aadmr55924425e9.15.1772207026208;
        Fri, 27 Feb 2026 07:43:46 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm245845115e9.13.2026.02.27.07.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:43:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-fastapi: Upgrade 0.128.0 -> 0.133.1
Date: Fri, 27 Feb 2026 17:43:39 +0200
Message-ID: <20260227154343.3923152-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124762

Upgrade to release 0.133.1:

- Add FastAPI Agent Skill.
- Fix all tests are skipped on Windows.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-fastapi_0.128.0.bb => python3-fastapi_0.133.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.128.0.bb => python3-fastapi_0.133.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.128.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.133.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.128.0.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.133.1.bb
index f047f5321a..88d8350b79 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.128.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.133.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "1cc179e1cef10a6be60ffe429f79b829dce99d8de32d7acb7e6c8dfdf7f2645a"
+SRC_URI[sha256sum] = "ed152a45912f102592976fde6cbce7dae1a8a1053da94202e51dd35d184fadd6"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.3


