Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D828C7EE36
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 08:31:28 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.10286.1677745880896162953
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 00:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DUId1+pv;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id bo22so4518489pjb.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8D4VCqMNnbXP7r3AhYFqXkTEoiRIYmL/UQapxzeWZkY=;
        b=DUId1+pvljXRP+1z1FzYfdSCRcF6PMqRFISt8IsMYBDjXt/gpBl3OC2n8lErdlQ6oO
         dBxYi8eQwPxMTTG2Vcev752vguKZcn1hXwfGQppMaU2w8DSiN4+DBUeG0/9SUv2GtU63
         Z21Y8DD7kgezRao5nZS/rmxeZA2NmG0m79AOSjkY37ute9MHtmZinv5y3oELzxGD0sn9
         1HqbftMPwStK5JfyvJJHIVQjlGxwbdwBAYJQTkZ9II8Pr/6Xb6lT31NiP5RGbgPOBMVf
         i50sbLCwOiEx8yMO/QhpLAf74Z4L70npD8iAKWMtPETd8cEUvpdGBFMyK5IMR1X12o7F
         mleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8D4VCqMNnbXP7r3AhYFqXkTEoiRIYmL/UQapxzeWZkY=;
        b=MKPiLXre5OYvQVinWUQh777uHFJfuwOH7kqOx5E4+NlNtqRY/hPxA6b7xNEMxegQu1
         JhJDTcGVPcJoEZxqKiYQx+fyY6TovC1JKSBvgvebiaD2NdyvMBjnayLICLxlvGN8+ZJt
         NNOiJVkt2jHEgvDm/2eJ9cbiCJCsL7ILLZ4sCbcv72I1Aisq/60c90q/+Fm/KuZ0RKRg
         HOpBenJMg+cJOwUT+iooocEZgJgAgeRlAPRfE3ywdnSiXoaCTy2wI1UUWmA8nSUxnWqm
         A1mdqZpuCwjmkrHbaudPVwNhPyOFBfJ/uydUSCs0a6WQqIu+TRQQnT4rPr+txNwrrtZK
         FNpA==
X-Gm-Message-State: AO0yUKUw6k4oIrV1p7+fzFfbwy0Qp+sPscmtNs1qq8klcjNMg4j4I6HY
	a4dBG4EaDbRhSWhM0+MSa91raBmIjs8=
X-Google-Smtp-Source: AK7set8BLR73nmzUfB7bCscY0bMvb57vdTpff2gAgbbjExBKNnMlWWKdqyRwXS1oe/xBJtHVXBljWA==
X-Received: by 2002:a17:90b:1d88:b0:237:8417:d9e3 with SMTP id pf8-20020a17090b1d8800b002378417d9e3mr11005649pjb.15.1677745880033;
        Thu, 02 Mar 2023 00:31:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d70d00b0019aeddce6casm9670994ply.205.2023.03.02.00.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 00:31:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] glm: Update to tip of trunk
Date: Thu,  2 Mar 2023 00:31:13 -0800
Message-Id: <20230302083116.1332448-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302083116.1332448-1-raj.khem@gmail.com>
References: <20230302083116.1332448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 08:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101328

Do not use -Werror on clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Do-not-use-Werror-with-clang.patch   | 30 +++++++++++++++++++
 .../glm/glm/0001-Silence-clang-warnings.patch | 20 -------------
 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb   |  6 ++--
 3 files changed, 33 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch

diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch b/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch
new file mode 100644
index 0000000000..7b3e005ff9
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch
@@ -0,0 +1,30 @@
+From ee405855bca7d6399ff1a1aef952010056c84ff6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 1 Mar 2023 21:08:09 -0800
+Subject: [PATCH] Do not use -Werror with clang
+
+Too many warnings to handle for a distro build
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/CMakeLists.txt | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index e7f85f19..0b6fd980 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -197,10 +197,6 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
+ 		message("GLM: Clang - ${CMAKE_CXX_COMPILER_ID} compiler")
+ 	endif()
+ 
+-	add_compile_options(-Werror -Weverything)
+-	add_compile_options(-Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-c++11-long-long -Wno-padded -Wno-gnu-anonymous-struct -Wno-nested-anon-types)
+-	add_compile_options(-Wno-undefined-reinterpret-cast -Wno-sign-conversion -Wno-unused-variable -Wno-missing-prototypes -Wno-unreachable-code -Wno-missing-variable-declarations -Wno-sign-compare -Wno-global-constructors -Wno-unused-macros -Wno-format-nonliteral)
+-
+ elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
+ 	if(NOT GLM_QUIET)
+ 		message("GLM: GCC - ${CMAKE_CXX_COMPILER_ID} compiler")
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch b/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
index 3a62fffe3a..10692dd423 100644
--- a/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
+++ b/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
@@ -26,8 +26,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  test/gtx/gtx_fast_trigonometry.cpp | 30 ++++++++++++------------------
  3 files changed, 14 insertions(+), 20 deletions(-)
 
-diff --git a/glm/ext/quaternion_common.inl b/glm/ext/quaternion_common.inl
-index 0e4a3bb2..6f99f52d 100644
 --- a/glm/ext/quaternion_common.inl
 +++ b/glm/ext/quaternion_common.inl
 @@ -104,7 +104,7 @@ namespace glm
@@ -39,21 +37,6 @@ index 0e4a3bb2..6f99f52d 100644
              return (sin(angle - a * phi)* x + sin(a * phi) * z) / sin(angle);
          }
      }
-diff --git a/glm/gtc/random.inl b/glm/gtc/random.inl
-index 70485098..a4af2a06 100644
---- a/glm/gtc/random.inl
-+++ b/glm/gtc/random.inl
-@@ -22,7 +22,7 @@ namespace detail
- 		GLM_FUNC_QUALIFIER static vec<1, uint8, P> call()
- 		{
- 			return vec<1, uint8, P>(
--				std::rand() % std::numeric_limits<uint8>::max());
-+				static_cast<uint8>(std::rand()) % std::numeric_limits<uint8>::max());
- 		}
- 	};
- 
-diff --git a/test/gtx/gtx_fast_trigonometry.cpp b/test/gtx/gtx_fast_trigonometry.cpp
-index 8bf86ba0..ddaa708b 100644
 --- a/test/gtx/gtx_fast_trigonometry.cpp
 +++ b/test/gtx/gtx_fast_trigonometry.cpp
 @@ -19,15 +19,14 @@ namespace fastCos
@@ -160,6 +143,3 @@ index 8bf86ba0..ddaa708b 100644
  		const std::clock_t timestamp3 = std::clock();
  		const std::clock_t time_fast = timestamp2 - timestamp1;
  		const std::clock_t time_default = timestamp3 - timestamp2;
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
index 9edcb2b6e1..3797314b47 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -11,19 +11,19 @@ LIC_FILES_CHKSUM = "file://copying.txt;md5=462e4b97f73ef12f8171c3c546ce4e8d"
 SRC_URI = " \
     git://github.com/g-truc/glm;branch=master;protocol=https \
     file://0001-Silence-clang-warnings.patch \
+    file://0001-Do-not-use-Werror-with-clang.patch \
     file://glmConfig.cmake.in \
     file://glmConfigVersion.cmake.in \
     file://glm.pc.in \
     file://glmTargets.cmake \
 "
-SRCREV = "bf71a834948186f4097caa076cd2663c69a10e1e"
+SRCREV = "efec5db081e3aad807d0731e172ac597f6a39447"
+PV .= "+0.9.9.9+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 inherit cmake
 
-CXXFLAGS:append:toolchain-clang = " -Wno-error=invalid-utf8 -Wno-error=disabled-macro-expansion -Wno-error=reserved-identifier"
-
 do_install() {
     install -d ${D}${includedir} ${D}${docdir}/glm ${D}${libdir}/pkgconfig ${D}${libdir}/cmake/glm
     cp -R --no-dereference --preserve=mode,links ${S}/glm ${D}${includedir}
-- 
2.39.2


