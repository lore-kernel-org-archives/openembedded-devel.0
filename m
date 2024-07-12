Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69A0C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 08:07:00 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.3066.1720771615219255342
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jul 2024 01:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iws5hxmX;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52ea79e6979so1972551e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720771613; x=1721376413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RjN4Z6MK34RqF+Mce4EtDVMn4NKv1C8ePI+mt1TiElg=;
        b=iws5hxmX6cI/b/uDWdGgm3JLRd+hYndaJnFaMbZZaT1OiRT9RTMwZeuqUCoN345I3O
         PnFMin+d0W2T2P3fdGV4iyOu+v2FcGgLPMGjXsBGhJX5ajxztvfwaAI5jAxWlwifqfqQ
         6VH2lJGkXc1sv7qSGRmosslgwoO1dQ1+qC1UDAJSmClE+s33QML74HHjFMKm5MgGWR+L
         Dur6tZwT42cFjyjuXQheYMg74nmuJc58Rwu/A/hHjSrd3GgDPzlfmZLgjPEqSZjkYojO
         8eYD1obK7+0drc5ODe5fuolY/GCaGAWM+ipKCQNUacqCxOp5kZhuDrNIk14dduym5yCh
         CM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720771613; x=1721376413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjN4Z6MK34RqF+Mce4EtDVMn4NKv1C8ePI+mt1TiElg=;
        b=iu1GIcCt96tfYGNKCLSnHBsQ1TiS6b3VddYt95AVMLuZ7vuKrpu/u7S3Dp0h4tlVJ3
         8DQy1BZDQ/paSAB0OhikWiPchJGhQEQxwh58buwhuzJfAsVzQZxA7+bUj4ecF84jEEOr
         tFTpq0kTo/AuGra3VkkeH3W+BBv4/TleCaUJO8y6h/jCmsTohMD2an6guXQQrHtG9pqS
         nXKrmvZTztpMH70dFLJTqaNSHLKn505CgshpckVwWtS3A0HC7IS23/ZdBFP8i+voyhPr
         4nvRfjeO3cCUxq7kk2G5VzowqTsv/IiF4Ua6KddDLmo3OYTzKZ2wqDt6LbTqnI4bmw8u
         chHw==
X-Gm-Message-State: AOJu0YyexfG2ghlD5Dd49NfY1PFmZYmEqP2vs7JNedH+kKbb4p75iZ1z
	uTddkADdJZ1D/7KXeoWAa1qYAxc7WT0FoRqiX53NvUkmlvFmdBDCabEFAj+z
X-Google-Smtp-Source: AGHT+IH6SuiHHx55IUH59L3QcYJ6iWnLqAi8YFQiP59Ap8deBMnq/HRYehdTg1Lbkv+TL2DZRdYLww==
X-Received: by 2002:a05:6512:3194:b0:52e:74d5:89ae with SMTP id 2adb3069b0e04-52eb99a30b6mr8214940e87.39.1720771612470;
        Fri, 12 Jul 2024 01:06:52 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2babdfsm13979525e9.36.2024.07.12.01.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 01:06:51 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] exiv2: Upgrade 0.28.2 to 0.28.3 for CVE fix
Date: Fri, 12 Jul 2024 11:06:41 +0300
Message-Id: <20240712080641.65080-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 08:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111315

Release Notes:

* https://github.com/Exiv2/exiv2/issues/3008
* https://github.com/Exiv2/exiv2/milestone/14?closed=1

This release also fixes a low-severity security issue in asfvideo.cpp:

* [CVE-2024-39695](https://github.com/Exiv2/exiv2/security/advisories/GHSA-38rv-8x93-pvrh): out-of-bounds read in AsfVideo::streamProperties.

This vulnerability is in a new feature (ASF video) that was added in version 0.28.0, so earlier versions of Exiv2 are not affected.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-support/exiv2/{exiv2_0.28.2.bb => exiv2_0.28.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/exiv2/{exiv2_0.28.2.bb => exiv2_0.28.3.bb} (86%)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
similarity index 86%
rename from meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb
rename to meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index faae24799..3e33ab795 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 DEPENDS = "zlib expat brotli libinih"
 
 SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x"
-SRCREV = "04207b9c39bf7b3b1a7144f7ed4e4f16b4f29ef6"
+SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"
 
 inherit cmake gettext
-- 
2.25.1


