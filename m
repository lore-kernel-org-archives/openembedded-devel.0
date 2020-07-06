Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.59550.1594047073971564695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 07:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UqKLsV2X;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id j19so11624839pgm.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2020 07:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fKi6MKUHhgrAEfgo7dOaEA/ZtshQHqPuefHqX+kTc9M=;
        b=UqKLsV2Xbk2twl23VrcxsRqgL8xb3LuKfKGwpL/kjaPVmhyMxpnDhqQ/e8eBSosE0A
         iqMJGK8ombRvG24zpYo1SFur08gS0UkD3b6YdaNSkBYGDkNV1wG+QfxdKUkxZeNFGcao
         yGAI2No0kUdvDpG5BtnXnr55sBM/ATC3AiFxZ+FGxR5gXDSA7EgN0OPkF2jTJhcu9VqF
         RB6RfjaxX08R2BYWL91HliekxRssSl1G4vXBIP+5AG2qkc5vcLepqngafpmUPl8+fG7x
         QtMaItKsMFMi/7r8+UVqwttVpoO8MuBy0tcz1JgI/PGM4/ZNqxvDlpS2StLSS7vAbxO5
         00cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fKi6MKUHhgrAEfgo7dOaEA/ZtshQHqPuefHqX+kTc9M=;
        b=YsRzGF8zK3NeQqgB87MZjbtP7YNLebn3NevE9pR2LPVAOCAEbRxl2CcINe+pH9fRUT
         PWglBnKBorsEO0OdnRKPCNNI6foqllbjTUMwAJxlrLxb42qsNkWcVV5mB3I5Yrc9C3/d
         sYsCoLwXxiZNgbFtLNDekoyLAKDkxFR2ZLKmYkkiNU2IZS2XUvhgYh//x2x2/wrgOddo
         ub1jh0rASbulZnxCKgWC1HGt2klljnXk49LJo3SfAvqFojEi9WiT/lKtUyfcZ/VJ/+cg
         dYEC6r/NVxvDG1uZq/TCz+XdvM2r6MptFld2asnmg6ByOfe2ED8J30MlNQ3KngL/5BMa
         cs6g==
X-Gm-Message-State: AOAM530eDgPIiG/ayoKnTJ/NCgQ9JIWA+yE0btQ9ZQLjRzWHT87kYJZm
	jaSn3IwZuAvCo72EUthN7ytyXeqLEic=
X-Google-Smtp-Source: ABdhPJzlgRgc1MUaqOmjRQZbVthnleXkDdcyKSHzG72M8FUzfi7tOGEeS8Ap3FSdShz2T18r2+OvAg==
X-Received: by 2002:a62:55c3:: with SMTP id j186mr44811160pfb.237.1594047072898;
        Mon, 06 Jul 2020 07:51:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c85a])
        by smtp.gmail.com with ESMTPSA id q7sm20228235pfn.23.2020.07.06.07.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 07:51:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Sakib Sajal <sakib.sajal@windriver.com>
Subject: [meta-python][PATCH] python3-requests-toolbelt: Remove py3-mock from rdeps
Date: Mon,  6 Jul 2020 07:51:09 -0700
Message-Id: <20200706145109.600956-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3-mock does not exist as independent package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
index e075c019d0..27d122cd52 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
@@ -20,7 +20,6 @@ RDEPENDS_${PN} += " \
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 	${PYTHON_PN}-betamax \
-	${PYTHON_PN}-mock \
 "
 
 do_install_ptest() {
-- 
2.27.0

