Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E80D3E1A8
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.29950.1729278797938752700
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EI8gtRGA;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7180e45d42fso1390541a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278797; x=1729883597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2WK0kRUHFJPP+H3wwdyYR2G4Himsxher7ZFJ41i+18=;
        b=EI8gtRGAx6EP9E2RB+eLCsOKGhqQS/hy20gq2BCB5zAVJ8xuWsmMmaK91OGSJLEqq0
         j1FrSAC/B9PFM6BtJqUA2sbf9xErfLJLMGsS18w3ULYWvlfQQD/lOzlvL3qUbeT2M2su
         9EDStSOtDH/CnezE1/YYhzJ4wsvmykfJQTGtYqse/oudKAIfgRd/LHvzHI/eC0i5mBeE
         65PSi++wXBMJC/Cu5wqBQ/H1YFrsHtWBWF7DzwWUmmiWOAvWNBz4HwCGhL4f7YoBZvbf
         qEz3Zhg9PrMsrPxg1S8ASXUwR1bWBfuuXhCT7Udl04lJPFBG5oq5nxv9C31kiLOEd71D
         v1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278797; x=1729883597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2WK0kRUHFJPP+H3wwdyYR2G4Himsxher7ZFJ41i+18=;
        b=lqKovUYffEb/A2DREyiNfq12C7aExS+gsfkxTx7X18aCsScUr6osgujnvJdMVXzkfS
         cP1JDxgwn1Trc0tqTe/aAyzQvTVNsXYnbnXOpKoV7whliWiLJWmg1aGO3ct54brW18FP
         kwLVUZstkafvSth6SsSGuTqNH5oHB/xk/gxFySDdst0Mg5MADLE32gm49PCGi0UZYYAd
         nh+Ffbbq1WAhwSa8qYhTbzzpGN6cvhmjbcqxqFh2oA2trmyejiM9qDjJe9xcRo8ORcEC
         dceYYyb6u4hkrIfoNedx7EkTjXxdZCvXVp7DhaBjbRcB3oRlqH40gShJ6wNl9lmCpkQU
         KPvA==
X-Gm-Message-State: AOJu0Yyvo4ccbIZOnvyPKiwKTSmqfQkhvuAOS6as+wzBm2OuCbzka0Bx
	ieIeRqpotIxNAyZPKgN78AgGdQ6ypqS8an+lccBzZ72aSYrStmNsoCiZmg==
X-Google-Smtp-Source: AGHT+IEn2Ev49wfJRzJjuiFq9hOQ8K9iX6C+bNTLxNnOEGuLBk2x7Zo3BAQX3F29fpe/P771lXneYQ==
X-Received: by 2002:a05:6830:350a:b0:715:3258:4ea9 with SMTP id 46e09a7af769-7181a81a641mr3677892a34.16.1729278796668;
        Fri, 18 Oct 2024 12:13:16 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:16 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 09/68] python-libusb1: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:56 -0400
Message-ID: <20241018191101.25184-10-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112996

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb b/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
index 3d7765607..96c83b3fa 100644
--- a/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "https://github.com/vpelletier/${BPN}/releases/download/${PV}/libusb1-${PV}.tar.gz"
-SRC_URI[md5sum] = "7b4f094786d1dfc8d011c7649d8ccb97"
 SRC_URI[sha256sum] = "4ee9b0a55f8bd0b3ea7017ae919a6c1f439af742c4a4b04543c5fd7af89b828c"
 
 S = "${WORKDIR}/libusb1-${PV}"
-- 
2.43.0


