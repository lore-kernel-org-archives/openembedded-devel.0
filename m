Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D794BC4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:30 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.26004.1651346308436970568
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AvW4u3WZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id iq10so9728208pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+DFOyS+GS/OzJWRMQk+EfhQT/CuSBBd1vaawLcZ7VnA=;
        b=AvW4u3WZiWVS388o2WnNojifnOiuQtCDIZtBmtq6FO8sj1x+0/wWca1CV775BYoGTh
         Jv/V9YTTtwyknsXlxXjf9/e7CEWd0v9z7GQIUXXyO9r8FQTv6lghBppzWSbYzRkpQ6s+
         //m/QM/toLHHSHjwFm9kA240DKGfi2nhL8SWS49IB7Y1H7ijkNPsz1IuME3/+Nk54IaZ
         bXFEoQdAUMkp8fbYWe/7j4gfFBORgTYav2s8I0uqGaOBjoS9Fe5Eqkxt8ZCw4rpwWmgS
         AuSKJ1zi0gNvNnU8p8AoTABUZPoaGE2QTjzhTet9jbI/DO6Z8UDf7kmWBhsd+8j3lqWP
         bIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+DFOyS+GS/OzJWRMQk+EfhQT/CuSBBd1vaawLcZ7VnA=;
        b=2snHvh6vqfPvtKnNssVbYkPgbaiejgIWHzpD55gx3nx/ZUlhp+sdK4p9K2nhOfbbbs
         wmR7t6fNCa78GtylRKuOixfwx+0WcjQF0yOe2CAw9xhMiylkDjT2Fxutb0DF8JIdY6BX
         LfHZTbi+p98Y8K7vB4jolYQljdEp8m9PtnYj7qWPNjJV1zPOyQhZvNOuT1fmejl2wAfj
         x/wZWILTKhCblMPiYrupCwBIWFksZgTE0O61SK8PLLUoe4hp/yvBmYuHmkWoe64fI6KT
         WvAWf3T3qhevotUojRGeyD4bAvqG0HKaftovK3YsdZ91tyPZcaKZAyxuoLNZqTW2t8P8
         wdaw==
X-Gm-Message-State: AOAM532F027yY9pIxVy56Iqus2l+Wa2ci/CYyjooEaJ1BM5RIx1zm2LQ
	9t1jaZLPeOlp3LJeEhgnXz5QK55L1QZ8hA==
X-Google-Smtp-Source: 
 ABdhPJz7yrDLFpqwLrq+cJG/ldgfoJvS8l9uNEtQTtCh98LweKQ/7fRVrEVEapwx5+Y+8XWjcrujew==
X-Received: by 2002:a17:90b:350d:b0:1d9:eca0:5be with SMTP id
 ls13-20020a17090b350d00b001d9eca005bemr10147515pjb.175.1651346307629;
        Sat, 30 Apr 2022 12:18:27 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 02/39] crash: Fix build for mips target
Date: Sat, 30 Apr 2022 12:17:42 -0700
Message-Id: 
 <5b34d240b08c81a6296379bcd1db50bafe3ce16e.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96868

From: Khem Raj <raj.khem@gmail.com>

The patch to remove these options is removed therefore instrument them
via sed operations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mingli Yu <mingli.yu@windriver.com>
(cherry picked from commit 224d8a8cbeef0c5ccdf03e9f6660203af7abead6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


