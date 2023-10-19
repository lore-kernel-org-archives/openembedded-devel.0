Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07351CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 11:05:40 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.24918.1697713535233548289
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 04:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=azYeboGv;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: festevam@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3af59a017a5so1397779b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697713534; x=1698318334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rYw0c/LqPSbrCiLL3MJtEGPPPY85ZouoTY39BMg9BuQ=;
        b=azYeboGvlw2oYntBJhUpG5S8YoL6Yj6CaPMq9WssA7OVQDz99XGikwK2IHv5JtzXqL
         ILS9AOIorufHGpF5uwHw7IUy7FykahVLXTFHLGXu1nnfj1BH2qjALfNXT0VPtvL343e8
         tSPJZkieSgcHNTV5f+5mokpp8Mv4d/KyEOo3WRcgGj0ZIWEqI5paG8eRNubAdIkB8k36
         zxZf9qoqM2jjSMWHjftnWa+kUf0wj2OmLLYl8UEVvtNHrToxgKMMCz7vRNE9Wqt7uffb
         G1GkO805VvVaOZhu7c/00mB6+YmXDJ8/a/52Za6hwvcrNwA1WLfxd0DmMgjwA0Ypzhz/
         ekAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697713534; x=1698318334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYw0c/LqPSbrCiLL3MJtEGPPPY85ZouoTY39BMg9BuQ=;
        b=dFXif8WnRDhA//L6eNHLaOjj3uP8OSG+hjLJSf/pX6fJraqsA39wKy6t2nedjuat2n
         M4IEPFBAJB2Ug4Ncfbf6Jg4aI/Etnk8FUeVcZSf/+3hLHtfVVvagE5jX0hvv4SrnGobH
         mmJGeAj853rSHfS+FLHQ5CCFVwX1/f/I546id1L7pmEyrext92PIf4s8UrCwUaHLg3Kb
         AmHAbKhRXsXl15s4nN9uyakWozkVW7bB6hKcqgc4+Ng+Pwy5hK4UEnn1clehqtM/PCeb
         xIL+U3vcqqiSZZFz/rmWV5omgWOUfin33zoGZgsDVWka79H9NjpWtEoocPbvpfWaYSi0
         WziA==
X-Gm-Message-State: AOJu0Yx+/Drtg5LtNl8x8witB6hP0PkRKnMSLx58NcibifmfPBBrP6z1
	bJvG9pw4Rlz2Vol4WSCuLgPbJ+O69hs=
X-Google-Smtp-Source: AGHT+IEDvNvhkOFWzQ+Fd5tuo+MBsnRlP9qJsQGMDFv9SB0HlmBTU1UyEvctBD/27fq71oFMyhyy5w==
X-Received: by 2002:a05:6358:c9a:b0:168:a382:8138 with SMTP id o26-20020a0563580c9a00b00168a3828138mr1371266rwj.1.1697713513183;
        Thu, 19 Oct 2023 04:05:13 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:845f:888e:bc51:273a])
        by smtp.gmail.com with ESMTPSA id l28-20020a63ba5c000000b0057825bd3448sm2773644pgu.51.2023.10.19.04.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 04:05:12 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: dmitry.baryshkov@linaro.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] edid-decode: Upgrade to latest master
Date: Thu, 19 Oct 2023 08:04:52 -0300
Message-Id: <20231019110452.1439488-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 11:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105598

Upgrade to latest master, which contains these additional commits:

5920bf2a756b edid-decode: improve GTF/CVT failure messages
e59b8a2ffd69 edid-decode: check for VICs in ascending order
5f723267e04d edid-decode: downgrade the 'out-of-range' failure to a warning
a31e68043878 edid-decode: add HDMI Forum EDID updates
2f19bd0c1d9b edid-decode: update HDR10+ DB
e48fb384fff4 edid-decode: add Filmmaker Mode, fix Dolby PQ v2 calculations
2d44e1b01c7e edid-decode: fix HDMI video/audio latency calculation
d740dde3540a edid-decode: update to CTA-861-I
915b0ce5329f edid-decode: print human-readable CTA infoframe types

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta-oe/recipes-support/edid-decode/edid-decode_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
index c1f512160d61..48b52eefcaa1 100644
--- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ef696d66c156139232201f223c22592"
 
 SRC_URI= "git://git.linuxtv.org/edid-decode.git;protocol=https;branch=master"
-SRCREV = "e052f5f9fdf74ca11aa1a8edfa62eff8d0aa3d0d"
+SRCREV = "5920bf2a756b2f748c49ff6a08b9f421026473c5"
 PV = "0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


