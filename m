Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23236.1794814549339539238
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GzBaeYNR;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4910b863b84so2255413f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814547; x=1795419347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuygrKABSZvtRDPQ7scniPspHtFeqpZngqejZHSkFZg=;
        b=GzBaeYNRcwbkP3whuemvorkPU7anhq9ict7L7bA6KHD1DRCkyLvBb7XuRr5iY/WqM9
         iGSEfhetnTJWbYqJf4MwGIjXixSh7PBBbd9W2KxCe/cqd8UQ9nQMC7KaRSG2xA5zOqn6
         NA2Zx0A0PYxx1pp1V4y6chsLj24OuISzIIZUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814547; x=1795419347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DuygrKABSZvtRDPQ7scniPspHtFeqpZngqejZHSkFZg=;
        b=rrbTBScO/MtuVwVi6LF7w2YZGGMANuWIWJQjc0WbpR5YbkiqQNVfZvZzV8Y4vLbUCJ
         rANUqAYN55tqzP0wbLZIbDvMMLZU8T4ELbRjoAbhQHMsoaMY8tCsuzO9GZdppsUkAkm/
         t36pHqCRDnyVtGnhsN1zHcZoXD3YkhXA6HFVIQmq2MZIl/crtJGJafYAtjGetLvj6VHL
         872ek5WXpXwWO56GsT25Xe7VbfgkCtOhF9YMElIykej6v4cb3XW/5D+7+y3iEJEjQj6m
         /w887FbMotpDL1PDwwpa4xQ1S+8TfwRj7ZPU/x9mLzFUMzxee+Ys0gNdoKSRPtb8JMsA
         qiJQ==
X-Gm-Message-State: APuU4Z8sT1Hi9D46XAE0hvJzd/kU71Dk/Utrer5YJ6Y6z6ahRBnVYawP
	DRIekc2+lm14nQ8MGLVNB40ffO9cH0ysKQcDDTEe3NN8jdUSTLnPK7jV8qSV0Ufz1a53vBggkWO
	Mfnlc
X-Gm-Gg: AYBFou2Ug0vAqzktC9sXEyL9AR5fmWAgjeiOZAuBLcA4ruHApcvCldTKsdCbXc+vA+4
	gEr2dREQfuEj535+aykMXzKfovhMzP8IJ7PO1401Ne4BFzMV7gZzFtQs4EDYnHl9ntadRxXBQ8+
	AdSS5nBErG1Q6muFW7/Mig5ulnhmhWQcG6PJZ53wdG+m7nVlsVTEeX/De74HeirWyhPRHs5O2R/
	oFcQUaOQ7oOSNVk7HLbytdcHDnTPhBkOI374pZdK6ymk758s76bbxOzj+1QkXlcomtbuHfr0N+T
	SpLK8Ou+b42hNaVY9oMOI5LrRfLadCfrQgqKAQoMOBqAxfOX1wz2i6iqQNcwa3l95AO8X7yaC4A
	qLlF8II786S/5pyvojptZy6BNThkW6Sxy8kfqSObNri3PakW0tNhU5b4RifwkqoSN4opC+wzRTX
	ckTT/fziWXRFd10SOwYLygYRGr8V6gJDmnigwF7m/dsVKeF7Cd+R+fTbD3GFzvjjReD1EAwrheZ
	3dqSMxloRXwLtfVf9c4g0k7rQDwpxGz5GrFsH7s6FNp6MoQBlHsS0Z9+XWoAepnQBRLWQj6frsJ
	n3YwNS2e745+uQ9lmy6G6dm6CUpJmXdKlL1h1Lkk3yep6A/d7PRuejEDDT/Hv8oRr+Lwh++zQU5
	4X+0Gi1Rx+GcCdQIaOSeISkTa7kVbjHT08ht3gccu9qeEQ7EAVx5MMw==
X-Received: by 2002:a05:600c:6206:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb687c5079mr99477485e9.8.1794814547430;
        Sun, 15 Nov 2026 23:35:47 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 15/24] python3-sentry-sdk: Upgrade 2.74.0 -> 2.75.0
Date: Mon, 16 Nov 2026 09:35:22 +0200
Message-ID: <20261116073532.880420-15-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132443
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.75.0:

Bedrock:

- Support for Amazon Bedrock's Converse and ConverseStream APIs

The Boto3 integration is enabled automatically when boto3 is installed.
To configure it explicitly:

- Set gen_ai.response.time_to_first_chunk
- Record gen_ai.response.finish_reasons for streamed responses
- Set gen_ai.output.messages for streamed responses
- Set gen_ai.response.finish_reasons for non-streaming responses
- Set gen_ai.output.messages for non-streaming responses
- Set gen_ai.input.messages attribute
- Set gen_ai.system_instructions attribute
- Set token attributes for streamed responses
- Set token attributes for non-streaming responses
- Set gen_ai.tool.definitions attribute
- Record inferenceConfig parameters
- Set gen_ai.request.model attribute
- Add extension skeleton

Other:

- (crons) Mark @monitor jobs so scheduler integrations skip them

Bug Fixes:

- (aws-lambda) Load path-style handlers once instead of on every
  invocation and @sentrivana with @sentry-junior
- (gql) Remove credentials and query values from the transport URL
- (toxgen) Preserve caches on --only and --skip
- (utils) Look up package versions without scanning all installed
  packages

Documentation :

- (celery) Fix stale comment referencing removed sentry_apply_entry
- Point Sentry Conventions links to conventions.sentry.dev

Internal Changes :

Warden:

- Add sdk-review skill and run built-in code-review with
  @sentry-junior
- Remove find-bugs, already covered by code-review with
  @sentry-junior
- Enable incremental review with @sentry-junior

Other:

- (deps) Lock file maintenance
- (profiling) Remove unused ContinuousScheduler.pause stub
- Fix typos with @sentry-junior

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-sentry-sdk_2.74.0.bb => python3-sentry-sdk_2.75.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.74.0.bb => python3-sentry-sdk_2.75.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.74.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.75.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.74.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.75.0.bb
index eb551273b6..b013d02449 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.74.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.75.0.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
     python3-certifi \
 "
 
-SRC_URI[sha256sum] = "dd91d75aacaef636006b579ac3ddb2fdbc9dce35f00f4b353b6b1b110c6b256a"
+SRC_URI[sha256sum] = "c38ac2d4b2435c11da821e173bb9d9088c98f41ae92f559ce0e424170a8e1a29"
 
 inherit pypi setuptools3
-- 
2.47.3

