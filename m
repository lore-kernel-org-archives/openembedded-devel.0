Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A16BC54E4A
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 19:26:44 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.80336.1709494003526148178
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 11:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i6ue8CVz;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c1a172e46bso3206906b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 11:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709494003; x=1710098803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/EVBGaXqUkI4l+DB8+t1u9A6Vl4rdjtmD80sFStiE0=;
        b=i6ue8CVzaBflMTmmTmK3KyRoeeFitc8wNTCw7jFii03ffLkNW8glqM+uzti2rMxq1B
         Fx7UVczyAnShJ0x0sNmK1jKWnjDytGaGmXRsBMsp1GdjynyRuTEpKku5il+Zh54jYP4X
         D+67tkGuTVSVRZYaveCyHMSFJrKK1yzzvs2Oe/ZhGENPBVDiUh47V7Erq/WTzoEvrGSJ
         y+M9LUeEMiaFfLnXzonpHlXWI0e8XmoFoaI+WWzSbO3Csvxs6QVDWt28acXpNz6fz55A
         pw+5ZVUhA/fNSLqvdvGbCuzkQ6KSOWEMIuf8J3XLKkhOGFomkPcMLHFvb5+G3aZu4es9
         vQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709494003; x=1710098803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/EVBGaXqUkI4l+DB8+t1u9A6Vl4rdjtmD80sFStiE0=;
        b=I6quqrCi5MMECdrDYt/5Z0wcbdHvmAnyN3IzpQ+9Gu3YTrEN90gxOxp8q900VKFncu
         qhR064bfWmlQ51fkJFmrW6UXB/4w/DBEBw0ONIMzLRMD0Vnlqv/Ewuty6+zERMNq6q3q
         6+ONraUs3zLrgPFIuZ2C/s5thfzoBD76FZfm0BEDoOIDhdjWcQNlpBhTRSSddy4dQWQC
         rGcv6geuMw3FOgF1Y7OY+wf8yLyKI5KnUQCuj/WtTxd8jz/HisLVkHlgcyCj7Bw0qoCj
         rZuZ7qG3XELkwKNOwVE6aMm+zPbxfoFivOLRXXz48yrN9H8a7wRpHR3y3wAZuy4SgTIw
         V5ZQ==
X-Gm-Message-State: AOJu0Yz/fg8B0A2aGj9nsZpRScDaAPhVTqJAswsLbbIvvUfog6wffb6n
	bti4wggseZVGocH6vEmBDTIfkwL2WLVHXRTvr8mt6NvJemxx66fFoNxhSEAq
X-Google-Smtp-Source: AGHT+IH+ip7jNG5oVV/pwk71+B4KYw3ixFkT6erj7vVa2KI5kyoYIWd9BWS57vMXYgVj/DiEKKpqVA==
X-Received: by 2002:a05:6808:3192:b0:3c1:4b5c:3995 with SMTP id cd18-20020a056808319200b003c14b5c3995mr10758952oib.52.1709494002625;
        Sun, 03 Mar 2024 11:26:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5e7])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090ad48c00b0029aac9c523fsm6360955pju.47.2024.03.03.11.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 11:26:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] syzkaller: Fix build with go 1.21
Date: Sun,  3 Mar 2024 11:26:38 -0800
Message-ID: <20240303192638.4154965-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240303192638.4154965-1-raj.khem@gmail.com>
References: <20240303192638.4154965-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 19:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109090

- export GOPROXY
- Fix clang-18 found errors by not forcing C++ compiler for CC
  but just passing c++ std library to link with

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/syzkaller/syzkaller_git.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
index 2adc06a2bc..b43207f2a7 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -10,7 +10,13 @@ SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${BPN}-${PV}/src/${GO_IM
            file://0001-sys-targets-targets.go-allow-users-to-override-hardc.patch;patchdir=src/${GO_IMPORT} \
            file://0001-executor-Include-missing-linux-falloc.h.patch;patchdir=src/${GO_IMPORT} \
            "
-SRCREV = "6d01f20890edf11b99bb54573025b11c1acd2d52"
+SRCREV = "25905f5d0a2a7883bd33491997556193582c6059"
+
+export GOPROXY = "https://proxy.golang.org,direct"
+# Workaround for network access issue during compile step.
+# This needs to be fixed in the recipes buildsystem so that
+# it can be accomplished during do_fetch task.
+do_compile[network] = "1"
 
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64).*-linux"
 
@@ -26,6 +32,8 @@ export TARGETVMARCH = '${GOARCH}'
 
 CGO_ENABLED = "1"
 
+LDFLAGS:append:class-target = "${@bb.utils.contains_any("TC_CXX_RUNTIME", "llvm android", " -lc++", " -lstdc++", d)}"
+
 DEPENDS:class-native += "qemu-system-native"
 
 do_compile:class-native() {
@@ -46,7 +54,7 @@ do_compile:class-target() {
     unset GOOS
     unset GOARCH
 
-    oe_runmake GO="${GO}" CC="${CXX}" CFLAGS="${CXXFLAGS} ${LDFLAGS}" REV=${SRCREV} target
+    oe_runmake GO="${GO}" CFLAGS="${CXXFLAGS} ${LDFLAGS}" REV=${SRCREV} target
 }
 
 do_install:class-native() {
-- 
2.44.0


