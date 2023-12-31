Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03ACC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 09:31:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.217162.1704015103644016420
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 01:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jw1kWjf9;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d5336986cso72263585e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 01:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704015101; x=1704619901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW3Td30q3Mvt+e612FriykjlRjWod6bEtn0ZVvJlQ90=;
        b=Jw1kWjf9utAspmlwH9+5Ecop0P+hvAr6B4Ef02J0+w9bf3ApkDT27+o1avQIAbZA+Q
         X/WyAYDlnC7xUaxiuHIOCfMSy3GetB0ZiFBMQvVoVM5wOop5FkfZH/bT2amU/WRAOC49
         A5thfZ1PK61BSltsVLxskb24/cN5RsdD8mVYqyujEfuVMFYZ/y9eef2ot+BQGu+B8Zre
         54EGjGs/3ca/Z5PwHLn2LX3W5l8I+MsEoktVqzyU1C2hVm/b1H8TgYgfstC/KV+XVLEJ
         UBz8oJZMlvuwSBou/HrFgaQS7kXSZ2C1+IcmJWjb2buwLlmHov9DpbzooohIu/bp42+3
         cKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015101; x=1704619901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW3Td30q3Mvt+e612FriykjlRjWod6bEtn0ZVvJlQ90=;
        b=KjALCKE6pwPQJOWfC1Y1CL0dHa2EqCdZY4SEMKg0J/qTBQNmNWSh2YQTkf7HuViUrc
         +GaXDqeqE6BNVHNF5uhWbv0ROWMQxZhM1Ko3/aVgvvuaaBtZwOpFBaqQErL63WAqkxi1
         zZZy1OzFhXgiTJ9jru1M2GZ1i/SmE38Hv2omtNZN3nJXr8aFb3ivfSNoTx9LFt0n2rIs
         OwZJdyPBblE7MzorWKvctupKXCVOFuTi/gmve++R8+meKpHaeygJJa6dIBK3EcWvJYkD
         Os6SHpkRkBQXesHeH31F7u0ejdGJF8s6Hs3BgLS7kGtRbSz7EB0FDf+tST6y1agSRLJR
         MShA==
X-Gm-Message-State: AOJu0YzlmpaHmvwQ3hNC2oBJa8DGRPLzuyZnnbpwJVyAIEmVdUUs4bvt
	5tPo5kFJCwYxKl+2NViYWxvkJmNCk4M=
X-Google-Smtp-Source: AGHT+IGlTL+KITzyuRCv0OHPhUn77ZW7RUmEAxr5DXpTC/w89R5UcUu/gdflS5mctisppkW618/wiQ==
X-Received: by 2002:a05:600c:2941:b0:40d:60ce:1694 with SMTP id n1-20020a05600c294100b0040d60ce1694mr3209950wmd.222.1704015100998;
        Sun, 31 Dec 2023 01:31:40 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c9-20020a056000104900b003368849129dsm22511506wrx.15.2023.12.31.01.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 01:31:40 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 2/2] ptest-packagelists-meta-oe.inc Add c-ares to PTESTS_SLOW_META_OE
Date: Sun, 31 Dec 2023 09:31:36 +0000
Message-Id: <20231231093136.15425-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231231093136.15425-1-alex.kiernan@gmail.com>
References: <20231231093136.15425-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 09:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107951

These take around 50s to run.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 9182acf44915..06c7de3f8b33 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -46,6 +46,7 @@ PTESTS_FAST_META_OE:remove:riscv64 = "nodejs"
 PTESTS_FAST_META_OE:remove:riscv32 = "nodejs"
 
 PTESTS_SLOW_META_OE = "\
+    c-ares \
     fftw \
     libusb-compat \
     rsyslog \
-- 
2.39.0


