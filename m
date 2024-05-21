Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38180C25B78
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:45:19 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.3906.1716317117720359041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sw8jQha5;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso66906f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716317116; x=1716921916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCBuNzRgPKnhRkbViXd07PNf+lQF0vG+6opzOvDuf6s=;
        b=Sw8jQha5j95EvDVWjgp/mUOhP3lg3lKHwRlyc2jIey7aEiIxQ2S5h29K8FpCC2YanW
         pg/2hAyBSP7MwE81obiV2BIU9wERXgvplGhA5s+7HXF6bCZDxsA1uZQnul5bY8D4ZCig
         6yqK71hrFt1uXzrgbOubGqzpESQcfLjPj9JA7g8SWpJvV9MD9Is1oU119E0O/CISTVQz
         /SMhRapzaXf1uagA4swdG6A7YE8epNhiat4xaz/b25WRcGMvFEM/H5RxNhXuYz9fTXAJ
         OY4NRMta9khGATMcrB7eo3K72MS8WJKq/gzAfbpAGHynzzkwYjsNyYR3Tyw0uOAA4WZc
         34aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716317116; x=1716921916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCBuNzRgPKnhRkbViXd07PNf+lQF0vG+6opzOvDuf6s=;
        b=t80VHuOLBp88XNvA5Qz2pkdfftmj6/WYerUiHIgN0V1qFtCrkrmszt+xn/zGXdn8vy
         EK77tdQbENtaXv6UY2tDrRMmpCujLtkgrlnmUUo+d//KeaQhwYRYJBhx3LxHP//q0RTW
         hkZnDZYgFFuu2vC4Wzjqj3SYZRwCSGoUWpj9i9gMe0PbiplGxhxVDp1yRRiMiZ+CNgcj
         Zcm7rBdWJ3WdQIHkAmPJ4uyO79V3Uvcgrot3PEy54YVRn5KlZlMPPCqTzg83M/k3UZj+
         gCcFDuHUGDdiGcc1I4xw1O4R2544MEvQ9A3IMaKttrYbzw0tnRHv8lbeaJnP9+ZDySf9
         OJbg==
X-Gm-Message-State: AOJu0YxMEc8G9GgycUVdEW1NWiM9mHGykedGH4ney2s6+y3rqD6TUC2G
	ENrsxrKUw5D0ZvVb81cpDmNbe/zirUw2kSGduP1CnbteZUMvLKjWf92GAA==
X-Google-Smtp-Source: AGHT+IE9xM7n7a2FcgqH3jmxw5KV2wTpKdbBFMotHobS/eiZZ+YHS8ke6WUCsSbIR6unAU8Z1xBTwA==
X-Received: by 2002:adf:e8d0:0:b0:34d:93c1:c7d8 with SMTP id ffacd0b85a97d-354b8deaf60mr9467054f8f.4.1716317115686;
        Tue, 21 May 2024 11:45:15 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354bd2e2a5asm9482943f8f.45.2024.05.21.11.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:45:15 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-werkzeug: added python3-difflib as RDEPENDS
Date: Tue, 21 May 2024 20:43:06 +0200
Message-Id: <20240521184306.1937606-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110474

  File "/usr/lib/python3.12/site-packages/werkzeug/routing/exceptions.py", line 3, in <module>
    import difflib
ModuleNotFoundError: No module named 'difflib'

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
index f8d2769b4..448abe189 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
@@ -20,4 +20,5 @@ RDEPENDS:${PN} += " \
     python3-profile \
     python3-compression \
     python3-json \
+    python3-difflib \
 "
-- 
2.39.2


