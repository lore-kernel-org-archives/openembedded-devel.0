Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23707EE57E9
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81887.1767167705169844264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eaMonwC1;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso108776055e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167703; x=1767772503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4GF0QimqlrkO4lMESzaGF74vi3kLN8bqI0Ae4bKoII=;
        b=eaMonwC1gVQwsCGcCPvOFWSiZ6qsp8wRSq0X1ejiHOKrA2NYXdz4gRhbYVlZegES+I
         X2y/JY2dtgLqxtHdG2J1TXddxWUPY65NqTs07p5XIZQOuyQBNRCoEOlaDj9yRBFoiZim
         XCAKBxdILrdLCWXYy1ylbC3Ggpd4oeX9AIXZnEMy4Ko9iryv6ZEfw71ToSfY0wEzwEcV
         UZmRuoRLY6kI5Su/d7vhWbRmyu2+pugeUzXwoXzauIZqch9obLJ9Nv3BNPH7lnCZDHKt
         L8q7TqJYBV6QeQ4HDvfljARzW0XgYjiYX1tMKXyk0+GZK02Zv/JDkFFAeFLGX2vljNix
         xPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167703; x=1767772503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4GF0QimqlrkO4lMESzaGF74vi3kLN8bqI0Ae4bKoII=;
        b=pJziRhdbu4L4lYczgtXGlIa4hQOt6OpVENiozz3sNJTlvBapzmIkQH4sqs9RYOVlxk
         euShxDkGH0iQmjujS4Pvbb7YhlAPSvXiZNn4w+HpeTYkcoomxr4qb8ktwSl2OtkDVROH
         JOLzsTRTSNiEcrepOk4Zd1mEXk13uJDGz2Hi/5xn2GnZq+9aZ+SvyMML8fm9gdTUfBb1
         v4jctTh6Kn+w9NFWOSYei4tOdDxOdFScDFyLqsXGhsT5LkTr//gEDL5tSmX7slBnWqpn
         hdER+/+TfNZs2icLUATj4a6JOSb7RHlDOol8HYbHBNM6cHbIWYA7sYk9icqdF/lqqnQg
         Yy4g==
X-Gm-Message-State: AOJu0YxdvU80Bu0a02fPO2seEkhpQsLhmE6PKuhXhqFmbmBs1OmjGfJ7
	RCu4FD0YvrLVLMLc/P/HQ0LekLX+1tObPalu1nNuoo55IxSi8qv6HpPvikW/9A==
X-Gm-Gg: AY/fxX6CjdE/cRUKTL8ftZLicMhh/hf61+3wZ84iM9RVXgGKbBuFsk4O8ZcuZ6abir4
	TI0EbA4lXrG0efG/tKgN4KA/uPqiIkejHucnapoVUxjHsTJ9WEMMXO3PCjVhD/xGZo1xFaGbjUo
	I188NxA2V8+oQq9Av5gJnICXkERJaTQj1HDTP8xMHw9uDeF3ZJYCOO+LrxB1b512BH42tw3P2Hm
	6Gr3A11NKnzCchrAzuQShu1mA00KsGay22qQW10V/v8i/lf70bsc8VQ1Xhao6O9OaN7B7DTyPu0
	rrywaLLQX9ptmcjR9DOnHi6+gBxOM/uWHaks2RHBI5mAxgl/nLorSSfd9DURoOMYf9yoet39egt
	+AL9Nd6M4hft0tStf5zYxqGm1IAYF4SDyTBWOwI2ttXd0fi8Od+AhabRggqneJQYOH8Pq0UpLOr
	WmHt8ceeoq
X-Google-Smtp-Source: AGHT+IHGBTH3a4cWwkOfmQ17ooABH54G4OU+OYuUNNgaJpsqVxaiOlJYCgkkMWcePDHENREvEZrIgQ==
X-Received: by 2002:a05:600c:3111:b0:477:b642:9dc6 with SMTP id 5b1f17b1804b1-47d195aa79cmr402463275e9.34.1767167703539;
        Tue, 30 Dec 2025 23:55:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.55.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:55:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 33/34] python3-pymongo: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:35 +0100
Message-ID: <20251231075436.771395-33-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123073

The default python:pymongo CPE fails to match related CVE entries, because
they are tracked using mongodb:pymongo CPE. Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%pymongo%';
CVE-2024-5629|mongodb|pymongo|||4.6.3|<|0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb
index 916fd0f1d9..80f07e4425 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.15.5.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI[sha256sum] = "3a8d6bf2610abe0c97c567cf98bf5bba3e90ccc93cc03c9dde75fa11e4267b42"
 
+CVE_PRODUCT = "pymongo"
+
 inherit pypi python_hatchling
 
 PACKAGES =+ "python3-bson"

