Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C625C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:59 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.5606.1752004669772403311
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jQ3/XdqV;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso54555651fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004667; x=1752609467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtlVV3RIhy6VnnzRoHnyTZsJHR8bl0tTZsvEWvqM24k=;
        b=jQ3/XdqVoTxWe4feHjF+xsD2UuUSGgyBiqNw2Uc/KfJ70tcQK4gv7DY1RWtLg9PSE+
         9wC3DzICd4+cqeBm+U5pLX1zhBy0Fwo5HBxsQUaQJ8dvi+Ac28r7jF+OONlkwtaqFRi/
         bUuPMCPEoA/VtEphLB3gEwz7a4oL32Slxf3oN/o5aIZxrz2cwpAyyW9vX2jpmbmyoeAh
         yIluI7aXFEM9HYyEKqzCmlfmN2dhMxGfP4gByI0UZtDyTA9W5TPcOudRPUPy5FircxA/
         qsHqQ3yTNA5pg4KSYD/swDpHtj81/KgrzCKyxxpeIhiEWr1PNL34l7goMYfVUhEuf5if
         Iicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004667; x=1752609467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtlVV3RIhy6VnnzRoHnyTZsJHR8bl0tTZsvEWvqM24k=;
        b=HUOdCWJIPo8bv61l1E4QHgeUVdtJ00Bm/WRfKdlJvQP1T9sKFdTdLc22zlkn2Ieqxd
         ITfdaJdjKXF2CQHN9UyiYwclepgVpOmgRBoOqPXCWJgbGy/qNVV0zTIvVuXZFOBEyEwX
         ljC8uFw29/1OJHbSrnvzGKvTLUYUJdpH3r4Wey+LXPH5SJ6zN+eHh4zhQU5cFR84COxr
         w3dqeIYqGbRHwGIcH0vk67hA4HHIxBH1+ii/SfHTuYqzJmlNEMU/fr0jCZEsXljGkKOH
         4TUetOv0/MxWzpgQtZsnxWKOO/CF/Q565gVAx5KCy3VS860DoGPhNG527+6dXwaqbOVq
         MuuA==
X-Gm-Message-State: AOJu0YxrhRP4udbe+IoTFybgnQ2CfzxeOGTOUPezxikRYp0vVRZRP62j
	sYppah6IraIyMbxiIRrUJXUSfKjjjfDDz7dVZlPMA+tHHWlLE87sMx8kh1jFTQ==
X-Gm-Gg: ASbGnctzodixpO8kjcK8M0+Ho2JPyxtv7YImJbjDwfkP6nfWbNbHshyh6JiEstDrTOa
	Pyv7ZemrtjQ1zebOebLKWUFp4SxomBMHhDm5dKCwRnYBOhrNUZ7jgy4BJoDAckKXqyW1/NZ9zor
	y/IRKSKufDRW7NQMF/L+FttZrvN6MHra2DsKoaqcSQPKT0tBA5BQ1NvsuLYEifVh4RwIZx2ZmnI
	e+nnCf7Es4m0nbct7FtGyzeZ+NdKj7oc703zGkSxt36D1HC0IlTOF5+5YdfbMtS2Y73vM40Ui1n
	LF+SxacZBbJl4bBildlutF+UivUNOy3UINT5ED4yHGwqtfvkiKosoaWgiq4EdndqjHxCNwlpTRt
	QMX8=
X-Google-Smtp-Source: AGHT+IGkTj7K6dX4LJ0O6DyOQeb76+cZ7Vpk9R85jecI2NcyWuIzEmbTYcxsFcOIYHKQuWcn4jLWrA==
X-Received: by 2002:a05:651c:4201:b0:32c:ab57:b03 with SMTP id 38308e7fff4ca-32f42d15e2amr2154791fa.3.1752004667292;
        Tue, 08 Jul 2025 12:57:47 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:46 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 16/20] double-conversion: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:32 +0300
Message-ID: <20250708195636.1678606-16-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118338

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../dc/double-conversion_3.3.1.bb             |  3 +-
 .../files/0001-allow-build-with-cmake-4.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
index 31330faa17..42777971d8 100644
--- a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
+++ b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
@@ -5,11 +5,10 @@ HOMEPAGE = "https://github.com/google/double-conversion.git"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ea35644f0ec0d9767897115667e901f"
 
-
-
 SRC_URI = " \
         git://github.com/google/double-conversion.git;protocol=https;branch=master \
         file://run-ptest \
+        file://0001-allow-build-with-cmake-4.patch \
 "
 SRCREV = "ae0dbfeb9744efd216c95b30555049d75d47116a"
 
diff --git a/meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..db8296c65d
--- /dev/null
+++ b/meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From 1652f5b555b4b4a7916af40bebacc32c23e4aca5 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 20:43:45 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Backport [https://github.com/google/double-conversion/commit/101e1ba89dc41ceb75090831da97c43a76cd2906]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8749ef8..3145772 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ project(double-conversion VERSION 3.3.0)
+ 
+ option(BUILD_SHARED_LIBS "Build shared libraries (.dll/.so) instead of static ones (.lib/.a)" OFF)
+-- 
+2.43.0
+
-- 
2.43.0


