Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45624C282C1
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 16:57:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.15866.1740675464869768373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 08:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KWVy5tZF;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab771575040so407697766b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740675463; x=1741280263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JsgJQXew9maGpyF0pCmTxyrh5jwuYcaXWAKbu0kPUng=;
        b=KWVy5tZFVTOb5HGLxKq4rcbHjdYFzbc3xF3U3OxLPRRSJ4zRap9fHm51rAt66OOnig
         vGnOS6Dmd5dYtrAFTy/lYg//kj9995ftZ7TsqLxMRBIAmLS5eMTkRgeNvKxR1CZ16Ug2
         UNnHcWTTO349fEVqTq6QXsBApY0dk8nHqDwjiMfVjfkgB2sTz/DPRRyUV/aIF02gKILC
         dfjImQyorrdFd8QA1gDcnFo20jgly/BMXKGBsKDDVdlj3IeJKQfDqFs6EucCO4RatCrq
         5lNs0BM12l7QQ5kA/ev2e2Z5MBdKt4P7CI6QacWK4rFGAWDUb3CdpxCerDyiJmm4jjBf
         z4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675463; x=1741280263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsgJQXew9maGpyF0pCmTxyrh5jwuYcaXWAKbu0kPUng=;
        b=vy4+VCpkQm0LgAgzQ+uorkKZAMeisz8b0HGbUnInv4moacdk6lboww3za0aUbPI/TD
         qysqqY4dhKdQYXSPfLyALkSIUwi6pMrpWuXQOwNNa3NFdGJtb3dP7KOyn0CtGV+xVVQ3
         HyTxDx/D5wvmvPQBzhjIJLPlghTebHe7DRX3MH9KeqOn4kM5ydTrHxF0pb7s5Sqnakr7
         pz6uIxa8X/QCYtwTz9TfFO8p7aZ+h/7KmFQ0S8iCet9XLV7CxjT37Iz36Dy3yJcYquXJ
         YM+PQArWJSeDxCofYWxtDvyllabxhGW6ZUHGnq8szYQykAfi2MWq1xV3Hk7m/fMvYYAk
         yR/A==
X-Gm-Message-State: AOJu0Yyj6R9yaJZjoSP405goW2Qa6CXF0k8iYYJH2HrPLxsz5hwuyCMO
	e2NLrkJY1vWFufHT1rVyoQsKc6bEnDQgbupHpuD6veQdJlWzyMGwGUe09Q==
X-Gm-Gg: ASbGnct1OHIcjUTXvoExda9Yc3Uq8/qSeGJBa92A+jPV0FHA43HvI4I9Ahwp/5xAbRs
	m+0AXM2i1T4VaWkpVLt37ZMeMNpBDBjU8rENc/8pAAQU+61xbxlN6B1W6sn/BWwg/O1XZJooTQa
	mSz/xwEreEZhXDGMYXx8AykGWQhKQaz4xOb+uUhHGIlgZopzgOYWkzT57FoorM32mb+ZiTAgYQw
	afEWGluuXt//SAyrEHd5LeJ2Pq8fSgdCWSIatOMjBl61DMOW7JyWxDSJJ899SmKdEpYWEE4g2Du
	H1mEF14VHO6D1mp62C0ENrwKHsrWNxrZXPxQq/ZelQ==
X-Google-Smtp-Source: AGHT+IH/VRg72AZFok81TQZ9LQ5xBsyp/p66S34wPGHEAUEKFVzAB9CHuVzzElGscYJDy2zMVdvRww==
X-Received: by 2002:a17:907:c814:b0:abc:67a:1e63 with SMTP id a640c23a62f3a-abf05db763bmr479937866b.5.1740675463160;
        Thu, 27 Feb 2025 08:57:43 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6f60b2sm149773266b.102.2025.02.27.08.57.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 08:57:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] thin-provisioning-tools: add target and sysroot to bindgen flags
Date: Thu, 27 Feb 2025 17:57:42 +0100
Message-ID: <20250227165742.1727454-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 16:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115695

BUILD_CFLAGS doesn't contain information about the recipe sysroot nor about the target
system - and in case these are not specified for bindgen, then it builds against
the build system's headers, using the build system's arch.

Instead of BUILD_CFLAGS pass TOOLCHAIN_OPTIONS, which has the contains the sysroot
already, and pass the target flag.

Fixes the following do_compile error:

|   /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found
|   thread 'main' panicked at /yocto/sandbox/build/tmp/work/cortexa72-poky-linux/thin-provisioning-tools/1.1.0/sources-unpack/cargo_home/bitbake/devicemapper-sys-0.3.0/build.rs:24:10:
|   Could not generate dm.h bindings: ClangDiagnostic("/usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found\n")

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
index bb4b53c28b..1526a33f8d 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
@@ -21,7 +21,7 @@ inherit pkgconfig
 DEPENDS += "udev libdevmapper libdevmapper-native clang-native"
 
 export LIBCLANG_PATH = "${WORKDIR}/recipe-sysroot-native${libdir}"
-export BINDGEN_EXTRA_CLANG_ARGS = "${BUILD_CFLAGS}"
+export BINDGEN_EXTRA_CLANG_ARGS = "${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
 
 require ${BPN}-crates.inc
 require ${BPN}-git-crates.inc

