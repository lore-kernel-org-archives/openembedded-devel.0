Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E78CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 18:16:36 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.365.1761329787860574935
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 11:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fsquENxh;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-781421f5be6so27366577b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 11:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761329787; x=1761934587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHILzbCHNNWezJMbvjhCZ5VBewBvSYROPpG5usoPqb4=;
        b=fsquENxh8jzOJOHGagGrJy0nVbQTkCy9tiwYHgc+jH+hIX+UB2vBDTbVsVF5zXc5SO
         D/GMRCiSU7qVAT7gnRYwOz5VOYe7ZEL8uH0cS5b2YOhsZPn/Dirxui6ln5SETvond2gM
         hIznz26MXv85Ud0+AJ1Wg9en4Rm9dlTn9sEnf2p48604xSDCxgK0vSRmlXWK9TY2dh/h
         x0I9fVHBRYsfm9zZ5Zfq/CkCc8xPAOLx5FDJ8nErctGikjSIL9zcxuisu+URNkYQ4zDT
         B7y9lzRnsyX1eEXqQBMi55opKw3by+O8l8DDQ9JClTKZeA4dbsrGHNld1fw90ZSFqEMr
         cHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761329787; x=1761934587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHILzbCHNNWezJMbvjhCZ5VBewBvSYROPpG5usoPqb4=;
        b=V4tRtpQ1aDC5Pvn3/Sw6hlACayvTB4/ugc+YS4UPimhO3eUI+vL1veZLgikunRyTuC
         aVBJrNay7J690LQlgIpk67HcY4eRCq11qZBmxdjA6aBClrmOdyVDLmRPOWy2IJMhmy87
         RwuHnlghqc8YcFX4n19OZIOmRoSYFaIE1yrsmMskjLFMl1sUH5Zs10Q4clBTRGPo60d9
         5NaCiqHS3cH/G88sb2e2/1mhmmuZlzvU7scP18wsTihigCSFkjiqVmPHm3RdFYdvLWVA
         /PU7aWH6okwg1wgrtTnY9aC0/6et8LhNm8ZyJ+xLpJEy5pzp8HzfNl94gF2msB6hLKTC
         G5jg==
X-Gm-Message-State: AOJu0Yylp+RjX6/3dU5wlhzqNAugzVYyPwjdcwrBNdrfsNDHuJG8r9aL
	TOh1chFoph6VRJzNQJ5w1RQsY/t7LLVqshT/45zZ2qI1a2RHmuiHMsqEf+YZaQcF
X-Gm-Gg: ASbGncumMEdUh89dnJeBw+s8poBptgRRXJuWn/XoXIgHriLmYsuSqleuS6ejBiOrQj1
	h6DGcYZvm7zI13PTksjAuP1jvAFvsi6RwlBmGkq62XVf9YD1BsTNqeR//OqjNN7i3yy5ZjbNk5C
	Zffym8GHkaiQYJ8ZbA2kJGSptgwsFuyGQoolKMjjzC50bO2o/c9JtTJNQ0iGBJ3EQjAA441iTV/
	dRWsgSU+CzbRxLuy3Fpgt3vdmOzeIZ1uLw7ACRFn721/wqBuODy/WSoBXfjgXsQxfiD4e9LGC3K
	34ty3ztuEjXNJyqYINq0XP6m1/QTBNuzpd0RSPS8+ra74D+ixu6XlxMbmBW0Wtn8bS9v+yhXrfi
	dp+c3AV2wCoyyO57c/Ko2XfLctikUqBprPVxQi99mxac35IxNCieP4ARIsAGlpgxBSHdmQb9bk0
	exDIJiDOAxug0rlBqqwMAshrjYgccnp9T+FtGVWkpm/A==
X-Google-Smtp-Source: AGHT+IFnWuyChgKAZ1CNlIm75wX+VP6FcldU68oQM531Aj4e6rRO65QubPIf4kwwJA2UQI2XPmCloQ==
X-Received: by 2002:a05:690c:6101:b0:762:772b:917d with SMTP id 00721157ae682-785e0231442mr23973117b3.49.1761329786485;
        Fri, 24 Oct 2025 11:16:26 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-785cd6eeaacsm14728927b3.48.2025.10.24.11.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:16:26 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 1/2] libdevel-globaldestruction-perl: fix homepage
Date: Fri, 24 Oct 2025 14:16:04 -0400
Message-ID: <20251024181605.120814-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 18:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120970

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libdevel/libdevel-globaldestruction-perl_0.14.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
index 1da94516eb..1541751d63 100644
--- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
+++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
@@ -4,7 +4,7 @@ WRT finalizers because it's not ordered and objects can sometimes disappear."
 
 SECTION = "libs"
 
-HOMEPAGE = "https://metacpan.org/pod/Devel-GlobalDestruction/"
+HOMEPAGE = "https://metacpan.org/pod/Devel::GlobalDestruction/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=53;endline=55;md5=935dadb9423774f53548e5cd5055d41a"
-- 
2.43.0


