Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60359C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:19:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.2450.1685081971195321349
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 23:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AcqHLmuk;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d2c865e4eso473823b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 23:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685081970; x=1687673970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFYk1iwc+vHr0WytFjDOV7sMLP7Ggnc1s0/A1TK8wKw=;
        b=AcqHLmukY/29R6aNdCSC0C8/t2jWjusgi15zuBQExlJ1b/fizt1EdKzVBddv79MRg0
         xmUMeI2D+ZLndAZKEXVsyIcLhtLlpE+YYUA90Lj8uSLDQ0nnrmVOmSkfkguKm+VDyrI7
         3VSXHN9vFSrfZYDdx747kR9R552Gr3gHIB55mAxr9SpCLU9rFEnpqHHL1lE87eMF47gX
         9XT20mv7aVpNVs+AAPqoW/QXzHYMtgB17hnxYmu2ZA8A2Ddk8fOJroJQG80q/8m1YJTX
         /JTWxnzQjOR+8lqe0lzYPhHxvy8qSp++9BIvcmaeBtsavF8NyAGndf5Ia7P8AsvPP4ec
         SRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685081970; x=1687673970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFYk1iwc+vHr0WytFjDOV7sMLP7Ggnc1s0/A1TK8wKw=;
        b=cvKcFn8GiHeUdwkAK/aH9+sPDf7OuQBlv77oPQ/4ODby4N7wxq+B77RRYD0MlvVJH4
         J98XKusnpSmjF9LXjIfuI62CKW6gg9ZpI2i4LGOpoE8jnEt3y3NjCHZhMBgeAVegIVXC
         CtDEYIQV5ZAIJZCESgGN0lkC2P30oP45+8XT/nhUb3O3Pd7QR23gnH1G9a9nZ3e7Nr0x
         AC20GT0z+HANoumYZk12mlecP25F7QFXVm1/ZrSsjeLr97V3f5y19tFndHHOxu7Em1Qn
         UTMt3n312/NJZLQ5mfTpcc3QopB3fek4cVLvPOHowCRpEJUxQrBBslBTiTWMFb4WCsu3
         cceA==
X-Gm-Message-State: AC+VfDxw3q/oNsul+I7YDPoq3W0yWbrPT2+xdoGx6fPA8mrEjCoUoulu
	Hwp/ifdRoUDSRobgdv2fCmO1pUBJnn8=
X-Google-Smtp-Source: ACHHUZ4qeH0taLKv5JusYhvFv5S/z/n7Q0N9DXypT0XZXvY0U4hVAuHDnis7+kGmHor2gFARRmzsNA==
X-Received: by 2002:a05:6a21:3018:b0:10c:7c72:bdd6 with SMTP id yd24-20020a056a21301800b0010c7c72bdd6mr803197pzb.59.1685081970233;
        Thu, 25 May 2023 23:19:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id k6-20020a63ba06000000b0050f85ef50d1sm1885427pgf.26.2023.05.25.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:19:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 5/7] x265: Pass --debug-prefix-map to nasm
Date: Thu, 25 May 2023 23:19:23 -0700
Message-Id: <20230526061925.420351-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526061925.420351-1-raj.khem@gmail.com>
References: <20230526061925.420351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102867

Ensures absolute source paths are not emitted into nasm assembled objects

Fixes
WARNING: x265-3.2.1-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libx265.so.179 in package x265-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
index d786afe81e..250af58e17 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -17,6 +17,10 @@ SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b5
 
 inherit lib_package pkgconfig cmake
 
+do_generate_toolchain_file:append() {
+    echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake
+}
+
 EXTRA_OECMAKE:append:x86 = " -DENABLE_ASSEMBLY=OFF"
 EXTRA_OECMAKE:append:aarch64 = " -DENABLE_PIC=ON"
 
-- 
2.40.1


