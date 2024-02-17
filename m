Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82C3C48BF6
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:12 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.577.1708128968144415722
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KFGYgAdV;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e09143c7bdso1714292b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128967; x=1708733767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvgd9cE5IM88WxvmFWUMXAOdl6Zj0J4dyBGU9z4nN20=;
        b=KFGYgAdV12LN9hHX2yjXGfpUDiLmlhFIyJchOS9B5yRFPyA0DgAjEbo7xAy+AGgRyU
         xFmRBX1l5Fad2C7UJIwRZKKip57wnCPZc83IDq0JPhGciQBFj6kcVBcpMbZUkeCY7pkV
         /zTuZfJGDAK2G+OeM7DJqiqgHH2GKRtJRY9jVOOff0KHYKejwhs9FihCcDmPrR3smyRs
         foDlrTAwqn678rV7/8SNE81FxTYdRy6b3oLF8/i9kcvO1RYV3rk+Lez2T8H10HSirnrd
         uvMFD3tJ7HalVqGV0bwx4CVES88IfCrvg3FiIborcNiZ6hcPO95ktNg0sEr2Z+DlJYOC
         2Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128967; x=1708733767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvgd9cE5IM88WxvmFWUMXAOdl6Zj0J4dyBGU9z4nN20=;
        b=HAB/JSniCr/niATT/KtX/YI1uY5PDuGJFpKPk7lBmnUrLNjP+UvVFNfb84GQGfXYP4
         tL0BZo5DHYtLuMmLnBBBBoUZA9xrM43idEQrlHjvsnz6TWEgZhuKImxqYJ6My9tcbaft
         RzrW4kZOLygjgwWkHEbWuOR0w4MaQfgSPmr3ldUpaeaOhfGp6W6HXmseAsZZPfktpoBu
         SjqTGtcWcQg55vDKJBjQO0Q6jRsFVxrRp/xGANWLi4BgRgIM/2j5FtljvvU5mrqFDvQx
         ZeFqBrT+qXPOTlkIewA6l7AwrBfKSgFOI50qwFaXkmfQaABWSO9llTSA6hZV0nYoz0zp
         dtFg==
X-Gm-Message-State: AOJu0YwhEN+Sl3j6+hPSQOPHfT4fCji0vP+TOHWsioCpngrASI/EgPn8
	sp0BaiOhaWPkw9872vZsSlVGTZcI9XikJPkvKXQ0TRhzid9gorL1regNTYut
X-Google-Smtp-Source: AGHT+IG8ZgNW5DzYP6yyRnjMJghADrmGpkj51K5H1OtlLcA6Ks9AGdXhCJsXeVTvH1lhpgxpNztWIA==
X-Received: by 2002:a05:6a00:cca:b0:6de:1d0b:ae29 with SMTP id b10-20020a056a000cca00b006de1d0bae29mr8336539pfv.0.1708128967294;
        Fri, 16 Feb 2024 16:16:07 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:07 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/60] python3-fastjsonschema: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:14:56 -0800
Message-Id: <ae0359188b89efc959c77aaddea9a52454c8b1df.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108775

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-fastjsonschema/run-ptest    | 2 +-
 .../recipes-devtools/python/python3-fastjsonschema_2.18.0.bb    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest b/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
index e0be7b6160..6b74f7260c 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
@@ -27,6 +27,7 @@ RDEPENDS:${PN}-ptest += "\
     python3-pytest \
     python3-pytest-benchmark \
     python3-pytest-cache \
+    python3-unittest-automake-output \
 "
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.34.1


