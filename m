Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0A5C433EF
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 22:55:39 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.19948.1653778532794295374
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 15:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sc8ReB5O;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id y1so7405747pfr.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 15:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AIfr/YP98TvZfPq711tHpUQdrXq4L8cpfOts31jsN0k=;
        b=Sc8ReB5Ow+h1kANXD/ruzX0dcGxXszUieRoh2KTadstubJ/bntQOgkvk971XdnJgHs
         LZxD8COrlMKLWLx98jxIIzOqiCgrGC3pGZ+hF7c5cLjaGj6+/Yv3UOmyb6N26VdbR33I
         AP8CwdSFQDeaiBEk7cUmS4+1/EIIUlinQA+f012PmZByi8lc3QMIoOH8Mor0nKmwE39c
         9F5srXrRnl6jzutjwvcqKU1roaOZSjOlVUxOzMT8QP4xejehWtgBl8x7BMJuqBayf/p3
         RAUstXGgjo0/UD5CJs1ea+orNnjyiQXW9gqKXnw460+muBYFMKVYHt1SLVZAhaOE6Y0N
         FAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AIfr/YP98TvZfPq711tHpUQdrXq4L8cpfOts31jsN0k=;
        b=t2RgQA35PrWgqIjAcGsuslyzHabqSl7jb8509Vr0Z5jHtJMjRv8Ruy2v0Jntjq7RUw
         NJQV1hiYtgRod+Rr81W3nqY/P5J4U/SZ6uUYSKbtxn5ZTtdbz3J8D+zogLM5PsPKBwO6
         kpmY9IQ+jJZT0UtKnY2/kK5r5jfnUTxivLc+HBBPU9cLlpjI7rzj1r6o62yx879xL8it
         qECF+JA4XnjE+/JeliStr9Z7vqPKkFSoU7nBFJiS9F8JaUSyDabJB3paBQd26OS5jiVB
         NNPKlvdJXZXYdPmFNNIIHUeelrGAeECpNu7Au6ZKg41KUFppUi1yNMl1WwpgukuzCmap
         2stw==
X-Gm-Message-State: AOAM530DpIjDx5n3obyDLoYK1SnNmF71HFKLZiZXCo7xga70rcKiWzDO
	hRUyXSyC6nVkLEoA6Cmb4jvOJ+QF9U5JYA==
X-Google-Smtp-Source: 
 ABdhPJzZ5V5V8pybwOj5/TqsYC8COtKnDk16YM++N1IlhqeGVZSzsSifb50lAjxNza6NgQn8uN0whA==
X-Received: by 2002:a63:f003:0:b0:3db:84d3:743d with SMTP id
 k3-20020a63f003000000b003db84d3743dmr42884340pgh.97.1653778532076;
        Sat, 28 May 2022 15:55:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::47b1])
        by smtp.gmail.com with ESMTPSA id
 w20-20020a170902a71400b0016232dbd01fsm6117818plq.292.2022.05.28.15.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 15:55:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 2/2] python3-uinput: Fix build on 32bit arches
 using 64bit times_t
Date: Sat, 28 May 2022 15:55:28 -0700
Message-Id: <20220528225528.985788-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220528225528.985788-1-raj.khem@gmail.com>
References: <20220528225528.985788-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 May 2022 22:55:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97315

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
---
 ...time_t-default-on-32bit-architecture.patch | 43 +++++++++++++++++++
 .../python/python3-uinput_0.11.2.bb           |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-uinput/0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch

diff --git a/meta-python/recipes-devtools/python/python3-uinput/0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch b/meta-python/recipes-devtools/python/python3-uinput/0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch
new file mode 100644
index 0000000000..4095fc9095
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uinput/0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch
@@ -0,0 +1,43 @@
+From 69adf9e32f5b11e15c0cbe17f9331c77fed65bf8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 28 May 2022 15:50:50 -0700
+Subject: [PATCH] Deal with 64bit time_t default on 32bit architectures
+
+Deal with Y2K38 concerns related to Linux input events on more recent
+kernels and libcs on 32-bit systems
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libsuinput/src/suinput.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/libsuinput/src/suinput.c b/libsuinput/src/suinput.c
+index 8d5fb71..13ff16a 100644
+--- a/libsuinput/src/suinput.c
++++ b/libsuinput/src/suinput.c
+@@ -45,11 +45,20 @@ int suinput_emit(int uinput_fd, uint16_t ev_type, uint16_t ev_code,
+         struct input_event event;
+ 
+         memset(&event, 0, sizeof(event));
+-        gettimeofday(&event.time, 0);
+         event.type = ev_type;
+         event.code = ev_code;
+         event.value = ev_value;
+ 
++/* attempt to deal with 64-bit time keeping on recent 32-bit systems */
++#if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64))
++	gettimeofday(&event.time, 0);
++#else
++        struct timeval now;
++        memset(&now, 0, sizeof(now));
++        gettimeofday(&now, 0);
++        event.input_event_sec  = now.tv_sec;
++        event.input_event_usec = now.tv_usec;
++#endif
+         return suinput_write_event(uinput_fd, &event);
+ }
+ 
+-- 
+2.36.1
+
diff --git a/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb b/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
index 737bbfe2c8..ef466539bd 100644
--- a/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
@@ -3,8 +3,10 @@ HOMEPAGE = "https://pypi.org/project/python-uinput/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
+SRC_URI += "file://0001-setup-use-setuptools-instead-of-distutils.patch \
+            file://0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch \
+"
 SRC_URI[sha256sum] = "99392b676c77b5795b86b7d75274db33fe754fd1e06fb3d58b167c797dc47f0c"
-SRC_URI += "file://0001-setup-use-setuptools-instead-of-distutils.patch"
 
 PYPI_PACKAGE = "python-uinput"
 
-- 
2.36.1


