Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000C3C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 10:54:00 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.98474.1755082436499150557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Aug 2025 03:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=j+3QFdHc;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61568fbed16so10188775a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 03:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1755082434; x=1755687234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qchrYZloKhYSKUy1hy4UTM82j2XW47kki2K80mQxRs=;
        b=j+3QFdHcN/G3iYf5KqwPYJhQ8qaSMTFR6fitd8ZbITOyup3DLjkvMoL2HuWprkEU/4
         N+24YRk0qZZVCf06l4feiS3Lg5wAHI7P+3ZPzHlyEDOxTxEZO1Nzknebp4XrpeGdCLA4
         s4oNlzXKlvXQIJMZ7HttmSvF0jBe5+ZINfKnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082434; x=1755687234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qchrYZloKhYSKUy1hy4UTM82j2XW47kki2K80mQxRs=;
        b=YcB58aoMf3N2kjZPF2kaSWWytP6bTqKkqpWdy1j6fWkZAHFNGceDSDIZc+TA5UbX7A
         ZCe2oil5yzzZt5jP1jO3ZThUrTQP78GRdNa5NCGhygzaZEc+QGUTVIZZJ0OgteXw+AcZ
         GM9yK5mDxE8VllnYTIMoIRvDUTEUbwYK6e28zQMZBl6Dt01rAoc50T7QZGpq7X6Zr2qw
         a9DZ8wf/Ae+0HbVFMQpMJHS/xxifoNsN8Cb+Z89UfWAKxLh3/G+lxfcKAQ/s790vPdWf
         10CAG67kfJw7rSVms1HSWV467rRvNahwzJY1yjbnJBSqp8WNPC4BrOgiVCFjjuNWh+jw
         0Esg==
X-Gm-Message-State: AOJu0Yx91uZjXn492NTrnnZ1N0U72YZNBDl9faexh86206JVOSDg3Wkl
	98rf6tUr8ICrPH722cyTyo+HyRI8wL0VGv5DPh4yfpjcdT7JqcIekFcoP5mJx8Hnk475vg7im92
	C4/Nj
X-Gm-Gg: ASbGnctkfFMmnpvdO+kpGpgwjFjsWi5Fq8zLDBV9ZzC6pfELuAziyz30abzDb9Fzow2
	q3xPNjyWu+Z87PuW7L+/oz8sTYHZLD6fz049F7M3sPr/LAgQ7HzTNQmZoz6qyx0fz2lhTCZi3Oj
	C6TkhjYIc434RGFDQeOnbgQjHPMnpKM5v17inaF9RHLpSHFO5ZV+3UwpfxoEp1Sb6D1k5iyylu3
	c2qo4s4IMeWM4tEpxRXx6tTI4brYEHv00pRpV2ZfB4CK06DMhLXYFmQA5qxenfXx4GgeMP4V8OH
	HDCt3pZfSJu+106jSJVIRxO/hA0vm7boscgaZnO6jMmZJJw33/IBdIReMaB/A6JBA7E9iI5WuMd
	W7t6RXLZCPuxtQGK30io0TgsyeUn2+TYLtEXH
X-Google-Smtp-Source: AGHT+IEo73vPdnhRCMSeMl8fn8uxsH0pgxb1vTlhHU4B/oEIT+J3+3t6iJylzcRijncqww6NGQCGRg==
X-Received: by 2002:a17:907:961a:b0:ae3:ce75:afd8 with SMTP id a640c23a62f3a-afca4e032e4mr271085066b.30.1755082434240;
        Wed, 13 Aug 2025 03:53:54 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3149sm2367914466b.38.2025.08.13.03.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:53:53 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][scarthgap][PATCH] python3-werkzeug: added python3-difflib as RDEPENDS
Date: Wed, 13 Aug 2025 13:53:49 +0300
Message-Id: <20250813105349.3478967-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 10:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118924

From: Jan Vermaete <jan.vermaete@gmail.com>

  File "/usr/lib/python3.12/site-packages/werkzeug/routing/exceptions.py", line 3, in <module>
    import difflib
ModuleNotFoundError: No module named 'difflib'

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
index 7a56350eeb..5758830cb9 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
@@ -20,4 +20,5 @@ RDEPENDS:${PN} += " \
     python3-profile \
     python3-compression \
     python3-json \
+    python3-difflib \
 "
-- 
2.39.5


