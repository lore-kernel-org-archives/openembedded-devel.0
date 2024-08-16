Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968E2C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 06:19:22 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.142134.1723789159494200206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 23:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kjyUWg6A;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d1c655141so1151441b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723789159; x=1724393959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Usu89dGrm4zJl5f2DUhSfFit4QYTTQaP9WLqSX65JgU=;
        b=kjyUWg6A15irlabLY+JcTrTE9dFK4b1ITGxzZnFCprL2Iy2CRYl50G7kaT6bDiDPrQ
         4XGav7y73VDbX+fct7mtpg88dFrwsEQnZvBOBZCb2xgHKvR2S9LViko0MdQI13ew9tAp
         152KjIp/av6TQeuYi4Dbd013vOPJ0b9wQXvp5JClPJ1TDMGvyMTgKz7bf35Hy6Rx7sVX
         QOmHOcKh7HHN8UVbgJPrezlHMHa6le5ILzNO+YPtzIBgNzXHGtK+p1uWB7CNE8zkvbuB
         wDZu7c+Kg81mKIYEvf/s0vr9ENuZiVTuuy1I/PdY1yD7kVcCpVM1PBZjRE3fgWplDggv
         x0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723789159; x=1724393959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Usu89dGrm4zJl5f2DUhSfFit4QYTTQaP9WLqSX65JgU=;
        b=T07VTT93UJmwpUGu/HRwD4reG+9nkiXus6/FuKJG1WdP/tWylkaDD28aTUWphPLt/7
         +gj9t3JQQ6Cey1PVc3KKdHP22shCyhCjZgb5SxaLRO0hsjgwpb+I2mnChymyH/U52vUn
         r0JCSxQ1QPnaRc/uQhZVEw4p3DkIJtGjVW1a+BnbDJj25noOyu2mw8+cIX9qOfVBpTyQ
         DXvM3N4mfZqtIcdAOgMMExSSU8NLp5tkL0OcHFwUIAEpmZILQW9qAGKFgdCBIfKLPx04
         ReOjm2Oekuw8CplKFxqEjPBhH22rvLMyVN1zStnmZ5xv5TPAbQoM1Segf858AdOnjFmM
         NKhg==
X-Gm-Message-State: AOJu0Ywy29KfkEo+ATo8+vGxbWzfi5vDOgS3Nb9yWkqpJTePnOHK8MtD
	apJLEwBfn5YNwfw7SPlmmaAqaNWCAcnf5ZBFJhryiaKQ4ARc8LUN+2KMGQ==
X-Google-Smtp-Source: AGHT+IFI7UQfUkD4ecXzsOeEOeofJyeSx5IGohnF1vqZ5/cZcALECRNktyypx1cEdgFmesrDakRD8w==
X-Received: by 2002:a05:6a00:9441:b0:706:6962:4b65 with SMTP id d2e1a72fcca58-713c4e837cdmr2231932b3a.14.1723789158572;
        Thu, 15 Aug 2024 23:19:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1be5asm2022940b3a.176.2024.08.15.23.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 23:19:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/6] fvwm: Fix buildpaths QA Errors
Date: Thu, 15 Aug 2024 23:19:10 -0700
Message-ID: <20240816061915.2095711-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 06:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111829

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
index df349494aa..fcf1bd9cae 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
@@ -72,6 +72,8 @@ EXTRA_OECONF = " \
     --without-xpm-library \
     ac_cv_func_mkstemp=no \
     has_safety_mkstemp=yes \
+    ac_cv_path_FVWM_CPP=cpp \
+    ac_cv_path_PERL=perl \
 "
 
 # show the exact commands in the log file
@@ -90,6 +92,7 @@ do_install:append() {
     sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${bindir}/fvwm-*
     sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${libexecdir}/fvwm/*/Fvwm*
     sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/fvwm-menu-desktop
+    sed -i -e 's:${WORKDIR}::g' ${D}${bindir}/fvwm-bug
 }
 
 # the only needed packages (note: locale packages are automatically generated

