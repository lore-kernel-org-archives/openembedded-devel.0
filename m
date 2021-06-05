Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.7580.1622856611138044526
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 18:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CDgZZ/Xi;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id e22so9197445pgv.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 18:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aHPByOWKot3j3tItHNj3ZE61mGqobYpaShvzyUAYhnU=;
        b=CDgZZ/XiuWRtS6SjJL94qRP9JWLVG7W+CVBnls9NkBhCik00FUUr6OGbPPoZCMAjs/
         pR3PCI6vWX2vWbbCdh48yCGp7lGx6O4SKoi7CxOEJJF5Zbau62kIBwsAbO4m+ckl5hmF
         DybmFpKb9Y2j187aWvfsbWvhW05UBK2xqddrCxtmbtHkzmrj5wlaJxyM2cFmpk/AGb4U
         wyZzTmoWRrAiMMIS7SzTWBOsHlZrTOD/3ZKNX/7rquY18NsA/VmGzbCMypskpYojkXDV
         geccnlBlkEcbfqZh2H6zWNo9H51QS6rJS6Sm1h2sePp3WIq+E2W0H1jM/uzswMatmBEo
         7ZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aHPByOWKot3j3tItHNj3ZE61mGqobYpaShvzyUAYhnU=;
        b=oAx7AEdpysKbzz/ty8bQpHfll0vfS69axcB24rbQw2a+Xc3Uqc4jUuTM32pCqVQNyH
         BWl5PXt2k6KRDmdaEzdjc8yWFMOg5hUrnQLIKHLFRDUC9oEcpPmmp6VDe7FeO0TfWFGt
         /evf76p88EQ7/o7qcA6iOhgOAYhPejVz1BuIfo+lAtby+Af39s6HRCqTiGF4FrtuadO+
         1AyfwzByM3qicRiQLBT0k/AkMALql+2ls3ewikGO2PGE7YkwKMdnz80sYbX9A+b9fq24
         EPgTOs/7B+ejCV+4x4QMR5Mj/PkTuUQY4QrjdgSAbsWQhAs+VpIWROZIH8sjvoF8bl0f
         DlXw==
X-Gm-Message-State: AOAM532DAbm7YaS5gdpgLzy4LJC4uGlOWdBU5kX2CvyY42fyIHks/pBr
	4jgX0ZlTV64nxDaKZ6AAqvfeMG6vwsZ6ZQ==
X-Google-Smtp-Source: ABdhPJxLUrbJjEfhTZdLhvCHg14/3lzCR6XLkLEWWzj12KaFRjO2Aj+n/kvsTjxxy7fhzUphuyVy0g==
X-Received: by 2002:aa7:820f:0:b029:2e9:c89a:5cdb with SMTP id k15-20020aa7820f0000b02902e9c89a5cdbmr7118516pfi.41.1622856610228;
        Fri, 04 Jun 2021 18:30:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id q68sm5767188pjq.45.2021.06.04.18.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 18:30:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] glm: Fix additional clang warnings
Date: Fri,  4 Jun 2021 18:30:03 -0700
Message-Id: <20210605013005.976154-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605013005.976154-1-raj.khem@gmail.com>
References: <20210605013005.976154-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glm/glm/0001-Silence-clang-warnings.patch | 131 ++++++++++++++++--
 1 file changed, 123 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch b/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
index 25e851883e..3a62fffe3a 100644
--- a/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
+++ b/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
@@ -1,6 +1,6 @@
-From 5b83983b246cff440de4421696b6b5dd9072ed2d Mon Sep 17 00:00:00 2001
+From bd9b5060bc3b9581090d44f15b4e236566ea86a6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Feb 2021 11:36:23 -0800
+Date: Fri, 4 Jun 2021 12:57:57 -0700
 Subject: [PATCH] Silence clang warnings
 
 Fixes
@@ -12,15 +12,22 @@ glm/gtc/../ext/quaternion_common.inl:76:87: error: unused parameter 'k' [-Werror
     GLM_FUNC_QUALIFIER qua<T, Q> slerp(qua<T, Q> const& x, qua<T, Q> const& y, T a, S k)
                                                                                       ^
 
+and
+
+test/gtx/gtx_fast_trigonometry.cpp:135:9: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
+|                 float result = 0.f;
+|                       ^
+
 Upstream-Status: Submitted [https://github.com/g-truc/glm/pull/1055]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- glm/ext/quaternion_common.inl | 2 +-
- glm/gtc/random.inl            | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ glm/ext/quaternion_common.inl      |  2 +-
+ glm/gtc/random.inl                 |  2 +-
+ test/gtx/gtx_fast_trigonometry.cpp | 30 ++++++++++++------------------
+ 3 files changed, 14 insertions(+), 20 deletions(-)
 
 diff --git a/glm/ext/quaternion_common.inl b/glm/ext/quaternion_common.inl
-index 0e4a3bb2..8f9dccef 100644
+index 0e4a3bb2..6f99f52d 100644
 --- a/glm/ext/quaternion_common.inl
 +++ b/glm/ext/quaternion_common.inl
 @@ -104,7 +104,7 @@ namespace glm
@@ -28,7 +35,7 @@ index 0e4a3bb2..8f9dccef 100644
              // Graphics Gems III, page 96
              T angle = acos(cosTheta);
 -            T phi = angle + k * glm::pi<T>();
-+            T phi = angle + static_cast<float>(k) * glm::pi<T>();
++            T phi = angle + static_cast<T>(k) * glm::pi<T>();
              return (sin(angle - a * phi)* x + sin(a * phi) * z) / sin(angle);
          }
      }
