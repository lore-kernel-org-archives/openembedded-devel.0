Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCF4CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:21:05 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17727.1763014861382288605
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GgNms3ef;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aab7623f42so557780b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014861; x=1763619661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOv2BEEeRatK9ABH8zx2iD77wJt6MrEs/TEeIuSdeNM=;
        b=GgNms3ef9tyT4l1oBaLdieHmPjKjzqLYudqlMiOlDYs4BlvtvJLDV+X1YjSb3/Q0++
         9nJBjiu4oKmIj8Xkwtwj/CQlsdoL0rTnF7SCSqU+ItiAJJhpxmXGvaH9gwo75POusjsV
         13Lt81y5akiIW2uVNdXj2Q08bGv2OZR0eW81MN7fUCvqdPdJKXYvcL88flrSnGfpGGnu
         5wLVj7ITKOAgGdUr3ouRNh/TfftMTslk/iSwViBtxESr5QtyC0j7Eq6/Nxd7w3CUiy27
         9Y88vzuhAUO/poCGIuWjA7BdRdIT1GzbZgc8u1ImoYuGUssZZ8vnPzLaZgnyYTWzDqjX
         /dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014861; x=1763619661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xOv2BEEeRatK9ABH8zx2iD77wJt6MrEs/TEeIuSdeNM=;
        b=Jcqc9FWHhtqi6p14JCqOM6lkSpGS/rilDJ8Wp12ue+hCLg1mFnSDs9JOuVD7Md5/OJ
         /BIcI9G5Wx/+/gEMSXvx1COjccSZK+xvB6vcqjer2NJ2j6rjBEJKKn7gMqN2crmGj3M8
         EKkTaVwZoQIrROHtBSv7mMyJg8uAxm7WtvxfT/k9Dfpf89Dp+VA+F8bJJ2+FysMH0Scv
         iQ3r9xs/7r9dF+NBzGBOBihBA84pfM/KCqxLbcE73x9e9IzlnW2nYK9ej9j6ZU7G+sT0
         AqPwUAx3mutPPnQMKh9EFdSau+3rEv5d5QBcK/EFemAspXD0dh1n6/VlmGiNaN9X22lH
         JxzQ==
X-Gm-Message-State: AOJu0YwCEs8YqJFmzv/KUI5UZJzfp9TkukGK9m+3hup6BwkaBz74nFKg
	3P1dmB6O52VR4QB94z0dm83jN5RgTalXb5LLRfp1cv3D1XdyqkqtDDlKZdOXqQ==
X-Gm-Gg: ASbGncvi6g7DHbz75+m08ooVHm+YoshPxjZuAI5rkH4FRC4K81mn66JCLGlgX/seWax
	xU8iLRguYoVdfDcTqUjHjy8OLIo4CM09L0gWFm1a19MWpnMIFkKBD7TeBAKnsTH5jRzx0ag9taD
	c4LpuOnr3YKjL7cIp2N3AREshymSmrswRUZGKCHvnKUPkSWctHrLzn6gxqpo7es0sEAOmvShmr5
	IUD90o+2VUEVWS5KRR3j6npVAHuNFt88IGcFf+JZ0TtU8aB/AcMaIL/eRrLRxIk5T1NfVlhOJI8
	jgII8MgjumVpidO2DpE0ON8dbeuJy42ajwAEI08fWxSrFeSAzBmyKO6E6k5t6HgDSsHrZ3Zj0pE
	NaRGdiDnY+nR1Sk4Q0TbHeBnfdHL3RsJX2R3XTsnSxgUuBuyCSCv5b07dAbVSFCM9eM+mDwSMpW
	JQqGspf8Za33DzCQ==
X-Google-Smtp-Source: AGHT+IFaPnx20bGeOrOha8YjJ2JWrh/9dgkP7iktQdmH/nYJgamM+UzGwuODi53qxD8slE+8BqWKlg==
X-Received: by 2002:a05:6a00:22c8:b0:782:5ca1:e1c with SMTP id d2e1a72fcca58-7b7a46fe203mr6790219b3a.21.1763014860586;
        Wed, 12 Nov 2025 22:21:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:21:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 31/38] feh: upgrade 3.10.2 -> 3.10.3
Date: Thu, 13 Nov 2025 19:19:06 +1300
Message-ID: <20251113061914.3756301-31-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121629

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix feh not respecting aspect ratio of thumbnails that are smaller than
  --thumb-width and --thumb-height
* Fix --no-recursive behaving like --recursive
* Fix rotation by 180° corrupting images
* Speed up --sort=size and --sort=mtime by caching stat(2) calls

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2775cdb58ce2e779e7b72e1b917769abb580dbbe)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.10.2.bb => feh_3.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.10.2.bb => feh_3.10.3.bb} (88%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.10.2.bb b/meta-oe/recipes-graphics/feh/feh_3.10.3.bb
similarity index 88%
rename from meta-oe/recipes-graphics/feh/feh_3.10.2.bb
rename to meta-oe/recipes-graphics/feh/feh_3.10.3.bb
index 2c38ce614b..5ab333c60d 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.10.2.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.10.3.bb
@@ -9,7 +9,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "5f94a77de25c5398876f0cf431612d782b842f4db154d2139b778c8f196e8969"
+SRC_URI[sha256sum] = "5426e2799770217af1e01c2e8c182d9ca8687d84613321d8ab4a66fe4041e9c8"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11

