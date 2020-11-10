Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.32725.1605036637579993786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2020 11:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tYuWHFnD;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id q10so12366320pfn.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2020 11:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFh6S3yeKjWfYLX6p1zSGeXdrDJrfyry4XsQo1HA2Vw=;
        b=tYuWHFnDWRfUGPYSz2yRsLMulYYXFfxY1hF+5Wx9DJb7tFAurqUascr45w/rgQoqOm
         XfEI6Pns6fJmtZDZS4yECOld74OE7dy0ASVmmNV4lpV6iJ2NtT7gheYwmLtRor/HXwyI
         p2v69Ul67Nd4plfdlTvGnhqekLtt2eo5M8sxIpSm+vI+nOFRTyBUMPBluHbF3uSuvMEP
         eweIGcACY26uzXa4ylx2oYsTS+UgV3llqf3S5/x5jTXwxQni1WQ/xQdOABpSgs2sUiaF
         EHWNizsHqsm0wavVXU+2tHvwaLrhI01PaYEgsTsEXAnzVwMjf7lGElKwFZksabRbm5Pm
         dH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFh6S3yeKjWfYLX6p1zSGeXdrDJrfyry4XsQo1HA2Vw=;
        b=q3LMns35APOMKNopDHtVfX2quz41h+DfsGG08FZGFiMV1HWe+hEWG7gax85F7n0Ppg
         wCgyT7rh1nKhvbdSHLP2huquTUlMJkPqBjnYFuHrxdFmmO7XSNv1t7P5yPZoPhO3e9eD
         C1ApJZHHZYw3dPUlxdH6wCSYve37CUTzuSLKdrI7ZGb3WsE9Q/o/jSp1wELgEGTpA5+C
         M84t/f9RAMYsSjkCRma9j6qNaDytAEF361wAYJbcd28DkpTP7sblo82O3uR7FBRB3Uha
         lXrFdLBsQifdhAEk0X0iOAYq/tyq/3q4d0F8cFaTYpVHNeRLK2fWNrY1wPo+WJ/Q9e8v
         /quQ==
X-Gm-Message-State: AOAM530zoOLKt4wtzjjYA4iWbnFtyz7CVotLS2XX3dB6nPOLAwaP/U2P
	GngFphHP8+nr0+2Yf3WlnYHarM2wxc3NsQ==
X-Google-Smtp-Source: ABdhPJy1sV+TJ4ljWcsTNkDGFKQCmsVqEOsxGBpczpf5TNo4QbNKsCCzqMRqJ0FpayFSbAMTi47nZg==
X-Received: by 2002:a63:2e41:: with SMTP id u62mr18971638pgu.235.1605036636665;
        Tue, 10 Nov 2020 11:30:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id s189sm732464pfb.60.2020.11.10.11.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:30:35 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] meta-python: Drop RDEPEND'ing on python3-typing
Date: Tue, 10 Nov 2020 11:30:33 -0800
Message-Id: <20201110193033.2750137-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its part of core python package now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb    | 1 -
 .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb   | 1 -
 meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb      | 1 -
 .../recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb      | 1 -
 meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb | 2 --
 5 files changed, 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
index a26835b607..9f152a1d60 100644
--- a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] = "61f9ae9322e38ae64996848421afbdb018239a99c4e796fe064f172d6c
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS_${PN} += "\
-  python3-typing \
   python3-dynamic-dispatch \
   python3-typeguard \
 "
diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
index 2bf487584a..0ed5df1b2e 100644
--- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
@@ -12,7 +12,6 @@ PYPI_PACKAGE = "dynamic_dispatch"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS_${PN} += "\
-  python3-typing \
   python3-typeguard \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
index 2bf9d07533..70527e026c 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
@@ -15,7 +15,6 @@ RDEPENDS_${PN} += "\
     python3-json \
     python3-logging \
     python3-netclient \
-    python3-typing \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
index 98db23039b..75a0926f08 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
@@ -17,7 +17,6 @@ RDEPENDS_${PN} += "\
     python3-logging \
     python3-netclient \
     python3-pkgutil \
-    python3-typing \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
index bd92216776..cb5c372352 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
@@ -28,6 +28,4 @@ DEPENDS += "\
     python3-setuptools-scm-native \
 "
 
-RDEPENDS_${PN} += "python3-typing"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

