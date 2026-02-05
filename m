Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4395E91272
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15342.1770274803191418158
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DI2PDNcr;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4805ef35864so4531185e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274801; x=1770879601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEPHaSmoxb+H3cjYkqBWmCzNfnzI89xNZI7DQinqlF4=;
        b=DI2PDNcrfhQ8XR14z06NoO1YyCTmmOjQZ88ZkfvpT6p96M4PZ0/DuvTKwj+jHeZILK
         MFZY1Mf16Z82e/1ALeKTnAAXV752X7ULjVkNyZ/JoqsazLzjBwtmU41ykuKLZ9w4eu1q
         U1P4IrWQknBZc3LLM+EjCeUqO/JuxQspN4Mnt7oNd7ENpM8ffAPOjDYrh7TEoKN4suvR
         ZY0QBbaDH67EYm4bYy39RHSkry7i0YrYCARN1pMuMaYBWKUyeP82U2q34RnQWcMFophO
         1rXORbxi7R/02h6wnQ5avUFzzg2LMorXFRTobun/pGkM8WWEOOIlsCIi8VZgiAt5AiRM
         A0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274801; x=1770879601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fEPHaSmoxb+H3cjYkqBWmCzNfnzI89xNZI7DQinqlF4=;
        b=fLCzjGES30KWk7GxrByOWwkQfIH/m0+QI7h6rwpezpaD/7Ako9f8xIWmzfxJJTWXOo
         UR9ohwJBw4vnGNJ8sjG35UjOTUkh4cPYe32eGgKzljv8rvz3VevWLK8tA0B9NYCKqvGm
         vlPYkZAYdC9G/9k8oyUQ7R8lgJB0hHt6sHu637mo7rNS8bb29B28uvPvVZy4SaJWwL6d
         e6pWM1rigIkPh1jUfqGIwDQBe0gWYS5ScgCZja2tLE9Pkc9pmZmWKE+JyHCb2GvkY0m3
         af2/UNpeKHc3cEnhHnGzQSv8spF86doY9BqYQqQuUB2nn57J94zeDOZn9pXTbnTzxyGa
         lVSQ==
X-Gm-Message-State: AOJu0YzS/NZVikw/sxGFcLdYwdocCNrRt8eE4LTYMh/VmGJ1soKMKca8
	nUD7sjP2swkLSADxCrr1rlKlM6l67jwQmvH7PH4HBU5I+W759Usg+gRTLR9OWw==
X-Gm-Gg: AZuq6aJVyle45Y+0MV/PKM7DINslD47YzxqMjwLxSTMHLbCU1ztuxjW3rp3UhLMmeJ0
	fr3UJHlbEjbSaNTb3Eu3oiylIWr2p+6INe3d62ydOZpjZV1Lkbo7yUkKYQJsX7ZW+c5YQ+0koMN
	ZS3yB5nVt7Y+rsO1x4/VgKmE1DbDf32+GrkzotNpNl4/hu/QpfRtk1nVu92GhMk/Yjzgl/e9E5s
	errMqASnIiJ9mycQd7g5kpfR2W6gAXsTKC/G3Sw9v9ox9Mj0i/FE4dceTIgX5GHu/wTNyFnHKMh
	6AQGtglhpgOOvFXkRzoyrHCtZ7ydneFK3SA8TlEBysBFlNtNpcg6pPHiVmpIYizpUAu/eI9qbvn
	/xaQRGjMZHjBZUtw1XXdF9WzJiiYhwoJGx2Qb+vZE/W1GVHdtzn7Bt7qKK+72guN+fSbMi3dz//
	hdGCse/ecf
X-Received: by 2002:a05:600c:19cf:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-4830e93eab1mr58067515e9.2.1770274801372;
        Wed, 04 Feb 2026 23:00:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 07/20] python3-marshmallow: upgrade 4.1.0 -> 4.1.1
Date: Thu,  5 Feb 2026 07:59:42 +0100
Message-ID: <20260205065955.1267785-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124183

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fix:
  Ensure URL validator is case-insensitive when using custom schemes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 39335015913a8bcc1b40fb7318334f626a9b8285)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ython3-marshmallow_4.1.0.bb => python3-marshmallow_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.1.0.bb => python3-marshmallow_4.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
index d1cd21d52c..2919897dc3 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "daa9862f74e2f7864980d25c29b4ea72944cde48aa17537e3bd5797a4ae62d71"
+SRC_URI[sha256sum] = "550aa14b619072f0a8d8184911b3f1021c5c32587fb27318ddf81ce0d0029c9d"
 
 inherit python_flit_core pypi ptest-python-pytest
 

