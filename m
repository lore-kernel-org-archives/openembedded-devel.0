Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A67C64EC4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 16:35:21 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.14536.1676565312309605900
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 08:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20210112.gappssmtp.com header.s=20210112 header.b=1Wwj6lHE;
 spf=pass (domain: norberthealth.com, ip: 209.85.166.42, mailfrom: roger@norberthealth.com)
Received: by mail-io1-f42.google.com with SMTP id z5so863293iow.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwZpXhznRBZWBxd+QUc+iaf356lYvEQi5QGUTy7iIa8=;
        b=1Wwj6lHEdWnrdUlEk8OwX4pUE/BKOxnZItd2acKUWOvbqg4Pyeos4dJx5SJqXMlTmO
         h8voCBM68XYFJMFRYyISGQ5HXu6Ksa+CNYTz7jXNgSjNokVsx7pdbFQdLGCcSGkZY/+s
         ebDvzYMXGSBnG4V6MshA13hQb3XbAl+9244NzNf/1OMucLIT1oal3VoTEEoLEpumDsN5
         eBjA+kiUOfm30H/0c+quUDdgw3dfheKilqJAtXlYyoB+Q1OJyMAHKTmXMDitGrwiWdpp
         FBXf2oT/m6VwbkadqZ0ezW07tsMZkTSDtxc0ZBXTHh/yPvXgKyicdi+k1J5nK6kLJwPZ
         JrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwZpXhznRBZWBxd+QUc+iaf356lYvEQi5QGUTy7iIa8=;
        b=jpW8eWaCt+OX+DAkGFk00shK0gcqFaD7NQddc4mVaB7aC7FX7uS9chK397mAId2E/0
         gX99iYG+ybcLuQMP16ZM4LjVCIb6YweN9ZXzZSdqtiHrHjEyJj7bUGbOqAygdYrps9TC
         F1cXIWtavFP71cP7XX8fZJ+ap+wBD3tBUf2XnRKGDgQgr4mKnXk+LrCXDghu2Unpwr9Y
         Xay9HqJUUV+waucn0xODfwmxz4J/RsVRNZltAkCwkm4RrgvXJCyZsOqlLcII1T0Aimq2
         h5s2FAAHR0f1zdoM8xEpy0trkM50ESq/xZhaNokC3YMvIJMpTUx3r3AZ9FERyEr4yjOG
         mq9w==
X-Gm-Message-State: AO0yUKXm0SgdxK+3GrEM83O72LJu1EjnNoqtdUQi2KByYkkWdn8oSlPj
	jNtub2GiBbdymBIvj3P6UVDwcju6d29wYkXpCkJn5PVc
X-Google-Smtp-Source: AK7set9bndsmuZyYOYeA728fcUqTiK8c3GPoGPDcMgt6FYCMuhfbtHxDiYpMw28vRR9ct8HNk1CwJw==
X-Received: by 2002:a6b:4015:0:b0:722:40e5:d633 with SMTP id k21-20020a6b4015000000b0072240e5d633mr4521426ioa.1.1676565311247;
        Thu, 16 Feb 2023 08:35:11 -0800 (PST)
Received: from roger-build-machine.us-central1-a.c.qa-pipelines.internal (47.56.173.34.bc.googleusercontent.com. [34.173.56.47])
        by smtp.gmail.com with ESMTPSA id m3-20020a056602018300b007192441e5e6sm629902ioo.45.2023.02.16.08.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 08:35:10 -0800 (PST)
From: Roger Knecht <roger@norberthealth.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Armin Kuster <akuster808@gmail.com>,
	Roger Knecht <roger@norberthealth.com>
Subject: [meta-python][dunfell][PATCH] python3-pillow: 6.2.1 -> 6.2.2
Date: Thu, 16 Feb 2023 16:31:16 +0000
Message-Id: <20230216163116.19190-1-roger@norberthealth.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 16:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101118

Fixes:
- CVE-2019-19911
- CVE-2020-5310
- CVE-2020-5311
- CVE-2020-5312
- CVE-2020-5313

License change:
- Updated copyright year

Signed-off-by: Roger Knecht <roger@norberthealth.com>
---
 .../{python3-pillow_6.2.1.bb => python3-pillow_6.2.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_6.2.1.bb => python3-pillow_6.2.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_6.2.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_6.2.2.bb
index 80b7e941a..8bcc090f6 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_6.2.2.bb
@@ -3,13 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4eddfd4333b69c754704db4bdceb5c11"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.2.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "6e0f07bbe38def22d36ee176b2efd9ea74b453a6"
+SRCREV ?= "a45c8583ff90312a2fddc38567ed736cef4af563"
 
 
 inherit setuptools3
-- 
2.17.1


