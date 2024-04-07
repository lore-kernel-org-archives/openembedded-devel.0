Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D475CCD1292
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 21:25:57 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.92415.1712525151220901121
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 14:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSeeXSev;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a519ef3054bso297624066b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 14:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712525149; x=1713129949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWfPe3H9m9zmOm/y6d6bFHFLuiR1TLOacVaUi+dawns=;
        b=iSeeXSevoXyF1nGYL8SkSJAZLQdrXJHqJfrWLHAKAJXpraAbTsC8oWc3cvppXLGY17
         L9GKZ9XSrED2LaqwWl2g3GmrYdJJcdm/oKWJuj7zTTLYZ480gefRvK/bLpRK53Hc9rWN
         qu9tPKCQx3O+DGBa0Dr6M1VbI8BU5kGxOzZ/aNESsOnAnTv8WNk3Vx6AaufmICSqqNRb
         SO6c1jwYvqCBKWjhpNY0Otx1O+rwnk4x1K3HNNHFm2Vr2XxmPRquWCggQg0mQUSS30qY
         30YUBj9kon6i/SpMdkPla0Uv4uPTcGk1DK37np8D3GprhuUILvuFzx1sjrWO0ytsQchn
         7MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712525149; x=1713129949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWfPe3H9m9zmOm/y6d6bFHFLuiR1TLOacVaUi+dawns=;
        b=rwNubBHqS9NdLCluYRqEStEwUyVWrgyBG7joD/3g3NHz8ek+2onZMP77xapql+bCgm
         lawiLtvZR2M87DgT27LpjsgC/MLdYZmqpUlUfYjC5aiMFmR18y+QtrrpO/CzXEPqK+RE
         uKPjYFXFl9h1Ds6P+1zmcTQyJ5jcMY0e2TzBvsthgcrzn784VjJEwd3B9qToGZKDk/dC
         JPLBaN6IsTYIPiajzUjfxd8s1WUACCR1mtMgSbkZlB/9Za35VVYTZF2FMILtgnnngNQE
         zTSw0ivlvsCY0uRSclIxrsnL5rLVogaenuZlNnFQ6+3Rq3IIq4PTwBJLptj0gbtTmuEA
         y5qA==
X-Gm-Message-State: AOJu0Yw9ys1Mx3ExPFZtHkWx7OKiMvXcyWIoXbMrhhZymB0TRAaTj/IG
	aq0jf15wggH/lNXRvzUbr2qswbbxsItl5pvVoSrIW/QpFxeLGfr/95RLK1Q9keA=
X-Google-Smtp-Source: AGHT+IEtjAR4pHwh7IJde+CGygfrmJV4ITCl6Or+ciXF1DpyE0I/S3lb/CSZTttsmuf7fA0Ftz58ag==
X-Received: by 2002:a17:906:6c97:b0:a46:da57:6ee4 with SMTP id s23-20020a1709066c9700b00a46da576ee4mr4489220ejr.73.1712525148966;
        Sun, 07 Apr 2024 14:25:48 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id dr20-20020a170907721400b00a518c69c4e3sm3560974ejc.23.2024.04.07.14.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 14:25:48 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-chromecast: upgrade 13.1.0 -> 14.0.0
Date: Sun,  7 Apr 2024 21:24:43 +0000
Message-Id: <20240407212445.667665-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407212445.667665-1-t.f.g.geelen@gmail.com>
References: <20240407212445.667665-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 21:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109853

Move from setuptools to python_setuptools_build meta as the recipe offers both. And cleaned up the list of runtime dependencies.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-pychromecast_13.1.0.bb     | 20 -------------------
 .../python/python3-pychromecast_14.0.0.bb     | 16 +++++++++++++++
 2 files changed, 16 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
deleted file mode 100644
index 30add4d2f..000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Library for Python 3.6+ to communicate with the Google Chromecast."
-HOMEPAGE = "https://github.com/balloob/pychromecast"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
-
-SRC_URI[sha256sum] = "08e61a8b54bd2119d3c9ab1ec0136d3d8563aa97e0a3b57841588b9be60c2676"
-
-PYPI_PACKAGE = "PyChromecast"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-logging \
-    python3-zeroconf \
-    python3-json \
-    python3-requests \
-    python3-protobuf \
-    python3-compression \
-    python3-casttube \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb
new file mode 100644
index 000000000..1b27af1d3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Library for Python 3.6+ to communicate with the Google Chromecast."
+HOMEPAGE = "https://github.com/balloob/pychromecast"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
+
+SRC_URI[sha256sum] = "dc4f8b052e760a978da9b2568b79020cb79af608a026465f07544cffe43973cf"
+
+PYPI_PACKAGE = "PyChromecast"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "\
+    python3-zeroconf (>=0.131.0) \
+    python3-protobuf (>=4.25.2) \
+    python3-casttube (>=0.2.1) \
+"
-- 
2.34.1


