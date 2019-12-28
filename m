Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2C33D7C7A9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 08:07:49 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id q127so15546649pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 00:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4eTXXCxRp9511xkohVxNlYMUESe+wYkit6IoCmyIjPE=;
	b=ZgRAd6vB0af0HQ7uaUToRWgQbOfcdfKh+R5WwO3Ge0YLMga1xVEqSBaOi12DkEy8/z
	bUPX38C5x7xq0Hz2O4SpnZjTqOJyr1Fu5T9jyY/jrJutW2zgmsAgK6FeyvTH88tzYNwo
	t8wrfvl0XY3EG82Gzq2oXBAth8jMkaWi3P5dDXwfsV6DsfZlhx7JkKEVoh2BdLkxoh99
	4YTQeNtL4OcA3kw7rdu8aUDtUiDkWBqkgXYC4sApVHuDHBUYorvRwnKw0Jsbqzgaw5UV
	EmkFUNc4D4vixgCj+WesjttbWfP6jqBmodo6uJZzKYUAFeJ/mrUg6XwEUIO1d9DXzf+9
	hJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4eTXXCxRp9511xkohVxNlYMUESe+wYkit6IoCmyIjPE=;
	b=umMz9GYGg9W4cMuWYeU9lU6R+6qNPnk8ztnlt5HktaXvMNVNUK5rExcdUx3wjrVgIu
	1lU4n6oMQ8phztTZz5/GiTGQ1DoLIx1ctgrFX2eSaEZ/8uOU43iN+F/LlgHEjjQNcT7C
	ZwtveVTOEaOyqVuSbgnUyXlS28hSmOPDHXQZIPougtjjtLP4RwTgkSWnOyFmBvNli0No
	WEFwdi7BXljp8NcX3JTlTDolzQhwQAXwXlsi2g8Dm4+DuJDGvFWjAVQnt0x9dy+2jC3Y
	BuWKl/AY+4EfaBjdqwxdKfycHQ+IdUAW1XvtYFwUnAnt0JZyaKUuH5lR9xVwBZGOJf7U
	VL0A==
X-Gm-Message-State: APjAAAVg5LN0WOlaU66OvgP9LF8wvxsSEUSy5WreBsb3CVfeRPhxdkTd
	F5kJODd5QftqlzYUIteP7eTB3luWzzI=
X-Google-Smtp-Source: APXvYqzJ89P5K49vMM/+lgoh+ClgjS0KxMI3wIl40/qtH5gY3nlsCUfnT4pvZvfqkiP85TX6SOHh5A==
X-Received: by 2002:a63:de4a:: with SMTP id y10mr59524609pgi.367.1577520470709;
	Sat, 28 Dec 2019 00:07:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r66sm44135124pfc.74.2019.12.28.00.07.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2019 00:07:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Dec 2019 00:07:39 -0800
Message-Id: <20191228080740.63169-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191228080740.63169-1-raj.khem@gmail.com>
References: <20191228080740.63169-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] glm: Upgrade to 0.9.9.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Dec 2019 08:07:50 -0000
Content-Transfer-Encoding: 8bit

License-Update: Use copying.txt for checksum, no change in licenses as
such

Fix type conversion warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-float-conversion-warnings-with-cla.patch | 158 ++++++++++++++++++
 .../glm/{glm_0.9.9.5.bb => glm_0.9.9.6.bb}    |   8 +-
 2 files changed, 163 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
 rename meta-oe/recipes-graphics/glm/{glm_0.9.9.5.bb => glm_0.9.9.6.bb} (66%)

diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch b/meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
new file mode 100644
index 0000000000..2eb50a5a3a
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm/0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch
@@ -0,0 +1,158 @@
+From 461861cd2e34294830b121db834c05ff39424f6f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Dec 2019 18:42:51 -0800
+Subject: [PATCH] Fix Wimplicit-int-float-conversion warnings with clang 10+
+
+This is a new warning in clang which will be available in clang 10
+onwards
+
+Fixes
+error: implicit conversion from 'const int' to 'float' may lose precision [-Werror,-Wimplicit-int-float-conversion]
+
+Upstream-Status: Submitted [https://github.com/g-truc/glm/pull/986]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glm/gtx/scalar_multiplication.hpp  |  2 +-
+ test/gtx/gtx_fast_trigonometry.cpp | 32 +++++++++++++++---------------
+ 2 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/glm/gtx/scalar_multiplication.hpp b/glm/gtx/scalar_multiplication.hpp
+index f391f8de..496ba193 100644
+--- a/glm/gtx/scalar_multiplication.hpp
++++ b/glm/gtx/scalar_multiplication.hpp
+@@ -54,7 +54,7 @@ namespace glm
+ 	template<typename T> \
+ 	return_type_scalar_multiplication<T, Vec> \
+ 	operator/(Vec lh, T const& s){ \
+-		return lh *= 1.0f / s; \
++		return lh *= 1.0f / static_cast<float>(s); \
+ 	}
+ 
+ GLM_IMPLEMENT_SCAL_MULT(vec2)
+diff --git a/test/gtx/gtx_fast_trigonometry.cpp b/test/gtx/gtx_fast_trigonometry.cpp
+index f3bf17bf..f3c4e957 100644
+--- a/test/gtx/gtx_fast_trigonometry.cpp
++++ b/test/gtx/gtx_fast_trigonometry.cpp
+@@ -239,12 +239,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = fastCosNew(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = fastCosNew(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -280,12 +280,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCos::fastCosDeterminisctic(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = taylorCos::fastCosDeterminisctic(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -327,12 +327,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCos::fastRefCos(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = taylorCos::fastRefCos(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -349,12 +349,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = glm::fastCos(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = glm::fastCos(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -371,12 +371,12 @@ namespace taylorCos
+ 		std::vector<glm::vec4> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = glm::cos(AngleShift + glm::vec4(Begin + Steps * i));
++			Results[i] = glm::cos(AngleShift + glm::vec4(Begin + Steps * float(i)));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -466,12 +466,12 @@ namespace taylor2
+ 		std::vector<float> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCosA(AngleShift.x + Begin + Steps * i);
++			Results[i] = taylorCosA(AngleShift.x + Begin + Steps * float(i));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -488,12 +488,12 @@ namespace taylor2
+ 		std::vector<float> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCosB(AngleShift.x + Begin + Steps * i);
++			Results[i] = taylorCosB(AngleShift.x + Begin + Steps * float(i));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+@@ -510,12 +510,12 @@ namespace taylor2
+ 		std::vector<float> Results;
+ 		Results.resize(Samples);
+ 
+-		float Steps = (End - Begin) / Samples;
++		float Steps = (End - Begin) / float(Samples);
+ 
+ 		std::clock_t const TimeStampBegin = std::clock();
+ 
+ 		for(std::size_t i = 0; i < Samples; ++i)
+-			Results[i] = taylorCosC(AngleShift.x + Begin + Steps * i);
++			Results[i] = taylorCosC(AngleShift.x + Begin + Steps * float(i));
+ 
+ 		std::clock_t const TimeStampEnd = std::clock();
+ 
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
similarity index 66%
rename from meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb
rename to meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
index f367e4eae0..817b8392b2 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
@@ -6,13 +6,13 @@ HOMEPAGE = "https://glm.g-truc.net"
 BUGTRACKER = "https://github.com/g-truc/glm/issues"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://readme.md;beginline=21;endline=22;md5=3075b5727d36f29edccf97b93e72b790"
+LIC_FILES_CHKSUM = "file://copying.txt;md5=4a735e33f271f57404fda17e80085411"
 
 SRC_URI = " \
     git://github.com/g-truc/glm;branch=master \
+    file://0001-Fix-Wimplicit-int-float-conversion-warnings-with-cla.patch \
 "
-# v0.9.9.5
-SRCREV = "d162eee1e6f7c317a09229fe6ceab8ec6ab9a4b4"
+SRCREV = "4db8f89aace8f04c839b606e15b39fb8383ec732"
 
 S = "${WORKDIR}/git"
 
@@ -21,3 +21,5 @@ inherit cmake
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native"
+
+OECMAKE_GENERATOR = "Unix Makefiles"
-- 
2.24.1


