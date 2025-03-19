Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FE4C36002
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:04:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.6233.1742418265285651999
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uvmh4e4Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2254e0b4b79so223475ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 14:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742418264; x=1743023064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Z267r8yTcMVBPw8MFb2GSNo7aYC/5XWwkv2hs8eMFc=;
        b=Uvmh4e4YT5CtYmZgi7Be3EaDxRCkhFoKZeChLvoozfcP/3tKg83wA4j9QPhCs7Bc8+
         hYMLw3YvC7cRpxUR8K5TFtM5J8crhLyxfsN228GO4NQtedr2J7J/2SwCwZ5YkPdsg1xu
         mzb4tWNk8p6NU7X6nXCkqCbIcPxNoiw6ncNpDT3YsiZppaWYaNscualBjsj0nUH/1uMx
         27d8SIf2MH1xix3mwbqpPzvqMi7B6ByUwTuNZjTemWmXEJyx7tmXux13/3tfm8nBZ8Xf
         Vs26Lt4AmCkIJiXPUVRbwRrwq/S+fGz6D3iu1Ki6ssT9euOBmwVxtjGBBJVZ8TLWUIWH
         xfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742418264; x=1743023064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Z267r8yTcMVBPw8MFb2GSNo7aYC/5XWwkv2hs8eMFc=;
        b=cWAH0UPRFZFNte616RRQTDQEhbSu5ZwOeI40QcnqM9qPQc/2Xij5NwVQ/jBvDrkUIb
         8NlJwSLLKyWZcgtSy7dfFqaTNTukRUnkjR8lG4xGV6z3PNwJ8XAvGMt0Z4LOUyWwhlf7
         o01HSuS+PCTs/nm2AUimOpDVxm5LLmTGBnHHTjOdZWwnDLR/U8I+CFTQWK90d0XbuEEK
         ZBsH9jrLVZKceWu7Q6qZgCyas/ZZBoYAAWXJVL1YyqDlIV6w5YfnZLZrdqWQtItrklja
         qNauF8kI022+hmwwSrlmocQmjgnjlcJ60BXFv0b4XnfpoSMAoMMvMzi2J6UbAsK3K+Oh
         FFaw==
X-Gm-Message-State: AOJu0YzS+nIPPGlxfkY7QXVsAbWsLlpLQaYuf4U2+XriF2oa1pt1z4cG
	/eI1RLDLlCxncudDmcnPjeGLFgrRq6dExLJckVF83VECo2mSuucrL6LE5jRP
X-Gm-Gg: ASbGncunhAzyXzYtWQ066My8aAg51miaEZfz9GFQNkwLtP2vGvwUqYEoCfAuTuDbRsZ
	1I8/dJnuHU9ulJww6AvzUWLv2hyy/XPHE8+qEuYcCeNfUW4ZVuF/Z0nthLOMFhnhkRbKYmDG6Dy
	trfPuZFGlX4PhoaG3GY3qRzNgNXW0V37AvVs1YbdUNbxIboNR+H9H4uXMrCQ9Ed7BqQXepsT0aL
	OtpQphL0vkVYjG7kbrppx1IInSowFFM1nWkfWBdVEF8bzWFsSDs3AiYJz50lmFi3g4ZaPZTMIcM
	p4mLZkU9JkQpzHn+R1SzbQkCNgx2FUxK7q2O
X-Google-Smtp-Source: AGHT+IFiUhZPtK3mAnUPOm/ZGOG7d5pDnIiI6GT/i1PsXaJsJj1dveC7bItmBVyPuHRzGTxbpHjKtA==
X-Received: by 2002:a17:902:f711:b0:223:28a8:6101 with SMTP id d9443c01a7336-2265ee1ce6amr13475525ad.29.1742418264196;
        Wed, 19 Mar 2025 14:04:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152938csm12511767b3a.12.2025.03.19.14.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:04:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-multidict: Add missing rdep on python3-pytest-codspeed for ptests
Date: Wed, 19 Mar 2025 14:04:19 -0700
Message-ID: <20250319210421.2454856-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319210421.2454856-1-raj.khem@gmail.com>
References: <20250319210421.2454856-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 21:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116111

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
index 568b1b93ce..8b30574020 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
@@ -14,6 +14,7 @@ S = "${WORKDIR}/git"
 
 RDEPENDS:${PN}-ptest += " \
     python3-pytest-cov \
+    python3-pytest-codspeed \
 "
 
 BBCLASSEXTEND = "native nativesdk"

