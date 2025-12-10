Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442FDD3C55F
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:27:13 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15340.1765373227268786090
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OOT7q+fo;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297dc3e299bso58406385ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373226; x=1765978026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gP1PaKk6NdwwV2CgxhpzE8E8IQ9oOonMfduzAuP1gMI=;
        b=OOT7q+folwBdM6ESwp2EzV7K4+TvO6S81x3ezIpDKGb07Zbx7BP278D4ahDRh88fzj
         AMdn1bQB8yT5kvI8pcG0rM2yZogpT6Y/trd5z3zHBJFwRVoOxD0F5WA0NzeVCBS9UYJW
         COUY10/8L/hTZfnOBGHsc7D8uHyvPbDoQKd4zH8YHsL4Arum8pBCNfywtRBX704+Npkj
         KQLCn/2DdTsUqFSQJoOmNV+OQ9bz5CgcacoAXu6mgNV3ZsaTRT2EMhliPrKeHY5TeM+Q
         DIVhSG5RrMes8hEE9BDcI3ITPrZ0YMyn5GMdACrrVUyWRD9KrJYU9dTW913Cr6l4UFyo
         S8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373226; x=1765978026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gP1PaKk6NdwwV2CgxhpzE8E8IQ9oOonMfduzAuP1gMI=;
        b=Z6+Ts94Yo8RcW3LGk4lfG8ECLCL3w6tWeMbDtF1RkfuC7/PBIkRc7PG//d7xEQF1BE
         BLLCgQZW5XcG1rVCbBixLjOvp2ea0jMYfXWw6J4bVNBEE1WDvouPLpIPNFiSJ+SPIr6N
         q3fIOPP9h//BlW8mB4IqJEYc/2DIwa7gS6kIQrO0imtaRrPpRVxCn07bZW1Bf4zkzWUT
         8wcQEGn+WLPFO+nXJUROh2t4mqQnAfov8XqF/Vh/vO8o4mW3qJGtSyjDdgy49rHikpVE
         L65RmhYxGoFvvsFMDIcTAPmtlr4wdoOStsRthuZT6JWQvIYahrWbIDTXcoOYqUTtGgdN
         00LA==
X-Gm-Message-State: AOJu0YwsComghvMQHlp6g2yzu/mL8FVdKfKyje7zG+LYwU/M1A3nL/ZX
	sE8KMNtcnSqISxDWQiRkJZtODTBinLQ/uwJf5nMIlX2p/Bt1hBYNPnEpiFcVtA==
X-Gm-Gg: AY/fxX4BPDtsDnc/4SVCt+BMVWNnYx3v4o4b4GEJ9/Uj2VK7yqjwvcjD5U/0RZfuESF
	SsIrhuv0ev0LUb9A3qKyf8EKw9Lzd6OPoj1b1NCnKqJphsjO8QWNx+GOH+Uks7MUGerW0IEIFkr
	0D2myQ5h5wiNSZbFTY8rPtJDaj8srqi9kHozT8C6sIgzjiI3hiMQwA7yZZJyJcHMVE9OUCBklGX
	6CnpIuC+ZJ8nn8MDVyvTmkYrBh1mwC1p19fN9YUaLLg/zEXMfWT+Mq9MxYMnvvthd8dSsrH0gfP
	+YHMZ5GYLauVZAwIlhJR9LZwYZ0d/XD7TWeuMGg+3oiUGmhNcTm7rEs+bBmR3pDOJ3/E8PKMvdF
	a0jUo+YPDxduDCnlfGCoc5KKcAcxDSZaQimIZLDjWokiyBrRhSOR6xU0jpVzJv6lbnbEM1T/jq1
	kAMhrybnvMDoUqbBCjb9QhSSpYaXWo10DD0Q==
X-Google-Smtp-Source: AGHT+IHABK6raAsfAD2fUadgrGWvbibrNHHPEUMbn1tZZEKCCO1ywxlAcpMi1Lld0B2s1jZFu4bKQQ==
X-Received: by 2002:a17:903:1a8f:b0:246:7a43:3f66 with SMTP id d9443c01a7336-29ec22e0f29mr26792495ad.7.1765373226435;
        Wed, 10 Dec 2025 05:27:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:27:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 33/43] asyncmqtt: upgrade 10.2.5 -> 10.2.6
Date: Wed, 10 Dec 2025 18:56:39 +0530
Message-ID: <20251210132641.323679-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
References: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122537

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
* Removed unintentional copy requiment from some of async functions parameter.
* Fixed Heap-use-after-free during broker shutdown.
* Rifined documents.
* Added TLS Websocket verify none port to broker for browser.
* Added Cerfiticate file's digitalSignature to keyUsage.
* Fixed wss connection from Web Browser handshake failed problem.
* Changed trial broker on `async-mqtt.redboltz.net` ws and wss port.
  * ws was 10080 but Chrome block it by default. Updated to 80.
  * wss was 10443 but Chrome doesn't block it by default. But for consistency, updated to 443.
  * system_test still uses 10080 and 10443 to avoid conflict.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 43779307f45dae2b790e0cba906959950df85fb2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../asyncmqtt/{asyncmqtt_10.2.5.bb => asyncmqtt_10.2.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.2.5.bb => asyncmqtt_10.2.6.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.5.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.5.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
index 82c657fc17..6a73543821 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.5.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
-SRCREV = "deeb7e36df859af0e90d2462012c48465ba49f0f"
+SRCREV = "cb3d37dc3432b9c03fe631eeba2d548de7457bf9"
 
 DEPENDS = "openssl boost"
 

