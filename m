Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568DCC10DC1
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 17:11:33 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.75313.1701709888516017485
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 09:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ktMBK/H2;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ce47909313so767455b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701709888; x=1702314688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suheRwrxFMZHhmjIydQ3KAwHW1+6wD7LCizKoeJ2/+o=;
        b=ktMBK/H2KVVBiMqFj+IAsaOGaHP3cmKg8yaGDmcwmE7FpL7/tMtWBqnjU2kovhiUc/
         rDbKBHPe/Z2OQsb1Pm2927R+P0CxGauvl/pReUSC2dVzusBUwCGwfHJdX9ifzPlK5CQv
         sbOzs5v6O5erPJHt1QOm4kB6PohUD3b+zHdw4j53qrseWBrkOQTkD2SgIejqR3GcmP3x
         DeDrQSOY8+O64N3uiBfqo+BNNzNRlFoUOrIL20odSo5rDreXlXp6PaiybJMRCkTlFqcF
         TaF8S5mHFH0/HXXqWjrWyCA4IEmmpnNCz3SFRyQq5Itv6oMyGH4m0TX0crjeIm20WREw
         ckMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701709888; x=1702314688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suheRwrxFMZHhmjIydQ3KAwHW1+6wD7LCizKoeJ2/+o=;
        b=nKM1mLNHOcYjlFp+R8gScPo8aO2tn1yP8Iff4YSEWDjgCWpmkHPVkYXC7bs/Tgc1pk
         mtqLkydCme9J7Ot9JeDotG7jzp/EZMpZom8MGockbgkObW2vBuh2NbHjt9qK+6V7T4dg
         SCqaTZHrFrG/ix7GZAoEObK5szpX9UHUIyNqBlk/azw/+cVOxDfWwQXlrH+ZovR8XPEi
         uBKZpae1x74dMOmcIFdGhs7ySwCybVIVVtQD+pQKw83qUIZ1j9lfdL/Pxsox1SUFnAr8
         MLZooIc6LpzVm9ofxw45t8rCbH2+05OGBC9n58qRv/JPSZEmfaTFObEH+AtmaoCjcEUe
         qb5g==
X-Gm-Message-State: AOJu0Yxa9icjWvnltuLgXMUzgp6G4xccJjHR6o+s1hJophI1jWBCv3Ym
	PwFdybPYyjCUWESbNlI5uauabFHuOIA=
X-Google-Smtp-Source: AGHT+IHr3FMXuUz5vHPBDrJQHh1Caj2H/+2F8hwGVh/gnQcj9BY3WuxC2vq9r+fhbKE75pY23tvK4g==
X-Received: by 2002:a05:6a20:bf2a:b0:18f:97c:5baf with SMTP id gc42-20020a056a20bf2a00b0018f097c5bafmr1467483pzb.125.1701709887452;
        Mon, 04 Dec 2023 09:11:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id v10-20020a62c30a000000b006ce37b738f9sm4402112pfg.140.2023.12.04.09.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 09:11:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] basu: Update the SRCREV to get lld fix
Date: Mon,  4 Dec 2023 09:11:24 -0800
Message-ID: <20231204171124.1922024-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 17:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107210

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/basu/basu_0.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/basu/basu_0.2.1.bb b/meta-oe/recipes-core/basu/basu_0.2.1.bb
index 56c25f5f1b..1b4d5a0fe5 100644
--- a/meta-oe/recipes-core/basu/basu_0.2.1.bb
+++ b/meta-oe/recipes-core/basu/basu_0.2.1.bb
@@ -10,7 +10,7 @@ DEPENDS += "gperf-native"
 
 S = "${WORKDIR}/git"
 PV = "0.2.1+git"
-SRCREV = "684a41d68cfbb05e38aacb60a8548e21ddfbecdb"
+SRCREV = "a08cf5a575325435040d35710dbac3d0c32b1676"
 
 inherit meson pkgconfig
 
-- 
2.43.0


