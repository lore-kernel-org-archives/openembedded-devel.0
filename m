Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E98CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 16:43:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.5258.1760028181126622977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 09:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NG6vCLwd;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7841da939deso1111427b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760028180; x=1760632980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PbD3onODfnT5ThLf/hAX6ERHLsK2P9Du0X/32t4j6LQ=;
        b=NG6vCLwdXiN/dp/xow8vAaPy9Vp3f8APBj5OriX464GZAV+41XPU9aytWL8Ok08pMH
         vA9z4StNd0YbDONd7l1tHqV7j8wcbnoyLB2OuzMHD7ZhfxJMYQJJwMU/T/w5yDn7YizV
         IzXa2BBNYpAAo8EgIrVNfMYq1IgAhqLNGpCYTFTH5HkB/mT2YCa0erHDhQoA/6r+z8cc
         y03HMX06eJduSCHjHAdmlPP3+8C5Z67mEszHhAVp4MESifXvj6ZkCCuQICCEkgMw+SQ1
         mG54opvmP1nZQD6ut9sElcwX9qUuC6Jfank6FPMrGxm772er+bVkdbTa9uSb979FdB/w
         wtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760028180; x=1760632980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbD3onODfnT5ThLf/hAX6ERHLsK2P9Du0X/32t4j6LQ=;
        b=WFqxaa2tN6ffUH2X9m4pWh8jCVUls36f0zf/fy8tb7CqN9IGrxhA1lwMYeeXe0lM8N
         hSnz6dmIPvvQeReYkLJ5U32KSHTlyeSq4gqO958g/nROUP2SbV9COKxkHYPIEswjM26A
         LJZZkOcpFAGF3+v9cQqf8Z3a8/3f0uqWTMJVYL5j8Rzs5IlrGv4MMB2QnjkN5kDRa/11
         0nFnevDhyroV27iN9magdAasvGMZrdCqlkGQ1zc143LxtqktfXTYgn3k2ziJMmTcvL1k
         pDqFhJn+DODbW9e8pFS1+kyKAP0kE6U4zWvqz3FiO2hssWgWhzUHpn1VSXXUar+PVBAa
         Jaow==
X-Gm-Message-State: AOJu0YyAzoPT4H4EAsJObxEJRk0F2SxWFObAX0Lv5OooErpLDWhR89ir
	BdXrVwpU6JIq/AIAryeLe8iTezlVY0/t0ds03CmJJT5rjyqtJSRZeI2vBzgNEnMa
X-Gm-Gg: ASbGncvpqZbINU6YWMecrpWDPvMLoBW5eoFddlsHANB24ryltIQlwg4lQnq3Gfbc1I/
	Z1zCTmqxhYv1BqrwA0xabgcXWECGOiKhFcTyfZ68uXLUKEPRoOz0gx4he1qxqX+y1KaLVBmAw+C
	tqql0wDBH5uRdesZSgx7VZ6a5e7eaLwrBeWA1H3w+sjwVBMDiPf1whHvfRw1H/xTiYyQ4jCO1uh
	8q/0GdUFIiEbv5x8HzDgUKqTw0RX+YLBR6ORVR3NQQfuVFdhoSEpx3PaKLz/3IjTyC910+WCsJx
	fuWVCCm87eyaofSSVjiwdeMxeXd48JlJkbCs5aS3quwVkdGeT+NYWjtkqZ9SMLuO376K2Um1wM1
	yf3GVckjkQB13igqiy5HkHeAbT+F0aLD0TWdjd+DHcfp3U8I=
X-Google-Smtp-Source: AGHT+IEdMssl77RpiPtLvJpiAM25JERClv6HPMpP41kHHR1/SDdopamyGpN9CFYpwAdqFC87t5ZTDQ==
X-Received: by 2002:a05:6a20:728a:b0:2b5:9c2:c579 with SMTP id adf61e73a8af0-32da84ea53amr10763057637.54.1760028180148;
        Thu, 09 Oct 2025 09:43:00 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4a63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm177363b3a.80.2025.10.09.09.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:42:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pm-qa: Do not hardcode PATCHTOOL
Date: Thu,  9 Oct 2025 09:42:57 -0700
Message-ID: <20251009164257.251971-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 16:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120433

It seems to work fine with quilt as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 1574bf0ce9..f792415037 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -18,8 +18,6 @@ SRC_URI = " \
 
 CFLAGS += "-pthread"
 
-PATCHTOOL = "git"
-
 do_compile () {
     # Find all the .c files in this project and build them.
     for x in `find . -name "*.c"`

