Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED9CC54764
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:53 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.605.1708129008709284031
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AQc6e4MW;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e0eacc5078so2180404b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129008; x=1708733808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CM1O94rGkMFtOaYtcV0OiUgo85sMzv2Z3SCsz3SYOi8=;
        b=AQc6e4MWSMaE+0NmUE4GctNHSq4W6/qagAXtgK99P4AsOwjMCl68IZZ38OPawOfjy3
         VjhyvnGjfwjaWddHpDdLcWuXmaqwkfTCM+sjh2rm4ggv0Nd8MNiqtxAPf5StPK71kcTH
         A6yMW4pDDRFButaCwa3lj7/gyTTrtGfQICEe1rX4Gm/iprwGi47TN0uEg+pwcZpMSzDA
         hr/WCM1VGchvN7vsnH+VfFkKIWxG1CB7nSxYJfkoIk89KXE6lH9fPF/Zcj9Y+LH0izXy
         i2cYVCPJK1STD6mnenRZKfLvhs03PcdekK3KcpRGhofqCvF+9g3XvhbnwbkmvAMYlDyU
         GnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129008; x=1708733808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CM1O94rGkMFtOaYtcV0OiUgo85sMzv2Z3SCsz3SYOi8=;
        b=EbXp9tYp06N7IOfymLzz+skfwySD2Jto02fayeOM47ofsB/ZvANfFJAL6+TBsR4GHr
         r46OGv01mAhTGLbFiNYf2JAtfz1HrbRNGUAsB0SXIClkMVLFDEarI6b5INnMrxXfcNSm
         BcrVSIFvz+4127RgG7P/I6Y6/mHPeEVW1amSjZMIbBUFYYXpEaAas7zFjndC15/25xa+
         dekk4zfZP73HhG0bRFh1aOEjCJtoIyms/GjP0lUfTFYsgLWEUKzfZDdpLC4Jpr5UCIHV
         IUkvjZ7E6CcvrIqK1jqweN1wl8msCR9gDEXRKd8y04oqtUAtJVLxhWKK1wyerU8YjkrD
         1mUg==
X-Gm-Message-State: AOJu0YzHgGlY4kipEL2N/ulBKV4gK+1busMbMCY96eCHuaqIOof/a2Z8
	d+tmudH0qqaF280I0YKtvx4DOyUpO8UDWbowpTbUr5khBfZAeb+fFGWCqMiV
X-Google-Smtp-Source: AGHT+IFiOg5iwgGgvDfD6koGjOzf4AG6lvi9cI6xOhKGJzp1qFqaKk6SoZPZWhdydJ5yX3icKL/w1Q==
X-Received: by 2002:a05:6a00:3d53:b0:6e1:142b:6d4e with SMTP id lp19-20020a056a003d5300b006e1142b6d4emr7660967pfb.15.1708129007898;
        Fri, 16 Feb 2024 16:16:47 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:47 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 31/60] python3-multidict: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:22 -0800
Message-Id: <58092086ab5b86a1c5c110acd0874900c23627fd.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108801

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-multidict/run-ptest      | 2 +-
 .../recipes-devtools/python/python3-multidict_6.0.4.bb       | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-multidict/run-ptest b/meta-python/recipes-devtools/python/python3-multidict/run-ptest
index e4f3b623ab..d74acaf564 100644
--- a/meta-python/recipes-devtools/python/python3-multidict/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-multidict/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb b/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
index b057e05f65..19b94dee02 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
@@ -18,8 +18,9 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-pytest-cov \
+    python3-pytest \
+    python3-pytest-cov \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


