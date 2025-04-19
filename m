Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1636EC369CF
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 07:33:41 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.3171.1745048013981450523
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 00:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O9pinAVu;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so2281069b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 00:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745048013; x=1745652813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2g326PyvmL42NW4XzFD1h++x/gaj0IALefEq4vMS8c=;
        b=O9pinAVuEp6+LsrsOBon9OWfEQb+0ysY/LAuT9MfqUHNCgxKILk1Xb/l4tFwRRkrZi
         U8fjAutbcwWM3nTw21BNZLBQtzOmos6aKMiIkTviIQE7NLLi1pIQKjB/qPFHdN76r+oV
         VpmJeU2Vn6yFEMIOfBM7jbI3dqyiBAJhaKLkOyq0gK8GKDJpuB8jxf8G9KKOEyQEDEhe
         eSdROM8RVUa4jgrHoWEXt1RQG2lct1nvWveR0EBluLPnDyzqR8vYxHiHyCFvEelA3Dae
         pD1u5aCOajRFepQAohc+w2At1hmajECUpZOVbcsMgYvudPuPbaWR7kWjxRDV/MunN7i8
         0XDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745048013; x=1745652813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2g326PyvmL42NW4XzFD1h++x/gaj0IALefEq4vMS8c=;
        b=aMxEaRaK1zT/sdaQGh5g/11DoH7eD5XZ/o7XZWShkxMyr6LGdBFrEGKzW+YoJWuUPs
         goFtoBQOky4K+MK6dLpkxbSlA0tA7nU1hkuzHE5+PKsYuKxAA3bWIt38o//p6OT+zgOW
         mEpn7KWLFZbv8M03LlwejKsy54CUoB+qgLY0jQ2ohNUmmR/sD3iVGDXQyuJlUbdBsPBy
         rKsEctIUzJvIeQqP69nLbArAu96G6AJcJh+lYlhfxZWf2o4UFAf0m7qN5e6+fq2u3VpD
         CAVYINJ8tukfwvVS6lz4+G7TTOeQwiYY+azAH489geYKGVBmZm3bhDtRjfgrtGBTpV7T
         xbaw==
X-Gm-Message-State: AOJu0Yxo0BByZtVN23WdU3dzaSXJ86yC2lguMZTRsFTNMjw7yrwsxjiE
	B5mvihSZuGL5wVv+XLQXH3VMUpO9YFIr0nK96L60UY8x1dxrY/OZplF3UsUU
X-Gm-Gg: ASbGncv+c7veRzxjcXrqYxTwUN8tJ9XEzalHgLuRiVI27gGqLd6HLWnLyqUIsZCByIx
	9C678cn+KELXgdAzttIIDygUwL0ClLWF/Mm1Irh0cQEKOLo4Nwi8kPNZPnJbWBw0YFrn5gwbiS1
	kHRfUIXGLEEpBSce0HSjeFEHqgbNmrCtkmAGiqYNFqjrrJQtPA5TthrticXtRA1F9+3WCF5WwL8
	zxRZczL8LalW1Bzy7+M1osfmD0B3ghXkH6K8gPyGNBGnarecyo6FV0/Ht9WhHBxGP3JD9SjhsNP
	5ymnCjow1jnqUxiWyFqgF0lt/7yJa+awBElDn2nGDRk=
X-Google-Smtp-Source: AGHT+IGXTU8gqI7d9sWowOg6vNWKl+3SGLIoeqjfFBNbOW8p/SnRC9fvhx9Yg1Qel2mPUqHxK2f9Bw==
X-Received: by 2002:a05:6a21:99a9:b0:1f5:8748:76cc with SMTP id adf61e73a8af0-203cbd0bd09mr8423231637.31.1745048012974;
        Sat, 19 Apr 2025 00:33:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13ad7d5sm2429763a12.31.2025.04.19.00.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 00:33:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-web3: Re-enable on riscv32
Date: Sat, 19 Apr 2025 00:33:27 -0700
Message-ID: <20250419073327.2468160-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419073327.2468160-1-raj.khem@gmail.com>
References: <20250419073327.2468160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116979

pydantic-core module has been fixed to build on riscv32 so re-enable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb     | 2 --
 meta-python/recipes-devtools/python/python3-web3_7.10.0.bb     | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index b8cb47538c..6866ed93cb 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -471,8 +471,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     telepathy-python3 \
     unattended-upgrades \
 "
-# Due to pydantic not being buildable on rv32
-RDEPENDS:packagegroup-meta-python3:remove:riscv32 = "python3-web3"
 
 RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-ansicolors-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb b/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
index f677585638..e9f067aa96 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
@@ -24,6 +24,3 @@ RDEPENDS:${PN} += " \
     python3-websockets \
     python3-pyunormalize \
 "
-
-# Needs python3-pydantic to be buildable on rv32
-COMPATIBLE_HOST:riscv32 = "null"

