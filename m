Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F44D33A54
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.27836.1730831900418419586
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KwlOZ+lX;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e34339d41bso49930227b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831899; x=1731436699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAst/p6i2cpWItjCH8hw1OdfeVfBcKzyNj5NAuPVuHQ=;
        b=KwlOZ+lXkwgp+9pQvCyS1pGwrzSklMgCgBItPromT7c249Tv2InqiFdEQYMbq113ow
         BmeD9hM+MZ7nJqtnMR6muUvOIRLsyzjpr0ze2/u9pNkD+5/t0+g7F5S99zxZgorwbEXN
         L7Ckwnqfak36GIOQF9hYAAok/9E047WPxvu1gehfRVgmd0Kqw5z77OQ2xj4iedtkaEh1
         NJM4grGnZaTRf118KfcBv4rTzyltkyitcCUZr3ffkvh5jqBbGvViZtu6i+7q+YtjCcvw
         5qNT3OHMLaN5R0LoCEm8GKRVeaMPUdx7zI14R9r+96Pd/s0TbR6ZZlqD3aqOFwmkHUNV
         nkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831899; x=1731436699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAst/p6i2cpWItjCH8hw1OdfeVfBcKzyNj5NAuPVuHQ=;
        b=BfPgxxKn8W4cr8ETJ+KluUUOIm/Mhunh833fzcsEOVj9iKMsL0vDRKohc4Jji0Tsf8
         se3EGYIg9096SLcU59zfSU6Z6ZWRHDuc8C1kd+h+7DaWyzyCUlt/gY12NR1HlmWZ/mKY
         Pu5r0FvOEdbLKgeViSw54T+KMZzgA54QYX8l1A8QcdlUNLbae9uD5zA0x7OuoZdHkvTy
         SCik60JmxO0VSHfW1XfYhycnHLY3/cYQh64EB3IXQTy5BCgAhq771DM+kj49JuICn8HX
         iyKCenBK5qjWYk50IFmMSB5YIYVIl+VlmuvmYXf5vDrOVAxIt0ui+j9twSvAgHyM6Wtn
         Raqg==
X-Gm-Message-State: AOJu0YzPgrMHaax1Z0fI4BzXTOtx7WW/88FvhrL2+BCWVRPwpxIb9qCs
	TwWLI4dnTnNf4IkxY/Yx1yCOnH0o2ciLHsb1cy7JIbQB47n96GtMplB8UlRD
X-Google-Smtp-Source: AGHT+IFo0nC8SVhYAWFmMMfG1ZTqDHDfdsuvoeV5tCSM/eRvy88813DIW0xNyQWUwVyBI0e/ljYsaQ==
X-Received: by 2002:a05:690c:87:b0:6e3:410e:bb84 with SMTP id 00721157ae682-6e9d89950d4mr328546247b3.20.1730831899127;
        Tue, 05 Nov 2024 10:38:19 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:18 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 028/161] cscope: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:04 -0500
Message-ID: <20241105183658.34982-30-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113543

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/cscope/cscope_15.9.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/cscope/cscope_15.9.bb b/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
index 99f3ba85d..fad885dd4 100644
--- a/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
+++ b/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
@@ -20,5 +20,4 @@ DEPENDS += "ncurses"
 
 SRC_URI = "http://downloads.sourceforge.net/project/cscope/cscope/v${PV}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "16f3cce078b6c0e42299def4028eea6f"
 SRC_URI[sha256sum] = "c5505ae075a871a9cd8d9801859b0ff1c09782075df281c72c23e72115d9f159"
-- 
2.43.0


