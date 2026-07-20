Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05EFC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:01 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11400.1784590735057463578
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MCsPeOfu;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cad4170e8eso148643065ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590734; x=1785195534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InUuMlfrQAjFAKMQJcoYJ9lBV5CcRQ65enJ7nPPCAsI=;
        b=MCsPeOfuUxtmvVnys7RuDV/Xf/FAKAqHYzYoLvgRGDCSkRnor0Ie1im1RI+OEOPiLN
         27OW0HiN3WMFsSJG+upNNfP4sYHv0M/nbFx/56QfuMeAuchl0Ore8Axvmhl3isC0yd04
         NaUFz1BNmUDgvBL236usbKd1tdVqQDdsyfrLHVsc1SEIvsQQBCCDPdwKf53z8mTZWPsH
         prWH/IZO3ZD2riBjM0e10xnMl18gUEkJtF5mUMNc9igA7g+dVT6LBUWfOXluvdpKkKDy
         37A94GBmSwOvFF654N9KWG4lMr+q1KljEodbce3nQjII4719yqaEYumoLNM1owbYaSxo
         FjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590734; x=1785195534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InUuMlfrQAjFAKMQJcoYJ9lBV5CcRQ65enJ7nPPCAsI=;
        b=dK1PtYJjD/FbRyHbAxUy7aRmHV+zlej5Ol4030MeB+zoD55ssk3NPiF0gnI1CQnugf
         9BhUATU4TTacGrZcaz2eC+XNZiyMOKRicbxs2NZ6t1NIIMq08UJvQ22K1XF4hwFq43W2
         /cccq4BlRaZ2ga6mbuBkc2NsbG8slEmwlA+88NVYtM8PJrZgtWGibJzWcx6HPP7T3Igd
         tpe+1AVC/dbtExEqPrOzahJnVFZonUJ4RH5FHZvRLA4ak9QXX+tdXcg3gsIVrUV8Y6yA
         BkxvSHjfHmpV/dB9/1AfElfGjaNFjOyqtXOC8WOzmJ1DvWjg8qCdU/oEqakOt4yUmayV
         pKGw==
X-Gm-Message-State: AOJu0Yzus7BPwxJb7ekId3zJYG4bjuHkKtxZnJhnYjz2MinM797AxxPf
	+a1hemKotp2FejEBL9QlMNyHu5/puoQ/4ZqGu+dgbGXiH6YmMJKS9Bsp9dLlZA==
X-Gm-Gg: AR+sD135afneGJ6bP+uGMgXRRbMEFCufjqc80p5i/0/IcK1iCanhcG4/uz9plftzv5o
	lg1dZL8uHEuL3nidmi9hDqEJ+LuHCGsuDgrOBMrpq4Er99PjcbpOavlEu/wxhroTi30FqWoKpQy
	OqQUb1bZF3VDUBrII259XO8114ZHEO8dooOFYQCn56hFOZ489r3B27HTtbZMTUUOQG8pNVTDY9k
	O7uiDfYVi+jVluLv+PQ/2Ag5RaVo5KJoT8FdmVMErXicMlG4L1U9CQfCFuU45ACZ9XcK2A2OwjT
	yqjpw7+j/ug+Fd5eqJGqxAeZoZVbgfLzqTjE/lkL+5xt+nOnF32HEhoGRVADCpZoRTbL7eCaVPI
	fJomJjXXPP410QNJhb60/ZAvpC94SDcmerrPBgmjO4J3GHsMseQZfTBOKm+5zQR/4092P7MxhEb
	/FiG5oRcULZYZjjJ8=
X-Received: by 2002:a17:902:e80e:b0:2cc:9179:32e with SMTP id d9443c01a7336-2cf3481bc46mr176539885ad.10.1784590734420;
        Mon, 20 Jul 2026 16:38:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 12/30] swagger-ui: upgrade 5.32.7 -> 5.32.8
Date: Tue, 21 Jul 2026 11:37:53 +1200
Message-ID: <20260720233811.2324493-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128313

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 39399bd1e4cdc3685340e781637632b91a72c66b)

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.7.bb => swagger-ui_5.32.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.7.bb => swagger-ui_5.32.8.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
index 788a8f5638..cd8b56cc01 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "bf6a8f05dcde5904cab31e666e80e456a05782f2"
+SRCREV = "4e0d3f88de7db0395a80ef0541ff428f0926d484"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

