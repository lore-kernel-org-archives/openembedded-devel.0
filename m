Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E51C47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:53:46 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.53282.1669920821143119069
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 10:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FhB/guvh;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d3so2489906plr.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 10:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FVNkfGklIvakvmFunXB7/ppCs0rc9aV/MCaUQIn+h78=;
        b=FhB/guvhd74bmyEq9iu8C0cUdmd6iPjK1/Vsc4lQ2V/1LHOoLs26Mx/yeszVqwAWae
         OI/eHRDU83Zu9a+54CcbLUa8MMaEKcwQGSY9PxvSUEU9DtCfHeJVnfATLBH18raSlKD8
         EF68TTJhhASCFYO8hGjOhDFO3C8pR8QEEnfHDn+cftrNxiykBo8ezG5014yzeKFQxj+p
         U6mk9De19rkcnJ3mWXB08sBapyAZw7wW2zZQdJQcv8bDb9+TnzxUyqQZUxsqGLmACWk9
         0GTpTp34zZ1FOmXoyaZYFrrEEwu7LwMoxOgb6j0/fWr+Ioep0qej9zLOMPHv+JJv3myc
         ITug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVNkfGklIvakvmFunXB7/ppCs0rc9aV/MCaUQIn+h78=;
        b=XWcvxBLeQhXODYBHVZZ23uQlw785do5b9o3JXzwYJ41gg2nPDTLuwE/QQ+mVujX/0S
         Tp5I2CO+wiiNI0ml821ZyATu11holmQegqd5gEBWAK9KER9015jw7IAWdB093zRJKaiN
         81gDNyMpJnua0/AZ4O4QFlGTYL2edgc33qYKRV/ZgNoXXlKRNE8QSUhYoGg1UuZy2h6J
         91pQ1Q1fVpvbdV0R/4mWjL4lyN7ablVHD+d4GmyCRzQeF+wYVig71RL1EBgv32yjaaIO
         32LVv17WabR3/iAHCDMC2384/bl27yNVgzOJrRxK+LpW45SlUDdZAXFENBp/1JHlT1Rr
         63Sg==
X-Gm-Message-State: ANoB5pmqZb6GPO7PX8x8xxUeR1Bnut5BiBBcpK6HqCICi/QLNJWdWveP
	WYIkiPXEn8qaA02ANnKnsaIWATlJiNw=
X-Google-Smtp-Source: AA0mqf5H+x3oRCs63E6MvM1yCpg5VfsN6V3KmqBo/UlJhuHSI6vk/1s9S2XRM9Xb9t2VMsMUkKiDKQ==
X-Received: by 2002:a17:90a:e398:b0:219:61e2:226b with SMTP id b24-20020a17090ae39800b0021961e2226bmr10686585pjz.11.1669920820222;
        Thu, 01 Dec 2022 10:53:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001890cbd1ff1sm4016961plg.149.2022.12.01.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:53:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Check for commercial_ffmpeg as well to enable ffmpeg
Date: Thu,  1 Dec 2022 10:53:37 -0800
Message-Id: <20221201185337.77283-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 18:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99902

syntax for LICENSE_FLAGS_ACCEPTED can be "type_package" format as well
and some distros may enable commercial license selectively by not using
"commercial" as broadbrush but "commercial_ffmpeg" to just enable libav

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
index 158cb63423..4403af1952 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
@@ -109,7 +109,7 @@ EXTRA_OECMAKE:remove:x86 = " -DENABLE_SSE41=1 -DENABLE_SSE42=1"
 
 PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libav", "", d)}"
+    ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpeg commercial", "libav", "", d)}"
 
 # TBB does not build for powerpc so disable that package config
 PACKAGECONFIG:remove:powerpc = "tbb"
-- 
2.38.1


