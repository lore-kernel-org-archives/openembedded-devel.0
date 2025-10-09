Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4482CCD18D
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 17:43:18 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.6488.1760031053853139800
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 10:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ChNNpNHw;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: joao.raul.434@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso2243986a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 10:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760031052; x=1760635852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4oGF0k8vKmAt3wFYPmCrbV4LN5j4GJQfKM2K9UjDmk=;
        b=ChNNpNHwjnQ2sjRJGMsPV4o0pN/pvpLT6hFMqpOfkG2puGBW7XQm4kGGBhcW/j2Szm
         7F1CQXjRK8keRW+pX/itVAJUjNLMssZ5wKfS4MbWDW1EG67sPKv8/Efh2yn/5ij067U6
         +zfqQuNJaTIBHotkvBrpYW2Y5PmFyO++AVSDN4fTZKNSVbuHzCqxg9DVAp7NdUlBcEXS
         s7QTW8AdUSiV1MdEMGoxuRsAb15TxFdeVFDa/9ZM0glvT7xpKDnDchW2cQTtHMCqDcqC
         VzwdO39bvU1XBHsSeZt+LL/yaEjl80Z2Pj+5k6TYe42y5uk1FvYsSd81+87AcQfoQfB7
         qwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760031052; x=1760635852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4oGF0k8vKmAt3wFYPmCrbV4LN5j4GJQfKM2K9UjDmk=;
        b=LH6BHamEkRa0X7J3eVVUi3KFNjdCHeiWwodMoa0D3wdj0hB/L5wFuH0NElp8b2jG85
         5csiYPdLAFdcEx1sTYH/Tu86yRDyGOLa/qkzI4h6Hnoj1tn5oBeQHHa/E/tQ/YoV90PG
         x6wuj1NEm1hVYSMwiAKqu4NDtmN+qYXOwt5+L973heTT7rJ+m7ZIFDQUN+CC+5jFIMgM
         AKdzht5gDAwTW7yq4EzHx4Z+WoCQFZP8ZCLpDHhxLjVONBUDpx7Q1Sp9Yds5wfjJ9nbZ
         KjOPVGMZMBNdWyazQvZYzDW6yDgcD7jAC1iQaIYR4jhl5Z+ZJhkFPHcJ+IurMn/iNyG6
         GdIg==
X-Gm-Message-State: AOJu0YxREzR2pgkb7KL1UG42uH9HFX1fYC7HJ0Sp/+EVNp7pEmVxw7w2
	35VY+QF/vOpXA6QmWQ1fiFJPPsAax0CyrBuWNuOLbmKN/VWI43Na3n1V8/ri5w==
X-Gm-Gg: ASbGncvH4oW6dKlKwRqGuWUaD+V9x2VwATFCq/81Ch2Ph/2ggGSHuVqMErMO79kMHm6
	uWFivEolZVcYgi8rdF4nS5pKtN5PXZeOMMgHk2FOPqv7ykHyYR3cdUdk+lFi35MOoJ8txoiMpK5
	+gJIqxorNNOWY7HSl44bpu4fXm8ItXaqkg3OvNv9vpnh4Dbs1/WXq6sW9O6xYK0YtTNqdTq/Hsy
	/yHIL0zoF+80KJ24pYb+vd8YvICsaPkmbM5xf0yAiDl356Y+QUw8y+VMH1fobq71bVg4fBAOm88
	eWAC8tp8uasglzIknineX51NVvtgTEfavTb36d/R7T9CxZueZh/CMfvW+BEMXGvnFbzJp4NbQ7n
	OSwyocx4Vdn/XQcIBIbiQFohmct7AXZP6/hN91DfuV0DcNN0i2bLjXjsL6qcOnqNPkmII9yeIjr
	hBLrTnjbPkqXMkCHP/KUQ3S/BDpSu2orNKVoOnsMDeB9Lf6wMBuLx7+A3+
X-Google-Smtp-Source: AGHT+IG3eG7uJviR6HzIgrgGwdGrB3dOE/yX0BhpNuhR27IGIfAt2Ca/aGFop2xlaEL2lr9ZapxKsA==
X-Received: by 2002:a05:6000:26cc:b0:425:8134:706 with SMTP id ffacd0b85a97d-42667177f6emr5850467f8f.16.1760030680003;
        Thu, 09 Oct 2025 10:24:40 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582581sm51681f8f.13.2025.10.09.10.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:24:39 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: joao.lima@hbkworld.com,
	joao.raul.434@gmail.com
Subject: [meta-oe][PATCH v3 3/3] openocd: add fallback repository mirror
Date: Thu,  9 Oct 2025 18:23:45 +0100
Message-ID: <20251009172345.1026-4-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251009172345.1026-1-joao.lima@hbkworld.com>
References: <20251009172345.1026-1-joao.lima@hbkworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 17:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120438

From: Joao Lima <joao.lima@hbkworld.com>

Add a fallback mirror for the openocd repository fetch
process, so that if the primary source repo.or.cz is unavailable,
the build system will attempt to download the source code from the gitHub
mirror.

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index b0c509988c..fd95c9b84a 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -4,6 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=599d2d1ee7fc84c0467b3d19801db870"
 DEPENDS = "libusb-compat libftdi"
 RDEPENDS:${PN} = "libusb1"
 
+MIRRORS += " \
+    git://repo.or.cz/openocd.git git://github.com/openocd-org/openocd.git \
+"
+
 SRC_URI = " \
     git://repo.or.cz/openocd.git;protocol=http;name=openocd;branch=master \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \

