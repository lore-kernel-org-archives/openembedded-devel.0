Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3AFC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 07:33:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.22381.1716795205273964502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 00:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=Vb0A50n8;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-421140314d5so5386625e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 May 2024 00:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716795203; x=1717400003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sw8Mh6OxVEhbsa3p5LcWUZOShAldGfXO3Ojd9TQGL60=;
        b=Vb0A50n8AL4zV/L+7AcvGZIRTp1/35zYbJIe/vD7CYj7StdM9JmzDoiWFMwiDf4ZZl
         zo+PMyhsv6sWZXxMgmNdO9KavnzkSWOzFV+U8zSCqhvVMwrqAGKRY/69I9g+kKHtxhPL
         /b6uy1bQpgVe4B4lkPUuR8d9z07NXD4WZY08yKp9yafDUrwa877KddCVDwYWjZ5+ScI2
         Aqqa1YTARHXFcZD0sSrunJ0F8iMjTLGh4Up7a7qwff8L1CtjLiwvhyWNqb8l8Z6dhq5U
         /gjl7gY8rCJkfyeujQv79N8P/3+lMdccRWtOJ5TWrpV9+GnnZwqQvKX6d9BfQB5hAqMa
         9G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716795203; x=1717400003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sw8Mh6OxVEhbsa3p5LcWUZOShAldGfXO3Ojd9TQGL60=;
        b=r916AGhj0NDtPyg9B3yQd72qeTnU2XRqf1mcKRrsqImKSaZeWv3SIknGpu731rKPj6
         8WKP5317BwY785KqaGAJ/HJTXr3KtI9yx0IuBT2hGWl/9pOGZnhKSTQKF4b/CNG5DLZc
         KdBiGjI8gqxQ2uGUPzEtx6rK89GUwp4zhclvmvwSleqMieaY1r4aH4WMRjynaTggcMUQ
         VTiWcWR6ZvrtDnAQPRhKOC1wKc6ZDDAJAsX8uSgByg9bywPPuCwBgRc25T/U/bXV0qNG
         1PxTt5v0rXBNnlXO/c+4NJ3mhYFlRC/1mLlamaujx22wiVL6kPwesMZTEq8MIMaS8ifg
         KshQ==
X-Gm-Message-State: AOJu0YzqMp8tsa8IsVfb+Z44bwC4uoNYrmoERTp02MIYxgSn8MQhlI0x
	NrUq1dy2XCDwa2OuCKkDAFEadQBZdeXVec6od0HJsMdLkhoAqdq0Xh6uApoVGpuHXVJbDE55K+u
	C
X-Google-Smtp-Source: AGHT+IGpui+vzONXw6g+aKptUMSwVUG/NFRyo8lWyvi4VGUSdIFT7KLph5K3r5sL8VviISID+41Vuw==
X-Received: by 2002:a05:600c:4f89:b0:41b:a670:a9f1 with SMTP id 5b1f17b1804b1-421089ccf68mr61043155e9.7.1716795203469;
        Mon, 27 May 2024 00:33:23 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm129828015e9.24.2024.05.27.00.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:33:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Truong <alexandre.truong@smile.fr>
Subject: [meta-multimedia][PATCH] sample-content: Set UNPACKDIR to S to avoid a QA warning
Date: Mon, 27 May 2024 09:33:20 +0200
Message-Id: <20240527073320.3472465-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 May 2024 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110533

Since recent UNPACKDIR work, default S directory is not created anymore.
By setting UNPACKDIR to S, S in indirectly created in do_unpack.

Fixes these warnings:
  WARNING: bigbuckbunny-480p-1.0-r0 do_unpack: bigbuckbunny-480p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckbunny-480p/1.0/bigbuckbunny-480p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
  WARNING: bigbuckbunny-720p-1.0-r0 do_unpack: bigbuckbunny-720p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckbunny-720p/1.0/bigbuckbunny-720p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
  WARNING: bigbuckbunny-1080p-1.0-r0 do_unpack: bigbuckbunny-1080p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckbunny-1080p/1.0/bigbuckbunny-1080p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
  WARNING: tearsofsteel-1080p-1.0-r0 do_unpack: tearsofsteel-1080p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/tearsofsteel-1080p/1.0/tearsofsteel-1080p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
---
 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 ++
 .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb      | 2 ++
 .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb      | 2 ++
 .../recipes-multimedia/sample-content/tearsofsteel-1080p.bb     | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index e5a8f085b..83ad136b4 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c2
 
 inherit allarch
 
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${datadir}/movies
     install -m 0644 ${UNPACKDIR}/big_buck_bunny_1080p_surround.avi ${D}${datadir}/movies/
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
index 37e519790..b054948e6 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "40d1cf5bc8e1b0e55dac7bb2e3fbc2aea05b6679444864781299b24db0
 
 inherit allarch
 
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${datadir}/movies
     install -m 0644 ${UNPACKDIR}/big_buck_bunny_480p_surround-fix.avi ${D}${datadir}/movies/
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
index 2b233d3e1..4b80d110a 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "b957d6e6212638441b52d3b620af157cc8d40c2a0342669294854a06ed
 
 inherit allarch
 
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${datadir}/movies
     install -m 0644 ${UNPACKDIR}/big_buck_bunny_720p_surround.avi ${D}${datadir}/movies/
diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
index 34753fdb1..02b3c3048 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "bd2b5bc6c16d4085034f47ef7e4b3938afe86b4eec4ac3cf2685367d3b
 
 inherit allarch
 
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${datadir}/movies
     install -m 0644 ${UNPACKDIR}/ToS-4k-1920.mov ${D}${datadir}/movies/
-- 
2.39.2


