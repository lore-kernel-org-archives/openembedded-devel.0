Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8F3CAC5A9
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:24:02 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.11619.1758194633009752433
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zf14hAbC;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b21539dfc90so83288966b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194631; x=1758799431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebiWE24XdukffAum10pprv0eRz1mHgx1JBtRWi8u/Gw=;
        b=Zf14hAbCff23/zP+yb7AvT7tPUzsBodtr7OHGPm0WgJC+f1cwErwTGLChxzf0hGixg
         gtr2W0G4CZchvGbJLIGeCZfiwnN1b6txHZLBqVqSV74gym8PMrz2ad2EWrFoBQlTfJZs
         slDxAchdxX1kVmuqhijDcGPv19FvILwTeib6p7ENS0+01JSYVdX7UE3vbzimUJwd7VeH
         Dz5ir7KEfgz07ZNg+aOxt5bM8CifERjVZUYRl68/ynW2Xh6EYb7snFtJ4iI2XVKmvWOm
         e/Yr1maZlyyAio01dgwCLThEo5xbz3PZXhCh7JptQFonTwpt03KTz4cumJBWIigkAiRS
         l5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194631; x=1758799431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebiWE24XdukffAum10pprv0eRz1mHgx1JBtRWi8u/Gw=;
        b=jWOV/JZuSBBOvE9v1gXAMbvkVsCrIo2OjojlMw/kjE74Gn8jW/S+y3CFlLzaP6nOE2
         YXJKMNd5pIvshh4/wvoXia3ZqMzKmB7QghRPSP2xcEZLe9/ap2BZujucxrsAdU/d+5eR
         xD+lf5f4gP/j1P8B4Ng7kWNxSCqIeR86MrWEmgkFOIQprIEupaycEmTdHhFwV3CLUlmf
         V+57KrrohqLyMM4nHiAZQjU2VvzbsfjRkVbtxkZ8T9Rq4BNEJ869gIyIjtClug+mrahD
         g5cK83K0RQnc+eiQJ8vrfS5cYFgOZnecwzpipoNw8yHCKUO+kz0nshcM1CZmNClMeJpm
         2t5A==
X-Gm-Message-State: AOJu0Yy0O4vFJq+0Za+8a4zBg4zXuWXMlN3S9cm9GEESJPIcocLRLo4y
	4DNwAUaWuBV+nCmVOSkKnf167ThTZmlvhE1eQC3phESTH71MmqlhyriyIGfuEg==
X-Gm-Gg: ASbGncsRmBjJL9rlSD/KdZRXpi4BJPMAQm6poWBMmlfZMpilBmWPIpLKOzeZr2FXrA9
	Q2M55JpO1E9bx3MFSpKDYO8wzUN0oShntBjr2aOI2kUM3NNcj7FgIjuygHZmR5GhjzP76LKVGnv
	lSOVkdU2hI6Dvfbc0YpvZS2ihwG2OU8QfIHor+NuKet0UFFToDOSrvVAJtIgEbPQE1dM0baEz2W
	A53fs67cHo0L+kkMtQ6kVA5/pOq7DFxDaf4f+n8zY1/h5X/VhirNycdmJ5qRw7VZSuVjjXhUPUd
	rXrRwULTJgDThBdeEcuusbxQxHnidqjG/S2OqYTv89KA83uZIKX//LafL6+nXUqs4Hw9lgOE20A
	r9vYRGx559MWnZ1Y0HSw+fINf6cbpBRUDQcXTjz8=
X-Google-Smtp-Source: AGHT+IGRAbYcSXioGTG1Xec/rRGIZPwciW34A4ZBwYrFmkIJ0/KTlWAXdORFfN3XPBi8HdCx/ZAnSA==
X-Received: by 2002:a17:906:f591:b0:af9:6bfb:58b7 with SMTP id a640c23a62f3a-b1bb433821amr549358466b.5.1758194631247;
        Thu, 18 Sep 2025 04:23:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc75ac5e1sm180410366b.43.2025.09.18.04.23.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:23:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 04/10] testfloat: update UPSTREAM_CHECK_* variables to fix devtool upgrades
Date: Thu, 18 Sep 2025 13:23:38 +0200
Message-ID: <20250918112347.1331393-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918112347.1331393-1-skandigraun@gmail.com>
References: <20250918112347.1331393-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119563

From: Yoann Congal <yoann.congal@smile.fr>

Update UPSTREAM_CHECK_* variables to fix UNKNOWN_BROKEN status with devtool
check-upgrade-status.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
(cherry picked from commit 21e3280fad93fc906aa9f488ea10adb71f7de86e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/testfloat/testfloat_3e.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-test/testfloat/testfloat_3e.bb b/meta-oe/recipes-test/testfloat/testfloat_3e.bb
index 48f50d8274..cbf08539c0 100644
--- a/meta-oe/recipes-test/testfloat/testfloat_3e.bb
+++ b/meta-oe/recipes-test/testfloat/testfloat_3e.bb
@@ -20,6 +20,7 @@ SRC_URI[SoftFloat.md5sum] = "7dac954ea4aed0697cbfee800ba4f492"
 SRC_URI[SoftFloat.sha256sum] = "21130ce885d35c1fe73fc1e1bf2244178167e05c6747cad5f450cc991714c746"
 
 S = "${WORKDIR}"
+UPSTREAM_CHECK_URI = "http://www.jhauser.us/arithmetic/TestFloat.html"
 
 do_compile(){
     oe_runmake -C SoftFloat-${PV}/build/Linux-Cross-Compile/

