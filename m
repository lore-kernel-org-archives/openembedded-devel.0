Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5ACC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 19:47:33 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.23991.1741895245038457083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 12:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AsKuUCTK;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912baafc58so1204783f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 12:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741895243; x=1742500043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfnyFQn68zsvHfLqgEYecha8vQougqByTIcqMdu2jeI=;
        b=AsKuUCTKuHyOPGvfkjD8gJhyJGuCohHWyUElFnhUXiuzz82wjrOI0hDZG7XaRSvV9H
         kKv7rpSKuR7KkCfr+UmEjBMu7R7xglkYyIMaqNp7BZDdnO+RxmkUAndMxXwAtLUY8vQq
         +JIfxac20Rg9JliPTifC+R59ZyWMTGgmyryy73D3zopZ42EdpP17Ok+gxZf99XrLDMS5
         LK4CBS5EeqtPp2v9AqoijoWG3qixyFmz4kishEwUOPjlOsRDrGcncK3FbKcHm7cl/a1G
         M/sKqn/3Y72A+aphtT+iZBO4tJIlLVhzDEJJx8LB53b0cKkKwWXnj0zi8XSNEMBt4c8j
         TRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741895243; x=1742500043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfnyFQn68zsvHfLqgEYecha8vQougqByTIcqMdu2jeI=;
        b=toXmw1YWnk28veTTmBKpYcqIxIp+K5UvnypaQZrbX7XApVyvlO6Bhv1pFVIF4sTInm
         P7G4cFt/UpTRYoKz1YSGShHhdFe9UQcVy1rNpk1etdLPQbu+h0xY/w3PAEaZpE/tF6TM
         s6sEidFFuKGvWv0PD5jKBOjo/00NtlUzKmXCKDgmwRlzoNnN2nBKS4NFEJZJHtT2LWUg
         DD7o639fkBOm8jEDfhN1+lPvUs8S6Amzzww2Zg4WeWkaEGqVSwEMRapS6t5JtRU8RUY6
         eIeNwdydzf/A2tJ96gOGoMwWekMR+7W96HSqJifRQO7ZsqZBxsNKHGY3tmoZHV4YR3Y/
         z6Qg==
X-Gm-Message-State: AOJu0YxdKdjywreDqPSgzLj5IRLOBP/GGm3PMfe0C0BRKMUFJnpcLAh2
	n+KnEunMtmw8n1sv2v3atnVUp7a4Ye4SkVW+H3EaCQEI8mT5jl4DTTrqSg==
X-Gm-Gg: ASbGnctYqiMSncxYZVFOQgRt3AR7tputMcrmPnXnKoJUeifbfnMiWfZ2WUKMM+S5hIJ
	9e7hRFPeXql3SnjIRuS9H7lMSts0Q8nV8PhyC7db0Rm4JND+5gS2rUhoQAnZcem4DB8qWsFzdQF
	uMV0GuO2vxTjCKzlSaZWjYOeQDthXlUsH/+6qHggUc9KAKIsqvxDwUZnT/8Tl9T1orh6DFCdcx2
	Le/wCVoLKVJ4XJp9Lfd33xGuG5+j3qKlGU2rOC6uv/DSDQNMVOl7/bCP+k7kCptE1SkpIKhE0HN
	FyjQ8SyqNjnGuq0ABzi8HIoFHSIFATs/m5pBVIiY2AlbNSSLFdwEUt26m90P
X-Google-Smtp-Source: AGHT+IGSUO/KRG5tmY49y1N//SRLDnXdDXN+bo+NifbPkAOBzxWM1WxvSV4vKWiwgjj6mNRp+qY8tg==
X-Received: by 2002:a5d:648b:0:b0:38f:28cb:4d35 with SMTP id ffacd0b85a97d-396c200f31amr986303f8f.13.1741895243045;
        Thu, 13 Mar 2025 12:47:23 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a2af67sm30092035e9.26.2025.03.13.12.47.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 12:47:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-gpt-image: fix typo in run-ptest script
Date: Thu, 13 Mar 2025 20:47:21 +0100
Message-ID: <20250313194721.3490431-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 19:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115981

typo: SKIPED vs SKIPPED

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-gpt-image/python3-gpt-image/run-ptest               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest
index 3385d68939..b63c4de0d9 100755
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'

