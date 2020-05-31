Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.18194.1590941798729614334
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R231Cz2h;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id a127so270089pfa.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BHIEQqfMvW2aM6YTwsH+RhalPorsWseYPc7EixtOuDY=;
        b=R231Cz2hQz4NfqheP94LUoLpINnZffJ0HHVWUD6QI/dQf6fQppMymuD4JIf7tUtm+S
         a49uCc6+G12Y1r127rlTF/5BFqCU5PWFCMCP1bWppzxQ7fX8YKoouL+b6OrT5vUHXAqS
         YvnL+GhfB/8gfzYS2l7TTkCVc0UjRBtYpEYmVE9K207NEtjvSape2m/q/LT2n+NLWZSt
         CMowYWEo81PtYZwYSzjY/d6TgwtZLoPhUGISdDy2dAcGMnFQsNmwgDcGLgRzQBBQ3+YP
         /tIKvM88Cs5gwHdeEJTfn9Sg+qI37p7AmSoNbb1YBRgRoe/GyFqcPKbqlXYQ+mMmDfAM
         qawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BHIEQqfMvW2aM6YTwsH+RhalPorsWseYPc7EixtOuDY=;
        b=mPzg7vfs885F1ZLT7Ym8BTjRPKYOhl2ojQmtEiyOMtte3tiLw8IH2d3g3E8CD/VTae
         nf8faIB3keHc2Hl+2E03Cbyen9E73HRZw2O1A5KAPgYUALJr1IFYJnO9LVDLpBiSGPUK
         eL57qDbhQ7E2oaIcKbhDU+m4jhz2jc6M0p6zzg+VxRmWhfvi8tAUYeIDw3E80kKfN9p7
         obzN3BAT/m3RFo0lTutcR5xWyjmf0bLd0abP4d5Ak3D7SCR6odyyiflPcVI7z/x66Kv8
         366ojHgEIRVbJlBq1Xe7fODe839itMUzH+bFE31EzbsEQCeruWQW4v8C4vL2WGtf1WVS
         BkZA==
X-Gm-Message-State: AOAM532qMqCa41nIuFcSwnzgBLpVqR+X7BICjuBVfTmbHo5nDWbr+LaX
	zh/NMB15aAukkcxvxKURGuB+2fYb
X-Google-Smtp-Source: ABdhPJwIV0bKV/4tAvLOu2pFhgEuSV/0F1Ks3yk1E1MrK7o7Ml5Ai9bQK+jzpfn+c3UYq3CFd32VVg==
X-Received: by 2002:a62:6d03:: with SMTP id i3mr16266341pfc.249.1590941798152;
        Sun, 31 May 2020 09:16:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:37 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/35] python-periphery: Add python-mmap to RDEPENDS
Date: Sun, 31 May 2020 09:15:57 -0700
Message-Id: <9591cf80a5e156b0e7b69e42c3fda2f569c2e933.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Christoph Steiger <c.steiger@lemonage.de>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 95d7ee4a95761f2676e6819dee9b616224be777f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-periphery.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-periphery.inc b/meta-python/recipes-devtools/python/python-periphery.inc
index 719c635073..0171f63f83 100644
--- a/meta-python/recipes-devtools/python/python-periphery.inc
+++ b/meta-python/recipes-devtools/python/python-periphery.inc
@@ -5,3 +5,5 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b"
 
 PYPI_PACKAGE = "python-periphery"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-mmap"
-- 
2.17.1

