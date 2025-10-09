Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B24CCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 08:14:15 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.6826.1759997646724082139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 01:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Itt4Q0St;
 spf=pass (domain: konsulko.com, ip: 209.85.218.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7ae31caso108934166b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 01:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759997645; x=1760602445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qY0TW8cIlp3onZeV10/N5F/efX4oIUHLzL1yqHtkbw=;
        b=Itt4Q0StTsieiuN5+jJxPOEjcTa9ZBPQKKazCG0de8+QF1e/aFvDFT11UYRAUHpSm2
         nqqcGMhi+r+bNuIXyKuxFzkVRVtm8EOxQzVo7c31TURkGC9nz2DQrR5m0wng2iWZfyeQ
         OiPFp0bKjOKmlzaIDG8G0HiIJiTAp31JJ59Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997645; x=1760602445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qY0TW8cIlp3onZeV10/N5F/efX4oIUHLzL1yqHtkbw=;
        b=UxKGZPmP7/433oQKnvPsOUNc6RL1Oty+906oBBEEofO9JB0nPCeMCEuELr2IENAocN
         JdId/66xaOg6ofH9i7c3TjrDcA1ysitkL+rNcqS+qyp/LpmuuAUgkpcAZjUE29G9Genl
         n+MUrJshSVpErmH7JefAI55YKfFsqkhs4WEgPPD8XUR7QHK/CzAMKLuXNHccIPjfRn5u
         uc0oXHWL3MdsEIpA1hi383Q7tp9d+5m7btmqHfb3tpWto9t94Xq3cjRyeJC9h2HlJZPb
         Z213GcDQ1LNLmu9zSx0AWqlvenQHd4ZsC1PwKquz1lYe/FNoCTee31t2bXsqUrcKczFX
         WDDg==
X-Gm-Message-State: AOJu0YzDa2i2bQe8/LUR6fAy/g4ZaBbXMKCvU3w6ItJnlVS4eEn6PluJ
	MAByiQx35bLZAi/S6QxGZU4zT0dCbbnXSHWf1Fp2opa2hRW5ETMj3DoZWq3fLDlx8hRk30fJKUM
	BcTxL
X-Gm-Gg: ASbGnctcG34dZ9AcmvZSd9mJJLRi4J4q3gyuUCAdj2qV7kZbsTwu/cItHnEzouwX/ic
	j+R4cv6muG6+p0jve/plWwsnmAr8Qsr5qfvT7CxeRVBR5P06oyvdGpAnSYS/b0Jp5PB7zLH4ZvZ
	ePF0LdFabx/x8EK+rnrCDbZNWKVuAgt2mI6+7aUcJbdGTS2+HDCmacGRW1ee0PBm1hw/0bQeAaU
	aM6bVE77qUhkrX5At4wAh6xzJWsIkZZzWCYUaBNYhWrgaTZPAhUJh3KWz83kZ9ontwMd5+TB6uB
	ejNYxPoy0INiwCgyMjZ6h9FuhZMwAF1K8G2pWCfZsqLf7OTPXO+V+Z2WXU86b7KTx4H8idI2Ukt
	iii6in6fZ5BPAgON2Xl6hxvQIRM77zpbCDQcTifcRkd85IVLYw8lSNsW3COTy/popH/cP6pK5es
	vwWgfbVQ==
X-Google-Smtp-Source: AGHT+IG0Co7Gjy+H+yTMEgO90vbQQ6wXJG+y7QD4ScRFMT7aQuz2EWzJNGwAMofS4IcGkO1R8fYagw==
X-Received: by 2002:a17:907:68a2:b0:b54:858e:736f with SMTP id a640c23a62f3a-b54858e73a1mr204112066b.36.1759997644804;
        Thu, 09 Oct 2025 01:14:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652ad839sm1844874266b.1.2025.10.09.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:14:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-awesomeversion: Upgrade 25.5.0 -> 25.8.0
Date: Thu,  9 Oct 2025 11:13:56 +0300
Message-ID: <20251009081357.3446410-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251009081357.3446410-1-leon.anavi@konsulko.com>
References: <20251009081357.3446410-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 08:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120425

Upgrade to release 25.8.0:

- Refactor AwesomeVersion comparison methods and optimize regex
  patterns for performance
- Refactor AwesomeVersion comparison methods for improved
  validation and strategy handling
- Replace poetry with uv
- Update pr template
- Fix compound modifier comparison

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...someversion_25.5.0.bb => python3-awesomeversion_25.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_25.5.0.bb => python3-awesomeversion_25.8.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_25.5.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_25.8.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_25.5.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_25.8.0.bb
index ae600a48b6..338ba7e97a 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_25.8.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "d64c9f3579d2f60a5aa506a9dd0b38a74ab5f45e04800f943a547c1102280f31"
+SRC_URI[sha256sum] = "e6cd08c90292a11f30b8de401863dcde7bc66a671d8173f9066ebd15d9310453"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-inherit pypi python_poetry_core
+inherit pypi python_hatchling python_poetry_core
-- 
2.47.3


