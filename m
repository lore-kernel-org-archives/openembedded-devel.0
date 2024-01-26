Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED17FC47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:28:17 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.1706.1706304493659870730
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7bfd721804fso3972139f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 13:28:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706304492; x=1706909292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+D6V1/ho33fEeY0meNW3OIyJL2MyfbPgBKFV4nvHLoQ=;
        b=EFi8nK1nl2/6Unuvv6Ab4Z4/E1F98/sER/DEB0nX4zODQCfItSmvdjfQLAzC0+Tm/m
         PpqwkL9Xl3XkOte1Y9BZ1FS6ota+R2IAM0ohMoIxS+s4BP+c/VQZnlj/4CxQ5CORZaPN
         toAgWZuIz5m/6/LChmnZwLq9O1vy4bEBVgerfZzxYqAv9vvDrsGPmla7cGKnlQU++xB6
         4c3gux03mKdtdsIwRrLPcxDegTLdQ14Ox2msomZYWpK4DJkjE7IO+fT15CqRlI5M51GM
         vYQpz5B+H5PfRpbFmRU2IhSRNLJkr602a5/kuB6t7GjsvYBXB/r6sZfdc4eI3GOh3mdK
         ENRw==
X-Gm-Message-State: AOJu0YyEnykgOcDuekCSyNiiXLctafEKPXP01U+nOr67KCRyCt2IAaHB
	PUi56nRZ4hrJjWCZ+CurBuXYVTPJMhDhwSfOy+vfzif9VqWZxIcVY+RDPCrWhJRs3Mr0
X-Google-Smtp-Source: AGHT+IFnKw8JYx3R4sq1ztJyUP6fw5NgLgm8MkdOZbiHVcxREEHudn8TOEG+dLJ/3hfMRwBCtGxoZA==
X-Received: by 2002:a05:6e02:787:b0:362:b80b:a920 with SMTP id q7-20020a056e02078700b00362b80ba920mr165110ils.27.1706304492005;
        Fri, 26 Jan 2024 13:28:12 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id q11-20020a056e02096b00b00362a85b8e20sm530300ilt.45.2024.01.26.13.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 13:28:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-coverage: update to version 7.4.1
Date: Fri, 26 Jan 2024 21:28:00 +0000
Message-Id: <20240126212800.1586813-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108472

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-coverage_7.4.0.bb => python3-coverage_7.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.4.0.bb => python3-coverage_7.4.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.4.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.4.1.bb
index 30922697a..b3da5d571 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "707c0f58cb1712b8809ece32b68996ee1e609f71bd14615bd8f87a1293cb610e"
+SRC_URI[sha256sum] = "1ed4b95480952b1a26d863e546fa5094564aa0065e1e5f0d4d0041f293251d04"
 
 inherit pypi setuptools3
 
-- 
2.34.1


