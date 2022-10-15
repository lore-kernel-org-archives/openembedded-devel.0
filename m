Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E481C4332F
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 01:14:12 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.14977.1665796445729755276
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Oct 2022 18:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eK0tysBS;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id cl1so6296117pjb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 18:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dm3SMlqwy7IIl2qcXH9ypeyGvivdKnf8LK7W8XFJ2do=;
        b=eK0tysBSOo5bdrkKgJjR7egmc4Ii3gtvNsUnZodZe4bLtdqRURDcTHvyZFQMVBidXv
         m8hOUqYS6B0lFNSQMQ/dG+n+9KwqfUTQDBwcRCgl8jRylxgXrx87R6zMeu1r4C6eJj8P
         ltqLhJvsp3uHNqY3BSALY6UKDDBQjgc8He1c/BPeF4pFD9cpbbkwGU30HF64gUfTYVaA
         jSRGb3YRTzSHQSb5IanBKYgpgHvIqHIgnWoj61moiR+YBbxN71S2uzp3svmCgVnpZmEK
         sT94dDR3AlyqIFjRXkINywd93VoftgXo7FLvynmGbd2kSP3g+Ac4yQrtX8b1jIqjFa7J
         /Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm3SMlqwy7IIl2qcXH9ypeyGvivdKnf8LK7W8XFJ2do=;
        b=qFgRhNVk8XK+f9aQgeCaAGF8QPAebvkB4PazKOQkoCScr/KXmhm9qC2aNNs6bsL33d
         gTRBV4RGRA/x4no816zGu3aDVE14tWeeCOqLfwMEPcVsy8j+3e3s8nSuId1D2IM68RKW
         eQahE+IGbDBPLIR0DL3a6MV6NkfhOQa5iGe8ih9HOSwwPG3VA4hXEmjizTdMQ6G7aiVY
         JWl6aNhESM190DoS01dlgUIJMRl8Cehc8NEjuu31uBKQf1z4AcxDnQzs5u4lXPlNx/+q
         gWsFWUDX48MBYxaQCFpwtACuDYV9FiiYNBIRS39DNgLXZNMKy++2kWv4Rlw7v79veFEx
         jOUA==
X-Gm-Message-State: ACrzQf3nqNPsEVHCzy/deDXsOgrSCM3grnBHlb1Sv6p6aG5mZcHtBmuL
	gsVpIqiPlGTQeP6UCx7AcOXiukcTWq8=
X-Google-Smtp-Source: AMsMyM7kI3neqB8oULtY0KqRQq2f+PKD7PI4E9UyetRkSrlLmfyIJJGMOHs9Z8M3wdz77m0VM4OcPA==
X-Received: by 2002:a17:902:82ca:b0:185:75d:ee2c with SMTP id u10-20020a17090282ca00b00185075dee2cmr617925plz.145.1665796444869;
        Fri, 14 Oct 2022 18:14:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::751e])
        by smtp.gmail.com with ESMTPSA id x63-20020a623142000000b00562832fc0ffsm2327657pfx.56.2022.10.14.18.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 18:14:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ulysse Manceron <UlysseM@users.noreply.github.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] abseil-cpp: Upgrade to head on 2022-10-14
Date: Fri, 14 Oct 2022 18:14:02 -0700
Message-Id: <20221015011402.38109-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Oct 2022 01:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99174

From: Ulysse Manceron <UlysseM@users.noreply.github.com>

Our team wants to use absl/log which was recently added to abseil.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index af28da5935..9f8c48cfa4 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,9 +7,9 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20220623.1"
-SRCREV = "8c0b94e793a66495e0b1f34a5eb26bd7dc672db0"
-BRANCH = "lts_2022_06_23"
+PV = "20221014.0"
+SRCREV = "5fa65f28e46e86c44966a1ca8a727a329d9c1ff8"
+BRANCH = "master"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
-- 
2.38.0


