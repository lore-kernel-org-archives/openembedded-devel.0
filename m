Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5BBCCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:44 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18382.1777549660142071936
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=roLe+uIH;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so521576a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549659; x=1778154459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RirVBGxJMepnDD5f7o237pgyxWrhNjsDewY2anqD898=;
        b=roLe+uIHp1XpLrCRFuaj2Jk0hOdYfQ/ky4XtRbrJi1Q9dj3dGzEb7joImjnKPA9utN
         fimHdoFLvdR/T03DaJkGwE6EFrzDf79SI1ldpn2O/3iVH2pUWYhym9l3lISTETDKfiOV
         aBFUg8RdsmHb5np3zRpJKhNInzlo4zOzG189PCo2YJVoD6x5LIGs6N3nXaTZaX0puYPp
         BUjsv9JGDaCoJsBec7xa0mDeMjRZhw0W8yzUBFDWcX1v7YxniJ9Ww82L6UgN1Ku8iVip
         90Qwlg14Vrz/kc2Nmydxvqk2NVe1TK3TPfKU4QYrWL8WHdhBm2MP+UmtcSUhSHPAzpwQ
         yBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549659; x=1778154459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RirVBGxJMepnDD5f7o237pgyxWrhNjsDewY2anqD898=;
        b=ClQZdTIrQIa4N4HIcm3pmmbTNbWIl8IfpRrQBKc8ae9ze3IAAkbI+67AES6PmZPFp9
         1w5EJCOYmb4tilN6twNlSWfl6XtVcsEOXHvYO9Gd1DMrUsRg6wFIt7si/edTzmX5qDz7
         Xa9nRVRVD7WifaaDHvQgfejbihEbWdkCUbIkAPmbW4rnik45kkz1S+uTHz8XcELh0hnx
         J0ribx8tpoeTvy5g6yRxi8QnVh1YhB61D1o0xVoqSxZiV5kW8k2nJ/ZxkcUxBiJ/minb
         lBWX5qrzV4hiX3jz4J6y4gW77MN1stpRSgnZ8829U6gYvpcVwDeImmvjWPlJpUfniepm
         0Fbw==
X-Gm-Message-State: AOJu0YwIPv180cuDgf7wLwvxOzz+QqjDlxntEfEr3EmP1cHTpWSFhDNN
	03Q4ys3eCJlBfzppGMG33Q/nod/EtR4+VNFIFR/pZki9082vSD2D4kNzGSpNHQ3v
X-Gm-Gg: AeBDieuUsy488Y4AQKBwY+hvXqGP72S/PSuboX27/dsUq9wtDQmoivDN6paJ/sR1B0j
	P8NLGzdvZwllej57R/KxPbGzhrm42xk1sqK/NCTXcLw6LvJ7dW95iEGsidJZCeBzLFyWh+HBPnM
	MuOv0xB3q78X/0KKXMkLhMq6Q8tR+yrngMIZFzg67XzIH7WI2o8UK8M16Ny7L7via1Usk4Rexuh
	wZ8MjdU/XhnonHnWaUVes2O+0XIN1AWyJw0y2bplb/+8lIFk3VcwacFHwTK1EUR6cFfsHHTumFN
	wv1Xxw8bdtgn5xzPsORhxnZUl8p92IdgYroYj4BD4ioy59gXLaID3VA9a5C5nqEbvicHtM0WPEj
	m1sO4R0CNErLgAxWo1l9MuFF5qphRauKA0zer6zMurlRa7SljQNy4Lmm/wp+lxUXewueyIYIp2H
	HTkJDpxRk8jEHuk6lRjEMqcbxgx8DBlxJ7u47B2uocsm5g0E4=
X-Received: by 2002:a17:90b:1643:b0:364:87dd:b2c5 with SMTP id 98e67ed59e1d1-364c2f230d2mr2446958a91.3.1777549659172;
        Thu, 30 Apr 2026 04:47:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 14/24] python3-gpiod: update to v2.4.2
Date: Thu, 30 Apr 2026 23:46:37 +1200
Message-ID: <20260430114649.4184890-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126748

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bug-fix release addressing a buffer overflow bug discovered during an
AI-augmented security audit as well as another minor issue with
unnecessarily duplicated code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7e24f2b5a868989719a1afde14258b323c7a3a56)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-gpiod_2.4.1.bb => python3-gpiod_2.4.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.1.bb => python3-gpiod_2.4.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.4.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.2.bb
index 61a3fb929e..87765c2482 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4b54a1fd55a448865a0b32d41598759d"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "d29a1e8b2a065f7ed82f00a96009bc1486fc705bb2ad25820a8ae962ec6d7688"
+SRC_URI[sha256sum] = "602aae17ff365bb8e2a30ce65c6bbf2d8e7a7e64bf016e82e4fd4c730ef69ab7"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 

