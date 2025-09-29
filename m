Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD230CCA468
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:45 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.53212.1759151083390694577
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DmWFIr1+;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6365c5704ceso152700a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151082; x=1759755882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNmXTEuH/dkDZtVweB51gqDuFUJNudbE/xWmdrJtjtY=;
        b=DmWFIr1+bXBnsy8M2eFUW4DSQ2bbf+eBToyx9W2ryUqJQdOielBAbMbx0At4GyYCTp
         91GcOLJPFSP7ugqB880NA+R4b3c6SOs/yeOW9746r4tPpqmEBLenozTJMv4QF04YEZf0
         BwGC9VamrE2XLFaiVJdaWMK3cPBc9gqJbkXthgBTIFF5d4r7itup/qS6dX2CU4XTAE6f
         vGIfOU5vBH0B1Lbe5tOoXP0JH9Zs9uxyQaNrpkU1rG2Kw2L4FW4UtbLKknCUtnAAQbA9
         xubWb0UeHRXv948A9BmICSHLuy/R5NYNAE31+5vbPNl/a3Jshvb7VGJWIshpbI9Wnhg7
         9NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151082; x=1759755882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNmXTEuH/dkDZtVweB51gqDuFUJNudbE/xWmdrJtjtY=;
        b=kuPnzvo+bpkdyx0NDs7/ZPOK+8R2lQRcUqOjA8RTcio3Y0SaP/9w4hHkwcNMxOEeXH
         fUcT+VyD/JEbr8VHztAhwoOJf0YT44GRbFXdGfZINO8vMR/5o5rbAUwbRNqAFODsd65T
         q4CtT/Kv9nZ2va5j89jAT5iYSDl1vP2O4DcmEUIBzqpWLtfu6QNR89gXs5rzgD/GuPmS
         /o13Xw/PsVUn4RsArEJqeBE2mw1F9zpK5qFo85YZbSGZrPZ/YC3WRPfuRhwVZJ/kTXNd
         2gsk+vNu/fyF0tlQREpuNDxQIl+SjblJzI9t7V46KUwWCZrwB06G+FPhVKEcYT/v3Mmi
         YYIw==
X-Gm-Message-State: AOJu0YznMSiHOpKtrWuQKZ3Phw0p7rBX4nQ+16MKZkvMyqLyRUy48nhL
	J4U1x0j2RhA0lFMTQ6W36HCYocVCL2GFa9TkG8k5ewuMYg//iAvZ3CxiYiI/uw==
X-Gm-Gg: ASbGncv2Y3HxSZIHsbrghO95pkJbSiW0T5W9f/TKKaHF01LbCB/sd12rhmqUkcu0HCv
	IEAzhvgCLdrtlN39qjdL6soQpoqbdkkXmPnMnRIcIEONQG7+qhucoTfvz979w2IfPat3Idc64SB
	of6JilnA1bhbECR5FTiOve93edJC5OYHK21BM0xgtK8BvscoXL9KYD7som/Z647RfQmh/6zua6G
	IFBV1Ai3sNiXjpigxzv4psLz4Dn+0FdWrJ5/hAyc7b4/Zdo/RAJECn/nBl77e+FD/eKA7m++C+i
	gKpbaws9o97iVvlso8RTLvb7JtKXQMWGisLVzfP5vdZXJ+ZhWFHH+5DMZdPPJaSlulWoF41MNiy
	ntxHEgTkJNwIPTNgtsMgG
X-Google-Smtp-Source: AGHT+IG726X6mJTEyMC8sYuUb2SILiVLq9OeFvZPu0O0+88lFRcHQQA44yHqeuUKe5BRsSmWwBcuuQ==
X-Received: by 2002:a17:906:6a1b:b0:b3d:73e1:d809 with SMTP id a640c23a62f3a-b3d73e1ef65mr544541866b.48.1759151081482;
        Mon, 29 Sep 2025 06:04:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 16/22] iwd: upgrade 1.26 -> 1.27
Date: Mon, 29 Sep 2025 15:04:19 +0200
Message-ID: <20250929130425.2912077-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120029

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
 Fix issue with hidden networks on connection error.
 Fix issue with directed roams if already trying to roam.
 Fix issue with checking for connected in FT frame event.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f359e3eb01cc0b1511569573062c40909db3ef6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.26.bb => iwd_1.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.26.bb => iwd_1.27.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
index 6248850413..dc29bc3fd5 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "0ff4541c2b7f14ec010c3cbd1f02350f1b58cb0c103412db22550e90d8040d6b"
+SRC_URI[sha256sum] = "013b4a0a79629c20d915954fc3b5d0620ef6e0d6065db3c342f4b3f9111f46ec"
 
 inherit autotools manpages pkgconfig python3native systemd
 

