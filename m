Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E166DC54764
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:12 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.581.1708128971237863900
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iwBeLUaC;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so1944883a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128970; x=1708733770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdPDVLChaZ1HILML2y28HrHQmSSNry0U9tlkQ15YlBc=;
        b=iwBeLUaCRjxeYbBjxBs4ysHKWTB1FxnK0RKpFaKyNpfAzaNEuX4jyeUE+wwKzGzOYN
         Puhz1GQcSuaGJ3Bts10oivLScpf1ypXTHJI8913t6w/lKiWGOktVpkeK2UShIQstV0Ro
         EWYA9Bx/wgEjvbTP0bT+kLqfB5ofh/OFZUhPgxhfse628NAXlfD9CLoZl/COlKRZuIi3
         7iSKqlTmitqzNIWA4AMKPj67JjBmrFUnKwzg6Ask/k3RCnIgQsBx0AoDhR52SRjEZGwh
         RyhurSh0+KnHmlMBc2FAK4KXOZnB8MmhoVI1GwuH91un+L8X2F7fsE8bx2aURtH14Of0
         mQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128970; x=1708733770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdPDVLChaZ1HILML2y28HrHQmSSNry0U9tlkQ15YlBc=;
        b=CbM0kYR1+IMTmjh7A3jTtjbzZK78MY8Yt85rTUddWZU9ar+Vz4pQ2Lcx/7b4VMpzIp
         dxjSYiyl9Q/IZGENSNorCjs9fWpCHyK4BBvtJAqI+QPE3LVJgCXY6c3ViTtZ5Ic/Vm0A
         uda5tTU1Y0QyC/b2PIe2ORKnzPsPTfLNc3UZgNX1oBzMzfi+Df1ThDLlmLttwamRgrNE
         LHhrzsHugZPWnIL4t8eJsCDhksinm7rqrfmC3SgXoTqOYDr5dGkMTYKXvOgw9WXG1AVn
         cohYQf1bYegMJKrh1mYm/SwjDrLwwqw9W9k+1SX79d03yRBnytDK9VLAHKv1A2kopAQh
         PjvQ==
X-Gm-Message-State: AOJu0YwOgfr4sFQukiir5ghD6lseNPWQL+hfRvDbAbqQniwiAJZ5hQ0C
	wu9E8gmMSy/R5lF04XAy8sQP70tONoIJTm4wa4Xkb4JHYz2O9+hkAWXGBzhL
X-Google-Smtp-Source: AGHT+IH/2ktB1s4F8lsWPv+uMTVKHA4RUpE1XQ7hEQ8BsOrFN5UMWt37os5SsjNY8jJEtficA2Mibg==
X-Received: by 2002:a05:6a21:6802:b0:1a0:817d:80d with SMTP id wr2-20020a056a21680200b001a0817d080dmr4863708pzb.45.1708128970376;
        Fri, 16 Feb 2024 16:16:10 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/60] python3-inotify: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:14:58 -0800
Message-Id: <57d63c932d2434f2d2b122c74fcbe04f43273833.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108777

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-inotify/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-inotify_git.bb    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-inotify/run-ptest b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
index 3385d68939..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-inotify/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b/meta-python/recipes-devtools/python/python3-inotify_git.bb
index 2e189ddace..657f610bdd 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
@@ -26,7 +26,8 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


