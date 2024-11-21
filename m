Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997C9D75BA2
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 02:08:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.1562.1732154916325257135
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 18:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MU/OJgIW;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-72483f6e2fbso371357b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 18:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154915; x=1732759715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FInHWBa4THYTp4Wb2kyXMzzqt6fgfyg0nwvtE4Lf8c=;
        b=MU/OJgIW8vvLDqUMwmVA/cNO1XAIiP0Hj2YMV/ByZyeoU66uSNFZdz7Vu5vs9OWGgH
         dDeuX3pzqq+b905OevsdY2nCsYgdotqnblCDGKyakOoMiQgb+61DCX6cGV/ITtk25OOq
         /o9pleUr2840cigVrbtNIu+/LP7RViiG/hmmo5tT/GYa/QAs1QxWobuWR4B8jc50gH4w
         T7tNrSHmyMiMhRLn9r7TudHrJj9Mt02CqMwS1FnRfvlc39+olDiXMAQhPLizNz7FioJ7
         1x4kMCYBQAP7aFCSZBSghnV6I2RmkCruV2gwKIeYtPr3PDLbm0wZECChsQXAyVcytDIz
         s4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154915; x=1732759715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FInHWBa4THYTp4Wb2kyXMzzqt6fgfyg0nwvtE4Lf8c=;
        b=ExoqTRjE6oPMrB3+kdhJGnlvcI2dwUtctG13PdamG0hfR+Z5J72+QyRfIMyu/2f7/Q
         II2dsgRnteZTV9srxD8hpYwPnP++fGB3EsXtUwYzv9tUVB/vaUvaIa1UW/pTf1pqpZlJ
         9EuFRWKJ57i0nSEpGAV3dhTk0rzwgiOMQWGvx9XruvUnD43E627/Vz04sseEI3I3+50r
         vHJGa+7rtW7zG1BETJmIjwbSZJhI6wsYHSneVIgPosNJFzv37yg50wQ3ETx92sSYUZs2
         5rBfpRCC1Ct78Xh1ryMwZCYJmu/dIZn6tndqB8lms/LWH7giAiHMMLw0vQdH+KpjB787
         O5Tg==
X-Gm-Message-State: AOJu0Yxf1oIkbUDeMKE1FcDLN/ljazjXfHF/ZJ+sj9Opze47ryBKqfqz
	QX9xUTLW6X024cc1dLgI2Vin0gZxtyxAHtB9UDQwFfqfClrUduTAXSVrBg==
X-Google-Smtp-Source: AGHT+IG+VcrD7tknzAlcKwk6i2LKmxVJE+IbywFn7ToXRPzL6Lf1eNjnUZ95CJeivmgAWEhHKd+2bw==
X-Received: by 2002:a05:6a00:8d5:b0:724:60bd:e861 with SMTP id d2e1a72fcca58-724bed15f31mr6462828b3a.18.1732154915533;
        Wed, 20 Nov 2024 18:08:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beef75e1sm2397550b3a.41.2024.11.20.18.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:08:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/5] python3-flask: Adjust runtime dependencies
Date: Wed, 20 Nov 2024 18:08:29 -0800
Message-ID: <20241121020831.884684-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121020831.884684-1-raj.khem@gmail.com>
References: <20241121020831.884684-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 02:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113947

Drop python3-profile, its not needed anymore
add python3-importlib-metadata and python3-asgiref for ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask_3.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
index f1b18b075c..dd2795bd7d 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
@@ -22,13 +22,14 @@ CLEANBROKEN = "1"
 RDEPENDS:${PN} = " \
     python3-blinker \
     python3-click \
+    python3-importlib-metadata \
     python3-itsdangerous \
     python3-jinja2 \
-    python3-profile \
     python3-werkzeug \
 "
 
 RDEPENDS:${PN}-ptest += "\
+    python3-asgiref \
     python3-pytest \
     python3-unittest-automake-output \
 "

