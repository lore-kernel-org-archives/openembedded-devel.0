Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF856C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 04:32:50 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.39181.1712896367038670979
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 21:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NwvR2j+2;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e5715a9ebdso5054105ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 21:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712896366; x=1713501166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHdrbsV332Er/2kIMumgvNvXhnW9H+rV+0uP2ONMPp0=;
        b=NwvR2j+2EiZKggZKen4Tlfg8shXmVJ6Oi9WdTCHPL3EL0GKTx0YgCZlX/q42PefJGE
         hKuwhH8SMtfOoX9p5UBeBQu00DESyP1HV4DMgyCSwYnoxdFdSFlFgVmHN1lDB900HDPh
         rqqfbLu55ZWZuCB31X9aWaXyg7pDNAd+IztBdH0iGIrfw6A0j2wf2FBpweAMhbLp8y8y
         RRimlxRitokxqDDwGEQKZ+nVxVgPtC1nK/Um8Jz6pt4aEqQ1vAQNdXqQ2K4+U942VbX1
         RjgBKF6SllPkU4rksX/1YoxV3jjchaGGrTUeMEDCwgPs/A+gQQIhnFbt6k/NdNZmezHx
         WtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712896366; x=1713501166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHdrbsV332Er/2kIMumgvNvXhnW9H+rV+0uP2ONMPp0=;
        b=DKdQjolcl7l9uIwuSY0bbVSq4ps/GlRE8t5Si5+sM7PMqg2YL3ADtTIwl1TIrDPDJ1
         wSyFAKYwgnOGvj6Ma1NdOzLYfRg3I3rVVfgTU2ySFoZUlMtocZzud+r8Hd5/l2qrPMPE
         iTuuSEm4XayCsP/00irIaTIFRWcg9WwzjqJm4Oenzdwe91XJkVmavboNilFiyzh4davG
         r1rL0HiKY3cN6eKQJEXOE11zGZjwd2883mYMaP4CNR/Suf9RXRvGfCneSBVxQ7uln3p0
         ZF9tkmIGzuaQk4sZeqyk2/HZFJSxS3HQLaJGFCRwXZWNOApZP8tpq0vgxLADXOfmj5Me
         Bkqg==
X-Gm-Message-State: AOJu0YxrXRlF4CtVsP2ZQlHG4MjkkGbz4k4f2ZTsNgX2BIjZX6cf1CIG
	ENtriacB8Z9aVDJs1lPd67RoZACBOpFK6YNl8S+wNZhQe1HBFb+0zATvn3Dt
X-Google-Smtp-Source: AGHT+IE30CzWfIxC+wLI5zRWEVyp1+JOG7extzANR5t90Zwpy8fKn+Hjy/XGkSGV3uaY24y30aAlGw==
X-Received: by 2002:a17:90a:130c:b0:2a6:f414:4e0b with SMTP id h12-20020a17090a130c00b002a6f4144e0bmr419987pja.41.1712896365977;
        Thu, 11 Apr 2024 21:32:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id b2-20020a17090a488200b0029bc9c34a39sm3597735pjh.50.2024.04.11.21.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:32:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libteam: Add missing dependencies revealed by ptests
Date: Thu, 11 Apr 2024 21:32:44 -0700
Message-ID: <20240412043244.1092188-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 04:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109933

Fixes ptests provided kernel has team driver enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libteam/libteam_1.31.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libteam/libteam_1.31.bb b/meta-oe/recipes-support/libteam/libteam_1.31.bb
index 023cea9039..6fe10abe01 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.31.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.31.bb
@@ -35,7 +35,13 @@ FILES:${PN}-utils = "${bindir}/bond2team \
 "
 
 RDEPENDS:${PN}-utils = "bash"
-RDEPENDS:${PN}-ptest = "python3-core"
+RDEPENDS:${PN}-ptest = "python3-core libteam-utils"
+# Ensure kernel has these mods enabled features/net/team/team.scc
+RRECOMMENDS:${PN} += "kernel-module-team kernel-module-team-mode-activebackup \
+                      kernel-module-team-mode-broadcast \
+                      kernel-module-team-mode-loadbalance \
+                      kernel-module-team-mode-random \
+                      kernel-module-team-mode-roundrobin"
 
 do_install_ptest() {
 	install ${S}/scripts/team_basic_test.py ${D}${PTEST_PATH}/
-- 
2.44.0


