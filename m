Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3566E784B3
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 09:15:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.77608.1696238142369750887
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 02:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hUT/5STh;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5384975e34cso1682232a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696238140; x=1696842940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBC4tiTD4IeWEmQ+OqhzKYdMIMhXRjysAc2Ab81olUY=;
        b=hUT/5SThWA8YPrAA1pWpFU8jZF1wriSxIj6/Eau95tpqv9VYGrqswIQ3ha8Gfetbt6
         IDfELH2sib9YUV2ryhaWdzZZTDTIxJVeUWn68PuzZFtnjOChNHF/jeoAZjkIohEI/YEW
         A2Hae9vx8drQKYdR11+42Q8sIYF+WsgcH99jN+wvhtKETJEso/GJe9OUNfK1wN1feBB6
         /PeyhzC9qSOJ0DsRiwzyrsXiCH7dUtOQvJvldjEG1/Z9P05P6f/gURQU5WUbTywu+mCB
         JyKg2HIJSDde40wyEVzwWxuxneRrys483a1jq2s/aO20/U/mBxcHZQhQbBjaWGx7sbxn
         m6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238140; x=1696842940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBC4tiTD4IeWEmQ+OqhzKYdMIMhXRjysAc2Ab81olUY=;
        b=uS5zMUr85fP4jMH3AFxyG3NQmPgB5THsbkpmB8EOvBVNDRQKs0sPlt8W+WtYx+bwjS
         6OOLV7urgEQ0Jebh1TKNjglcxRdMzr6ukNV7ja6buT8+QHbLcDGA3WgC92HpgzkNd8f5
         GaLXT92dLWduAhMQmbMxA76O/233dPqLpOWKo04oXe0TY5i7GijGIzPSv+4BKloC1pYm
         b5RZny15PI3yKgkTZ75CtXVIxQ4Vw4zvZnw8fMrmCLpDp/w86+7uQBH61MTPLsHCt6QG
         bfHBtumNBn/xsPhRDbKorOeqS90qIlHdg27s40T14WO7LLB3ZeYwymF6iA10URlIptV+
         jI+Q==
X-Gm-Message-State: AOJu0YylM6ZL73PsspxocdFcehNmaKWTzgygwQZrSalPRXJ7W1cOEFFj
	20YgpPh71LJq4Im4bBS+ln/3rBE0nVdpmg==
X-Google-Smtp-Source: AGHT+IGEaTobAqN19yLD+qsHIQEHB3NneLyRrLFVWcAX1Os3xLAiQTMv4OAP7+FbMQ6BwrqZsW0DTg==
X-Received: by 2002:a17:906:5a4e:b0:9b2:d367:d818 with SMTP id my14-20020a1709065a4e00b009b2d367d818mr7664116ejc.38.1696238139867;
        Mon, 02 Oct 2023 02:15:39 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id d12-20020a1709064c4c00b0099bd86f9248sm16768977ejw.63.2023.10.02.02.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 02:15:38 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 1/2] dlt-daemon: update patch 544.patch
Date: Mon,  2 Oct 2023 11:15:33 +0200
Message-Id: <20231002091534.963730-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 09:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105301

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
index 550493351..3699b8c83 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/544]
 
-From 5db28a4b85cf0ec3e128cfc7c9b71d12ec543695 Mon Sep 17 00:00:00 2001
+From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 2001
 From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
 Date: Thu, 28 Sep 2023 12:54:23 +0200
 Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non amd64
@@ -28,7 +28,7 @@ index d572ecf3..8608c6c4 100644
  
 diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/core_dump_handler/dlt_cdh_cpuinfo.c
 new file mode 100644
-index 00000000..d6fc3905
+index 00000000..03509fda
 --- /dev/null
 +++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
 @@ -0,0 +1,33 @@
@@ -62,8 +62,8 @@ index 00000000..d6fc3905
 +{
 +/*    struct user_regs_struct *ptr_reg = (struct user_regs_struct *)prstatus->pr_reg;
 +
-+    registers->pc = ptr_reg->pc; /* [REG_PROC_COUNTER]; */
-+*/
++    registers->pc = ptr_reg->pc;*/ /* [REG_PROC_COUNTER]; */
++
 +}
 diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/core_dump_handler/dlt_cdh_crashid.c
 index bca44e0e..8dd98d70 100644
-- 
2.34.1


