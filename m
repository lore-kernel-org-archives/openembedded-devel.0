Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B60D2B944
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.19534.1730817414546963414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hGrib6TU;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e290222fdd0so4907211276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817413; x=1731422213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2k+eMUn71Li/qvdXNmRHamEaFy6gketQAD0yPWVYF+0=;
        b=hGrib6TUJYsqKui5gWlpOoqK9ZHUBlAQ2ITTo/uF6d17Vluyr6ekXIuf077fVrPjGH
         yMf3IMEMB/etEVucdAI/02xGasDaSlahTEt9s4KZjS5S7HIom79+kDRTdSzqmjo3HDTa
         nIk58g0G62DYpNLKElqN64DMnbhUIuYfM95ycTsBn1wtbfyP8aDiUi1cc66vz8G4xG2Z
         7WbtyyxFydT0xFR7aulxls6CouAZEeZcCtdlMVu/mpIL5we1KPSk7RGW21VOITDdRjqP
         DIp49qI8YHkWyRE3i/jLtcCHaZ1nkw12/frNqOoHfOf5lWGBV+84CGGFB1t+w0Y4L8oj
         k7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817413; x=1731422213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2k+eMUn71Li/qvdXNmRHamEaFy6gketQAD0yPWVYF+0=;
        b=pDn4NHP0y6k7T26GvhAvlW+shw+BTXKBT+0t7j6SWsb4uuQKJQIdA8Vap5RhscgGOT
         9JPr8+spjrdq2kg2+zx58q6jvk4+qMCF+j5ngJdMZqpnZIjKwpQjw1ykyLWCyYB4uRH0
         3neBANfWzzO1HmzSI8hbWvRgxvU8bqfUo38H9zIOyrVI/c4RD4RA0J3Z1lACu/21T3dp
         2+g8YRNVhptUKxzSrkQB1y3rN71keBcY2N+vTgJqH7NkjT1dZ1PHzwSe6P98z1xxjRV/
         VrujobVWwCL3cFH6n+RJfcF9tbAZSqQbq3J37M6/ZhkoWpjYgdI+bmfhmsQmyi2REDEU
         AOeg==
X-Gm-Message-State: AOJu0YyNOnyOUHiumJ0n7mb6ix92SSlaqcqKNf3BS+WwFw7hJbk/3IBQ
	3MstoxDJ4vk9MNjls+TZr7tHs4wPDvGq7MkdP02CCHwu7yjCXANaq18AzA==
X-Google-Smtp-Source: AGHT+IF/Vn16N2INUyexbENsrHajXHXrcnthjiv/bQRNrt8y+0uLYHMhZC4gGQucKtLTLaKxovmjbQ==
X-Received: by 2002:a05:690c:998e:b0:6e3:2192:e0e6 with SMTP id 00721157ae682-6e9d892d7f7mr363326797b3.14.1730817413572;
        Tue, 05 Nov 2024 06:36:53 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 32/90] protobuf: upgrade 4.25.4 -> 4.25.5
Date: Tue,  5 Nov 2024 09:34:57 -0500
Message-ID: <20241105143638.2301245-33-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113450

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/protocolbuffers/protobuf/releases/tag/v25.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../protobuf/{protobuf_4.25.4.bb => protobuf_4.25.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.4.bb => protobuf_4.25.5.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
index 354b3213ad..d5fd901370 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib abseil-cpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "e915ce24b3d43c0fffcbf847354288c07dda1de0"
+SRCREV = "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
 
 SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
            file://run-ptest \
-- 
2.43.0


