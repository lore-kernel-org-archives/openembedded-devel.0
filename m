Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD70EC3ABBB
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 16:18:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.52652.1746457793671681818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 08:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VvCucH2h;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e09f57ed4so41654475ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 08:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746457793; x=1747062593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TN8mPRdrXMM+OI9BCVMgMDpWvC60Jm5+ziEvl4CFlTM=;
        b=VvCucH2hFiSTLfcWuZJN8Y5HmhcMJAQb/kiDPQE7NDB5CnDGA1vhMehBRX3pmhqStr
         32+4AaVJgN4RDfbsUNzpBNSVd8NQFxJR2PMy4Uzw78mU2kXe3BmZikqZl2plIfmmmeH5
         4MnXTTm05eIrgvPvxshXmOIIn9SgfehNkxk+vZOhSvelLgbH1/BfP3RKnF0mCwgBm6DO
         YcrmHJbtwI0y2YtFzpjZ4KyClqq8ejhkKChLP8Vg7wKYWl1vOJ4UvbAL2+Xs8e1uoP2H
         AfKPyM2TKmhJmBcjSN6aRXtGpqouBMjbPY8x3le35eXij55hb48NATtFO6Ca1n3DxMf/
         HAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746457793; x=1747062593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TN8mPRdrXMM+OI9BCVMgMDpWvC60Jm5+ziEvl4CFlTM=;
        b=uKrAxJ/3cUjFK/9bFX4u3YeNZTF1uGKDvUXSZ4PVeLEfLgtofmBP+dqOT635mcKgqS
         WaTDnEgDhC6wsowINwY69diLMTa96IAHILfEa/Xn6n4koZE59I/Ah9UANITcw2kgpGIJ
         2K3E1aPSzzwhO8ok4CJ69WmMkS3t7wS72l9l5LO7IfR6aIze53Q3hOOnG+RNcTnzC1Pl
         Wh+K6QOBYLxKlnPBZvHcpk8hODUm/8WfJJEGGxKQ0Dgxf5BkQa6JDYmjtcT5y/nfhA+7
         8NAPK2XGBFUzhSzxwr+rZdwDBNkwHu16akstl6uM/4Sgvs6X8X2AzG0ulk5AQzyFqA0F
         Zvfg==
X-Gm-Message-State: AOJu0Yxr1dS6xPZkbZkxMDdUnAIkFT/MCDYCkotvC1WOYATOAiLr6KB9
	GTt5Pra4yZAneEcx7ErpWDR+uk9H3XiEabPHBTPSpFvJRZtgZtz73kYuAQ==
X-Gm-Gg: ASbGncstdFuEQi3/81K/O1gvzCu1Xv4GxEgmAOWJjFBN0Hwoveqwta3ui+TyDHi6c/T
	WJ4MOWlcRGY04H28YKTFXv5lmeIycs22rhD2p/gTGBxkFhpSnWUXovDqgmAtdVei8ta5wi5rRB9
	5evyHY1rL4r8xn0qSbMs7hHqK1IVXwxfW0U5qrtLH0ivo1mKaaPQTAtB6G3WNV5XqvvWPmvdqpu
	XhdYCScKfF/KarLoNATZggAFP6TJSsSZO535wvBprN/xGQay5GnIsD1xlNyXJj3oAeefEKmj2RF
	qWvodrjVATKp5R/y+Mq2Mjyezj941VJBcuh+af9htBFJTfjJUd7WfzgS0Z08zrJua6kNYw==
X-Google-Smtp-Source: AGHT+IFkFSpt8VzVaznSyZ0d7P//LBaxEftrivNYq3+/3c7YeNX/c2cADSzCbtfO7+neVLAfwndt0g==
X-Received: by 2002:a17:903:98d:b0:226:3392:3704 with SMTP id d9443c01a7336-22e1007aa81mr212602605ad.12.1746457792330;
        Mon, 05 May 2025 08:09:52 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90fa:f3a0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e194aa296sm44314285ad.112.2025.05.05.08.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:09:51 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: Move to recipes-support
Date: Mon,  5 May 2025 22:09:35 +0700
Message-ID: <20250505150935.6976-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 16:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117325

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_1.0.6.bb                            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-libsimplelog => recipes-support}/libsimplelog/libsimplelog_1.0.6.bb (100%)

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
similarity index 100%
rename from meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb
rename to meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
-- 
2.47.1


