Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86652CCF2E9
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33884.1792414587270126692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Dh1h/KLf;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df54150dfso1585844f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414585; x=1793019385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OklJBlYrqRrQkdVzzk9yP0Jt5JRCvOodvNlkdBKDZLM=;
        b=Dh1h/KLfXtUqKd1GMjiq6A9pOuJrPLJfrKJ28ZVqe+ClBk941XTiOkuNYM9JLGPznm
         EWHOMVhEbZ8CUwmkrV3CPCrHz08K8FeCnsykgKgYC1JfRva+hlymfSFq/mbGHGipcWDB
         sMSK6b1CaxfUHv57OdaJKFNCg99DAVClmDLOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414585; x=1793019385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OklJBlYrqRrQkdVzzk9yP0Jt5JRCvOodvNlkdBKDZLM=;
        b=RC50UAvCrJ0FZXQmIKwmOonwlkidJ9R3e59EWP2yADA2RHTa2a5rjgMhnjlU+uTBvA
         8RI0ZukMHckqztdlAuEOnvbBHIEBz4f4Opb5qDHjeJQEJmpqb68XHlzIp4P5pld/oCRW
         H6lLjBeKJOORj409pUs+b0gSTSPCQ/P2wBWrCtEXVUVeJcAiMTaYJGugOY2wS0Db7dqi
         9hQRa8A+zzHI4dSH83toRhpFpowq9HAPqcMOcj7OFys+8Vy06KryuJNaGNo4esPmRnuf
         glDAJtGlwbU8dH4/MuSFaW7Dq2MOMRW+99A7o65pNfCOX5KFtRUYvUQ335MXsIKcrD2R
         zbSg==
X-Gm-Message-State: AFq9FYJi9PhuMmsmWxQDo0xh9GCFtG1vbXP2c3VGvPSC3Vpxo4am5XnO
	e0W5UIJtAcys0RolxYZcokhULy7qKSU+mJI3qqpSJdPjLwJ/s5BZgR+xTJX/GtiZwAsCJ+SlEoH
	rHmBA
X-Gm-Gg: AYBFou11kkPR0f8Iz+FjNu1Qpj/TxXjVSgjyq9xZlu/sKgWF8mUVTEKrdzcxRe7DHB6
	H2So/2cXNx4PEW731Lz8sD+h9xpkVGQMLNqzV8PfU9pwo1Ssslx7R00a9JhiyNRrggZSTp6T7ZN
	YrCYm3BblZ3qSslO4TKLekmGDoU7I8Bbw4rLI2jMuDQ65BsJAjA33uF+9xUfbvaCI6k0BBNxQWZ
	dPxL0goPdcSgyPh3AgW1IR3QPbK2DroYgcT5Za9AlQscqan5Fp0CseMQ9ZPsM4r7ABxOnHWliL3
	GvX7VOqZsK311U/40PLuWddSe+tUBaScHEBYA+YfAGRJEm/IqH1OmcrBCSRxpv9MBDYayMAWEhh
	IJKp4XSSb/bM7bEtqx/UUHgiqwUpUkLvBix87bKwnvI1KTF1UOmv2WOdSlzP2m1oCkS0KbixrLC
	e/snlwAihzQDnsdn5/XGNHVFVKzt9VqRI2NKJMKJy1axsUmvQWziiWwFx7Hhbpm9QTNGQEqlVnz
	ji6a8GU+ADtay9q+UP812MLXo0PLm/IXMooR3h9Gr5Oy5VhCywgoQN3duGS2ZpbLLvRKgx/oYmg
	E9r3R4Gd3NLrT17sBYzZNQk=
X-Received: by 2002:a5d:5085:0:b0:487:767:b301 with SMTP id ffacd0b85a97d-48e07fa99b2mr11454289f8f.57.1792414585496;
        Mon, 19 Oct 2026 05:56:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-cachetools: Upgrade 7.1.7 -> 7.2.3
Date: Mon, 19 Oct 2026 15:56:12 +0300
Message-ID: <20261019125616.3888504-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019125616.3888504-1-leon.anavi@konsulko.com>
References: <20261019125616.3888504-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131121

Upgrade to release 7.2.3:

- Fix @cached decorator stacking behavior.
- Minor type stub improvements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_7.1.7.bb => python3-cachetools_7.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_7.1.7.bb => python3-cachetools_7.2.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_7.1.7.bb b/meta-python/recipes-devtools/python/python3-cachetools_7.2.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_7.1.7.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_7.2.3.bb
index e55fa6d0e9..f5df92347a 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_7.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_7.2.3.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "a3e2a00b14d8f8a6b70c1dae7b4685e7ad3bc965c5b42124a2d6ce895da6cf50"
+SRC_URI[sha256sum] = "e6fafd06de4a5bd915ff7d247588ea497e28c9a568c62db8678d9a5f11515a9a"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


