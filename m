Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2101D12D48
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 15:59:53 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.38648.1731254388156675712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Nov 2024 07:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VCCkvg1j;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso2671783f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 07:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731254386; x=1731859186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe/Xb8n2OVrViFERSREpprZcZqJ0sZdFXPj5it4MpCQ=;
        b=VCCkvg1jv9qZZnSrC01jIKZFSR2Y/bjZVBbYiR0CBYtIgG0ZUhyWtaVjsXZ0pcwh5K
         99KVEfrtoQq9kb71fYoofaq8rmsTqrT0W8SySEcDzjiW7er9DWJl3EVJ0tmo3mVblV0s
         RMjcIyOfUT+k4KrDH7mkoDCQiK3EY+Fnn4XEzNVPitMuUR+QhVPGq4ul+v2dEQRccGBs
         8cUIlR+yj+tcVmL8C7mZDnFzUkTpQUX/0OtJITtuPdRYmr+Ne4G+bfLv8V9eWbnYlZiN
         ON3x1z9gOUKKB8CadxZvtFPeWCdSVCBFcfJVES7ezCsIReUMuHjmeWNbtJx0q72Ch4My
         gKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731254386; x=1731859186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qe/Xb8n2OVrViFERSREpprZcZqJ0sZdFXPj5it4MpCQ=;
        b=IoFro3ti89k2KJIS+f7khRtkv7PgwY2mQL9dm4j0tpmwer7/VLpgbjgLoYYPtQob2c
         pEh+N4I0AHfsOty/486ZGZyPDh2DyI6WbRYgvP4084/p4PqjfWPTvXK63AXBTXc6DNpx
         1kfxkHBzN25xCmm8yZx5mAdLpSlhuFR0YUtPn7x1eiPkSE1Ij54JOYEz6Q5ySPltpAce
         efKvjPDXqRKlA5NK0ZJ3WXrIvT95f4bOAY9beo2cUDcUll0NCp8W59BnZQBlY6D39Gax
         jsakndL1RlyR1iY+SKhrI5XISa+q737bW8LWEoQc7+vxBndQYM1koI/occPZ1RnZIKag
         NNDA==
X-Gm-Message-State: AOJu0Yyq5cCU/j4NuY2LBdkitUTtz9dyf/P/NCVMsI2e/pn5vn9/KRP3
	6G+1rOGhRIf0/eDRV5KfBQeIwOuNr3j0UqrG827FC44IJ2fRXhkaXFk8tA==
X-Google-Smtp-Source: AGHT+IHX14rNCQcESKPkMN/dc6RoWBV1Rsp4SkVKkp1TqX3kE+XPZLg3rG+NhPtNeGuQ+cJt0K4heQ==
X-Received: by 2002:a05:6000:1aca:b0:37d:2db5:b50c with SMTP id ffacd0b85a97d-381f1866bc9mr8539173f8f.8.1731254385835;
        Sun, 10 Nov 2024 07:59:45 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea587sm10851882f8f.78.2024.11.10.07.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 07:59:45 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-twisted: move appdirs from core package
Date: Sun, 10 Nov 2024 15:59:29 +0000
Message-ID: <20241110155929.4678-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241110155929.4678-1-gudni.m.g@gmail.com>
References: <20241110155929.4678-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 15:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113778

python3-appdirs is currently only a dependency when
python3-twisted-conch is installed.

I propose to remove python3-appdirs from python3-twisted-core
such that it's not installed in the final image when
python3-twisted-conch is not installed.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../recipes-devtools/python/python3-twisted_24.10.0.bb       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
index b097cb7fb..865190fac 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
@@ -42,8 +42,7 @@ RDEPENDS:${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS:${PN}-core = "python3-appdirs \
-                       python3-asyncio \
+RDEPENDS:${PN}-core = "python3-asyncio \
                        python3-attrs \
                        python3-automat \
                        python3-constantly \
@@ -57,7 +56,7 @@ RDEPENDS:${PN}-core = "python3-appdirs \
                        python3-zopeinterface \
 "
 RDEPENDS:${PN}-test = "${PN} python3-pyhamcrest"
-RDEPENDS:${PN}-conch = "${PN}-core ${PN}-protocols python3-bcrypt python3-cryptography python3-pickle"
+RDEPENDS:${PN}-conch = "${PN}-core ${PN}-protocols python3-appdirs python3-bcrypt python3-cryptography python3-pickle"
 RDEPENDS:${PN}-mail = "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-names = "${PN}-core"
 RDEPENDS:${PN}-runner = "${PN}-core ${PN}-protocols"
-- 
2.43.0


