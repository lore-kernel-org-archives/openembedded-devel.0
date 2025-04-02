Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E359CC3601F
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:42:56 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.16.1743565370791430291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 20:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YHTFAz5J;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso10074566a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 20:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743565370; x=1744170170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/MDLgv7iwsmPZlvENDiNqrSYO1GuvjfAlpMSaFNZ00=;
        b=YHTFAz5JhD73fDvqq0/juaX2jgAC4H/B7H+MbwTtRBnEhKP0a27Gm1Km69JhZtixfA
         riDrzQPzYrCUglQa7xRIZBEON0TtIhT/pjzwtQUXgU5sjzUSqoq0cCsjbvYklv9uwVvE
         Y1a5gbHtip76Umlo54Pp3WbJIyGd+pYcj6YY8mBXf2V1uOy9dQnqoyM8XAFmoIkkpO6Z
         eFXZJrbhjg/dluSFLYrDPYHrDlQ5YpxPn10sOCCcbQ5ShINBOK018D7x7Dm7JesN1XZs
         RqW31h/3LLLAOodqry4YLdrju7xWexTu3ivXvpeBiXySDSVfuAjayWOKvB3xE6KCZVMz
         E/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743565370; x=1744170170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/MDLgv7iwsmPZlvENDiNqrSYO1GuvjfAlpMSaFNZ00=;
        b=qHTriMjkkUHtS1vAYBzxUX5p3/wOMyWnuEsOA34lnKgCfWkp1YvDLMa45Bap9oymVe
         s3PLgXOS8AC+/Ku72CP8Ajk4kCAcF3cjBFIAwSprXiTiWbwPAn9GRlTwKL5QjuWvZnCN
         CGBuIQb3BTuvQOpLd1iawAR1s9+KynYO+8M5//J+VcOFQZZZg6m8JFpQQT/Tx+yraQbD
         CGdLui9pFF7tkoeIC15syWraxJiKpkreYdoFzzb1l+s8VrPnORNcMA4dAsQ0vtlXjIpd
         q6iPgrFuZyEfyQSRovxUE76kIwmarPtzwWaArgcuAnJUFy+qVkd4ZTlPexVc5HwsflcQ
         LJPw==
X-Gm-Message-State: AOJu0Ywki+P7Yt4G8e4AfHQQ6boOMduLzl8QwWMEXmWHE0iTTBlwZst2
	klAQycFfk0TVDTfWXutdhGzAY2AvKDI3gGMzmzpr0BBzFz14YnJj+bQi2cBs
X-Gm-Gg: ASbGncvdX3vam0iQlm3/y0nLehpqqcLFjl0EBX/yr4EB1M627ps7zVCdofQFwsx4vU0
	HqvNYJ0MqIFWXF/L/SfyBxflMQaGwpLbBIY87FrvVTuO15y5Ah6Grwunkd+5XSFxaLk57eErr6V
	ck5a2MFJYpK7PDquph9bBAiwkvJsRUUnfvN+YPwqAQlJwlbPLwXVuSKOTUrBS/EGzBfQ9OTjqVm
	0U1GpswkoQX8Hwb+NxlWsqRqDDE1odPMmLMUz9lD2xvE3fyCCpMsZ1siWYvwww/dpQF/Z+ptUdJ
	EOlNgspOUeVtZ+wGt9XJr7OjD5T+4VE1cbFJ
X-Google-Smtp-Source: AGHT+IGaoSfwt3QpmWWov4w/nCotWorl+oX5DLFJsHojaR4/SlQmyfkUEPsXJe+fNVcv9MERt11VYQ==
X-Received: by 2002:a17:90b:53c3:b0:305:2d9b:f8d1 with SMTP id 98e67ed59e1d1-30532164b3cmr26480421a91.24.1743565369644;
        Tue, 01 Apr 2025 20:42:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a85b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f93417bsm423010a91.37.2025.04.01.20.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:42:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] deqp-runner: Upgrade to 0.20.3 release
Date: Tue,  1 Apr 2025 20:42:42 -0700
Message-ID: <20250402034246.1488516-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402034246.1488516-1-raj.khem@gmail.com>
References: <20250402034246.1488516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 03:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116493

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{deqp-runner_0.20.2.bb => deqp-runner_0.20.3.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/deqp-runner/{deqp-runner_0.20.2.bb => deqp-runner_0.20.3.bb} (81%)

diff --git a/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.2.bb b/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb
similarity index 81%
rename from meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.2.bb
rename to meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb
index cf1cafa122..0b2bfafc10 100644
--- a/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.2.bb
+++ b/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb
@@ -12,7 +12,6 @@ SRC_URI += " \
     crate://crates.io/deqp-runner/${PV} \
     file://0001-deqp-runner-drop-zstd-support.patch \
 "
-
-SRC_URI[deqp-runner-0.20.2.sha256sum] = "600ea527945ea2d0c5d2987d6adb4d2944731ea95906de2c94eb419148cc398b"
+SRC_URI[deqp-runner-0.20.3.sha256sum] = "2de4b135ed68a7f821deeedebb4084d33058b0307f1f9935e2c960430f7532e8"
 
 require deqp-runner-crates.inc

