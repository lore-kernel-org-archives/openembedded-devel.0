Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8808BC44502
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:46:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147538.1783331194483143827
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cpldf/Be;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so13987225e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783331193; x=1783935993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Zts03lxiEl/YDqO1llU4nuCJrFZasuqds+YVTFTFOU=;
        b=cpldf/BeUWbGHwrXWC9TtJHHJA3gJQDDttiOFNIgVeDoUSOz+6MJooCBv0oiVAFthY
         IS2m/iq2zdyzhMKw9APWx6WHtzwc41I0NEtEbIbKchGs5Gi1mobUS2SzYs8BwBEgBixB
         aDMYF+z/IUwNl3csxtiIlUlpocOgrRq3H2ZcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331193; x=1783935993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Zts03lxiEl/YDqO1llU4nuCJrFZasuqds+YVTFTFOU=;
        b=O1I5qxCf5hcZ2lBT20jLIC15xwlbi3dbfy51os9z7DcriZrjUsnjS6rSVmoN1k5Fyj
         umnHRjhFB8W2qHMWS+BEIR5Zehz/sHIY9W8PHebjOy58iwQCazCyDyJ1EQnDsbs5e59G
         C0vdFlBM+q8CPvVPRR27BxhSqg7Y2NFnD4u1XVBV27SohBdyYFSlO3gwzFkSsUUJgdZu
         qf4AmbqIsK4xsU5c7iXS3P1BEqhMltp1d9ZCSvkrKQEXaYlP0fOMeeU6RAN0TZ6b9QLj
         043Gwfw4VprxkYN6Z2XiCbx6Ei9Pn8EMvXjqzZq7WyGWNh/AQ0ihE6K+lSDTV5idKFA/
         yC7A==
X-Gm-Message-State: AOJu0Ywjgsw1A0J8rrHJZtFYU/USAB1RWnlkzDGOWe/UEvyZUddk2UZG
	cWGX7Bp34p5miIRBrCsdAouJCC0aVcw1gm182wEwEoauOOdYcAcWw80ndtxqoOG/l8Xc2my1WUM
	1V2Q9
X-Gm-Gg: AfdE7cnRURYmwLtKbv6Zz1J4bE0/tnVzx5tGPBcvJGTM/mPGMOV3pEt/AMmqlfw+lRU
	hBLge7QzPYjK3B54fj2xD0FQpOFz84pCmxLPga440h8YshHOwg44T0bZrDLHPoG0blTqo4v8twA
	AY0o/vrEoSFySNW/dNhfmRfZqlEx2fK8aciL8tat6IRIzqDSE6FKx33JTN3URvAGMnoOtm9qT3f
	OX8HRufKEGDkoIioSmGSwAZLcl+71qXxBbqfrLMoRGO8h6rY4TeRrMS0pa+iXEgUMMxVsqx+HMf
	LhSUVAjquxao3DlD3qPiSI18jVnyBJsSU4kFMT0TWqPziUG9f0LimXbxSwUyo+yN+hPejId48/R
	jgvM6CrCic0Pw+6bNLKOgxxph+zkx/jTPGR/ju3qiJLjRF928H0Bir2M2fK1Uzvo8Tes+5okhMu
	8UmjbAVzdvCFIvWBZ3utgzxhx3WdYa04oiiifUY+If8/IVt0TLYYWt8Hlpuw==
X-Received: by 2002:a05:600c:2314:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493d11f6f7bmr76630995e9.29.1783331192693;
        Mon, 06 Jul 2026 02:46:32 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm22638978f8f.14.2026.07.06.02.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:46:32 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-genson: Upgrade 1.3.0 -> 1.4.0
Date: Mon,  6 Jul 2026 12:46:26 +0300
Message-ID: <20260706094627.1254799-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706094627.1254799-1-leon.anavi@konsulko.com>
References: <20260706094627.1254799-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128040

Upgrade to release 1.4.0:

- add enum support, activated per node by seed schemas
- Performance: strategy deduplication when defining custom
  SchemaBuilder classes is now O(n) instead of O(n2)
- include the complete, runnable test suite in the source
  distribution
- Bugfix: fix "noting to do" typo in the CLI error message
  and remove dead code
- Docs: document the required-dropping behavior and the
  builder-merge gotcha; explain why same-type inputs merge
  rather than producing anyOf; add a NoRequiredObject example
  for suppressing required
- declare python_requires >= 3.10, matching the tested Python
  versions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-genson_1.3.0.bb => python3-genson_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-genson_1.3.0.bb => python3-genson_1.4.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-genson_1.3.0.bb b/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-genson_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-genson_1.4.0.bb
index e23af06a2b..fca391c9a7 100644
--- a/meta-python/recipes-devtools/python/python3-genson_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GenSON is a powerful, user-friendly JSON Schema generator built i
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6c30d55dbfb3a28d420d918534adf6b"
 
-SRC_URI[sha256sum] = "e02db9ac2e3fd29e65b5286f7135762e2cd8a986537c075b06fc5f1517308e37"
+SRC_URI[sha256sum] = "bc7f1c1bae87a21ca44d81149aec95a3f4468d676de9b8b08caa064f3c50b3da"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


