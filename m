Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13433CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:22:40 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10220.1791973351054671676
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QKGLngPx;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so2863167a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973350; x=1792578150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9BJ9oM7viTQh1lJEHjSgG95tVepqR5Nz32DKdqnDD0=;
        b=QKGLngPxDf1Nm3criSctCGA+YY7PlqyRgFZkwEqiDlbUEn0R6wVJ38JMSK/Pi5guq3
         3Bl86VOrt/hheBnbWkpHUwk5DM//XMsvkfERrlSe00Gu8iOj6dCIn/mU8FCKk4crvi+g
         0NI8Z0bIsYUnfJfsvRcv+4aCuyJ129a9r/XaUk9nL3bJiLcPx1nNO6RCXOxmWv26K9mO
         wcUAg0iQ3LwbOVVDrLwwo+LCpCg+CMANByGFxvk2eGMlcPlBz+1wts7TGtw1NosQdcXx
         CYd/uZS8Nosa8sTBQsY4/7nEhb3eTw2ihq0xJkWdJUyJcxmHTSzc5lC2mX+lEQEGIUaz
         E3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973350; x=1792578150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9BJ9oM7viTQh1lJEHjSgG95tVepqR5Nz32DKdqnDD0=;
        b=fHVM65PbwKVduzCVlKiiuxObk3HBrICM/hXG7xabCXRDHUB69cO1ycMEYbVUtzw+7B
         EF2Ca5FVd07WI14PFwhDzJioUlrSj2qNR4cRo2SC4VJx/JyNkI7VBnajFfLA0JVOFIDf
         iuQBeWJh+vYUJM0SQAWuU1q9BSstVx5s8IxVPCUQUuZU3I6/7mXW/gSjC2DrY3XIBsdx
         cI6+wh94Kyn6JuHdzk3vgUFzIbQzfAVdEev2FXZ0lRW3omaBHVP7HNya0tfxMf6RLfAJ
         i1Yn7uyDcHp1dd2U7Mu4bOfBhtN68n0KQpkGSBkVhe6ThRj72kesi/RYssn3ZfUNerUp
         3lrA==
X-Gm-Message-State: AFq9FYLCFfJd6kbjk3zerEt7F5I2N8N2wtAuWYSnrFPcs6oBxSSYUaGo
	/SzR6rUmcnBjk37qVPZIuRZkaqPOgICf1E7NEtY3i54g5vRX5v3/ctsFCdN/3g==
X-Gm-Gg: AYBFou0o/0nsfk2Q0uwD/ile/MJYuLP4yPpMJ9y0CxDyCuGGePiQaecCAofeGIJ1kap
	CJ5fwtbWUvXeDPrpLODr1/P5d5lzXCTcu4BOh810j1ACkUF3jVCh8D8xN/ua2ESWRXVvapXmOeZ
	+3nVrMbNN1P8i7AzJr3p2HmZdmugaBS5sjzt36FDH89m+cfcjqY9eOfOSziyBqisMgsu32I8lyU
	nScmXBqiOCWX3FdgedcxTNy5n6F9tsOpTrGs9IPRZpzGtzAkHUvEeUQkYcLrHbXRgiu0VdLRcEC
	cs6o+ZcdVZcA0rym31dT8IdjvtYjF4sYlJaHWqsstpCjKMMCC1ne/RjeOVOFh4qYiLOC/rZCFDR
	rVe0DFlcgWG2H8qvxLWEKF9qOQOWk/cQj6Y3O/Y6U6f8pYz8Z+GP772OwTt8Nu7Y9WE48G3nTcV
	dpr2nh2Rnd0yCB1wu2fQHlC5eJ4kGzgsVU9eBwgwX2hSJzADg67dhsr7eaDQZP/EhHFGxIyBHGF
	KFHojtMhQjVIIv0TOBWbXmh0+A1nR5ipA2KMTZ6VtwJ/2w1ow==
X-Received: by 2002:a17:90b:4e8b:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3abbe66dfa9mr6250895a91.32.1791973350378;
        Wed, 14 Oct 2026 03:22:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 3/11] swagger-ui: upgrade 5.32.14 -> 5.32.15
Date: Wed, 14 Oct 2026 23:22:09 +1300
Message-ID: <20261014102218.880640-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
References: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130889

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.15

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.14.bb => swagger-ui_5.32.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.14.bb => swagger-ui_5.32.15.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.15.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.15.bb
index 5bb5a66021..1c1a625c2a 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.15.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "6e8ce248db64190e4113676aba996943c56f2491"
+SRCREV = "eb37d16243388857e5b7c68c93fd04635c7c96fa"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

