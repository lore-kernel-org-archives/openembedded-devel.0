Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC65C48BF6
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:23 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.578.1708128981496677673
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TuU64oiP;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e10303de41so1258219b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128981; x=1708733781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACtaLyMGRuDKgD8uWyE+qQq/nvUBOPaSJ4CeABJ1Q5g=;
        b=TuU64oiPZYCYWrl+YJwwcbUsUmJWEROgCvLxVqiEMZ3HczKVL0tCr4G3RxlhaWUj/e
         ttRLPE5XAzlwnEy+Rt24G7Tndj7SyYgTZenD94HkBxyW8oA8u6nkMK6m3LynMCE8YVHp
         2PuLnxDOYje9RPyjycI59vRlVeB3CpBf3Eq9C7JUJHIMG/jjYF/0ITUYs+oBUkfCozJU
         yd1I7EwSN224VFFPIygRClx/oL7QTkAOeUIf3TQsBdHcIMMclesr+ml3Uqz6MAOptiLi
         B+4qjYM7043oq8vj1ESiRjL6k9laaS0PXfLORuc+zEdiF2zRb5iiGNTqjSENIH/8YOli
         Xo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128981; x=1708733781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACtaLyMGRuDKgD8uWyE+qQq/nvUBOPaSJ4CeABJ1Q5g=;
        b=v5J0AzMMWpm6G0I6/F7s4c/T3FgC5mIe8z7jCAzxYERcc33Iqh7NBmkrT8A1Xzu+fB
         6R09EZGWrse2uNrl1yd4TTMxq+MrRthBLRDAlOTL74PPjFfZYSJynH/FDI6kH3/62hx5
         ZHxSnFbPDaY5w1rWci2i1lvaeC1u9LAdhv3qMZ5QslKAAe4oSBVd5l/Mj71bs8iCdxpp
         DpfN1Y6aKnMNBg6CC8aMcwZblWlQjoMaA7bJnsOkYlPDmKPWY9gHaMHr8Zq05KkILQoS
         wlvn3+pjMTa21fFU69lZL6QChGmMQilxpzD/k9ac1F+lOwOVMg+cA4uRBye9m85gp8s1
         AhvQ==
X-Gm-Message-State: AOJu0YyT71I6M5XlUpkBOdShqqj5JJ/PKR//iuPJ9Hryu5JB9QYhax8u
	4xW9QHyi26I4lDBvixyW4StJ8mnLGAWHN7o7/aq3S67f8i4Kvy+806NDKDRs
X-Google-Smtp-Source: AGHT+IGH+zS2ucxS2RuGNoz2EbFUoH2sBplX9ne9YaS5RaNA5Zo7LSQupo3gVTmrEe2bZYjS6W/bQQ==
X-Received: by 2002:a05:6a20:94c4:b0:19c:6877:9943 with SMTP id ht4-20020a056a2094c400b0019c68779943mr7398060pzb.41.1708128980722;
        Fri, 16 Feb 2024 16:16:20 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:20 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 13/60] python3-iso3166: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:04 -0800
Message-Id: <904b79913f64e9a29c2cb717b7af47718ee69002.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108783

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-iso3166/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-iso3166/run-ptest b/meta-python/recipes-devtools/python/python3-iso3166/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-iso3166/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb b/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
index b32cfe5956..3aa084d10a 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
@@ -12,7 +12,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


