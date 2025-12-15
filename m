Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1662D59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 00:17:10 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36650.1765757824041919699
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Dec 2025 16:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZBpT3255;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so585092a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 16:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765757823; x=1766362623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g/lj+tI4HgHi8iuh7Y9lNd4iVDvdFt2Ykm4Ug81VNj4=;
        b=ZBpT3255m9pY73XkJmNiNMixC79E18MVt7o7U24GEW491UqknYoFcKPCV1UFj5w7hV
         do4T1i4fpVsEn83i0WUCLi4x3bdU5FPKX5+DZRI0nzvAnH015Rv6f6BHwjOZnAfwvq7x
         AMLmRS+/p2ipLNKUyiNEZMbvZNQeP2HNJP+6WRWLLBMVTfD4heDc7aFC4yPQ4Js3STV2
         jw+SAqBxc16Qa3rl+HKjlaHZugAd7rAMbLUJtjdM4OkMqZ8oBzRceyFRLS2HbK/rXG3k
         g8jFw9fOb59PfDQ3gW/1cHd3TuWXaym362BssWl+T1yCyuahU8LpM9dj5lHOLlzyTcSE
         +i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765757823; x=1766362623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/lj+tI4HgHi8iuh7Y9lNd4iVDvdFt2Ykm4Ug81VNj4=;
        b=MVk8at/KRMEtvbJ4DMDXE5tBe6DEK73NQQ6LAjxnr4ArsmhDm6Yh/JTb1NA7terHmG
         KvhWOgiwHHFcEcmyzqFDFZgJvZusVjAzwLcHsNRy/EInXeA8uSRYECtdPUYW2Sp3Zz4S
         LjACmi0qDoFp/CeQQBYMTUj4FRpydCM6S4JOfLmMqwM35pCcZcL8oG6WJTDIu4l1HQut
         5Q33kOQYZqMbvUcaI4XWijJd5qmcpD4qOX4a6lfAV+te0rVImyyl4gF+PdobQKwRl4xo
         TEbhSTqVji4gfwpz//Vrrz0hQXzwx72oN7xbImacZYY9ia3s2RQAzyCHCZHPJBjFH/ob
         PdKw==
X-Gm-Message-State: AOJu0YwGKWszWp+Plaace+pmc0oMMRMI/FoZEufbJIzV7EtKxMDA+RVb
	HvFUe1bijJ1MsvckMh+RYExunu3hLJWUUp4pOvh3Uf3jcljCG1++b3mc9mkz6p8x
X-Gm-Gg: AY/fxX66ebApv4CGNGIJbNfCkzDwwgnmUjwx7QV3Fofkqe8Vp9YOkJBmzgFHu65vl81
	qkXUn+S4budqaDmmDGZ47B8H+0CBs/q2Gz8pwL8v7gyGJh+jltOjmThzpN0Is6aULeNolKVfyOa
	+rtqjWEtXE7zwBDc21qmZdRtkGbNUERgXG27zZYT08kl2sVvrbjhZVAODPSQA3BM3dajsfsgOOX
	XwxmZHG5x6kBwtS9CA8S2Wa6DWOI6SMwDLMAj2MsbSmcbtguhhHjO7OkHBAYyw10v5vnorNN5v7
	cla3Z6cGINLxFzU4+m0/u7TSohnmalLmoo4GqEs/tZH2IFIA5JVOCZUOUYlEm/uWkq6t1xaDItU
	XqjP2+nr5YRG24uFUktm520Qo4DB+yYC5piHIATH1OAu9w/UVAasl9y5NBS0GpRRvBCkadVcG6+
	aqrqW/sonZ08Rrw2XOkdCmIfaDj3qkZlZS/8/GhZcBElDJfRmG7D/Y8Kx20ERilU+ha+3i6ShEF
	lfY15XxCgjw9vgjhNosrM1qypqLQoI8
X-Google-Smtp-Source: AGHT+IFiu/UaYgrj7c46qD256nCpbVbrJwDIPEKhX4MLbpc+kJ84N4VG9m6vh4dQfGN6MP/UvHc2/w==
X-Received: by 2002:a05:701b:2305:b0:11d:fcb2:3309 with SMTP id a92af1059eb24-11f34bde364mr4662088c88.4.1765757822967;
        Sun, 14 Dec 2025 16:17:02 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f446460c8sm4043278c88.10.2025.12.14.16.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 16:17:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libopus: Make ne10 dependency to be target specific for arm/arm64
Date: Sun, 14 Dec 2025 16:17:00 -0800
Message-ID: <20251215001700.43966-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122655

This ends up in the native/nativesdk depchains especially when
building on arm64 build hosts.

Fixes errors e.g.

WARNING: Nothing RPROVIDES 'nativesdk-libopus-dev' (but virtual:nativesdk:/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'nativesdk-libopus-dev'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
index 642f34f71d..9f1a79ace2 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
@@ -28,9 +28,9 @@ EXTRA_OECONF = " \
 "

 # ne10 is available only for armv7a, armv7ve and aarch64
-DEPENDS:append:aarch64 = " ne10"
-DEPENDS:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon"," ne10","",d)}"
-DEPENDS:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon"," ne10","",d)}"
+DEPENDS:append:class-target:aarch64 = " ne10"
+DEPENDS:append:class-target:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon"," ne10","",d)}"
+DEPENDS:append:class-target:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon"," ne10","",d)}"

 python () {
     if d.getVar('TARGET_FPU') in [ 'soft' ]:

