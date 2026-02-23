Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19DBEC1128
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:03 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2744.1771874340455852440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Snwa+uCf;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3576306f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874339; x=1772479139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dkd0jCmjeUvkEdzlu9HGX2itL4Yu84AW4bYTRGD5zd0=;
        b=Snwa+uCfevFnFxJb4vppvvfR8p26Y/o2Cp6dO7noWDmPTy+xD34ebgfLIW+R2rdemm
         46Mx6E9MvuffMMjVWEtN9oLMp2R5OP5UCU2spb/WqjwJwhQkkdQ3fZqup/6MsyVnLwBb
         9JZ+Fnb+L37XsAiMTpJUqF2tQ5P1ZzVVKgsC7lb0omXIfg5I48rrB0Rdt/7SJMIkVtsL
         QvLgW9dsjSmqp4plhCWnpZsAW+1WiWBvsTdIQ1jM3uPwniZK06HIXdqhcD4WZgwtvp0A
         QrX1Gl6r91mSc9uigTU+WRxocqQmcVHIHpUpIZmpRBY8LxO2hnNIBFk1vAPI4GU6t0T5
         PmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874339; x=1772479139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dkd0jCmjeUvkEdzlu9HGX2itL4Yu84AW4bYTRGD5zd0=;
        b=ODWfvlWTqYWDFb3/XD7HkE6498/so9FkVtPpyBQfSUDqVfe/VIR+1psJm8qPKlBGTN
         JkNG6MhW3K24t5thR5ajZNjhv7/JKYajLSax/5XTT6s4So89dL3G1k7fCy/XU3BE247Q
         B0VSe31rETnjztaAU/43S8mqUwaYrsglVMO2GHCDx1ow5lpB62MbLyFDP/GAHf/Vou90
         7iYk+s7W3iDMKgG0tm/ONGggiP5fZQlP7MPbhMiUTdKW2jpzNQqaqwl2Jis1Ssudv2w8
         SkuPV0Xxpyq7Ms3V2DB5iX5A4344wBJwflkXNjnwfB8Jj3T96Fs+KvlNeRUjKWFHulh1
         4UVg==
X-Gm-Message-State: AOJu0YwU4wvcveUOEqUxUdonAmeHoowxs+ySs0evMUqIm//H5vHxBrw4
	ZAk2o+FyhzC5H0VMJkkhnzdnd7L+7kB5umFMDpqYqnMdXCIfI244mEzA0tm5Hw==
X-Gm-Gg: ATEYQzx+6Euj8/K6iDv3wgGUdYZN5VDDQ0cTec4qi+sBDLY5nPsb7+RZNWRinH1wVU0
	1Qc5fQBRtEnsgffZSgGxMLzdYEWy20p7fhGSa9tJtJyvB/6Wa3efNEYFUr+pGDMZ7vfh2tGdHFR
	hGHlm7P1VFB9+RnmoRaAC51lTsmW+yMHVETiNhQwDjVwOCRAcADBxG+D+5J+lOvjTy8Y9t81ngf
	imOnig6J4KdCh6uq1oZ6YoMGu3xaxQ+lmGf5w8FPkN+LI41gLGFKbgvNegXRcBSFdAtkDfV3tsY
	ExWfu98IdY47ter0BnVGWT8f5acYontaovTmBCVVevVOyZu5qxPeopJiJRI5pN+V9U0OitmYsPZ
	5PjCIgn895Y+RqR0HbYpucrjNrDUc5MhLVdsJIn+/w33V1CwZOp3/RI/MqmRCuPgF4IW/76upz2
	PpSl1vE9Rz4nDfoxzEMyfw
X-Received: by 2002:a05:6000:1884:b0:435:e436:7fb with SMTP id ffacd0b85a97d-4396f19fe06mr16752931f8f.50.1771874338677;
        Mon, 23 Feb 2026 11:18:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 11/13] python3-pillow: upgrade 12.1.0 -> 12.1.1
Date: Mon, 23 Feb 2026 20:18:48 +0100
Message-ID: <20260223191850.1049304-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124565

Contains fix for CVE-2026-25990

Ptests passed successfully:

Testsuite summary
TOTAL: 5024
PASS: 4587
SKIP: 434
XFAIL: 3
FAIL: 0
XPASS: 0
ERROR: 0

Changelog:
Patch libavif for svt-av1 4.0 compatibility
Fix OOB Write with invalid tile extents

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-pillow_12.1.0.bb => python3-pillow_12.1.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_12.1.0.bb => python3-pillow_12.1.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.1.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pillow_12.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_12.1.1.bb
index 83231cad06..2b3660fc56 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.1.1.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT-CMU"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=12.1.x;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "46f45f674d47b5d8bc54230dda8fe9e214598b87"
+SRCREV = "5158d98c807e719c5938aa3886913ef0ea6814e9"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 

