Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.1067.1598379256010178922
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 11:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kmhjWATW;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id w2so5932923qvh.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2k48g8t24FGSUbcwTVDxvlEQ0u9749k9s14BF15YWgk=;
        b=kmhjWATWY/K2wTWhsGN/Qor10rjbQoxB7obMQy010Y67/MNHH0BkjB8BP62mXJ04jB
         SumYYvZ0sBX/ZRa+84uSNKx66J/XzkLW+GGP6L0TIdJJZvtDANgIwOWYMcivAS3tdAo4
         D+Z10+i3aKzQlINpEX7TT01dkB0rsnjgByL1ky8wZ+w8X365EEuB6NwW+HqZFiNdijKO
         HEPKDFJXgJFyv9IlPHkAONEOZOdCPtuOsQHvQj6ocdNfIE8+dJJfEU+xQNbzFMUH2PlC
         JkZA14lN7RQvd3Kjot+vHMCxzZ06jZVLTCBxvfkfQ2i1ZOCd8JgXWW+lQmJM6CXic6fH
         IS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2k48g8t24FGSUbcwTVDxvlEQ0u9749k9s14BF15YWgk=;
        b=WEUb4JsZ+n/7lXWWVz4FBza5V+kiyhpCx9o5gVleqQawHRrZRpDXeYiAw6EfSWkMjR
         MD0+zg+Pg6qpvfxbENLtgh9xoDd+bKHBR0shwLznHEFR6h41Et8GJDgOddoL8DKW91Ee
         D4WDpdkeYAu+E4N60P2LOQjRPzPyBNDqCmuHHzkLcTxA0LKyy+ykeHVkKm7Rv8f2STD3
         7crj5asByREOTaRKuq7bAPYTbecbPB7HLfniRwzIlj4jAGjnRoFozzwoLVZt8MLBeFI8
         8hay1vDNh6H7hW1I1XTkJSOisuY6uu8v6hhYlwtVY4QdefvdP/gIGsN4R2IHY/J2xLlL
         DYKg==
X-Gm-Message-State: AOAM531c8BSJSe6zcM4w2W6IMWuDQ/RVq6d5yoVyoonBertqhhS8MKOe
	22H61ELrVh76BxIkRmw5RtpTSgVjQWirRw==
X-Google-Smtp-Source: ABdhPJw+vlfSedZvkrF0L+sLuIfBcY15t4KdUn1EAG1Nv6QaBFIU+VHV3h4XLOznZ21P9bslpWnr7g==
X-Received: by 2002:ad4:46e7:: with SMTP id h7mr10220178qvw.153.1598379254845;
        Tue, 25 Aug 2020 11:14:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.cable.comcast.com ([2601:646:9200:4e0::55db])
        by smtp.gmail.com with ESMTPSA id f3sm5410208qth.56.2020.08.25.11.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 11:14:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [meta-oe][PATCH] vulkan-cts: Update to 1.2.3.2
Date: Tue, 25 Aug 2020 11:14:10 -0700
Message-Id: <20200825181410.1693069-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825181410.1693069-1-raj.khem@gmail.com>
References: <20200825181410.1693069-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand SRCREV_FORMAT to cover all repos in SRC_URI
Drop using tags since they force bitbake to enquire remote, use
corresponding SRCREV instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc            | 4 ++--
 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb   | 3 ++-
 .../{vulkan-cts_1.2.3.0.bb => vulkan-cts_1.2.3.2.bb}          | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.2.3.0.bb => vulkan-cts_1.2.3.2.bb} (90%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 4a297c313a..e64a935dda 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -2,7 +2,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "\
-	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;tag=${BPN}-${PV};name=vk-gl-cts \
+	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
 	git://github.com/google/amber;protocol=https;destsuffix=git/external/amber/src;name=amber;branch=main \
 	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang \
 	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers \
@@ -12,7 +12,7 @@ SRC_URI = "\
 
 S = "${WORKDIR}/git"
 
-SRCREV_FORMAT = "vk-gl-cts"
+SRCREV_FORMAT = "vk-gl-cts_amber_glslang_spirv-headers_spirv-tools"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
index 0e50fd9474..5e0076b207 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "OpenGL CTS"
 
 require khronos-cts.inc
-
+# opengl-es-cts-3.2.6.1
+SRCREV_vk-gl-cts = "7e023f81b4fff54b558882fe739d7c959d0a02a8"
 SRCREV_amber = "d26ee22dd7faab1845a531d410f7ec1db407402a"
 SRCREV_glslang = "c538b5d796fb24dd418fdd650c7f76e56bcc3dd8"
 SRCREV_spirv-headers = "e4322e3be589e1ddd44afb20ea842a977c1319b8"
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.2.bb
similarity index 90%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.2.bb
index 77064d4ede..f07b12decd 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.2.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
-
+# vulkan-cts-1.2.3.2
+SRCREV_vk-gl-cts = "5cd2240b60825fbbf6bd9ddda6af176ee3100c70"
 SRCREV_amber = "a40bef4dba98d2d80b48e5a940d8574fbfceb197"
 SRCREV_glslang = "b5f003d7a3ece37db45578a8a3140b370036fc64"
 SRCREV_spirv-headers = "f8bf11a0253a32375c32cad92c841237b96696c0"
-- 
2.28.0

