Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ADECD5BB1
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 22:36:50 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5840.1779402998723523580
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 15:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W92BLOd9;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso3070056b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 15:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779402998; x=1780007798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ghokli6jQNHPsykbcZCHNXJw+uoauktIAxIkEBQYlaE=;
        b=W92BLOd9XRHdfn+lCVlkJJWRBUTeLyo48+i6vJePuPY8peXFfl+RWyipGRgWVzP+KY
         3N51vDcWTqc2N4RGzz8grclonVwPVWZEWdJBV6MVuXFVxqO2v6PQbR1q3rcvFRMtC8MG
         rivy+0xWO6CIbVykRbNbUZH/0Us2cN+0fFy3XY+Gva/QN3y8LYadhsFXgC3L5/LTA9ok
         Qhig+ZL+iLoPNavjHkdFa/SeiMROYg8pVHku+cVDmofYMCqnQLo7nD7A20Q8oVlCB7N4
         spEj/pA5rxnDukljNoaiR5E8urntLHs7s5WbHquGATx/RBwH4WVjE/1nSf9xTrf2LY0a
         /Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779402998; x=1780007798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ghokli6jQNHPsykbcZCHNXJw+uoauktIAxIkEBQYlaE=;
        b=JXcqSiRTi4KMfAzT4kxuYlqt2vM1LXfVP7ef9jfGAMWNVuGcIZJcPTaNJR/Hsph972
         psLGT00hgHc3fev+eXznqBHpMdKcWoD4VLq4BWpaf6Avx7grHSqZLwKydd/HG7xCWTnz
         2MPl8npTdovSqAL9z1PPAwXzjzzk8q+rTqUmDS/OUFM9iFJMeePk0NUlHGyldWBEF1yO
         RoguUSULxok4iaX3/4r0GZFnF+0+xMJfnUe/+wZbVsJ2z708cji+b2AcrFhlzwvIkmo/
         mf/TzGYuSphOvF8wXuMGyrYU7nQCxB3amWad5RZUVKUZQXpR3y1MbYJRwvFEvg0HA8u5
         EpcQ==
X-Gm-Message-State: AOJu0YwT0kBBKjmikw4w/2YHvlV+QS5DDCwNLhE/xFFHdU7H3h2QjcK3
	plOHVOqNZKbqjxpJ9oKMY+rG4j3d36/hsC/fscF1DoOjg7+x4BQJwb1/rBtxxqAp
X-Gm-Gg: Acq92OHc223aVeqzmH1pL/reOUSNDMdM8mz2OHr0ypxuatlKLhtG72fHkodQDdkhLbk
	Z+PND54MVH/vf85M3oCExueRucNzWtsmGeHw6FFrw93mJKi3KfQy+dOJacXEqgANtd4EAPBwaFF
	HTkTVVCHpXhjWR7GK7ejenX+KPx/bQQhe5rDvzukQo0qW0cxGHkUdU6lg8OZMsggzcXKbezMdoQ
	Bh1LXULzt1OmupkoyYB7DvkFv038x2esbzGXdhNXckfbUIDNIPGl611wxlY8/cYUYaCgZnFE4Bo
	4wIUmAJslhKBEiNPJysYRC7Zjc6Y3kpDxkL5SBQoGt9vaxc96o0BvH8ltw1QTnol8AlHy2eVZpo
	6p5b8c0SSeGTvD0TVJ7c9RbZunZ5m7wGDcfAPepGuTDHX8rRxRihhC2kOCDnpl158N0Myz08v2C
	IujaDng7fzZCV+v4MWV0oCr1ZGoSHel3ef7NVg
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr972320b3a.11.1779402998016;
        Thu, 21 May 2026 15:36:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84162879230sm124505b3a.33.2026.05.21.15.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 15:36:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/5] python3-django: upgrade 6.0.4 -> 6.0.5
Date: Fri, 22 May 2026 10:36:20 +1200
Message-ID: <20260521223623.1335832-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521223623.1335832-1-ankur.tyagi85@gmail.com>
References: <20260521223623.1335832-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 22:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127141

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/6.0.5/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.4.bb => python3-django_6.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.4.bb => python3-django_6.0.5.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.4.bb b/meta-python/recipes-devtools/python/python3-django_6.0.5.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.4.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.5.bb
index 378b760f2c..93bcc7b2e9 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.5.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8cfa2572b3f2768b2e84983cf3c4811877a01edb64e817986ec5d60751c113ac"
+SRC_URI[sha256sum] = "bc6d6872e98a2864c836e42edd644b362db311147dd5aa8d5b82ba7a032f5269"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

