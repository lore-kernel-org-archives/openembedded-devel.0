Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2937BC43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69143.1782634337340548427
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QsvBhc+i;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3619398eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634337; x=1783239137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umMrlMIh6CPBZidgvTOI6u8bTt1HuRqAO0j4AWlQL7Y=;
        b=QsvBhc+iQr+jEYEkphK86yCjSh1Hsyf8PlPihNfnhPhi0j9JgcBK8S18HCWtjS6dx3
         YRTB/TtPLy8ZJXRxdc6kJqNzINAdCBvFPuIryao3bgc3R8/6l7zBYym5g0ZV9XG3T836
         dMuy+XKOwljyeddwSy84udmNlJHT5+ibqnuH/iPtU6JuX5miu+h27MDAYJDtSjAqBEw5
         Fl9++ajQhNsOqBhn8CyJMQ/bRrOgRXFybulxj2uJf0nsgo691SLyqGX9qMR9JukiVsf2
         C/mmsmHtQi/umSoeLwYlzGKLo12w2mzm48luMVV/bhuZlg9jQL15oowCbfVz70Ll6ydZ
         5wIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634337; x=1783239137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=umMrlMIh6CPBZidgvTOI6u8bTt1HuRqAO0j4AWlQL7Y=;
        b=inMtFa0db5wMSmurBnSTT0m7RtSvgf3OEt1tDVcXQF+6bx/r6q6bEfi5Snwk4sF29+
         iIsa3wNZxneErWrYwJtVShr7tlYdCykavrWdhPHYa/H08QapUyR910rnKAxLJFQ9pyg7
         At87a+BKO0c+skGemmYbvqaUJekwlm1AMGJKRiZATUtN518Vwf2N0kc5vENKd9HGOA4B
         6W03YBtN6c2v7VUvJCm3wLNwh6UoaohS0My8DNzPujOqn7vaQQVEILg+melyRU/1wpnl
         bRfo5s3FxT9ruTDH33flcGTb1kO3J+Tx/uSMaiFxxWSlb6vvOWgaxkAIg16o2XzJPQIL
         myjg==
X-Gm-Message-State: AOJu0Yzw6RqlmzClZcnvTgqtUj/z4ZoZuF4x49bccYl3VWruKA69mowU
	I0kDCgFi2keOMs0D476yhS41kcyTa3K+8x0ZyLx7YQHEgSlAdU/qylYRqLsVpOXHnjbBfA==
X-Gm-Gg: AfdE7ckN6oAh0zJb3XWYW9Gdjm7fbpddWPa8cfPMYudUrx9phG6gbFpM2FWzR2I2/tA
	LINvl5xWtcSGx2O91ab4Xstj048RMbnuiBcrrh9yn9vv8Iy4CiVrHO9Jk7LNYfLsweeayny+lEs
	YruxmnfmzWKzHnzNL/D3U3NX83vyZDqOboJoyQyyxz67O+bQ7Kclo7jesCcv0qtMCuv1m6DAaRE
	Izxrke7Yh1Zoy+TnrtBblN7G/xbhHJ0SZsW+mPxJlaJR5jEUxNvrxkUp1aXBFdQceh+h6ikhZoD
	mdCyCageLbny8RqoaqdUFjxH0KiM+Z5TX/YesYFO8mXXQ4XLawD3tl1nG4vWSEq8GV8BjSqOY7r
	JIrL2+kBnqMwAmzw7vg1KgDEZhtMKY6PzIFU4BTEVV1zKLSyaGitWYSp/xdLvMbPUHFvdIkFE/+
	ITd8zhDgvNVlcPkpJz9dQ/RHR/zuKVfZjs6dyPhDKFK9zmd6KcB6FM2038qWgBOB2oLsX5i/83A
	PaaZC0d9B6RFnLdbag7ENeztFDDRNL2icN1bzt4ZvRSUeGDUTpsDmDXejCKlEg8TzlVREr12tSN
	3jTBniLGUoxKfYgpQHjwSx0SY7Tssg==
X-Received: by 2002:a05:7300:c001:10b0:30c:9f31:b5ff with SMTP id 5a478bee46e88-30c9f31c193mr5008456eec.8.1782634336631;
        Sun, 28 Jun 2026 01:12:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 056/128] dash: upgrade 0.5.13.3 -> 0.5.13.4
Date: Sun, 28 Jun 2026 01:10:07 -0700
Message-ID: <20260628081122.178348-56-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127866

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-shells/dash/{dash_0.5.13.3.bb => dash_0.5.13.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.13.3.bb => dash_0.5.13.4.bb} (90%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.13.3.bb b/meta-oe/recipes-shells/dash/dash_0.5.13.4.bb
similarity index 90%
rename from meta-oe/recipes-shells/dash/dash_0.5.13.3.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.13.4.bb
index 48533e908a..d7db0abed1 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.13.3.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.13.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "a83727c1299ac4c3d9d43979393b3a4eb00275d5636ae02526e7979d51d6fbd1"
+SRC_URI[sha256sum] = "d10dfd41cda59165560db39ca915c2c4a7636fff04281d8d2df77ad92c753e2b"
 
 CVE_PRODUCT = "dash:dash"
 

