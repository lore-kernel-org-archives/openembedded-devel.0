Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5656DCA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:07:00 +0000 (UTC)
Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7534.1790849211835555454
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DQtfkBk+;
 spf=pass (domain: gmail.com, ip: 74.125.227.166, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2e688de2eso13283465ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849211; x=1791454011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+nyGRjKhogOv9qozOVwvPGh7WGslGmrZ/dfDpMG9qE=;
        b=DQtfkBk+7UHqOjtbfQ48gbjJ15g5EzVlTE+XQZjwYN2hdFChzEGCykRcWJHhggaB7n
         xgtS076du6+1ACR32X5zOmc6tiI80jnAmO+GVUeHvEW0p0WyX986bC0Hz4xpApY3L9WW
         qw8yb9vVoK75LIPOLVQAbS/qeRMED2c5jFD2g9+ros1z4eBu2IDQi1M4pxLpVYtBHJRi
         i/JCASFrIdy3qpdTDW18ZJnK2qX8jh6N44/yIm502DdO4ih+f+q0z5IrNzFhck+tj8RJ
         N5kevfm1V1INEFSnSFdeG9MQMnzCHuy5ezZgQ+ARwquR1kMxor8Xve3DkfaL5Qyp3jmT
         r3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849211; x=1791454011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+nyGRjKhogOv9qozOVwvPGh7WGslGmrZ/dfDpMG9qE=;
        b=e2tT7R0oxiDXuElHWWOI5BMcXzYvwoqBUpux3+HaTB28sl3qqAfimp1c1O9vMEpq1X
         gc9/g1pPMWReWUlx2Tofxmt0MPv+nyng2B+JQlX8sMlliMsm7i77bpB8/T4+DuvVZ/d0
         cplq321TovKdcizOx9BYqvoPFmnLUmJug2d4CNYZMCc1jDaBh6qhxyvd6p7t3xX3ViKx
         j3tSq21Lf7nCgsDNjsOGusj3E07Sq1Zi+Jd0CQ+/AOzzJpth5GYoLMb1YxK7mvPJavqa
         Ju0dyJu44Lar+VLZBexwULCMu0U9Qy4yap5EoDwbfdlNl3vAl0rt61t2ZzaWbgPyyj5r
         trLg==
X-Gm-Message-State: AFq9FYJo8v/gaPgv+DEfoX/7LepHvR2vYOF8Z2HP8KTmBtkZjBXHZBIX
	ZT4PMd3PM73cWtgCqqSpD31o0j+iCMjYTculkcejjicojyJvzf0DF/BHLDVZug==
X-Gm-Gg: AYBFou1ObzlBcD/FLoRGb43/2q9QRITWC2smN/03vGFR/Qb1AqnF6DYnMFTxZ9xGLB7
	2zZ7s+j/UwsWQHhxjNkvlbfrytgw0qdso+JsUrIWjoDCpG46AnlNFNLkElnksS57PifjefGMwqe
	w7BV7866Ij8dNbK2+XzrqMPpyIcghNYLCePtg062HCHNrrfsJaOcCChF0tKd4ca4R24gCVBY++J
	M1VR6lAtbhJTQb+FC1RBIMWsFgy1oFy5EV9GsienBRUA901+zukIDy/lol35rLjpOeBrMusCA2a
	BtmzAt5X7J97IhzIZ9Azh0tWQUKZIJDC8cO3M05JqwhB620HjQEQr3Mxta/5BdmYB2uPLd9WAUv
	sxft0Icfx8jb3dg6HMwSfC5In5lHG7CaTeaTzsrLYieYbFB3bajGDM78mJF3kBaoqx6MnZa9vh/
	ijW/ylg4Zni7OgKo5KXv7bdZos1pUL3VmXjTLMkLBBYJT4Yt3FIeb1BQCWusx+1oLXNB9xjCr9i
	lxnB8rofq3KjeVXInBeAkc=
X-Received: by 2002:a17:903:b8e:b0:2dd:c054:197b with SMTP id d9443c01a7336-2e2e4b3b695mr33734765ad.32.1790849211232;
        Thu, 01 Oct 2026 03:06:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:06:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/11] pegtl: upgrade 4.0.1 -> 4.0.2
Date: Thu,  1 Oct 2026 23:06:28 +1300
Message-ID: <20261001100634.1992725-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130571

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/taocpp/PEGTL/releases/tag/4.0.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-extended/pegtl/{pegtl_4.0.1.bb => pegtl_4.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_4.0.1.bb => pegtl_4.0.2.bb} (93%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb b/meta-oe/recipes-extended/pegtl/pegtl_4.0.2.bb
similarity index 93%
rename from meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_4.0.2.bb
index 2ffa570c9f..dd8e146993 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_4.0.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=4.x \
            file://run-ptest \
            "
 
-SRCREV = "9ec6da187f840d8e804d42b9b7867f79d5d6adc2"
+SRCREV = "b60f6110abd37e502d202d13a6c565410c552c33"
 
 inherit cmake ptest
 

