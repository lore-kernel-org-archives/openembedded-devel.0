Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5992AFCEEBD
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:16:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53447.1772046995173642724
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 11:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ynep7xGH;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48374014a77so913255e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 11:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772046993; x=1772651793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxYT+CPNv+FgvRxN4+40Gnvg9d6I/whguz5vqFhAY6c=;
        b=Ynep7xGH4Twmr4YJucJG+hGLaInOO2MUYYPXwQjScCSdrN7bM8wZmy0gLcOqGQV5NO
         lpTzmHIaCJaW8sfaB0GEq1XZvcjC7JEvHercN+wX4qilf69zNnTwSkaeKJfQozHIc24r
         RAMRISqSvlD2j7pQ/9tsYX/2zoTEPEbl1ZAgDShdjOSXvXenrbyLqQbwFE28b28Fmxt4
         kjRpXiQrTiYtTydmvUOh+6RhzEVuAhVoTsPLnjbCL1edWi695QxsrJIQP6mNxQPFedS6
         kzQzBBmY+v8dTa6zl5w+d8kmFthq5/k3dOQUVpRZmCb25CS3dVJW0VBcox5GKG8QaT5e
         bPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046993; x=1772651793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxYT+CPNv+FgvRxN4+40Gnvg9d6I/whguz5vqFhAY6c=;
        b=BgpW9pNb37OlrHJvvA+WJHKc1736K9PXKitcuvLBG0bEvHWYBDCY01BBd19EKyNg6n
         TtOtTHTJQebyRSYYffwHRMiozV+ZahcYtKsCGFC0HqKbs68tIu7mU0HhAzLqvIraWPxR
         q9peH7Tpjb7GxBSck4ifjnhlgnlQxrmGnEEka8PdUz2WBC03PgLNwfkW5QMiq3qVg9RJ
         P3o/zXEMrilHvBGffmWhy4rOnvNhCt4XTymKP534+kbzKFH4WwVAFcyCUwZLPkIcay6T
         nKZ4AeEMCkj6rD3qBMf8BRGo6rXT3/3Kei/dcNp9ODSwSQMu5CEB4m/7J39Kp3SGNehx
         uOBA==
X-Gm-Message-State: AOJu0Yxmc//MbDRtWkckd9e1lCS4lFIr7jQKoq5CKNvR5TJ3pw/7v/FI
	aMKKIWxn2UkvTG3dCD8A63/T3O8U+VRS30I/MDAlwVkGr8SF1d+Fit36SL/0Wg==
X-Gm-Gg: ATEYQzygUeYhkBfT4kYmpY5u6Vs9J6eMFXqEh0gmG9yRAw3i/L614nluA27OcFO4901
	uaOtF4zPI6/cJDPArRjeiXoQRY9edZgGCk4IPfVeaQmtHhJxLBl2obQ/HhhJpFP9zgSTOHRB6Uv
	fFQUV2drOssuQWJm4ED+oeIurOnCsHfw27aqhm3zzsMY0azO4dAtIj/TLWK80mRqCg+N2zKfCUS
	2vulVmEY3XRA6E2IvWR3LZR/DQftvNZUjQ7SaPIIR8ErdQ4D+H58rcaj6P0m0viaEWWEc0vl7N+
	ex2eEz0t9RnydksMzGug3Y+2hXuAYlZUCRU3cjb3GxJ7/yN7eLF6mWIJQN9hZ7Y9Keo1yUboB+i
	71ikohis9GT81RKUY8o58/CDx32AzaiXS0THFmbri4ZqDGGxLreDD8qY6P/Zr6kFd6C+eGNSeJw
	xf68Y/hMEpU2C8rQUS3WYf
X-Received: by 2002:a05:600c:3e05:b0:483:6fc6:1e20 with SMTP id 5b1f17b1804b1-483a95b5410mr289275035e9.9.1772046993450;
        Wed, 25 Feb 2026 11:16:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb296bfsm23804925e9.0.2026.02.25.11.16.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:16:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 1/2] packagegroups: fix foldername
Date: Wed, 25 Feb 2026 20:16:31 +0100
Message-ID: <20260225191632.648394-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 19:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124659

The correct folder name is "packagegroups", not "packageconfigs".

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../packagegroup-meta-filesystems.bb                              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-filesystems/recipes-filesystems/{packageconfigs => packagegroups}/packagegroup-meta-filesystems.bb (100%)

diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packagegroups/packagegroup-meta-filesystems.bb
similarity index 100%
rename from meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
rename to meta-filesystems/recipes-filesystems/packagegroups/packagegroup-meta-filesystems.bb

