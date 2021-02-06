Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.11310.1612641653301664703
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 12:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VWptRTyq;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id j11so5289428plt.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 12:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwKwBPfu9AsOq9Y0Ok6xcuPt1EVr4A6UbJ9Pi6zWFZI=;
        b=VWptRTyq55ohM1NoA7ppAKzHCgLA1ABeUgx+WljLGI55uQsCGQCtOfviuBTS+XXkNP
         axuOcKhU89aAnPL+LRX38i7jHGn7bcrus+Q21Qkb0yyWTS60+Ula9Stwwvx4nHfe+K2X
         NvRm5WjaM9zQd91I5yX3L1QaYDLEgRiDFXwz+5CtsioKHt7JLWMCC1R8ekOmdE34jVk3
         qJg8iKvR0cIpmm/2sFeoT2WoGR3tVj3gJegJPNOP2II3nsLQrvrvwxlmipOdfN32SI1H
         ex6pdn85zIQXpLsw87LEbh56J6ToAjcXAaO+TSCIRgm9qQDFwnWR0BhbPzYrCZpzEXTH
         QZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GwKwBPfu9AsOq9Y0Ok6xcuPt1EVr4A6UbJ9Pi6zWFZI=;
        b=VkOa6mAEBs8G5DAqcAV5gyH6blXyybEZA8D9BW5AZKv4lMy8hpH6uSOfQFcoLvqDAf
         IfHXNdwJV3wHNt0Jp+9k6f2Qa3GPyY+yVaeU7QCLu55Kkx2O9X8GPrP3bTXlkMxoAzZ8
         zt7N79e9RfQOK/Sr/OEMtvcLx3ymNhhBFJGBghOnKxaq0tyvCKqFTELoZNAdkGfCL3sA
         QLImplsIlEnm/gZ2pGkBLyY0d6LfK3tAD4x1d/01n42lmP37b4KQUvt3AdYpCno99734
         4FLB871AdI4Y10ggfsvC7svZIlO48A0XjCRQURefUbskw5SD0qbzZ1i+3tKO8hT6954/
         +H6A==
X-Gm-Message-State: AOAM530qfcd46Sa8WgXMZBODj5XwPU15W9ayW4KI+0fmzymgQlSUMhfh
	pRr61tPMirkv+4YXMXbPiRiCXSf1mO9BNw==
X-Google-Smtp-Source: ABdhPJzevOMjEUBUwEJpLr6c56nkMzXVwPf+Whg/lDNz17DGY9snkCDj6b4hAX0t+DxH2aY5CgtiDg==
X-Received: by 2002:a17:90a:648f:: with SMTP id h15mr9770018pjj.142.1612641651468;
        Sat, 06 Feb 2021 12:00:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id o190sm14755649pgo.50.2021.02.06.12.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 12:00:50 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] glm: Upgrade to 0.9.9.8
Date: Sat,  6 Feb 2021 12:00:48 -0800
Message-Id: <20210206200048.412701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Update copyright years [1]

Drop patch which is already applied in this release

[1] https://github.com/g-truc/glm/commit/a2e2e97a7aa000b41288e795000bf0a6cd365133#diff-93d82d0c89b85c60d37ef8cb3828604e99efd8c53e20003a3214e8bbc715a638

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix license checksum and build with clang 12

 ...t-float-conversion-warnings-with-cla.patch | 158 ------------------
 .../glm/glm/0001-Silence-clang-warnings.patch |  50 ++++++
 .../glm/{glm_0.9.9.6.bb => glm_0.9.9.8.bb}    |   6 +-
 3 files changed, 53 insertions(+), 161 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
 create mode 100644 meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
 rename meta-oe/recipes-graphics/glm/{glm_0.9.9.6.bb => glm_0.9.9.8.bb} (86%)

diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch b/meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
deleted file mode 100644
index 2eb50a5a3a..0000000000
--- a/meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 461861cd2e34294830b121db834c05ff39424f6f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 27 Dec 2019 18:42:51 -0800
-Subject: [PATCH] Fix Wimplicit-int-float-conversion warnings with clang 10+
-
-This is a new warning in clang which will be available in clang 10
-onwards
-
-Fixes
-error: implicit conversion from 'const int' to 'float' may lose precision [-Werror,-Wimplicit-int-float-conversion]
-
-Upstream-Status: Submitted [https://github.com/g-truc/glm/pull/986]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- glm/gtx/scalar_multiplication.hpp  |  2 +-
- test/gtx/gtx_fast_trigonometry.cpp | 32 +++++++++++++++---------------
- 2 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/glm/gtx/scalar_multiplication.hpp b/glm/gtx/scalar_multiplication.hpp
-index f391f8de..496ba193 100644
---- a/glm/gtx/scalar_multiplication.hpp
-+++ b/glm/gtx/scalar_multiplication.hpp
-@@ -54,7 +54,7 @@ namespace glm
- 	template<typename T> \
- 	return_type_scalar_multiplication<T, Vec> \
- 	operator/(Vec lh, T const& s){ \
--		return lh *= 1.0f / s; \
-+		return lh *= 1.0f / static_cast<float>(s); \
- 	}
- 
- GLM_IMPLEMENT_SCAL_MULT(vec2)
-diff --git a/test/gtx/gtx_fast_trigonometry.cpp b/test/gtx/gtx_fast_trigonometry.cpp
-index f3bf17bf..f3c4e957 100644
---- a/test/gtx/gtx_fast_trigonometry.cpp
-+++ b/test/gtx/gtx_fast_trigonometry.cpp
-@@ -239,12 +239,12 @@ namespace taylorCos
- 		std::vector<glm::vec4> Results;
- 		Results.resize(Samples);
- 
--		float Steps = (End - Begin) / Samples;
-+		float Steps = (End - Begin) / float(Samples);
- 
- 		std::clock_t const TimeStampBegin = std::clock();
- 
- 		for(std::size_t i = 0; i < Samples; ++i)
--			Results[i] = fastCosNew(AngleShift + glm::vec4(Begin + Steps * i));
-+			Results[i] = fastCosNew(AngleShift + glm::vec4(Begin + Steps * float(i)));
- 
- 		std::clock_t const TimeStampEnd = std::clock();
- 
-@@ -280,12 +280,12 @@ namespace taylorCos
- 		std::vector<glm::vec4> Results;
- 		Results.resize(Samples);
- 
--		float Steps = (End - Begin) / Samples;
-+		float Steps = (End - Begin) / float(Samples);
- 
- 		std::clock_t const TimeStampBegin = std::clock();
- 
- 		for(std::size_t i = 0; i < Samples; ++i)
--			Results[i] = taylorCos::fastCosDeterminisctic(AngleShift + glm::vec4(Begin + Steps * i));
-+			Results[i] = taylorCos::fastCosDeterminisctic(AngleShift + glm::vec4(Begin + Steps * float(i)));
- 
- 		std::clock_t const TimeStampEnd = std::clock();
- 
-@@ -327,12 +327,12 @@ namespace taylorCos
- 		std::vector<glm::vec4> Results;
- 		Results.resize(Samples);
- 
--		float Steps = (End - Begin) / Samples;
-+		float Steps = (End - Begin) / float(Samples);
- 
- 		std::clock_t const TimeStampBegin = std::clock();
- 
- 		for(std::size_t i = 0; i < Samples; ++i)
--			Results[i] = taylorCos::fastRefCos(AngleShift + glm::vec4(Begin + Steps * i));
-+			Results[i] = taylorCos::fastRefCos(AngleShift + glm::vec4(Begin + Steps * float(i)));
- 
- 		std::clock_t const TimeStampEnd = std::clock();
- 
-@@ -349,12 +349,12 @@ namespace taylorCos
- 		std::vector<glm::vec4> Results;
- 		Results.resize(Samples);
- 
--		float Steps = (End - Begin) / Samples;
-+		float Steps = (End - Begin) / float(Samples);
- 
- 		std::clock_t const TimeStampBegin = std::clock();
- 
- 		for(std::size_t i = 0; i < Samples; ++i)
--			Results[i] = glm::fastCos(AngleShift + glm::vec4(Begin + Steps * i));
-+			Results[i] = glm::fastCos(AngleShift + glm::vec4(Begin + Steps * float(i)));
- 
- 		std::clock_t const TimeStampEnd = std::clock();
- 
-@@ -371,12 +371,12 @@ namespace taylorCos
- 		std::vector<glm::vec4> Results;
- 		Results.resize(Samples);
- 
--		float Steps = (End - Begin) / Samples;
-+		float Steps = (End - Begin) / float(Samples);
- 
- 		std::clock_t const TimeStampBegin = std::clock();
- 
- 		for(std::size_t i = 0; i < Samples; ++i)
--			Results[i] = glm::cos(AngleShift + glm::vec4(Begin + Steps * i));
-+			Results[i] = glm::cos(AngleShift + glm::vec4(Begin + Steps * float(i)));
- 
- 		std::clock_t const TimeStampEnd = std::clock();
- 
-@@ -466,12 +466,12 @@ namespace taylor2
- 		std::vector<float> Results;
- 		Results.resize(Samples);
- 
--		float Steps = (End - Begin) / Samples;
-+		float Steps = (End - Begin) / float(Samples);
- 
- 		std::clock_t const TimeStampBegin = std::clock();
- 
- 		for(std::size_t i = 0; i < Samples; ++i)
--			Results[i] = taylorCosA(AngleShift.x + Begin + Steps * i);
-+			Results[i] = taylorCosA(AngleShift.x + Begin + Steps * float(i));
- 
- 		std::clock_t const TimeStampEnd = std::clock();
- 
-@@ -488,12 +488,12 @@ namespace taylor2
- 		std::vector<float> Results;
- 		Results.resize(Samples);
- 
--		float Steps = (End - Begin) / Samples;
-+		float Steps = (End - Begin) / float(Samples);
- 
- 		std::clock_t const TimeStampBegin = std::clock();
- 
- 		for(std::size_t i = 0; i < Samples; ++i)
--			Results[i] = taylorCosB(AngleShift.x + Begin + Steps * i);
-+			Results[i] = taylorCosB(AngleShift.x + Begin + Steps * float(i));
- 
- 		std::clock_t const TimeStampEnd = std::clock();
- 
-@@ -510,12 +510,12 @@ namespace taylor2
- 		std::vector<float> Results;
- 		Results.resize(Samples);
- 
--		float Steps = (End - Begin) / Samples;
-+		float Steps = (End - Begin) / float(Samples);
- 
- 		std::clock_t const TimeStampBegin = std::clock();
- 
- 		for(std::size_t i = 0; i < Samples; ++i)
--			Results[i] = taylorCosC(AngleShift.x + Begin + Steps * i);
-+			Results[i] = taylorCosC(AngleShift.x + Begin + Steps * float(i));
- 
- 		std::clock_t const TimeStampEnd = std::clock();
- 
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch b/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
new file mode 100644
index 0000000000..25e851883e
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
@@ -0,0 +1,50 @@
+From 5b83983b246cff440de4421696b6b5dd9072ed2d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Feb 2021 11:36:23 -0800
+Subject: [PATCH] Silence clang warnings
+
+Fixes
+glm/gtc/random.inl:25:17: error: implicit conversion loses integer precision: 'int' to 'unsigned char' [-Werror,-Wimplicit-int-conversion]
+|                                 std::rand() % std::numeric_limits<uint8>::max());
+|                                 ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+glm/gtc/../ext/quaternion_common.inl:76:87: error: unused parameter 'k' [-Werror,-Wunused-parameter]
+    GLM_FUNC_QUALIFIER qua<T, Q> slerp(qua<T, Q> const& x, qua<T, Q> const& y, T a, S k)
+                                                                                      ^
+
+Upstream-Status: Submitted [https://github.com/g-truc/glm/pull/1055]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glm/ext/quaternion_common.inl | 2 +-
+ glm/gtc/random.inl            | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glm/ext/quaternion_common.inl b/glm/ext/quaternion_common.inl
+index 0e4a3bb2..8f9dccef 100644
+--- a/glm/ext/quaternion_common.inl
++++ b/glm/ext/quaternion_common.inl
+@@ -104,7 +104,7 @@ namespace glm
+         {
+             // Graphics Gems III, page 96
+             T angle = acos(cosTheta);
+-            T phi = angle + k * glm::pi<T>();
++            T phi = angle + static_cast<float>(k) * glm::pi<T>();
+             return (sin(angle - a * phi)* x + sin(a * phi) * z) / sin(angle);
+         }
+     }
+diff --git a/glm/gtc/random.inl b/glm/gtc/random.inl
+index 70485098..a4af2a06 100644
+--- a/glm/gtc/random.inl
++++ b/glm/gtc/random.inl
+@@ -22,7 +22,7 @@ namespace detail
+ 		GLM_FUNC_QUALIFIER static vec<1, uint8, P> call()
+ 		{
+ 			return vec<1, uint8, P>(
+-				std::rand() % std::numeric_limits<uint8>::max());
++				static_cast<uint8>(std::rand()) % std::numeric_limits<uint8>::max());
+ 		}
+ 	};
+ 
+-- 
+2.30.0
+
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
similarity index 86%
rename from meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
rename to meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
index e2f4dbebc5..c5a7c5bff8 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -6,17 +6,17 @@ HOMEPAGE = "https://glm.g-truc.net"
 BUGTRACKER = "https://github.com/g-truc/glm/issues"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://copying.txt;md5=4a735e33f271f57404fda17e80085411"
+LIC_FILES_CHKSUM = "file://copying.txt;md5=462e4b97f73ef12f8171c3c546ce4e8d"
 
 SRC_URI = " \
     git://github.com/g-truc/glm;branch=master \
-    file://0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch \
+    file://0001-Silence-clang-warnings.patch \
     file://glmConfig.cmake.in \
     file://glmConfigVersion.cmake.in \
     file://glm.pc.in \
     file://glmTargets.cmake \
 "
-SRCREV = "4db8f89aace8f04c839b606e15b39fb8383ec732"
+SRCREV = "bf71a834948186f4097caa076cd2663c69a10e1e"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.0

