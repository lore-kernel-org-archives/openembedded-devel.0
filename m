Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83051CA601C
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:25 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4469.1791540382505644442
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i/t3Ytjt;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so2385636a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540382; x=1792145182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG15hR5mcbGlWAufTqxFlnyLU6O90y/1iwEQVsPLkZA=;
        b=i/t3YtjtB2QywclyvMNeHRrpaHNdnFp9iE6yhZWRlM1sSMuecqVsWnrqw0rY8DjdK3
         SjRTNKFLmt/FZ/yQIXvC67bj5IBMYBqOf+hESAPyCnmsZr2zIgzisrp6b0ecoMlC7NVk
         hrBzDWf03JkcJJFXzxLQ3y5Qe54uhSAF4NacBzAtcOhg+vs/b7hTvDWhFZUp7/Hchuqm
         ozKxZlBH1nvAfPCO0x3d1VDqBF/E//g9Kg5uBQrUNc1ivRc9OQhz8MG9AEw56EDjFN1j
         lzhPFUfeBOB4eIemJ8diyYF2CtKBH7aurI1iwbwA9w6dsSN7JIl31mDBIGaM7JUIrT9j
         TPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540382; x=1792145182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG15hR5mcbGlWAufTqxFlnyLU6O90y/1iwEQVsPLkZA=;
        b=ZhJE8+6DdKf/pEki00HR7uRSybdlkyDyMwfHLzEiSVJ9Gw1GzGHZ3Cxw8F6YJRlhHT
         /2ArreEpDRGxi41gbygdIrYD6bNccxfUgNE9jvCC7FUMsB5IO0j7V2x7zIntpkFMjeog
         pRyySHHpUm1ZC0lyU3g347gVcAtW7m0mZxXMfI2jqGGlKquAubHFlgbxS2wD2skOHaOQ
         ktIjx2munFL2XU5c8tNcClivZXpmxV0DAiZsQcqS5yeJF+JqQxZFo7fGz0UzFoOTnFxG
         pQ9skS0re91eSCHhRqUUDJdHAUQYkfBHWk8y6tcI6wzaDRv5oeEoMMDAFO5PQRCMtUJb
         Jl3Q==
X-Gm-Message-State: AFq9FYKLsRcbhQIHLKQJ5ARBOQ/04AT4tTPMf21GpQOGGOgKY+ztIiOy
	C/5hG9vPxkeaJ8ziahzk33DRUGuQbp02M+MATwSCxjzoxRRYUg7RnnwRaOm8og==
X-Gm-Gg: AYBFou2eiXQiBUlY2YQijY2b5ODl8i5kkSqIrHk93cUGep2/gdpGSlwhhyTrwdFLsfu
	wZu0vEGlHoHWLvyXB86gHEa63waJaATE+NK/rScrRc8h4pSVRqIviXRze6yWzfJUaz5+mZTbmK8
	3oxfhaNl+MmXSFv+lroLMpDAf/4nXzxi/gt6yRUwQ7xin+msJNKu1Te4/+jYK2oijsfalVDC+wC
	nAsCd16kadHk0gQi8VO72jsG5/4Ntf10fHKrMzn+o63Im23OaibNcUihd5Jtw4y9sTby0XKgGmW
	aDeJtDMl7gm8UV2WDp2t0uuS9VREqTLR/hJWJE3nGaTOscs+OxT4TxdfpVg75E8fPMBdu8i9Tq4
	R53732Qpe8QBqQN1ZpyN4ANqVAYI6QIEzfcbGJ1k7SUC8TBCdoFmk6TZR7L9MVzm2ydiak7yITl
	JK4ZQVNpluXn0BOKZmhggiKnCvZNwzg41gvR0nwMihnF+wq3MCy7mUjqT2I1n4eg4Q+1jjEPBNI
	awWiMyOlPoYSgca/iBJDMzy27RMKaDkWY36Sf6qXM29bSftTZDA
X-Received: by 2002:a17:90b:3145:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-3ab3a33db2bmr1317245a91.2.1791540381855;
        Fri, 09 Oct 2026 03:06:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2723866a91.13.2026.10.09.03.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:06:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 7/8] python3-werkzeug: correct CVE_PRODUCT mapping
Date: Fri,  9 Oct 2026 23:05:42 +1300
Message-ID: <20261009100544.1428938-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
References: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130691

From: Devansh Patel <devanshp@cisco.com>

The current product-only "werkzeug" mapping emits a wildcard-vendor identity instead of the exact identities assigned to the packaged Pallets source.

Use "pallets:werkzeug" for the CNA affected-data identity and "palletsprojects:werkzeug" for the NVD dictionary CPE and configuration identity. This changes the generated product identity, but sbom-cve-check 1.3.3 with the pinned databases leaves the current CVE report unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit fd0b8a36e6bbce468654cb917254cd9c32ef923c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
index 4e1be5cb2f..fae4de2a3f 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
 SRC_URI[sha256sum] = "9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44"
 
-CVE_PRODUCT = "werkzeug"
+CVE_PRODUCT = "pallets:werkzeug palletsprojects:werkzeug"
 
 inherit pypi python_flit_core
 

