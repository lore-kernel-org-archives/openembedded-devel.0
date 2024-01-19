Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EAEC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 17:48:52 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.1275.1705686528968137921
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jan 2024 09:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LJWBwA9X;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5c65ca2e1eeso720659a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 09:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705686528; x=1706291328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AEQCp4oPi3pFxCAUkRrpleqqC4wllFS+tcRAH1XZkY=;
        b=LJWBwA9XYoC3hk0Sp6g3T+qItEqAd/kDWalMPxCX4i7uWljCQ+EmmNqUTt+lUoYoyK
         MyKr4Fb/EAmHyvGAKafaNs+0B1yPYp5+6zCYFFFNk83yh1j3sC4SjvZiqVwPe0UFd0tn
         U8S+DPBaBU0JYYLxVmagMzRgQcqkR+Is6bVz8yX+uwBPXGNPmvt4oGTlKa49ZRV5lDrz
         QS1dPpYVZnSGp9Jz4C4QGRW6R8q3hNp62rKd0+lHHCjXfEAVUms5PvHRaSyOjHy7dZ6w
         uaxIacAthG8z6gzec/p9OyGJsjzwQPUioyiRRl+yvETRjUaBmPLtSjqW8yB3+JDmY1R2
         0Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705686528; x=1706291328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AEQCp4oPi3pFxCAUkRrpleqqC4wllFS+tcRAH1XZkY=;
        b=NiA15uW/x1wWUiDiEf6uANpIzQHM/fVSWuLi2Zboy2pzrFhialVo27PO9fWPVjdpuZ
         cpphS0inQhUpvFbczvRShF1dIRdq78GSksErmsrmv5jUFGOICTy8KEDfUEfaq0ZBacDZ
         NhNXMw2M3lu3VZhdmOJPl6Nh+7OwPaZgWAGecm5xPPwjgxvv5ecTRJfi5Qq58P8QpAfj
         f8sVvuDNaPgZqPoYfLsRnaAgXmjyAYpF+52kY7IiqVYCCV5cE7ChDaSmN8pEqK8Bzjwv
         e+WhgBKeyn+axG1m5iAyycneNIZigeOiTqufChY6EfUqPzNEzW424wp4mKuKehq08EUC
         KFPg==
X-Gm-Message-State: AOJu0Yw1OU51rVO+4PimwvN/abdgh8Y1eCbNcZxigFWfFWao3ImJQUo1
	D3wmbd6jCwQ9+tIMLv8VHYakwbMIIwD8sPDbJcN8rHs6CFbX3kiTA1/K26+MwQU=
X-Google-Smtp-Source: AGHT+IH9XvqeBcUjGpW80a72az6Brby3zeaElfEiKBV+efs7aRpday/E8kNb4HYu9S9GsAkjlMc0NA==
X-Received: by 2002:a05:6a20:ce47:b0:19a:2ea3:11f6 with SMTP id id7-20020a056a20ce4700b0019a2ea311f6mr174859pzb.16.1705686528120;
        Fri, 19 Jan 2024 09:48:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::dfab])
        by smtp.gmail.com with ESMTPSA id kr8-20020a056a004b4800b006da73b90fe4sm5556414pfb.14.2024.01.19.09.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 09:48:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-pillow: Correct branch parameter in SRC_URI
Date: Fri, 19 Jan 2024 09:48:45 -0800
Message-ID: <20240119174845.3539357-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 17:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108361

10.1 tag SRCREV certainly does not exist on 10.0 branch so point it to main
branch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
index f895b1db32..c13af30d31 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b22dc6b663b9175820e5e03337c7596b"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=10.0.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
            file://run-ptest \
-- 
2.43.0


