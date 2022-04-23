Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CF7C4167B
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.2024.1650675480479974990
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Apr 2022 17:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KssRfSXg;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id h12so10671720plf.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Apr 2022 17:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJQfDfSY7OZ69KS9Iul8NUg1mH7jqb1LC9wzagec0mc=;
        b=KssRfSXgKr0l8gHTNeyq2EaZwjMCzh8YSwEHSZ76vmYzNtiXWCLxDnc6FLaU0KjwvA
         YAs9EFRI+Qb2aIb2fx7hlD3Y4s4TxILUFhL9g2Pbh8Oy3RCA5mTVPywzCXoS4Si7+sDH
         HIcAVk9wn//Re82QdANcopb0P1z7W5JtRs7uFyL/kGq7t2yp3DuoYVJ1L7hS3HsI6zG5
         XBYdxm3xQ42rpKL6BIfzwh14H2v5NIPaEG0zaMgKOdvRMgDG7GINt8kbRnbEGh2fQZCu
         /mxIJkJ4q9HwWEV7dK/VCFbIIlEpMpKn55IowIW/TFr+b0HXpIQmx0KOU0Iy6KVZYiDd
         LtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJQfDfSY7OZ69KS9Iul8NUg1mH7jqb1LC9wzagec0mc=;
        b=mq/xdsMCPEwlBZpLwsaRBPwVBo+UL+OdnmMl8aYSl6HRl2NCf5MvZivTmH1sqKRPgx
         3l72Nd9/tTqxu/9j7YWH5BgpA5724rkY0924dcR2wtyJhf3txW5N68Nm2qOg23FX8e6k
         OKVDbhUSjj4BmkGcoKAn6LSBXTItODXfBwFokCNBQPDavGMjvUwfKhfOdFYbJrcM7IV0
         i0fzzRKV2sh2qoEfxCyA43HBbYCzhmuhkhyaYKOWyJHl2OWKXN+yrXLFSc4Y1r0tAmfc
         moLkJpOXarTkai46OFrVqQnbqfz8T64m0pNVAKO/XQZ8dKo+AB89bQJZFcfd44i7mXmw
         ctmg==
X-Gm-Message-State: AOAM531IHeAmX6RJN3bQk75brKJ4/m/H9b+he6gqocTEeYSNsWSeXxCV
	kXd7orkREJ43USuEmhVbGquFBzYUuJXofg==
X-Google-Smtp-Source: 
 ABdhPJwM0hxWrYD0d8MIdZ9p/DVWiXzb2AqDzKTEwfcKVzkabHrcNqPEeNfFdEplla03DnGBfeQHew==
X-Received: by 2002:a17:90b:1d82:b0:1d0:5679:b96c with SMTP id
 pf2-20020a17090b1d8200b001d05679b96cmr19235608pjb.167.1650675479659;
        Fri, 22 Apr 2022 17:57:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 j29-20020a63231d000000b003aaee8ccba7sm497178pgj.64.2022.04.22.17.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 17:57:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mingli Yu <mingli.yu@windriver.com>
Subject: [meta-oe][PATCH] crash: Fix build for mips target
Date: Fri, 22 Apr 2022 17:57:56 -0700
Message-Id: <20220423005756.2857106-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96736

The patch to remove these options is removed therefore instrument them
via sed operations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-kernel/crash/crash_8.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.0.bb b/meta-oe/recipes-kernel/crash/crash_8.0.0.bb
index 4ea5b67de1..55de6a604b 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.0.bb
+++ b/meta-oe/recipes-kernel/crash/crash_8.0.0.bb
@@ -72,6 +72,7 @@ do_compile:prepend() {
 
     sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
     sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
+    sed -i -e 's/#define TARGET_CFLAGS_MIPS_ON_X86_64.*/#define TARGET_CFLAGS_MIPS_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
     sed -i 's/&gt;/>/g' ${S}/Makefile
 }
 
-- 
2.36.0


