Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.9251.1612632454384117120
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 09:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YOBlfqYl;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id g3so5205674plp.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 09:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1I4YcatVQPh3BmwuQddE+9zcVrvO9Jbxe0pzAtIkTAE=;
        b=YOBlfqYlEYtGAereh9jx1Uu2vqXYnqlpM3LOMQePjp1k5VhSdqwxabGowaTfWLoMwn
         UioDvj3EqB1eUyo318In68UOhjPkkixIVeupT0jNg6KhsJ2exb3r9SSqT2N9SpBbxEM1
         cUb5Ai/7DIpoQWQ0H7Ig1U/c3f97f0J+fA7w8n6Splzq1xHS/j/oHDz4ozQw0UXn3cG9
         MGZb8cPbuFA8qdPBl7sBgb/HXNJk5cmv/+bKdmxi+Q+TeSkayvg8hbv8BrXyTpe6XYQw
         bDffzp57jYm5URiOGV9z8lyeyId89e3qCwI+itSwdlJXvDkW8wYE8S6hnbSnk6VV0Zad
         4y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1I4YcatVQPh3BmwuQddE+9zcVrvO9Jbxe0pzAtIkTAE=;
        b=C9kyNaKsx2042440DZobtQXHJGPfO/QmLeGRJS4+2q+RNA16phtYzfwn49TqI4XOiQ
         YbrejMKscf9HFLRnVGzFSK713S2VTqdD4kRWQ2/K0/deRsGw+tjli3r0mAuc0HbBG9jv
         FjcKkMfrmGx6MJTwc4MJgHm4IroQ28ghF85mwq1jvfboN9u5UzIMnK+ua1tnjr10PtOj
         dSwFSCqfeqr76KRNFYhv/d0d0f80+NRqN5dQZQ06mYIoJCcAEwVbfTomKfFUBQYmqCOt
         yWMTpGeH1RDw62iK/x+O8z/PFI7eZhQoBviKJlRtG5fh25pvDgM+jdstC/8xrd8ERgnu
         oKBw==
X-Gm-Message-State: AOAM530fVKSi9MDiH72EY6RkCKePTBPTIVrOJ2XbdlZ97SwDIK2jM22k
	iXC8HEuSrAxoCtXhMXUj2GAKzFcJ5CYDVQ==
X-Google-Smtp-Source: ABdhPJxORYD3ZeRZ/Z0W2G+D2R0Tke5mTRn0gf+qm3vqdKN5Wus4UCB6B+BY8F0puCLvvTy2hHBXdw==
X-Received: by 2002:a17:902:bb90:b029:df:bdbb:be99 with SMTP id m16-20020a170902bb90b02900dfbdbbbe99mr9030682pls.52.1612632453388;
        Sat, 06 Feb 2021 09:27:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id c84sm1815807pfb.16.2021.02.06.09.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 09:27:32 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] glm: Upgrade to 0.9.9.8
Date: Sat,  6 Feb 2021 09:27:30 -0800
Message-Id: <20210206172730.4113445-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patch which is already applied in this release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-float-conversion-warnings-with-cla.patch | 158 ------------------
 .../glm/{glm_0.9.9.6.bb => glm_0.9.9.8.bb}    |   3 +-
 2 files changed, 1 insertion(+), 160 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
 rename meta-oe/recipes-graphics/glm/{glm_0.9.9.6.bb => glm_0.9.9.8.bb} (91%)

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
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
similarity index 91%
rename from meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
rename to meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
index e2f4dbebc5..bd3d834567 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -10,13 +10,12 @@ LIC_FILES_CHKSUM = "file://copying.txt;md5=4a735e33f271f57404fda17e80085411"
 
 SRC_URI = " \
     git://github.com/g-truc/glm;branch=master \
-    file://0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch \
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

