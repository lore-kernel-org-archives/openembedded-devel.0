Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A96C5475B
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:04 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.615.1708129023509734293
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QTSxlyQ9;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso2198129a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129022; x=1708733822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilKwc2n4lrBTxM1zdcQVq5EpG3+Pt0Kt+j+6YI7b+EQ=;
        b=QTSxlyQ9uUbWQq2JuiGag6GyT1LQHCk02CXDXYHO2H1g+EuoY5gB7Yh4KNcRbN55Lx
         Kv2kq5HD8k8yIKmBsZAd2PJQRqRTBW5b089KidW0Cpj1fYevk2jWVKc6Woz8dmrYqx1P
         po4iIvGxuNTHRLWgd6bHkKqMRNhXeQPPjBvRAPdT9RVMgn5YhhX81vC3vHOPhSFPNir4
         TrfjCcg9vx5G/xc6bwDPCcT2VXHLXx17b3bvhas0IyNNQULsQ89rxcPJjjt6ZUHYS+Gj
         jQvD2JQVUvU4eL46QcWA6mG0LQaYv3y25pVTevmUHUYT6bTK/ixL/YEvZDACzKrm2R0r
         l82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129022; x=1708733822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilKwc2n4lrBTxM1zdcQVq5EpG3+Pt0Kt+j+6YI7b+EQ=;
        b=u47L/GTt0NE0WI0HXJk4soHmIt+fapBqQQOsK0hWYxRFK7CyoQDJbeFRnZSBxq/h2q
         olVEJZFsDoXwelQYcm6RblNFwGkmfHG0ZSefkncSUlD3cSxlClaJciZAoyRMw2rnd9/y
         DSsPK5GTLfVnucpSxr+JpoEwvz+e4VziJEr275WgqEFMOgjQEHg7P+r3QH2FPnl1uPiV
         nJ3K9ZJXI/dQjODQdJzC7TOt4vNkKCnQpZvtRoNctq0JdjRrhxB2aXq+oIZ4zKvq1dh0
         jgHent6mI7tyHo8cXMzk56RQOS6IyJkIr9YDixA85fHrmLbbSk+wiXNgYa2hcenw/jK2
         fP+A==
X-Gm-Message-State: AOJu0YwlHh0IODGPiioOIPj2/SjPCm6Bu5iMkrd2RNRpsrZ/n87k+aSW
	CqZJq+LapEoReyKJ7zj0B/CzumV1xlYnvZYiNjH5aG88X6YLd1iZTOBLJU5M
X-Google-Smtp-Source: AGHT+IGzX+x6ojs8/M5Lnd9wTZ7giB4Y6gaI1dNFI8EaCITJjTlUAFqLSc+7AZl7IIyC+sXqk/40gg==
X-Received: by 2002:a05:6a20:9590:b0:19e:9ca7:7c94 with SMTP id iu16-20020a056a20959000b0019e9ca77c94mr8259312pzb.9.1708129022524;
        Fri, 16 Feb 2024 16:17:02 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 41/60] python3-precise-runner: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:32 -0800
Message-Id: <343201517eb389405133166209fd80de72886084.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108811

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-precise-runner/run-ptest   | 2 +-
 .../recipes-devtools/python/python3-precise-runner_0.3.1.bb    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest b/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
index 9e5435bada..1fb72de126 100644
--- a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
@@ -13,7 +13,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


