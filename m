Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85224C54766
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:43 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.594.1708128994751462938
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mu2DTrl4;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e0f803d9dfso955443b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128994; x=1708733794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=beytlZbpVqQMBPtFmbaU91TmCNFNWuwSMfCq6ozLrBM=;
        b=mu2DTrl4nOKL2RfaFzW0nX6XeM4Mu8dh/sBf6aibaybo03rALFAa7y1ZyhBgbb0rF3
         Yl6ldaZfGPnfm6PcRryBIKNoyqmyyBXxCzPSsSBjMzJCRm0yFsTC5z2OZH1XQ5o5978G
         doEUA85jyiABTLtCQ9+O4/qd1t/sYd7VU3bcDsC5Hq0WCl0sv2VYPkMSWha6kHzuqzBz
         26zBclVLywEKyj+IZUxlpRiuG9uHusiK/onf9D315iI+3qU0bdNDky5ZQZ5zCZvmDwVz
         efVNZZFXEwqzkhFXcJYzotJInIT7orhqA01LPPuA/xOp1xzvLYuDMs9XHA2ylBRV5aRn
         ceCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128994; x=1708733794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beytlZbpVqQMBPtFmbaU91TmCNFNWuwSMfCq6ozLrBM=;
        b=nb4o5Iywwt/teqUKLkrOMUfoAHn6Z/BaP3WoJt/Yq02akpgc9lPT8vu1SaYMj3Zlvp
         3a6y1BCrBe7i2cUNSfDnlgY+1tyqS6xftIoE5MWWwS85Cv/VKOv8Ia0B+BmdfYZI0Y8o
         E2l7ZDxbbDyAmT9rlBNr9XBA9tUCzs+BppX//dkNhIZfb1donplQQmzrjjthbIvG6SRU
         aILQDrGKBSASGsKFPNhjd6hWjisFOKgGvmEEF0aXibxnskU/lkDVrdzBvHFSjneO45NZ
         58ZvQYr6CeDsf/aGB32cuKzeNa/HxITOwx1LDFttiTF7u6Zrt/lQJRoT0scboVmv/sG7
         LK3w==
X-Gm-Message-State: AOJu0Yxz8e7XrZF8gpbNCx4VZvQhj47MOTUaFYHc+o6Vg6DKbFOp2Bfu
	dnt9z7jgEn51OuoIQtkVLkG0gb/w0zYZKdh5zCXy+Va04mAM5PQzQ7o8qsx9
X-Google-Smtp-Source: AGHT+IHzTHZiMEOv+Bz4SyItmNNQcEizKabkFLDx78MbKmdvSi0ThzcY+guLuLQR86kvXUKfMjP5FQ==
X-Received: by 2002:a05:6a21:1799:b0:19e:bf18:61fe with SMTP id nx25-20020a056a21179900b0019ebf1861femr7375818pzb.11.1708128994005;
        Fri, 16 Feb 2024 16:16:34 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 22/60] python3-xlrd: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:13 -0800
Message-Id: <9f8c60eae5f9d24ea69fdceed96f27b62aa9e749.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108792

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-xlrd/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-xlrd/run-ptest b/meta-python/recipes-devtools/python/python3-xlrd/run-ptest
index 3385d68939..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-xlrd/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index 5e63d3c307..8a9af14d3e 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -30,6 +30,7 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


