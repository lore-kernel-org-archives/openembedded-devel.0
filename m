Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46171C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:20:02 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.694.1710177601467238491
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3oDov+V;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so3277604a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710177601; x=1710782401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCel+zXjc4P9H/ru9fW7DtmXZMMyZNDsyxkWDb2MXBo=;
        b=l3oDov+VaUyt6pEWfVtJv2VzHO4DdxJ2obGiR1GbDuVdOpi/QH+Kv1bFQxZwiGII+Y
         ZpthdmaFgcrMuSJlniBJ6uUKiRceY9MvpDlQbirjMIPzQLaKFCq9cTXuVu3ag7gf6x/R
         3Uc9GURoS5Tl8jhraz2b9HP9YI3K0wwscpESJCU1j6MAjA1ej49FwXzuxD2rMJBYqsBs
         jZLnQS+SK7Qnx4UoZ4b9ZJ4upbQtjW1s3JWvhvp/BWFSyqA0UUy+HuyYu38tWQvGmbYu
         oDq4vNPY3HlHd7n5X7sSgzzsu6A+S+MqcGQnf2VOaHU/JaY5ikgbwsiEVZlClN2T4M6a
         wW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710177601; x=1710782401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCel+zXjc4P9H/ru9fW7DtmXZMMyZNDsyxkWDb2MXBo=;
        b=nCla+4Y5UDwilMeAPI4hZFKPXZY+6KYtZKAZ6MhQyzzjp8jWSMxodEg0s7eId33csG
         kXXSa9Fb3UV6deru+PoZwkacNLT99QVqXMkTZ8XbQYFp7bNQDEMZJkYhmyHCatCISoX8
         MgXdJjIL57sp949g74f9EfilP80qzKmLxA20Bsc0+6Y3OTf2oJLtcXkZlW33GNSWaR0L
         g6IVvR/NXz7HTYhMasOucNt815Vok99yX2hVX5LsAIEjurgM9Z/hgzdEChg7yUdHpiQm
         1JZGAnOds63wHvP4X/IDaWyz+rQ5EvvShQClaCGJfiCJ5vf7XHa8EGyLV7uQY/Nh3NHg
         tGfg==
X-Gm-Message-State: AOJu0Yypz427Kyrj+a5+wuQ5u5+mnGw/I3v2g0dAMqqU5mo8dccbzqIj
	f+JNpCcrVkbxXsy069sZsgQsRQAApWhCiaVJ9bmjECpAW48PgvXDUCOoVZn0
X-Google-Smtp-Source: AGHT+IFoiYHyJnZ3rjnA5WTuU6IwroQHQr1F5BndYIyMtJZ3aazb/oKsEXIcSLSjQ/NWJINjFj//XQ==
X-Received: by 2002:a05:6a20:1803:b0:1a1:86e8:317e with SMTP id bk3-20020a056a20180300b001a186e8317emr3895020pzb.33.1710177600459;
        Mon, 11 Mar 2024 10:20:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e973])
        by smtp.gmail.com with ESMTPSA id q21-20020aa79835000000b006e5eaf5b486sm4608196pfl.85.2024.03.11.10.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 10:20:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libtinyxml2: Extend for nativesdk
Date: Mon, 11 Mar 2024 10:19:58 -0700
Message-ID: <20240311171958.3342451-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 17:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109273

Some layers e.g. meta-freescale/variscrite uses nativesdk-uuu
in the SDK which depends on it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
index 1c94eff246..bcd309282b 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
@@ -27,4 +27,4 @@ do_install_ptest() {
     done
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.44.0


