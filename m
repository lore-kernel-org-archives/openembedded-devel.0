Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.43718.1589813426144196844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cj3/QrES;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id b8so4931790pgi.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XzGwoPF0ODI/+tBWxFzCbHe1zM3aLE448PV6XFapIN0=;
        b=Cj3/QrESVlwlm/5ZhO7xLB8yqX3PXGCRJd17Fq8I9eQAjLw2e/84UqWs0hyywnQ/FP
         sKY+Tps0ZxQsXWFHYFP4OGp2FSucmAbWdLHT/v0sZEPjFxDSDTuDAwHdDYgay02rvEZQ
         hPF5UJ8OpV/NRCWfCXm6A+CqWPbA6bN7dPoC0krc9FnN5loKHCcmsR24dkLOYxFXsMqG
         uP8Z5u4S2LA3TuFLHF//T8kRQtO4oVz+keVWs+9QfE2LfumBOWBpBJSp9meEidphdfgi
         kJ1U1pS9fHej++CUW3Bhz5571D3hleBLsolxtp+GXbzxD6caaA2rcLqjQOyUvw+RDl8R
         WU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XzGwoPF0ODI/+tBWxFzCbHe1zM3aLE448PV6XFapIN0=;
        b=R0GpZWEWo/Kdsz3HDcwth2A81pNi35yUkKQ4GYMfUrNDkXmucpA6G4ErUjZdAz2Lpv
         jidrO3Xjl9AScTnSL+S5G0+T6Fi3XUm28oejTwulQ9wmm7zMQaXOANgcmKKSsXohOWiS
         npsIEBfuV4lHqfnTbea/3pk7AgioFVA6bKnSecOQLSZpBkxeoJKKOS5GTXfJVeQRngMl
         801ge6mkxs7MSk472yeg0CtkbyW2uWfYUKyUkjIU+KEu9SMWUX/6dfI18DFgkXhTR4KL
         M80fTbRNWMDxDvKKaL7R3LfSTojJpUJbKTd/vn9B2ff27Sjtr5PnZheqPaLjeW2j2fx5
         CdWg==
X-Gm-Message-State: AOAM530zRfDmUeZxtrXPu1msWX2qakktKFllxnB8ByPE87Fu286MGwJh
	Z75FQwzDlC2mONpXq3g5V+A+GFZS
X-Google-Smtp-Source: ABdhPJxcpQpdRQ4fl3c0E0aATh+7vdKnxWUhG4yFndsNL4jZMCPBAkipYjzHvfTJMkOag8RjqxR0xQ==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr15380220pgh.280.1589813425487;
        Mon, 18 May 2020 07:50:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 18/57] python3-pyhamcrest: add rdep
Date: Mon, 18 May 2020 07:49:23 -0700
Message-Id: <47b63311bdeb494a7db3421def9c8e007e826602.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: "Slater, Joseph" <joe.slater@windriver.com>

python3-six.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b34cb7ca8c2625ed9ab439dc50cf2ced0cc4571d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
index 04aa9b47f0..ee96a079a7 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
 SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-six"
-- 
2.17.1

