Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D84EB64D9
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:27:17 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.521.1686886035664916389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ACeUVmbl;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-543cc9541feso234949a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 20:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686886035; x=1689478035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hxwOzubONyVJ6PjngJKsGOocPx/Eo1jZLEnvyTdFO4Y=;
        b=ACeUVmblSYmB6wLtPDGn/CLLqUCd3A+6YR+MKpVsxrTLh4MiIeUeytK5QrR7kWTrRw
         yyI0Yqg0+vm6777/Iew9oLY3EmWGCjPqOO+xiU4w2pF+l00H4UxJ/3APAa+I2GyWGUSX
         z6bhNyrF2QQM03xmtfgyVXWC9NvNsCGN1ZTkkGwkCnax55di+DVXkZx9iRKtmA9UNyOu
         29LwGoDCBkRgoRNn8/XD6d9dcYWkkRiNEDhzFvGWjnoU1wEXpOOoi7sR9bA9vA52/Fjo
         ZlJyl7Ap5AZWPrbwckonpEp/KraIuduCrJezO1jaTT4DxfKDEugDznk4RHbanIg0Iz21
         SUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686886035; x=1689478035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxwOzubONyVJ6PjngJKsGOocPx/Eo1jZLEnvyTdFO4Y=;
        b=lzpgwVUAGuLLrd03gxEav2D5T/pO/qL/oBhmylDkzCUcWoyItxee4g8nT5AysYrkcq
         qOWteb9rPPeLav0vIhaAbWs1W6+PkEoN2+N+0hrwlfKAjV86Xikvj97bTHT8T07lz1K/
         8+9qVjGZ35hgJ1JquokDqguZtMpdgMpyaoZk7vtYaltYUfh3b+8ATM8hmOiJFoSLP9+D
         tsUqLKz9nFDj9TFTqHBAcUxfc+oiusiIsFafva5roKZYTxUKD6weZJUUR/r0vJh4m108
         b7w/+g7jyECaIH0LV9BJrGbyyvqO5R6j+4d+rV1Lc95y6bSGlejzjPNaC2n1JoowOoie
         ncOw==
X-Gm-Message-State: AC+VfDx6ZR8XlFtwX+DNG9wUJAplWbnVf1YfBY4WfFtX9Ri0kOEWTvOW
	1EpClRUv6g5fAeyKoyJhEWgjc0s5Q7o=
X-Google-Smtp-Source: ACHHUZ79uFmdpkua+cJOZhsPhFNGIExX6Cv++/f8JQzq2xbtdaaYt+1vwfpzB5RL251WBMg1uQpg+w==
X-Received: by 2002:a17:902:b786:b0:1b3:a667:45aa with SMTP id e6-20020a170902b78600b001b3a66745aamr723659pls.34.1686886034734;
        Thu, 15 Jun 2023 20:27:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902b69200b001ae59169f05sm14793021pls.182.2023.06.15.20.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 20:27:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] gosu: Upgrade to 1.16 release
Date: Thu, 15 Jun 2023 20:27:11 -0700
Message-ID: <20230616032712.2118171-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 03:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103333

ChangeLog is here

https://github.com/tianon/gosu/releases/tag/1.15
https://github.com/tianon/gosu/releases/tag/1.16

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/gosu/{gosu_1.14.bb => gosu_1.16.bb}    | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gosu/{gosu_1.14.bb => gosu_1.16.bb} (85%)

diff --git a/meta-oe/recipes-support/gosu/gosu_1.14.bb b/meta-oe/recipes-support/gosu/gosu_1.16.bb
similarity index 85%
rename from meta-oe/recipes-support/gosu/gosu_1.14.bb
rename to meta-oe/recipes-support/gosu/gosu_1.16.bb
index 624adf3099..b209de16a4 100644
--- a/meta-oe/recipes-support/gosu/gosu_1.14.bb
+++ b/meta-oe/recipes-support/gosu/gosu_1.16.bb
@@ -8,10 +8,13 @@ GO_IMPORT = "github.com/tianon/gosu"
 SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
            git://github.com/opencontainers/runc;name=runc;destsuffix=${S}/src/github.com/opencontainers/runc;branch=main;protocol=https \
 "
-SRCREV = "9f7cd138a1ebc0684d43ef6046bf723978e8741f"
-SRCREV_runc = "d7f7b22a85a2387557bdcda125710c2506f8d5c5"
+SRCREV = "0e7347714352cd7f2e5edc9d2cf838d9934e6036"
+#v1.1.0
+SRCREV_runc = "067aaf8548d78269dcb2c13b856775e27c410f9c"
 inherit go
 
+CGO_ENABLED = "1"
+
 do_compile:prepend() {
     # New Go versions has Go modules support enabled by default
     export GO111MODULE=off
-- 
2.41.0


