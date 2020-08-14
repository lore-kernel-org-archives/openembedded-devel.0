Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.12381.1597383441276810193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kqRZutvq;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id o13so4011189pgf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cPlTEjhjtW8XcZk/VPDAhgccCzqj0KFWHXfKdmUfN54=;
        b=kqRZutvqfLWBuos0bDtvcwziqSIowwejAKVguOPYPYj9VQdS/R9Vy2oOS31LEg388K
         TUsA8hgQPO/zbW9tuqLpWGcbesprwszOWW4FlSD3mWjCBY4KBQhIisIgeR0cDERg3G5b
         iSH9RoTH/8R5r50pplk4zpOu3z5mCp8EUik6INEEcimwLcHWCvoW+LLqRTuFQvhbTJ8r
         V4xJ0LdhNOnMmpRWl02MDcF2OTVK6zqEPIIXJY7ZnHJxCaPxOFs+FGiwH9A0NoycT83n
         tgvzZm3oO/7ZIKFFIKmWgmWMoBQC4SkI1Zr+aWwUKzsLnxJI2OfLWn3+jOeUse7yHmhQ
         kBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cPlTEjhjtW8XcZk/VPDAhgccCzqj0KFWHXfKdmUfN54=;
        b=gCFDtA7kHK8vDuLJa/MzBJ+Q/6jm7SeKxWi7uG8GUcBb+jkFUFLq5procBGHS7wLA7
         2KfVzFdbEKJhzs6L1GYnoQeHYaPtrLDok6IUDcoC7Z1kWcUmAQgxO1ji/iQXbJ4ndUsK
         zqxwcncqX41Glfka+Rbw6+q4C1jXf9MVYk6BB5r14061qiIC9CrCNg4blU5nMFyQmEMu
         PG3/JzM+gG+6aDYzM1aJHTzXzZK0C2AgnxwDbYCiLO+hYSAMPkjtl8iPkS05p5DNR8Xk
         dJCH5ASzkdrHbtkD4CkUMXaPZoJDdi64lG02wvHTYcu6+rtz3dgERpbAfUsfsj4KiK8S
         nV3A==
X-Gm-Message-State: AOAM531HJTID7hD2MZfPWnRSqm6AM2CurmiWcXniGN+UT0NpIvU62nPz
	lBT7xtiCq7UZIoAgUTTPBS9Bw26nNGiCuQ==
X-Google-Smtp-Source: ABdhPJy9dDVva7I9MQr1JrF7Pnz46TXBKDdAuxM73qV5NJnWdah2UcDlMf5VNdGz3Br+T6xnA7oKzg==
X-Received: by 2002:a62:7f06:: with SMTP id a6mr676977pfd.300.1597383440415;
        Thu, 13 Aug 2020 22:37:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>
Subject: [meta-oe][PATCH V3 20/21] ocl-icd: Upgrade to latest
Date: Thu, 13 Aug 2020 22:36:56 -0700
Message-Id: <20200814053657.1701247-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Update copyrights [1]

[1] https://github.com/OCL-dev/ocl-icd/commit/3920205736afbb67729e9c73c7b4c6fdb3fcb327#diff-7116ef0705885343c9e1b2171a06be0e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>
---
v2: Fix library conflicts and license checksums
v3: Drop installing CL/cl_icd.h its provided by opencl-headers

 meta-oe/recipes-core/opencl/ocl-icd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_git.bb b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
index d14ec53e3d..937b3500c6 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_git.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "Open Source alternative to vendor specific OpenCL ICD loaders."
 
 # The LICENSE is BSD 2-Clause "Simplified" License
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=232257bbf7320320725ca9529d3782ab"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1238d5bccbb6bda30654e48dcc0a554b"
 
 SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https"
 
 PV = "2.2.12+git${SRCPV}"
-SRCREV = "af79aebe4649f30dbd711c1bf6fc661eac6e5f01"
+SRCREV = "a9e57b199ff1e8d03fa3e5c53c5544de3dc72fe6"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0

