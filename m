Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A193CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 15:29:32 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.21758.1757518167376521782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Sep 2025 08:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QV54lMp9;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b042eb09948so1345280666b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 08:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757518166; x=1758122966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMfSWJgrnSyL9xQ2FRcnX32X+9yyQD4Z73gTJpM2eZM=;
        b=QV54lMp9T8EZJFZYezvhd9vwMMPiHyYDSesKo4sFes6kGwtFHSYOy7zRtWtyqKi14V
         aC/u8qc4PLORVSFUcfan9FdaMlb1wvhuE6VuqS60ffjdpofnW85dq9O8XQuaWC9bGe5w
         IjRf92DIr91IKT86afc387t2WC2gAS7XKRYScCeO2k0sWqNmzrL5QFWwc6W+rTga6JYP
         bk4GKQBD1dLAn85KF1/B/QkPHqVCXfJxdf+qmb6XyO6nBkEVJrzFX9NcSVcvKyUpD7A/
         1EslP4ljaK7di5movR5lh/zULjiNycsw/4//eqkCyfVgfVWpeA/OUTcKW0U+deX+Y/Xk
         fX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757518166; x=1758122966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMfSWJgrnSyL9xQ2FRcnX32X+9yyQD4Z73gTJpM2eZM=;
        b=QmXHsdHUc/63ZFmMsqoA2R/haGg1gLJu0HC3qLEbgwYMYRpmutJ7fQW5aXmbGL4W4A
         WLwbYyifVH60EpATO6R8eASAiuAvihYR16+/V8UHQFe7Yp39OwyHHcu1LEPc+aockctU
         Wq/LpA4tVx3AgwDtZ99FMT79gDC/vVP+yHewGreHVmc6pRSrOxx0pRVTPB7p9uNgORVE
         cfmxiDSza6IK+Keyk++KEqw1LT1lUVgjIZAMRdnbl5k+KexmfkM8T4WgISXp/RVLPC3T
         /0VXkn7Ed6dKaas+kErgp4NeslnvCxupypER1hmK7CMqPlkG49rsPBUQSCMmmeNty64j
         KmNQ==
X-Gm-Message-State: AOJu0YwlqviSvyH9qpyBuqx+aM3GNXFlPQiPwUpsxDAZWvCcff+4u2eb
	krtYLdOS29BYJH+GYaUNJmE9vNS0bE9+bkX8mCQv2YfJ5KA70fxDmUEAAy0fjN+b
X-Gm-Gg: ASbGnctyH90uMrtvTdPNCX6ZkYLTxaAMSqlgYAxGcIHSPyyBo4+a5XMX15kR+eFBm7E
	v2HcJkoejQcahcC6Df4ZtL74Tkz2psFSGd+BB+GFnS+DeUIIwPqevY7TtPG/ckRdNskxt5KIStW
	HJB7ukw05Q33YqcVERDrM8qd+aTVJUCgJgmCTDyJr+WrzaFCodbFDs7GF6g0fByJ71pMcU96SOZ
	d2W5ba0dYC2emNHxBYpeBN7c739p6Qdhm2q6V4WF5sh73JV8wkRmNkPtuVkmoy0iNPezkre9MAt
	xRw/B4Ijy43FosbEkwwnzowDctoZMZUw2UwbLacup980DBYlHpn8QyTuVX57UFEUZWUduje2wzX
	FFYlPhOwlA71x8NF+0VauyzKQjh+JRBA=
X-Google-Smtp-Source: AGHT+IHfgdFPicS5ecUqD8p53o0MY3GKXj2/E70ZfJu1rwXN2R6nm+zJ2drRDmXAj7beaYbgH99coA==
X-Received: by 2002:a17:907:7ba0:b0:b04:1e6d:63b4 with SMTP id a640c23a62f3a-b04b16dd7afmr1572518266b.45.1757518165542;
        Wed, 10 Sep 2025 08:29:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830a7598sm183046066b.24.2025.09.10.08.29.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 08:29:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][walnascar][PATCH 2/2] libwnck3: fix build failure for lib32-libwnck3
Date: Wed, 10 Sep 2025 17:29:23 +0200
Message-ID: <20250910152923.859295-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910152923.859295-1-skandigraun@gmail.com>
References: <20250910152923.859295-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 15:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119349

From: Changqing Li <changqing.li@windriver.com>

Refresh patch for fix build issue

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...caused-by-OE-core-changes-to-startup.patch | 33 +++++++++++--------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
index 91e23c785b..0328202f1b 100644
--- a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
@@ -1,4 +1,4 @@
-From 1df0f4ae8fd54bc1ae940dfafa701c84d068674d Mon Sep 17 00:00:00 2001
+From fd075074182f756e2872569925f70f5f4e2386c2 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 25 May 2025 12:24:16 +0000
 Subject: [PATCH] Fix build issue caused by OE-core changes to
@@ -21,23 +21,30 @@ It is caused by a patch of startup-notification in oe-core which is backported f
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+Refresh the patch
+Don't use explicit type cast to avoid truncation, use long long for tv_sec.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
- libwnck/tasklist.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ libwnck/tasklist.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
-index 7418f89..460e11d 100644
+index 7418f89..f0f30b2 100644
 --- a/libwnck/tasklist.c
 +++ b/libwnck/tasklist.c
-@@ -5031,7 +5031,7 @@ sequence_timeout_callback (void *user_data)
-       WnckTask *task = WNCK_TASK (tmp->data);
- 
-       sn_startup_sequence_get_last_active_time (task->startup_sequence,
--                                                &tv_sec, &tv_usec);
-+                                                (time_t *) &tv_sec, &tv_usec);
- 
-       elapsed = (now - (tv_sec * G_USEC_PER_SEC + tv_usec)) / 1000.0;
+@@ -5019,7 +5019,8 @@ sequence_timeout_callback (void *user_data)
+   WnckTasklist *tasklist = user_data;
+   GList *tmp;
+   gint64 now;
+-  long tv_sec, tv_usec;
++  long long tv_sec;
++  long tv_usec;
+   double elapsed;
  
+   now = g_get_real_time ();
 -- 
-2.33.0
+2.34.1
 

