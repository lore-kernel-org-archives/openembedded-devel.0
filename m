Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F3FCAC5BE
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:16 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.6908.1758954789713238188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vte6n0Od;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-8936326129eso103280039f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954789; x=1759559589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2i6OICCj4UALK+UnEDGABHzROIX5/CqcTgxRqDW0SU=;
        b=Vte6n0Odt1Bv4gIwdFcHJ/T1y+n07QOi4wxZJzHJsggL1/caSFcnUsa2t5mAYbcRJb
         bUYKZaP2THrFfiXQr6NXEgvDlA0/cBnqDh2LpwJKGpkPCb2IGH/0pwHy9tZIACZdfTi2
         sm15juibp954x5Zl+e2Tn0nS6saCin4R+ML9BM8OETasr6CO9o746czM1J6hhTu+4c3M
         3xEbfb8pqP2XOUBuMeoDMh099JqHhV6V5q82jsRAOF1u1lRhqw0/tQepEMPLeiVxpwaa
         m4xo9Li7mz33NAFCR5aDxN1LwrkTSa20yv+uMQIGToEJJxArjPeA/TvVcMaIWSBoZlgM
         F0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954789; x=1759559589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2i6OICCj4UALK+UnEDGABHzROIX5/CqcTgxRqDW0SU=;
        b=KLuA319ZSDmy6a6wbR1KGEHzpUpVka8qKpw0xIrgGXW5oTFQY1qZlr195g+YH84yUW
         neBG6RuNmlbvBvwe/Mt/ssUE/KDRu/hzY4lNEYgys7nytmOcGezmKtPNvk/ade8pf98j
         m29T0xR5iFDIctO2sUrEpG9pRULfqFGsp5WF+MLoiLoGKONdcFOLuvx+J3H4tpY9/jSs
         2gjqn2HLS0ZdAlHMoKNMLp/06ypX5kB6QD7Elj1oDeU2mq+/4MDmTErwNtpEfR3/M+0X
         17gfJ6L2j30cEBVqqgrXMCeIuSq3D0wyQM49sQwGKNEPQoI6msId1hscBX1tIh4PABAr
         ArUA==
X-Gm-Message-State: AOJu0YyAlvoN5G7TpMNcndp6NNWfmHO6BWf3ovatA7qzD+pBG2W9jfhS
	kqpDtfrkJrd2KtmkIU9KzM/10piVQ/RfL/ccVZi6xW/+svOrfCRYGCyo58vY2NLH
X-Gm-Gg: ASbGncunoFz3MjHqSojZtthG3iRkCbhNVSeVhkN+z6VrG56Tf/dol6CNNvcDgbtYqXp
	ROmpkP15rWE8mj7va5gZJIJxJ5yRG6BARbXR+FWxuJiOv9Abu0j6Lw8vRQfXsH74Z7hpmM3dMvc
	AcVRwXJbmyxP+k16TBFzw1o3lmDaGhCmNnGMzsFkmPs9YIpe0rRIF334joKCtlEGB6LmyTaMFEq
	p8ArbfNDHkwrrTbuy2eedsYseVmwQlH0aOgEA+z7LZgjYdChkL90cT7h+Gz5yrJNXwrENLxTpuv
	izpW2iUYIEA8jcbIBf9QtEEvwCC4VXhllUiifI0ON2XOscjilQ3K29V79rd9k58iYeA5tPxHmWW
	4lpQVLLQDVpZ/DaH/iOELUbqvXbFgA3LSxYgyPZVcPpvQ18KDa5Q=
X-Google-Smtp-Source: AGHT+IF/VVgCScyIMDvrqGn+EwYFplH7d0rwlYTNY22meAlI51f6xhowL2MiJM//IPXKtD92i0CJsw==
X-Received: by 2002:a92:d94a:0:b0:3f3:4562:ca92 with SMTP id e9e14a558f8ab-425955f38a5mr146481235ab.10.1758954788769;
        Fri, 26 Sep 2025 23:33:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:33:08 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peace Lee <iipeace5@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 17/21] guider: Upgrade 3.9.8 -> 3.9.9
Date: Sat, 27 Sep 2025 18:32:12 +1200
Message-ID: <20250927063216.1865627-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119971

From: Peace Lee <iipeace5@gmail.com>

Upgrade to release 3.9.9

Signed-off-by: Peace Lee <iipeace5@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 86a64972705b24990331f72800a6e1fe02825c79)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../guider/{guider_3.9.8.bb => guider_3.9.9.bb}           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/guider/{guider_3.9.8.bb => guider_3.9.9.bb} (75%)

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb b/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
similarity index 75%
rename from meta-oe/recipes-devtools/guider/guider_3.9.8.bb
rename to meta-oe/recipes-devtools/guider/guider_3.9.9.bb
index 0d93297a07..9c956f0ed1 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
@@ -1,14 +1,14 @@
-SUMMARY = "performance analyzer"
+SUMMARY = "unified performance analyzer"
 HOMEPAGE = "https://github.com/iipeace/guider"
 BUGTRACKER = "https://github.com/iipeace/guider/issues"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
-PV = "3.9.8+git"
+PV = "3.9.9"
 
-SRC_URI = "git://github.com/iipeace/${BPN};branch=master;protocol=https"
-SRCREV = "a502cd93b13235b7539557a91328de00b7c51bc3"
+SRC_URI = "git://github.com/iipeace/${BPN};branch=master;protocol=https;tag=versions/${PV}"
+SRCREV = "118ab61773463e56dedc78f5cf6723b97a4ad946"
 
 S = "${WORKDIR}/git"
 

