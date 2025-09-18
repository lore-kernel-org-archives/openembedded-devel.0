Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577E7CAC5AE
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:41 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.9924.1758189216821181659
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VOu+dQ6U;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62f92a83e7fso1680895a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189215; x=1758794015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7QdnQMt9xg60UZnYUJo4yXylSR6AllYUQuVllnZ3JU=;
        b=VOu+dQ6Ulb9I1Vd6rkLVb9fjd66rm3vGq0tVGMHQ+sHciYQBeYg06ctQWp4NP2MAoS
         FcQmmw9zq9qaqF9n+fMK0Ni5b4KY2KLPN7+FkS3O3OhcHG6SYPptO+16SjOsh59rUOw9
         jybPOuGd/gadCQVenCr0P6Pjq0YJ7zc3o4EortIpM8j+ZQMbQrHshSvqPl7AZoo20Hn6
         PTLV47x0bKP5coS9DsNcAmeqjm4EQca2NN6qO3LvgZWjJTyWD/UOv/5NGVDxzilJCflo
         dibB5IiIAPtxIdIl6tiIqaSqqEAte0X0i9IeUzPDju3Rit0ZTLZRIcG5y7BsAugz1Rw0
         /d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189215; x=1758794015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7QdnQMt9xg60UZnYUJo4yXylSR6AllYUQuVllnZ3JU=;
        b=JDZvz7xW05WKfculkUmw9GSnvWgCk4hyRGEqEGk29Cuglm4aB1qz3nTCH8KvksgELO
         dmEFT6lq724vSEf6wy9JfjryWceTCFJORYB3n3n0VwA2CN89O9levzRvrlqFYyMeYSMO
         4GcQkoBqMD0vqVF85Mcwduikl6MBkMdq/qOcza87Fy2uC2yl0k/CNaBqs+wElE6xJN7Z
         BNfg+q/IKUx12LZl9guKP+I79I+UFyVkDBkT32zKZORRes4wokpogxtycl8uEu7Ub5SC
         WiJcPMMLuSNhMEpe9noiDw5jN4XUlLimMUMH7+1hRAAzoiRvCE++OIkhUrRr7y1ofZTj
         InpQ==
X-Gm-Message-State: AOJu0YxCbSB1e/M+nw+UVrZU7VydlAenhs6Uxqf7FeEkTi3IDVE424O3
	qOW8XZOdJ/IgW4/qfNruKNA5q/5I+KdCUwSV5++F3LMVgaPeRrhkYXBuHiEhPw==
X-Gm-Gg: ASbGncvfEQC3LP6qfuK61HW+u2wkCsc32CPDxQdGviESungVKK+CjILBtTn8YoC6yHM
	3x+Z+n4OufSUof08B3mt6hQUSOc0b/8RHGfrL1u7tSM3bWAfGuGqNUZFT/O8o3PAsEwGP0wcjJL
	Cr+BcvM4rlVwWfozCYuE2mKugRTP+QEw0ScKGC5DQU8rq20ri16FFNNyyetMH+T93wELROuf2W+
	HHdIWIPp5zeu/FAmcSrwv+5xqhvJ9qBh3kULl5DbCZtoqsZFgQLSKBNMmr/dgMwus5TEWEuP60P
	V3okWWCw0+jwwN9IwM5evx/z/iu5Et7oR9QMzn+Zp68Pto0pSz+mL/8V20gm/vQQAXVXkiO7ZiC
	doxE6XVPrVd/zS/VB/BFvhttncD2n3DdsaD9Ugqg=
X-Google-Smtp-Source: AGHT+IFf32AQUBbh8b19pO9asPGX2aBCWhoHVMi6VoUDsF+rYHKpyZ5Q6zy0u95UpL7GgaOVNorBoA==
X-Received: by 2002:a05:6402:20cc:10b0:62f:4d23:2e2b with SMTP id 4fb4d7f45d1cf-62fa2155c74mr2155131a12.6.1758189215116;
        Thu, 18 Sep 2025 02:53:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 03/10] cpputest: add possibility to build extensions
Date: Thu, 18 Sep 2025 11:53:25 +0200
Message-ID: <20250918095332.3369767-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918095332.3369767-1-skandigraun@gmail.com>
References: <20250918095332.3369767-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119544

From: Peter Marko <peter.marko@siemens.com>

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8c0402f7c47188cef1d6afc68c0427124940ea57)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
index 921143a74c..2dc53ea8df 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -15,7 +15,9 @@ inherit cmake
 EXTRA_OECMAKE = "-DLONGLONG=ON \
                  -DC++11=ON \
                  -DTESTS=OFF \
-                 -DEXTENSIONS=OFF \
                  "
 
 FILES:${PN}-dev += "${libdir}/CppUTest/cmake/*"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[extensions] = "-DEXTENSIONS=ON,-DEXTENSIONS=OFF"

