Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.23604.1620593567131353552
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 May 2021 13:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PPfqe65s;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id q2so12149971pfh.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 May 2021 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7lhykL1hT7GMXfu7YQZKMl0HR1exa4k2F4+UyZo7OAY=;
        b=PPfqe65sCKEO6bp//aN14RccLVP9yDzq9Z+kVPOReQywbkAd7sDDiDquZ5iTnjUn66
         SBDcamjmAR0cHidtS2ndOGptfRF2vbC+JG1XO34Z77cwgNLTXvK4cnSIwQ2js3zSK9gc
         vaWCO1qdBZ6fAVgK79QTxTZXWjSfoo0/B0mAWuRIbIHpSAzPOPEz6UjDDzMYdGRWRZAS
         iytBDuT18Qrj8QnTbb/sX1RxKqHsLAEPOZ31URGHIBCB3tjQ6/DqlD7R1hheB+wBElnz
         6hwt5M2bi33xl+GiB4SRYyl+GOOLXndqLrEKBWAHPzOZFy2erprkdtsRAuEfk0shej2S
         gpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7lhykL1hT7GMXfu7YQZKMl0HR1exa4k2F4+UyZo7OAY=;
        b=X5+nIGxA2YZL3+mf9P6jZXjX09zhKlrdKevmWUSfjDBt9XKNmZEXoZuNW1paz3YXhE
         JiDjjPxdh0veDmnBaykPvaxNvrFxyiWrLSaSpuzsUivFqbdTqBos7sc/DBqStpm5iAI7
         Np3xlLHmY9jXwgM5UoHb9WyTVhycxCdztsgiaZ23glZXgZlZEXn/F5m9icYcKVgdwBh3
         9hDxuaQBldCsGt9cLnZ1n3UMXfelyWL5Yqh5pzpK4okCuWJE7PuPzQXYs+ONTaeF8XXa
         8JJK2aaE4g3xTSuV/MkSDmVByt+f4PEda4TUtLvH95gmwxmLW4lt9aDvBY1tHKtCfp7Y
         Eyng==
X-Gm-Message-State: AOAM530FhhIMTnMAfmnCAaWaesujxzgqHsvkpkfPNwzfNoB5x3R5zITq
	xBrp+/1E0kf7FruUTreXr4vfDVQmr2mm+Q==
X-Google-Smtp-Source: ABdhPJz2iLMTx71z9+7zZ337krAwxrrL8T1r1lqCHuWLlev2VQ+voOYHoVDr4c7as/1xOLVR6xWLQA==
X-Received: by 2002:a65:418a:: with SMTP id a10mr21472609pgq.307.1620593566328;
        Sun, 09 May 2021 13:52:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id d22sm17302804pjr.2.2021.05.09.13.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 13:52:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] grpc: Upgrade to 1.37.1
Date: Sun,  9 May 2021 13:52:44 -0700
Message-Id: <20210509205244.1503264-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes are here [1]

[1] https://github.com/grpc/grpc/releases/tag/v1.37.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/grpc/{grpc_1.36.4.bb => grpc_1.37.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.36.4.bb => grpc_1.37.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.4.bb b/meta-oe/recipes-devtools/grpc/grpc_1.37.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.36.4.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.37.1.bb
index 03de4997bc..a7aabd13f0 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.36.4.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.37.1.bb
@@ -16,8 +16,8 @@ RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "3e53dbe8213137d2c731ecd4d88ebd2948941d75"
-BRANCH = "v1.36.x"
+SRCREV_grpc = "8664c8334c05d322fbbdfb9e3b24601a23e9363c"
+BRANCH = "v1.37.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
-- 
2.31.1

