Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41584CA5FA4
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:26 +0000 (UTC)
Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46614.1790553805203287670
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cYB7URCh;
 spf=pass (domain: gmail.com, ip: 74.125.227.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so13629585ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553804; x=1791158604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtVIPQ7X7PhUdZuYx4pOuunURJCy5Ljvofk0f/2gWps=;
        b=cYB7URCh+EqZSk0mRWnU0A6cs1GebnEiA37cX9GKt6S+GcZpiwd8kwXMkROwlNyyVJ
         LVQwPsMEF15VfzmYrrsfhR7Z0Le9iO5fmGndlcmrqarVwndiIYih4Og/3HVkUT3RIfmT
         Es7G4O59/h8ObYFTRs54GHD1St8vscutdpQ7/2S37GVSejcjQSQRSyB7K7p0US7Cp2Rw
         FD1ANauR8zMcCJk2NqI72swdlMpDMY5kJIGe5Ow5x6MLpg4T76OYogPHnmrxwP1WgEGJ
         qHyevp2rJeReobbAcweCfv9vBv+jnmJHu4UIoGTLBC0mv+Va5+nV0uRvROLSdhHaUabW
         KRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553804; x=1791158604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtVIPQ7X7PhUdZuYx4pOuunURJCy5Ljvofk0f/2gWps=;
        b=Cdf0j3XKp9lOT4G/sFFh7M5CLRSl1P+JaLFJcs913kdztGy4yOc/Nsw0sPC+c+Sl8F
         UoXZvH4Z+EXdR/+oaCcEU2sFa5rj/mQyDVIofpWl/oL9q7k2atoIQD8sKae+NzV4gUKe
         kdWpdW/XbZAHu0Et9eR+TPGgKoAdDd8dxIxMhs0d8H56AFxf5sHXK4Qjs4rJU/1II0JY
         9FkC1iTG0FVZyFAdYnIZzAgGzfg5AfjqMoebM30wjRMV1CYzS/aX5Nvc+GW2uo0HAWIQ
         HVGUjNJUsb6QDCa2lUzm0Fr82WVb7lvEzDzUgNL6SvuS155j/m/Cok4DiGUhRoLNjGnR
         0QYA==
X-Gm-Message-State: AFq9FYLOVKMQmZRqoWbXKmiS+9cj+jkPFvZWSyJewJ8cLT0rbqj7uSDp
	vGha9x/k+RkZOdLPZgrQ8uwgQrSAhCmnybtQPG7x8NuQ09cM2XdXYYhQdFpY9Q==
X-Gm-Gg: AYBFou3HMY3wzlhgxWqAtETT5oc5GhXrDGUgxtSK0FdHvoy+xEjh3kK87SIXA1MbNXn
	5q23MVDC9ZEKOLFoMGWG3gwUwI71dxc8/WFuWD2cCTVX1xNDckFxTjUy8bazRzJW6KTCUkeR5qX
	9RD6hj4W4jUy9WpK/KEXBCTDYP8x2mQo6jBbLoJO0UXsYlnFGfcOwtU22qIigluF/IbTZOiOuRh
	hTrFGJymIlTYCfD7GZlu+22Xt92S8PeteeeZZ7jfLv0Rdd53Pnib/QeU2P9Qm2kOUxBMRXqTqke
	y9101qbw2TERGYuk9plFWv7Kt0zyPKz53Q2+FXs7/r5zUpWxWz0yDY00+r47FoQjccnyDSI3nFT
	haaPdA9zd9kAf1yZE1elqqB4KmGviMORR2aE2hd/v+ZwElYKnpTvGnGlpn7qtIIJNxOXvmozv5K
	BpmJF9xCblq/IrOy9fJFG5j0k75TgkKmg6/CRKy0Il1JoOsbUOEiTQixkTNh5G9kEoFOS/78Mxi
	P6GERl35X3MK95ZCJcfP6I=
X-Received: by 2002:a17:903:46c6:b0:2df:e95f:70bb with SMTP id d9443c01a7336-2dfe95f718fmr25878925ad.4.1790553804428;
        Sun, 27 Sep 2026 17:03:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 8/30] python3-apiflask: upgrade 3.1.1 -> 3.1.2
Date: Mon, 28 Sep 2026 13:02:40 +1300
Message-ID: <20260928000302.2528437-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130395

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/apiflask/apiflask/releases/tag/3.1.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-apiflask_3.1.1.bb => python3-apiflask_3.1.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_3.1.1.bb => python3-apiflask_3.1.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_3.1.1.bb b/meta-python/recipes-devtools/python/python3-apiflask_3.1.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_3.1.2.bb
index 45bed8a746..e480172d1a 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_3.1.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f3b367d4174d8ad1df9ac3a48a63002276e9f82f7debda91314cca7a20924ada"
+SRC_URI[sha256sum] = "9e19b554631a518a637c8a77887be37f37d46aeeee3d4a863bc4f6f0128bde23"
 
 RDEPENDS:${PN} += "\
     python3-apispec \

