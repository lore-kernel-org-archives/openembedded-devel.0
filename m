Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93E5CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 04:22:49 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.8083.1760502161514566374
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 21:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GYjNIsY3;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso5853812b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760502160; x=1761106960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQZWf3SuXtNEAKNnu+HzTaWCfMfnix7X+LmIcMhSZu4=;
        b=GYjNIsY34ClRu1RcZhiKWTB+uHlVxApj9ux567xwiNvO9p6efonG6gDqZRp6t0k8Lm
         ezc7FY8zTsk+Hz1omkj7WNEldA8BsycBfAx9iCGwPBoLZSH+2fHiYVNbDLIPHPj8lhGS
         Sq7xugGvf68gQ9103qo9lgkLKj6zQWgEZaTgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760502160; x=1761106960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQZWf3SuXtNEAKNnu+HzTaWCfMfnix7X+LmIcMhSZu4=;
        b=GtUozVeQnIQImXtLMyFCDtYUe7EZXGY4HF8n3oozhb7cJYq6+C9z2YFQOYxTG3+pe7
         z71mozbNST1aWe68aEYLpD/mbRrEzqGaMjqFaW0s13VH5lyHch18EwPWqHqjj5HkbAYN
         /Tq3Q+vPxlyqvCc2TTgzkobghaiOVLbP8TkJL+ToyrfLPc9FQcZ9A8n3e+zZRV+i7L6e
         2Ym8gZDU2xaq/C0mdNAqMc6VqY1Sd9DH2BsK8LTR4tm0rLgnVgRHi9fBDQAOEzGH5NPJ
         wkX8oM6epf6W+kjzhQt5acWQHNW4b5pUXnxgh5pG4RsSBaWXJCSr47Qwt/Bnm/Enaq6D
         i5tQ==
X-Gm-Message-State: AOJu0YwJr4VNZ7/31ohbipSyeOsAUlVQJ73P9086V3uKamvnkGqYQTI3
	ppIaRNmk3Oi2Xmzgcvzri+V1rICBK2A5By+UmOBwxJ42PecHULUQZHfn9wAbm68CTKWpxcI5q6z
	0pQ3ONoU=
X-Gm-Gg: ASbGnctSA1A5GYGcFZBv2FKWBnYw3pGWk8ZgRcJidMlPDCL/pMqv7cecufedJIQNwZZ
	4Tebk8Nt3wRGPvYSCpl0nmOaybxKvpGxIntsclW6R6dxujVOPc0is0dSkRE2oDQzxXdoEKSTAHm
	KKy0gpbPdBS6PSKpdnx/CGEt+KM9vYY1XIN4NWFZ3wao96JHz9oePnYL565e5zCRqJ5nYSpIaTh
	A9g2nfsFDHVZkWOEPqV/isGU0NIWaIIdFZyaqeOaJOT+w4i0BqQx54dM+zXCLKsgiq3FmZ7bopv
	nyjNVT+iLEu8G5YtCHz7fQpjrE3mirJOSkDVTTOARxUcxbOhICChS1oE/tdTzNJMnG73tijotsI
	bZV9C/HCMT4rsxGaalW+c6HgyhH/RXyvAHio0qJaSQgmESGqNHjV8wVFV
X-Google-Smtp-Source: AGHT+IFUJq6I5KkjotGuoPWj/3jmlL0vlyzsLmYmvjbOkOVjuuzdD9nA+P9+1kaEUCV5ff5vjbUyWA==
X-Received: by 2002:a05:6a20:3954:b0:262:1611:6528 with SMTP id adf61e73a8af0-32da83db499mr35592705637.29.1760502160517;
        Tue, 14 Oct 2025 21:22:40 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:3282:6d6c:6f79:5d45:48d:1d79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060c4esm17067760b3a.14.2025.10.14.21.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:22:39 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/3] redis: upgrade 6.2.16 -> 6.2.18
Date: Wed, 15 Oct 2025 09:52:21 +0530
Message-Id: <20251015042222.121285-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015042222.121285-1-vanusuri@mvista.com>
References: <20251015042222.121285-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 04:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120684

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog:
https://github.com/redis/redis/releases/tag/6.2.17
https://github.com/redis/redis/releases/tag/6.2.18

Security fixes
==============
* (CVE-2024-46981) Lua script commands may lead to remote code execution
* (CVE-2025-21605) An unauthenticated client can cause an unlimited growth of output buffers

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e970ff8bffe95c9de02d866e31e754c43f47f240)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../recipes-extended/redis/{redis_6.2.16.bb => redis_6.2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.16.bb => redis_6.2.18.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.16.bb b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.16.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.18.bb
index b5d53a2370..a5938b641a 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.16.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
 
-SRC_URI[sha256sum] = "846bff83c26d827d49f8cc8114ea9d1e72eea1169f7de36b8135ea2cec104e7d"
+SRC_URI[sha256sum] = "470c75bac73d7390be4dd66479c6f29e86371c5d380ce0c7efb4ba2bbda3612d"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


