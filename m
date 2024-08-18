Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53E4C5472C
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 22:56:32 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.198866.1724021787069998511
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Aug 2024 15:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=muqUM4HI;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2704d461058so755772fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724021786; x=1724626586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVezFJHHTZ/7w+myJqNV2chorCaKS04txZxUZcBdhE0=;
        b=muqUM4HI5pDlkq0mUHv745KwhEZOqFqB35xL8J4lpC5K7boC733OvUugdwQ0Nl2l0K
         /Pd4znjulb1zT/Hav76qXon6tkFIaj0QY7yUvaPXF4lm6C6VzFhNW5qnVVrB2TKCcQP/
         0xXbKcXJRywjGyi3czKH3vl25lU4QlFvs5rRk35GlV7iU9+o1aTjPZq8tRJhL36NKayl
         iDipVG/Wc+AAPPKKzkrvBDtXF/zVT7YTw9OvPNcKOJo7kB2wmFxXO+j/VP0JtzhcHfa5
         wou3QcCXRrOSqTizf+2Ru+VThwELAwHH6yH7Upe2gIAieRjHVuxMWRMb5PUyl/hKQxff
         UNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724021786; x=1724626586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVezFJHHTZ/7w+myJqNV2chorCaKS04txZxUZcBdhE0=;
        b=w8kHQhv6C2TnwotEnu7HJp+EuFT8QABzTNh7w5XYhhRZxWy1K61/NQO7d1CKps4SHe
         cltQjUfWiPD6NMIdV0k3VYh8sffmSnflteWBUriGobhmIm1AbdE3k4smDfBZJl8raRnL
         CRDZQeatMA9tSC3IZsiPUVyJa/xRVdtbNK0UjUmFxx/WTZiCP7SVo22cUZilUGwEbrRx
         iqXbq/84/YOb+h3QdT0bJEqLX307nRa7pww/P5sS0GBIFeJZl0H28m0mMzi1ZtKuYmee
         JGGSm102CXYhgoEna4F6dexJ68wdCaGAc0oAzSHsXixPE2gWdrHUgER7uT2bRU7XMhxx
         uhWg==
X-Gm-Message-State: AOJu0YymTBsE1lFbZ3p43pZDjlJ6zbhCW4py1sp6UnXyH957F5VlyJU0
	aXdZZESxZGc9EojzJIQx4D7JlcmbML9Tde1PIc6Qoks5ni0bu/B/V08LQg==
X-Google-Smtp-Source: AGHT+IE9/IzUO5Zfb9ZD+/ukyvZaGQ5GF4Qe12SSxlk9XncsN9jcnnL+qcZtHygueZ700nerf8h38Q==
X-Received: by 2002:a05:6870:328b:b0:261:1b66:5ab1 with SMTP id 586e51a60fabf-2701c3dd241mr9041566fac.21.1724021786001;
        Sun, 18 Aug 2024 15:56:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9149])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61c6730sm6564146a12.26.2024.08.18.15.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 15:56:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/5] ot-br-posix: Define config files explicitly
Date: Sun, 18 Aug 2024 15:56:19 -0700
Message-ID: <20240818225620.2226473-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818225620.2226473-1-raj.khem@gmail.com>
References: <20240818225620.2226473-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 22:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111842

Otherwise it picks up from build area with absolute paths into builddir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/openthread/ot-br-posix_git.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index 0ec9db9e18..e5f8db24d4 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -34,6 +34,8 @@ EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DOTBR_REST=ON \
                  -DOTBR_WEB=OFF \
                  -DCMAKE_LIBRARY_PATH=${libdir} \
+                 -DOT_POSIX_PRODUCT_CONFIG=${sysconfdir}/openthread.conf.example \
+                 -DOT_POSIX_FACTORY_CONFIG=${sysconfdir}/openthread.conf.example \
                  -DOTBR_MDNS=avahi \
                  -DOTBR_BACKBONE_ROUTER=ON \
                  -DOTBR_BORDER_ROUTING=ON \

