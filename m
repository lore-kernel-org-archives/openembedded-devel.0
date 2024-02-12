Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C85C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:49:18 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.3940.1707734955750500200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 02:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hLXgeUHu;
 spf=pass (domain: linaro.org, ip: 209.85.221.51, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33aea66a31cso1673526f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 02:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707734954; x=1708339754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bV7gUMO7BjxUvUthAZlVo/DDGSreyW7CMia2xZ+KwEc=;
        b=hLXgeUHu0fGfSyQb4U1EuNMQL/rmbh8ExMq4xdOhSN1WbU12sYZAadZJYIVmm0PdFr
         x+pj2yZ3KBYJ4D/DWJ+ULOYuJrp0JsYGK56q5lwGLgyLVd9nyRq2aVG/onHdNIkcZYjR
         jOz2niikx+qlrdwz6l9IRy1PPy+gcMGaAy3o65N/kAyr1dautvLS6HAinHsXT3TpL8ku
         rVHND4BwHkD557aTAnSYjtit6DROYimGoKChGnFgTSnQWzVd7t2lHy8sof9aX9QCnbEM
         MTnElw2hgIw7BE9j8JAYaTbEssjlDL9/kn7VE2l3qeXQZ4jNelDpL41npw331YxzyB6I
         jwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734954; x=1708339754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV7gUMO7BjxUvUthAZlVo/DDGSreyW7CMia2xZ+KwEc=;
        b=RKitGKVCdRGvWGhtOWv3oFVPm0CezBR2w53PJ7FE+fSPwUAoQhMunQfD80BWGCYbmP
         8tsPG4kXLzq18LIIkyN6x/LlSZewf+JTnm9mDbGbXBvRYuQumDWfttg6hFRbHX0mB2cC
         QQKVc8dwqC2VOkBUh4F7RxknJRuR/9o2KK7y/1B37Fv72t1yyvRuKYyQh9iI0bc5/BZm
         O5atMgqpqWM3HtxUbGfPi6ZcdqrKnm4ufctIabFiRly4ceqASyjuHB9fq2YFIefu3y/F
         xyS6Kg6IF3H0iaAkB+Hv79w66doMcix88pVHoOm4HBCwQYa8pZNMz0Uer5XvGRLLxfb/
         N6Tw==
X-Gm-Message-State: AOJu0YwrE7uGluyvpcYCiUgPfZYarsMKWUDL/EPPPiFzCBIuc9HAhfzW
	AEkM+MVXvgZs2pH5P0qVvvqS1tNid9H6Wk+MXHLJ5snYFZxYBahSEPZn4iMptwNjggYxg8OVrRv
	OJS0q4A==
X-Google-Smtp-Source: AGHT+IFNVQbrLe43+67mzNiPLIa7iuLLSxc8xW5b9PD9QPL0NaPcX8uh4Z3PVE6+sVqUuN0VWFo/xw==
X-Received: by 2002:adf:f701:0:b0:33b:6e33:6cc with SMTP id r1-20020adff701000000b0033b6e3306ccmr4420725wrp.36.1707734953889;
        Mon, 12 Feb 2024 02:49:13 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d67d0000000b0033af26545c8sm6403439wrw.50.2024.02.12.02.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 02:49:13 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-python][PATCH] whitenoise: add a new recipe
Date: Mon, 12 Feb 2024 11:48:55 +0100
Message-ID: <20240212104855.29980-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 10:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108706

Radically simplified static file serving for Python web apps

With a couple of lines of config WhiteNoise allows your web app
to serve its own static files, making it a self-contained unit
that can be deployed anywhere without relying on nginx, Amazon S3
or any other external service.

https://whitenoise.readthedocs.io/en/latest/

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../0001-add-setup.py.patch                   | 25 +++++++++++++++++++
 .../python/python3-whitenoise_6.6.0.bb        | 21 ++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-whitenoise/0001-add-setup.py.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-whitenoise/0001-add-setup.py.patch b/meta-python/recipes-devtools/python/python3-whitenoise/0001-add-setup.py.patch
new file mode 100644
index 0000000000..48a861496e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-whitenoise/0001-add-setup.py.patch
@@ -0,0 +1,25 @@
+From ded40864cd0d74e0881040ed580917128a83f40f Mon Sep 17 00:00:00 2001
+From: Sahaj Sarup <sahaj.sarup@linaro.org>
+Date: Thu, 16 Mar 2023 05:20:49 +0530
+Subject: [PATCH] add setup.py
+
+Signed-off-by: Sahaj Sarup <sahaj.sarup@linaro.org>
+
+Upstream-Status: Pending
+---
+ setup.py | 3 +++
+ 1 file changed, 3 insertions(+)
+ create mode 100644 setup.py
+
+diff --git a/setup.py b/setup.py
+new file mode 100644
+index 0000000..f13cf21
+--- /dev/null
++++ b/setup.py
+@@ -0,0 +1,3 @@
++from setuptools import setup
++if __name__ == '__main__':
++    setup()
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
new file mode 100644
index 0000000000..4948977448
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Radically simplified static file serving for WSGI applications"
+AUTHOR = "David Evans <d@evans.io>"
+HOMEPAGE = "https://whitenoise.evans.io"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aba4901cc64e401cea5a267eac2a2e1e"
+
+PYPI_PACKAGE = "whitenoise"
+
+SRC_URI += "file://0001-add-setup.py.patch"
+
+SRC_URI[sha256sum] = "8998f7370973447fac1e8ef6e8ded2c5209a7b1f67c1012866dbcd09681c3251"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN}:append = " \
+    python3-brotli \
+    python3-coverage \
+    python3-django \
+    python3-pytest \
+    python3-requests \
+"
-- 
2.43.0


