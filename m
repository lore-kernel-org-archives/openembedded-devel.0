Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE88C0218D
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 10:06:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.14236.1738058760680899682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 02:06:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aKIBeE5E;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so62220215e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 02:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738058759; x=1738663559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jOjwKs1utIgmdnMlbm6PoCqhgF4eXBnpsQhrD5MFCLQ=;
        b=aKIBeE5EBcalGnHy0dD0miz3TYz48yVPM8JDcG1Ycrq2mb9uC0H8SuVU/AA/7cO3Fd
         7olpsIDfyXjshWEeRrD5/ysobl8Cn51fXP1qpIbNeFmgaroKfv7lzroRj7fQSJwFNaod
         I5XndWT6XbOMkHMLfP2SDrg55K1qbU7NBgk+E4jQJAPd463CY2YfWX/DWzJgi/hf4Aul
         z5Ep1lM1m5PvWahW9PS+PGahfl9cPnxsvdPRe7apnorUAnuj1WXceDMzNUh3l9sdjVEF
         /ufHwnJJnhMD5Y6CNNWlXNzrcLLyX9vFYcaF13B/HQw67a7+wDIc2HXhGVzIFaGvRtPA
         7vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738058759; x=1738663559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOjwKs1utIgmdnMlbm6PoCqhgF4eXBnpsQhrD5MFCLQ=;
        b=EfD6zys4mBopxcXHajZQEUPeUpydLgsq8U3F3w2ZmQ9u4xFHRjvqYlXLO9qGN2/xIb
         QsDDIobZdEISbOjYWf5s+JoXq5Jd4nqNE/g+16bvHbQZf9/2KXN8Tva51FJObqHIAdz6
         kkdAxZJZEs/nlkHKb/1GgTvSS+MxCkkj9sU3seIVMKwNa9btEQst9VRncECQazFK0Us0
         dGti72xRKUB0xfP6/1+oEwJVVWUsxb0HJ95k+EuNPDqGgiMCbZqVHg7g8Ri6tCd5M4rO
         LiSrE+EGs+FRPUlNzLUFYCzdoHMzI0LmZ/yPbSDENE756RXI0tcHROEmbrtm6Ca/ypzv
         MRTw==
X-Gm-Message-State: AOJu0Yzkzkh9DRjMNxIoKnsJSshaLCgkEQ94xF7D/nvzODqr/g6aQssT
	bDB15nWXFZ4CGmpzQc27agtC/QJxJMjryao7mWH8Sde6J64Crt0TWXiuverJ
X-Gm-Gg: ASbGncuIDUbTbGRxMjskVmjYUvXXIX5O4cSNHdkojWlU/QI9rSZB0gGvpd5YUdDMFRl
	eh4t+lCbbEIpJUhDuGK3NjcHV+TQHJlZS9/fDSpQmq93+tJusfCtErR4+LVjzPl0SW2JHLpao1m
	W8BHL+n9PexLMVB/6rmoaJ6V41gAviYhFI2d8AYZIwylBo7zkqcpColxYPPFogUmnMyJm30m7+9
	RUk+yrt/CZC/YV1DLhgAoYMWFVwMwHLqrU5faqIVrCzf4V0SdajGSYMoEyX5S3Au/cRupIbDieq
	t93iX5OUORprHx6CXpQn8iT7xOJed2A=
X-Google-Smtp-Source: AGHT+IGP3/zpLPOz/p2bVml8k7p9UJzGPAVkaJJYXNlMpvHoL2ToZOgy6ZNiDNkb0c2D8cmyJLSPVQ==
X-Received: by 2002:a05:600c:46cb:b0:436:1b96:7072 with SMTP id 5b1f17b1804b1-438913bebe7mr405047355e9.5.1738058758627;
        Tue, 28 Jan 2025 02:05:58 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f269sm166040335e9.8.2025.01.28.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 02:05:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-python][PATCH] python3-pydantic-core: remove not needed INSANE_SKIP
Date: Tue, 28 Jan 2025 11:05:56 +0100
Message-ID: <20250128100556.3125022-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 10:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115116

The current version of the recipe passes the "buildpaths"
QA check, it is not needed to skip it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-pydantic-core_2.27.2.bb      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
index 5dd76f99f..063730372 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
@@ -25,7 +25,6 @@ RDEPENDS:${PN} += " \
 "
 
 INSANE_SKIP:${PN} = "already-stripped"
-INSANE_SKIP:${PN} += "buildpaths"
 
 # python3-misc is for Lib/timeit.py which is not split out elsewhere
 RDEPENDS:${PN}-ptest += "\

