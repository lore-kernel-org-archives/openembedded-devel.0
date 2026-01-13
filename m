Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92B4D29DDC
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 06:35:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53380.1768286151270174419
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 22:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eRvjfnBR;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ed9b04365so1665435e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 22:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768286150; x=1768890950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joB0yvOHTQ7C6TrAJbyXjq9yzkX2PW0TMb6PQw4+aTI=;
        b=eRvjfnBRauKNcdoRYQ0rIc/Vo8Ye2MiqLcHOAQtxPMGas62jO3yMf8p3+6uTJ0eA4x
         thuX2cYLXc5HVwqzHYlka7Iyw4zMMGSqISHWhVm2FKMDcV3uXvYmTUcssybm2JrCZced
         Z0QwF5vsYXwNgMIjbRU8cVc0vO9h7xTs5i87br26N55pN7fNZV+ApiuqD3JsRkf6k80F
         jN5/wuMxmwq10lHJTJ1n1dtVP6iBxfYrFTrpYUNTRSe9Wu/1LKrR+g+6vc3RLqlKYMq5
         px2M4CPzLql3vVj4BfePObhKkth2RsjQHLRyHblfIXDBGcZkGB7pTpG0rNis7qky+rbf
         mfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768286150; x=1768890950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=joB0yvOHTQ7C6TrAJbyXjq9yzkX2PW0TMb6PQw4+aTI=;
        b=b/oidttaMlXzMrBfK/EQvlZvD8p26JtPPoY27ds0rUcD8pxWuDNxS2yPaG3m6+cdOm
         PUUg72hgYEJEvBo815AQ76TZh8I9yzfKgyNlr2qNmyI9kRb0LKjGrVxnuOr/HCxqyDwl
         L5VRt67sfZ4CurXMid4zf8widjJp9p+N1seXl0iPvpppKJDxFRj12S3o4T/Wr51dPZTa
         zYW1ZxjYVYo8heEVOleORck0+83aGDoLAk5qunMhlODhF8zw9tyKMjKwdjPxl4foWHLg
         gWjfqzToQHmQcKFQ3KEk8CgshOojLJgTGy1NG9xdhAo37rZr7WrcXvzkmzpArg5OGCE5
         4+xw==
X-Gm-Message-State: AOJu0YxMNeqd7H3+rWB2BvAbRT8BM7aznahCZlkyEkKY0jzOUmZdHl7L
	Owzw8xfZRfcnUt1GrYWuHTZcVPTs/VdJZQlxh5AzJtnmZIfoUVUH4WFfV4LRVg==
X-Gm-Gg: AY/fxX63KfQlBYVnVRHr4ilBB3EucdJfyaKa6JpZeCn5810dxllVB5I5LDDxd75hPzP
	eG8fM0J/0ZMOWpzkyh2N8ro7ojCD+8Xk4hNojXkVDZqTeuY5sBB+P+d/XEQIhvgJzUAHbRHJR6f
	YiY+5p1A6cT083Vm48Mf/6RDAgcL4PBrVaMSlxbCIey5LtIZk5t59+U0Jq4LCvgNoE1z1STbLz2
	U18ApdnoE74PLPxwTSAx5AdJDWWUZm5V/BqngWIWlWoQccPemrNA8cz/MaTGbz4Ovwm1c9SQREv
	NHSc9K49EGHgMhvmEI9hTGocxaEpKTL90YwKHGYOIHnZfuMbBGrTp04Mlk8a9kjsqOekrggobAr
	ABjIrFL3nFqjWKQzHeyr8SN7Z6ltu9TvF5DbRXIsKv8fkEM38MU92uVXfW+npLk/6+WFjjQ7XqW
	UXn2rZ4Rv6
X-Google-Smtp-Source: AGHT+IG80qYwt2MIFvfOfMYJgir4iuVFSDu0CVy0eV7361r02Rd/QVvla67Fv903IlER65t5tR4Vpw==
X-Received: by 2002:a05:600c:1d14:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-47d84b0a7bdmr219647115e9.1.1768286149494;
        Mon, 12 Jan 2026 22:35:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edb7esm42273385f8f.30.2026.01.12.22.35.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:35:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 5/5] python3-werkzeug: ignore CVE-2026-21860
Date: Tue, 13 Jan 2026 07:35:46 +0100
Message-ID: <20260113063546.1497839-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113063546.1497839-1-skandigraun@gmail.com>
References: <20260113063546.1497839-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123400

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-21860

The issue affects only Windows operating systems.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
index f795da80a3..0a18a48406 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
@@ -45,4 +45,4 @@ RDEPENDS:${PN} += " \
 "
 
 # Windows-only vulnerabilities
-CVE_CHECK_IGNORE = "CVE-2024-49766 CVE-2025-66221"
+CVE_CHECK_IGNORE = "CVE-2024-49766 CVE-2025-66221 CVE-2026-21860"

