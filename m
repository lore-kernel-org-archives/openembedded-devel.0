Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9368C35FF1
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 21:27:04 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.38234.1742160420660691491
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 14:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DTy1Ahx5;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2235189adaeso61683995ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 14:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742160420; x=1742765220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwxjSfWTETDAGUQxRfuMvd+JyrAb+wSR5UQCcsvXak0=;
        b=DTy1Ahx5pCT2vemvVpRoorEgRgyxSyedMjgN19+yzX7v4Ptu8w2HCd74WUATYu+/Nz
         dzcYxxq8IXe6FoJQeZs2NTzdcWN4u/X/ai7qd2bbDXYZ+hgzLpfYn2/6uPUrIvDkWOoi
         KI7Wp8gh5OjZ/lS2GFLBMzIyzKk0aPO8XmmTgmI/Lp82UtZioJOHfzOVokRt7KvdTkfD
         cESyWy5emSAo9fcUuqu/qlAH5TMz0lXDWH6YoXf3uJluvGm+9HfRQ5TBuJS1Ttw2xioJ
         ArLoVsglrySBgZ1Puf+pOSVbguO1cGIFsH4eNTa1zeOVIKoG+PjiRu52pzPby6WaQKH2
         Etig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742160420; x=1742765220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwxjSfWTETDAGUQxRfuMvd+JyrAb+wSR5UQCcsvXak0=;
        b=DjJw7rIVJoUJ8i3fPc71eDtAnPGT7dj+SA+an118kEH0Qo44Gzhf4qugFZv2C+Wy2s
         I9f1qiFvVO9zka6Z6c/8njrXc4ZD0rjKBeRdqL9z3lro2WYVyDQH8IPPiFUa1CpP++MO
         DsmQw9TuiBRxpE9tdWfKPbsslO1cxFxtZuT3HBHVuK1NJpEBq/xAtCXdtkKcS+R8sn7K
         mgBdIge01+dJLVWzMlkBONTYM6g5JVo0ORcXSpOWg1d91C/Q3eNkuQIfhpDn6zzou9Er
         hrodd1Huc+JJ4iiR9X4a443n+nwlsbvNLzzzlJoGSxmzevsbl/Y/UDNsunhd1lzeV63N
         luDw==
X-Gm-Message-State: AOJu0YxP/LViF+a+9KNMlJWEPNdRYlhPP4MNSbmNKYBDNbLuiE8MeXyz
	QpQoWd7w7sS4yrnRwipSNaX+bevAIKWlSGzmDuLI+bEY2WhXwVA8GV9NCwyP
X-Gm-Gg: ASbGncsuj9LZegSyOa1BZ9CXC1iwrDqVCOOeWYTIlqerMCDgJQdUuhMReelyM4t7HAP
	cvrMblu/ZKrOrdFPJSuHOlWGqp1B00n+uofB6K/qvFGgh1Zc5c15nUxYzXKoAnDwyttDpuEa4K5
	V9PN6hIH7NzIcWmrBQ13bGOQ4uKag94yyIGV3XCVKyTi7dEtgcmiMIgvZRVO09guBoXVqYF8+MI
	Q4uVJyQtLUR61gJCQlbZ8j/du0X/iCC3SIkHV2T+21kRpf9uQ+92OjKHZ/zp4PYvQioLI9T3YGN
	1Mw/DU44R5tCDpM5TAHNU+JrkWd/47Mq7Qz9
X-Google-Smtp-Source: AGHT+IHtHfcqIZC+c8/jbnoDMbivVpbvT3IQmb0OE8FUpH5jDC8/Qpbd8Sv67RtRMYqhBZ3/Va4IVQ==
X-Received: by 2002:a17:902:e884:b0:215:9eac:1857 with SMTP id d9443c01a7336-225c64f7f0bmr168559075ad.5.1742160419804;
        Sun, 16 Mar 2025 14:26:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a4063sm62071105ad.65.2025.03.16.14.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 14:26:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] ckermit: Fix build with GCC-15
Date: Sun, 16 Mar 2025 14:26:54 -0700
Message-ID: <20250316212656.3179516-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250316212656.3179516-1-raj.khem@gmail.com>
References: <20250316212656.3179516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 21:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116003

Also fix native pieces to build with gcc-14 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/ckermit/ckermit_302.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index 898a4eeb4a..f5d6d9d4f8 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -29,7 +29,7 @@ do_compile () {
     # The original makefile doesn't differentiate between CC and CC_FOR_BUILD,
     # so we build wart manually. Note that you need a ckwart.o with the proper
     # timestamp to make this hack work:
-    ${BUILD_CC} -c ckwart.c
+    ${BUILD_CC} -DMAINTYPE=int -c -o ckwart.o ckwart.c
     ${BUILD_CC} -o wart ckwart.o
     ./wart ckcpro.w ckcpro.c
 
@@ -46,7 +46,8 @@ do_compile () {
         -DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \
         -DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH \
         -DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \
-        -DNOARROWKEYS -DMAINTYPE=int"
+        -DNOARROWKEYS -DMAINTYPE=int \
+        -D_DEFAULT_SOURCE -ansi"
 }
 
 do_install () {

