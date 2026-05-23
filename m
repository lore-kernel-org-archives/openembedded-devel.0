Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420EECD4F54
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3075.1779512462916151969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZO0C7QU9;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8354461da74so3660952b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512462; x=1780117262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1h8AztqHp0OXXrO1FPTmeK9f/5h9Esnkz9ihLcdsEc=;
        b=ZO0C7QU9B+KxSqls03v77KB06U21jOrJkfTiFOLV85rwW0ymW3XVYLJRNFijL83XCM
         wTNpl/o3QMnuPsAF90em6eWjZykpicv2E4D6yT0wtiIAP8PecNKvxy6stAiZPYCBbpqI
         cwWzTxsbAYTVwNrktp0JT5twDe7Sd0prC3jo6a/MUTL6YIdXd9tRcAWNfBwfmIuP7ujw
         KZJaYNjz+Cj3mVonTj9HNBc6Tc6Fo465wJGtgeaFJ1WiNGiRGRBwLmWxr3Fb0eANFWEV
         GCzE1hMoXTlYruOYZoVgBi3NeXgg2AavW1B42whT7Xy5H/m6FMu2tho/lvRAOYRfBW4m
         D0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512462; x=1780117262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1h8AztqHp0OXXrO1FPTmeK9f/5h9Esnkz9ihLcdsEc=;
        b=NzsG+RXF79K/VLEG1DfV2GyS1PDWzqiqEteNaPHBDk6LMO3AEoV7qwC8j7EHohql6Q
         Ip8zzNrCzDigwHaHcDWzeIuxTquAYDMKspJtosqVCLXb8INlVJRHnmjRxpk7aDJUdbTy
         CBJ4m2bHXSquy+DX7JEUl1DzlSFpQ2SdaYjGLbp1IVUHdWFt4qQJ90rPLVhm6Rox+xIk
         6URWodsgNAb3cLfvxPavsD+96hl2kOaPOQgrWLTcsSH4XaIb4qQtB7agEgu94VT+FEoW
         dRLEYDZ0ChOK3YljFaekl3eEx5ri5Hy0Bxdhj6fe7HzUx6adMC07Fkf7uriEUiXsUkQq
         FbYQ==
X-Gm-Message-State: AOJu0YwyxBoRlUCRgHVchEmqcV+b05vjymrcfVJhFBOgA7YC9l6Eg9HJ
	clO1oXcN7k9t4wrVG7CoPk34cakku5fw7uRsrn9WBXTU5MeY69D/K7AxSpKvBFAZ
X-Gm-Gg: Acq92OE+fgB83OADba/Kxo0yctm0DcaLwZAKsvVo1jRCRkbHkNPwQyIvC/9dhA0JuVN
	Z/V8XoD7ZFZNVT2GyrVX6mrFPF83sAw7YVLRry9df/nj4jHf2y7no7QXEUTq7zqFOCTajDiqVD3
	hOWzz+07t2tQ0TsTeuHti0KZY8TNGiaQQACf8U3WNU+TxR6BBgCfgwIsQEjy/Y27RirHzU1ye+o
	0HtXAJL6ol5CjTCVtfWBG19hv7I6Ae8HtS2nwDH4JDComyS3hAMmmF3tilgljyUeQtSmFrBeN5i
	ILJgVs/QZUKTwdSi+QDqIIFsLng0ImXNPWRZAc01f3Fb7PpW/eohk6uM1FREN/vM9M1Jj1efcnO
	687QURRLK7FrbQ25IQh7874i53ExHl+QZPdHiEm0udsgmFaBOzApHELdVXPARgkzeyvwdI9xB5v
	Ldd/EY2fbRXpONNFdP/2PMwAfdHAOCz4eBAQ0AAj1I3HaCLT4=
X-Received: by 2002:a05:6a00:4213:b0:83a:35b2:2bf with SMTP id d2e1a72fcca58-8415f612e54mr6105046b3a.41.1779512462260;
        Fri, 22 May 2026 22:01:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 9/25] swagger-ui: upgrade 5.32.2 -> 5.32.5
Date: Sat, 23 May 2026 17:00:11 +1200
Message-ID: <20260523050028.848327-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127159

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 137e8d240eb8a8116563cef051194955dbdeb497)

Bugfixes and performance improvements:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.3
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.4
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.2.bb => swagger-ui_5.32.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.2.bb => swagger-ui_5.32.5.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.2.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
index 7684b1dccc..d494f0ffd6 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "d02a2df106961d8cb6bceb6b4b3aa8d9f6faaf4a"
+SRCREV = "dcb493cdbf58fa885047513bd176a644f92c4955"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

