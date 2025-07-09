Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EE1C83F16
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:16 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.3043.1752082273124912454
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GkY4Ei8n;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b16a0e38so68137e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082271; x=1752687071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7ZGdYRTOarVzwX2zsHbOj6nDQpn7LCAtQ/m6E5rpys=;
        b=GkY4Ei8n3ntj7ZssEckfTsqjfTLO9Xe3StqRSKezBLQq1P8X1wmtbPmnughUsGwOTn
         0lRbbpSihWuV1tPkdXcURE5eDuGt+25sDuLVDQc9MVHvPLPOBv4isK8RiDyRI7MFKXFE
         uIx1s4EEnO+j9Mmwp//ItGD267J8U3Hvcih/dt85LMgROkcv5jdBOG3axLgt0ab2H2v1
         B+zkGw+qG4LO8DLE353eIqT7rYOYr6n9Tukz2BgnqltbMRtAvdcCTvUjlh7r3339oNAd
         MRqtrHb3Y6SYwV3D7EL8R/qcnoSJoznZJJKo+iO8MPyWxRrlG8XqJMMrNGiEIfgh/qTF
         csOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082271; x=1752687071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7ZGdYRTOarVzwX2zsHbOj6nDQpn7LCAtQ/m6E5rpys=;
        b=DyDOF51T9V9gIo5Al6Tlfljrp8VcWqEQr+Azbx0RU5ChBSuoK7cJja+lOsN6/dTyo+
         zOCrLs9eGreScHw9Mquy2IXhN3Cvlj9U+0lXuBvgsMRs9hHAFxFo+Nf0nkBqhTB8VrVY
         KRTOh4Wxy3sKJRx53FV/freBShPzyA8fexZ2KFpVaVjANFpOD5iFGjYwPGcarUpnzCdU
         9XpvL+ruT6sjsA8qEicyqne4wcmCYIfpMe8TCmGX9tyi/R0ntZ1FrrCvvIK/Yc7HpsPs
         6U142WPEZNUH4wGBSnlrHnhNM9jTOgjeh1Y/7/8et1ibC1mN41GTN5rq+n6vWEOzcE2H
         TuiA==
X-Gm-Message-State: AOJu0YxW9qAiJWYwmzqzDZa+mxXfqDNcj704/QgiwIUGRnAaawNW3P6w
	E/4TiV+HZ0a8pyygfQn2qcXdfxEDCNbuacYaRWg2ydqLDdBlKSG9nu+RowUA3Q==
X-Gm-Gg: ASbGncvBCQ8Z9T76QcJiMGKvkA4I82R//xCsWCFCoRehJJ3tIlyw1gSy565hzbmpr2q
	kfulXkSNsfQjkFTRYhiOSYc1hOeNvRVO9y6w4vNYlvXTl3G1prP4//EwXQmIz+2E+0TLvDITPhl
	20xKafa1mtMnNHDt+08u6fsm/Wl4skeN8phGlwsyKfOdgpMNDzANRFQgwIhqxQaT/Jm1GZpASKh
	kDLw3J6RRN+XjAhImYfhrzSGHLFO/rDfJlAQePTvF5KwAkEjl47n+AIzBuCgQUvxbRb8is6H4CR
	KP34q8OP989/if8yguw9Ci+C2YNvkGxfvMaAdcCexy3IZHGuxfLiuTt8dbTNMvfY0eXZGcZa1Nh
	Nfd8=
X-Google-Smtp-Source: AGHT+IH+HfB6PXsKLG/E0cI98ZZxLZ/f4+Ws91Hn2USDYI3TgWNxJAMtcSLf4ehUEecHeDw9RzXJ5Q==
X-Received: by 2002:a05:6512:3f23:b0:553:543d:d963 with SMTP id 2adb3069b0e04-559000865f1mr261054e87.36.1752082270659;
        Wed, 09 Jul 2025 10:31:10 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:10 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 04/20] mraa: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:38 +0300
Message-ID: <20250709173054.605430-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118358

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
 .../mraa/0003-allow-build-with-cmake-4.patch  | 40 +++++++++++++++++++
 meta-oe/recipes-extended/mraa/mraa_git.bb     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa/0003-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-extended/mraa/mraa/0003-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/mraa/mraa/0003-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..4b9699ac46
--- /dev/null
+++ b/meta-oe/recipes-extended/mraa/mraa/0003-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From daa2cd10b3858f3908a0a29ad69430bfd94c13f0 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 11:09:26 +0300
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
+Upstream-Status: Submitted [https://github.com/eclipse/mraa/pull/1141]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 370b891..0814e5c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 2.8.11)
++cmake_minimum_required (VERSION 3.5)
+ project (mraa C)
+ 
+ FIND_PACKAGE (Threads REQUIRED)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index b53be9803e..f9b4122439 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch \
            file://0001-mraa-Use-posix-basename.patch \
            file://0002-gpio-Include-limits.h-for-PATH_MAX.patch \
+           file://0003-allow-build-with-cmake-4.patch \
            "
 
 
-- 
2.43.0


