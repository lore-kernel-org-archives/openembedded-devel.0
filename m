Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103A8C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 23:55:53 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.1491.1718322947504407962
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 16:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ik7SIiA6;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-704313fa830so1291523b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718322947; x=1718927747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+IwkM+JVSrEJWJKH8rF+gLSA+1whhn+FlorPlkQe+G0=;
        b=Ik7SIiA6AJm5fisls2vCW5DfY1W0ioo5Zy24GkkHjNRcDQGbyiQKp4QLqwhyDtaqd8
         zAd/e7+WPfWDpDTVBC70Aev2a34lS1uSIfwzHwH6N8nlxLGATaV72+FDJmw617nHcpgS
         KUBQi7nKUMlBEm8DkBRPyHeaxHyykkpXzUOvgqI5LoLbiHhiUpqkp+22EiFV0iQ7RNv2
         mjHrD1NtQhAX0gM/inJQSM12j7pq9M/IlOB4sZbwSEDeHpDr5xPBvT9Hz8MTRd1up44F
         I3YeZPuJESMTaMBEksv4p0X5Mjb+m42F3gKvVQRvu2Rf1dpwHrLVvN7xW9RdjTXhjUON
         FHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718322947; x=1718927747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IwkM+JVSrEJWJKH8rF+gLSA+1whhn+FlorPlkQe+G0=;
        b=B5VkYaSWGiqrEAudIK2caT8jYfs3P4weDjWGNJlWixPfa/IOZZDsqVuN0AQmhs8CSO
         g4sGMqFgvS6NdLxKDes5vloVR8MX+XLebJ6pLyMALu6dau7/xKC1G8tXASp/wPpLrh4P
         7MgIBMUUSi2pP5o77D+tsGG82uJZghdMchcaZLg6Y5n6809NT+7BUDz5O9z2q2ENOxFZ
         W2ICPQSPcXDwd7jyiQN0PJgHLY5nukYko9GCOHvcsKdLDboNCQON7C9I6xcoqEIa0zO9
         ag+S0SYcOnP7GpMLxgKN3rBIxJExTSZJhoTTPR6CLLJosY2JNvIp1qD4lDb6prqc9Lh1
         Bnmg==
X-Gm-Message-State: AOJu0Yy3txmttMlN+iEb71DC2Vs7byqQ4zSl7uTLs6ZfmdBU0G7ZD8gh
	rzwy62lPjJLVPkl81eN9lbG0a7xlBCNnLphFKNVldvK79n4tTz7BTuKrzA==
X-Google-Smtp-Source: AGHT+IHey8/Kv1n/HcmxVqlOzTO5MZ8yr/6h62J6PcWIM4dnwHxqpXb7eEV4KumCY8gpcbPgletSVw==
X-Received: by 2002:a05:6a20:2584:b0:1b7:8fe2:439f with SMTP id adf61e73a8af0-1bae828ee1cmr1471570637.38.1718322946296;
        Thu, 13 Jun 2024 16:55:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::91d2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee804fsm19951285ad.131.2024.06.13.16.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 16:55:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-whitenoise,python-libusb1: Remove AUTHOR field
Date: Thu, 13 Jun 2024 16:55:41 -0700
Message-ID: <20240613235542.2996129-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 23:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110896

this field has been removed from recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb     | 1 -
 meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb b/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
index a045dfa8bc..3d7765607c 100644
--- a/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Pure-python wrapper for libusb-1.0"
 HOMEPAGE = "http://github.com/vpelletier/python-libusb1"
-AUTHOR = "Vincent Pelletier <plr.vincent@gmail.com>"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
index 352a53769a..2dc64af57f 100644
--- a/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Radically simplified static file serving for WSGI applications"
-AUTHOR = "David Evans <d@evans.io>"
 HOMEPAGE = "https://whitenoise.evans.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aba4901cc64e401cea5a267eac2a2e1e"

