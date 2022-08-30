Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFA6C6FA82
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.8931.1661843664327561696
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=px5inUYq;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id x19so8620771pfr.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=hPCgRGpowdNiuzPY7aoKT3MLMuFvxtU/0/G8pICaRmQ=;
        b=px5inUYqiIEJqzzhFdln1Z4wbTDCfNxfNwxS47vXFlpUkClF/nIGHaijfKlN3kWwwB
         W/21Mvvpc1tanbECx5vSNAqaS1DsOF05JkYd+hMNNKP33289noNt4ozsr/nSKgn76Kgg
         t2vJ/KMi4XmR7djFjg3b8KZF7drDFFrfrGWIPJtodwYNsxkpTZkab0G9ebiEC9hjLw9t
         UcsNmwJ80IMHE2Zgj/GeHsfUMk+So50l69fIeQbP/KizS4MDfrg4lnj2a+xzo/7ZKXtM
         Q7rRB5D1ddm/O7GcbTkFlDLWrmi7lM/Ng+zqYMJR7xf8H8qBuXp0B7QSh6D0wT5mLUzs
         O7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hPCgRGpowdNiuzPY7aoKT3MLMuFvxtU/0/G8pICaRmQ=;
        b=HHdNUBChYR+9QvQHwvkTX6FUmBxYjXRX/8CumtZIRefZnq/3z1uSkDMZ/8xbgf6Rgi
         fab2opr+i7YYYRPhCQK/JaYiRbLJSDvzRmURZocNsXcQ0uerStif2J45OwhHtYb5wYmw
         8JhQW2HZCtBZXbO6EHm7WyTMPFg2VcT94LUvsVV+NaJIsDTFX14J6jxu/wf43oJk1Cv4
         1QIEt7449cgrV2h3EvoKmmWs6Yu9DS4bzloyJdc0TrUS0WUUKztPp6jxzGZWDzHPnORN
         g2B8TtuSSLOVBzSLrJGEL0ow6a+dRzleOIxJ6n0gGfXJDs5o8nQQnZ7CRznUamz6r4VB
         S6SA==
X-Gm-Message-State: ACgBeo3c515SHKNHti1YlVw5J2NUsL8J6RWKO7CqLw7ExFK0ISfoMdVi
	MY6TdfvaW4u/GIvEi8B6TVOI6d2l08K6AA==
X-Google-Smtp-Source: 
 AA6agR7WJykBvbDrsImvPvBE9U07Tldtcv0wi6TVS4zUdp+G2eD6bqVMhEpr79acz0LSo41/j80CRA==
X-Received: by 2002:a05:6a00:2349:b0:536:bf09:9c0a with SMTP id
 j9-20020a056a00234900b00536bf099c0amr20191786pfj.32.1661843663127;
        Tue, 30 Aug 2022 00:14:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 09/21] mctp: Update to latest tip of trunk
Date: Tue, 30 Aug 2022 00:14:01 -0700
Message-Id: <20220830071413.3887189-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98546

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/mctp/mctp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-networking/recipes-support/mctp/mctp_git.bb
index 602724da34..516f3e2d9e 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
 
 PV = "1.0+git${SRCPV}"
 
-SRCREV = "669740432af525c19a6a41cec777406fbbc24836"
+SRCREV = "ae3a9162d6c5df0fa50abc34fc951dfd0e3d23c5"
 
 SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https"
 
-- 
2.37.2


