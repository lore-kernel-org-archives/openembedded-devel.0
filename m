Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE57CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:42:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.17045.1759323926145846643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IIR4f1Nx;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so9983485e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759323924; x=1759928724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=COkvJxOZBBMleoDVDJEs4xIzoIx0N8zpbzaAIKB77fY=;
        b=IIR4f1NxG3oO+gAAGqFC5ZY13CBmQoFAeBi0JSqN9n2XVD8q/eHEaEgg1jsgr9bd8w
         m3tmhSXHUemDTHaufAfV9T5md9nD9sTysfKGPUId4vSx8hZ62WKfGxhRsFnX7yNSM4VP
         BDSYYJ6JtSl/ns7fmYOMQT8GLAp10CUTEw5LX5Ju6g/gtuworMjL0VHOKUNSDwCXuDRK
         Z58JAhy2oWLopjWrW0kaeti4n0NBvIVW3HdxSh/u2BRRXvT460Xc3w1qz16TIM11ZT1p
         Ka4ZNg9Qhdfryl6FACXI39ByU0giO5t37St2+J1L1KN/A+wbmEfP9yQwWhgruNbPfqq2
         U7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323924; x=1759928724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COkvJxOZBBMleoDVDJEs4xIzoIx0N8zpbzaAIKB77fY=;
        b=sdqXeqOydj/wA38QXCLYhq+11eaooZmegFqE5gop5dOQJYAU5iBqDXguE/X+hqW8Rx
         BVSvfDY3SZ8zxC7RgEPjwVWjO8PB3DtVyQPjZOKFBeKA0+sAwB5Jw4D1+WQMqnEYJGm/
         3zBP1qqrGBz9uiMnOx3GzIjyx+QXRJ7tR+wwc/a0OyD6MFsg0s734of9h+HlJLzn9vxZ
         JdTWHO6E8ZRH9mpQXj5iiCgLwA8lHDz2ufz3SEeQ0no/64FeMrEgAkxAPUpLinhNC7LY
         0KFVXB0Vr2WjQLyDJm8CkzGo45c+o41dnwbHnSiBDYvM8vM+/RKRQHVWUiRNLPHMIH8w
         4YYw==
X-Gm-Message-State: AOJu0YxCSfnfH+mXMof98P/bFNrS186WC/kLDd2oC5toYOHM/OG/8uV9
	MSaVVoCRgPoOTe3GIcEIyJ5c7TOXEcnzbg67v0Ere3px6CPd3i2PZ86PSYobz5Ns
X-Gm-Gg: ASbGnctbMQpWAXUnooQ+aJtSpljMM6COcGUHRNe887Y9txi/K8oMsYKdl+7mK8nRRis
	QL0oHhnS8NwOaXN4ftPNuHDyUqMF3SkAYcYxN4fG44yUfSkU6R5ByaTw/qZZEGiZuAXuoB17jvL
	6n1qJuVhxO/cqotQUuzwYvaqnAYpubnIrfJKIvLEzitxd2rVDeBDbkvKiG1h5xfUt9iP3KCkRKl
	xJ3Gn8l16EnfYiZEg/yr6YzWVS9gPVpBlKg33jPWyetmBmnTwTxOx5eZQNMHxYfeh+pNyjhpPEi
	Ynu+QeSXQiYK3oYe3svXXEGgIigJhG0ItR3sW3vuUxaumr7FPAxP31jIxoh/7kNPyxkMArR9xat
	ZDFzw6HGRvvNDoTVEcdBSWwmxNvk0OKgdK6bkxX1xFDgtXWXv7NeK1AhusOrElhq6RVos2olJMt
	FedqtRGoDvu4kwAihmjy3NTwRcLy76ngFi6TI+/4cLFmtiIg==
X-Google-Smtp-Source: AGHT+IHhy9ReCE4NTYbAEpzCcEU0qOlb/6qlgolx/qhJxEU2LfvNXVc9ML/xzGd46nJ0swoj83I/eQ==
X-Received: by 2002:a5d:588a:0:b0:3ec:df5a:90d with SMTP id ffacd0b85a97d-4255781726emr2733119f8f.60.1759323924142;
        Wed, 01 Oct 2025 06:05:24 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5602dc2sm26867527f8f.32.2025.10.01.06.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:05:23 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	joao.lima@hbkworld.com
Subject: [meta-oe][PATCH 1/3] openocd: bump the openocd, jimtcl versions
Date: Wed,  1 Oct 2025 14:05:18 +0100
Message-ID: <20251001130518.1069-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120110

From: Joao Lima <joao.lima@hbkworld.com>

Version bumps:
   - openocd: 91bd431 -> 66ea461
   - jimtcl: fcbb449 -> f160866
   - libjaylink: 9aa7a59 -> 0d23921

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 559fe29ff8..2c07273940 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -12,10 +12,10 @@ SRC_URI = " \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "91bd4313444c5a949ce49d88ab487608df7d6c37"
+SRCREV_openocd = "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
-SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
+SRCREV_jimtcl = "f160866171457474f7c4d6ccda70f9b77524407e"
+SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"
 
 PV = "0.12+git"
 S = "${WORKDIR}/git"

