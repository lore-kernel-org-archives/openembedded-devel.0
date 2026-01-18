Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43422CA5FEB
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 00:24:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6803.1768695834252194895
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 16:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YidccX6+;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0bae9aca3so21622475ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 16:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768695833; x=1769300633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+u0MbqYWenc0tXS65ljhXD734UHxu8uHAoQyyz7Dts=;
        b=YidccX6+6OhL9nu60NGFRi3KbplXMZQkZIfswS2Rnx+GgUdRzfcMXdLLoWrc5DMeGR
         yueM8WVUjvfy2LpKvws+qwBwtZRvmV9a/CfYYMlXKbK/L0nekWcy9gg1yaxSHuKFluHo
         d7ZlIVIUoCZ/XqeHmTnHZ12iO2dGiP6r8t8sspuTufXmUAwBWxkOZI0V/5U2zC0DEg3C
         p+sohRSLU9LUR3dIy2xcjYyGEDK6vdsu19cnR1mAyMrCWUNNfKfAgQ52+rwuTUjQ+OcI
         kB3kmsBdC493ihADXYSu1DAzsHTaFzZZ2NDYMs0lO9avfQG4kn+DWexUaXh9M8F6glWH
         towA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768695833; x=1769300633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+u0MbqYWenc0tXS65ljhXD734UHxu8uHAoQyyz7Dts=;
        b=Mf6ViTmWFGCwj7r2uSpr4A8qvJls9KcrJGkNdjoE9/qyDg4CESJ77d3tNeePF6TS8k
         x70oE3jVquqA6E7l0/FwkZYbW/WonqRpsPYw02kmrO9K31eyBa7kHULkMWvItV8McFPe
         HeHGrA4/TCEtD/qWUlDgTbSOuAfUCd8ye2BPJP/N5huCydfM8yHPQPZf8WJ1ZDFMwEHN
         rlLgEzlXvoJ8aI4GZB4yRqHL1lKuuhfU5EV5PdrYeBjTMmPzUfTisiZPvEHAqjY4gWga
         C/ssFVv4NTiXayfNlxgNo4xFTMFbFg0750m+RmQ3clgxhr8uM7JoFvjgsQDrkif72rWj
         y86w==
X-Gm-Message-State: AOJu0YwL3oqqcs4fYN7z8N+QowEZxmm8sjn8EW32yWrxGMQ9mhfEnJWe
	5aKJI0zLgVsxFyA52Z+9SXA4ZS6FHrEa2Enz3jFFWPJaD6uvUyK9JIB+jnNOXn7H
X-Gm-Gg: AY/fxX7mCPbi6pMHf/YNCjnRb4DJJr7Cc3htTy996aaa4uEtCWrt9Sqdhgi5SxhNY3J
	r5ywwje4MZK0uPaSjKFaKJP8sFv5ealrf8QVbRX7gQ/pUI0gtz+leGpvYiZqu3N2vFpe6ojpewP
	RqgpBk0dteZ15iHdb99tu2wRmwlfzeECiYDMvzhfKukVNI2tVS+/yjRdoOMIOrR445pvwubCkS1
	z5jWL4G/C2mBXT25645qsDSMvKuE5bO6B7DR9WwJOR2YRjGJOMi2/hk/r2Ntr8Z7ez/8hp3HNMQ
	coIro9Jm5lsYnYNlRaldmyfghSb1eo1oTvkTY0hWu0WHaQQC+OoWqsXg4CegNKlWyxkzBxeqNba
	RGefF+zWEeLjyOK0ocrJ1RM6qI4ot+hyzblC9kCTJKQ9SyP8IB+JoN0ehTu30OgdgGHOTJYUq/i
	Uxzi/tUKCoxRZhFjdS7YSPHAFgRjn/IB0NtA==
X-Received: by 2002:a17:903:2f05:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a7177d0f94mr67222645ad.49.1768695833396;
        Sat, 17 Jan 2026 16:23:53 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193da7cfsm55781455ad.61.2026.01.17.16.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 16:23:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/2] openfortivpn: upgrade 1.22.0 -> 1.22.1
Date: Sun, 18 Jan 2026 13:23:40 +1300
Message-ID: <20260118002341.960289-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 00:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123563

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
 do not advertise we talk compressed HTTP

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7cd1f5a87175c235c349ace5c3b6082ca82950d1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{openfortivpn_1.22.0.bb => openfortivpn_1.22.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/openfortivpn/{openfortivpn_1.22.0.bb => openfortivpn_1.22.1.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.0.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.1.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.0.bb
rename to meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.1.bb
index 568593b2d4..b69a7e2355 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.0.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d575262a651a6f1a17210ce41bf907d"
 
 SRC_URI = "git://github.com/adrienverge/openfortivpn.git;protocol=https;branch=master"
-SRCREV = "82e4401162fc65efad8267f4cb3287c6ab6fc088"
+SRCREV = "388fa98f639ef91733461de50b06dd57f1ffb099"
 
 DEPENDS = "openssl"
 

