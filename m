Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A31C27C44
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 03:29:54 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.5274.1716953391771820353
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 20:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XDVJBusJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-681a4422f49so1261956a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716953391; x=1717558191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kl0spEfI4DUIQAb8V9PaBjz5QeKYx288AxDjRdfGPVE=;
        b=XDVJBusJ4b/v3laXmwy39f5o8eMxNI56l9unTo1F8W2xP40Ruspnt07KCFcD/iLQYM
         Tr2ULDdOQ/AZ9r2HloOKTOrq/8swlV0p+zDEsyMVnlcy9cV6Szc0RcmQJOIUalRww+38
         lGmGJXEjwqeVm/q8CnQbYCo5S2nLQ16xsN5Q6V+rwjM5SObXZjedKKBNvkPrVXc0L2jD
         CbkRY7u61KB2VaBTRIrgHN+ai4iMVsU4/ND1SiBWuI8vXfQzm/iOE1NpjQl8jU1Iw6Ay
         E62NPLH2t4AaO8GufVgLRO3bqI7JtPE0Hx7k7BObjNuNo5wGp8J4qKSSwIDClyY7DMiK
         pQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716953391; x=1717558191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kl0spEfI4DUIQAb8V9PaBjz5QeKYx288AxDjRdfGPVE=;
        b=Uu6aaftX2kdQCn8XJS/iLJNDDzMjBtMBw4BqOd2R6UYsXTPDCGNsL9v/tjFY4TrpLN
         0soZKSv0LyCm8eJg4U7NCOJZwFgCzm6ydDpOTqlVi9GjqQtGRefGUy1oCEtKsiaFp+s4
         UFduEiFYAYGG6CwlXoJHO0nvDTlg0ApYH88W6zcnVaSEhHLw5G8trSHEQW9jyNJ9tOOK
         qwaaSEbM/RrZ7w1ytjxND7FkUBLKbzAq2FCvmQ9J4D2uR9QgIGoRWdZTqj2P6+mUH9xL
         BM9+PIWeaFv5/FP8qa7pUpI1JQEBk/eePZ2hmt+GReKSrrUPBcfelecFJxvHlvkFG3ug
         AHlA==
X-Gm-Message-State: AOJu0YyhYM2Wozoy4ljn5URutNDjMqTnk/LtUC+mbJzowmbn7cIWuP/x
	8oXOzSdnBid2CtE+ZcIMIs8zbZgLHyM/5CVNMOnhPEhAV2tjYbNwKSoC2/kM+FY=
X-Google-Smtp-Source: AGHT+IEqKilWM6oVTJPLDdBxQ5SDVYhHO3FyXST0xV10xNEco86JHLLh1/5XGFPBgbXNNwXVlMuD8w==
X-Received: by 2002:a05:6a20:1014:b0:1af:d4dd:65e5 with SMTP id adf61e73a8af0-1b212d5f68bmr14130907637.21.1716953390625;
        Tue, 28 May 2024 20:29:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3972])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c00f389824sm2341384a91.1.2024.05.28.20.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 20:29:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] ckermit: Define return type for main
Date: Tue, 28 May 2024 20:29:45 -0700
Message-ID: <20240529032948.150704-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 03:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110601

Newer compilers e.g. clang19+ will treat implicit function prototypes
as errors, therefore define main() with a valid return type

Fixes
ckwart.c:531:1: error: return type defaults to ‘int’ [-Wimplicit-int]
  531 | main(argc,argv) int argc; char **argv; {
      | ^~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/ckermit/ckermit_302.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index 3525f7ba02..72a2e16e45 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -45,7 +45,7 @@ do_compile () {
         -DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \
         -DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH \
         -DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \
-        -DNOARROWKEYS"
+        -DNOARROWKEYS -DMAINTYPE=int"
 }
 
 do_install () {
-- 
2.45.1


