Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A773FCCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:57 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.7973.1759409988157942693
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdF798Hw;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3e9d633b78so215571266b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409986; x=1760014786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LLs6LdoMNjN6EobDvPqcVmhwEyfT1Rj3zkS3grlLOk=;
        b=jdF798Hwmo16LkgPzLLlS0vLT35mviozzmfFtoGG29jjFMIZ0EOSJyIJTJziRsLwuQ
         zxgpZdI8HkqWuxTPcs+Jm+pilDItsa1J5GlJYuDNLBn0f8+fbmaTwdRFhZ0g1E72vK6M
         ar6msSzJo1Sk9M9tCL1UoIPxSVPANT9E0ZdybQ6dNfnZCm5dtdoDGWCRtmJvbZYk+t3B
         +RU+c6dfmYflYOT3i8lfYovtvmK3YyEUbQ/1qMKxek6rfzSyIcZJ/CGAdPHBvaF11+1i
         LqiJ6PnmoDp+MP20d9JjOThkVjpiXMAnBBgj2Y94vzUV3Arh1Po4NS6mY4+mo4q5urje
         TnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409986; x=1760014786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LLs6LdoMNjN6EobDvPqcVmhwEyfT1Rj3zkS3grlLOk=;
        b=bhORuwVu+AY7XYAiYExqioZRN/WPbTYKxkrVwC6Da0Ibu/++qMOgaUBZq8hnbg/FJZ
         wX2r1tGvz6zHqZcJuc2hXfR601ZU97NYRR5i45meD7bjwKnCP7w+LmSWFsY4z2SCBcbw
         K99yByTbuym9V2Ad5Zf7jVcf8bTf8vpdEO4YiI1tcbs/LwYBCG672pYal8J+CJolzOjp
         BMfXvVymh03Dmk9pKeYggXFLtfRN6DohttWOYi0LR9+exgCYbYixhx6Ah//hFAGMNsru
         02LaOP6CPjbTOBo05GZyv7qTQ8W2rhmOisLf1H/O6cr5TrGLqxQ3lX3WnguciH+FeztT
         EsJA==
X-Gm-Message-State: AOJu0YwYLE2L43/x4/fiIM2wX6MAKnj2bSxRTM6iN0qSKZ1HSefUTxS1
	plwG1Ytm+Ld0/hYN7f719lUoxBDH0SA7zc+fPXIktOinkKhq82ffeLh9uSi7Ow==
X-Gm-Gg: ASbGncutP9T9xwWSr+gb4NnebRRAvZCtp6067I9s+yS6KYBQ+w0bH1qWID6nvjnGo0t
	6PxekWaupoHrorIR/K5dnf3GkVOw+waPBeM/KWB6vBn67zWjXGLMu+eQITtnX5dtyStr+qIcQkV
	bF/re0z+vkwDW+CkaDZtgk8xBhc518heQ+dwRzq7UR+h/nIBUsOHeGibYWQSdObgxLpk3w5StyB
	4HOyQ+bLX12nWx8ZgFbvlKsluUL/Z0WyTwIT09zH/ZjHc3w8e8JE1sfQYHdIzTYAcvp1vAXXdRh
	LWfLx7b9sq9ZYPhCv+4HZRZbPA1fo2mTtszdNeM2K5gPkj0vRBOk2fBupuQy7M9vcdMB2kYuXYp
	l+r7W5uacSdBlMCN1vPuN/DbbR1B28D5AYvXCQqKdQJuqM6KiXX7g+pU=
X-Google-Smtp-Source: AGHT+IHRvSTkL15Vwqjxkd3kT7AY6msRfUWKiopXKMZ284A8f8bQPhph3QXliW2oc0fky2BZmyhCkQ==
X-Received: by 2002:a17:906:6a0c:b0:b41:8ad3:1b5c with SMTP id a640c23a62f3a-b485a069197mr456911366b.13.1759409986396;
        Thu, 02 Oct 2025 05:59:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 25/26] python3-send2trash: add missing run-time dependencies
Date: Thu,  2 Oct 2025 14:59:25 +0200
Message-ID: <20251002125926.2624522-26-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120194

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e7430b5874ae68c02a4cc0ecdbe76b62446c67c6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-extended/send2trash/python3-send2trash_1.8.0.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
index 963351a2e2..d8f23c1c79 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
@@ -7,3 +7,5 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "d2c24762fd3759860a0aff155e45871447ea58d2be6bdd39b5c8f966a0c99c2d"
 
 PYPI_PACKAGE = "Send2Trash"
+
+RDEPENDS:${PN} += "${PYTHON_PN}-datetime"

