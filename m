Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FC2C77B75
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:25 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.94805.1683499458037253932
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=E1JlfNCp;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bc3a2d333so5919263a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499456; x=1686091456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCSZn9YL97TGwLp3r//6n7mV32k7Zdu2knh/u3i5To4=;
        b=E1JlfNCp7MYYOFYBanYyTrt9tC1cRa9hXQMd/5yOnZtOHy7AsC1cnzottjlM30IgDW
         VsF879QJS8vQRpZSISM1isSMBI5JRVmdWYJCAgZhbIuzH2ohSiatk4P38Q8zg1sWSMmh
         EOfKAx7Id/LcZfUGwdROwGbkaw9J1InkI/eMWqEuNU0y1SImJeriQBIsTGY0PXxBPqPU
         wBLhxEhkjA6vYLVJzdPy9Lm/ippoB75fZJdVaeR+KYF6EoeK97PyvTFt3953+1FlfwsF
         YqjNlW/7drMtsVgxv/iA01+SvNOrbnQD+Ubw4Pu9Fm10CURBOm7EeoIA69T+qIyUZ9CT
         LThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499456; x=1686091456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCSZn9YL97TGwLp3r//6n7mV32k7Zdu2knh/u3i5To4=;
        b=BIATl+2jYa2FWI7iPrbYbbGM2QOmXNV8/H5AHYjVJrw01NfFrVatDlpsQFRnwXhqXd
         QDts96+/Hc6lXBSITVU5CaFHK28vSCPQZvynymAKOOyNV6Fnyd9dBNiyyL5D536JW38G
         ny76isuriWHZguqpXZq6UdZiBRzXus71Ki5MqSOAdPu0pnK82Q95WEE8hNCX+WUs24kN
         +TJ1jH+k6gwFvUgonY2m0p1RrPBuLa3T0P4hookNNclNHtSAnEYuGVYsReRQekWAHjUr
         QfmcQXrOlmSdFyZ/wQKTsUaf3Ot9NYpC8sFIhyioyPVYGrktpgDy/8+pSW0ihMrpwuwf
         aGlw==
X-Gm-Message-State: AC+VfDwBm2+AgWzZzdJAhEe0ji69f2KcaGQrTWB4mI7rkzAZwO7iq4mM
	gE8qvoyRiGO4Mw9ePkqNjDH78W0wuME=
X-Google-Smtp-Source: ACHHUZ58Mgdtkf7C4+2XLE+yKdrWuUI7dxWX708ud9CxYKopbtxzKNGMn2yPZodOIi2CFhqO5v+70w==
X-Received: by 2002:a17:907:7b96:b0:966:1741:c93f with SMTP id ne22-20020a1709077b9600b009661741c93fmr5085078ejc.31.1683499456375;
        Sun, 07 May 2023 15:44:16 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gv57-20020a1709072bf900b009663cf5dc43sm1586392ejc.181.2023.05.07.15.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/16] nv-codec-headers: fix installed-vs-shipped with multilib
Date: Mon,  8 May 2023 00:43:53 +0200
Message-Id: <20230507224354.1149327-15-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102377

* pass LIBDIR to install ffnvcodec.pc in right directory

* fixes:
  ERROR: QA Issue: nv-codec-headers: Files/directories were installed but not shipped in any package:
    /usr/lib
    /usr/lib/pkgconfig
    /usr/lib/pkgconfig/ffnvcodec.pc
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  nv-codec-headers: 3 installed and not shipped files. [installed-vs-shipped]

  when libdir is /usr/lib64 with multilib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nv-codec-headers/nv-codec-headers_12.0.16.0.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb
index 5ef7ead810..4bff4f24b7 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
 SRCREV = "c5e4af74850a616c42d39ed45b9b8568b71bf8bf"
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
+EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} LIBDIR=${baselib}"
 
 do_install() {
     oe_runmake install
-- 
2.40.1


