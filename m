Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D38CAC5BE
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:35 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.53204.1759151074695662840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNq4lUnD;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6365c5704ceso152330a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151073; x=1759755873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXQWcTvH5uReLk2993hEhjA05l63VSeI57bIAUSwnII=;
        b=YNq4lUnDLKzoGN+Jc6FzVGLADbxol6Do4S2BVHj6iGl+kBsQrWhHu2dK8Lx8swFhXX
         UPA4R3pFmAvNvyrl1wxXcTAxC2HfZvE20eIyYt02VTIPSVPO8UU7JyCU52mqr8bWJCfB
         /36gEkLp52x2FcVzwpJl6doa/gu8PJh7VGDpQtSxiEjJkd3IG55S58dZof77KzeiFhs7
         FKosCwXCej1WATmfOVmOcaIra3dYepANzcrgifS2nkz5cvusfQD+E2PQso43dZblz36F
         OA1ir1PKhkbqjn3KcrcF84kIDmXYkDpZBW4Yfa0jLVeFMFdbWEZ8i0cWtI/Gik9UCMGs
         9QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151073; x=1759755873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXQWcTvH5uReLk2993hEhjA05l63VSeI57bIAUSwnII=;
        b=w1wrGOToDi5K2W7g1ipy22C86cWOWyHi1rZHSKzQdA7rtfqa+7WfPUL6Tmx9ypqotW
         AvTBBtqyu2o5wyTuzOm0t2bqRMu4ztJT1C+SRFg0yiO2BhEA8TdY1/uHX0KaUd3TnQvi
         7ccZHm1PJIWsIiGnsyjBpe8ZbgdkK8PE376mfZ03krZbBuRkVJVU5WzeOBsG/20dJLX3
         mt7za383sqM4NdiQkzJwYKu6m2r1N1GdihqsKnhey2GU4m4VV2RhPcUSgfSrGt4Z0qsN
         F3tb6ETvHBSSexi/Pcof8LcUfAXa13V/1X5vIdbnyX5wpyyA1TKDoC/ylY1m64UPKHg/
         Nz+Q==
X-Gm-Message-State: AOJu0YwHC0T2qFKIgXDSRngTpG2s5VaET4Cclgx109YCTb1nVF/gX1xu
	GfhFVjxwYiij7DkWRIYcDxrUgc0zdQ3KRGvfJCupx3r+boY2+Jg5jNLs01FytA==
X-Gm-Gg: ASbGnct+9tzbpBar8NayCRWaK5WOK4BPmB94IVACZKvRDGlHQd1vGAY6qjrtWqCrY0+
	OvwNPsW4sRe5BM2s5/4BJayvxZTLdGpJ8KUhoOXMKvHM4G1s4X9U2qWg91asYeh+Bj2MCeiBlru
	GryKurMc9EZI8htva1ePRogwflwzLD6jx5vd+fsR7jiK8UVNkB6eizgltXuj+fMJO68cBF0BuQj
	uiARqmSAIDQQovxulT9kSBBDjROyP9e6F3/C5jmuf+zKMlYzaxLhN414QvhhoksWrSu7+BAmuBE
	HFDrVueZNelsSVG+6yWeKEnCjuZCW4Yd6lt7oPgLOzFbYyfkpsspv2EddeZCDAIJhT8sb0JsJ7s
	853UH1CNcIKwwyDlp7XzUvmHJN7I8DTnx1dBiUNaLfw==
X-Google-Smtp-Source: AGHT+IH8JaXZ82mR0/HPFUS7cotqRBlIylX6I2aLsu4JqZmbVklHoe/nuQmSxMT1jlXA76j/mT7G2A==
X-Received: by 2002:a17:906:6a18:b0:b2c:2fca:821 with SMTP id a640c23a62f3a-b34b899a6dfmr1970630766b.26.1759151072898;
        Mon, 29 Sep 2025 06:04:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:32 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 06/22] pimd: switch SRC_URI to https
Date: Mon, 29 Sep 2025 15:04:09 +0200
Message-ID: <20250929130425.2912077-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120019

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Switch SRC_URI to https (yes, the URI still has ftp in the path!).
Also drop the obsolete SRC_URI[md5sum].

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9221eaa8d6d4279f4477a30bc3112d32af04b976)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/pimd/pimd_2.3.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/pimd/pimd_2.3.2.bb b/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
index 2b622ae6d0..647f9df515 100644
--- a/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
+++ b/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
@@ -4,10 +4,9 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
 
-SRC_URI = "ftp://ftp.troglobit.com/pimd/${BP}.tar.gz \
+SRC_URI = "https://ftp.troglobit.com/pimd/${BP}.tar.gz \
            file://0001-configure-Dont-use-uname-to-determine-target-OS.patch \
            "
-SRC_URI[md5sum] = "a3c03e40540980b2c06e265a17988e60"
 SRC_URI[sha256sum] = "c77a9812751f114490a28a6839b16aac8b020c8d9fd6aa22bf3880c054e19f1d"
 
 EXTRA_OECONF:append:libc-musl = " --embedded-libc"

