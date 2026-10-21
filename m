Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8715.1792580481425300485
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HMZQPN3z;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c20ce3c118aso102254066b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580479; x=1793185279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqvsiy9xSph23lx/oMulx9qc5APsD8qFIQ5tbsfSvls=;
        b=HMZQPN3zNmHys5Z5eUusnVqabUXezMuMfJXcEX5ZZETQdd5ki15NqFmT/v21xbYyiN
         Ng2azy+l7/4GeJvwqWiExk91SIZWsYawhwc4ZVh6oziBmL/8FaocKReP2FmK9FW9a5cj
         yrddNZG65TAsiw5xs1twK0mMa/yXu7lpgczu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580479; x=1793185279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqvsiy9xSph23lx/oMulx9qc5APsD8qFIQ5tbsfSvls=;
        b=C8IH0aK5Kf7v2P71YtZAX6eY42U2xHk3gXTPd+W3VUjW6PJZ0NJzMvBVAnjqPWVb+/
         CoiKZUz5AnTFz7WpEDmpAPRrKrpGiuHMPhX8jVE5+WpGr2RUOFa49bRP2aAJZ+Q5DLZa
         Hnjy04maUyOiKiWzZp9R1jZs6y+kRujbnqg3nUprhvH/He/5WfNHRAAnuxWU9U7uJ7RD
         K29aarvGmyKWMKfK34drS+PE8h4PLTrHtPKeWFoZPIWa9TDzpRdLeOQF5A2PX+G7RuSM
         isHYMU/FR5cG9HyO5XsuBohTRr2kI8PFlIxZQ9A1ii1jK6bKDROGL0A9Z3R/skb7fRCB
         0pmw==
X-Gm-Message-State: AFq9FYKPOHPHTuE9PWpGhhDSSwL4zM6Okd7PEl1sKdHN5+wrIsZ7Ctl5
	kpcOaGMxdDE5HiTvYvfgnEpoJL3d2Ugx5zsvF2gsvF9gSZe200DN/AI8l8HKL/8TrgXv/lCh02x
	XmJv3
X-Gm-Gg: AYBFou2sZuvQnt+2o95TV5Y8mH0qpxEjPOJL8T0ag2hb2rvgk0/G5wV/7NswtT/Zq3K
	QMRC0v8u/GO9sZIaWFdJ5//M78uBbIq3q0koFI0vxWZkOgy9yPnb6tPaBCB4oH8a8FmQWw60gXL
	y/nkjAQHwf9D4ZAo5ablAE8u74ShV83pEmPLNsDZ1Guu6kZGk4QiQ2N44/nTXzKjJ04HRh89sM5
	NelJVIR1CiraFqRM9C4+rW+YonX5PpnCeAd3uKxwZA/RlpWHX5WnOM71qRjs+cq9ljJbAIdbXlO
	yqwhZtIK5UnAHRa6z6+70driYiN+43X2wQn5xqDTeAx+EQJiqgmAJmb8eAJAiTBHqPMDkjNouXT
	pEdGksyQ1uslrcs22Xcc5dJu5qmVzB5eeCRiqhRBom3lKPUTXKEyf1+8W+VSMTsPPBMJNgPPJji
	+UiSJv+Z3GbrUhup4O9ysD/IOQnZmfexwHAQrN4r689JLyAyCfFem6fOdQoTBhaRtPNBO5SxNOX
	nXhH6ExvrUB7D6a9DGtnuzWuO2o2EsPd0ZjKCAf9sc2cDQdB83Yy7sYeojnrpfA13s6a3Iiqkbv
	GOhOWGJCVvzfyqq+8Ai+jsHRH4Y2UATSQfICtM5FRpBAQuiRwBrcu7A5XUJjbDPHS0vLtz2L1Bq
	Cirgf
X-Received: by 2002:a17:907:724a:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c46058d8f1fmr396381166b.23.1792580479303;
        Wed, 21 Oct 2026 04:01:19 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:17 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/36] python3-eventlet: Upgrade 0.41.2 -> 0.41.3
Date: Wed, 21 Oct 2026 14:00:30 +0300
Message-ID: <20261021110103.1943456-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131265
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.41.3:

- wsgi: Raise a clear error for non-latin-1 WSGI response headers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../d19ad6cc086684ee74db250f5fd35227c98e678a.patch       | 9 +++------
 ...on3-eventlet_0.41.2.bb => python3-eventlet_0.41.3.bb} | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.41.2.bb => python3-eventlet_0.41.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch b/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch
index fd0fc91d25..5b4b2b9aee 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch
+++ b/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch
@@ -1,4 +1,4 @@
-From d19ad6cc086684ee74db250f5fd35227c98e678a Mon Sep 17 00:00:00 2001
+From 5a25c6991b51c58e8cbf54f1b7c1e2fd80e7c39a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
 Date: Thu, 6 Jun 2024 10:29:29 +0200
 Subject: [PATCH] Add new thread attributes from Python 3.13
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/eventlet/green/thread.py b/eventlet/green/thread.py
-index 224cd1c..c70c9e8 100644
+index 98baf22..2651710 100644
 --- a/eventlet/green/thread.py
 +++ b/eventlet/green/thread.py
-@@ -174,5 +174,12 @@ from eventlet.corolocal import local as _local
+@@ -179,5 +179,12 @@ from eventlet.corolocal import local as _local
  if hasattr(__thread, 'daemon_threads_allowed'):
      daemon_threads_allowed = __thread.daemon_threads_allowed
  
@@ -27,6 +27,3 @@ index 224cd1c..c70c9e8 100644
 +
  if hasattr(__thread, '_shutdown'):
      _shutdown = __thread._shutdown
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.41.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.41.3.bb
index 67a69b1478..cc003096d0 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.41.3.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "721b86b77fca33a735598292022ac6feef99747bf48f52defdada6b572acd5af"
+SRC_URI[sha256sum] = "66d1883f276e94d040d007e99d7085e6aa5f2738c5b8783d165a137050dc8fb6"
 
 CVE_PRODUCT = "eventlet"
 
-- 
2.47.3

