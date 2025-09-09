Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07BDCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 12:43:33 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.12093.1757421804758303838
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Sep 2025 05:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nC2exB/l;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-772679eb358so5125050b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 05:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757421804; x=1758026604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7sCbSpzuwufblFTJwPzFmrZwYBjMun1/jVGyWN0pQ0=;
        b=nC2exB/lhrC3X+D0JDlYBeTVo9+MI1YXyxAxVSwK3tRxX2YR2v+svhzZsM3bwMlEDM
         emGh8NaRKAvQ1lTYm5eJQBuQaiRE5/JXmSVX3AnfTKdvELsNeCOoIhztpDB8POWsEG5a
         d67Em/gjq+CJZRp+2kV8Uhe6SUgY2VnhqyHRjC0oLbOeuEPuhBimfnXw4zzPwAzDYq2p
         UE6vhXWvGV/BcEMlzV4L6fXHfrKvsaZluDk0QJsGrGOfWsmbzN1H8nctz8R0lSmBtrLS
         z/Klw01JijUFVXMWdjOdNZFLEFd10wn4p2dmvkPOJ7BDUoFsLoQD7AJUSbnjUMz0t+x7
         lmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421804; x=1758026604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7sCbSpzuwufblFTJwPzFmrZwYBjMun1/jVGyWN0pQ0=;
        b=e7LQV3e1nmcrBZRjxrtSkyqXv03mpNui2vUaNmSuJ0KPMibC5oMn+mEk3Sec4nzJL4
         HB4uXRaCVsWYIX03W3WGi02IvuplMHqQoaM2KOysYosCPJyPOPGPDt9E1A0dQKHITwL1
         Eadrg2vFjowegK8OqS8UzdH24aPsi8kaWVJCo0Fk5BeT1U4Bgzh6qz1hwDMJDbdDIe9i
         UIKxf6MID/t4Twttmm0Ti4oBlVRPUJumwXq19jVjtdUZChNpGDKhRXh1tJOYor4dxABt
         B/rBL044ZOegnhG8A3XQleZKu9lQUpHWAp3e47F/cjQHagsj6EkAJ5AyIkhMNvs9RDW9
         LuOw==
X-Gm-Message-State: AOJu0YytlB0aa77qTfTDeQngh8vNWwFfJM8ajDHw7YA8Oec6xuW6Mh9O
	Y2QDvYUyRsmgqMszZWdUMiSIHiiQwCTT8NIpmJgXktOYRZJDRu+UuYAt2LLotg==
X-Gm-Gg: ASbGncuYn54wuDSrvHAQN6qdUyJ25BpIkq1v5uNpNB7nkyD1hPf/fQcqO0C1YaM59xK
	B39NQeN3mi5aQeO3Z0vexBj7V/7ucmlmA6DYknPxkbi3U39Iq2hSAr6gZtDaQSLHayPLPfowKCo
	C7768Ew7gZzlJULs5rAinyezn1qME4cWBc6B40qVB4HzgYw5NaMUN9dGQRFHkbvOMA37JbWmKfY
	iovxIdymuP0fPot/+rTajBPXWx9JP9pR3FE3QHRYM33jVo53pq7sXu7nXGuPrXFzPYiItNgreD/
	CRBiS/d/DF4pPOCMCvKo5wxjeA+59Cq91AkDTZ8NXsDVq8RCpxZugFM5makz0a3xy3AJ/mjAGE7
	Nv53+gkEB/o3ObBdbZQtTsIa4kLvidCFebajuTXMfuOU6TxFvihYWYRo=
X-Google-Smtp-Source: AGHT+IGfxbxPvJ14C2icsLnjeH8mxhiwj3YVanAZRRf/P8SeaV7x9D5BHdTst6FvYyNfb5jk1ZhAkg==
X-Received: by 2002:a17:902:e5c3:b0:24c:c013:50a4 with SMTP id d9443c01a7336-251718da251mr144869665ad.40.1757421803591;
        Tue, 09 Sep 2025 05:43:23 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f7492d8sm198495615ad.129.2025.09.09.05.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:43:23 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] opencv: Only rename ${bindir}/shape if it exists
Date: Tue,  9 Sep 2025 14:43:14 +0200
Message-ID: <20250909124314.396820-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 12:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119342

Its creation depends on PACKAGECONFIG = "samples", which may be
removed in a bbappend.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index 539190553d..86af1ebc43 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -214,7 +214,9 @@ do_install:append() {
         fi
     done
 
-    # rename shape dir to avoid rootfs conflict with
-    # mesa-demos /usr/bin/shape file.
-    mv ${D}/${bindir}/shape ${D}/${bindir}/opencv_shape
+    if [ -d ${D}/${bindir}/shape ]; then
+        # rename shape dir to avoid rootfs conflict with
+        # mesa-demos /usr/bin/shape file.
+        mv ${D}/${bindir}/shape ${D}/${bindir}/opencv_shape
+    fi
 }
-- 
2.51.0


