Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AAEC433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 18:59:00 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.21487.1647802739426473539
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NOnxGXPY;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id p8so13761522pfh.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZUb39/AcHxOm4CQ7dBhrVeDtz3yTiHSR9bZ2rFrExc=;
        b=NOnxGXPYDF1/axSegssBPUzs5848eQ3T5OCwnNMHQN3Ry279PMjvm1KGAoumfom/zf
         3mVjhA89sMwAXnKsjLqH5mUYJABObdmD7SgIhiiDr5vluThA+G3ZqmlmeH7yr/vrKyDk
         6BlE8iHS7ZLIzAn+lEuDyA/oQeG9tVorBDtG1UiZr4Zs9HySAQ87j0uQKydU+yug4QMW
         o8wbnLDSTasWNDvhtlPB763a2ylLXOF0EwdWZnE2HbNU82t9uXdKII8d+4qfLbsocGLl
         Z+yR9iqu8M+JbIpemAsR4e9VGsENgQX6McKbOkTP5R7oIh0UvTiRXYEfSbrcgCH5Uj6s
         8YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZUb39/AcHxOm4CQ7dBhrVeDtz3yTiHSR9bZ2rFrExc=;
        b=G79/U6oiGFZeFCsSQENHMtwtW+/mhBqnEKoJ3zthmMVBlO8In2vgNvx3Rsu4qEAIg5
         xH5600pW4nG7WekMZ23Af34D9+SkUebh82ctYEStMhvgakvcJItaP1BeYX+dviNSk8G6
         P9rmJ6zjYaFsL4SJJ4wK03YtuQX2xJFhR2/SoH6B+ZUw4Qrkrtr/mse/enh/4fYfZ8rE
         pW7+5d9gJDa8c580JejbgB00HCuK6gBeNjjmbPiA6te45w2KTgl0KCMsZ+eWdwuZzupj
         4SomWYCNkf7tTEphNqB8Ee72W2dsTIPa/PIE0LM4nxoLYnAEVRD2XcYShvw5ukAyAoIa
         /Tag==
X-Gm-Message-State: AOAM532ys5V2jeb5Tv62cTvaouOkv1OFT7S9RTKQtD/rPHyFzRkCFNwY
	N5zsSTDFZhsY9DrvCENcHztjJNSFakIUxA==
X-Google-Smtp-Source: 
 ABdhPJxeyr7wVta8YD4bsetZG0s9i82wm1ab1Q8n2D5vCVEgoe5RLkF4CT/p5oOb+OmC76lIB35noQ==
X-Received: by 2002:a65:63d2:0:b0:381:7d61:fda8 with SMTP id
 n18-20020a6563d2000000b003817d61fda8mr15570366pgv.228.1647802738612;
        Sun, 20 Mar 2022 11:58:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm13884074pjd.15.2022.03.20.11.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 11:58:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] luajit: Upgrade to latest on v2.1 branch
Date: Sun, 20 Mar 2022 11:58:53 -0700
Message-Id: <20220320185856.3302842-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 18:59:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96086

License-Update: Copyright years and date updated [1] [2]

[1] https://repo.or.cz/luajit-2.0.git/commit/f47c864b0186fc92a2264e68e1151d0d2b24969e
[2] https://repo.or.cz/luajit-2.0.git/commit/c4dfb625bad8937d72074852a977738ec3eb1ab7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index d4ff06b677..3f3939eeb4 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Just-In-Time Compiler for Lua"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=abe9020de9c00909317d02d5c803810e"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=23d6278200de9b48fd1439f80507cba8"
 HOMEPAGE = "http://luajit.org"
 
 SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
@@ -10,7 +10,7 @@ SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
 
 # Set PV to a version tag and date (YYMMDD) associated with SRCREV if it is later.
 PV = "2.1.0~beta3-210112"
-SRCREV = "ec6edc5c39c25e4eb3fca51b753f9995e97215da"
+SRCREV = "43ebb949a249a16c49d232ad24dc9127cc4302bb"
 
 S = "${WORKDIR}/git"
 
@@ -92,7 +92,7 @@ FILES:${PN}-dev += "${libdir}/libluajit-5.1.a \
 "
 FILES:luajit-common = "${datadir}/${BPN}-${PV}"
 
-# mips64/ppc/ppc64/riscv64 is not supported in this release
+# mips64/ppc/ppc64/riscv64/riscv32 is not supported in this release
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:powerpc = "null"
-- 
2.35.1


