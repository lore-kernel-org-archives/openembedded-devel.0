Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AD5C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 11:57:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.18637.1713268643035146084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 04:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bHRIo+O6;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41892a751cdso5559205e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713268641; x=1713873441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aluU8ld314HWzdkg9ZZhDpXUQYrGtdmikJ+M7PvWfbc=;
        b=bHRIo+O6U3cyS8jhFBLiUaeRV8uFCTzYlHzTVp2DGbTo4jltl2H6d0CnG17pIeF3y7
         urm15pSa0Do7aclTRphppvphwUUcXhviR5PjbU69UWlGzDykZJoiIJWLpSDuYwLDKbVP
         2LlH1ZDmlQhFe3PcWkuchZ9difx1DqCm68nr/98Wx/WcollnRGaqdOs3xDxu5PsKgCG2
         ptAmvGc7fm9VG/+aUsFQuS1IQ5R1Wq5XO1oR2MV4HRWTduPhXgrRddQBItUdLA0F8lv+
         IImfLdwfKN0Co8Ud5a8qIwU2L8GDgo+sBf3zpgbB7+NRcHU/XSIgQTAw3cJTkyujkRIf
         Mb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713268641; x=1713873441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aluU8ld314HWzdkg9ZZhDpXUQYrGtdmikJ+M7PvWfbc=;
        b=wKxYMZI19fOfFNC3JTIvJB1nsAgunvOjUO7qzPGu2Bl0tCfvmDZ7KOurpBrQ3NlHBE
         jO5QQj8XDT1Z89Op3Mlqgxw9DCjtAGbLurKbT7Qq1LUxqE7jYJbjon44Ah1XwypuEBno
         deCCMDU6KGsOBBk27YYGwnNIabp0eUBEnP/uM6Xj2J4X/5nACp0P2AWYHGv4QDNlBMX0
         K+ELcui7u/ndDAyWrh/l3dnqkBNiQSG5touEf9Q/LUW/MvfguNaCP/IAIDwt1/lACDeg
         jo1YFvgvAl3912vB0pC9ZIar7drN/7TE1oVqke6eRvMQNmDuGT+MC6BslkLp8TFGt+n8
         p9qw==
X-Gm-Message-State: AOJu0YygOxpbdaHdND8PsuGKZH1k4BfxgydZt/xvZT9zVoQ5MPB1AL+i
	aglNbpNix0803SL6CU4ncO97Ar5HCjwIfAVTNU1OYFDKf6F/VCiOi0qUZA==
X-Google-Smtp-Source: AGHT+IHth6BMyAEPVrP4AatmcQt/lOjeL1DO30mhsqnzBQm6UQWiQSALC5JiTMaGSTR4+gyJj3R2DA==
X-Received: by 2002:a05:600c:511d:b0:416:643d:862 with SMTP id o29-20020a05600c511d00b00416643d0862mr11797545wms.25.1713268641223;
        Tue, 16 Apr 2024 04:57:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c26c500b00418176845ddsm1144637wmv.0.2024.04.16.04.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 04:57:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libjxl: drop -mfp16-format=ieee
Date: Tue, 16 Apr 2024 13:57:12 +0200
Message-ID: <20240416115712.3371635-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 11:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109976

* causes qemuarm failure as shown in:
  http://errors.yoctoproject.org/Errors/Details/761504/
  and reported in:
  https://lists.openembedded.org/g/openembedded-devel/message/109812

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
index 142b283614..eced6c7726 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
@@ -37,7 +37,3 @@ PACKAGECONFIG[gimp] = "-DJPEGXL_ENABLE_PLUGIN_GIMP210=ON,-DJPEGXL_ENABLE_PLUGIN_
 PACKAGECONFIG[mime] = "-DJPEGXL_ENABLE_PLUGIN_MIME=ON,-DJPEGXL_ENABLE_PLUGIN_MIME=OFF"
 
 FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"
-
-CXXFLAGS:append:arm = " -mfp16-format=ieee"
-# Option not supported with clang and its default format for __fp16 anyway with clang
-CXXFLAGS:remove:toolchain-clang = "-mfp16-format=ieee"
-- 
2.44.0