@@ -45,6 +52,114 @@ index 70485098..a4af2a06 100644
  		}
  	};
  
+diff --git a/test/gtx/gtx_fast_trigonometry.cpp b/test/gtx/gtx_fast_trigonometry.cpp
+index 8bf86ba0..ddaa708b 100644
+--- a/test/gtx/gtx_fast_trigonometry.cpp
++++ b/test/gtx/gtx_fast_trigonometry.cpp
+@@ -19,15 +19,14 @@ namespace fastCos
+ 	{
+ 		const float begin = -glm::pi<float>();
+ 		const float end = glm::pi<float>();
+-		float result = 0.f;
+ 
+ 		const std::clock_t timestamp1 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::fastCos(i);
++			glm::fastCos(i);
+ 
+ 		const std::clock_t timestamp2 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::cos(i);
++			glm::cos(i);
+ 
+ 		const std::clock_t timestamp3 = std::clock();
+ 		const std::clock_t time_fast = timestamp2 - timestamp1;
+@@ -53,15 +52,14 @@ namespace fastSin
+ 	{
+ 		const float begin = -glm::pi<float>();
+ 		const float end = glm::pi<float>();
+-		float result = 0.f;
+ 
+ 		const std::clock_t timestamp1 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::fastSin(i);
++			glm::fastSin(i);
+ 
+ 		const std::clock_t timestamp2 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::sin(i);
++			glm::sin(i);
+ 
+ 		const std::clock_t timestamp3 = std::clock();
+ 		const std::clock_t time_fast = timestamp2 - timestamp1;
+@@ -79,15 +77,14 @@ namespace fastTan
+ 	{
+ 		const float begin = -glm::pi<float>();
+ 		const float end = glm::pi<float>();
+-		float result = 0.f;
+ 
+ 		const std::clock_t timestamp1 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::fastTan(i);
++			glm::fastTan(i);
+ 
+ 		const std::clock_t timestamp2 = std::clock();
+ 		for (float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::tan(i);
++			glm::tan(i);
+ 
+ 		const std::clock_t timestamp3 = std::clock();
+ 		const std::clock_t time_fast = timestamp2 - timestamp1;
+@@ -105,15 +102,14 @@ namespace fastAcos
+ 	{
+ 		const float begin = -glm::pi<float>();
+ 		const float end = glm::pi<float>();
+-		float result = 0.f;
+ 
+ 		const std::clock_t timestamp1 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::fastAcos(i);
++			glm::fastAcos(i);
+ 
+ 		const std::clock_t timestamp2 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::acos(i);
++			glm::acos(i);
+ 
+ 		const std::clock_t timestamp3 = std::clock();
+ 		const std::clock_t time_fast = timestamp2 - timestamp1;
+@@ -132,13 +128,12 @@ namespace fastAsin
+ 	{
+ 		const float begin = -glm::pi<float>();
+ 		const float end = glm::pi<float>();
+-		float result = 0.f;
+ 		const std::clock_t timestamp1 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::fastAsin(i);
++			glm::fastAsin(i);
+ 		const std::clock_t timestamp2 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::asin(i);
++			glm::asin(i);
+ 		const std::clock_t timestamp3 = std::clock();
+ 		const std::clock_t time_fast = timestamp2 - timestamp1;
+ 		const std::clock_t time_default = timestamp3 - timestamp2;
+@@ -155,13 +150,12 @@ namespace fastAtan
+ 	{
+ 		const float begin = -glm::pi<float>();
+ 		const float end = glm::pi<float>();
+-		float result = 0.f;
+ 		const std::clock_t timestamp1 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::fastAtan(i);
++			glm::fastAtan(i);
+ 		const std::clock_t timestamp2 = std::clock();
+ 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
+-			result = glm::atan(i);
++			glm::atan(i);
+ 		const std::clock_t timestamp3 = std::clock();
+ 		const std::clock_t time_fast = timestamp2 - timestamp1;
+ 		const std::clock_t time_default = timestamp3 - timestamp2;
 -- 
-2.30.0
+2.31.1
 
-- 
2.31.1

