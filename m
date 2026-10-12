Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C40CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:12:15 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5129.1791839527461021730
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kF4b7Ye4;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso634519a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839527; x=1792444327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5YXX8VcQjTiFYyiuHEhZ1QY7AT7nv4TSI6DgXgeaSc=;
        b=kF4b7Ye4eO0VMb2xtIGER5q87ukfgsvvYZ6yzb71WwIfEjBeQc5h+H4VeBWMhYArvV
         7lfJI5Vx4KWbIrxhQ07Av1nGJojMaChb6cTrcLXiavNPkBISxT0rQN0vHV5Wpbmr/bLh
         /vTTDLfAv0Pxrz+0svc4gwrAK8F8WqHBTAvCOsJh//fcbv/LZX21Q6b6aIszID4Y6CqD
         oUHj5UvL/FkBrU2HftZxCbM/J1+EnwNb6mYBVvgL4x4tddR7MRmBqRHCu9RD6UTH+fAF
         IXcempEDRcrXd2TObB6px+QywR3jQITVwu8cQqDEQWlvZkAz6ibUqmkbC5bhJfDNk9L/
         Ks7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839527; x=1792444327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5YXX8VcQjTiFYyiuHEhZ1QY7AT7nv4TSI6DgXgeaSc=;
        b=kGZbzTWg1fNgjFUXbjgyeWomDUFU8iYLzmcMisJtQmjX00S8cQrBoFnuEaByaYXICv
         mxm+4JKU022Sms/Uwv6Zs9T6ByaJNVSUxIgGxINkPMX1S7el8TIAuxyBvnVlGnTduRZR
         mbDO62gHl91R/2+CCBhRQbWy7/AwiV1aAZv+DveFMY0JY2SPwpX5RzGGbXaMg1xge63e
         9Q3SysnELLtixCWmMyPyyq76tyCvsTa2orn3vV/g50PO8LYJI/LAMZWj1VqJrTVJvPBN
         V6KkCds0RjCPi7TTGR7cfsE1crybJaraaNPGFzI52ACED4NkwWyTWtATH/7ULUWDoWFQ
         QsVg==
X-Gm-Message-State: AFq9FYK3tcetYsVHc1uom+Xs6pP1Snr6yJF4msZdQyJ75volVJV2ydSu
	TPUGcWIci+erQNeuTTWlxz+A36XBiDnAwIFXh9S1tXeNH+neAlRTBhmQsuhuUgpB
X-Gm-Gg: AYBFou3OpEvRfVbrxF1xxqolPObjRXSvjswbzpn/LN9Jhaf7ajNFUqf1CpWn80GQT/S
	naY+6/07GNhoIwnG1Sb07Z8CrkK5fkoCFZZwHPgL7X9PX0yhIR92opcWN8BetzIoxdntbxhHGuS
	j+78vV5RMrYPXz/lEuoN7DRb6RuAqiVjGtiKiE7OoRb2x53k8YiQ7XNzzLtwmnFvianM0EHdkzJ
	tOlTisbye9mHSvnhqbJxwK3aF4r8sAFZXShYRmh1jWC+f1I33Hv5Re222dQJv30uJSJXD+s+YwI
	RD+T8JNfZifnGKYJOT7clU+IKi3Eq2gqV5mzGdBxxBOziZ6Cs/Hn/294OQHUu7g0zH5vigXrOyt
	nswpAPbQ4Wgw2bI+ciOwWHMbvfHKERRBJGoZJ1eo/aCKIxpp2WZHUtzULVW9X2C7RS1lDCyPuTw
	ew2KBJRTdq9x5l/9FKk+5ZpUEQHlz/602v4uz4L3qwfuXS58QtV9iFDaDDiSLKxm5wNGWtJjB7M
	Ep8KC0IrdMFvumEq8yU89KF1y8JlLjK2VdsEwk=
X-Received: by 2002:a17:90a:d2c7:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3ab3a9f0cc3mr8665274a91.67.1791839526828;
        Mon, 12 Oct 2026 14:12:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:12:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-webserver][blacksail][PATCH 43/43] swagger-ui: upgrade 5.33.0 -> 5.33.1
Date: Tue, 13 Oct 2026 10:10:07 +1300
Message-ID: <20261012211009.3352822-43-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130813

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 50c590bebc5269b1aadce1d907466c0fee131619)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.0.bb => swagger-ui_5.33.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.0.bb => swagger-ui_5.33.1.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
index 45a3bb6d17c..db2bb498a81 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "cfd4a6c3cbaeeb7c13a8bada7c754de42d78cd5b"
+SRCREV = "cac3d136b5e37bfbe3288c8591f6f4fcf9870599"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

