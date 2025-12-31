Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A48EE57DF
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81882.1767167698696623441
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dGjoy7Az;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so56998505e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167697; x=1767772497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIhTlwIoB5Vw8NMyYHCrm9289siVXj3ta9Tfae4ThrI=;
        b=dGjoy7AzJw6c3uQtLsmEStAXgxc1/r9ci3PzOFyIgUM+fQOEC99FPjfdYjjkwBBDCI
         +Bl57ecwONPVFB0DM6xY5R7jcY5v5nn8IdRTWQvqtDYSWBDVuMy7gmVr9+zGfVBPHweD
         I3SSPVfs7hP8mqsVjSC/3D/AOj1r2JW5v57KhXqiznFyqEZKXkW0/WQU5sIXAo68l0FS
         6cNaaO5yNOX9s4wTY2/6KXut2yb+0rmL1LitG7oWOJxTPnCb7oeWA2E7Ojid282xqje3
         AKPnmFnWc0HCT1Sg0z5ZINnjHQ+RsvY3YBXhYGgEjvF31r4XoPAepYnhRURFlraNoIVW
         3aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167697; x=1767772497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VIhTlwIoB5Vw8NMyYHCrm9289siVXj3ta9Tfae4ThrI=;
        b=EljG1A363g90rgNC28L0kZqVO2JQ7sdzrTk1CE6rpE8qsnprP0XBndZDNbVugTYUAW
         v99IVaG/AAobE0JewZs0iNvxz/0OErUzVTnTls7i6e95AwXDyP5E6xvvQqeoucTz+EJ7
         0FMnZJ6zZ2wZiBxwDJZg0bakYrtT91DiErKJLmNyMXs8WpvzLkfp5tPKF0AWIh6xigQ3
         pZ5L09BvQ39pbQjXjA//9+8wYnqrESre7rylsh4HCyGtgCyTgkUF7vucHUUQqBlb+4AG
         OnByM4kDiOxHtWhc54nBSl4jgZENmSPAVy9Y5TZd/nIb55dg6g+2dpL/VE9QsaJAt1xw
         xBXA==
X-Gm-Message-State: AOJu0YyQYj+BQBHs6Or4ZTLHc1AckVzih26ncAm5uBDsMMJroGBiUp7m
	F1i9KzsovJ+mJfTmaU41bekmNyzp2fxlito5qZlFU8H/14DFnkE4Meu9CjqflQ==
X-Gm-Gg: AY/fxX4F1dxS5kIcgLZ9/EAXUc0GZHPVMcHdqrG37apY3UJjpAghnrOcFCkJbHgcvsh
	xN5gaxI0FB/F7HM9tZwN5oI4UG9Ix6/uMIlCq4RJ312/8lBy2IR5I9P+I5vfl9r5nO23UrOBnHy
	tU9ug4CKggBHVlB6qoQ3I7oOShE5P6rQUaGpa6vh8VCdcq7Y2Lyx9HrdGCTOMMxd43Vj+VAfmHb
	Ch8kkkURLdCzmli11/55E+X12ehCAE2pFJQipkefaHwDS5LUKsftlv644JeCmspetWYvnVGMmO2
	TveqTtwiZX3JzH57qDGn7BrUzDuMG0rHg+UJx62qbrDFoprDX7v1beZka6MLDTlyBl2P9g2bIRH
	9596J92hwbUZN2g552g7xABKygXtuK8GVF9Mdme7cKdIKlC5AKbbyjI4K+1F2XeWHsKidNECTNo
	STxBmxgtar
X-Google-Smtp-Source: AGHT+IFysruoAicK/Mg3js1QMU3fnXPslTmCEgocO46Yoam/WWHkN7MBh5kzQmss6B41o0YRgAKfuw==
X-Received: by 2002:a05:600c:818f:b0:477:a0dd:b2af with SMTP id 5b1f17b1804b1-47d195920damr432917765e9.33.1767167696941;
        Tue, 30 Dec 2025 23:54:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 27/34] python3-starlette: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:29 +0100
Message-ID: <20251231075436.771395-27-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123067

The relevant CVE entries are tracked with encode:starlette CPE, and
the default python:starlette CPE doesn't match relevant entries.
Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%starlette%';
CVE-2023-29159|encode|starlette|0.13.5|>=|0.27.0|<
CVE-2023-30798|encode|starlette|||0.25.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb
index 9b9adca6fc..682ec89b89 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "a2a17b22203254bcbc2e1f926d2d55f3f9497f769416b3190768befe59
 inherit pypi python_hatchling ptest
 
 PYPI_PACKAGE = "starlette"
+CVE_PRODUCT = "starlette"
 
 SRC_URI += " \
         file://run-ptest \

