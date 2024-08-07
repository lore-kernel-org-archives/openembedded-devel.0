Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A34C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:27:19 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.32068.1723033636619389027
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vgkhj7Tq;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f025b94e07so19702551fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723033634; x=1723638434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCGqx9EK4Gf4y17z68NF6LYZ2nc6WwwopWBxPRYoBEw=;
        b=Vgkhj7TqN8nYwQtqEnlqpPRCJKdr0fewSHL+lvySSGINF86oqPsl9z4bUlO2D9IiGt
         eNH2C/NyhaY+dK9BRE1c085zZh2Io9LLXVt2l8G/OpqOM8Y/+mZ2le5Qxautpju3iQCO
         n3r/7lCLcKj3CC953LWjlS8bEQE6YB4gEkhncAzyN3nJ+gMnetBGkybGRnOGYLq722XG
         bcgnRzNldH/KoJnvMiSZJ63kvMHVxZjhB+K2div4jTuvrsZfwdohOtc0okIngUfA58LC
         YZoAjVdoHxA6zxYf6mIrhgqUQ48G0G4uHY4SUvuGewGu0FJv5xzLqv1yhWrSSKmv7Ekf
         Ivnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723033634; x=1723638434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCGqx9EK4Gf4y17z68NF6LYZ2nc6WwwopWBxPRYoBEw=;
        b=t8yKlqpbYBGjF6TChKb1NL/pQRk/8FCg28gGvi/CzHyK2/69mcUoFuDKCvb2haJ97J
         b/A8BSRDW/BU42cBmQXpfNSQ9P+T2/P9hO7aMHXwgh3iYC2xTkKDK0ToyLshgl+awEEN
         ZsgZun1NYHCI8zVpkF6UKDancy2bVRKj3+p9VLv2fWn3//g1WOhlXwStCUouKTSZBiFD
         IGFhfOio2aatP37RStUEfTBX666thw+Cs3S3hM7uhejZp67u318canSHVLAGmEzg/yvb
         6u/G8pLHmvyB+K+yJyhPlzgNm8WXhXHzBQdBLK2snFvCqH3rxl4D0Si1a1h0rNJ9y/F8
         3+yQ==
X-Gm-Message-State: AOJu0Yxp4GPv4Sgiax6CImO1+hm29s8/WUUZ093S0/GH3VrtKOYzlWID
	9/fQcXgSdGhBckoHFDyhkGHMRqgLwhuJI/T3s1Iz3rPZmGCVqfVPtXlLUBsh
X-Google-Smtp-Source: AGHT+IE+FJTgnLsG4FXHRfi9jzB2YKdjMSpNMAZEf3gh4W42ZUjUOp5u+JTUdv3GAL6nTbrGeG5n7w==
X-Received: by 2002:a2e:a409:0:b0:2ef:296d:1dd5 with SMTP id 38308e7fff4ca-2f15a9fd29cmr131069161fa.0.1723033633969;
        Wed, 07 Aug 2024 05:27:13 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905796a4csm27610415e9.1.2024.08.07.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:27:13 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-pyudev: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:27:10 +0300
Message-Id: <20240807122710.113586-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111627

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pyudev-0.24.3-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb
index 0911b63ed..a44fdad3f 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI[sha256sum] = "2e945427a21674893bb97632401db62139d91cea1ee96137cc7b07ad22198fc7"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 do_configure:prepend() {
     sed -i "/import pyudev/d" ${S}/setup.py
-- 
2.25.1


