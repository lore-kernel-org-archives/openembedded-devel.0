Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4A5EE57F1
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81805.1767167688302592104
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kcpqgGCl;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477563e28a3so64658155e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167687; x=1767772487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2Bt7MiJ3Kot1olTl2f0A8HbTRHMeU6isyVN891o18o=;
        b=kcpqgGClV2E9MExGB09CYwlPktRdIOk/1TjntHY1sk7XTopTI6wpSJX/MfNeoKZjS9
         P28tNkFNrRfY9jSWYqV1jQsCI0hwWGF6AgFu5Tc6qA6nQcJS4hEbtyqmtnlnF3fB9uIM
         KJCZXenRyarscH0wwj8tQWSQl7Hs1EaymejYpUvmo0nzXpOMw7a3RIf82ZLrF28gNC45
         ZAKlJm1FqWFWfEj0w75LXXmU8rkwvi30krPF6FBDGk67T2vmnXOnEVyySTYyXJH8s94a
         9VTG74oLIBRQ5vt74yUQcoSDtM/n+UseG3oFf1Gjr5XeNJPQpYk+PX4BQFkalM6YPAlp
         a65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167687; x=1767772487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2Bt7MiJ3Kot1olTl2f0A8HbTRHMeU6isyVN891o18o=;
        b=Y7o3Kg5TV7UTjmpWvD8SEganddgZI6VYQf3yVcqu6o6kL+E5Rz7qmTst39nRk0YvXc
         5yMwn2kaudkZAbr9LjMEf262+vBe31ga4kL4fAY0nExkQfFaYn4nI20au6g3rNqI0Yit
         6ON96L+amcftAZz9uVlNyAipGjbY9jzWmFZi0taUKyzaq84rHuKXte2oYUTBpI+p/v8F
         hYqEQ2QB+vchVKzHn9oCkiK/T6uUGbHfAPxxYPfd7YVdsFRtZ31CRA5sTX2MuFbb2wFn
         uyLBioQwbRDQ+ViTVxxNyrbfqZW+5y3nlW81/atVy8+eHzX8kZC6jr3bpm21PHppjkFO
         cJog==
X-Gm-Message-State: AOJu0Yym8tEbGS2Ri1AN9ukIAqHKhymyQ9Kt2N1nXEWZUpIIKrgKapTh
	LOIBhWlOIT5x7bjpCAHNA6cSa2dUCLBQgnaNIwdR3pXw7D68gWd8dX6lxY0h9g==
X-Gm-Gg: AY/fxX7GmugbOYgvr/9U3AePL0jgF8+/6VTDJAVTkx6wm3jEocXsMXxai9oBiYEeGKv
	3rj1oXPfr1Qqjl0AZxS9x0FXxDGB9IOqaoWGDti72ck84eRvPrBRYaQKs8/48Wc42/C/+GCnS7O
	ojf98ezAoJk8jeD4IVAn+MV4OZTAY0r/2haD/xQE3vwmKjvI7mlGSdd3XnrXQJ9OBdQY/mJEvBV
	t7aeeOTeEixH1yA9+ilC0RLvbtszk0G3ctUkumLmdcY3tSEmPrtEiDQobJdDwPSGQFu+59VAmiK
	28VylrHRnDLLb+rP6LTKJFCr7Wms9Ok2H9gvtv23mdm6fVpMmlfci3XZfpIRYt6wYuQV0LY2FNY
	SYpbDiLT6uZQ54Mc3ujn7vmcYQSWZwUKPjP+bJ0RPi0V8Y62pawnWwOgbZO1mDPoZCXiRgIA11k
	8i3fVc+5V8
X-Google-Smtp-Source: AGHT+IGDtM+wYoUn55/mLlByddIAKTBpadw4w+HSj7w9TrT/wRP3yWcLS9NsHWwnss6J5kHySwr/ZA==
X-Received: by 2002:a05:600c:5489:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47d18bd5651mr433998325e9.11.1767167686589;
        Tue, 30 Dec 2025 23:54:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 14/34] python3-fastapi: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:16 +0100
Message-ID: <20251231075436.771395-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123054

Set correct CVE_PRODUCT - the default (python:fastapi) is not the one
that is used to track CVEs.

See CVE db query (n8n vendor is not relevant):
sqlite> select * from products where product like 'fastapi';
CVE-2021-32677|tiangolo|fastapi|||0.65.2|<|0
CVE-2025-55526|n8n|fastapi|0.115.14|=|||0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb
index bfcdaa41ab..63f762f220 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "0e9422e8d6b797515f33f500309f6e1c98ee4e85563ba0f2debb282df6
 
 SRC_URI += "file://run-ptest"
 
+CVE_PRODUCT = "tiangolo:fastapi"
+
 inherit pypi python_pdm ptest-python-pytest
 
 PACKAGECONFIG ?= ""

