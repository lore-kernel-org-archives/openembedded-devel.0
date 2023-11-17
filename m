Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B608C5AE4A
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 08:52:02 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.8000.1700211116436617192
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 00:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cnN9AdvG;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso2560112a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 00:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211115; x=1700815915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCjlSYcyY4qXAKszXOtzeQ8ac9QZnqYeV0ZpsbAf23k=;
        b=cnN9AdvG5G5kXOBm45o7eEsoYkLddAjQxy4JoIF6678aJAjoZ70JHk7ELr+2OyuML8
         g90qKtVKw5FyxQTktuckaWnkI3TRsWftQiUidY278POlELFbPTVRBSt/GZJXY7Y8W+jJ
         HC/FRgczlZoF4RayiTYywgQwMkgEmtapx5MUQU2ZoxtVEiHLNMfXaP7PBcNznXMDctTD
         EpHsnW5OGLOQXLFW/L8ABKV7Zm5isxkVoMoBJwKYeSrNM7f0+p/l9GEBoL1gRClNEq9c
         paWAajd//WtotxOECi8bXgRidPwPW6lxVuCrk87UGy5JIL1OkWEgi+EjLkZ9fpZLarJr
         OrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211115; x=1700815915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCjlSYcyY4qXAKszXOtzeQ8ac9QZnqYeV0ZpsbAf23k=;
        b=Vv0DZEklciIPJHKz+pavPorSH+gNY9yHW0RlXrjAvKgRzK0N23BwmyRrREgsmjwx3P
         Xpa3LfsYHqU8NTjO156C2uN3gGudadT1QIm9oMwrIbJJtmj+Gn2hvLph93pRJifuGsn6
         07mzPpRbA8g9WuBf1A6Yydavm73cHVaRHV03XDnEHDIZuAxWOtUbmEamtJWW791yhu66
         PNEWZzu5o6JmXO6PI/1POmsyhov7vM+lXeOSYgOLKf50a00lnqNrd1a/BaCXyC+YPa65
         iNziUWcVRQuW26TAdC6l16VC8fck+/k58dkO7+RND6tBLAagdHgwVzwYCIpHJGiw+Ee+
         ZAvg==
X-Gm-Message-State: AOJu0YxoDj/nMSGVjmQ3rSyUZaL00vQN9BbLR9c42vmbDwd41l2zHQlC
	vke6wCbdyFpNByiAe+2K4oqlL8W3OcM=
X-Google-Smtp-Source: AGHT+IEJGyx7A2invoMzg7wR5JAL6Q78MaglfnuWB+OapcBkJuwVR6AHnzqmF3miitUHRKxt+NTRBQ==
X-Received: by 2002:aa7:c9d9:0:b0:53f:aa86:e839 with SMTP id i25-20020aa7c9d9000000b0053faa86e839mr13230849edt.30.1700211114570;
        Fri, 17 Nov 2023 00:51:54 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b8-20020aa7dc08000000b00543597cd190sm511133edu.47.2023.11.17.00.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:51:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 6/8] aom, x265: drop ${PE}, ${PR} from /usr/src/debug paths
Date: Fri, 17 Nov 2023 09:51:41 +0100
Message-ID: <20231117085143.3813216-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117085143.3813216-1-martin.jansa@gmail.com>
References: <20231117085143.3813216-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 08:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106855

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb   | 2 +-
 meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb
index 4d69b03987..776dfa8783 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb
@@ -23,5 +23,5 @@ CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
 EXTRA_OECMAKE:append:arm = " -DENABLE_NEON=OFF"
 
 do_generate_toolchain_file:append() {
-    echo "set(AOM_AS_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake
+    echo "set(AOM_AS_FLAGS --debug-prefix-map ${S}=${TARGET_DBGSRC_DIR})" >> ${WORKDIR}/toolchain.cmake
 }
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
index 250af58e17..2d4f389e34 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b5
 inherit lib_package pkgconfig cmake
 
 do_generate_toolchain_file:append() {
-    echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake
+    echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=${TARGET_DBGSRC_DIR})" >> ${WORKDIR}/toolchain.cmake
 }
 
 EXTRA_OECMAKE:append:x86 = " -DENABLE_ASSEMBLY=OFF"
-- 
2.42.1


