Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361A9CD5BB8
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:02 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3072.1779512459699247530
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MwY8ZAQW;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3797282b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512459; x=1780117259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSAeWYcV2CdyHiD7sqvWeyySNB5LM2QcahXx6n4ir6s=;
        b=MwY8ZAQWKai7v51G5ayJrEtB3DtItmNcjs91Vg3ctWDetPG56pXhdrbgQwPuVz3Za4
         Tzj4GcltJ5pMrUDoy8yfcqAFHEtRsMaRQipED2bzZNXsQP4atyiDP8AeWMcXMcwwTR6m
         7v+PD5Yy8NL0+amec48ky4TIH+XBpTRJGITT2nFaEEF+Op9OWn8zY4pY+zz9HUD3gSXV
         fTuQeXwMS7i/qHAd++5AZMSqxlGDs0OEwk6uozC1G5xJz3xgsthMN703z2KH5Y1xuSYC
         hBVaGYc+ZosWBu+1QZfP/R6xyNQ9rf8iGp5gyKqSpH4o8Nl4VZ3fYgzr0QYt0+EugaZ4
         heaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512459; x=1780117259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uSAeWYcV2CdyHiD7sqvWeyySNB5LM2QcahXx6n4ir6s=;
        b=BEgl/FYngjgEkpUL4l9wiMVzzJrydMXNMMNDV4dj3120BBrF/uZiGsspYIb1Fl1zG2
         tyTQSmiMoKkpsgFy1OLrPPQI4qZ8NJ9PfKfLUqo4PIdkFPMWKm1rTMO2qmYwVjw+WFxJ
         nr6JiFiiJ+LMAFtezE3/Bo2Jw4UNXmd54qtY1kpuvH1IDyQa2lLiFuww8dN9SgusQYiw
         DjLmPNZXSNy3josWZnLUhu6D1ZexGf7Tzlf8QCRrXHYQ/kyiwMXdETsqETQb5KE0+zKS
         CsYDwd6ZjGgyHwmLhLJoFJWb/yK9VJ/bk1GNF5sQK5ocAqbxxhWxxqYGtfe8z+fm/Xi2
         332g==
X-Gm-Message-State: AOJu0YzyQq8/MuyhiCcdJfD61sUx10u4cWywAOC8Rbyo767YDVvI670c
	ihxNfdpG7VcNgjFeRZR7hAjQ2i/VgMgQo1LIPE/pqlOLQ6fE841hRnulC16hZZcr
X-Gm-Gg: Acq92OFt94bT4mLV8AEgPO9RhSU2JR+EMa8frGBTUh1bCKENkzFeuJGckrshNc5qnHM
	GGf00mcJHh4z3wgdZMG7Gj+mIb0YiqXKKdWkeFspFMec+xT0Oki/8FiibSz23M0Yb2DIMvFC/he
	hLj4s2fNtr6zoQ+8GluTTE5tTOfr/M58wjs7TMq0recSsN/8Vyxp6AGenDRrJQyUCYv3fuhvfXE
	RAhiNpY9PgeSPL9nVTwtIblRYGc84yoIoGk2zWD2y2kamRYm/vC34CS6bPLmN+Qwj33wBC77f+w
	aAcDIQOB4sphh/745j6oV1ohxHY8AOZ6iJ96JqJcfX5YIk9uSCIPpe0MC5wzQpkHcPKMhtK7Cdg
	tuFYf6ddwDYakBxRjb59U4ermlRRNbUCxmmXH8dYPie9nK2M5UCeri6eIY2J4LnammEX9ZsM2+e
	UONgp8JS6MjC/QPVHq+LyIDxJ9b4nzidzXTArD
X-Received: by 2002:a05:6a00:3498:b0:837:fe75:104e with SMTP id d2e1a72fcca58-8415f0f0279mr6582077b3a.5.1779512459119;
        Fri, 22 May 2026 22:00:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:00:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][wrynose][PATCH 8/25] python3-django: upgrade 6.0.4 -> 6.0.5
Date: Sat, 23 May 2026 17:00:10 +1200
Message-ID: <20260523050028.848327-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127158

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/6.0.5/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2f64c27b186011958ac392aea9214b2c134e14a3)
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

