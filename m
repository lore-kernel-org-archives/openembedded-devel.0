Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.16388.1604075218683864802
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 09:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lDtI2296;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id b8so7151431wrn.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zHHiM/HLiB1WLidiJrWNdOsHfNvkG3Y1DzVzggONrSk=;
        b=lDtI2296RzI/qRjZn1gs5cPSwTMKxDQD0Tclv9flOHTmz9de+VcrPvIUyOBnmiZPJG
         cdn+nJ5lfJPBegRKP+pNIHcuBzbp4WGG3ZGESM4vJ/kT/sRs6z9su85x4AuvR5wGwFHD
         bD6tWbYnIfMR/C4PtEgNZUUHtitQ6LUKYiX1zbIr8bC6/kWURmOHUvKmGBGtH6BxWpkK
         8vrwVJe9KSCMh7SR2eFeQlkxzPjqKYJL9ybummrDMHeHt+j/s6j60QXyDj9p8LghrGtA
         vWFiCGm27GRCC1OzYUWes7ZoZJF/MMd3pg3T2L/EA7aey37Nv2t9ydSk0cW5VvELg3DT
         wsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zHHiM/HLiB1WLidiJrWNdOsHfNvkG3Y1DzVzggONrSk=;
        b=NPEOaxuBH8IICF54hVpOfJBLV0I8m1UgI/0sq5zlqsuhCv9qlud+qvTk91mzCc+T4a
         eT9qTUplGGSGLbVkXCUaHHvjiVRQf/+i5uA7a5gJpJvYshn6vB0wL8m4XL2FGMmX7eJM
         wyRX2NhI9R9DU1RC87utvkSbKvwmdPrIlgWk6VJieeHNZEvqcB3XtYebIcc0F6l+EVjo
         ijKAjHMWXsQpPe7B2uGdH7YhiTaYOqBzlaFnVT7cWsfVlDLLySktBY0fCFalsKl7MCd/
         25pYFBeFmg7lGZLEO2yfKhdOuL90lcUixi2ZDrOIqVV9xTYg/NXUqNQykNgc8h5N7/sD
         /l8A==
X-Gm-Message-State: AOAM531Kg+UUSM/U78oXGOerd6zPeDNjW/z1GKHyVrP7JWFt2OdPSKnN
	RSSJR8fHLCNx0uw8jRULkglReY3yIklV1g==
X-Google-Smtp-Source: ABdhPJy65XObXAX+NOnbxYuREpRtl+33nVNSkzHasVzRds+EGEiO7Z8kSwzmtN2lX9FYJG6kGpBWrQ==
X-Received: by 2002:adf:9066:: with SMTP id h93mr4436107wrh.166.1604075216860;
        Fri, 30 Oct 2020 09:26:56 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id q7sm11068161wrr.39.2020.10.30.09.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 09:26:55 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH] spirv-tools: moved into OE-core, delete from meta-oe
Date: Fri, 30 Oct 2020 16:25:16 +0000
Message-Id: <20201030162516.3615619-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=5f6470eb2c1e5b5aa578031830f057d63d4ae230

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../recipes-graphics/spir/spirv-tools_git.bb  | 35 -------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/spir/spirv-tools_git.bb

diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
deleted file mode 100644
index 8e8388e8d4..0000000000
--- a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY  = "The SPIR-V Tools project provides an API and commands for \
-processing SPIR-V modules"
-DESCRIPTION = "The project includes an assembler, binary module parser, \
-disassembler, validator, and optimizer for SPIR-V."
-LICENSE  = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SECTION = "graphics"
-
-S = "${WORKDIR}/git"
-DEST_DIR = "${S}/external" 
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
-	git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
-	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
-	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
-	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
-        file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch \
-        file://0001-Avoid-pessimizing-std-move-3124.patch \
-"
-SRCREV_spirv-tools = "c413b982c316b14e784f50d941814fc737b55b4a"
-SRCREV_spirv-headers = "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
-SRCREV_effcee = "cd25ec17e9382f99a895b9ef53ff3c277464d07d"
-SRCREV_re2 = "5bd613749fd530b576b890283bfb6bc6ea6246cb"
-SRCREV_googletest = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528"
-
-inherit cmake python3native
-
-EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
-
-do_install_append() {
-	install -d ${D}/${includedir}/spirv
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
-}
-
-FILES_SOLIBSDEV = ""
-FILES_${PN} += "${libdir}/*.so"
-- 
2.29.2

