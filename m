Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B1ECA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:46 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46624.1790553825338406414
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XQqAhFcb;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so8850045ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553825; x=1791158625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rH2mL8yJMAAUTQcaZCyezeUsbJWL8hWpUrf57xZ0B4=;
        b=XQqAhFcbx173y8g+fcny2sV/TciKaj3p1iL4wyG6hMK56N5pXTWA1nmzwMl7vG840M
         hrmM99EFpsxxZmSCMC1PEvntZqNMFvvC6/R4ZrIQBCtEevwKweWAM0nU55Bbv/kUG/s3
         7mMf0tlaZlLpsWC2v/iUHDpHZVjU7Y5QNgV9WFhS6OtAb3qVhclgxils/UaA1qv9AS20
         Zyfp7iPYUtywbaYQZddoEjPsF/E6nQR7UkrtOv6rArC4o2fKyBjjg65gNx2hAL4bgqzF
         2swbCd9R4z/h782cGvfEQ5Se6N13sXu8eVmQMt8l5HpSmnHU0WPIR8vOLr0SIP/MCpNn
         /oZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553825; x=1791158625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rH2mL8yJMAAUTQcaZCyezeUsbJWL8hWpUrf57xZ0B4=;
        b=oGFKJFxFRWvxucQ81HPC3MuGExFugD0g/qwcvhnCH8h2KE4+z3xAPJIoErPq6agEGA
         9xey64cj7LBiPcpGfncUc59JaOf++hKCR73rzcg7HIUhXQ9we2ZC44euaeRm3q7TsQJq
         XFf+UN7n8jWpmwv3PchFRm7gZniWNqUXYEqLRngEbd9NXyHK78950Iu+mLLa5JMy3DCO
         ihvjaHro1EI+MnL0YTU5wqd9H4TEpBJtPtPuuPNOzLS9aKyxN4GbrTB361db4Qh3DVPK
         dPUfEoT2zRCOxGuj6gAgiW4cAIknkRb4Sf/KswVSODrEAb4s3ZsH9qEJBRHulaLHWy1d
         1KJw==
X-Gm-Message-State: AFq9FYII+qik638brCoZD6Rkio5yhEJ10Suc7OyZGiRFTTA3RhvADXDG
	BQc9rKpx75NjnA2pAzgECLNYIq8BnX88mS0sSpmJBXhfxYzepiaIDwWcDs9s0Q==
X-Gm-Gg: AYBFou1LsMgjEpyo1xQXG87ZOLzcQJULsovCm7CTNPwQTTFiASwSqn5CQ4uUvEG88XN
	mZxF8oleJXJzPPuLtX3WckBIp8va7jsqEjL1g66LZ5ax3Mha3v/rbj4T98dj0KwxLOwohPtCrhj
	SXfL5fFdwr7UHxqzR6eKtjMJ9vU4RV39+lTQFunSiDa3r1xEtnupX8PVTmoVe46/A06QB27ZdMi
	DFFUIECvDlp4ey7O5+w7LVIagBSgfF6RxsL6EgALKyxbUon8vQSDiptBlW3RDko2jupjgMOQgzf
	vVIAYDxHakdGBC92T0jWDOKiIff4xypsZ8fPL7y9KHCxQqhMU3Me5YtxLjUaIg+i5aVbkIZQEhi
	tMBZ3Sk2UNJDNpSlWJ7TR1OQ/df6qcidZjU43NaoQ353HoS05GlyZZmqFtCBwHiWGmIcuKtdwbO
	rStKpeseED5xlR2AhgdQuosiCyOKUXCNruaY0vfYwH91s0EsXtZfymisSXNZxVNBoeSk8jhhFX1
	jwZywdIOCP58k4/VzscdQs=
X-Received: by 2002:a17:903:2b0c:b0:2dd:ad73:c988 with SMTP id d9443c01a7336-2df7dc4be2cmr88968905ad.32.1790553824696;
        Sun, 27 Sep 2026 17:03:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 17/30] python3-greenlet: upgrade 3.5.5 -> 3.5.6
Date: Mon, 28 Sep 2026 13:02:49 +1300
Message-ID: <20260928000302.2528437-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130404

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://greenlet.readthedocs.io/en/latest/changes.html#id1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-greenlet_3.5.5.bb => python3-greenlet_3.5.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.5.5.bb => python3-greenlet_3.5.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.5.5.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.5.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.5.5.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.5.6.bb
index e246b7f253..83b9306480 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.5.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT AND PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "adb4bae02e91a8e863e48b177e4014bdcac8a6b5e047ea1df687a61534b85e6c"
+SRC_URI[sha256sum] = "8e67c43bdfc88d5fee6db0d3e40175b362fc95fb85f0412d233b9b203c53a575"
 
 inherit pypi python_setuptools_build_meta
 

