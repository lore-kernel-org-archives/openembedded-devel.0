Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FF9CDE003
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 03:50:46 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10473.1763092241381215227
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 19:50:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gFMw9IaH;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so1326943b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 19:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763092240; x=1763697040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVk+gqmq3GcbL0N3dufpbrQ5bkDF5DZZtw+O+sSLFk0=;
        b=gFMw9IaH7y5RLKWJNMDyUrc/E5dgV/6jsaBojEbkBN6tPWKDmeq0QnwPXKr7NSZlxJ
         w7v7skNqabLxhUIx5CJmVVzmtJPSNBqpg1gOTjHQwZDsiOlMO+CD6EEeDtjbZVjJP5Hw
         cywIQlQd/+fFJ1YgWZF1rAZyvAHGqfcVF1SBIbny0gS8EN4iiDviO/BUNDWz4wAhMRKT
         M0bfL6Wx+Cxl9Gi0SzAQlLcPsnVI9Go1OA1N2or4NN8+3Qej7aO7+4iUUis2B6t53ZiR
         PztLi6l487AIp/6sM8U9zg0XkC/rW8C9Eff0r610oaZuHb9d5U6X3/AKNDgVw5OxUzwH
         uL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763092240; x=1763697040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVk+gqmq3GcbL0N3dufpbrQ5bkDF5DZZtw+O+sSLFk0=;
        b=MCHGcluW0e4JeQYhf67gLw7VJ/TolQXdyStgKDdRuXEZJVCwXaYubMHdMJ4kLujlmH
         iMW5lPgns7gP0EsRsqo3lQWmdvIzjCt0vtjvF95PrLMrIaY7pwHU0JVVqX4XW3OIQFYQ
         p6Hx02sSmH83NH3IzqHgS4apbiRMjdvb2iebw1PtqBH5TqOcokqsMFbZejBhI2YvasN2
         rYC3YlLOND0upFcm2X4/jY5gYF2Sy1a0rtjl/TglySJ/0s6Wes34eCl1v/SPrCQu5hvy
         DN5TZqosrtXG9kvlGPMWrKXI5qsJ37J+8I3qDDK8SJoA3mZYxB3+vpZl+ZLh/88A0b8d
         zHTw==
X-Gm-Message-State: AOJu0Yw808aYo5VO/e+X+o8NuVHc1Tbwv7m1CGX8h7awMyJWdL5PeUkM
	JPWlMYNowY/TiVNSBaZdtkPCoQOlsBwl84S5rnT5EWF3cwvui/JzY/Rf/1PkAA==
X-Gm-Gg: ASbGnctnTqCgPjwXz6kJTfsG4rhuaaPJPftuk4e80PQ3SYf6CIG05wV1u9VVm4KUJ91
	MMmiwZLP8QoEeNLUeGyT2eEuk1GqVqCsTWnDS9Vy+53Ok3xVQwrCv0a2W9chRLfkoBVk7YxL/x0
	XXFHkv+o7z1/1FqNQXjLqYhTS3YAJZpabeOEgT72TvGo1tJ5HpNENvMnoH+r5ybdEf4NVrVzA3a
	dmzfKNfYsO0OaFtAJkN5wm9TTPZOyTY19fU2z7VCrhTN1Mu6syvcbcsD8HVoGPj/yPTh1UuiOHW
	buUaUs6M9tDoAzn3/fuPNLvAt970HinPcEZycAUGyYvNzB5nJHZwPYssgqmD0VuOwyb059+5Smb
	UVJmBfSHDwR7/E9dagAPdCjxXBwK3mYBiacR/sFu2ym1fsC2BRYeDfq8nElytfI9tkSJWKz9o9D
	3Lsdc9vZeZSDLxtA==
X-Google-Smtp-Source: AGHT+IE+Es5tdQAPUoev66HoTp0RIqAqDirZ5fH3HVxusWw/4M+bQOcuUuI3XVYOSP8zoBXCFSqLhQ==
X-Received: by 2002:a05:6a21:3386:b0:334:a523:abec with SMTP id adf61e73a8af0-35ba298170bmr1949668637.60.1763092240483;
        Thu, 13 Nov 2025 19:50:40 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37507fc7bsm3478092a12.23.2025.11.13.19.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:50:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/5] tbb: upgrade 2022.1.0 -> 2022.3.0
Date: Fri, 14 Nov 2025 16:50:28 +1300
Message-ID: <20251114035030.4042745-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
References: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121679

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/uxlfoundation/oneTBB/releases/tag/v2022.2.0
https://github.com/uxlfoundation/oneTBB/releases/tag/v2022.3.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/tbb/{tbb_2022.1.0.bb => tbb_2022.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tbb/{tbb_2022.1.0.bb => tbb_2022.3.0.bb} (98%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
similarity index 98%
rename from meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
index 937cf6a0b9..01115e7e4d 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
@@ -13,7 +13,7 @@ DEPENDS:append:class-target = " hwloc"
 PE = "1"
 
 BRANCH = "onetbb_2022"
-SRCREV = "45587e94dfb6dfe00220c5f520020a5bc745e92f"
+SRCREV = "f1862f38f83568d96e814e469ab61f88336cc595"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
           "
 

