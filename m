Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258DBCFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 18:41:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3042.1764528068778465319
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 10:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4DMpfEd;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so3823988b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 10:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764528068; x=1765132868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGb1CtTYmbrB9Tbhz8haXTuZZ99g0DScJh24EkK9xlY=;
        b=B4DMpfEd+z96RG5W8glynaFKoQfZmEwcQ6Z2azU1WmrKHiCG7XcdnCIb0Rv4BVsUx9
         VWQYIULUo/iTBE9VK6ZkxZivW+pxGuxuzE4P4zP9K+qBzKuf/qzrSvc+O/4enO+G1Qiu
         9jR7/RYj7Zk5LWStl6t8LXvwON0Wz2li2wm87NAGQgiQsNt54Yo40XUtKSpbyhyGK1/e
         mU/96YldkgBdtUeb/SBMCvANpVxrT9HwBSgvQJfS0uU/qqeQih+9CCqFX/MrXclAgPX9
         MpI2DoSoXyAWDk3gMY584oz5Di3qzYeSe6lPVEiJaBsGqq7P3n293gOXNeggiDScyw/N
         zDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764528068; x=1765132868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGb1CtTYmbrB9Tbhz8haXTuZZ99g0DScJh24EkK9xlY=;
        b=Ybht3Pk3hDtKilRb3fOqOOxc8zDTz9nij4tGXhWOkFJVWVxVih+v1FgrN9CnzRqN44
         cJVcY1JGpaNnT4/HBbymgH9iuAcWRChBvB2ZrldziROlE2H2EceatWYkvS96ZArGvEJ7
         l1ZaBkiJGGFwra8ocXVNZh5bQJ5SXwNDR+9rMS4Q/uQlK+bRLrQieU3kKu6d/z8n5RiA
         HUfsmltkzqKbngT4zyE8GHbIUSbVxnd06Lg8GeikKmfnicXrvjex4OWqWz77wY/KSnKv
         JQCYxpzwt87YZdewUsfG8qjbP9JXt0iPc1Ig5IghsgvrxEiu9MS8YycxdmKR1xDEyIMd
         7Ckg==
X-Gm-Message-State: AOJu0YzCbqV5X/9IeWGySZrfLMA7edm8rz9iGTZ/L/OHzT42Nmfccjp9
	8h+0D0UMy60ELGeISbaIwiZnG6V7iYT+Q936EPz5KDVVh9lY9vGXmWCjEmMl+GoB
X-Gm-Gg: ASbGnctGKsLb2nGFmOL/9SE3kWV7gE6zHFQ7esmV8WLwWDKywISL4Sr1T8dKdH4pDMu
	K3ljpT+1kic3ykbSVxcNFY0FQakkRxi1y1k2q7bQpt2OrCneDxEpHohPlLNeXfThiW5t7FUW2SV
	Q/dOb4FQI2kAzogwvtRy2qDagn8gB7Ld5WnrXu+eo+iNYGStqwgn0aTnIIjpfu6p6xLQD4ZmmaC
	ZXp2EuKX8kZuqE+GUlojeOVz8lOPisNQ7p57qn7XMCABkm+XbnuHoRQ8Zsvw/ActJxI0fXZTkO6
	cg3A6t+oO7YDJdd3VMJcoy3XwNyb+br9hyEXwalMG8t0rtNllaD7MDK6UJtDGZ2fXL6mJGM2eE1
	YIIgZUrSfcHaXHsvDpooaTcNxbBiqOdOt+gXzYOTEw3xms2bEPeORpYG5gxPzY0JrlNGi9APRmY
	CNqNYy8stk/bFxejj+QkGoA8yKHJTGv6KQnjVgZSUQr4EKp6sneCeASOttnuBnxJVfqk402lnZw
	HX5vpN90ZljYo4USMylZG8USJ6Kp2Ko
X-Google-Smtp-Source: AGHT+IHTbiuffq5TmSrUGHomlultia7wEQseVKJMSdgdftZ8vCgH/nx6tJBAE25vdyI5pA0pMnp4rw==
X-Received: by 2002:a05:7022:1a86:b0:11b:b179:6e17 with SMTP id a92af1059eb24-11c9d8635b1mr27022266c88.34.1764528067727;
        Sun, 30 Nov 2025 10:41:07 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::821d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm47054835c88.0.2025.11.30.10.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 10:41:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-fastapi: Point to right layer for swagger-ui recipe
Date: Sun, 30 Nov 2025 10:41:05 -0800
Message-ID: <20251130184105.472600-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 18:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122173

meta-xfce -> meta-webserver

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
index a5c9d257b0..02da557663 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://run-ptest"
 inherit pypi python_pdm ptest-python-pytest

 PACKAGECONFIG ?= ""
-# swagger-ui is in meta-xfce that meta-python does not depend upon
+# swagger-ui is in meta-webserver that meta-python does not depend upon
 # Users can still enable it in their distros explicitly but its disabled
 # by default
 PACKAGECONFIG[swagger-ui] = ",,,swagger-ui"

