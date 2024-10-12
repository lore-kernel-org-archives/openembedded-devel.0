Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EE3CF2573
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 17:53:41 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.15694.1728755616766060748
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Oct 2024 10:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FTxw3Cwd;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso94948b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728755616; x=1729360416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XaM01S2oBSyLHUYvR+B3z4BkYKvy66eUNWo3+8sNt3I=;
        b=FTxw3CwdiL6wvLjnwLJt9iiqPa/81yldfIsAo/1UAPVQvnp2SbuhVqQRQesQPxxEDd
         enBCtkzI/F90RLWffWtgImXbV2i0/mEzjcSjAxMpdSzPNrs8IGRhTWZaenSQQiwBbN4C
         7r93oosiviIiAAb1kjRCUzU8edvP1uw7eh3Qcy6mw3UFs1/j6ztafa18JGSNAdmSRQuG
         hWs/aV7QK5ANAAfUfo5emNZZNBxHI3p+VaHNbwkNuf/CpNLX7d3odUDoqsbQLRUDuKJv
         86HhECYk4jBRPfV5Mdi2zNyog5FgDlt/1okjDfrEyGFcTPhowj84Gbb95bCy6F6A8hWY
         6kTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728755616; x=1729360416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaM01S2oBSyLHUYvR+B3z4BkYKvy66eUNWo3+8sNt3I=;
        b=a8VerSOQNg4pdSxLBSeMWbp2384fnArDl/X+qR6HfsXLPPiULK+LUCEw4nD2daaBKa
         PNiTaaB0zywzDXtGGpZOJHNhARae5iMDuPeiwdE2hgmkrLdYu0I4bzzsODjc+3BJJ3mk
         NJ3Vl8ycc24Yowl2iEkn0/TSMZczKa0zGFFyizycKMiexjXaVj1sY4nj8HyhCk/tvpdX
         1Lgbm/nC9kv00Eg5pCiQNKBoe7XH3Q2/DGzw4ByI8bD+LH7Bseiz/tWNGGs8MQAc9URc
         rD6+twuZPRZKt9FERqVHQ5ak21Ho0qtJeAKAUPHg9obEwGT1WSA9JmXM6HkN6KfiDoae
         34kg==
X-Gm-Message-State: AOJu0Yw5secVlK+uRSJJqqcTwYCTkieXa2OV2QzaJlPncRDEU6Tk1yVD
	8NnQR1cC0NIIdU4F6C+61SLdQ5oOGvj/gvnrtnnfgDkcbez23WDbGDYIexq5
X-Google-Smtp-Source: AGHT+IFiWgKmUUUdItK4UcuGQan3XADsYDkp+xYVTAzOn+n+ROeB72Y79m66S0ZCMScK2PPj3AdlkA==
X-Received: by 2002:a05:6a21:3984:b0:1cf:3ced:bba3 with SMTP id adf61e73a8af0-1d8c9699b05mr5139625637.36.1728755615819;
        Sat, 12 Oct 2024 10:53:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c4a4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea448e4147sm4160936a12.5.2024.10.12.10.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 10:53:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] gstd: Upgrade to 0.15.2 release
Date: Sat, 12 Oct 2024 10:53:32 -0700
Message-ID: <20241012175333.3771470-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 17:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112832

Changes are here [1]

[1] https://github.com/RidgeRun/gstd-1.x/releases/tag/v0.15.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 87792491ae..43b82526dd 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c71b653a0f608a58cdc5693ae57126bc"
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon libsoup-2.4 jansson"
 
 SRCBRANCH ?= "master"
-SRCREV = "a011affa67f240cbc7aaff5b00fdfd6124bdaece"
+SRCREV = "dac03d5e4102080a8f3ef274a6a6583455962095"
 SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH}"
 S = "${WORKDIR}/git"
 
 # Remove the +really when upstream version is > 1.0
-PV = "1.0+really0.15.0"
+PV = "1.0+really0.15.2"
 
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
 

