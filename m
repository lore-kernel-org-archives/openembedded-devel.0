Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4090C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:52:06 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.10258.1744977120263651061
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HHuXLjjA;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac41514a734so270537966b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744977119; x=1745581919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8R9W0DxN+Ocvu0a7aTSOU8XhyIhiwL+o1oSHI6YRBJ0=;
        b=HHuXLjjAbAV1sXT92AKHoX2YR7UfxhWSdOVom+wzY+W0BuJxXd2jDt2ycVY1hOl8rk
         5dPJX18fCYo91CnVJkPcxKCV895H4tFi7UEmosYcFraCNxWHriaSDm9k2cGASO8EXUMX
         2obxBZPvAsFJJ+4Eq6p33wjtD3lgffzbm1/LZ9/kEtOBpWoUZ5AQe3gVTV1TLfhPgMvg
         w2PueVUCsN9NglrBcomLxghY3Dvjig5G/W8TfnCt3nfm0smvKgOS5yPrsLjom8rXT6XW
         s+uQOV3Ngwv8X6/39TDB6sxBSH6cS4mUmojKTLUpZg2Ze34nd9IV8vNbvQz4F8gSJSKB
         647g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977119; x=1745581919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R9W0DxN+Ocvu0a7aTSOU8XhyIhiwL+o1oSHI6YRBJ0=;
        b=fdeigLap480v3JwpyA0dX3DVN6GvwgMzED9jzZnE8TWlohmLAXvuRkR9MUf5k2R+/Q
         53U6Rqt15B+wshjLXF9XDblZ0BQ/uVErIq+viESGd6th9Cw09WR0CkhkbFYZBKGPnDCT
         ncp/X/IpNNV+APUdFsEtezQEXiVHluhvPxemknM36jv38PvLXEg+cEW0Hmp2VkihVXKx
         SF9AT4eKOdTRH+4F+avhAcLRTxFLIieuc7rl+2Z9/7lAc5PSMNQKQFki8p80fp8tyoCM
         GzhSOPAsKK/5vlLtRAkESm5ZcGunMRBpUNQzfPZ9oyAd/OzBTjda36+YgudvqXjtw9wD
         Tskw==
X-Gm-Message-State: AOJu0Yx6XnCyeouMnevwoJkQOvVWpSrX5+hlS+wksim9X9bUvlW1KBNF
	lh8hvINdTn7kUArLD6KR2ZYRuSCVn4/A5GbCopfGsZZZrCRLf4dJwITEDg==
X-Gm-Gg: ASbGncuMEgc7Ri7TEaV80gmlzaqjKmnG99TOtkIurxvXJxbSMMae7M3NR0dAikU/h4u
	zJm2UsFIpzI1o+WmFBv49oJB9UE1Tfn/VmML7O5VwXQnFJp8p/t8ftTG9oDozEfW/lGo62nm8oW
	MROhkww4YP5LyTvUYRyDKdi1jkGpOb1bxCRbm5DqeYX9eks4HOmH5V1IZ5WsLkCycSQ0ZJahKbk
	I4HHymDK64cu1JcVL8SJ38iXkzvKJ5y6BAyypj2ktvrqiEorXhtCqcAwEVlaL937ca74pz3bN0E
	gCSZnfa4V5104t1/kjzcDshMjTUjAAHIbVBn9qtkwdyi2MZ8QMXj8BeGeaDiDnSTcm/SgPPEfnh
	fsUWKWxrcjtescaSvY9dq12d4FVs+38A66CbRmqLRO4fM71GFHa7R
X-Google-Smtp-Source: AGHT+IGUVsxpN99viD8Bd6oyAZL8yHpQ83iXGo/trtitAN3+ounTZOyO9x9sIUJXc/Ut1gqiRz0HTQ==
X-Received: by 2002:a17:907:c16:b0:ac2:9683:ad25 with SMTP id a640c23a62f3a-acb74b8ceb3mr186562566b.34.1744977118501;
        Fri, 18 Apr 2025 04:51:58 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa5c5asm109718166b.166.2025.04.18.04.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:51:58 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][scarthgap][PATCH v2 4/5] can-utils: Fix build regression on musl
Date: Fri, 18 Apr 2025 13:51:40 +0200
Message-Id: <20250418115141.150272-5-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
References: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116961

From: Khem Raj <raj.khem@gmail.com>

This got introduced with 2025.01 upgrade on musl systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Cc: Mark Jonas <mark.jonas@de.bosch.com>
---
 ...ime.h-for-timespec-struct-definition.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
new file mode 100644
index 0000000000..91b9dd3c4e
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
@@ -0,0 +1,28 @@
+From 4363ef59cc9f2169455f56453759d4a4d9b89a5f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Feb 2025 22:14:47 -0800
+Subject: [PATCH] Include time.h for timespec struct definition
+
+Fixes
+git/isobusfs/../libj1939.h:33:18: error: field has incomplete type 'struct timespec'
+   33 |         struct timespec next_send_time;
+      |                         ^
+
+Upstream-Status: Submitted [https://github.com/linux-can/can-utils/pull/579]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libj1939.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libj1939.h b/libj1939.h
+index 44393a2..7c19f43 100644
+--- a/libj1939.h
++++ b/libj1939.h
+@@ -17,6 +17,7 @@
+ #include <linux/can/j1939.h>
+ #include <stdbool.h>
+ #include <stdint.h>
++#include <time.h>
+ #include <sys/socket.h>
+ 
+ #ifndef J1939_LIB_H
-- 
2.34.1


