Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE7AF53D95
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 20:20:33 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60592.1773692423381579674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 13:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iyu7JOHS;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b05fd1d147so4399035ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 13:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773692422; x=1774297222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HSRJ9S+t1A0dl79pDzZlwRf/N8gisdLzWRtFTqBeFdA=;
        b=iyu7JOHSl1qbtaARfxmzRLrtvw9xgIr7EUUhxmb501k8fB+feewgl9QgPDuWkqxPNJ
         2/1qIow7lrR0ex38XR/w1/ldheS5kcSPAEPj2DbbTog6ZwTRTEtceHTh4EGV+Xd1L6GF
         DEM0UbPcEQNWtAbKIlujR43ZaIGlVKTEjOKK4+PS6SGlVvq/kCbVpY0pA41g0sPp6aYB
         Ri4Z4wS/WxwYeTCJX4CV0WLpf30hE6LN50sdeeaZD3Hc6Fr63JXks9QRB0NeRTRp4I5K
         2T8g4esScKDrZyzAaZFRx/G/FKKrgzpCF0kxDaCRF2K0q5V0YhMKpo+CiMmQ7ilMPH4K
         ppxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692423; x=1774297223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSRJ9S+t1A0dl79pDzZlwRf/N8gisdLzWRtFTqBeFdA=;
        b=asiD0Hbsu6RZWBSjhRDstXj1fZYLFTE3cFNfJhYHQooCbdf5ARaDJ0HS3s22yjFQ/M
         LLe64FEXgZfqb4viGrRIdQOnL/iuECou8Q6Iw3Y+wJ+K50Bb2l/sor7AKVd03vl7w0kc
         7Eu39QRLBlr/rkvfEU51glq8P5/z7UX5GC2c8KIgyJIFxWKDQDUwLX5yqc0YvF0YwMM8
         I03ZXA+plWJWeIRCJk+O9eWUynHj45R8AqRIsOJfqQLRgbyEjtl1+uw2B9qBj/91gLRc
         KQpqnWh0mwiIa2irhQTKigmAe+prrMFDU3tprL6pkpasia6Ez/EnAnejVO6pZ/eGOxFg
         eSOQ==
X-Gm-Message-State: AOJu0YxmHQWTMn3wj4nv84R0Kt0Ioj78dFqnDLXthGZ8RJeJ4yHX3wmp
	tfI9BCgNuLgVp7hDS16DxNpvsWYSHStsDAVtO3vwGNKjpj+VInEOiPWvmuGB0xT4
X-Gm-Gg: ATEYQzzrRy7yKF0AP++0XewpO8ei8jJ9G7sqffPlaMfjVeNwOe1Skgi6/IZJNeHuYFa
	dO5ipUrLAweUFGn5G3H2ckSAWgOqOmeJrUpEhP0X2Qo0kPJ/QZjvwimJCzFwxmxLMNd0Womdwxg
	kp9wuvSfVnoMCnCAG1mTC+lO9ti69spfMDkF/DAT+pn55Vc/+5t5fGUcijWare9VlpibxS6dVAh
	1LxogUPPGr/aqV/PZNzcGD0tvWouDqaZHQ1Gyx7CB8B0XrZdby65EhymzeCxcTQMlIacauvic9t
	qnj8nTuS7J3GrSF9AQ3+ixYfNa2p1EnpQAgMUNiTm1MSZgsv8jmGTzrnRMuuPsyudSi7oGr3YsU
	uFbutqe/st6+DSaYkD8/8TGzFX04kSEDJjjjXVGj4ZdMHr7bUZpOn8XO0nOss/616D9GUB/DsAs
	vwYPF0e9CcE5VQMt9NO5NJKxvf+3qgm73ov7w=
X-Received: by 2002:a17:902:ccd1:b0:2b0:4158:c9d1 with SMTP id d9443c01a7336-2b04158cde0mr98570215ad.36.1773692422579;
        Mon, 16 Mar 2026 13:20:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8093casm117570315ad.61.2026.03.16.13.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 13:20:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH] python3-tornado: upgrade 6.5.4 -> 6.5.5
Date: Tue, 17 Mar 2026 09:20:11 +1300
Message-ID: <20260316202011.640176-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 20:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125289

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Security fixes including CVE-2026-31958

https://www.tornadoweb.org/en/stable/releases/v6.5.5.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tornado_6.5.4.bb => python3-tornado_6.5.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.4.bb => python3-tornado_6.5.5.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
index 661ec039ce..fb9067c90e 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "a22fa9047405d03260b483980635f0b041989d8bcc9a313f8fe18b411d84b1d7"
+SRC_URI[sha256sum] = "192b8f3ea91bd7f1f50c06955416ed76c6b72f96779b962f07f911b91e8d30e9"
 
 inherit pypi python_setuptools_build_meta
 

